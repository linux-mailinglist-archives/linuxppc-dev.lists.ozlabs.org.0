Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFAA94AEB1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 19:12:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=NvoOahHR;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=MzOWxBss;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfGvS3r45z2xFn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 03:12:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=NvoOahHR;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=MzOWxBss;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfGtm260tz3cR3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 03:11:58 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477EBY6U004888;
	Wed, 7 Aug 2024 17:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=vBQhSxBCH6lVNFp4N+v9xpuoFSQ/6trt/IMOAEKVG88=; b=
	NvoOahHRaosMVx/QHtZZyueUvPj16WfnMR4rWUpVKRZeaoeiB0+RBJCzCaHQS93S
	3RVrNDZ+UeYT19RwTMTp49e5DyQB5Waj8CVvRolmbd3G6ojQBinQIY6i6DsLO2R/
	njsUxiQJhAAcD5jgCRy1MBpJ3j0xg07I/T+8DN6Lp/8p1VwzjxwNzvJiny11N/gC
	JKOh7TrJetfr/e01ucpdUQus6omJdVLsiuZccareHuJgMiPTZhNUtfHd0LLqVpWL
	Dnud1Iq6Xw2BdwlVf30Qs571c+awzprOSVNVxBvgEHwgPZrOuQhuo9d3kb0WXZlN
	w7rIAYEwAHnDpOf9IQRQ1w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40sce9804u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 Aug 2024 17:11:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 477GuZJG004817;
	Wed, 7 Aug 2024 17:11:35 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40sb0gb0d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 Aug 2024 17:11:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E24DLS+lC74zhskyiCAhyFKXzSC3jCPCz/QXLQYP01VJxSnJ2rXuF+ol9I5zHwjY/icRM10S5AV6SfVTC8metuKhMZzO5qrrOkD2wNpJ+tr+O/n5l1urxuHVIRtE1g66TNOpampWPufglg5NaSRjwmJoFKvMMh2OdYFOhutNi2cguwo2foOUOPwqL88CirFg8LGhxCrKih+XUXaGozwZzU+X3At3gwhGhJKKiIqoWRQuAUWmaw3Ndz0qRj2MDfhEj70pokMnZ789eCY2F3uFM4uQHbpZ+6g/AbX6Dwfe0V9uMB7DybdDUh+742LJeHZ8kLQfoMPQnE9//T3T/s9vuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBQhSxBCH6lVNFp4N+v9xpuoFSQ/6trt/IMOAEKVG88=;
 b=gHCDUdyYNUoNR5+7FVkdeR5NicyhackOrU02UXLXWQLz4GcttUfbudlDPk570ErMffwlVzJC8DKqhNsvj+IpDpJirY3nNEMQG+jifrGdkEnjHbPTfm5y9Op6G/W4dBshDYxTcXIiz5JD6Qg9w/lRRxLlwk/uCPGahu5MPcxzH/AyvrQ/SUi3Md7TBvGKqOXTZPQ3mJxAV8dtAvhLeUX0akELuZgwDx6sZMWMXh4Lq2zu7l3Gsp+DrMJ6O2JG0mVZSRVcV1oNkYN2Y01jffJnb+1anrkYm9LG4d3eHhk+BULk86POmoyLd48Na1VsBe4uwiqmMVvQnBxu8lesWQTEzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBQhSxBCH6lVNFp4N+v9xpuoFSQ/6trt/IMOAEKVG88=;
 b=MzOWxBssnrSRlYPC8tU1fBFNE0pjCSj2hJGS2NQQVTdp00SfDWByCH1mtGhp6Hq7HPw5Ob9MR4r/dK2xv03a+KcaoeEQfddO2W+Kh1X0Nb8YFY0U6h/BM91cQyjqv9oCj5NOejJq1ZqrQLXetWBiOr/OJ0LvPn2icA13lo/AdGE=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by CH3PR10MB7282.namprd10.prod.outlook.com (2603:10b6:610:12c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Wed, 7 Aug
 2024 17:11:32 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 17:11:32 +0000
Date: Wed, 7 Aug 2024 13:11:29 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Jeff Xu <jeffxu@google.com>
Subject: Re: [PATCH 2/4] powerpc/mm: Handle VDSO unmapping via close() rather
 than arch_unmap()
Message-ID: <babup6k7qh5ii5avcvtz2rqo4n2mzh2wjbbgk5xeuivfypqnuc@2gydsfao3w7b>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Jeff Xu <jeffxu@google.com>, Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, jeffxu@chromium.org, linux-kernel@vger.kernel.org, 
	npiggin@gmail.com, oliver.sang@intel.com, pedro.falcato@gmail.com, 
	Kees Cook <keescook@chromium.org>
References: <20240807124103.85644-1-mpe@ellerman.id.au>
 <20240807124103.85644-2-mpe@ellerman.id.au>
 <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
 <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
 <CALmYWFvqoxyBf4iP7WPTU_Oxq_zpRzvaBOWoHc4n4EwQTYhyBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CALmYWFvqoxyBf4iP7WPTU_Oxq_zpRzvaBOWoHc4n4EwQTYhyBA@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0003.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::11) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|CH3PR10MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: f51e8c49-9f78-4f3f-47a8-08dcb703fc20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?Mk9uR0ZGMUY0TFNSMlRReDNOMTcrWXIrQVVlWVhjWkQzY3VOb2VHQ2dWUUFD?=
 =?utf-8?B?M2RCc0pXemxjYVVHRWlGUHNsakMxM0VVTVJKQzMvd3kzcXh2elNoZVNtMkdT?=
 =?utf-8?B?cjR6K3BZQW1Fd296dHpUd3JTVWNOVGxMT1NxSExPZmlMcVo3cWs4K1pGdTZH?=
 =?utf-8?B?VFVKeWVQY1JWMHlGWHVDbngwViswYllnZ1E4ajBmMlFGeTBuQVpuRUNGMktu?=
 =?utf-8?B?M1hPOHFTZVJuT2c2ay9BckQrVVRNbVF3YjhpbDBvYzhLbUJhZTZaQXBob0hQ?=
 =?utf-8?B?d1NlSU1ZM0VYODN5QS9vMGtmS3hhNDVXdzQxSXg3T2lKQ3dzT2JVR0VRYXds?=
 =?utf-8?B?L0IzelFrU0g1YWxhdmF4MWJ5L1dRY1NXa1BaMEt4dWIyUG5kU3ZKT0NhOUlx?=
 =?utf-8?B?Sm9YM08wc0tiYkpZeU9pb1RPYVJCcG5RN0FyT0VheFVlY2t6T3BtNWticzRs?=
 =?utf-8?B?aHlKK1dURi9qcE14VGJ1K3RudkRHWHA0Y2UrclVlRk5vdmU4MmpPalJXRUNO?=
 =?utf-8?B?QnBLb2xrK2dZWEVhN01wSXNaaTNUUnlDTUlPYUhEZjdxdm5MOUR3WkdyaFRV?=
 =?utf-8?B?Vnc0MGJ2UXVWc0FjQ0FMYUgreE9pNkR1Z2pwcU8zYjNOd3pJTjFxZzRoMFdH?=
 =?utf-8?B?WkhLbFRnUnB3K3F2OTNQVWJqTmY2cnExSnhXSzRLMVo4OFpySlFiek45NThn?=
 =?utf-8?B?L3ovZE9iUER6d0xsZ29IV0NUWEx6NGw5MURWUHJUd24xY1d6V3h4R2I1VjZU?=
 =?utf-8?B?Sm0yNGZYcmJVQnhmUDVHd2QyODNhZnNuQTBKNEVqUkQ3Z0hlaE11aWkvaU5Z?=
 =?utf-8?B?Y1pUQmtDWkN4Y3RVdFYzSXFxOWNnM3BMWS9HQ0FFMmtyVnpYZmF1VHVEMnUv?=
 =?utf-8?B?anZIRm1IZi9SOWhHaVdVVFp4RkJKNTFEcFgwa3hmS0Q3cVpQV2NHdXZJUkc3?=
 =?utf-8?B?eGZOcGRkb2c4dVN4M0FSYmMzcEEyaHJvelkvS3g4YkMxaSszRFVrQWZ5L3Q2?=
 =?utf-8?B?b3ZKdStxS3hJKytTWmJsa0J6QndON2pxSWZnSEdiWUI5c3ZqYmhUZG96SjNq?=
 =?utf-8?B?eFpKL2x4UTQzNlpJMkJxR2xmZUh2R2xYT1BQdEVKRFdQb1JLdlRmNUYxU2FC?=
 =?utf-8?B?bkQzeWdDa09CUkdKSVZRUFhCV0g5bWhDZnhLOW50dTVwbXhGVll2cG9ZSjVU?=
 =?utf-8?B?VlRDdmxhR2dESFpYV3cwY0FoeEc0bWs4aGtaUkZ1RnlzYmsvRFlaSHNNbHJ1?=
 =?utf-8?B?M24zZER0ZVl0blMvWkFOTXJ0Q1RSSDg0MllLYVUwZE0wbWhQVVBkZFBka2pl?=
 =?utf-8?B?UWh0Zi81SlRwS3BKOU4vbEU3Vm9NRzhoRUNGdm9sS2sweERHY1VHZmpYbE4w?=
 =?utf-8?B?MHZDeklDV3JvT2FyRWdXS3phV3Y3WFJ1N01hVTU0NnlkYjJtYU55NGZjUFd2?=
 =?utf-8?B?MVBicjNDMkp5QndoWUtSZm5YVXlxRGNyV2E3ZVdGM0p5M3BXQjFScTdRRXli?=
 =?utf-8?B?SmhmZW1rdEgyVVl6NUhiekd5Z0lXb1dqd0JyTDNKY2dlRll1M0trZWxWWDRU?=
 =?utf-8?B?bWNhSTBGb2EwSkJ6Y01FWlMzQml3K3g3MHVqZURNZ0hJbTJER080eXhzNTNU?=
 =?utf-8?B?Y0s4aUZ1bHFreW5oQmxYSEthQ0Zmb0lwQ1drbDFNMGdGMDJwcEVMelRiUjZs?=
 =?utf-8?B?WjFaTGo2cUMrQnI3OFVEcTQ2R0VqQWlJK2JaNzV4c0ZUaU15Q2VuY0Z0QUhM?=
 =?utf-8?Q?ZClL2rS8NYzrdH3xxXyDy2g0/46V9NtrRwTePEn?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WmwzSWlzRW04L1NEazRrSTRYYkljYW1keXU0S3dDdVZYbVpDbStUZ2p5ZTlV?=
 =?utf-8?B?Q3ZxYWxvR2FBcWZJdWY3REZTeGsxVkIrMm9qaWhrMGxKRWdQOEc0eXBWdzdR?=
 =?utf-8?B?OVBpekxjd21yTis5Y1ErVndMRXZ1ajdhMTBYclIvM0ZnYmFKQnJjQ05RVlNK?=
 =?utf-8?B?Vm5pZm9ua1pMWGo3a0dsVzM0UysxVk8reXkxTFR2Uy8xSnRGR0ZBNjdmOGxs?=
 =?utf-8?B?bmtpSmF2M3NUYlJ3ZHVSSm9FbWw4Q1VLMm9iODhtWU1ZSGVERGp4alNxbHM3?=
 =?utf-8?B?MWsyWjZXOU9mS3lGN3hUamFrdXdROUhNYjh3eUplSW03RzhJM0owNmJsS0Rr?=
 =?utf-8?B?dXVkYXR1REN0dVlYMWZiRGZic0IyQVp0RjlBenN3a2pCS1QwRG9FcFF0YjBl?=
 =?utf-8?B?VkJOK2FRVCtodGVvdVl6REZTbDVGWE1pZ1NsR0NHMWF5bDRPdnNnd255REZU?=
 =?utf-8?B?NFpJc1BmbC8wa0JlMXJwNHB1T0tVdnNkcGRWTmF0NHhHUEN6MVAvQUxSWHNB?=
 =?utf-8?B?NTVWblhyVkF2bDZNekVLVUNoTjVSblhYVDVIS3JmbTlRZHAzeDErczJXODcv?=
 =?utf-8?B?TitjcXdnQkVLTE1aSGcrWlU2aVVSNmlPQXo3dnNBZ3ZaeWkwVVU5TDVSUlVQ?=
 =?utf-8?B?ck1kRmlSeFRxTFZhR202bk1yYjdIaUgycHJvY2llVi9reWpnbzVCUVIrODFX?=
 =?utf-8?B?OEh2OXZUeWJNc0p1TVFXOWZlY0Q0c2JJRTJHYzY3bWxORkI2NW04K2tpVDZl?=
 =?utf-8?B?T0NPYXhNYWhpL0lUNGdKWWE4cXVURTBGU1Bkc0cwZGxiZDVzZ1RjQmpLWHNF?=
 =?utf-8?B?dGxBWkNVc1ZEaWdRTVdINnhndEd2RFlVWWpOZ0VkYm9QT2hQNVpwT2QxQXky?=
 =?utf-8?B?Q2d3MnZ4eTVIZWoxOVVzRDkwbXVlMWFKN1RqVVVJODVxcEp5bjZXOTA4MVh4?=
 =?utf-8?B?YU5tS2dZVWRML1phOWkyV2NoTjBMUnBHU2NqQll4ZVZ2eGo4bzRaYkJ4Qy9m?=
 =?utf-8?B?aTBoRFllczlUelAxTk14RlRvaXpWR0ZKcnBUcUZQUnJKaGl6QklBN21WV1BK?=
 =?utf-8?B?UzJia2tjMHRUWERidDM0VzcvM3BQQmNlZDE3UG5IQ005S2tBeFk4Q05zQ3lr?=
 =?utf-8?B?VmhxNU01Rm9lbEg2OWIrY0kvY0k1S3dNNmJoaGdCeHhRWWt3eStXMEQvWncz?=
 =?utf-8?B?UjNOUFhaSG1RTnBaOWIxTWszSG12RlpVcm8vRThQQkVobXAyamNTYzBib3h3?=
 =?utf-8?B?ajJ1L1Q3UStnVlcyR0xkZXpJNm9sWHJKRjdPK29MR1FaS3NVUVpaTDNxRjFa?=
 =?utf-8?B?aFlHaENzZFQ0aW1qakdhY0RpTVYyVHYxeFFlZkJTZVU1SC9oTk96UFZWVVRH?=
 =?utf-8?B?NlVaeUdOWkJ5R3loQ294YnFyN09FT1FkbzE4OFRGaE9RS0lRZ2hUQTlYb3Vm?=
 =?utf-8?B?aVU0dDRhZTJ2UXNhQTRBZkw4Y2dvb3V6ZWQ1RGtIUGJXQ2xZc2s2dTg2aUE5?=
 =?utf-8?B?eFFzUFlLdWlrNjYyTXdGL1FtN1oxbFVSN3o2RmFpMmlmeXVxYnZabEtXblUw?=
 =?utf-8?B?bExVbUxTVEYxenlHNFpON0VkYUpEemkrbmQ2eU9MdXFKdHprZ3NYWkE2WUdH?=
 =?utf-8?B?dk5aVmtUbUFvblVPOW1BckJBUWRab0RHUFk1V0NkaEhBd05yaFI0S1BvOVJU?=
 =?utf-8?B?YTF5R0xjaUwybVJGUzdGRy9tbEZhUXM4S3RpdUVoaWZZQUNHZXVxTTJDbWxr?=
 =?utf-8?B?dzRlb1lMdmJLKy9ZRUxhd0xFdjlHQ0xEY1NoYWpwaXZWVGNSM0RiYkR4M01u?=
 =?utf-8?B?dTBxUUJCMlpkOThCNldSYmJXcjBGbUh5d2NlaWlVRmR0Z2Y4SFpVSEJ4UUUv?=
 =?utf-8?B?RmJFcVV1UWRPT1l2cm1xV1lJVWRZSTNUbmo2NktoL2NQdGtReFJBbThNTHZq?=
 =?utf-8?B?ZUNlVzZNZGxWS0NNb29zYjBUODJTUXBydzRVcVh1UUZLaXJkd0dvUSt5bndm?=
 =?utf-8?B?UTduRzZvemN1NWhkcnFLZzBxcFhveHRTYXJ5RHdMb2NTUzhXeTJCMnUrWjF5?=
 =?utf-8?B?UFlxcjNVa1dBQlVaMWlLREo4Sm15NDBXdTArN1IrYy90eTdIaitadFd6dU1C?=
 =?utf-8?Q?OR4jhUdeLwfJ8/U16ZZdHIPX6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	a5fTBbH+gqyouqkI8kUMqhqt6xw8XvQSlfVAohH/fT5Rw58zDb1etfg5ad3XS/aDADij+PYE2CMT015tB0UbUhe3x6vJe/4gJYO5bk9ud5hjFWfXdrpdLTmZ3bFo9aO2g0UYKH0mXqdK6ywrv/NDydNVciBB9UQ3ZAZd1n9loavD7H5GVJDec2Mmt0bpo/PwBw46yl5G+vu4kfhBwPT6TaZccDPn73iNbmwpjjCxDtM42+yFRAzQrH+l1+RLMd3NqNPZv3raYJ0fhbbeTbrL25bZU7e0F5bVvTDIYWNqrTUTEayO6XeqA6hHG3eIHLne81r17z+jaKEmf6O8eSl1VBuGAQpyW9gXmHolnvkQCn0Vxjj0QC8jC9x46XFFbEjOmaePYc059RfyxCzFAdjN5Qk2t3FpzQyxYBQdymfH+VEOEkyHNg1UbI02nlaRZ6ZtjBrg6uoRAn1altgXAw1+90qr+liHDXzd4xNpLwUXSStsgQS+GBS8GL55iEWGSKnEaB62Yh0sfwiQDNk0XFAJtE/NhR6DKNZoSYW1RhNm6+skNzdT+3V55VS9E78+PiT6Rn5EBD9GW+huG+JnkvXneBuniWqTfN17b30PESZgV/I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f51e8c49-9f78-4f3f-47a8-08dcb703fc20
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 17:11:32.4197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1GpQ+ViowLJd5TTj08DXCU2WczY466NdW9tc/X8H5Tyy1fRnqxPrxcw9+MQhyRfjTwlvlALS0m/8KQtfyB+gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7282
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408070120
X-Proofpoint-GUID: e-t_bNADY6-mJESS78s6UNbnqDUIQIfr
X-Proofpoint-ORIG-GUID: e-t_bNADY6-mJESS78s6UNbnqDUIQIfr
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Kees Cook <keescook@chromium.org>, jeffxu@chromium.org, linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-mm@kvack.org, oliver.sang@intel.com, npiggin@gmail.com, akpm@linux-foundation.org, torvalds@linux-foundation.org, pedro.falcato@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Jeff Xu <jeffxu@google.com> [240807 12:37]:
> On Wed, Aug 7, 2024 at 8:56=E2=80=AFAM Liam R. Howlett <Liam.Howlett@orac=
le.com> wrote:
> >
> > * Jeff Xu <jeffxu@google.com> [240807 11:44]:
> > > On Wed, Aug 7, 2024 at 5:41=E2=80=AFAM Michael Ellerman <mpe@ellerman=
.id.au> wrote:
> > > >
> > > > Add a close() callback to the VDSO special mapping to handle unmapp=
ing
> > > > of the VDSO. That will make it possible to remove the arch_unmap() =
hook
> > > > entirely in a subsequent patch.
> > > >
> > > > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > > > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > > > ---
> > > >  arch/powerpc/include/asm/mmu_context.h |  4 ----
> > > >  arch/powerpc/kernel/vdso.c             | 17 +++++++++++++++++
> > > >  2 files changed, 17 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/=
include/asm/mmu_context.h
> > > > index 37bffa0f7918..9b8c1555744e 100644
> > > > --- a/arch/powerpc/include/asm/mmu_context.h
> > > > +++ b/arch/powerpc/include/asm/mmu_context.h
> > > > @@ -263,10 +263,6 @@ extern void arch_exit_mmap(struct mm_struct *m=
m);
> > > >  static inline void arch_unmap(struct mm_struct *mm,
> > > >                               unsigned long start, unsigned long en=
d)
> > > >  {
> > > > -       unsigned long vdso_base =3D (unsigned long)mm->context.vdso=
;
> > > > -
> > > > -       if (start <=3D vdso_base && vdso_base < end)
> > > > -               mm->context.vdso =3D NULL;
> > > >  }
> > > >
> > > >  #ifdef CONFIG_PPC_MEM_KEYS
> > > > diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.=
c
> > > > index 7a2ff9010f17..220a76cae7c1 100644
> > > > --- a/arch/powerpc/kernel/vdso.c
> > > > +++ b/arch/powerpc/kernel/vdso.c
> > > > @@ -81,6 +81,21 @@ static int vdso64_mremap(const struct vm_special=
_mapping *sm, struct vm_area_str
> > > >         return vdso_mremap(sm, new_vma, &vdso64_end - &vdso64_start=
);
> > > >  }
> > > >
> > > > +static void vdso_close(const struct vm_special_mapping *sm, struct=
 vm_area_struct *vma)
