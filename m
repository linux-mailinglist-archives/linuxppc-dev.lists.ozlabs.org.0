Return-Path: <linuxppc-dev+bounces-16349-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CJoIq64eWl8ygEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16349-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 08:20:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5109DB37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 08:20:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1DDl6YVtz3bkL;
	Wed, 28 Jan 2026 18:19:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769584791;
	cv=pass; b=VxH4al6peNg7cqu6BjA+QVbOlUMpjIq7xq8br1iWi5TV+vLcXLMFTa7w+9r8bBH+q+wbsCUUA9Qnwo3E7lBmgkHWuh1oKaBzd1uDhDBiR/OSeQ6hxTRsd/rleh+mjyY+A7x3/FPX2KzCVtO6rF/AY+3EpCO3qlbiPR0TGCFCaXhMKWOBhsjnPiGFCG5hN9yJOLeNcm/gdOcS7w9pF6H8OgfRQQVgxBsj84XBdKMpGWkXHV8KXnK4LdUG5A5LEmj2Vru92adJPk75TNQJIp9P2/hkP6Vbzz55n3oQdGjeo3kZtLnZ5/Co5vwZHNns3m+OSbLN1ajdAdK3DCHhR0lQlw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769584791; c=relaxed/relaxed;
	bh=WDf0wPvajLkeVjV0Cc8BaoU7/JqiNeY72YCZRxwiqms=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Br3tOgFjp8jQsK12+T4AD/FqRHgvctEDbcYfZWwoo/NDJciFrAjVDqXJkc9NMCdOeoULtoD9iV3s3FrqFYHBtZvFBZLp12xx2mG5sJycOnVQdb/pgCcFc629nya9pkfWJgm5JMNGz6wirEHEp9OdNxGnxWbENidnqJl8Smktg/TYZYAEpZage8idCI9dBCJ1nxiZaAMBc/p1l3a2jJJLimb7JgVQ69QQHWxYVgcyinpNXV0Ef5Fs5YfrdkEqBs6aMJY5kPbGOIwOcUwVGABbDzeqVXg/yZ7hAcTU79hUwW1VjbFsa5HSPZPEKSzU78wk2FUiRUwmlLg195J6omNQLA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=TNqJtFBs; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=TNqJtFBs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1DDl1GzTz2ydj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 18:19:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JoaXGm/IlH7rSfGL08ta5xtPf/GpiFxdDmSKDoQWI7t8oNe1VjDaiMcLlYPSCMm0q5SFvSssewUP7n+N6lEsG4UQ2ifBLBEnV1RzJlLhNTN+2cLf4rz6gygYKYnjCPfmUsv5IWibmGiWVmS1abrcLDmE3qy9JeI3X2/5GLyO8JzeiHSu5DJ1bVBenHrxuCwjYi9vVfkF+TGRwEfQ6a4+ymV/tSkrQkbaRSMZ/qcPGbhz89ZbXQrPoSsMKdaEMahj0WHVzY14gTxn1rj1MiVqFyzQnaXsnNdiLEbYce3ASDGpy0bxmaTgJnpEGDcSqmT5jD6rMwlSHnm9aptAVcftUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDf0wPvajLkeVjV0Cc8BaoU7/JqiNeY72YCZRxwiqms=;
 b=Oga4vkC1j8Zr49RSLZkAnfkR8YhTT86kDvogz3Ycrgn/ZykID/xrnIKktvbqxC72o6Vh98TIo9i1RzCKeesjvcQGsXxEwvcLWP8UmodISRlN39kWOYS40JIjSn6s3owb7pXe1/1dmiOiBXYLcjIhxN7tu3SKj4K335HI6ChWVK+JvYgwB4X+xm6jxVj7OM0Ts2OhSV9gOh2RMDs/aB1KapnUZeu277u4QZTIXxrZyZQHRb9wexEUNuzK+TXOwLzLD2DeURSh8XOje7evctCCuaIFXuq2AZ6JXCtUYbr9xnhxs1uV/UKKsgs/As3wifomTD5tB3wFh7nd1a8dOhgPiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDf0wPvajLkeVjV0Cc8BaoU7/JqiNeY72YCZRxwiqms=;
 b=TNqJtFBsCymaYumerFGOqBNQ63T9aosFcJOaWfVtTJuB8B+mFpDkDoAW3QXWfGmoMkLH57nn493hFVxwctnfg462vEI4o/9MhcJuhSaXDn/QLexnt1uAp3Y7v2i5JmWzyMJNeSY/etUNdYH2dhCzAFdWni+TwloqcSCd82k1yW6PuWGe63GJjoqtapQ8shNsJqEolzCTH8JVoqXZKiB4x66p4rlEQfR6hcI6GIMlSn/cVLNZAMIKdYLFGfVHQTbMCMaVvv7PAkDXbuCcl0AgcyUYP0Rzwm1aKr/hloPopyKRjPo4fr15u53kUZ1Rzj7zZDqTxpwQHSwfnjaVqF0KBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8687.eurprd04.prod.outlook.com (2603:10a6:102:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 07:19:38 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 07:19:38 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] ASoC: fsl_asrc_dma: allocate memory from dma device
