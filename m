Return-Path: <linuxppc-dev+bounces-6967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0DCA5F68F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 14:52:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD87V0jPsz3c81;
	Fri, 14 Mar 2025 00:52:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2606::604"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741873926;
	cv=fail; b=Q4XVJYTSf6kPC6qUzU1QeeAnOXA17ECruLPmV9FOsJGKco90QplOJhNwiC7O2/FPD+6w6+QlhW/dKrLzwPA75ZijH6g5KJSVq3pmd6jZWWJ6FFAgtkg9T8vNu9S2Vt6ciMGEFUkY0FZQ+dMpNkN2ogGlVawu83Aw7bhznTq0t9/AmhP+qBVwH9GzRNn4xOjefQv6D17Ei7V0t2A4ywoOI7GEoBzDtAT0lLkMQXxazZUOH7rkHv9BAEvhrJYnRODqcpptcsAUkwEvP2BTq4EHSPp9D47PPui8GvEbn/I9oKCSKvfNlzj7S9dYeeeBmBm84Risle8bmhdCfBUCTclJDg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741873926; c=relaxed/relaxed;
	bh=RuImD1g+x/qsnuL4PMuSnn+mVCyez/VYXYkuQ3lTIDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fKtlKQL0ziSFwEfFfn/3XIXAVtQ/pjN7fWbiqMdOpqz7YJp6/aGEoEzRPG3TcFB/VgGp5AJZ+o9O7bEcdCvTW69KZFc8NOTnPC5cB9H7yTlIADVxWKmi4/rXq+Bfo5yMBzRgPihhGbkJenDUnRNQrVdo0d6utrY/3E2XkFEjlFyf1Cb07mNDLQPj9tXV3mswM7btuqYSkhOhJ7lm746fHf3ut9iofHJqe5fxDhvqzrUMCZNBBU+3g9p7G1EGAuMjlarj7Nu5eLW2K6th/HdTvi3P3VfYImsAFu8uuP6mLKwcihdZ87gD8zbjiTxeNmTX/55f5b48YhRaAb+yOaVtDA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com; dkim=fail (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=S6GtSI/d reason="signature verification failed"; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2606::604; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=S6GtSI/d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::604; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20604.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::604])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD87T2wd8z30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 00:52:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnUBEWXwd5XzY156ERmWwXdnrle/AKgp3dIKVXO+b2uBlpWJuoUVpwWoeLqt42VcqqVSN9UtFPwOSjD7PuHRLpLN4+8mrvOBll3Rj8T6YZry9waBU1qfnceyDHcf+yDuPEMyodf8eTKc3E9ojznH01esn8w18xVzqrzH7awaL5r6Zb/8aGx+eICPDWVscvpYbl+7aVHciaVD8w5Lb2LgHmu8ENI9UxieY/h/4YpicIRqvQz+319EEqH78BQZnn74XBWGU4pwzmsxRY70P/7DLgGPsRc/tNj9A1uoRoNh3wYacRa3hcOuzjTn1S15Xjp2SyqseMqkotMz+ATpdvXHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUp5I9bxDRXMsjAfEJ7jXsjtxjZLP9YU0HGEB/1/mWI=;
 b=cUK0PqH/k5cxPqhZMB8wL1FXbBz9bM6/my42F8lA9ghJdXGkfgqFuhQKDDQrQ2MyVyut/msyESPDiYRQ3P6Gu5Z3bB3MIIrrGpiZXuWOjc82SAzrC3mvnAIfK3IPpc64JZn2mZZzrFRLv5HQPCx7etNnh8eZyywj06QGzCF2K/Pco8SeVEF+lj08beiGUizGH1w3kXF1qRyzAqvhVMtDXg/xZLOuisR+hc47cRHyM65+k1Do/4NEPK3DOLTcCuPCKzoEwSM2GTDpNGN+Mv9vHe9OMDvh3PItz3oZjJnapwbKOBLkqrtSMktoLnNQPNW2+Bz2gcOExC7JJ0FAXSCgYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUp5I9bxDRXMsjAfEJ7jXsjtxjZLP9YU0HGEB/1/mWI=;
 b=S6GtSI/di9797Qc/7yno+0Nspp9/Zkl26l/uYNclvqDosKyQKGE5su6tooouYU5frONord2j5LSICuub3z3N70B5IYZTQ+pJGRzoU/XyvLHe15ynn5aS43rTTvlONBQKXGa4Dnu1uc+xp3OgxEYccDT8EwE9Ia+m7idoYWEihcpeqX7e0pHZ/2I/Eq5H2+A8MCHv6TZ+NmfM55YTwDWT3RbU0u3rnZAKuBCj15TUiEiUYrq2BIuaTAl7N6hd4w1XNH7sZJPGpbA7u6n4gmik6ggUzour5kKu2fxVcU+JWeDCa/i5Y5atSO5/jWjldxo+N+kT6SnK8NruihjNQrCdzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 13:51:46 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 13:51:46 +0000
