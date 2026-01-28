Return-Path: <linuxppc-dev+bounces-16346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB3gC5m4eWl8ygEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 08:19:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C549DB14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 08:19:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1DDh5K1tz2xjK;
	Wed, 28 Jan 2026 18:19:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769584788;
	cv=pass; b=TQM0Sgfb7k9RqTTlc5IFHQ3sHK5+0xlLhNLPR/K2rnfeT5+Sjs6wPccuYH37i4kqOgknXv4sRVa1h/K3OPCpj+LBF/bj1DhuDtCI9imUurQ84bsSAFYJyNfUN7A171CD4xJKrkdfygquRqg//+GDm1Kzgy8RkYrf/0XXlHlmOOlfQT8kDRHOF6OOmA9hDffnOzQEP8SAnpMrFLRDPdEoy+0NEJ732yVaDuubWgT28LkJoRlvRA/K4/zMjhxiCyAk6dCGQKkbIuPz23+d8rmPzvSHZGbygsLxsa+kuMRlQppg4M3814YpSSq5k1DQXjzgrEmkQ85FINTPbx9AeMhtpg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769584788; c=relaxed/relaxed;
	bh=KxFV5SiQ9/WLg1dwoteabUvEVD00CUdQ1hT613TKJe8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AaMNeIaMsLDSfi4dmC65grX366dDjiH/Uwae0wFLgO7QtaartRu6W672IItYgWdnYHwyHHUKEXqJ4u6CWBhRh45SZoo+PvXRjVjKOY+VviTnH7d3w1RfrRZbOeANdKvcMZKXQb4uIwkHvH7bk6/LjpFmawt7K1ruvpxNF0e7Pys3cp2l3a+Ma37A2qh3mlLa2s3EEtJEcbTDLxycC4IO5EovbykJFHSCMUm+x/g9QGnAXG3tMKlQhT5v9LDQTSWwV4UpE3sYhup6ky2qeMqUTY8nUINFd/0iAt/nHpGayLLDaZxX8WN68Ec9rA9KMAtKv8n4rwzAofp4TvWx6xarsA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=NWe9fNal; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=NWe9fNal;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1DDf5T4Kz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 18:19:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzQnxKFvlBj2j/nJZu19moBPgMFX5PgDuBW9MHKLO7Hsi8ooZsLvKWEKWS67rYtpgxayD0hyWIZbrQlBbRaQ6mjtbVxl6MBSy68ctQyzMi/7KfwwKGwg2C1R18iUIkFbRXtumfh2tZ1C6rJpyoxUUovf5CozElrpsKRjxWE1iSqonKH5bNcjyVHvsVpDHWl+wgiLzrnjkJf13xBDNEyxUUt7D5j2q/gjAHnnIvNdKJwJE0+sphVH0IgjfUhbE4CXGAo0adULKFJ7O3qmJ4DCZ10gc5I4dP2GpdaTtVWD3Kjr/FYXv6/UTEdL2AnLeoJHbOM6plkKYkzri+Q3+5nBCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxFV5SiQ9/WLg1dwoteabUvEVD00CUdQ1hT613TKJe8=;
 b=s2j/TKoE3b6zNiECore+tktP8JV1mx5X5RGDad/jDO3QUsJcQKQl4Zt8zJ7X1AZQ/k0MUsxTpE4joyFCiNhznERj0/mKYDPwLu4Xo8CMimy17dAMNk2p4oSOVOAYtQt2XcfsKJV0/FZXAiMcdw9a9qc34E7vR2VePoYGAbA78ydDV+BTdtXox1dReMVqll3+cHpoLy1QEx2X7uFFjmtoJkoJwj6Rw8gmU0HIesTm0KG2Y0vFJjg4LKfBwABkbP0ELEtwzQdBd6/QIafItjgqcRI3CqApMB5la9L3/+iMPnL328Xc4C2Koj01cqr9B15VK9WfQsuwudCRYJQckJDcqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxFV5SiQ9/WLg1dwoteabUvEVD00CUdQ1hT613TKJe8=;
 b=NWe9fNal4L7moQH46mr3XsEVQZqCgNa6Qvk6AbCySk8ynNLg/Qotlg+BywQ8CxBRBHz1ps75NJtZtlWYOWTPQD8ZrvexpyRfKolmJb9C8cbAd1Df2JGfeLmbWo5K8QpiL/x+CHHx66UFXOrxBrSHo0abvmZMZafAOJzBdOPci2N4VnNtUxPRp1YFfTFy/1xpmRQ5xUxPT88Ce0/0PyA9G04kco0IvV7N4m0TjEWUUHVqgdQxuvyGVVB8aSmr78k1Roy8rKHP9s4FDAY7523gRZqJoQ2N4zcH/cZbNn+4XAMO4ulaCksqAiVXCUOmTXwDXQjNdDHW2uT7Z92Q8KjtzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by PAXPR04MB8687.eurprd04.prod.outlook.com (2603:10a6:102:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 07:19:21 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 07:19:21 +0000
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
Subject: [PATCH 0/3] ASoC: fsl_asrc: support the i.MX952 platform
Date: Wed, 28 Jan 2026 15:18:50 +0800
Message-Id: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
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
X-MS-Office365-Filtering-Correlation-Id: c81562cb-0157-4bea-9655-08de5e3d8e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Kagb22ZM9O7faMJcrpJm44Brd1bonnklj7+IoPHaMqfimNPLRPOeHlpHsZZL?=
 =?us-ascii?Q?QiWhKxLXVd3YqBE8GsTkC//ISyM5Q+Mwj66E5M6bUdbXgp+R5PeXViHDrY5L?=
 =?us-ascii?Q?0xLqcDitinPRTZb0GnEIA4dxLvn2FciEBOZpWgGqIBm4VDhATbVE0BNUVVpX?=
 =?us-ascii?Q?Yyvg53xdeld+YjMhIjcxcKQ43Y6JNV81sDgB9GNu27WhHsLhQolnA44Csj/N?=
 =?us-ascii?Q?qH9lFRGIUvcOToRIpFECkcZIxr2gmk+5cuO/nCxcXNXHJBdS5k/cWdiy9VUd?=
 =?us-ascii?Q?Sxb1E4cyPkRiV3LyGDy3yDMI5DXtO1ykOewCBphU+QsTh24UEqYblmtV2/2B?=
 =?us-ascii?Q?Ok/PquNBbJO6WyTNTv/ufkdBFYaZJ518V9wABvFpkYN1yPGRuCWnG0plomaB?=
 =?us-ascii?Q?x7IaIplYQBxH1NNodjYgtAKNwenhzcuBmLU6Tr39siVyARpOqtSPeJRSQGKI?=
 =?us-ascii?Q?U/p51sMZ4tqmaa4uXbwoZaVZi5dM2iEVPn2wXtxDzmPYqiwLqHweV5UAdM75?=
 =?us-ascii?Q?fwIvO1iRkqurQWYBnij8SRFkX/fVa66eWGp/OkzkkjDlwkpIWEyWl4Zu43Ux?=
 =?us-ascii?Q?y55PnTMcKeO6kzqUVaRTuH2bexrdQndCpbWCEEkMCM+uqE7AY2wrvTZJJ8Ju?=
 =?us-ascii?Q?dnNFZTS+G4yhbVUa9G2LdWCb0It5/1v7i2qCbGjlLUoFTTG8vMi45teK1ibF?=
 =?us-ascii?Q?Qq/fG7jRWldgcaHLIoAeloNIS0AgGwB4Bc4E3coXeUE+6aKN2jTb7vUbGp/O?=
 =?us-ascii?Q?RoCbUFaLw3WpqR2qQoopOT5Oy8BS5CsYKCR6yA1vWxH95p6+A30SikE23FZY?=
 =?us-ascii?Q?+esuT2S3c6j6g9G0zQVOIucBPNIxarSYkHM7yFe2Tw9BkpBoT1wvwQclaDPD?=
 =?us-ascii?Q?OFUMAwg2J1YLvZscWUcf1YOtZAkvBdNq+HEcO6fy682O++ujXmckcjVgJgj8?=
 =?us-ascii?Q?xfUl0mtixpV1weVezSKEKTH6UCQFvXY1znsgVcRz+qQHQYX6D8J2VRAb2QUg?=
 =?us-ascii?Q?4UcaRhWOEXw21UAwyMb6UL4/2FXW+yQhpkAQ41cQ/UV15ygFR+3rZ8yN+sqK?=
 =?us-ascii?Q?TLA3OLDm+Fc8i43uh4EH1uh/KA/6gc7eJdoJnOciIFeW4i4E8WqoFos+hS4B?=
 =?us-ascii?Q?l9tL4TmfGYU7lBLNnVEmZErrjrlu6Ru8Nw2gdL8v6oHY1Zv4fFPa/kHg0ktm?=
 =?us-ascii?Q?0Klttf5aJQnl4p7IJeLFSENm+6sV7JBsnQq7NjtgqmFitRip0+Ay01Mpmuin?=
 =?us-ascii?Q?RGzj64G9ZzllEmQGQ6C/B53x1wDNQnUauNNpnUEl/P54i9xzf4Cv9l03u9dN?=
 =?us-ascii?Q?6eVaZ9Z6L9RvZ9uvo2/UIkhRMjJ7CXNLW8NpMIrtDb1EBHOKvKQJFcr6PlOK?=
 =?us-ascii?Q?hOE+9OLkp/M3IJ/QMwP3PbWUDnw20r+hYxqvNRyseTiP/x7l6FcvbeMyfunT?=
 =?us-ascii?Q?Pac2D+nyNMQ4cRfP35V/98aoNKNNCzuso+o1Jo1uFEdjPF3jI3gBrCPTUOSO?=
 =?us-ascii?Q?/OhUciJ5qLGTC5+XQqTW2YWgqMAnUlqecKZIqd9PDYqHdabLtFZ4VU43eyNu?=
 =?us-ascii?Q?3fS3vnbqLzp6DtUE3FfqySSBmGFMulR3rHV4EwrDsYtRFOdkMxPLsHdrzsxF?=
 =?us-ascii?Q?F5BRrRGuWJ0QY40FmjvGDEOp4aiDj4mJ2VHYtYRyW3vE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Usu4bbh/wj4mOHaz04yppY4wsg2odtZ6qwDzkvTBXuXHwxjmDaq1XxxtWU5P?=
 =?us-ascii?Q?BLInbg70WIHK9FlmyYsZaE+QfPH7SIQjZDVc8WDCAXOllnx9mgqXnIZMMGzB?=
 =?us-ascii?Q?SmXCb4PmFPU8BIeHrHrQu6/+j2SB8e0mw7WyULCDRDEFobfAgqUN8b46ncL7?=
 =?us-ascii?Q?O94Ahh/pRwe3inxpO82wqY2uTxL6VpmQqJ8i6XYBU9Zz6p/7rOn1FAGgPPPI?=
 =?us-ascii?Q?VaGVgtxOG191q7e6xPuG2cWs0HeBvQggr0lcR31f3jnEKXzuMfbBfXeOCtqb?=
 =?us-ascii?Q?RqMnfitpngxhO5QJ5JYKnTxJrqUh8lqWCttv72szus5FyxczgoaLpQmdd7Xj?=
 =?us-ascii?Q?HZAxFWacLwyVNs6CFSoE8C9VB2Y7Jiwl2DJzTx1MrnZ+0TFmQRmpWOSKeqAv?=
 =?us-ascii?Q?LAhE8C40fkKysAj95xkZStWtkkrvHCfTdk5iKHMz7eW/KOk3oAwumF2bvd7o?=
 =?us-ascii?Q?TlgSm2SnWwck62SaAEzvVsA2cNhgio4yLwhAQbJMf1ZhdnDKpE8ALDhllgwF?=
 =?us-ascii?Q?LrDyFUfQ5o09J714H7wPkE2tUjbWTZP7Biz2H82g/RuDFzmWIIw4tMCFTVWB?=
 =?us-ascii?Q?dm9PHfmD71TR+QbdrKeh0o4Ox6kQS3IQQ8J7I5nLs0aDhiTFykDTDSrOiiiN?=
 =?us-ascii?Q?6KKinmiQvwOKO0k/RCqDAW1k2/diYQI7pRwEC9tUEbMGnPXKcVRDHNRb53IN?=
 =?us-ascii?Q?M7D8EfZTZiKQlSgd/92xckjQtYd9VmnOD5HnWFRj86UJP3I0SmsIDuSTIHhi?=
 =?us-ascii?Q?n5ldwpfToKz2sDGMGdJvp1BEfyuAVrRLcI+XsRGenD4gZ4ptlnmpy48+vCSL?=
 =?us-ascii?Q?0kW7sigzKqtayAtylVLxX4VRLn3E+A8Ukgp5EYK8s+mbUakt0tuA3q3ofRVn?=
 =?us-ascii?Q?t38nqi7nUUs6Eu+LXixnpHAxAjAWv3kAcRSqDkukT4Umv3nSxsj4HewT2qRk?=
 =?us-ascii?Q?SSnrD10HeVSPI+mDAiPRSepw5JGYh+gfwvD0rrkdXyAM2Icnt62I8hbkeAJL?=
 =?us-ascii?Q?PBP+ktXnSK+x/bEnR3kIuGOWn1zkuu368KEJ9HXiFieGKNvPieBQIWF46dMr?=
 =?us-ascii?Q?T3tmOE/zXpPbpQQwbst2KbEnSiVJjnMQDp6V5QV/AlmrGZ5dClW7zg/laWTt?=
 =?us-ascii?Q?gXFH1MmZKBMReF70u6e6dFn09blmejxhhKFO4Nc1If6/4ly/3UYfQOjVAWg2?=
 =?us-ascii?Q?I012tzskzJpDRNa/0qG/JtbHn/GM1dY7cdvo5DvpHUDLC6Vvvov5UQeVivk3?=
 =?us-ascii?Q?czlAJ1kciSieHpxFm6xJmqxUYnzR2ntenqpSrCzcPIULhZCqo220hJ3rv75P?=
 =?us-ascii?Q?ujqlOrpHWFdDqKwPo3AVAidgs7V14szC+NgBn/rFUGYHIV6diDTMzzxjSGwF?=
 =?us-ascii?Q?4IkqVIqMARqho7lq7hPNGb5Q4RDMX58K4Z3iQh9XgWAPATfzhlrJllufDoo0?=
 =?us-ascii?Q?Be+ey1m3b2OleM3/eujdtw+EnjVyprKexppJYxKjdoYzwQmyFlefbUPgWZT1?=
 =?us-ascii?Q?uxcbHqvtryibUdslAyWz/OKmcW/Bw3eLapSV/5WiQuxpqmGHb+nINpjrPfOz?=
 =?us-ascii?Q?b3rVCjKRInJ1egY6s4Xtz3CNs5xQ+303jpyT0iV1MGns0qegcJoFRXk5lT/w?=
 =?us-ascii?Q?S7A0v20mB2RIkSDUI2PBVfZoBdw4yyt7YkDzigMKDpXJ8GHwVLJz2C8CnNo3?=
 =?us-ascii?Q?Vh8SWo1zrZgaq6R4c0vYGlRpxTRuf9yRgJhOR/s/x5ekuzeGRS1yA+oSWurP?=
 =?us-ascii?Q?vA20iK1PrQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c81562cb-0157-4bea-9655-08de5e3d8e68
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:19:21.1777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ew+phHAsCzVZvAM1V3qkof2PpZtvgm1WdtbxfdyWHnBAF7x/cAfYmT12a/pPIewFDjpE4ezx48H9meB9SJP/ag==
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16346-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: B4C549DB14
X-Rspamd-Action: no action

Update dt binding document and update driver to suppot ASRC on i.MX952.

Shengjiu Wang (3):
  ASoC: dt-bindings: fsl,imx-asrc: Add support for i.MX952 platform
  ASoC: fsl_asrc: Add support for i.MX952 platform
  ASoC: fsl_asrc_dma: allocate memory from dma device

 .../bindings/sound/fsl,imx-asrc.yaml          |  1 +
 sound/soc/fsl/fsl_asrc.c                      | 39 +++++++++++++++
 sound/soc/fsl/fsl_asrc.h                      | 16 +++++++
 sound/soc/fsl/fsl_asrc_common.h               |  3 ++
 sound/soc/fsl/fsl_asrc_dma.c                  | 48 ++++++++++++++++---
 sound/soc/fsl/fsl_asrc_m2m.c                  | 29 +++++++----
 6 files changed, 121 insertions(+), 15 deletions(-)

-- 
2.34.1


