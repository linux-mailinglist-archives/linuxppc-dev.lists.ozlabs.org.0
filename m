Return-Path: <linuxppc-dev+bounces-16058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C232FD3BE10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jan 2026 04:53:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwD293c2jz3cBG;
	Tue, 20 Jan 2026 14:53:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768881201;
	cv=pass; b=KkOtdvbISLOugYdCxwl4TqPPP8XhlpsG/xGbkEz/kKJPlfK6anw6R5d1ftS7e2OclV/8/UX+UuyMzRFXb5aalMwe40ypZa6c6Kc3kmrnRjcpQQu+pCVCQZfOvmYYflbT8BGcdNL2A92VxZfnOpz+s6Fnlv0hYpVYbQs9lifj55OlHpGj/AyO0mm4jfRyDjgvtzn7+ypXIKlc3MU1nL+qR3YIehygEUPaMbuk9FEU0GgKOWNB715fjb5+CM49HV50ImEsPgFXPi/JBix0H0Mdms4P5ut11g0A25dGAq8VIQk3y8X/Ttct2K+8czjvIAlNyWYQ6qlINTgPOsMwsfNJ4A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768881201; c=relaxed/relaxed;
	bh=g8rA3GvkMt2AYYmc32fEUHW9T98nex0O94GBEQQd/ok=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NIBWLX/jayAFps8h8K+clnwm0KZzK6ndkCbDrjNdun0XjswhCwoPngmKh6K2oPPsKuad0fNqKVCv+zsx/Gaek8zK5y4WM5GojTYfF/Gl2zh28zhKWt5GPzjp9HzxsQxqPTX8PcNukhQH3WiKSkdvSMBNOHGDZP04sSafAm9gqoiqGk6JeTiIaz7u4MSOx9/16Xnc2W1kTwlQMLhLXqimmYmcHpobAJ8Sk9z05XfLM+H7iOqEgJ6gaxEi381kOmxgGO/97XZrHPmYYxJR+9Q0UWMzQEi3KLXouDqPITpgPkwdLa0vLfhrqBEbFli1CFYt+bVydCVtf9V05TwMcKSV5Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=iE9JX6gl; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=iE9JX6gl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::6; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwD2869Ytz3bll
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 14:53:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laKgFcwlEU30rhkjfgpN/FTuPX8yiasobY0TonM7/0q/DpR3zsKv41aTW+vlyNYzh3FmQ3U1+EJJkmne6jkc0HikV/YgOmg8HKAUiA9gLzkyfFXhlM4Ny1SxJv8c7XEQFlf1wdp/Q6iSG/s1lcj4HOZmwygIUqOoEUrHasFERIYDlrIe7Jh2h9Jxga4YddGcaLIIQRexDSpMQYCdMHXkKG8mS41N85te48U0hkiMltIAmVLpNDrXFQK2zZ61OMJaGCYx8HH/0CqhHed8XsneRJWtdfzuMtvW6i7my9Ie34GLodFcpY8Vnw4kgmHy/y1opkMe5aXzKMtybGxIEV0tzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8rA3GvkMt2AYYmc32fEUHW9T98nex0O94GBEQQd/ok=;
 b=U4Jmf4wmp4HKy36TmhV3V2cqLXSyyHuxlQrJTKkD7pgtE/vyeKdddy2VARqTKZqCDHzoxy/A+yUxvaG3sywI691l3ni1LoFgZq063Rsjm+E7F/WSj21MqnEqWndcTsbKcn+SZmLvzizYrFXQPUs8niVWmhHa9hJAh7zwRqBZ2mBPr5JxchZCqHsO/fwo9WkLrr9WM4B8V9onfHw1sZh0QfGjZWlUKujbGsTsLJbCgQm+PMZfysJIORpLmLMdx7tP6X2WKbtoEZi4M82Z2Blx9b7j3mH9gDxPDGMHDt31/izXq28rXNL+v6HDM2tLLJ3KbYDLQGzVAsSZGJgmZ0f/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8rA3GvkMt2AYYmc32fEUHW9T98nex0O94GBEQQd/ok=;
 b=iE9JX6glVVJUAwqzlznHAZHVGabamf5sbaUjUKnj8OJqx/kK0Z5AMW8gB552CL9LcxqFz3lIkG47eLvf8sko3XSkjgCEzBp90zAZC52atvAwozPzTv6eblPHIxpANRRaoH/4x0o9SRSW4wrdeiM5cwKk6jdm1mCXmokhvCbSPZIEVg70e2iwlBBFVfapnPnkuqVt3zA6F/GuZgfvqmU+znsIPMVUtfj1wG1FCCsRFiwX3y2LMPTCdkImYv80GHdNOjP7iPcada5pEgsdQx6/8O6dGdBK77iuOss6O85JKuOPHbvT6lypUeUDU+7isyuREShGtPEGLXuLOzvJGDDzyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VE1PR04MB7343.eurprd04.prod.outlook.com (2603:10a6:800:1a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 03:53:06 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 03:53:06 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] ASoC: fsl_audmix: Add support for i.MX952 platform
