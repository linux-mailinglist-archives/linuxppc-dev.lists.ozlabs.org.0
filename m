Return-Path: <linuxppc-dev+bounces-11748-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FEFB4445D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 19:29:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHmgl4kQVz2yx8;
	Fri,  5 Sep 2025 03:29:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757006979;
	cv=pass; b=ECQBfA19vE4x8DFSPZMfNDu5OIn0X957uw295pZanQELCIR08EFgYe3689VyPNLdHiL+3C0W41TF1d6N1CSpWP+A2uXckpRao4fHZJkfl0AoyJd9DNLIFJZdmNzqyNo0aID2w4xb9GblfP1vf817sETz9JYhVqY5Mdp9hEIcBV1OelWVOnBt6Jxp71TuXEFhdQeCbVePEfoeq7o8c5nnD/ksJ7/+/uGTH1kvW43EXzR0Y5pFEF1tl/JBtRJkmi/Yy7ZGqE8m+2/5OOIbQR+073BYQnNR4BMEBM7d3pKQAWQmUGSmAKdNGCig/8Kp5gTW/v/kbWgU33Uebv/om8lGyw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757006979; c=relaxed/relaxed;
	bh=LF2G2NPm3MsLQzTUfa9jpynsdPan5ydgu5DT+jSFOTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P5A1YuKgaQatvWbJdVTieLdz2kwXVh6sYZP1TLyUYu0tMkhbG6l4c7FMjp5zjX6MSCk7cMUiHwT8EfRo4lXzdi0C/kOG6bNmXy9A+ihTS9xJAln6zNdv1eCWxvXpjom6JM/wrSiOQX77tg36sTpK8l9VIy6s49jCX2h26ZA4TYGzpo13LEoz1rmT4/U8U7sawKzp+tzhBC+hoG5y17rs49PZdYOnNBCqeqroeaoeH6efxuHT4Kq6sJK2xvG2QlxRiVKBCx3Akm/kbjnesVmf9Gt/NJsrJd+rxwgDzxwqGSR4FAugPNmAlDExmkzuBevsh3y77NBtKQAupOXjuRPAPA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=PoEsVtoe; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=J/QyW5Eg; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=PoEsVtoe;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=J/QyW5Eg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHmgk1gsRz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 03:29:37 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584H9gVS006612;
	Thu, 4 Sep 2025 17:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LF2G2NPm3MsLQzTUfa9jpynsdPan5ydgu5DT+jSFOTo=; b=
	PoEsVtoeLRK3Zr0BYUo5JMO+5pCeP7PXOyMhjl1WQAvVAorfDTB+1IjPaei6fK9X
	Gcv1F1UtV09ZL2vbnWdmX7hxvt5qe+VZ5WPWhnbS9FDe7JjUjYge4NjDLwUGdoZZ
	Z7tNDvRyLdljDIUZAjrWz4EVUvPRyUnfL1+IfpnFurRQ/4Ie02MjGgvanBt9eCgK
	wQpfh0v5GX58uETbC9DpHiU3vePgL8MOS2XR0f9Dh7uCxak3Q20pi3b9qQgefzq9
	WbWTof/AO+XhwMixJJc0gaRHuJt+YrzGuXTJmmiSmfcw9GrV7aFOGgnejBoOlv3E
	0Xt7Nfhad3I3c2YB2uL4yA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48yewx00vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 17:28:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 584HAWjO031009;
	Thu, 4 Sep 2025 17:28:41 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrbx6dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 17:28:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHfivJswNxHbZnP4eDMn+SOUuXl3pFL55lLoBf0JQ7oOB1FJ0J5NWHQdiuKz6EFA6nlqVln4J6GyZwQ0uBL/vI0vdB7kUCkHzUefnLizNdvkpgl9VRN7reVsEHNmRtVamA+mM/KtVh4+sVLTfhqLX4kL+NA0fbuV/I9s55E40VqFAbLa38iuqzXo5G3LRQY7Tt5dPr6akONL+7yohKoLfjIKTFh8qOlO441wzJkh3R1CKsj1eabBhZRXZlLMK2IuqXh4rork4zuuB2gPKncyQtWi8/Wj6MeSgmpqVO+DvuCSge8qdjsXh3YHaU5jhKRk+fzclK5HxzPV1YylTwFZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LF2G2NPm3MsLQzTUfa9jpynsdPan5ydgu5DT+jSFOTo=;
 b=TzSg7wSMo1UlosK6kz4JeU36NwPpRzLmBcC39gwUfUyL4H+RWuDcIRbnWd5Fu44Ud4LGrzr2K+3Yiz5wwFHUOX7z6wZb6wxd6fJqYXIPniwIFZpbSo87nYIm7PRIXXLiHPnNjw10f+6CbT+tC+/DPf68ipUg+qiy6YqadwenPfqas1pVnUHVb03Mpu6Y+28nXznEsp5ewwrq+sNMn5WjrSx7O/tHPCV/u5zU3KszlBzo2ANre7eXDkqc1bt817Kf1xVJWBBZCaiIojaOKLlA+IgzloTkwLMT3kStfu9sos7XrdfiOCT+fsz6tGHMk2x8C/FhVHyNwe2aPy8ZsysfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LF2G2NPm3MsLQzTUfa9jpynsdPan5ydgu5DT+jSFOTo=;
 b=J/QyW5EgKQ5eJfAlwxZZmoKAMkOOC5k8oTS4z+58b+2t3XUj1ct27Gac1sZcFxfau+aTUIGup5PnMvo5P2+ipud+cT/vtjQnpUE94NUwKLWRkKfJ8y/+dmaxHYz/ING6BPTw0tlpOuANvML75fCjqWV5FxbRpxhNR2Z8HTzu+yI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH8PR10MB6340.namprd10.prod.outlook.com (2603:10b6:510:1cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 17:28:37 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 17:28:37 +0000
Date: Thu, 4 Sep 2025 18:28:30 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
Message-ID: <22131943-3f92-4f5a-be28-7b668c07a25c@lucifer.local>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250904125736.3918646-3-kevin.brodsky@arm.com>
X-ClientProxiedBy: MM0P280CA0011.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::33) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
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
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH8PR10MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b28cd3-50b2-475e-e506-08ddebd87b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDdzUFM3dk5GQk0yVEE4SkZISUtERE1GdHZMZ1lpa01Dd1M5SFlFTGhKUlhT?=
 =?utf-8?B?TUFpVmtvWHArMi94NmNJSXpiQjBiRDZvTHg4WDRGM3h4cW1CcmhRTUR1V3lq?=
 =?utf-8?B?UTVlam1MYWg4cmFqejZMalp0UzlwMW9tTWJtYkt4eElIZ1lYMjJSak4rcjJl?=
 =?utf-8?B?Kzd3bVl2Si8wcHhEZVU3YmFRYXRVYVBId29mQXBieDZSbVFhYWpmN215ajBD?=
 =?utf-8?B?RHVJZngwQlZSbEZBTFlESEdCaHBJK0lPV3JKbzkyOSsyVTlySVc1WmMxN3Zq?=
 =?utf-8?B?cE56UDF6TWJZYlJ4UzlCT0kxalJxeWp3YUdKZ2E3TWVKQ2lFNlMrZFRaNFhT?=
 =?utf-8?B?amZGZ1YyVitxUER3OGttZ1lQb0kzQXRFYm82VTgrV08ySTM1aEE5RGlRUjVE?=
 =?utf-8?B?cUNHZ0F4b1BhaHYwT0IzR1BBNFJPWDQ2U09sVVAzKzNsaDdHQXNvK1VXK051?=
 =?utf-8?B?TURuVlNKNXVmd3o0cGVOa042Tk5oR0x3Z0hIUnZIUS9PdTNyTUZDcU1CLzBE?=
 =?utf-8?B?SWVSMXVERzc1SmhoZllkZkRiRUlHRFhHM2pwWjNvRnJPYldTbDJObjhxejdG?=
 =?utf-8?B?VkJwcFg1MnltRS9LV2pibWkvbVhVMmF2a0JnZGhiL0NhZUVwQ3FtNTFiSS9a?=
 =?utf-8?B?Y2tvRWZaL0ZEUEFQcFhLUlRlYlBFanM4Vlp4TzhWU1FBaHROTDBWTkxpV0x6?=
 =?utf-8?B?NDlrVUZEWXh0RmpXMjV0QlN2YzRjMWkzQ2hVVGlMQ2owclRTV3Z2dlVZdWVX?=
 =?utf-8?B?aGpmTGljR2oxTkJtT1ltTktUdGtZaXp5WmprMnlOSlFILy9ZWlJ5M2YyaVNy?=
 =?utf-8?B?VURLdWRtSHlCSDRqazJYK3oxcnR5ekNJTms0aDV1eTN0Und5TGZFOEF3cDRW?=
 =?utf-8?B?OVVVVE15T2JPUGN4My9mUXBDbE1SQWY0NWU5YkZHczd2NzJaRmR0Y0d5QzRX?=
 =?utf-8?B?bGNsVUZxSE9kbTVnd0phcmtjQlBhNG5pRWN1bzRqR1B4L0d0dHNyVFhkcThj?=
 =?utf-8?B?SHYvVDI5RFV1RkNRcnNCYnNaUTJqTHBNSnZsOUNCVU9PUWVtYU5WVzhpUFZP?=
 =?utf-8?B?emhqVkdzQTdWSVo2cHUxOGRFM2xsSGNwSmYveVJkZVptQ1NlclFVS3lBWVh5?=
 =?utf-8?B?Qmg3UktxUWVUa0pQSS9PY0JReHhuTmYzSnk0TStHUSt4dE9KaWhheWNFL3lX?=
 =?utf-8?B?YWtCb0tNOVBLeDUzM0wvZUFIN0NMS1phdExHN0lvZ0FqdUpQb3F1VHBESXU4?=
 =?utf-8?B?SzNsRVdTNTd6VkVXM29SV1lyUTBHOHZCaFd0VDk2dDV1aGxVZGFVejV1WjNL?=
 =?utf-8?B?UWpqSW9lc3BJazkzRU16UERLRkF4Yjkrd0ptMjVQOVNpTU9pWVYrMGNhSEtx?=
 =?utf-8?B?d0NhR2hMdjJuVkJHT3Nld2UyTVhYdEkva0x0WlZkM1l3NzkrRUliY2c1T2lC?=
 =?utf-8?B?UHdVZHNiUmZBTUR6c1pwRG1HS3dpeXU0SitBb0ZMaXhOVXllL3doVml4dFVp?=
 =?utf-8?B?L3RYS2MzSnlSYWdvU1dOL3RBVmJXaE9nYWpOQmhBbi9OTWlTTGh6VXhKekFp?=
 =?utf-8?B?MEZ4MzFPblo3OFBXSzVEcmV5VTQ4UXM3L2lXcTRxc05NaFRjZ3krZ2VhZE5t?=
 =?utf-8?B?RGtlTGxpajIzdEIrVzJlQ0J4bXlMSWFFRUNPTGhNSE1nbFdHbmlLdE44R3ZV?=
 =?utf-8?B?ZFh4SENLRGMyYk1ZWG1rU3JuNzdxaE40NmQyaC9WamJidGNNaGJ1dXVzVFVS?=
 =?utf-8?B?ZG43ams3UXlqSy9FS1NjU05xS3l5S1IySktrRk9QYXNsLzJWci9rd0MvNjRv?=
 =?utf-8?B?RGtoK29iUjVMWXhmU1hVdUxEMHljOGhHSjh5d0QxbmliTHlKT3hOMFdsSXlJ?=
 =?utf-8?B?d0lPeG1vQjVGL1RteW5MSDZBditKZS9DRVFXeFV1RSttTFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUdkanFOQ01pWFRTVzVJR1JJOFJoVnRrczVweS9XSXlKZyszclhsS3ZuSXRh?=
 =?utf-8?B?UEJCOVVtcXFTb1VVWHN4VUNsM2VZY0xyWWsxL3daZU1nRWk2WGZQQlhtTW01?=
 =?utf-8?B?VDlKamc1TzdiU2pqWVdSQ01nMHdwS0IrNmRXc3p1UnJTQ1dqaEk5STZoTjNj?=
 =?utf-8?B?MW55Q1dnK2NmbFhlWTA3Q2FsZ2tybFJGTzR5eDlBV2d4b245V1lkYlZyd1Aw?=
 =?utf-8?B?S2dmQlFPdGorU1VQck1JOHBadm5BZU1qb01VTldrci9nWDJOKzg3elc5T2d4?=
 =?utf-8?B?RW9XRllEUUFaNmtJNkNIbzluTHpJM0ZTVWlrV281V2NOckxDVG9zV29oTUht?=
 =?utf-8?B?aERocmFIa0lZMm1LY1V1R0JXSGVSdE95aFJuR3FldWpIUDl4L1lSZG82OVJL?=
 =?utf-8?B?eGVBSTU2TXhuSWxGV3oxNzhaS2ZNNkVjUUJNL0FEY3NoV1pNK3Jia1ZzNlMw?=
 =?utf-8?B?b3VnWU5vRUw1RkhVWFMyMlBHRldnTVphMFViSWZJTFZGT21BUUMrWkhPWTFG?=
 =?utf-8?B?REdiQ1pIUnBnZDZnSm5nTFMwdTJzOEt2cTloNnVLUldnSVQ0dnRLSGRTREdO?=
 =?utf-8?B?RTFlUjJsY2ZMU2I4TTJsZExGYVVFSkd0SlRucy9xZ2dBQjh6WmpJdzY3U2JE?=
 =?utf-8?B?UkRIU2xBYWVvbzUrL3h4WlRvS1pYVWQ3VUt2S28yVW9MS004RGJ5ODMvOHlq?=
 =?utf-8?B?bVUra2RTZ1ZDeTVEV0U3dGY2b3ozU3B0VlFlQjh0cm9DNXZyZ2o0dmVXNm9y?=
 =?utf-8?B?OVJXOTVDRmFjS1hMUnlUOXB3YkNOdE5HZ0l0K1JpTVBlS2syeXJqcFFkN2t3?=
 =?utf-8?B?UEJTeXo4WGJnWDkvaUFySlprL1FUSHBUdDhLVXU3VkR6d0p6Ukl3Um5XYmR1?=
 =?utf-8?B?cVBTZWxXSXlYQXIrM3UyU3NycGVSSGhZdmxlREo2Q001RkE5OTFwaXd0blFw?=
 =?utf-8?B?NXQxQ2NMOTNkbEdOamhxaGZtV0lJVVRWYXFkNGI2SHZaVmhheG9adnV4SzYv?=
 =?utf-8?B?eXdqaGp2bG5RRzcrU3dHMzZHMTQ4K0hENjdxdHZpR0R1ZUp1Y2ZrOU1wYm5X?=
 =?utf-8?B?a1A3cmpYVEROdUNQNmRtVU5uQVY5MmpuTWVFUTduZ0JkZkdzN0pDRDJIV1hR?=
 =?utf-8?B?U3lnTGE1L0FGb3dCNklxMy9iRk1YSXBLOUZja0hOZXlSSEtscFNsMXBMQVI5?=
 =?utf-8?B?ZTJlTWQ3eXZydUcrZ2ltd2RPWm0vWXdoYmlxU3BxOEdTMUd5bGhYR0h0SU5Y?=
 =?utf-8?B?SDBTK1ArVWM3Qlc1SHZKQzNsRWN4YW91dE1rREtqN0g3UzIrMjVRODFrVW5n?=
 =?utf-8?B?WVFwcS9kLzhFSEoyUGFqcURzQUVVUVJIWG45VkQrTnVoRC9tbHdjMW4wVUtB?=
 =?utf-8?B?M3hwQUZmM3lSRjRTRmZHU3owL2VlRkVOaCtTOWcvSmw1OXNaeDBHQXZXRkNM?=
 =?utf-8?B?M1FCbDBleWQrOEluWUs5Z0RJd2xVVkN4QjlRQ3hYSmZuY3VOd0o4WWNkRFZo?=
 =?utf-8?B?cFl5RkNYaXlOUkJvVTZrTEtFY1oxM0tzUFJ3T1EyTFFrb0JtOFZnbFRMajEv?=
 =?utf-8?B?Z2VtNENEb0xpc0tZS25LakI4YUR4S0tSWEVaM05xS1VvRVFFbVZUZ3NlME0x?=
 =?utf-8?B?TU93NGlESk1JL1BWcnVxQ1pUdWNYYmNoZURLSHNoTGxFOXdMeE1PaURRTCtw?=
 =?utf-8?B?ZzlSdm5NeHVoVXhQaWhlOWpQMVhpdnRpK3ErOWdEVkN3dVRnc3ozblNPTXRj?=
 =?utf-8?B?a2NaRlI4M0xNaVlKam5aZkRaeERLYkZpQVRSWk5FUk04eFNuVzZ1Ym92Y1Bj?=
 =?utf-8?B?aElsYVgzNCswdEVvYWY1Uk95Tis5MVgyMTlSUUo4dFdNTU9nRC9yV3Ixbzl6?=
 =?utf-8?B?aTVQMWU1c1BzZWd3OWJRSkovenJsTi96Nno5QzAxSjYrSWUvRDdUendtdGpO?=
 =?utf-8?B?bCtnc0twTnNJU1d4M2NOdzF4UDY1b2NqWGl2Uk1SVkMwY1FEZkladnUra2lm?=
 =?utf-8?B?ZkxON2VPSVpmUGwya2FHajBKZzYxWC8rWmNYajZnZVNUWjhENWVsNmdJOG5P?=
 =?utf-8?B?aFp3aG0vNk1RcUJETGlicjVZQ0kzTHFEUFQ2M3RnUm9rb2NZWmZmMzFyTDJJ?=
 =?utf-8?B?YWZ0cGRueHJmd3p5c2MwM0JTL0pNT1NXWUsxSnk5NjFWekhGRHZvUktwaEMx?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OpAQu6u1fg91tf/+ls7CLxI95stDEMDd+M2be/qdu8Qg3QDVhP9QfwX8+WyAIJqWHlomTdmQrXdcK0tlLTfYdd8KGKtZBxlqNtmq+kIFMF+JLq3RvnTaO7YwV6yaluYsONj4spsXbi8bHyFOMQVqNfFHemXP4l+8DuoMlQZ+hSwDzyMDsShRYOTw/2w6beLRX9WJ3ZQqsnaEF0Le4e+6qiZrWIkl0CJ/oa8RCpT+wMGZywa4hDvjn4vNDaToADc4GL8WoU1W12z18OqggRWw95PC53OaYTHrJzBFDMKCV/U1IYNXZSwLe5VbjEd7ce/UK1QPiLCHJHZcU8qLChScaRDVtWntFDceVWH9dIFCUaku84SBGsxHBEQPm8bhAesDsELAMlKP9530dNK7rlys3lZ3iVDV/b5XPhgC7EfDWrFe6lVnsBe82+u4FaC0/c/UNuxwaIZAPDOzAqS85/fUTq2ozYngqFcWRMsmp9+NH3wdUiVc0roArCBUcp+4AtxcPGG8dBy3EQQ8T668XKyvaC3BhNPHT236mDJUvRe8WHpyfXQNvbCtSDqeLQp4pV21Cp+XOyC9lN2P/pANCexAx+21SEHZmKTB0HPNY6mvT9c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b28cd3-50b2-475e-e506-08ddebd87b4d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 17:28:37.2573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctG8KvbY0zFlyb0WOAKEQq6qlwTdOGP2oLJmXLj5ccLFJEL4Zx8efU2pI5ZvDaGmoNmtClLFekpf4Zu12SOG0T0wfEnmHyPTl8S9v+hzbyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6340
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509040172
X-Proofpoint-GUID: g5lBYVr94SgUq3nY8TTpYRPxuH2LzrwH
X-Proofpoint-ORIG-GUID: g5lBYVr94SgUq3nY8TTpYRPxuH2LzrwH
X-Authority-Analysis: v=2.4 cv=M6FNKzws c=1 sm=1 tr=0 ts=68b9cc4a b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=eOSbTCzkzg-9sdUchKgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf
 awl=host:13602
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2OSBTYWx0ZWRfX7RaI/6EU65HE
 C33YcWvj97H3ccDVOMJOXk2GgPpjuWpqhMo7Sw2luNUKLgmpvjap9wHX0fRwJzhlUo23zqLArzM
 gNeZLNTFa+GnU1JY4t55L8+IpHacZvPVmUO16KRF83xq6Rv8yukTcx3IBRdBu9f7rfSPB+G216w
 JQZs04mptj048TExs9VQZnnd8TmxtNUrq7yjZasneeCS0E4x26zgXavY2yIc+5NjULhg724fo5E
 /X85taJqxx5FTuzXAk6xn8bvbn8+XZDkIcvIzFS803uPqYXQwCS7YYbdnbK2oErheOC1QP4PCr8
 Q9sWmhAuNQkRuEqbxSJzWOwpc1KDz71RZ5V8fejFAMlaYJLq3Q0+i4/A/YJfSCB6ofMtTztLwzg
 tyfZTMQ3DwuBXdNQToTzepevK3L2+g==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Kevin,

