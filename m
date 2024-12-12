Return-Path: <linuxppc-dev+bounces-4065-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA9F9EFEAC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 22:49:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8R2r2FL7z2ykZ;
	Fri, 13 Dec 2024 08:49:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734040196;
	cv=pass; b=e82msrWEyeP39AN6ABe8xiozLF5LHfYIqQYwFS0zS7tgzerEQh+8PtnY1e/9qNrvC6SMI5Jz4LPfkMB8k6y2krSKoAdXn4KNYXaA+jBYlPOtWHsjn9skaJcbAf4lLpVGbFqjICLbeTvPeCrCqjKzFq8ERdolm83iIvbuFsan33XPVRiwbfh2kvjccnmGTc84rdc5BWKmoZbpKDVM6HouGUaAh6A1yOpCeSohoPjsjJga8qPSbAVBJci73yN9DwANIrdz90TLG+JGQ/LayrJfoMxkmqiiwWXw8uES0dkd9RzUFlPZwKlfAQnRIZRfuktPHuge526J7kugxVAgaBjUXw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734040196; c=relaxed/relaxed;
	bh=0Xey0NdgnRzhM50CtBphRsRN5wv/TxIS/RrlcE2e6kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jM3Mof3wf05PC75/VtMSAupocYPhnNta0utU+UHSBtVimftmbZ7ov2T9mCipkCp4BjCipn9NF5p5pfRQdg988bSnBrgFXMwBsIGf+w1iIgeJ9/i229ZnTFFYPqZOqej+wF70JFPGws8M0ybgrCd3HkYCee7PiZ0TQJ2FXtTfbsTsakrV1fzw4uJSlAVLEwfD7vaG5j/cKeG637VAePYcTtXzR9cEo0ntuTQNccZXA7ViCTQX1OcAkSTH9r6DPailz4V14IoDtNWg3sbJN59tjEXX5HsTTdUUBB0I1w1rA/lUxE1uY1D1LoJunDNUx/e7RymKn5KBSBOoWSkc76lLdw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=Tky7DySj; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dfV8syzt; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=Tky7DySj;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dfV8syzt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2091 seconds by postgrey-1.37 at boromir; Fri, 13 Dec 2024 08:49:55 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8R2q1JZBz2yjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 08:49:53 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCJfrW5007494;
	Thu, 12 Dec 2024 21:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=0Xey0NdgnRzhM50CtB
	phRsRN5wv/TxIS/RrlcE2e6kU=; b=Tky7DySjzkCw5dhdFpSKk1n7Wc2FDRaZn3
	tltvjBHgy0ipmDFU+IYFs54wdu1a2hjS+O1w+XAt10qZQG4oWEE1JNt3CLP96RXR
	yLsyhvvj7NtldRFYTzs9iocReSuMPBcGJ53JngqcwhGEnOCcHQ7kmaPiFyQC1/Sm
	0AzLCzSIcjiOhF2wHIAwg5wjUK1cYeriFSgstt1VxkM7Omecfx1K1nlzKQlXcryq
	5dntkXPZjlv3De+QDSDDd8mlgUm+gZUy/t2n3Ss9+8Dok3doroyk1vTHi8VzHeby
	9nD+gtQkHc0jrneWVV140xmqeHkMuS6Rx8Ke+r0+oq4A52ogmpzQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43cewtc9vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 21:13:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCKIh4t034919;
	Thu, 12 Dec 2024 21:13:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctk7d4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 21:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJRPLXukeWtrnHvQkjQ/A5peNfLj4Qoce9U5vbASFOgh9iptxgV0dnC8tBu+gkrLy5LXSZTKOMeHCYchtSd0NORggHu0P7uY5FRwKe+HZfDd7H22RC36T4sShbgmc/v3AhhJ9NBT8ryUWHXYr+ySFfXvvTqIzkP2lA54jin5+bth96tCwKo3RBVsSpH1SbrJWdmSugFJY4a8VxN0HywDg73lPo82zwp+HVmL/5fUc1LfbVPtL14/CYWNT2itMiF/yVu1lTx+emdRe00qlve20ejsvaBEV4Qj1lTL4jWtl+1H3JanpD6afcoEWdJk1e83hjCC4fT8wzACz9FYLrSV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Xey0NdgnRzhM50CtBphRsRN5wv/TxIS/RrlcE2e6kU=;
 b=tcCP2L3n/jeStS2RuMHIDJsarYWFVpiB0krqw9YK4nJaEdgrDwp9tVDGzuYYr4FDsLMgY49Tgf0aCOxQiHgHivI087c4uTWvurM9YYTvz5T44BeHf+T1GAK7nDoBz+2dJN/qcN/aetXVj8etU5rlbGUGrvElgLO33Mdu8fuQKd+qA+40D9GhJ+qg2ERQRD58YLOeSacMywJ/zgsOrzokODp9coEK3QrBAGBAGK0I779Y6ZsGtRERvNVOIHL8/J0Kbm7/biOTBshPnJNrb00fVr0xDxBGN6kvhr6sOge1NrHpoxlJKw7ssCvlWe7629E4TJ3NM6np0bKtp5jZcR3yxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Xey0NdgnRzhM50CtBphRsRN5wv/TxIS/RrlcE2e6kU=;
 b=dfV8syztFpT8EoNtncIu+boaLBSWCKwPIeJ+7bltucdhG3tSckKTR2yUj+DeiFX+HA3nK6fmbcWA5z27A9WKo4thMCo24sslP/45Nyzq/JuwzT3rdKEGHNeD/fw3i6FsV/GPTdgLZUY+nRaOQKc/UTR7hAb7aqXv5KZOZRvyyBU=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM4PR10MB6061.namprd10.prod.outlook.com (2603:10b6:8:b5::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.15; Thu, 12 Dec 2024 21:13:52 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%5]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 21:13:51 +0000