Date: Tue, 20 Jan 2026 11:52:09 +0800
Message-Id: <20260120035210.1593742-4-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
References: <20260120035210.1593742-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0074.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VE1PR04MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de909f2-1ca3-4430-b9a4-08de57d76b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wLzE5yVcZdex0PFo9TNl03qGL8+CjEtkJByzDF1VuBt2BVSGdYJnH797hpgx?=
 =?us-ascii?Q?Z5sXJ2ftlbISge4igZBGSiuWjSnkg8caNEKW+VhSkQd+RdSQ9uqVlzr2oulk?=
 =?us-ascii?Q?zLMaXjBh6uZL/3I0g4VKNNoqAD/MPcC3Uq52EZsOvFJjh9EAf9F8zVXBvxD2?=
 =?us-ascii?Q?zGtyx2usCY71y7Wu8l6GBLRb/MUsC82Wq03rhtxttyAWrK8em+1+3HYx40I3?=
 =?us-ascii?Q?NTsawUFzeBQLc4vckaD2h0HXMcTnCfMpaKQgcIZR1xqusbbjFzcg8y/L/izG?=
 =?us-ascii?Q?SVc3ebRdZzhk+1E24EOtRk8xXO5LaNGiU1FoeAZmO2ZROniyqOfiahuMWOAq?=
 =?us-ascii?Q?imHIFpo6OFqSxTAKyYtbYY6kbDOhAiXRuQLUxLeeH2mMPpjlZ38Fpp6iPckU?=
 =?us-ascii?Q?8MOpmcDNmKp4VsWyXHYJIrFzaw8TysupNsNa59TVh0Ue4bTxuF7LgTQVrX4v?=
 =?us-ascii?Q?Zuf8B5r1I6JadIV8D90oAz+bMR4XGmOnyOZ4FWFy6oouD3CxNgR1YK752pW9?=
 =?us-ascii?Q?5XyQu/M8Ny++ImG52qmNnkDLq4d7ZIdNLwFX5KhppFimygs92/FpvKV5QyE1?=
 =?us-ascii?Q?rSfQcP8ls/VvJgAGUt3i1gpjGSweJDn5W/qV4kJPYbSF8kBngUHpUI+7KMSX?=
 =?us-ascii?Q?rszg/rLyqBk5BeKNp4ZbVLdIvN1+zqdxMNQNQvrKf4JQm4X4T9fTOULcW6vu?=
 =?us-ascii?Q?1jesx5VMtjD9AO97IBRKMUeMtjNbZ9x6pJdkogI4I0K1UXEOr/tSG22zanxB?=
 =?us-ascii?Q?A6jzmORXNLDtlC+dEwgMlNV6GANf917++KkFjQ+YbYuyDNdfsP2Bc6Kh/XEh?=
 =?us-ascii?Q?kgYylk0rbdtFWaZIQMWmVGTBaDUpc9lnlVNlhazz+cnf9iyfjvq6PbSDTGYt?=
 =?us-ascii?Q?WaMWCWNPETccI6tkVd4OpAAEQApDP8gy3gb6JjkZEwGePMBM2Ag9aCynaMtO?=
 =?us-ascii?Q?8nXwflgjgI5wgkvsz7MMD/4kyO1CjHfjiBozu1FmZA5S9l/3A7xslGXPGrYD?=
 =?us-ascii?Q?CPViiZ/jVID/7DNarWMmNsRgA2aNd9Ij7EH84jkbSWe4KLp3Gj2bCJyU15Kx?=
 =?us-ascii?Q?aHgHPZZRifgV6hlpPLil2pw6DR4Ch2Zce0ffL5hH6y+4tYHWsfbEzQH1PKfS?=
 =?us-ascii?Q?e83YP7RVCBUGpWvkUSJBoWd7csuViOGyFoAdgGWTUQNYynoHsokpiiDCgCQs?=
 =?us-ascii?Q?I5CizAqvDDCX7PJ9iD445yL3D5l3pHHF1+pFxtOfv31BmQOiLui9QVmMW4tW?=
 =?us-ascii?Q?n0RLThglv5MztvJfKAlTj7ulgCnz89aacN5bjcgCoz+t/mU0pKKQ7l7Nh31l?=
 =?us-ascii?Q?TRv2Qx29lN5gdkuiRodeK1kc9KXE+ighHBl7oKIyo73e+sF6pDjzBfAKzCl3?=
 =?us-ascii?Q?Bw5dMeUkeadVAvKisi+6Io2l8fkfIBE/PmmbrqIbezNlW/OvI0eFeOV90nHt?=
 =?us-ascii?Q?2OsGYxwy1wNb0r3VdaqSPOPvxO32WQ27QmcAB3GamflAO+nBEfcwbcGQ/ZO/?=
 =?us-ascii?Q?3GFStrjQDo6JB2bSMpsGIkAgRx948Zi6qgcp/hw+CZLT2IEVb1jowpCZxpFF?=
 =?us-ascii?Q?OYs9uuSNQmeKJLi9nKhGziI9L2cvFASjRO+dCqJUxDLC8moT50wiVlGBKq2+?=
 =?us-ascii?Q?PyNLrt+wY5pXNcC6XWqTUUlmPPg6x/kloWvob0pL82J+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/IF2PqEOjTE4AcXU3O0mxtCwT4fz5cLSYSY+9VWpkDjrCFgJjdyUC5D/qEKg?=
 =?us-ascii?Q?0q5w7TUzvNc1y1HkvskTZbokmpLvfDFgThCYGysLSK6MwFXhSRhb0UnkZ26r?=
 =?us-ascii?Q?kODAov5C1GLi5PAtI1fuzCgCLDMR+x4lg3L8/oZliQh/iRIeXdQp1lh1C3pj?=
 =?us-ascii?Q?5cynszcWf9+/FAwyVoy59K5knVVV4zoGa21IuLtj15AW0fhmZn8BiheNGwp1?=
 =?us-ascii?Q?sNvyUJ2cKLqMms6sFwYlJ7djHD4hC6tJiefuLgugTvlidECMQSnOn4aXiLnz?=
 =?us-ascii?Q?ZWJlCq/u1EAjmjRt+QJ3RjU5ozwvaABQSYCV4eu0H1CmGcmoFJ+3FcyF9Maa?=
 =?us-ascii?Q?LQg/YwVXHiFNXgQym7mZuuhdHDMJDrld8lir/LCgyGRqOKQYNltORL8wKsZv?=
 =?us-ascii?Q?rTbzv4z2oHrVyGTqssVqjFWsiNjdot7NEWobT9Rh7V5a6KWe9ovoynlg6IBC?=
 =?us-ascii?Q?ax6beKAg0ZMLt0YtOrtyt47r8GV/3d1u0Ik8DNYHSBMGgDTTWs/c3MsKFrZ3?=
 =?us-ascii?Q?4vOiaaB3g5Z/j38BnNcthoNwkBv9GU0p6qizhobmrGcz/gu5gckWU0vaLE+Z?=
 =?us-ascii?Q?e83KZ93DMFdGpnGHEtGW/SKyfqOrmME3MlzUCE0qYg1yBAgpZUUR/2menANC?=
 =?us-ascii?Q?igtQ9frwG6MtI0a2xW03p26JSPBxIATa0+a8fJVqWzJqfvlgUs/ovU3xGWeX?=
 =?us-ascii?Q?QQrMcbLvLJkm+HPiR3RKqdyTDTdfbfIKz4JMgdElG9844nlcqo86qm+0ns1K?=
 =?us-ascii?Q?u0UfOch+LQL51MmrU/7FcMYZCIwh3ZumwVSSkJ6EUTQAfaNni/rDxsohY1nU?=
 =?us-ascii?Q?NJ6msdzD6v13jWhv1AxDMw40Gk7MULUZmuKlYrcQZFTVVd0BR9cDjGUAA9tB?=
 =?us-ascii?Q?p8PQLJHxRUqTeGrIjSy2tcuaTC7m0EDMuzxoy58O/mVCI39AhVVn7GnX2PcZ?=
 =?us-ascii?Q?XJXNhMq0iet/ViVCxFKgNRsJlYnFoJKmBFue92vCOyFVhtvZFzdmtDUyU4Mu?=
 =?us-ascii?Q?6HkglIKlgwVYM216cVcLE+JN9MXRQxnh1P2fbkRziJQ8NVOHJCUdEXas+hx7?=
 =?us-ascii?Q?wiGMHLSguPmmI/g4tDfXZAvULg6YfjUJdv1xL9iBUCMwZvG33lz2pBPpe8rZ?=
 =?us-ascii?Q?v7HiWU2KAhhwUMjHIZ5ZFO7E+SMNl3mW0TUJBvZUdtAFV94AzHnwDCXbbol1?=
 =?us-ascii?Q?1iiME5Jz6LyFTlLGgoZlgh4E+k/1EJ9sbYlMBGjaLcn45iXIhepC0FlRgCpC?=
 =?us-ascii?Q?EGJybJGvWfE0cKH1LlvukvpZWKygeH0jTNIfGm+eeRUq4DPhk9ptRCXvmxwL?=
 =?us-ascii?Q?ToC0P4n9Naqf4w7GXTyEMF9TmuJ9ZjuqpewS3GQBfiuXX3QUnXNKtqEQ1qbi?=
 =?us-ascii?Q?fc2b6VHZPWwISF4TvVZOyPwefhzi/ZLZkTZ54ZXMEk/OJm4Q4FCjrp9lFXDM?=
 =?us-ascii?Q?vvrlFkPjBx08xeaVIBT5l/6glVUAoHfavD59IAh2I6IKb8/LF+MkbHMvMQdx?=
 =?us-ascii?Q?itX0Eje1G9sOk2JoLExkGH7iQjgNEnrHbtDRk1KU6Y/8mpfAenT7Ew9qZ534?=
 =?us-ascii?Q?epDgTYBx2HBCkSPdlqGJasq+7K5OGdBszZ4P2zBfC1FJgMnyGN4VJq3fXbcU?=
 =?us-ascii?Q?UExjQYQR4DgpIUyca06GD9+Q+jbCPNS3yHAsm2F8oi3KuWE7THdAw/m0MRF4?=
 =?us-ascii?Q?m6YIcO5/8rHthIn/kz0/ltDyIkG6ODBQuw6K1jhTZ9fMcA6ipi9mXZNIF3w2?=
 =?us-ascii?Q?UHviF0yYtQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de909f2-1ca3-4430-b9a4-08de57d76b37
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 03:53:06.4733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2OX0M3ajZbSvWQIMpB4gWYHfisxB+q2io2FpsehfiPiYqqSbyem2znxkuZ/9opXHHiXdEKBs9Loa9E0PkCaAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7343
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add compatible string to support AUDMIX on i.MX952

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_audmix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 7981d598ba13..40a3b7432174 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -444,6 +444,9 @@ static const struct of_device_id fsl_audmix_ids[] = {
 	{
 		.compatible = "fsl,imx8qm-audmix",
 	},
+	{
+		.compatible = "fsl,imx952-audmix",
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_audmix_ids);
-- 
2.34.1


