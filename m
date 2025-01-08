Return-Path: <linuxppc-dev+bounces-4857-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ED9A061D4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 17:27:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YStc72Bt4z30T0;
	Thu,  9 Jan 2025 03:27:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2415::602"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736353639;
	cv=fail; b=H++29mIKPfWGAILIFb660GOq/x2wkgI4iOeEv9VdQ9Zaqek0SaL+JQa7K0x2zysGWnkFlHmjjizywG6GATLlD8XDj8CAjvtTpw6SkKPbqd5FRFgR4aijZIgdK9Z5pyBcNIb9mvNmtFqnwjM4MlZVo4cT0QOszV/0lh7ScWCf5KrPGD4ybMHrcmP4BG6zQQ2dKAsyjgTb7uQ53EBsWqb6kPK/oXqFqhkVohFZw9jV7DjKrsqZkni5auwYTPM8/IFhuVr3AnwMqYm/wcIXmh+ES77RcTd9A9E5L35QtYnEtOjMJpKqfhoMC/jKsf23sxMQWMXWWL4rXUxqGp7wmnATvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736353639; c=relaxed/relaxed;
	bh=im58jhsCB1c8ehwk8tTvAiWueItuejDYDV7PzVfC3HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bPzktovlt+6BgERXTs62FniQQXG0SPH0qkwrlY6rSOH0LGXmzfxdifrfzt5blnKSgduHl/+8zrPM9UpJAhTeldv3MW2PY7MvrFXdbwilOiSGP5TT6rJfEG/Rpx3s4znc+Ho4h7OhdLN0L2bAusiikrP5FNIGMyBG/pOmrl9Dv1azVpI6gx/uT3Q9rblx0F8oFrxuwqrT1JI03DkWUghMSrK530QBJnEgNTHPBBuf/NoSKQZleDr6aF65PBT0eNFLApY5uMmEZNZVnT9BvG/EKAAVgViKS29vSEXgj19/j1Usi4tygRK1DDKXxBWThR9Fgwd7BpZdw5UkQLnf6kmVwQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=fail (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PgVXMwxc reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::602; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PgVXMwxc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2415::602; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20602.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YStc50h0fz2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 03:27:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRNqSTQ2Fz3xAW0zYc59sHS6J+GM7ZxDYOrfrT1VK9FqUVljT/pAZstPhvRWBwkDN+b057olqGGpM610qCMnYOlz+hOkVocanQ0PVbLn7VEsm+R9sOXQkAiV7pZUpWQ+5/8GHyZsmG1+Hi1J0aWOD1vMl68BviWaQRsJsVk5FVwa/CTP8hbGQQrHogX6GCuJCyUtenrb7yYHRx6kSM1hCuj77Oxg+V9uGNLQiC3aAxi75JhdKqsPcaUxqCn+hpNXZwR+PW5eXn7VFFJcOAqCnfh2m/+w9rmOkHyPTTr72pDIzCWgMp+9hD7I3UG1m8HFpuuqTeMgSf/1QMTZgld/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPtZA5owjjLGtqAZ9n9Vp5KD86FZbi6SjGLcehoNt9g=;
 b=GbI4aS63zvP14UmU1eJbkWrlQVofbf43uk5cQahmzrp0FqMoSGo8Mt2OhNc3XQ/vpMEr8jy+mFlPcvSjmUWFMSDadYP+gE1ir8JRioUI2Aco+yO9LygIul1j0SRTIIIo/aqrtG6kWJjI/UrLF48o6aVGQWkpd5oMj79nEqFOhOpGFt2NKoNTA3WwLQa9dKB9tuCJifEdJ1eJUYhtNd9uGK18ovjBJ06LT7CCpu7RxatHL/G2rux8ccgpva0OvwFHMrC9yZ9jj7xvCzfd2kRX4yVv+iojG0oP6COS0FY7WXWq5pj3CsDTe3J3liW0nad8tj5I9/2P+IJjtNCPLesUGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPtZA5owjjLGtqAZ9n9Vp5KD86FZbi6SjGLcehoNt9g=;
 b=PgVXMwxcKce2ejq2KoWL8p0QBFZMdvL0DDPfnboi5eEAj/keZoWWRFt8MzgWsidoHBdR3EqlYvo7X90pqlTjmOJ59jGwsYwMc5VM5/JHxn1ehO4pFkDk5DLzmwaLxb93sma2E/xXKeOJ23f8qFFwHSaX4yXYdsifJYzrcIUW4Ek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 PH0PR12MB7981.namprd12.prod.outlook.com (2603:10b6:510:26c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 16:26:56 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 16:26:55 +0000
Date: Wed, 8 Jan 2025 11:26:48 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 2/7] PCI: Move TLP Log handling to own file
Message-ID: <20250108162648.GD1221136@yaz-khff2.amd.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
 <20241218143747.3159-3-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218143747.3159-3-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: BN0PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:408:ee::27) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|PH0PR12MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8905f4-736b-4c3c-22d6-08dd30014451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?4GZKIUe7a/f4BDfblfr501tv/wVKASLiDgJSOk5wN9XjTcbTv5g9skO/IF?=
 =?iso-8859-1?Q?08Q5eskFthTeA4reSL64M1PjAsL5GdGci5hXzIRo81CUKYgW64OV5o2BNd?=
 =?iso-8859-1?Q?3tcqvBqvYmc56jkbHVbeFOnIeEMoyxDbEJa9/isuGBJ8fp3OxlIikvpaGC?=
 =?iso-8859-1?Q?mgbr2fSLO4WEbjb1HvvSCYJ5+CfOzOPk9hOJPOt3e+18VV1E71F44yOmak?=
 =?iso-8859-1?Q?EtiFyr2jqKwbSMDcoxdUhIE5bticv+MPu1FoJJ6CsQTPB3bX8BD1xyXNJz?=
 =?iso-8859-1?Q?iCOVtKy1BRfCa9CoQyomW7N6JGofFhKsssiFWlnh5exptBF7rRchpZ+N86?=
 =?iso-8859-1?Q?wd7a4gA+QeswmrQ93XIaU0u0PHzw6idkijg4XSJX1bMiuuE2fJAtdfXsOI?=
 =?iso-8859-1?Q?tgPb1S/nfqjWSAYovEZPmi1xkVEyuV38kyZRr4GvSD3nnyR4d9JA1eUhse?=
 =?iso-8859-1?Q?MzdduxP3llryRxHX/D000Qjhld4GTBqluLGVQmLPOJgxhj508UtJkQ4SJq?=
 =?iso-8859-1?Q?VU09D9rrLq+cnnu1HT3lyaOh01qvnmLOt1mrPnBJqH4CcPmY+sI6opBIg2?=
 =?iso-8859-1?Q?ieBeg3G0wRyq0hRFmp0UVZ7EGnWMEHpNirsXetcBUna4DqoBznFHMMZBDS?=
 =?iso-8859-1?Q?oxow80quzile2N3M+9U2mgzwk1rL4M4fpUP749pw6rFwuenhkeBKJIH6Ym?=
 =?iso-8859-1?Q?u99aSF8W5nbVsjyaPCRvvRaO5w8yR7qkMvkLR8SZVXiOkCF1rVBkpvLT/D?=
 =?iso-8859-1?Q?8M1tNjevSDF7wmI2jNUGiauH44asRcAyF55SxE3CcK/sDWNnqjwuUTrZJe?=
 =?iso-8859-1?Q?j1SNhADSatoMKJ/EW0atI5+7LvbDtzoaeM60OM6waqYVChSqfyxeA24pU6?=
 =?iso-8859-1?Q?KFGATK4pYsmp++rXOpq0woDouMZ0rXFO/cozgoRh2IkLaIQPewtE47fg+m?=
 =?iso-8859-1?Q?DDjLa1q6t/CEZzXWCCkxuZn2jipMoL3PkoipEJ1BMW89Fw2TT9he+k4mQE?=
 =?iso-8859-1?Q?r4PGDxadxAKZyOksL87senRDN90Sl8In9cPaqTcIFYEzCJG7ZPNrcqpjRm?=
 =?iso-8859-1?Q?72KiMTK7/gij3ti6hOnfCIcfzV00t3YJL4JE+UMmWYxPfHtSbdeTKGBX7P?=
 =?iso-8859-1?Q?XlvUAchnSMOo2Oielw4sv+emp9I3wrbAEU2Y2x327Xuk6eMOEyXD9PvGDn?=
 =?iso-8859-1?Q?pX0Na25Cb2fg3M4fGrb/f0WajvQz5/YssMS7ExeUczLSz28e6SJ/VU5g18?=
 =?iso-8859-1?Q?lC6ZVNbjWsOLcpONK+T7Z0n4duus+KWDf8mRBUvvcIxnoKxp0UmjpvThwB?=
 =?iso-8859-1?Q?CKeZdhuCOdjUlYlGgokeOYBbag94PSi4r/CzgZJGPmiezeMc/T+gge8bag?=
 =?iso-8859-1?Q?jQp4tg/gX5JssEbML3rAQcJsKYToO/n2C283L3FffjucLRcQdzIcURg3tc?=
 =?iso-8859-1?Q?J0LGQAiIcrkfS+9I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?raLeDLdROigzVNESmYDRzCql4yfgLyE99Z4x+2kBRVqxfM/0VlnYBDU5/c?=
 =?iso-8859-1?Q?Z/Aen3kVW1Iv/nGUIll6CGK8J/KChugFPgE1MlG0JjZT9swIBBtzdWYZJ6?=
 =?iso-8859-1?Q?y5SzUe46xRALWs/X4rXfxCOQDKs1s7iOh1x9MOi4Di7/t/li8x/Abk+9An?=
 =?iso-8859-1?Q?UPFM1XqCEyN47GCKQItE6xngX3HqZhFH25Bx5YjsrGBu6NsRHNQuYuEQJ8?=
 =?iso-8859-1?Q?5FxV8sKjs0/z0JvBJ8g2mRA7764lfBx/UE/r06FApLRFN/Ms+LGDotLu/s?=
 =?iso-8859-1?Q?vlk6Z97sjCCBzrRbyFcnOBCwZWqo9fk4ybzxJAnENHm5h+TXtMng79y0Qg?=
 =?iso-8859-1?Q?wpeoraDtfhn/Rh+3Gh7qwH7FMAdDSZ6SQWpyEmeujSHe63N2eCXGe2VMFN?=
 =?iso-8859-1?Q?99x6yOUR5f/7CJExwnLq2Ue6Ps1g4B6w+M0lqb9hBMJsRUqgQX8d3e2XVQ?=
 =?iso-8859-1?Q?C+S9C1t/aL7dxW3xlh4cmvK+Re8sgniS8eohlgcAjXRrKb6ptSgQzLHwg/?=
 =?iso-8859-1?Q?CFBOGPS9p2H88e+hU92w7YRGABQArvNFrNeLjqZzxdqGPECaC/rk7YGcOU?=
 =?iso-8859-1?Q?VYzYEShg294nudo0hye8shV/oTMG7YmkyA/TL2dbSl2/qjxn5E0RDYe2Qp?=
 =?iso-8859-1?Q?GPV/5rtI1SOXr76BUr8OFAn5KGlPhpsV3G/8xxUzcWSSa9jtB/yREaXF3O?=
 =?iso-8859-1?Q?m7x5EpHJjgq16PozwNqZIBmxaXYUIWZndWwYC2Ao40oQadBfttrM8vlm6y?=
 =?iso-8859-1?Q?EEm1saGhdOThAJLXDKBWh1QFBJfkTNRyiH54cOOnk1Q7nex5AoKxC0skKO?=
 =?iso-8859-1?Q?vG7MJEbp9FWyZvm8izmzngOoaCgjMUqExg1LeSROLSLzLajlk6L05Jt4TW?=
 =?iso-8859-1?Q?JESnTzL6R1j4rfQC82gn3/B9dsA96QOlpNAGCRsfXOHw7Oru5NcQNmFg+y?=
 =?iso-8859-1?Q?56wUxWtNSR7s6YX1Yp0piDWkbY2Fg4+dMLoEoArJDVCL0e4oQroeLer64B?=
 =?iso-8859-1?Q?mp2DHPDUuYqBhzkqvYXmL3N7Cr+QmoeUMVaFImXBF9lx+DEMocwb08l35A?=
 =?iso-8859-1?Q?lRat0ZfiTrRKf31TJOUwjk7aL+7cRxc6KPvJGFyqEyWYDH6bR1FEdR6lbb?=
 =?iso-8859-1?Q?sbdbWdRPJril8XkXXMvCQ9Fk/gS0zJT7oxV8j5DU0D/ktcSxbYjTSgmxc/?=
 =?iso-8859-1?Q?obIhwECiS8lo3+Vg80pN3iej/2lUyi451cAO8dY7XuucJj2Q5tCYiwyBV4?=
 =?iso-8859-1?Q?e65KHP/BzX9g1vEPTrdu2xbjhYmphJV3x8VUYBXo2/nvDnw+dPCWbhm0a+?=
 =?iso-8859-1?Q?HKPChtJ10m8Xo3Jf63fbt4xCpAnO1Nh3uthg4EtQRQ4ntLNA/ED4IoxN+K?=
 =?iso-8859-1?Q?YfHwEujbC036eJMd65ufKoU4V4mtIEjDOx1e07SE2VSBjtUQqVsd4N0Dny?=
 =?iso-8859-1?Q?FtY1QciaLZ+TgWA+w121LyZg82v6GG1+4wR7sxMmXvg+cBpFaGhWbzMCiF?=
 =?iso-8859-1?Q?PL4FMKNG0i0bS+MR/fMa32nyersbFzzFD7IUeMj9caB3fvxicBLHZqiEYA?=
 =?iso-8859-1?Q?Jx4o+fVl3XxQR5dXxpnKn5AVejZSHyhTWPMiuWrwCNlLm0lDhiOdrOi5DH?=
 =?iso-8859-1?Q?borudfHb0PgeAxrDGrdwRN4ByBrNHBgo/X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8905f4-736b-4c3c-22d6-08dd30014451
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 16:26:55.7669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DHL3R7TlD3EV6E2pcPzvAYOMGuYkbolqhhZJBmYtfFFVTAQ2Sn9HGSECbxfU9Db9EljuZoDRsHlaKL+0UjWoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7981
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 18, 2024 at 04:37:42PM +0200, Ilpo Järvinen wrote:
> TLP Log is PCIe feature and is processed only by AER and DPC.
> Configwise, DPC depends AER being enabled. In lack of better place, the
> TLP Log handling code was initially placed into pci.c but it can be
> easily placed in a separate file.
> 
> Move TLP Log handling code to own file under pcie/ subdirectory and
> include it only when AER is enabled.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Overall, looks good to me, but I have one idea below.