Date: Thu, 12 Dec 2024 16:13:46 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, lorenzo.stoakes@oracle.com,
        yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com,
        minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk,
        tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, davem@davemloft.net, andreas@gaisler.com,
        tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
        bhelgaas@google.com, jason.andryuk@amd.com, leitao@debian.org,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        kernel-team@android.com, android-mm@google.com
Subject: Re: [PATCH mm-unstable v2 05/16] mm: arc: Use generic_mmap_hint()
Message-ID: <z2jiw4hnmzh6wuutxsbquap4whtbv7qax7usvnmoqephqrirsp@dk2zfods6xvm>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Kalesh Singh <kaleshsingh@google.com>, akpm@linux-foundation.org, vbabka@suse.cz, 
	lorenzo.stoakes@oracle.com, yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com, 
	minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com, 
	bhelgaas@google.com, jason.andryuk@amd.com, leitao@debian.org, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-mm@kvack.org, kernel-team@android.com, android-mm@google.com
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <20241211232754.1583023-6-kaleshsingh@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211232754.1583023-6-kaleshsingh@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1P288CA0017.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::30)
 To PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM4PR10MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: b396b391-342f-499d-f706-08dd1af1e095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ui/U8RmCjRt5tw0MIDZ0mnFKMCfyu811X/nFy8a0VTLDdVspRQxAEwK9L3T7?=
 =?us-ascii?Q?G0pEDIMXzzFwIFC+VQ0J2VfMFVVyx9CzH2+Pg4xfzZFoMixIUQgKAf5H9G/U?=
 =?us-ascii?Q?ZDC62usltRoKZgfb9zn8zxmgzMZkp9nK+zKrPtJjrWl2FoslX2UCLf1gDS75?=
 =?us-ascii?Q?Kws2ISz5kqZxeHtUYZ2WcsdgHq8w3brs+QYrOylRibfOepQzpZi+EVkLLikp?=
 =?us-ascii?Q?t8y4iP7np9wMfkVvk3aQKNjWoDnHcKNzjUphoGec3/hGHnTiWZMqYXam1Lcv?=
 =?us-ascii?Q?3425YyvwOjzGe+/sqkMYJteV74Z0mrP48IZumfe58W80ZVgV+39PX7dh3X1C?=
 =?us-ascii?Q?5XB3jTGM1ksDE2uBt8bU5EPcsPxB4HNC68M98u77nqr/ztjlYU8k3EOFZEP3?=
 =?us-ascii?Q?zdzNXxgrBvZIK42exObAoRSUrWipSE9VRRv7sIfYKKB7G5PZBCECwliNwhBo?=
 =?us-ascii?Q?OUwghHfGHVCuH4SurLlkbfdbwvWdsNqnCUePhAdSJqfhsFSwuVc9csIxQwjW?=
 =?us-ascii?Q?QMn5E+Hm8LJ+WhrZSdS1KlLLZndWZ5blijT245gpnGDP4t01Y/+fIiuOWquH?=
 =?us-ascii?Q?2S7DZO3krLq+hI4Ys4yz3ht7/VYrynIcr09blDubycaT/Ui96gA3b0UY0s1F?=
 =?us-ascii?Q?f1WJ0DG5P0n8BGLW4+fYwVGC1f/8YWYXlS0GWKqpiMY4Fn4GlQIqBmXAynUh?=
 =?us-ascii?Q?nulW+t7EEJeFgOI4oqBhJeZwrfuJAuwL6uV3OVWgVjgo57HCQ8v1E8vnIQXI?=
 =?us-ascii?Q?sJzLxePesAYSp34sYn8aekJcRwiGavu7gTbqb2qnQc41TLWC65GFw3xN9hsB?=
 =?us-ascii?Q?1Ju7Ehfetx8xMMFApDs8ad7z0yFM5/b+GhgUYZquOXPTokdbwtp++LZpJVtw?=
 =?us-ascii?Q?gybAqz+EURggTZPXiseWND5xUn7ODHMSiEeLvYnLWHv5kBbP6fVM07OOJ1Zq?=
 =?us-ascii?Q?6Rn8CjXiwlnFPs4gCFKg7z4aTDkujrhBI1z0HXYmQeFIhxudzyfQH7Od4MWl?=
 =?us-ascii?Q?THCNiuNivktEKjBBdIL74TqLEccqFS/a9VvoP+xjXKPNLeLce9lbBhtB85ez?=
 =?us-ascii?Q?Yl72PE724Be+JvMBIY6Kq/usRN03iFadDmKpodKfIVgTHl5RQEd5md2+Uf7H?=
 =?us-ascii?Q?Lq7YT3OCV7J5r8h3jnWDn0xdbDYNIOJOjFdGPr05eL46K7piI3S7F/sJ+M5y?=
 =?us-ascii?Q?j14TT1/hAssiFqiuDtBlUbWzPccKlO+T9QdO57segpNRZajPedNta+1h2dMk?=
 =?us-ascii?Q?ZvNrwhCdqwb/e+c9PMn841VLs4V4/ddQ9FzQgv3eSy4HUAa0ZM8EQTatSvZk?=
 =?us-ascii?Q?ln3M1COKeEAtwHbbH4kbf45fwnz6v4Fpq+ucRh1G4IPCEw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LOGzOCM4MyiqieTlRj+2zp+qrZ6uhEacoHFe5yQPYROJny/wMOk45S6HLPZV?=
 =?us-ascii?Q?kEGFLF/rOgt/OxwvvKFodb1OvnrOxF8a1WQRbea9yY6NI7Q/AikC0URyze0b?=
 =?us-ascii?Q?nSSyhRewYcFXC8hcIpGFf2HzDpH594r44RRMeHZ6itZXQI+udrIsG/7oSYRW?=
 =?us-ascii?Q?OdvcVfhdzN3JX7TOE8J3Lc1WazxufOZjOvG4JK5ZefXQdfAmQVgk1EXaAg/h?=
 =?us-ascii?Q?bdPRZHansyMcpa7LN3i509FSWNjB1rPR0QIPSliYDXTK/OLEtfKyREaCNhK+?=
 =?us-ascii?Q?JZZ7k8PWu4EqTo7HakfKAr+Jlg9NRL8519cmOgyXqMTnsnHZRVy0d+MJZPNs?=
 =?us-ascii?Q?UXZzVVC+CZRAwvxrfzC/KgEPtJya2rk4MxqlgFXWTVJWHtPatJcgTQ9dmVtA?=
 =?us-ascii?Q?LSfVc79iFEOq0qQyQS/jizIiaCbG7tm8+XgTiotlhrM7m6O1tD4dmHc0KMxe?=
 =?us-ascii?Q?rU0IsF+vqFCb9cIcvvGz7YdLU3Xpb5j4pezs2xVveajoS4FyWwjwnJetN0UA?=
 =?us-ascii?Q?i7Pq709hBfV2y3spQA5KpcvnLtlQJkPoQyDKA0P91BzqLBz5u1UzsiWbcKBj?=
 =?us-ascii?Q?6H5/eCHanWVImED0X/E15KjN5oPx9x0zn81Heo28KrYcPUnW+tBAlxJFnCOu?=
 =?us-ascii?Q?LmGUsOUQunqf5RQY3GICOp2S0uUSFme2fA6ibYCXMfQdrwhJKAJL8/XfCTZE?=
 =?us-ascii?Q?mANlKkkav82Plk2AOLSJMuMrZO34vBt7CsDCAoSGp7gcDlvrguCPaZdhSQOO?=
 =?us-ascii?Q?M1uXn/+fy3u+DbxXQFebSHJ00AZZgCYwvQPT+WdidQuLLBlIvqwMUqLsfNdm?=
 =?us-ascii?Q?BOHx5gqeizHSBMu6XroeRKr/bKJqHKMa3i20so/orwdHzuJ2q5+NJZKmfG7l?=
 =?us-ascii?Q?8I7Pw5K8l1uv5012+pkKzn3hpkUCvEUJrqq2SggxDsZN4dVeZr1D4yAD9SeS?=
 =?us-ascii?Q?n6NDFcF9p7uVwGR3QexEAw31rlrpmkVykjn5HWE0EJOD0lfPzxF+h1MLvgXK?=
 =?us-ascii?Q?dEJoLDh75DIiSOtJ3Z7a9qWt5JMJmwstUdYYspN1Lwk9PsitwXiaZXuy9ohE?=
 =?us-ascii?Q?ibXOSNkIMkvvGfyI9BLNXwLzVssTsj7T7gswQ8k2hzZzZFLlnOm5VB9ON4d2?=
 =?us-ascii?Q?Gj2V+v7/FxfvZrOpVEEOZhdNpNBB9JW9SK9ObmPHHYrTQ08S+0nJY3wrbmy9?=
 =?us-ascii?Q?FRxiGDb4p4VNZYDDFfswH5lwcp4C3yhD9m+nEIebiwnF8nWwoqgFI/4A1ThR?=
 =?us-ascii?Q?nLBHFJDBibs53LKSmDxudd4OY9245wN+s8xSsm8mwySKjrGkLjgpvO5s4dgU?=
 =?us-ascii?Q?HarDEm5YakPNSfEDu/lZniszPFkMydxaFG0I1iq2P/CxwUFhvphDNW8StNkw?=
 =?us-ascii?Q?pjYBpS2dXJQPP5vsrRvi56a779mrxl/XDit0BGN+C7wKs88gsAiSrwkkVuvS?=
 =?us-ascii?Q?KcCXDK8jlkTRXc0/Er69P6zpYRdIaNnLkGJ69F7ZmNBcjl4Hi9wMayi8lHh3?=
 =?us-ascii?Q?doOKadd4QtyAjP4uqW31+jsW4cRkkCAx0HYhuIbDwTX1hQ+hNlZ/PMs632b1?=
 =?us-ascii?Q?K1/C0+/iEM6k03KmVs6RsI7CxANaoAqtz8/zggqA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q0OmZENzF85+iVvr1hh0GhfW88nnwViAgxzQJJMcje8QwDIEcMFbKvV2euJUZqKkWH0l0Ot/Sf3qlYWRSYv3sJGrOQT6pevneH83NEZ1TCkGbbWWfxB3aofQnmD02LExFowj16DIn3kvMIv/K+TsNNd9mbMY5M92Ywb0IlI72DY2bKP+dZ2GlPe/EDlc96bcwn6RNSZayvk0dboD6tboI33z5EAp7eCzm4a6SMqSCkKD/Y/1XXTGK9zgK+oLFQEsDFHospHAO72Dhnz8jlqCLBfWbbZLcFxJN4y+ouUkNzNKOfW2ADAro7k0hhVK5xvAm8WXwUTLlOBmXIgYNfmgpiAZ1AxPDlg06LlH67Sli0tHvP52aeYD/QwqJVC3uvfJdxtYTdtfi9hOSwmO7lzfGtkFHmM1nuc5Y5euwH0Oe5leUQW+rnZvIfOhC5mMdBym0YEdVwNL/4Cmx8ymFylPRQdFyOO/pn2xoBC7I/MFwlwafazCD6r1BbNh/BmaMNx38S4J/d3Yz92nG7/4n2QG5gvOONjWHYJRk8u0zngCELIV62yxqKFR4WBLqmPNCemJ4KRKY72ZluoacDHBdIzIAzV15VOW453BGEECpWsMXmU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b396b391-342f-499d-f706-08dd1af1e095
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 21:13:51.8127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0T6EgYRApZ011tToRm0TXJ9JOIphv0PMbKdRm4EFBj4zlp28DMAuNGIGwp9nlEXsT4SgItxDtXWcamU85zgig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6061
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_10,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=799 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412120154
X-Proofpoint-ORIG-GUID: sqmnCMKYH19Czut-__EBhERqRP1gYyDB
X-Proofpoint-GUID: sqmnCMKYH19Czut-__EBhERqRP1gYyDB
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

