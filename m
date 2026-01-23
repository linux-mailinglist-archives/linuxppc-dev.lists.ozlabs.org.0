Return-Path: <linuxppc-dev+bounces-16233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CkLC6Nfc2ngvAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 12:46:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3A475553
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 12:46:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyGNt14hMz2xdY;
	Fri, 23 Jan 2026 22:46:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c207::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769168798;
	cv=pass; b=WFFNYQCHEu68Z0jxQHsrGCA35++hBWjsEEgED3KDbX3PaGzP0bqHMNs0e4OuAWKBQtDr6UOQRp5qg7fYmNWjPELO4pMydlxbdrB4N2m/Bz0qunMLiPxX7dWRLFJKLhes2CG33uoF+oPUEvZON0d1VRPVHWU1zlKCtLQpRcmWxmH6nOGzFX261jDPEnL8L61tsmROMYoQkTMIA4zSR3BbDXBBMcnx3hQM3xmHh7c2kB+xceM4Zai6p+ahCDCREFsj4X0ttydD519soG/IJ3vrMj1UM+D/A/pW8pZ53dFVik1kFOXSnXSoOjsDa1JzSnVOJ64lv8LQ1n9+FiRYs96clQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769168798; c=relaxed/relaxed;
	bh=+iswR4dwEUUtoElnRbXGSFv2Qmh/UT4ttXDbkQvlrX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vgg9tnEqJn4pny7/dZIhcUS3ZcHycXk6Xrb48REUXu5eVL2aeGvzbbnFUuKOlm/O1YwdAXl74bM4leLq6edKLUe0hkF2/CMc2jnyKJ78ahyDwHZ/peIqkUA2hGiYbsbib7Q8TOveZpvhXgGCoiumSmaDHPN0NSGFNKdi/EFKi0L19E+g5X8xFV2E08s089nuuKIST/r+kFs2DZ3DimFAk5D/0YGtZKhBgLRUGVf3PbeAQjYNseRgD1pZ8ASxNwHft18QNqABg4TyumeDkk2Kga8+Ih+kXD1zHAOXOsM4CpgKCzTvavjNFVn+g7Ad2CSeNfyD2d3I+84faNPKsRUSig==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mkEv0HBU; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=mkEv0HBU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c207::3; helo=mrwpr03cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyGNr3B1pz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 22:46:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tl5BspXFba0XC/uZcTseRktUm8iobl8b8XG1TnUvguJ+kdajFAF2ss1sYwXBytKqi7wGLfSu2BYv/BTex7i56zsacHeHAYsf5LaevJDPNLIQaBZgohwJUGTXjECmI0g7oNs0jMD+uTtezIGt3jiB6UsL4jRq2qTMMQbPsJzMP9xHuUzGXBK14K4wz9n0Q9ym2BptyWqF4YAufJf++Unc4j8M257u22N7f/OnsRDmJdsDN6LmMXp+FZW6T1qBfoYtT6dRNQb5uYXGLYthypAlsctZz9BUAJ7xRg2U+ThRHrqt1ji7/UPO7ePWveqJj3f0Y27Nq4+40BKMs1IFTsNWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iswR4dwEUUtoElnRbXGSFv2Qmh/UT4ttXDbkQvlrX0=;
 b=mF0CXmBep09uKX1RxNfFujmiMFq8BrajTG4YbCtnDU11PUlAFYn/jhEYNXwBjV8S/t1BISWFCnymZs7jLhphdhyN90cqX7lTgPm3CEEpklqcD/ygrvaU7Ryac5JrnhOib3sB8IH739Evel0wP87jWDF9kNO6glbF3s95kWC+Ld8eK+FoN3QEFRr2Zb2tIgglM7Y2yDQRG8lCc3vhtInjIjZrqSPQvt/MFVZX0xfBOM1uuevTt2K/9y8qnybto63US1QdhMviUoS6z1ufZMIq7Y7FVj3gI2DNqNiiX5Dtt0sFPsaibRBM200HfEITDuUqIdKsdDoz0mgm91CzPk2reg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iswR4dwEUUtoElnRbXGSFv2Qmh/UT4ttXDbkQvlrX0=;
 b=mkEv0HBUGbjYfdJCJr/QpoWqLBe+Bph+oVz8XXs/9H3BVd1QhYWVAMoHg8sP30bKRZaz4MFbfchLfN7KEUyi6MaNGGwhD98UWjE1z6krkgQcsa0heEWRGqPYs6b1e9vmIsNR2UCQ8L90Cy18CnyUBQjkxpG7GuQLu3AWBSJjnfzN4+w1V8w36RVmn2XXPhwWzzMDcmP9RBp6znL/zZwqqa+qWHA0McEdz3G7TWrhsvlh36M+kXcIGMAp5aqa3gulosBUYnjyb96WzHU7rmLLC1/RTvZ5X6ayiDct8iTzd0ST5MYcl/025qK2WWl3+IFTkWMdWKW9WcISAIBqKiL3dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by AS8PR04MB7621.eurprd04.prod.outlook.com (2603:10a6:20b:299::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 11:46:10 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 11:46:10 +0000
Date: Fri, 23 Jan 2026 13:46:06 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: chleroy@kernel.org, dan.carpenter@linaro.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, suhui@nfschina.com
Subject: Re: [PATCH v2] bus: fsl-mc: fix an error handling in
 fsl_mc_device_add()
Message-ID: <ynkpfuncsontf576wjq6fpru2742xx7xqrnvdiadzuoazrucpg@hw3q3bjjwfiz>
References: <fkoirnlbf6szpvqubamaz77433gc5uvh6fanbaonz3znsjoxxg@7ifmlxegzzwt>
 <20260123113529.1522424-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123113529.1522424-1-lihaoxiang@isrc.iscas.ac.cn>
X-ClientProxiedBy: FR4P281CA0330.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::8) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|AS8PR04MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9e6ca8-96cd-4b02-f577-08de5a7500d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CTTnoXJLCdcfbE8JzoSrO9F5DBvfMC5mVygKGczO19FGTTAKt+eHyS7YJWaf?=
 =?us-ascii?Q?75AL10TCZnUJjl+k2r8GJEin6ubnPg4X7G/XR1wgCMEXvnHEC5h3CDInNjk/?=
 =?us-ascii?Q?6fo/3F+/DLus+BRW6nRdBaRZ5ErZRSZwh9fcI5DPAUupgl3rb2Vm99Nwgjk0?=
 =?us-ascii?Q?/A7d0EWFMQZGR04DVqKbsj34NrBAtk0NHhAtzOn07wYI8kJdumfYKXhXwGQ8?=
 =?us-ascii?Q?sMhuWC86anSydYDwMkMMW7On6DSsEXM2rwwP4SWSMQU4ldsiKBJvQJSN+yKp?=
 =?us-ascii?Q?13JRIhK406Tr/fO5MdOqeqms2wEIYCpp8njXdxEeZ/Znhu5ybyT+k9LBMYtD?=
 =?us-ascii?Q?N7flQvqSJAxJlmYitMEbVyhhNIhn05KGcDjyZ0m+vNenijZt5jMBiWxiXrtO?=
 =?us-ascii?Q?TjsTrr5wmO6zxYL1abHjPY7CUKV2EH3UGbCrjwHYNvCwk2kpSa5G+lKz3f6e?=
 =?us-ascii?Q?mj1Kf4n5FgK2pdQhLTnqPD4qf9fhVEThr8tUe1UKuPAlbcIisKT/TNyBnSwl?=
 =?us-ascii?Q?A/xbKpqtQwXu3+JB+jC25+C30T0r+ewWhKxqp+ujR72DpUtKozetSpq3SV1W?=
 =?us-ascii?Q?2Li2bWU1tq4K7RKSL1B1WOmsw1ibBG2+TOxoySeSHyQ7jPHavSEZUZQeCPRq?=
 =?us-ascii?Q?INnsojbTIykS5a6jbZ0r/GXcf4U3Z1/iP3SfPKTXL3t6WvzXui5tfIeGVqoF?=
 =?us-ascii?Q?JhhnAZc9WxHS6WvT2mIimktmoEgPSC4em1OoMiWuPMyJRa+wJ34iHNj1z+Mi?=
 =?us-ascii?Q?QYRcsOyJDImIinwVmVquYDbUnGzYf+Rpsf5ToKsyY2ns5k+hP1s0aEL9SGLX?=
 =?us-ascii?Q?uI7M+P8UNl+y7FvfBYRL4Aklasb8xYfSfEHQp5kCARhv5Ea4j3fjV+gJVIC2?=
 =?us-ascii?Q?3tBtA62bPRrnJeaSXRzMXGlSNot5fbRK9e1Suy2IQDiNBIsuUPp0u64FQo7N?=
 =?us-ascii?Q?2FDHaIY/FOVsB7q4PKxquKiBFMPTN8nm5baCV/HdOj2rcIEx+YlP0BoyApyh?=
 =?us-ascii?Q?TAJyIUQI3ILfjIspsdyms29BKdVKlq2ccSFlxhzlTr8Pey7XyR71r/ASokV4?=
 =?us-ascii?Q?JvUD4BEk4iJ+q+QY975Wd7yy6bJYz48OmEqu5Qd/d8Nvo5182/mkwb3NVD3h?=
 =?us-ascii?Q?xrqlBTK1TRQnK4Gm1gi47WxNQ3d1IcXvWSYYNMWKVsaSvRgMj9l2QoGa9HW3?=
 =?us-ascii?Q?uIM67KOMYpbBNjsDrXV5mdWyJ8AQfNpGnyLnXFHZCeIrh/pSSoWZaj4GuZdI?=
 =?us-ascii?Q?kIOAgU5Vq94I7aV8OcT/uD62fkFUIjSQjl9xU5kGWA810Xxzhkh9Z1QczbrI?=
 =?us-ascii?Q?deN47hARucLL4KRrBuULZ6StQHUoS3E7k+DxTAETTdJ59smc+CmHXafr1vSm?=
 =?us-ascii?Q?buf87q4ZBfB9yNb+8HXXb8UJwVQQ2f0cAlF0QlX1FCALtVpzm9xEQb6jUTij?=
 =?us-ascii?Q?MK7nML58mbQCnuxpzb/Ts6hpGcwrmZlW2+dg7jAxwF01fqF22mUfpVEdUf5R?=
 =?us-ascii?Q?akzcJtkZA6bQ+zKQS1n5+VzhNAHvVI8SFW10M8RIIU2QG/KF5J6zJAsZK32V?=
 =?us-ascii?Q?MjCLULHxBW+LA+TAfGIjk8LSNI0MTCxsHq2A3gK2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kDiznnhnkIak8whya7E8UhAn+iQ5keEIFYX24QqSyqQZgaU9GeC8Gjzy+9D5?=
 =?us-ascii?Q?jcz39LZY2GlaImMcj1GfLZmFGgBGWsiOmyW7czizN1aUoGPozqFRzHoB1tF9?=
 =?us-ascii?Q?wBJBWaIIuqIqPC7pQOMnoOQvc/8vXloMM6HOz+9+YnsFkgkoo6uux4eSyI/o?=
 =?us-ascii?Q?Cqzmds6zs7J8X0By64jXgbuGFIqnfxpXgZlFJoKKbm+7ylJfBm5HfGCbzmOx?=
 =?us-ascii?Q?0068LDTBMdSlKOOUSDlp8RrnDCq17CgXSEp4Y4EqEE5ht9pBQRQRE34/iHpV?=
 =?us-ascii?Q?kQx94uJI00Wg0U1XTpBRfPmHfn3fNMhRv983mqs73S/zKGcThjAiF2UUARBS?=
 =?us-ascii?Q?BEdHDIJmKA90qkowZreGkbmGNfQn2BVOkmtSl4frZcZOB9veSncQRCzaYODl?=
 =?us-ascii?Q?p78211YrYnjcPlzomwA152c1E03BkP4lMCHmUV7oCg8f7DGt6Myh+b2CtBpZ?=
 =?us-ascii?Q?C25+ISHFrF9qcbbrzM97nIivouDTmyPDjcarRvxCG8d2iH/d+HYR++paob4g?=
 =?us-ascii?Q?ZcdccmK5raVLM9ixygLpdp73entsvfG0sbfEodv9etyuS0uWP4iFrsuagmtu?=
 =?us-ascii?Q?B7zJp94fXfVUZEPl1XCzPXr9TybgsHStnMHg40MZUtFjRILYK2wxlD5NokN1?=
 =?us-ascii?Q?zuM7A2KGhnVTsWs0v6ZPAO9D+iijaNb6kZKM+ZPq//UUOA3ejEQxzP9OtyQ3?=
 =?us-ascii?Q?MfZEDjeXi5OEwHPGHod4vp6OeSQ/lyDw4/BH7/L7GMYdvrkHXFzbz8+fiqVn?=
 =?us-ascii?Q?B1HplbLSnVY61ZYmtnyVFP1ltpLmhkFaqj8D/boo/hM0lDsC4MFiExPwLk5N?=
 =?us-ascii?Q?yzDeTHYDmxIyphC4py/CPEhm/5qAgoDOf+or2kQzx3hVSrOILETI4Yha8vAn?=
 =?us-ascii?Q?F2KlImrkDTA0FjQlmE3dojZ84Xdv9n39j4ReD7WJSuDHi7Cwu8mzNq2iB+0a?=
 =?us-ascii?Q?MZ+6lOYBPNGt8xtVKSEaf/y2JKiy/FP62tVyp9OxzqtTD72AXc7w6ruplGew?=
 =?us-ascii?Q?QqeD1Y46tAHk8iCAKLKca3as6nYIjvAqrty2hj34UVmD9dv6Ez9Wy6I86V/W?=
 =?us-ascii?Q?WcQqVP6b0dV9V8UviTyuHg2RONZs4ytZo4JskgespifNCjcM2p11cdM2BkIy?=
 =?us-ascii?Q?oEEqmb3caQ6lTCVrpBEqzvv2nhZU+os11BJtyMQvNpTVCcKFsUu1ljBlbtTH?=
 =?us-ascii?Q?Xc0/rfJwY9T2EZ55eXDTd0VOdNGnlNwJ/F2S4IsXAWRdONhxCLWVm5JzStC1?=
 =?us-ascii?Q?isZ6gdiN/VZz0JtXMG0eJlK1lOUTRxQokdj/TZeKt1rkoXafMAKDBmD/5PmQ?=
 =?us-ascii?Q?NcvwqNYg2b6FuV4+GNKzpEqnf3QrZiDNdpG4ahWQJ2lvqrxC7O3zhTS2mJ4d?=
 =?us-ascii?Q?DrfPPJ/D5Kof4rhFPKP6vm/u/AsAKgChRGPLAaBPh2FHxQgBG6XUw6HtPQb7?=
 =?us-ascii?Q?tirMF94/dTrZwPcOs2UIlR+uxSNS2atpzgqwpn7mYn3jHn4V4kkel0dQopuw?=
 =?us-ascii?Q?4t2XF8rcDWyVPOqWeL/4MH8oy0llM49Re0WJLAr3UJ8Re10J0N5IzZozLNLP?=
 =?us-ascii?Q?UP9QcFHTar40YcjrTwVt+YCYQs+xXq5ZvB7RbIRRLbFv9OFYV16fxN/hPwXp?=
 =?us-ascii?Q?uO8NRyZDe1YPGLTcRWoo8FjADyVUs2caDsb9KUtHE3Z93m9FYqLxCvjnnRP0?=
 =?us-ascii?Q?nWUNedv+o8hxRf7HynoltnIKHvsPLIS6v5o+xw9XR/G+beaHHmAo17O2KEJz?=
 =?us-ascii?Q?q+oh3j6l1Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9e6ca8-96cd-4b02-f577-08de5a7500d0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 11:46:10.5799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+iaFJm8bJej7tLfNAvBq0FBMEtkfkVc28q9V0DAcZJy0TKqQkmqvzAs0jsJwo6lJlC6XLaA5QlSKg9GpuCAeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7621
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ioana.ciornei@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lihaoxiang@isrc.iscas.ac.cn,m:chleroy@kernel.org,m:dan.carpenter@linaro.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:suhui@nfschina.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16233-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ioana.ciornei@nxp.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.339];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:dkim]
X-Rspamd-Queue-Id: 0B3A475553
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 07:35:29PM +0800, Haoxiang Li wrote:
> Hi, Ioana:
> 
> On Fri, 23 Jan 2026 13:10:46 +0200, Ioana Ciornei wrote:
> > Is there any reason why you didn't go with Christophe's suggestion from
> > https://lore.kernel.org/all/b7f7e968-a683-4e1e-8ccc-5dd19f0f15c5@kernel.org/ ?
> 
> > It's perfectly valid to call put_device() even though device_add() was
> > not called, meaning from the other code paths.
> 
> Actually, I totally agree with that suggestion. However, I submit a same fix
> several months ago and got a reply:
> https://lore.kernel.org/all/2025052622-nautical-suitably-486c@gregkh/
> 
> I didn't figure out why.

I think the problem was that the patch did not apply because commit
d694bf8a9acd ("bus: fsl-mc: fix double-free on mc_dev") was already
applied.

> And if you agree with the Christophe's suggestion,
> I will resubmit a patch v3.

Yes, I do agree with Christophe's suggestion. I even tested a bit that
both cases, with and without device_add() getting called, resources are
released properly if you use put_device().

Thanks!