Date: Wed, 28 Jan 2026 15:18:53 +0800
Message-Id: <20260128071853.2602784-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|PAXPR04MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: e1756918-73da-408d-d9e4-08de5e3d9882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0pmMTwNrlKMEuQqaOXyIuBjI48oFD9SLpuE969lfBH02iW2Yo4G4VH3sAW/D?=
 =?us-ascii?Q?W6YDFBXBaI8y9tZzj+IS7rfv3SMv51E6ET4axC3GmyE0VXlysdUK+zZrn701?=
 =?us-ascii?Q?IcCRiFlorAw1vk11c/+r57pX0BN30J5Z0axv2Mkoo9y6Ril3twJ/N0GIr38G?=
 =?us-ascii?Q?AOyEep0vNu9gD8kDOLghIyDNXIHSB/3fPgqTbN/VNY/imMZG+EM7vPdrV44f?=
 =?us-ascii?Q?47JCohTxOQS0/q5rYEit0Xg8Zz8r6y8icxZlKS0AQ36Hd9I149iIBESjuoQl?=
 =?us-ascii?Q?puR16gBC7gupQF7LhgteFq2vI43ugF3v6dHlfkjx5JBigvpsdTvdo901fCPS?=
 =?us-ascii?Q?HWCGYCqFowtbpKH1B8eLq2FrBq35495sdH4o3Z8BFbSAlPzfss91u8/kwJ2G?=
 =?us-ascii?Q?ozDxYKq3x1Fk6dvfTZeNDuCmpsANg3x6MBl/W6FGsnlbAbVbqM2R24NqiP/f?=
 =?us-ascii?Q?xtZfMmjCdtVqxAa7byBc9ktQKSxk0vSaEoasyAmV7caYVha1J+TboVBZuEou?=
 =?us-ascii?Q?Ck7TGWN/uRpc7jYJGINbTWYfslV8gm9T8qO3Fg4C9meNwtfMfRGYlfGzwcQh?=
 =?us-ascii?Q?ewcDVFeiLlS77kbwue5gGot260XAd7PZ7YlXdsSL2go6mYas1Z8JpAdKqGY/?=
 =?us-ascii?Q?EEs9QFLU+MoGDfGMg/9wuol85Xco3r0Gi6QpLx1+PvxtR5TFsuChVWGigXxE?=
 =?us-ascii?Q?MMeOkQMoOiFv4QZgkOCfCvqnSVybRM8+oBcj6LV/Os2C/CyRf5yu+2gt16rN?=
 =?us-ascii?Q?HA6p/m051cu8gBNDJLgwTQdFRASWmlZUqDUMU2v5pjc4BGvNAGHfqI5sUq7z?=
 =?us-ascii?Q?Jib1uL5fvffVbApu6/jDlLiJpi8ml9Td7Bs9Ko/xgV2jIB3lWoIgTOyifAy2?=
 =?us-ascii?Q?O92N8lWwev88klNXSNFOvybfClE3a7c9fiul19agn1szJsk/55wNu8kc4TAJ?=
 =?us-ascii?Q?UUQR/abp3qz/YeOYZxQrr/tQTcnBsd1NBhQ+F8vqx/3dQL+q7dH3NbNAUHuu?=
 =?us-ascii?Q?YrM6dWO45oBSnYXXrhJNaGMhLJaPpQeATFcMBKhlpLy7QU+i/aBnn/iQYkH7?=
 =?us-ascii?Q?E9CNOBEGfNjMWAwEgzLeDFEBlFU8TsEVwfiK15TsFSEjF1PXK3156WKhTMOS?=
 =?us-ascii?Q?WvjxX2BB/HDcL5zOUna2nHDeFbaeFIiZ7fRqa7Z7r1F56SZsyA+/NmKvnv4C?=
 =?us-ascii?Q?hklFv6bO+NE+avsxafav2TOc5FiwzCs/1rNH2+WqBamatAZpG8bv88ahAMIS?=
 =?us-ascii?Q?iykbxCVyDD0ytGEoAyydJ/39n5oCuwhjf1d047ocwbLcYwub3Js8hVX/vBVF?=
 =?us-ascii?Q?h7PxJzNfAcsy10WkwuptR2tpbHGNghHvDFbeHrUAp6x3TyhcS2+bUfrKEVHp?=
 =?us-ascii?Q?0h2oWv/usDpu8iZzrrIqx/K4iI1Jb9LusjsP5VZEOU7hblX2mFFYDRr0/KDH?=
 =?us-ascii?Q?WIZEU2nrHdeOBhxcOc2lgPdLjRckKxSMAT+nxyusXFJw2SBqaT6moSlZoKQe?=
 =?us-ascii?Q?l/sZMEmY84hv6ZfwimUKl9GXPMmk6iEiw1zfcK+IJK/Wgj7jOWfAHkKV6xnf?=
 =?us-ascii?Q?6kXk4y1PxbeGhYKFcniMa35wYmQ6xe8zULAxPjv18MstnoBd9rhmza0xm+Lt?=
 =?us-ascii?Q?DMlxmpDzRxxtEBZHBgvbsq2val5acof4vnzxTbwXXASe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X/z9jSmkEPdrtwapMiFPNQhcEAFWQySh2XkAM4wTK+TktDl1ODetENmObHwh?=
 =?us-ascii?Q?3Xi0qtsBTq8cKWZNNkT3HtLYR6dt/ZbO/gM5W8jiRzSTyNyZgbRn1ZL8tBmy?=
 =?us-ascii?Q?RKeFvu5qfp9elghJjv7e2Bxb4qHEk5eQn8UbmGBuyPBs3hjFBX5dmGmugM3R?=
 =?us-ascii?Q?vpi8m0jOSQflrGxx+M0S/LkczKrRwNha8TDl3X4km0+oNgCfuyhmeGGuw/XW?=
 =?us-ascii?Q?UQmwPhJYdG8/IkHmUD9tUS4o45kdkj6DrwXiuGNXKviVICD6caJsNLWGJLjC?=
 =?us-ascii?Q?VACfnpVn+5kFZqzmPffaRVwzmsknxD9NfdfLqL6kcXAoq2aRc/ebuJNvcQrK?=
 =?us-ascii?Q?cWd2OWjIr1VUnSOO0tYz6LcF2cXYq7SmrGTkBMyBc2vZ6lHLEJ7BHE5tpQ0k?=
 =?us-ascii?Q?Hh6WaoNRfKndcmZwJTzODWSPh7h1g2sKMPkiKpkCOQdX0h5y7eKm5QF5NmGI?=
 =?us-ascii?Q?InjbqRugBRJbvZPEKAAKDRkQq9pwKr1/aaMvaqZzPsDhPBjxZttPGpFrzE6i?=
 =?us-ascii?Q?5mrm+GDMRpGJ2i5NfXyjFigtxwfPTqZmhDYE9udqY66jCqh29Im8W310OYTt?=
 =?us-ascii?Q?Ub0zH9pgHxmjc063MPlGYnHRa+9bnEXFqvoRBDUvF8sM/gNUvbB0EGQeyGMO?=
 =?us-ascii?Q?YKBajQKtTQ7NTT41XecJSd8jabp4+rosgydQY1XgfB67KhWOYnRfSGZH7j5o?=
 =?us-ascii?Q?cv3mURVkidoSCkagjrwC2OJukK/Dzn5nGrhM48aQozn1MHbVf6Z1Va/AZ7jV?=
 =?us-ascii?Q?iiTDif9CtdTypga0jsCCNi9zvPZevM84hNlFTg7MMMI5wFjlMS4I5kqVNKhQ?=
 =?us-ascii?Q?P+CDmilVpo6W6brpLKkR2OXJborkPNFnkkGgJtmThS9Nhv5fvFMQXZBaZrPr?=
 =?us-ascii?Q?LpNk4ePZ2VWSNBxoVzDMfVT8RDsdj/PWJwyau37mzmJ8JmTPXTDYuAi1Uhs8?=
 =?us-ascii?Q?dxOx8GjEpNaVSMKO858x4g7WrtwdLBlEKBywK5VZ6zZu0YXjfaJqi157Fzpr?=
 =?us-ascii?Q?DiIMTpDxhTkiJ6RoUrKjx2ATD53OdzBVdxXBYBNP1g5DeBKuiKBYZIVI50fg?=
 =?us-ascii?Q?5hVF3KAc+qhUV9eKZj9V64gvKlbqHCyyMj+HzFWgKflw6dp1tFq9h/MwROUV?=
 =?us-ascii?Q?7bgjT+sPJaUlAoTbj+8A4vGszixMxWiTYGYz1XkEO8R/nWHejFRpzpf20vUP?=
 =?us-ascii?Q?jrLguQOY8ydlJk2IwBL/FyKMWMK9SzVY5IrHiEuDhhdpMcKNFDygrpLLRemH?=
 =?us-ascii?Q?xurdZjSHrTOVf5+HD7/OnQMJMtFgyQLQahzhh9jtUVDmCF5Xd512t4JEMzK2?=
 =?us-ascii?Q?GGdpPWG1uh197bPI440iuviCJBbZa3vgop74gFveK06HLtLYLf+SCn8G/sk1?=
 =?us-ascii?Q?blPjlmN78tsaXWgjV+IQ2Hr2R2Be/kntaIKNOb3DrbLoEZbhbvjX8FLIBeAV?=
 =?us-ascii?Q?E4kqa6CZsr2ZGZ67RubrHfa+749LtIDNupKp4IEtJcD4HkWD6n+kwX6HHY6v?=
 =?us-ascii?Q?vwcV95nCOi9s+3trzMsYDOyn+ZGLVX2RhYgmjenduDpDb8mulBPKM+krNnMQ?=
 =?us-ascii?Q?U4abNdh+9JhYqNBZgyX4C7eNGnPk8vXNWSuAcqymoW0QIR43fR8SFQCBjuyy?=
 =?us-ascii?Q?wR5gBDjVzHdg6DA4KhYmv5XPYrL7I+D+rtQH4SLE5A8Z3RofUihs2eo0pUKL?=
 =?us-ascii?Q?kXBBowV4oYXdO7IjX5kxbLV6wQfQfAY40F7iDbd7T1z/PSdZk2TeH0EquEsq?=
 =?us-ascii?Q?/vAZiYQRrA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1756918-73da-408d-d9e4-08de5e3d9882
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:19:38.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDsthd2Nxr73pQpx02GVjVrYnN6T69zUeLL5we4XpF079KkKAVe6UEAKBKgG2ECXhdjWCO1lIhtMRsIhjkBNVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8687
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16349-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: BB5109DB37
X-Rspamd-Action: no action