> > > > +{
> > > > +       struct mm_struct *mm =3D vma->vm_mm;
> > > > +
> > > > +       /*
> > > > +        * close() is called for munmap() but also for mremap(). In=
 the mremap()
> > > > +        * case the vdso pointer has already been updated by the mr=
emap() hook
> > > > +        * above, so it must not be set to NULL here.
> > > > +        */
> > > > +       if (vma->vm_start !=3D (unsigned long)mm->context.vdso)
> > > > +               return;
> > > > +
> > > > +       mm->context.vdso =3D NULL;
> > > > +}
> > > > +
> > > >  static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
> > > >                              struct vm_area_struct *vma, struct vm_=
fault *vmf);
> > > >
> > > > @@ -92,11 +107,13 @@ static struct vm_special_mapping vvar_spec __r=
o_after_init =3D {
> > > >  static struct vm_special_mapping vdso32_spec __ro_after_init =3D {
> > > >         .name =3D "[vdso]",
> > > >         .mremap =3D vdso32_mremap,
> > > > +       .close =3D vdso_close,
> > > IIUC, only CHECKPOINT_RESTORE requires this, and
> > > CHECKPOINT_RESTORE is in init/Kconfig, with default N
> > >
> > > Can we add #ifdef CONFIG_CHECKPOINT_RESTORE here ?
> > >
> >
> > No, these can be unmapped and it needs to be cleaned up.  Valgrind is
> > one application that is known to unmap the vdso and runs into issues on
> > platforms that do not handle the removal correctly.
> >
> Maybe Valgrind needs that exactly for checkpoint restore ? [1]

Maybe, and maybe there are 100 other applications unmapping the vdso for
some other reason?

>=20
> "CRIU fails to restore applications that have unmapped the vDSO
> segment. One such
> application is Valgrind."
>=20
> Usually when the kernel accepts new functionality, the patch needs to
> state the user case.

This isn't new functionality, the arch_unmap() existed before and this
is moving the functionality.  We can't just disable it because we assume
we know it's only used once.

I had planned to do this sort of patch set in a follow up to my patch
set [1], so I was deep into looking at this before the mseal()
regression - which I expected to happen and have been advocating to
avoid extra walks... This would be fixed by my patch set by reducing the
walk count.

> The only user case I found for .mremap and .close so far is the CRIU case=
.
>=20

In fact, this is broken on other archs for valgrind since they unmap the
vdso and then crash [2].  There has been a fix in the works for a while,
which I stepped in during the patch set [1], which can be seen here
[3].  In the discussion, the issue with Valgrind is raised and a generic
solution to solve for more than just ppc is discussed.  The solution
avoids crashing if vdso is unmapped and that seems like the sane
direction of this work.

We also have users unmapping vdsos here [4] too.

Why would we leave a dangling pointer in the mm struct based on a
compile flag?

[1] https://lore.kernel.org/linux-mm/20240717200709.1552558-18-Liam.Howlett=
@oracle.com/
[2] https://lore.kernel.org/lkml/87imd5h5kb.fsf@mpe.ellerman.id.au/
[3] https://lore.kernel.org/all/20210611180242.711399-17-dima@arista.com/
[4] https://github.com/insanitybit/void-ship