This is causing a build failure:

In file included from ./include/linux/mm.h:31,
                 from mm/userfaultfd.c:8:
mm/userfaultfd.c: In function ‘move_present_ptes’:
./include/linux/pgtable.h:247:41: error: statement with no effect [-Werror=unused-value]
  247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
      |                                         ^
mm/userfaultfd.c:1103:9: note: in expansion of macro ‘arch_enter_lazy_mmu_mode’
 1103 |         arch_enter_lazy_mmu_mode();
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/pgtable.h:248:54: error: expected expression before ‘)’ token
  248 | #define arch_leave_lazy_mmu_mode(state) ((void)(state))
      |                                                      ^
mm/userfaultfd.c:1141:9: note: in expansion of macro ‘arch_leave_lazy_mmu_mode’
 1141 |         arch_leave_lazy_mmu_mode();
      |         ^~~~~~~~~~~~~~~~~~~~~~~~

It seems you haven't carefully checked call sites here, please do very
carefully recheck these - I see Yeoreum reported a mising kasan case, so I
suggest you just aggressively grep this + make sure you've covered all
bases :)

Cheers, Lorenzo


On Thu, Sep 04, 2025 at 01:57:31PM +0100, Kevin Brodsky wrote:
> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
> (taking and returning no value). This is proving problematic in
> situations where leave() needs to restore some context back to its
> original state (before enter() was called). In particular, this
> makes it difficult to support the nesting of lazy_mmu sections -
> leave() does not know whether the matching enter() call occurred
> while lazy_mmu was already enabled, and whether to disable it or
> not.
>
> This patch gives all architectures the chance to store local state
> while inside a lazy_mmu section by making enter() return some value,
> storing it in a local variable, and having leave() take that value.
> That value is typed lazy_mmu_state_t - each architecture defining
> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
> For now we define it as int everywhere, which is sufficient to
> support nesting.
>
> The diff is unfortunately rather large as all the API changes need
> to be done atomically. Main parts:
>
> * Changing the prototypes of arch_{enter,leave}_lazy_mmu_mode()
>   in generic and arch code, and introducing lazy_mmu_state_t.
>
> * Introducing LAZY_MMU_{DEFAULT,NESTED} for future support of
>   nesting. enter() always returns LAZY_MMU_DEFAULT for now.
>   (linux/mm_types.h is not the most natural location for defining
>   those constants, but there is no other obvious header that is
>   accessible where arch's implement the helpers.)
>
> * Changing all lazy_mmu sections to introduce a lazy_mmu_state
>   local variable, having enter() set it and leave() take it. Most of
>   these changes were generated using the Coccinelle script below.
>
> @@
> @@
> {
> + lazy_mmu_state_t lazy_mmu_state;
> ...
> - arch_enter_lazy_mmu_mode();
> + lazy_mmu_state = arch_enter_lazy_mmu_mode();
> ...
> - arch_leave_lazy_mmu_mode();
> + arch_leave_lazy_mmu_mode(lazy_mmu_state);
> ...
> }
>
> Note: it is difficult to provide a default definition of
> lazy_mmu_state_t for architectures implementing lazy_mmu, because
> that definition would need to be available in
> arch/x86/include/asm/paravirt_types.h and adding a new generic
>  #include there is very tricky due to the existing header soup.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h              | 10 +++++++---
>  .../include/asm/book3s/64/tlbflush-hash.h     |  9 ++++++---
>  arch/powerpc/mm/book3s64/hash_tlb.c           | 10 ++++++----
>  arch/powerpc/mm/book3s64/subpage_prot.c       |  5 +++--
>  arch/sparc/include/asm/tlbflush_64.h          |  5 +++--
>  arch/sparc/mm/tlb.c                           |  6 ++++--
>  arch/x86/include/asm/paravirt.h               |  6 ++++--
>  arch/x86/include/asm/paravirt_types.h         |  2 ++
>  arch/x86/xen/enlighten_pv.c                   |  2 +-
>  arch/x86/xen/mmu_pv.c                         |  2 +-
>  fs/proc/task_mmu.c                            |  5 +++--
>  include/linux/mm_types.h                      |  3 +++
>  include/linux/pgtable.h                       |  6 ++++--
>  mm/madvise.c                                  | 20 ++++++++++---------
>  mm/memory.c                                   | 20 +++++++++++--------
>  mm/migrate_device.c                           |  5 +++--
>  mm/mprotect.c                                 |  5 +++--
>  mm/mremap.c                                   |  5 +++--
>  mm/vmalloc.c                                  | 15 ++++++++------
>  mm/vmscan.c                                   | 15 ++++++++------
>  20 files changed, 97 insertions(+), 59 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 728d7b6ed20a..816197d08165 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -81,7 +81,9 @@ static inline void queue_pte_barriers(void)
>  }
>
>  #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> -static inline void arch_enter_lazy_mmu_mode(void)
> +typedef int lazy_mmu_state_t;
> +
> +static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  {
>  	/*
>  	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
> @@ -96,12 +98,14 @@ static inline void arch_enter_lazy_mmu_mode(void)
>  	 */
>
>  	if (in_interrupt())
> -		return;
> +		return LAZY_MMU_DEFAULT;
>
>  	set_thread_flag(TIF_LAZY_MMU);
> +
> +	return LAZY_MMU_DEFAULT;
>  }
>
> -static inline void arch_leave_lazy_mmu_mode(void)
> +static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>  {
>  	if (in_interrupt())
>  		return;
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index 176d7fd79eeb..c9f1e819e567 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -25,13 +25,14 @@ DECLARE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
>  extern void __flush_tlb_pending(struct ppc64_tlb_batch *batch);
>
>  #define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> +typedef int lazy_mmu_state_t;
>
> -static inline void arch_enter_lazy_mmu_mode(void)
> +static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  {
>  	struct ppc64_tlb_batch *batch;
>
>  	if (radix_enabled())
> -		return;
> +		return LAZY_MMU_DEFAULT;
>  	/*
>  	 * apply_to_page_range can call us this preempt enabled when
>  	 * operating on kernel page tables.
> @@ -39,9 +40,11 @@ static inline void arch_enter_lazy_mmu_mode(void)
>  	preempt_disable();
>  	batch = this_cpu_ptr(&ppc64_tlb_batch);
>  	batch->active = 1;
> +
> +	return LAZY_MMU_DEFAULT;
>  }
>
> -static inline void arch_leave_lazy_mmu_mode(void)
> +static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>  {
>  	struct ppc64_tlb_batch *batch;
>
> diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
> index 21fcad97ae80..ee664f88e679 100644
> --- a/arch/powerpc/mm/book3s64/hash_tlb.c
> +++ b/arch/powerpc/mm/book3s64/hash_tlb.c
> @@ -189,6 +189,7 @@ void hash__tlb_flush(struct mmu_gather *tlb)
>   */
>  void __flush_hash_table_range(unsigned long start, unsigned long end)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	int hugepage_shift;
>  	unsigned long flags;
>
> @@ -205,7 +206,7 @@ void __flush_hash_table_range(unsigned long start, unsigned long end)
>  	 * way to do things but is fine for our needs here.
>  	 */
>  	local_irq_save(flags);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	for (; start < end; start += PAGE_SIZE) {
>  		pte_t *ptep = find_init_mm_pte(start, &hugepage_shift);
>  		unsigned long pte;
> @@ -217,12 +218,13 @@ void __flush_hash_table_range(unsigned long start, unsigned long end)
>  			continue;
>  		hpte_need_flush(&init_mm, start, ptep, pte, hugepage_shift);
>  	}
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	local_irq_restore(flags);
>  }
>
>  void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long addr)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pte_t *pte;
>  	pte_t *start_pte;
>  	unsigned long flags;
> @@ -237,7 +239,7 @@ void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long
>  	 * way to do things but is fine for our needs here.
>  	 */
>  	local_irq_save(flags);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	start_pte = pte_offset_map(pmd, addr);
>  	if (!start_pte)
>  		goto out;
> @@ -249,6 +251,6 @@ void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long
>  	}
>  	pte_unmap(start_pte);
>  out:
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	local_irq_restore(flags);
>  }
> diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book3s64/subpage_prot.c
> index ec98e526167e..4720f9f321af 100644
> --- a/arch/powerpc/mm/book3s64/subpage_prot.c
> +++ b/arch/powerpc/mm/book3s64/subpage_prot.c
> @@ -53,6 +53,7 @@ void subpage_prot_free(struct mm_struct *mm)
>  static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
>  			     int npages)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pgd_t *pgd;
>  	p4d_t *p4d;
>  	pud_t *pud;
> @@ -73,13 +74,13 @@ static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
>  	pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
>  	if (!pte)
>  		return;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	for (; npages > 0; --npages) {
>  		pte_update(mm, addr, pte, 0, 0, 0);
>  		addr += PAGE_SIZE;
>  		++pte;
>  	}
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(pte - 1, ptl);
>  }
>
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index cd144eb31bdd..02c93a4e6af5 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -40,10 +40,11 @@ static inline void flush_tlb_range(struct vm_area_struct *vma,
>  void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>
>  #define __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> +typedef int lazy_mmu_state_t;
>
>  void flush_tlb_pending(void);
> -void arch_enter_lazy_mmu_mode(void);
> -void arch_leave_lazy_mmu_mode(void);
> +lazy_mmu_state_t arch_enter_lazy_mmu_mode(void);
> +void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state);
>
>  /* Local cpu only.  */
>  void __flush_tlb_all(void);
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index a35ddcca5e76..bf5094b770af 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -50,16 +50,18 @@ void flush_tlb_pending(void)
>  	put_cpu_var(tlb_batch);
>  }
>
> -void arch_enter_lazy_mmu_mode(void)
> +lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  {
>  	struct tlb_batch *tb;
>
>  	preempt_disable();
>  	tb = this_cpu_ptr(&tlb_batch);
>  	tb->active = 1;
> +
> +	return LAZY_MMU_DEFAULT;
>  }
>
> -void arch_leave_lazy_mmu_mode(void)
> +void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>  {
>  	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
>
> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
> index b5e59a7ba0d0..65a0d394fba1 100644
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -527,12 +527,14 @@ static inline void arch_end_context_switch(struct task_struct *next)
>  }
>
>  #define  __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> -static inline void arch_enter_lazy_mmu_mode(void)
> +static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>  {
>  	PVOP_VCALL0(mmu.lazy_mode.enter);
> +
> +	return LAZY_MMU_DEFAULT;
>  }
>
> -static inline void arch_leave_lazy_mmu_mode(void)
> +static inline void arch_leave_lazy_mmu_mode(lazy_mmu_state_t state)
>  {
>  	PVOP_VCALL0(mmu.lazy_mode.leave);
>  }
> diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
> index 37a8627d8277..bc1af86868a3 100644
> --- a/arch/x86/include/asm/paravirt_types.h
> +++ b/arch/x86/include/asm/paravirt_types.h
> @@ -41,6 +41,8 @@ struct pv_info {
>  };
>
>  #ifdef CONFIG_PARAVIRT_XXL
> +typedef int lazy_mmu_state_t;
> +
>  struct pv_lazy_ops {
>  	/* Set deferred update mode, used for batching operations. */
>  	void (*enter)(void);
> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 26bbaf4b7330..a245ba47a631 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -426,7 +426,7 @@ static void xen_start_context_switch(struct task_struct *prev)
>  	BUG_ON(preemptible());
>
>  	if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU) {
> -		arch_leave_lazy_mmu_mode();
> +		arch_leave_lazy_mmu_mode(LAZY_MMU_DEFAULT);
>  		set_ti_thread_flag(task_thread_info(prev), TIF_LAZY_MMU_UPDATES);
>  	}
>  	enter_lazy(XEN_LAZY_CPU);
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index 2a4a8deaf612..2039d5132ca3 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2140,7 +2140,7 @@ static void xen_flush_lazy_mmu(void)
>  	preempt_disable();
>
>  	if (xen_get_lazy_mode() == XEN_LAZY_MMU) {
> -		arch_leave_lazy_mmu_mode();
> +		arch_leave_lazy_mmu_mode(LAZY_MMU_DEFAULT);
>  		arch_enter_lazy_mmu_mode();
>  	}
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 29cca0e6d0ff..c9bf1128a4cd 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -2610,6 +2610,7 @@ static int pagemap_scan_thp_entry(pmd_t *pmd, unsigned long start,
>  static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
>  				  unsigned long end, struct mm_walk *walk)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	struct pagemap_scan_private *p = walk->private;
>  	struct vm_area_struct *vma = walk->vma;
>  	unsigned long addr, flush_end = 0;
> @@ -2628,7 +2629,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
>  		return 0;
>  	}
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	if ((p->arg.flags & PM_SCAN_WP_MATCHING) && !p->vec_out) {
>  		/* Fast path for performing exclusive WP */
> @@ -2698,7 +2699,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
>  	if (flush_end)
>  		flush_tlb_range(vma, start, addr);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(start_pte, ptl);
>
>  	cond_resched();
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 08bc2442db93..18745c32f2c0 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1441,6 +1441,9 @@ extern void tlb_gather_mmu(struct mmu_gather *tlb, struct mm_struct *mm);
>  extern void tlb_gather_mmu_fullmm(struct mmu_gather *tlb, struct mm_struct *mm);
>  extern void tlb_finish_mmu(struct mmu_gather *tlb);
>
> +#define LAZY_MMU_DEFAULT	0
> +#define LAZY_MMU_NESTED		1
> +
>  struct vm_fault;
>
>  /**
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 8848e132a6be..6932c8e344ab 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -232,8 +232,10 @@ static inline int pmd_dirty(pmd_t pmd)
>   * and the mode cannot be used in interrupt context.
>   */
>  #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
> -#define arch_enter_lazy_mmu_mode()	do {} while (0)
> -#define arch_leave_lazy_mmu_mode()	do {} while (0)
> +typedef int lazy_mmu_state_t;
> +
> +#define arch_enter_lazy_mmu_mode()	(LAZY_MMU_DEFAULT)
> +#define arch_leave_lazy_mmu_mode(state)	((void)(state))
>  #endif
>
>  #ifndef pte_batch_hint
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 35ed4ab0d7c5..72c032f2cf56 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -357,6 +357,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  				unsigned long addr, unsigned long end,
>  				struct mm_walk *walk)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	struct madvise_walk_private *private = walk->private;
>  	struct mmu_gather *tlb = private->tlb;
>  	bool pageout = private->pageout;
> @@ -455,7 +456,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  	if (!start_pte)
>  		return 0;
>  	flush_tlb_batched_pending(mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	for (; addr < end; pte += nr, addr += nr * PAGE_SIZE) {
>  		nr = 1;
>  		ptent = ptep_get(pte);
> @@ -463,7 +464,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  		if (++batch_count == SWAP_CLUSTER_MAX) {
>  			batch_count = 0;
>  			if (need_resched()) {
> -				arch_leave_lazy_mmu_mode();
> +				arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  				pte_unmap_unlock(start_pte, ptl);
>  				cond_resched();
>  				goto restart;
> @@ -499,7 +500,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  				if (!folio_trylock(folio))
>  					continue;
>  				folio_get(folio);
> -				arch_leave_lazy_mmu_mode();
> +				arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  				pte_unmap_unlock(start_pte, ptl);
>  				start_pte = NULL;
>  				err = split_folio(folio);
> @@ -510,7 +511,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  				if (!start_pte)
>  					break;
>  				flush_tlb_batched_pending(mm);
> -				arch_enter_lazy_mmu_mode();
> +				lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  				if (!err)
>  					nr = 0;
>  				continue;
> @@ -558,7 +559,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  	}
>
>  	if (start_pte) {
> -		arch_leave_lazy_mmu_mode();
> +		arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  		pte_unmap_unlock(start_pte, ptl);
>  	}
>  	if (pageout)
> @@ -657,6 +658,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>
>  {
>  	const cydp_t cydp_flags = CYDP_CLEAR_YOUNG | CYDP_CLEAR_DIRTY;
> +	lazy_mmu_state_t lazy_mmu_state;
>  	struct mmu_gather *tlb = walk->private;
>  	struct mm_struct *mm = tlb->mm;
>  	struct vm_area_struct *vma = walk->vma;
> @@ -677,7 +679,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  	if (!start_pte)
>  		return 0;
>  	flush_tlb_batched_pending(mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	for (; addr != end; pte += nr, addr += PAGE_SIZE * nr) {
>  		nr = 1;
>  		ptent = ptep_get(pte);
> @@ -727,7 +729,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  				if (!folio_trylock(folio))
>  					continue;
>  				folio_get(folio);
> -				arch_leave_lazy_mmu_mode();
> +				arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  				pte_unmap_unlock(start_pte, ptl);
>  				start_pte = NULL;
>  				err = split_folio(folio);
> @@ -738,7 +740,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  				if (!start_pte)
>  					break;
>  				flush_tlb_batched_pending(mm);
> -				arch_enter_lazy_mmu_mode();
> +				lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  				if (!err)
>  					nr = 0;
>  				continue;
> @@ -778,7 +780,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  	if (nr_swap)
>  		add_mm_counter(mm, MM_SWAPENTS, nr_swap);
>  	if (start_pte) {
> -		arch_leave_lazy_mmu_mode();
> +		arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  		pte_unmap_unlock(start_pte, ptl);
>  	}
>  	cond_resched();
> diff --git a/mm/memory.c b/mm/memory.c
> index 0ba4f6b71847..ebe0ffddcb77 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1079,6 +1079,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  	       pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
>  	       unsigned long end)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	struct mm_struct *dst_mm = dst_vma->vm_mm;
>  	struct mm_struct *src_mm = src_vma->vm_mm;
>  	pte_t *orig_src_pte, *orig_dst_pte;
> @@ -1126,7 +1127,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
>  	orig_src_pte = src_pte;
>  	orig_dst_pte = dst_pte;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	do {
>  		nr = 1;
> @@ -1195,7 +1196,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  	} while (dst_pte += nr, src_pte += nr, addr += PAGE_SIZE * nr,
>  		 addr != end);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(orig_src_pte, src_ptl);
>  	add_mm_rss_vec(dst_mm, rss);
>  	pte_unmap_unlock(orig_dst_pte, dst_ptl);
> @@ -1694,6 +1695,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  				unsigned long addr, unsigned long end,
>  				struct zap_details *details)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	bool force_flush = false, force_break = false;
>  	struct mm_struct *mm = tlb->mm;
>  	int rss[NR_MM_COUNTERS];
> @@ -1714,7 +1716,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  		return addr;
>
>  	flush_tlb_batched_pending(mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	do {
>  		bool any_skipped = false;
>
> @@ -1746,7 +1748,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  		direct_reclaim = try_get_and_clear_pmd(mm, pmd, &pmdval);
>
>  	add_mm_rss_vec(mm, rss);
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>
>  	/* Do the actual TLB flush before dropping ptl */
>  	if (force_flush) {
> @@ -2683,6 +2685,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  			unsigned long addr, unsigned long end,
>  			unsigned long pfn, pgprot_t prot)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pte_t *pte, *mapped_pte;
>  	spinlock_t *ptl;
>  	int err = 0;
> @@ -2690,7 +2693,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  	mapped_pte = pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
>  	if (!pte)
>  		return -ENOMEM;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	do {
>  		BUG_ON(!pte_none(ptep_get(pte)));
>  		if (!pfn_modify_allowed(pfn, prot)) {
> @@ -2700,7 +2703,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  		set_pte_at(mm, addr, pte, pte_mkspecial(pfn_pte(pfn, prot)));
>  		pfn++;
>  	} while (pte++, addr += PAGE_SIZE, addr != end);
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(mapped_pte, ptl);
>  	return err;
>  }
> @@ -2989,6 +2992,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  				     pte_fn_t fn, void *data, bool create,
>  				     pgtbl_mod_mask *mask)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pte_t *pte, *mapped_pte;
>  	int err = 0;
>  	spinlock_t *ptl;
> @@ -3007,7 +3011,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  			return -EINVAL;
>  	}
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	if (fn) {
>  		do {
> @@ -3020,7 +3024,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  	}
>  	*mask |= PGTBL_PTE_MODIFIED;
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>
>  	if (mm != &init_mm)
>  		pte_unmap_unlock(mapped_pte, ptl);
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index e05e14d6eacd..659285c6ba77 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -59,6 +59,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  				   unsigned long end,
>  				   struct mm_walk *walk)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	struct migrate_vma *migrate = walk->private;
>  	struct folio *fault_folio = migrate->fault_page ?
>  		page_folio(migrate->fault_page) : NULL;
> @@ -110,7 +111,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>  	if (!ptep)
>  		goto again;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	for (; addr < end; addr += PAGE_SIZE, ptep++) {
>  		struct dev_pagemap *pgmap;
> @@ -287,7 +288,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  	if (unmapped)
>  		flush_tlb_range(walk->vma, start, end);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(ptep - 1, ptl);
>
>  	return 0;
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 113b48985834..7bba651e5aa3 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -273,6 +273,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pte_t *pte, oldpte;
>  	spinlock_t *ptl;
>  	long pages = 0;
> @@ -293,7 +294,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  		target_node = numa_node_id();
>
>  	flush_tlb_batched_pending(vma->vm_mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  	do {
>  		nr_ptes = 1;
>  		oldpte = ptep_get(pte);
> @@ -439,7 +440,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			}
>  		}
>  	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(pte - 1, ptl);
>
>  	return pages;
> diff --git a/mm/mremap.c b/mm/mremap.c
> index e618a706aff5..dac29a734e16 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -193,6 +193,7 @@ static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr
>  static int move_ptes(struct pagetable_move_control *pmc,
>  		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	struct vm_area_struct *vma = pmc->old;
>  	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>  	struct mm_struct *mm = vma->vm_mm;
> @@ -256,7 +257,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	if (new_ptl != old_ptl)
>  		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
>  	flush_tlb_batched_pending(vma->vm_mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
>  		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
> @@ -301,7 +302,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		}
>  	}
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	if (force_flush)
>  		flush_tlb_range(vma, old_end - len, old_end);
>  	if (new_ptl != old_ptl)
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6dbcdceecae1..f901675dd060 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -95,6 +95,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			phys_addr_t phys_addr, pgprot_t prot,
>  			unsigned int max_page_shift, pgtbl_mod_mask *mask)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pte_t *pte;
>  	u64 pfn;
>  	struct page *page;
> @@ -105,7 +106,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	if (!pte)
>  		return -ENOMEM;
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	do {
>  		if (unlikely(!pte_none(ptep_get(pte)))) {
> @@ -131,7 +132,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		pfn++;
>  	} while (pte += PFN_DOWN(size), addr += size, addr != end);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }
> @@ -354,12 +355,13 @@ int ioremap_page_range(unsigned long addr, unsigned long end,
>  static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			     pgtbl_mod_mask *mask)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	pte_t *pte;
>  	pte_t ptent;
>  	unsigned long size = PAGE_SIZE;
>
>  	pte = pte_offset_kernel(pmd, addr);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	do {
>  #ifdef CONFIG_HUGETLB_PAGE
> @@ -378,7 +380,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
>  	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	*mask |= PGTBL_PTE_MODIFIED;
>  }
>
> @@ -514,6 +516,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
>  		pgtbl_mod_mask *mask)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	int err = 0;
>  	pte_t *pte;
>
> @@ -526,7 +529,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  	if (!pte)
>  		return -ENOMEM;
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	do {
>  		struct page *page = pages[*nr];
> @@ -548,7 +551,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		(*nr)++;
>  	} while (pte++, addr += PAGE_SIZE, addr != end);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	*mask |= PGTBL_PTE_MODIFIED;
>
>  	return err;
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index a48aec8bfd92..13b6657c8743 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3521,6 +3521,7 @@ static void walk_update_folio(struct lru_gen_mm_walk *walk, struct folio *folio,
>  static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  			   struct mm_walk *args)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	int i;
>  	bool dirty;
>  	pte_t *pte;
> @@ -3550,7 +3551,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  		return false;
>  	}
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>  restart:
>  	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
>  		unsigned long pfn;
> @@ -3591,7 +3592,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  	if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &start, &end))
>  		goto restart;
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	pte_unmap_unlock(pte, ptl);
>
>  	return suitable_to_scan(total, young);
> @@ -3600,6 +3601,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area_struct *vma,
>  				  struct mm_walk *args, unsigned long *bitmap, unsigned long *first)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	int i;
>  	bool dirty;
>  	pmd_t *pmd;
> @@ -3632,7 +3634,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
>  	if (!spin_trylock(ptl))
>  		goto done;
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	do {
>  		unsigned long pfn;
> @@ -3679,7 +3681,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
>
>  	walk_update_folio(walk, last, gen, dirty);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>  	spin_unlock(ptl);
>  done:
>  	*first = -1;
> @@ -4227,6 +4229,7 @@ static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_control *sc)
>   */
>  bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>  {
> +	lazy_mmu_state_t lazy_mmu_state;
>  	int i;
>  	bool dirty;
>  	unsigned long start;
> @@ -4278,7 +4281,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>  		}
>  	}
>
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_state = arch_enter_lazy_mmu_mode();
>
>  	pte -= (addr - start) / PAGE_SIZE;
>
> @@ -4312,7 +4315,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>
>  	walk_update_folio(walk, last, gen, dirty);
>
> -	arch_leave_lazy_mmu_mode();
> +	arch_leave_lazy_mmu_mode(lazy_mmu_state);
>
>  	/* feedback from rmap walkers to page table walkers */
>  	if (mm_state && suitable_to_scan(i, young))
> --
> 2.47.0
>

