Return-Path: <linuxppc-dev+bounces-16415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8El+FUVFfGnfLgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 06:44:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C2B7656
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 06:44:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Q1l41WHz30BR;
	Fri, 30 Jan 2026 16:44:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769751867;
	cv=pass; b=fyd9XDhdYlssHPGOFqvfGoqe1fwASc2wG1NCDxSVLk3rPTRIJjpYrXd1TaAODYtPRtnuipOoQxQL5i6bODYB11CC3oSaNaCfBfJgqFbhAfVl1Bzl2gjmS64UVUdqXBdwKNT02fGkzrBO/t+ZsbAhPDUwWBywOjtzoBPDdB8fOcqtozaEZm2CIiHVEikNTd2iQJ5JVe+icwoLkMQ3deqQ75Wt4nTdKaPpuNVKAn3o8C0kSEHq6jXiJqw8ZYoai1oNqRI7F8VOUuR0hK+sFb7jdsaY+I2aoztq13JHH5cvYjqZ4iFbSkExSIxTnWMtpnrdhmPMGQRqoxwYUGtT/HUunw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769751867; c=relaxed/relaxed;
	bh=mV9JS+d5BWOfvTtBxUjFVYed1gdNzIsWD/9doD/Bh48=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JXCaYMu5p3iKovgn7cFXpKLo4Kij4HP6Fs2PFTqK6QH7VUvIHpI/LB2yJDQMhTBet/0H9AZHto2NQq9m1sKHb4fUyEczw/eXUjCynGFICzE7DigxB/1aMOL7Ymssm2zG1XkAz9P/qGbpz+sIlpRue+rkjJ4oLevbbBmFhHoyefLAeOIQTBaY4gpnQaSdi7bUtboJPeYfajQUCoibtKjYIDcnQExI/ZydZJXr//DklhgJ6gBoU6fjvbSF9mtTcHzMVbphaPh7SuU1405iHS6Ou+2zAUq2psE4hjGlBYdD10kW59GBElghm7UQYMpNfKgMrgl5r2Vkg0FLGCh3on0ERg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Cwgs0Av/; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Cwgs0Av/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Q1k5kprz2ydq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 16:44:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjl6bzaYmr700In+8/X7/A7IMfGxrngkse3NhRvUgblqxBmxG5QLipXsVwO2oNRWFgM6G8DRz1jeeRWdpq9d3a9o8OMMrZm9QM0OhAjfwQmxLwEInutfzStPl3N3np7/TBxNBsOcQrobt+IpgzVbxltXSztf0O6mO3qUyAZOYsVESLo9KlL5LIFyP+aFWFjGYbpruMwVCpP5omEbi2gQMaadXNEyTYsXrhR6JoBpxLCxZmutpEYbMSTdljPWi7T18NM85mzlxK/CmcKtyCE2YmDsVgPT+ob6CZzdhHgvzKEmc8vb3/fIBlAvhlCzYWnbdZfQ+pOKJQ1q1kEFTDEibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mV9JS+d5BWOfvTtBxUjFVYed1gdNzIsWD/9doD/Bh48=;
 b=fdWlxBuw+7OFP+Vj/aTFlfEByDyzlZHLnqGIIa16OJo9RKlTrCaGPeZ3CEK52fX0lg19v98BbVow0WDvbgcp4j9nLAqre1wksHDG8afi3V0V3NtOA29qRbNmh2hDPDVP/P7uyUGteXuIWOkyTSMW2zFaouuR6wkTS/d/qnVMpZWbkZypZWr3KQAbO4IVDdgbHct5dK6zRdaxASrjc9OZbRHZ4xlTiYZrzC7g1gjjyrCbT2WvaHUCDTC+cxA7bugrgWsxZwkvRARaqTLqVjwelS1DCl3ph25cFiFpf+mWOQ4a2+GoM/16uWjM5LYk4wPnFuNwsmhQptno1rSVabNCwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mV9JS+d5BWOfvTtBxUjFVYed1gdNzIsWD/9doD/Bh48=;
 b=Cwgs0Av/YLOx5CHKLiqe17ZEjj1uys4uJ053YzYDsCSbi8CQaG76KfXl9Qr1PR+V9Rcdl6lM1wNA+VBaCmQ3YCqoR6g2b+ZasA15YKaIAQkQZDUaS3JCi2VzUWYSVdXxf3Yw2jFKdsIZZ60lrH6PE3YZSLp+QYks9IC3M3k/p1kY0Id/tzAzNCMee6/JovROEVpvrM9oPfNncswEStjpYr4Y6y4qQs/Ia/58106SkbHKF3oIp3w5+mdmV6dMV4RyLNg7AZnPEreY0m/nGN5ca19ztgFoxQpzuov5T7sL/QikX8RT5YxcVztwbKpv2yQfCi8ULY8fFxna5lQbYmbkNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VE1PR04MB7277.eurprd04.prod.outlook.com (2603:10a6:800:1b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.9; Fri, 30 Jan
 2026 05:44:06 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 05:44:06 +0000
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
Subject: [PATCH v2 1/4] ASoC: dt-bindings: fsl,imx-asrc: Add support for i.MX952 platform
Date: Fri, 30 Jan 2026 13:43:27 +0800
Message-Id: <20260130054330.3462544-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VE1PR04MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b5a1fc-dcb4-4d46-c384-08de5fc294ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KD7nLjauAU+lhYIDUTDWcdITFP8r2YQB38NOnUjjN28pvC198tfp3IoTPWNA?=
 =?us-ascii?Q?fI8tabLcWZrT83SXTJcNnfJ2XTjWzpfPT7ykF5MEz9fPXhgxEpZE4DeYxsTc?=
 =?us-ascii?Q?MOrUZA4iOizChiBm228zOw+4San4uUtH8EPqtPkBJqHA03//9YdmZdMcDPny?=
 =?us-ascii?Q?RnHqXtZD9omEPhEokDMnYkYiIwo7iMV5tDMKq3sjpJJPk6CCZXjoLYToXR1G?=
 =?us-ascii?Q?lreAu9thAbySrF7bzxRQYzPwcwcU1yDbTREWIKrG23KG6ZJEK0KzCaClNL/F?=
 =?us-ascii?Q?SYk6M1SBP0FYeNHSAEDy/YC3tJ1z+7HVHf+L729TtpKuyFYwtwdfpkKd0o/S?=
 =?us-ascii?Q?a3fKm8P8FzciYotdXY7SSLTp4Q2KrsBLyPlpPmQADH7O47hQdxCzIB1sHE/L?=
 =?us-ascii?Q?bBu92lZgC4aiXD/5oB/COo09rP91ES+R6Q7u6KFpkh6Ct/TbAhWlgtJ8HxfH?=
 =?us-ascii?Q?n1PfPXyyWVEMAByznvqsfczQK00Hxgpv3B2fvpspC0kLDNP0cTFCx1l/GneZ?=
 =?us-ascii?Q?4vOrMkCNbeDNuyT5FsnC5X3XM8Xj/C7fW6VUTju9shQMteTP+KIDrMiejOYe?=
 =?us-ascii?Q?0kvmBRHaViBkwrbPazAb9Hop97I/UkeDOHeYQqhoiVHXL4WliKK+dhggNO5q?=
 =?us-ascii?Q?WeP9P19eOVkxnNEIpF8v6KZM1xTf6Q+DmisE/jzw8XjKyCwd9ryeNO98rOye?=
 =?us-ascii?Q?jSXsw83yeMr6yghjwu4coVPfC0o9SnYvWjL7yifbZOTiwaFggflOAY+A5IbY?=
 =?us-ascii?Q?k6PyqpSdYDijLj8z2qSfLHi0YVcW+L441Ch6wl0AS8RfczrEoWN0FhNrxDFZ?=
 =?us-ascii?Q?zrKClXBpDfQTv1L1vN363zAKUUpnKV9IqPJJL8VuYVP3aOnjylwQ0dNEzvXK?=
 =?us-ascii?Q?KLYM1THRLGeBdY1L31pOSNL8Yhri1gYFskUuv3p3ZyYaK/Ji8jV0BYptHs0Q?=
 =?us-ascii?Q?4A/ZG3zrprq/fsgZwxFYSBUYkQubhZ2u1IYH9lnnW1Qej+cxWT4nfGDAnYAo?=
 =?us-ascii?Q?ta9hMR12R8XbKKZ4y6cTT37mljq8UTsM6SxJOCZaIh2vZnl9RypICdzksw89?=
 =?us-ascii?Q?tffcxG4kiVLF2HDffLSSeXBBBko5wMV+xkt9fStjtgz1VkG6knPkunueAfkK?=
 =?us-ascii?Q?u0PwYEfUSywvlfC5UtnXRvQx6j7hOIgM6B2/H0hcAEZLZlmPQ++9U1b9SN+0?=
 =?us-ascii?Q?yofPueEQqz/Lf+XENANwxUb5uOp12I2IrlOdFfnmT7t0cAAUzUu7j2lWseNh?=
 =?us-ascii?Q?mX9vytB3gUDZAZ8Wwq+Xo4nJbktGNFHzy2ssIS8YmQyMUMGm2al8P4P99Gzu?=
 =?us-ascii?Q?+e9aWcxYoml8kvi1uUXrfrVWxVqJWCEMureVa3rzylG3Zwx3CavLUFIq21Jp?=
 =?us-ascii?Q?5dLwuboZ2zCpWlpenRDizYRJ2NcGcrtrJd1JCiJvtZUsgFp02gIDMPFu+0ME?=
 =?us-ascii?Q?c8eCiYsr7AW3uaTtRH+D6B/CoGtEMW1oYsnghP82XaXXo+s3P6r8p9d+snhN?=
 =?us-ascii?Q?7bVP+LXz1K7FuOHXGn9IJtlg/lB4bXjnH7lU3xTza4SI12J02Tgs2I771RSs?=
 =?us-ascii?Q?5QyHSmR9FBnf8kFWlUXu5uI1wccXVMg/ZX99SKWlpLE8q27kzwZRcgX+VWby?=
 =?us-ascii?Q?cfk8Wi9AJgpft9YPjhYHR3ZIFcUN9EdHoP6Ai6+mNssN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?COpwQUhvWqLdLQWOYD+51otHtC35Jua6D0gEwtbx+EsvRIuhC1x6TWAdiSaW?=
 =?us-ascii?Q?PdGrTz2Nhnx79Pgy9niaCiZEDzLkUT8a7q7xmhv4XrdDDf4qgA0mR5aFmP4G?=
 =?us-ascii?Q?J9G2rXet5WebgsnWNoWuCwpXzCUq0HxUJiev6EBLED3foBcOKYkRaPQnLvCd?=
 =?us-ascii?Q?cvMpnx9wYxOfdTlPZK3bBe8keFTQBNSRP8dbrDDXeeQMgYZEP4WmOFAwWmaB?=
 =?us-ascii?Q?9dyF+07hBeTxGLPX0SUed4gI3U6huAMXweyN1iad13nlfXjFRXNzAGBVu+vP?=
 =?us-ascii?Q?ZoYVNly8TQaJ8Q4s4pAiynwrITKxVY7q8m2fJhXPhERZ4hjv0gNHlAzyO1/P?=
 =?us-ascii?Q?y98nldcB9EkTMF0QDadxuL4JolcBnYiJoNMyct2AY/z96246w2H9SVvxKjBy?=
 =?us-ascii?Q?p+YftCUij23UMwPcVdXp7NTcz313dDekxz+Z7vunDkL0sOl7dcALYvSiZUwd?=
 =?us-ascii?Q?FlFad3ImE3BOC97PgWhyXiDXrFDIB09duomphsRIEO7G0hTiKwRGf8ofLpGE?=
 =?us-ascii?Q?cu18v1+kIar8ecqfbh/+ofmHMg4vx6VjdatIJJuH0NnUbDMracG93+aYhuqZ?=
 =?us-ascii?Q?/1V9K6iX9o0Y8ewa+YTeXcfKoejEXcfpSJpqBeAizZ1Uu7Sl4aYSwkWcAjfD?=
 =?us-ascii?Q?bPGlpVkCeylB7rB3D/pmkZewOuMmNxWaNk4EmwTolKDncAC/ceHS+QubYyy1?=
 =?us-ascii?Q?y+tF+2DaYXEHjofT4WotyeK/0pCP/6whvko3W937fB12eQFcnDfdqTeCGe47?=
 =?us-ascii?Q?JfwstBJmZJ767AGsDaVJoHxLALGxRjloyUGvbeRii/kaJN219Za0zBnXcIYW?=
 =?us-ascii?Q?2YmwluRctbJqjbRqbSzehZDXqGwoIInrUoQDYAuO9mUwQrWb6Ekkui9rJ4AY?=
 =?us-ascii?Q?tKGCsRtZB9Zz9QaEwKIuKjpD2YoMNMbzbfbRBD0E24IPqn6Pv962haK3JPYC?=
 =?us-ascii?Q?VAQ8Tgb+/OReuEXvs3kFmDi34ebtNwZm1dqrAulp8J5SSlz6oPjaamDoCgIB?=
 =?us-ascii?Q?Ybs+R46n4uFJBoK04ZcCtj+gE0/JhX8eTdHjdEuqyWw687dUKUo8uq5u7G4A?=
 =?us-ascii?Q?ixsrMIWFC6T/270K4PPj5U9MD8NvWPamwJESPAx+4EMhSI09Jo4g7FuJfNQI?=
 =?us-ascii?Q?u/6310wit3kB1FEIl47EZUI2yehhH5ZTEwIV6XVdptCHwYuB9YXZp4kn1cFO?=
 =?us-ascii?Q?db8tStvyuG9Fkm6FyV/kvlfw/6aAtpuwKqfxdbLiaslVi8A+C0QY4x9W+TKC?=
 =?us-ascii?Q?VM5zhk5LjGTAhs6Ws6OyNcICeuS7zPDHJwcquQXx1/sqkQz+cNblPrgQVUoE?=
 =?us-ascii?Q?GwITn9X5xfqlXRB/PzQd1UNaVobQ79S6MH++lC/kF2JM1yZSVXWFMnWTCOLc?=
 =?us-ascii?Q?xwSlP7Gy13BqNX7gh5h0A59x8Fek/HHa6fNBxvfLWXxiD8S1vqF+fUiZPRXX?=
 =?us-ascii?Q?BW098iU/ymcwyhxQH6wnNUJ9Mn25kUi/zDwBZnDkx9X9IrNTN2ir/0FDbGt0?=
 =?us-ascii?Q?kQkr1LlXBmGp9lWig5k6FY4k+co/unsxxLR6ptxDZ1tOoPjkRTao0T/i/sB/?=
 =?us-ascii?Q?4DZeGVTTZB1ErkWypqrzOR48EvPeL77/w94czR+KdtaUItwEG5jHh/NYgSxS?=
 =?us-ascii?Q?gMWB4QcATZOufbHXqxy/haE5mP/hbH3yICYizWEbCC2OKUNV1pQiPN3381F6?=
 =?us-ascii?Q?fCbE0GRqVsdj+a1nrQVWa4TMGb64XWufd/DGDmDMEmjD/fvwuYSANnHs4qdU?=
 =?us-ascii?Q?1dkwqwRK1w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b5a1fc-dcb4-4d46-c384-08de5fc294ca
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 05:44:05.9886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: toGuokc2QppH1oxgav8Q+Td8ZQEp+U+NidL4ko5kzbaiJ5TNsElg/4NQTE6zVav9uRvN8SSG4hZQToco60TgVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7277
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
	TAGGED_FROM(0.00)[bounces-16415-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 530C2B7656
X-Rspamd-Action: no action

Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform,
below are the differences that make this ASRC not fallback compatible
with other platforms.

1) There is a power domain on i.MX952 for the wakeupmix system where
ASRC is in. But it is enabled by default, ASRC device don't need
to enable it, so it is optional for i.MX952.
2) The clock sources of ASRC are different on i.MX952.
3) There is a limitation on i.MX952 that DMA request is not cleared at the
end of conversion with dma slave mode. Which causes sample is dropped from
the input fifo on the second time if DMA is triggered before the client
device and DMA may copy wrong data from output fifo as the output fifo is
not ready in the beginning. So there is specially handling in the driver.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
index c9152bac7421..608defc93c1e 100644
--- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
@@ -25,6 +25,7 @@ properties:
           - fsl,imx53-asrc
           - fsl,imx8qm-asrc
           - fsl,imx8qxp-asrc
+          - fsl,imx952-asrc
       - items:
           - enum:
               - fsl,imx6sx-asrc
-- 
2.34.1