Date: Thu, 13 Mar 2025 15:51:42 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, stuyoder@gmail.com, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Remove deadcode
Message-ID: <oz65tdekf2ywyzadbntuxntwxulcdzyo33se54qqdsddkogquh@bqnmsmqijfvb>
References: <20241115152055.279732-1-linux@treblig.org>
 <3f9dbb7b-6527-48e1-9028-b46e5a0c58ce@csgroup.eu>
 <Z9LbwRUsHwFLpBZA@gallifrey>
 <362f9392-f891-4a15-9ffd-5f5a6cac41b8@csgroup.eu>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <362f9392-f891-4a15-9ffd-5f5a6cac41b8@csgroup.eu>
X-ClientProxiedBy: AM6PR10CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::28) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI1PR04MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: d2accff3-5a4a-4d95-2f92-08dd623631ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|7053199007|27256017;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?n7d9ClzdfJ6mpC8REkARTPKTtkNyksyrVT/wRqA6wt9n3dTW4o5klE88ws?=
 =?iso-8859-1?Q?sTvhajq/xFl2pUHiJM8HC+OPnRdjY10S7AL7uP/dpArCbzjO01VHjD6xq7?=
 =?iso-8859-1?Q?vSy9ZniC73jqw/431lw2OeKraOx+QGEhdAolJwxKAelWVS1DDb4tq5Z3/s?=
 =?iso-8859-1?Q?/Fha7pB5B7FjVhl6mivObmLxftmUDgVLTYFDniXKEijFDoYNy+2tune/RL?=
 =?iso-8859-1?Q?/+dV/kudFIkVkeh3ko1qw1e5Awd1EtFM+zDkzb0wNqf03P5A7Ph/SpJfq3?=
 =?iso-8859-1?Q?9c2HOOPXZ/ItMA/a/HWI6TAXoLjNbOgHo4809Oh3C5GUB4Ven5E9vJzDWE?=
 =?iso-8859-1?Q?SHw19w/zv4x8vLbDGlVnSUWaE3N9KMaX8zjK4l/D/9WOR0yHeg6aerWI9J?=
 =?iso-8859-1?Q?1tvvXY2+Di1y1GqO+gN0o5B8HKICctQCFBtCCp7j7NDfAjngDCa/pDNcyO?=
 =?iso-8859-1?Q?peitxNlp54lCsRnyi7HKWzAUM9obHTy8rjdR6k5AiK2ms8ghp8bN/Q75w5?=
 =?iso-8859-1?Q?+cvOJqi4qAHDeC/Mqw1Rtex+/xBatrpxxHxUr7YKWuFMqfa2EOgxVLDJ6Q?=
 =?iso-8859-1?Q?/IxaCPczaHCNXYmjr4HwyOZ2hxdTjScvzNnYDO9xXfwAUTYI/AzmJTMrqQ?=
 =?iso-8859-1?Q?Wfiv0orVMGwIjPH9xJmQnztuVcR6IWsXL/3zeUYtDsWShjjsUk8vrYSTT4?=
 =?iso-8859-1?Q?FMM6Ugk1C+AQp7MkDWSTB24gT++E/K/VKpT/nwUbHP+GeyjM2CDUlhvU7q?=
 =?iso-8859-1?Q?Ui+pM74J7WS9+XZRxayXvKn7cfh5NSNvLP+3dzFQwm189V+biBZqC7ZmwE?=
 =?iso-8859-1?Q?oTcxEWHgu8MUwijPde/szUcjFBtLo3rpZNMq/DuEQc7ESjl1ByT5vTQrvI?=
 =?iso-8859-1?Q?ghV7104x6bK/tdeB5jhuTTd59HQmxM9KxAnRf9tyC8O0e/qjxsDwiv7gXR?=
 =?iso-8859-1?Q?YXwxCQE98LSTCLDmJdNzWau6xlvxynrQ273f3QDMVSTdWU+S4RhIHzYTWq?=
 =?iso-8859-1?Q?raIrP2R2/GRYDDfjWNhO4gaXTpeGSycqus84ICNDs/Futjsw9ylAqSdDCO?=
 =?iso-8859-1?Q?CyRtRmStrFlIPwlzMSKpjITvYlQgUiklTAbc+3m0Ayhpx3F5ij1OvsTinS?=
 =?iso-8859-1?Q?OLqpyL2cGbkMmaTjzKuOOpYqmINUhGrs6rho0966Qr6g4Dv0KS/FRUTqoJ?=
 =?iso-8859-1?Q?gAcIeajMXlY/Di/56Oj6jVsO+hmkTpiaeaDwsMi7fSXHktQxdVeYYBM4SQ?=
 =?iso-8859-1?Q?rhoq1e6HiG1sw9m/pvi2PsulIhBbBCMGtSG3GDzGhnpoV5KkKJprFg+MPI?=
 =?iso-8859-1?Q?gGsu3KW5MH/XFEmt0N41pu2z2823kvOmW7ztC7fFtIvmjebYHKBbWkg0Wt?=
 =?iso-8859-1?Q?37LUg4A8CULrmfByVqKlzM1t0faLKX6WA9jnYd5b7mqvCJ7rD99F6OUmlD?=
 =?iso-8859-1?Q?cMlYOkW3uXUR6wDKO8fd5RywqOVqJa4TRVPDbNTpGYOR2MeHkSfd/etQFE?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(7053199007)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?hilon3FNFlz5K+L9QHfczcKb/zzNhzAmxcxd2RrGJ6dwBBPwUtkaYW8e2v?=
 =?iso-8859-1?Q?D0Na+Mww0mX3PmSpja5kiuVw3Q3IceS4cUdRpaWBGe2c6yLVeHD0bxJh8p?=
 =?iso-8859-1?Q?5TTjbaNABI0aHW0XybUVHEOWEoyNe7swXuq3ru5HOsS2+5XPfekiiVjkx5?=
 =?iso-8859-1?Q?e/E0rvS4HkPBF/rZWQCIPTSe2JejxtjmYgYIdn9vBMbs3vh47TxQiwEQ3A?=
 =?iso-8859-1?Q?XGwm/3iBLCsRq4T8/8cgjfwC0AEiyZ51MB5bnKm4ScqiMWF2TWdrQLxCbC?=
 =?iso-8859-1?Q?9knBh50dqN9Cq0/mOAKS/uWp8nuaLG8yubrvfWPdRcaJMnvQL+Ow/lmyTY?=
 =?iso-8859-1?Q?cbxuVAP6Yc6WRv1USqhpPkMxg5qTQCLtXPUOGDdV2TmJgC9ygjNjgfswsc?=
 =?iso-8859-1?Q?6DA0+jOOKdAEZF487gRLl813dTvWq24OIwmcjhMX3MZkW0y2tG8rZFDFs6?=
 =?iso-8859-1?Q?cDKVLjznUPzqsRWnSaoNPhVjs09YezHSNEL9jlRtSlpmIk8uz5oQJLSSkU?=
 =?iso-8859-1?Q?VmeqMc4ULnG+u7lfyzmJBWNRnfk5U24PADAeSmq1XoXo2AZeqMqWLN6zzn?=
 =?iso-8859-1?Q?YxzxBDm/F6HTqLqF+4QPUB9nhhkUA0X5N/LzLbEDWd14G7/jl2GvzvCd1P?=
 =?iso-8859-1?Q?X2DH8aw94pvxzMUyyRoTD7kh4XCNT73cY3Jfa2PMtMqms/ONf1Hll3Wzjl?=
 =?iso-8859-1?Q?ILmCtR9gbQDMgAn0ppN4vTVjVubJPKt1uEyaQD4GunW3Xxomix1V/tY04o?=
 =?iso-8859-1?Q?FZbSL/E8uScJ7ZRe3NkF5cubo7+VWXe0mkSyVRJ5+pX0V3OuqfpRW0wLHl?=
 =?iso-8859-1?Q?xKyX3eawHgXafFH6r9yFncjTBlFTdylRmWI7GNa4G8CQzoLNsN+cqgkV7v?=
 =?iso-8859-1?Q?eUdN6Pg35JrO3CNtKYRMhG2HFiq2pfnqri5Rpv8WJBkeK+Z8D0ACNaOxxV?=
 =?iso-8859-1?Q?tSRMBfNKYf/w5tXhgv0RAQfn+CsIC7kDpvRNf9TVtiyyjYNfjdXw4xMXE8?=
 =?iso-8859-1?Q?n4oUFaXlivf2EaCqc4M57f5EeZym5m9t6i0UvteIDdvrGPHV9xDSh/3Gmy?=
 =?iso-8859-1?Q?0Yc2e+yCMq9woFIgWGDPvIuFaDVOWI62DEHmZl451eo8Xkh2VP8l9krIKn?=
 =?iso-8859-1?Q?H5GV0zg1tE1enGbepfe7eK4mPLGnTHY45BeLfpA+QqAsa3xLzIwblgVExL?=
 =?iso-8859-1?Q?kj9YiW0+WaM303LBBE0ieMj3JE9frs0IpYY/SD4LVD9kmbWuRCt5IQWNck?=
 =?iso-8859-1?Q?rPn1QX5QlPxBwLemXViqYUUmo82yu6dfqbsLPHcW9eu+UAuZSlUWv5rbW7?=
 =?iso-8859-1?Q?jG46ua4P2ERjsa9re+u7N3AirmnXmrxnj2ZkxBsF5kkWh81F6mQHrVezJv?=
 =?iso-8859-1?Q?29lt6Y67ayK7P8tgSQXJmvY3RlHdmDM1BJ6NjlFRPYK86PKLFeFwT0sUs9?=
 =?iso-8859-1?Q?i7jl2yzS6fbZIUWLUAAlrTIz2mWgBtg6LAuvmXswBo81SAv1cHQcfSR8RL?=
 =?iso-8859-1?Q?6kDepWMlkB3EGBYpC2zmiGNAHsMTwFYqAJrW1Vu+DAkX8jqetDxx0NnxhY?=
 =?iso-8859-1?Q?VRRIdXIIwzvCpxRWj0HMHENbmh8cjBuTpD3qi9LGtfTJF+EUftKdUk0cIe?=
 =?iso-8859-1?Q?CeS3kmTgTPXZKm6KQXTueXdE6e0PkAD0nH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2accff3-5a4a-4d95-2f92-08dd623631ab
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 13:51:45.9849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXHJ9/TsAcFLrPp9pJgzeO6szhfQi7nJwn2L74QbeeVWYNkJ/qJAxfH5rDBbP7jTyGOYNF5H1XoxAIfpFqqJLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039
X-Spam-Status: No, score=1.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,FORGED_SPF_HELO,KHOP_HELO_FCRDNS,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 13, 2025 at 02:37:56PM +0100, Christophe Leroy wrote:
> 
> 
> Le 13/03/2025 à 14:21, Dr. David Alan Gilbert a écrit :
> > [Vous ne recevez pas souvent de courriers de linux@treblig.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > * Christophe Leroy (christophe.leroy@csgroup.eu) wrote:
> > > 
> > > 
> > > Le 15/11/2024 à 16:20, linux@treblig.org a écrit :
> > > > [Vous ne recevez pas souvent de courriers de linux@treblig.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > > > 
> > > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > > 
> > > > fsl_mc_allocator_driver_exit() was added explicitly by
> > > > commit 1e8ac83b6caf ("bus: fsl-mc: add fsl_mc_allocator cleanup function")
> > > > but was never used.
> > > > 
> > > > Remove it.
> > > > 
> > > > fsl_mc_portal_reset() was added in 2015 by
> > > > commit 197f4d6a4a00 ("staging: fsl-mc: fsl-mc object allocator driver")
> > > > but was never used.
> > > > 
> > > > Remove it.
> > > > 
> > > > fsl_mc_portal_reset() was the only caller of dpmcp_reset().
> > > > 
> > > > Remove it.
> > > > 
> > > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > 
> > > Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > 
> > Hi,
> >    Can someone pick this old change up please?  I see the PPC patchwork says
> >    'handled elsewhere' but doesn't say where.
> 
> MAINTAINERS file says where:
> 
> QORIQ DPAA2 FSL-MC BUS DRIVER
> M:	Stuart Yoder <stuyoder@gmail.com>
> M:	Laurentiu Tudor <laurentiu.tudor@nxp.com>
> L:	linux-kernel@vger.kernel.org
> S:	Maintained
> F:	Documentation/ABI/stable/sysfs-bus-fsl-mc
> F:	Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> F:
> Documentation/networking/device_drivers/ethernet/freescale/dpaa2/overview.rst
> F:	drivers/bus/fsl-mc/
> F:	include/uapi/linux/fsl_mc.h
> 
> FREESCALE SOC DRIVERS
> M:	Christophe Leroy <christophe.leroy@csgroup.eu>
> L:	linuxppc-dev@lists.ozlabs.org
> L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> S:	Maintained
> F:	Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
> F:	Documentation/devicetree/bindings/soc/fsl/
> F:	drivers/soc/fsl/
> F:	include/linux/fsl/
> F:	include/soc/fsl/
> 
> I acked the 2 line changes in include/linux/fsl/mc.h, the main changes being
> in the C files which are not under my scope.
> 
> Stuart, Laurentiu, can you pick up the patch ?

Stuart and Laurentiu are no longer at NXP. Even when they handled the
fsl-mc bus driver, they didn't have a tree themselves to pick patches up
but rather, historically, patches on the fsl-mc bus were picked by Greg
KH.

Ioana