As the dma device may support dma-coherent property on the i.MX952,
allocate memory from dma device to make asrc driver to be compatible with
such a case.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 48 ++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 7dacc06b2f02..b8fe242d53db 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -449,18 +449,52 @@ fsl_asrc_dma_pcm_pointer(struct snd_soc_component *component,
 static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
 				struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_card *card = rtd->card->snd_card;
+	struct device *dev = component->dev;
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
+	struct fsl_asrc_pair *pair;
 	struct snd_pcm *pcm = rtd->pcm;
+	struct dma_chan *chan;
 	int ret;
 
-	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
-	if (ret) {
-		dev_err(card->dev, "failed to set DMA mask\n");
-		return ret;
+	pair = kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL);
+	if (!pair)
+		return -ENOMEM;
+
+	pair->asrc = asrc;
+	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
+
+	/* Request a dummy pair, which will be released later.
+	 * Request pair function needs channel num as input, for this
+	 * dummy pair, we just request "1" channel temporarily.
+	 */
+	ret = asrc->request_pair(1, pair);
+	if (ret < 0) {
+		dev_err(dev, "failed to request asrc pair\n");
+		goto req_pair_err;
 	}
 
-	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
-					    card->dev, FSL_ASRC_DMABUF_SIZE);
+	/* Request a dummy dma channel, which will be released later. */
+	chan = asrc->get_dma_channel(pair, IN);
+	if (!chan) {
+		dev_err(dev, "failed to get dma channel\n");
+		ret = -EINVAL;
+		goto dma_chan_err;
+	}
+
+	ret = snd_pcm_set_fixed_buffer_all(pcm,
+					   SNDRV_DMA_TYPE_DEV,
+					   chan->device->dev,
+					   FSL_ASRC_DMABUF_SIZE);
+
+	dma_release_channel(chan);
+
+dma_chan_err:
+	asrc->release_pair(pair);
+
+req_pair_err:
+	kfree(pair);
+
+	return ret;
 }
 
 struct snd_soc_component_driver fsl_asrc_component = {
-- 
2.34.1