>  drivers/pci/pci.c         | 27 ---------------------------
>  drivers/pci/pci.h         |  2 +-
>  drivers/pci/pcie/Makefile |  2 +-
>  drivers/pci/pcie/tlp.c    | 39 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 41 insertions(+), 29 deletions(-)
>  create mode 100644 drivers/pci/pcie/tlp.c
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index e0fdc9d10f91..02cd4c7eb80b 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1099,33 +1099,6 @@ static void pci_enable_acs(struct pci_dev *dev)
>  	pci_write_config_word(dev, pos + PCI_ACS_CTRL, caps.ctrl);
>  }
>  
> -/**
> - * pcie_read_tlp_log - read TLP Header Log
> - * @dev: PCIe device
> - * @where: PCI Config offset of TLP Header Log
> - * @tlp_log: TLP Log structure to fill
> - *
> - * Fill @tlp_log from TLP Header Log registers, e.g., AER or DPC.
> - *
> - * Return: 0 on success and filled TLP Log structure, <0 on error.
> - */
> -int pcie_read_tlp_log(struct pci_dev *dev, int where,
> -		      struct pcie_tlp_log *tlp_log)
> -{
> -	int i, ret;
> -
> -	memset(tlp_log, 0, sizeof(*tlp_log));
> -
> -	for (i = 0; i < 4; i++) {
> -		ret = pci_read_config_dword(dev, where + i * 4,
> -					    &tlp_log->dw[i]);
> -		if (ret)
> -			return pcibios_err_to_errno(ret);
> -	}
> -
> -	return 0;
> -}
> -
>  /**
>   * pci_restore_bars - restore a device's BAR values (e.g. after wake-up)
>   * @dev: PCI device to have its BARs restored
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 8a60fc9e7786..55fcf3bac4f7 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -549,9 +549,9 @@ struct aer_err_info {
>  
>  int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
>  void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
> -#endif	/* CONFIG_PCIEAER */
>  
>  int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_log *log);
> +#endif	/* CONFIG_PCIEAER */
>  
>  #ifdef CONFIG_PCIEPORTBUS
>  /* Cached RCEC Endpoint Association */
> diff --git a/drivers/pci/pcie/Makefile b/drivers/pci/pcie/Makefile
> index 53ccab62314d..173829aa02e6 100644
> --- a/drivers/pci/pcie/Makefile
> +++ b/drivers/pci/pcie/Makefile
> @@ -7,7 +7,7 @@ pcieportdrv-y			:= portdrv.o rcec.o
>  obj-$(CONFIG_PCIEPORTBUS)	+= pcieportdrv.o bwctrl.o
>  
>  obj-y				+= aspm.o
> -obj-$(CONFIG_PCIEAER)		+= aer.o err.o
> +obj-$(CONFIG_PCIEAER)		+= aer.o err.o tlp.o
>  obj-$(CONFIG_PCIEAER_INJECT)	+= aer_inject.o
>  obj-$(CONFIG_PCIE_PME)		+= pme.o
>  obj-$(CONFIG_PCIE_DPC)		+= dpc.o
> diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
> new file mode 100644
> index 000000000000..3f053cc62290
> --- /dev/null
> +++ b/drivers/pci/pcie/tlp.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * PCIe TLP Log handling
> + *
> + * Copyright (C) 2024 Intel Corporation
> + */
> +
> +#include <linux/aer.h>
> +#include <linux/pci.h>
> +#include <linux/string.h>
> +
> +#include "../pci.h"
> +
> +/**
> + * pcie_read_tlp_log - read TLP Header Log
> + * @dev: PCIe device
> + * @where: PCI Config offset of TLP Header Log
> + * @tlp_log: TLP Log structure to fill
> + *
> + * Fill @tlp_log from TLP Header Log registers, e.g., AER or DPC.
> + *
> + * Return: 0 on success and filled TLP Log structure, <0 on error.
> + */
> +int pcie_read_tlp_log(struct pci_dev *dev, int where,
> +		      struct pcie_tlp_log *tlp_log)
> +{
> +	int i, ret;
> +
> +	memset(tlp_log, 0, sizeof(*tlp_log));
> +

Can we include a define for the number of registers? 

> +	for (i = 0; i < 4; i++) {

This '4' is "MIN_TLP_REGS" or something similar.

> +		ret = pci_read_config_dword(dev, where + i * 4,

This '4' is the register offset factor.

Another thought is to make the offset a variable and adjust it in the
for-loop conditions.

	int i, ret, offset = where;

	for (i = 0; i < MIN_TLP_REGS; i++, offset += 4) {
		ret = pci_read_config_dword(dev, offset, &tlp_log->dw[i]);

I think this will help as variable-size TLP logs are added in later
patches.

> +					    &tlp_log->dw[i]);
> +		if (ret)
> +			return pcibios_err_to_errno(ret);
> +	}
> +
> +	return 0;
> +}

Thanks,
Yazen