* Kalesh Singh <kaleshsingh@google.com> [241211 18:28]:
> Introduce arc arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
> This is a preparatory patch, no functional change is introduced.

You have changed the order of the map fixed check and the len check.

I *think* what you have done is correct, but your comment is certainly
wrong.

Your generic call also has more checks than exist in this version of the
code - which, again is probably good, but a functional change surely?

> 
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
> 
> Changes in v2:
>   - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
>     special case of the hint addr being "enforced", per Yang Shi.
>   - Consolidate error handling in arch_mmap_hint().
> 
>  arch/arc/include/asm/pgtable.h |  1 +
>  arch/arc/mm/mmap.c             | 43 +++++++++++++++++-----------------
>  2 files changed, 23 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
> index 4cf45a99fd79..af3210ea4888 100644
> --- a/arch/arc/include/asm/pgtable.h
> +++ b/arch/arc/include/asm/pgtable.h
> @@ -28,6 +28,7 @@ extern pgd_t swapper_pg_dir[] __aligned(PAGE_SIZE);
>  
>  /* to cope with aliasing VIPT cache */
>  #define HAVE_ARCH_UNMAPPED_AREA
> +#define HAVE_ARCH_MMAP_HINT
>  
>  #endif /* __ASSEMBLY__ */
>  
> diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
> index 2185afe8d59f..df01d4d9964b 100644
> --- a/arch/arc/mm/mmap.c
> +++ b/arch/arc/mm/mmap.c
> @@ -14,6 +14,26 @@
>  
>  #include <asm/cacheflush.h>
>  
> +unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
> +			     unsigned long len, unsigned long pgoff,
> +			     unsigned long flags)
> +{
> +	if (len > TASK_SIZE)
> +		return -ENOMEM;
> +
> +	/*
> +	 * We enforce the MAP_FIXED case.
> +	 */
> +	if (flags & MAP_FIXED) {
> +		if (flags & MAP_SHARED &&
> +		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
> +			return -EINVAL;
> +		return addr;
> +	}
> +
> +	return generic_mmap_hint(filp, addr, len, pgoff, flags);
> +}
> +
>  /*
>   * Ensure that shared mappings are correctly aligned to
>   * avoid aliasing issues with VIPT caches.
> @@ -27,30 +47,11 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  		unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
> -	struct vm_area_struct *vma;
>  	struct vm_unmapped_area_info info = {};
>  
> -	/*
> -	 * We enforce the MAP_FIXED case.
> -	 */
> -	if (flags & MAP_FIXED) {
> -		if (flags & MAP_SHARED &&
> -		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
> -			return -EINVAL;
> +	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
> +	if (addr)
>  		return addr;
> -	}
> -
> -	if (len > TASK_SIZE)
> -		return -ENOMEM;
> -
> -	if (addr) {
> -		addr = PAGE_ALIGN(addr);
> -
> -		vma = find_vma(mm, addr);
> -		if (TASK_SIZE - len >= addr &&
> -		    (!vma || addr + len <= vm_start_gap(vma)))
> -			return addr;
> -	}
>  
>  	info.length = len;
>  	info.low_limit = mm->mmap_base;
> -- 
> 2.47.0.338.g60cca15819-goog
> 
> 

