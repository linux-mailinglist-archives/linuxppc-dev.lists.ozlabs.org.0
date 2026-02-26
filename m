Return-Path: <linuxppc-dev+bounces-17306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHVUFzV4oGmMkAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 17:43:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE07E1AAE2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 17:43:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMHMj2zg0z3cBT;
	Fri, 27 Feb 2026 03:43:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772124209;
	cv=pass; b=TS1M9ZyQo18PH53Ou8SvS1OvitMqqPDOR4G01DcK9SPA01S4YE8Wjy6Nel5OUFQyDQ2npqO0abryCI/iiyT8xZABbPsrJvHu12m3RiH8qLNUYtEodXMjNmSsyDS7xF1Kc5tZyUtPrWxpd4NYoxUXvaF3khm3wLE6whY5aPqX7JQ8nWTYcTuFSCZJAchMTPncGdh+2udD6LpBugtSTVuovv9asfIdQW6tk1KKpuBHob0Fa17YwoQJlklA7Gi6lwlF19UOVpjW4WU5H6uoVgV1cdvop7ZF+es8xfFEHRZIhI21lcMXIkm2UcP5j82uGueeAQ+/7nKS/2uWTGTwhRoOjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772124209; c=relaxed/relaxed;
	bh=ylS0Y8ByF4shbLizUhBQFXe+zGp88pN7dpvBy2cMOsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=drTXXILRaBj+C5Qa2yA2AvalIX56Pcz5gmC0xsnO28gDsBO/+vNrpVR5DR2NxjizBcbCo1TKKcz5Ps7MuTlxasiXDWzL5bexdoYd3FlMcx1wX5o844IzZHj2TwmjINV8JSwbcbt+w/Lr2lQihzApSSGrA8c8aOgtZqP/0N4VNGy5wO6uGAsu2sXUyPKPvKBqqlj7QbsQMUKcibOz+YOP6LMvtpWSBhgQcracbKSw+mmqIzGgU430rxN2zCpUea99iFNwJwLdyHTaZK7UsHlNdrtG/BRoOlfqni0Yum+VxsMAJVNxI8akD41+QCn/jLizFYYISkMi48CebSO/77hmGA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=j/mvkbUR; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ha2e9wfF; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=j/mvkbUR;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ha2e9wfF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMHMg4wjbz3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 03:43:26 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QDNKnk561439;
	Thu, 26 Feb 2026 16:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ylS0Y8ByF4shbLizUh
	BQFXe+zGp88pN7dpvBy2cMOsQ=; b=j/mvkbURLXXtN7ZTwWPNGIMBzii1Hn7HsW
	cWcCj07fJRX4Oypw4GESw7jHL5doZC/uOHs50kf1hY/kNQJZ3Y5X1jI3ROO4DFc1
	SoA1458HsAYZSWugkaPXuGof4JIhl9BWBmzssHAEgGRlfOLu4DwSjGhT9fJsjJJA
	bBF6reEJ2zHWY/u6AVqOtM0woJFoNEc4ZOyJB0Ep204TzpWo5LVfEQbqxeb/kLvu
	0RTHotbWmnRgjmEAFkll5luZ7dRHqqgKvGuNqCyq04glVdPdfLl9ezNCrKKM8vb9
	K9zeYeM2bgXefQc6T1FHVaSOoM1YLTmo4/gBaFaq0J5ovEqA0wAg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cjgjfrykt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 16:42:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61QF6N5a015758;
	Thu, 26 Feb 2026 16:42:37 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012013.outbound.protection.outlook.com [40.93.195.13])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cf35cxdps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 16:42:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDaxjgJDeRqLFUqSMrTQaQtzj48MAYeV6PRa8f5HUOWp6b+0XIG7MP/7dHIwm23QViGEQ40KW8Jul7TqW/nJod8ASIRT/7zi3mafjJe02aeK1v285qB83bsK13lgKWN//fUkisrGSFpvB08LeRgraEH6A53lrhdVDK7zvRNxBZluxouLXUXNiY9O4CIP+e+i47DP92/F0tTkiiA0ehRP9PgWx8fk5+2izm10pqeihQUB3OZO/r2p3cKB0W6ySCK2SCRPz+vBLXuYIDM7m2AfPN7CWW+5NKglaf1erDjujIobxefuEjMkghZB7QrqcUoIj7Uk2cAV+YsvpwrQlMjhig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylS0Y8ByF4shbLizUhBQFXe+zGp88pN7dpvBy2cMOsQ=;
 b=fWdOkKy8t19IDuddMfE/youALMUgtG0CbVUurF51YXaehzZf2HnZbCeIM7XvienDdfdnehRb0w+DRbyK6jtdbMMRF+zkN5+hdmWe0VoAdDpFSvtt3GIj+q6gKwOFf559XWw2cXTVha3J6enhRzB0+JR205lyogggSiMndC9mAnIkzsdp1djCUa0knud6XJLdpdqbj66BB9LkpVQB4PXNN9ih7F5bzU/33qv0/4cZS9ZyhrbdyeUP0D0JV+goiRR7fY5bR8NS3wWEUahla9svFXfC2iRwqQ0vNmF3YiaZ6+ZQGBqfwIFRtXoL0FuRZtuVEfOysWi9kU4mc6P1BqST7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylS0Y8ByF4shbLizUhBQFXe+zGp88pN7dpvBy2cMOsQ=;
 b=ha2e9wfFnhSsva1m25m0bDiQuo/bvfhMcYDTxzCCgVxMZkwL+l81zvDhRPEUxpkquGfU2+lgDDa4ABzllLaFJ6Qk1nlaaCwzWVT0es72S6fDMaF+gKNL8keDdj92NJQB9ZzLJDCl/7zTap4CW1bsWmVnq0hnXitFcyjea1CLkck=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by LV3PR10MB7983.namprd10.prod.outlook.com (2603:10b6:408:218::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:42:32 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 16:42:32 +0000
Date: Thu, 26 Feb 2026 11:42:27 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@kernel.org,
        ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
        rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
        ying.huang@linux.alibaba.com, apopple@nvidia.com,
        lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz,
        jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de,
        kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au, chleroy@kernel.org, borntraeger@linux.ibm.com,
        frankja@linux.ibm.com, imbrenda@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mm/vma: cleanup error handling path in
 vma_expand()
Message-ID: <pifgesxxxcwcrarg3q7sgiybg6d6laaym2jcj2h44wqoaxopcv@idc7vavsmjsd>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, willy@infradead.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com, 
	baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, jannh@google.com, 
	rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de, kees@kernel.org, 
	maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
References: <20260226070609.3072570-1-surenb@google.com>
 <20260226070609.3072570-2-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226070609.3072570-2-surenb@google.com>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT4PR01CA0387.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::12) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|LV3PR10MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: a60bf477-e990-404f-96dc-08de7556098c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	RCwDcntsy1Vq1mwYMAcjCzZUj+3W5YtmmYLT2/QTK+l5G4hHukY5u8Ss0V6cuxDQh/4upAI2C+BlHAibhl9efs51ScGbqzxZ8NlyJDk6AFttqcwk8ZflGs5DwygkF6cVD6dFTF39UaXVCjbCcMcXQ86dHgfh5KGDwZIYD9nUg97d3ZJJJ+QIULUzyaPgu7RPyNPiE7sc5fNPZjpQg2qERErZKG60bgEoZGfzDHrDHUD3b+qwCIRNXNpTsWymT5SW+MN5NRlLfZgBlRRbY916CcorXXR+mVa//rlPO4afbJCvrD/ldoQIkcqdZ5dVpcA9mliWX5B5Qizw8Ee1/zDgZbh44cFtk+gzwrW/sJQAGmwMkhEIgTYjrhoXA50DLUTl8BQyYmAuAPhWAC/4s7c41cF+xnBxbSDIJycO1uXwEzog7Ij912A/yoRmIIoyAhbqTJVKINJ+75DWJXNfOmNSBfxOcOr19C8TMPhgY0H5skxA8CRSP+VvvLpudRWkrcNlidbHv+YafNAdCMiQ6YHu2VfONKYVHv8TA601EUnsrAQrcRS6jnBDopsOTOqmvnz4mYB7SN5Y5SADfYeqCrJ4mF/RkN57jqdEanIWLZrrgASkgKGfuG/JlLwYGRXCfcU6e89wWULn438Qvrcv1bAJvMoWABIx3KqaaqgmKf87dIQkSi5jDBY8nARQN8kR2DjBe0ugUSOJuMpzVvf36XuU23L3bHV4EU0zc6cvMeMBgx8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sKQbYrhFj89g4NudD5w8vvIbYtn37weePxUqkxlHGiDQjCOPvITLgyDFzfPT?=
 =?us-ascii?Q?wPRauOF10j6cMA6X5uuuahG0/5yE5YqaROgYVTnJPtYT492rh5v7+fwzxsuh?=
 =?us-ascii?Q?4DE8Sf9/oQ9q2uME8kWtu9UvLcmXD/fM4ZJ7LOdZWT2qh6vskQFwrtCOFYXn?=
 =?us-ascii?Q?DGE7UMfcFQwsqeNGN6dTcdzWzUbclRdglsYyZF75sF8CPSWsx/zBgK8aFIw9?=
 =?us-ascii?Q?qx7b9mtzTCiT1b16EtSV1paskxa7zque5pqiFtz2ySdi3FJEhVWqiRS445JQ?=
 =?us-ascii?Q?faFc752RKQMSXNWt+8Qa4e/vfX5PkJufKYLcV9p7LeRPrmARZmjfkGLeY5/V?=
 =?us-ascii?Q?DpPgbXCr894ja+4tY8Wmr9ZaWrniCdqfFDdAj+QUaYPBYklh7xFlZI6QN//P?=
 =?us-ascii?Q?cTWneOvfYwyVePPQFXFJZsm4yLm1eKOXkW6l1Jk7JlftXEARI2AvOy7aeW9R?=
 =?us-ascii?Q?VKPgDKv5/zt8w4dClamNwFvgEL6fXMIodmGRtY0eedxwCTi8YUldLRDtlC56?=
 =?us-ascii?Q?qYzr+Q/ciKSFoxODw+8c4U3ll4gwyMflYucgpA9gQ1MbVjClL1/egAi6sqdQ?=
 =?us-ascii?Q?gcoynO+5C3VgEfvpZMX5XTQiKw9sglGuZshrfRC9WdXWynZvsBzmWItbA/Er?=
 =?us-ascii?Q?tXnlc1dvvykxPAgkKAn/uwp7dvp6GBayNkLjxYvYFdvOj3xPZQqIbL8jc06a?=
 =?us-ascii?Q?i3IMR5vJ99j/AlGnYEtlVDgAmuvAqFgPFn67vXyY4hqi+rIQ4507YxaFQK6e?=
 =?us-ascii?Q?MILZP8k5YkWkcztUxszUNLPts+9jkVUU+OvKIedGYli66kkDJHY1WPcwBYcQ?=
 =?us-ascii?Q?5Nz9PyBGfZXb8kHHNCDHFzZ1PVIP/odkuxFaLRjjlILfefyT2fYKF2LKZo3I?=
 =?us-ascii?Q?8T1jzc+ahVbwsQl2Hoes+MhyXhAhyoKCF9mJzfsSvmiWjCXXZ3srNK2gVzrd?=
 =?us-ascii?Q?yNFQpKwyB1jRr7WYvyhtAFktMn+GPPK3Tb2/VmILRE4Hi+/1yK9GpJHlEDQ/?=
 =?us-ascii?Q?0/5Iix+nuvY0gvEHClT1ljG36OXB89QH77k8aRZCUsVj5aleCOM4/e8sLVs1?=
 =?us-ascii?Q?d1UVkitZkgloIKoqFCPNSIYXt9x9usXAzRh0nq7UB1x7ie0Dp3jlRZr+XYLH?=
 =?us-ascii?Q?CnnGXwKY0pTsmjBFmKiTu/8jIGA5cRaoq24Dy9ycTOWbEcQrPLgUfzCWHbEb?=
 =?us-ascii?Q?L27UD4N9y7oUoQNtIfNm/ah3H9IeHyYV+WrmxfnnM6JQOENtLgSfKdlH0g4t?=
 =?us-ascii?Q?ONw9QeU+kxAwPQ+xpO0ytP5JjvSH7/OHgIXWLdEFr/hcxKA57boOpmjf1byz?=
 =?us-ascii?Q?pt8yacLfXpsMlT/R/4fctthg64Z/WLGDY0c9yDwnv+VRzxkepIx2OQZoCxzj?=
 =?us-ascii?Q?XDFR3Ea54xjzJcb9OnfsYFmhGvMDpLeylflMs2/iX5aL/BmL+W8Qe7pMrWip?=
 =?us-ascii?Q?DZRssTsUN3a45PJajDL5Y7CAN5RMXJWhldsfM+dd7WtYwh7hmVZIlcm9Waqh?=
 =?us-ascii?Q?en3Wsz+IpHEl3trzI7sbTDoNSWHX5cviVv9OgK5vmYZr8LhBHUXZWsfOmZoc?=
 =?us-ascii?Q?ofPBhGriPcyrGmZtPLzSt6iVB+r3ubae3C+4fCWki8pr7+HzBAIQ2dUR1X5o?=
 =?us-ascii?Q?YDDyS1M3ni52AoSlcP54H+2TSu7co7luupE4t50JDyWLwuX/MPm86pG2R9E/?=
 =?us-ascii?Q?7PztFg4wANK7JDJltcTCHI6lCWfyk8oaBsA5Vt6mK4Rfo5sJOtU+w9mX0C+K?=
 =?us-ascii?Q?517n6qwAgg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XAI+oZG48NNcLI6j1b29yQAfrTDFzk29KYDHZuNZ0skTdhCqZA73k5d65zQjH1GYcM0313CI2a87QaOLG2aSYwilFZcFB6zhKVQFKyD68M+oRpzSdRt5UaL508WAXQmOghydyvX2Igy+n7jQoNEuv9vDtaxcjTHT6kkxaLvDWcP6lJtC+SVe0lpMZ6TrjG7MSLOC1Bf50UTv1yObkQwUpC2viH7DKPPF4ylLqPUz3WN0WFueY9Im2ljD7bafwSYDFuKyWqnCILEg8WeX5H3XktMmMmZlYYVhmcChdhVhndTy7xO3QbtksWFZmzx/2pABZagxkYjpww4wDj8HbQpEDKD223GRumG/umAni8ljW0ZYDiKGtirC+mU3BlqzqblqGKS6CiPJQ3HDGnAFgJDla1ZgvSZzPYc+Ba1xIsg1jqzfGvVKoJMvjZTuZQ4NdhpsDa/4SCWm/I70YG0V2of38S034pxbrfutWkDcB3tI2olOhJ+ojCW/a/WFlu96jYzD++Rgf9OGotC6YbsOMZbkLb/eQJTMHsI0eHLaq4HthBI47oV0I0vhEgwIO0SLQo4hZP5LDE/HG7Y6/2YynLGCOp0HLxaT4etAyRy5bP7KosM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60bf477-e990-404f-96dc-08de7556098c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:42:32.3002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kUjJvOWippp3QffSWqA6iCMP0nRD1t1dcKkyLmIPJCi/8vShT7PWr8vv/DibeIB3LWX6EUwMtzk5bTn33M9ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7983
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602260150
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE1MCBTYWx0ZWRfX8DMw5HjRldAD
 n53kmDVdh4u7GE+nONKdTiCmGxIF/LW7MWK2tnyUkp0HmiKtUo/nbfC8XPgMqorTRGyr/8DgVt5
 fZay136omlqN+2CCcnSWw5RQVWLzg7BXsiZ1VZ+QdlV/WoDxpYUcwABnmvPQV4cv5TDx8meL6zD
 HOrRj5iFcfIdsj1He/v+1/kTexFw1ng/i5dHFc3RvYCibBNIlMXMHvncEZIOPZxCfmqj44Ey1ZW
 GKKB/nFk9HSA+E7b57pN2ymkSh09aYMXi/zF6u3Ob1YcDPdiTyGROTxtHlCduKFtnyD7qKR3zyJ
 lCSztvoZAfkCOqTdkxD+5Qq07KwHLavRsQmpMu9H7PrOjzv/hrFTEbtzDvshVGE82vyZ//Yp3eg
 Jh7IqZwuuYC5FMuxBt5mjSvu5UJMmYmrZ4wyY7fWgLuaVUlVZS2GR+xjYEQXO7CPmU1FC/bRGK9
 S3ufHhQpxUXqJvkAzPQ==
X-Proofpoint-ORIG-GUID: SPqe8PSjXTYii1yzS6tQ_Db5py0zQVY6
X-Proofpoint-GUID: SPqe8PSjXTYii1yzS6tQ_Db5py0zQVY6
X-Authority-Analysis: v=2.4 cv=L/oQguT8 c=1 sm=1 tr=0 ts=69a077fe cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=1XWaLZrsAAAA:8
 a=yPCof4ZbAAAA:8 a=OF6kxwJpqsOYwMMz9xMA:9 a=CjuIK1q_8ugA:10
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17306-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:joshuahahnjy@
 gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,oracle.com:dkim,oracle.onmicrosoft.com:dkim];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.974];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EE07E1AAE2D
X-Rspamd-Action: no action

* Suren Baghdasaryan <surenb@google.com> [260226 02:06]:
> vma_expand() error handling is a bit confusing with "if (ret) return ret;"
> mixed with "if (!ret && ...) ret = ...;". Simplify the code to check
> for errors and return immediately after an operation that might fail.
> This also makes later changes to this function more readable.
> 
> No functional change intended.
> 
> Suggested-by: Jann Horn <jannh@google.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

This looks the same as v2, so I'll try again ;)

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  mm/vma.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/vma.c b/mm/vma.c
> index be64f781a3aa..bb4d0326fecb 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -1186,12 +1186,16 @@ int vma_expand(struct vma_merge_struct *vmg)
>  	 * Note that, by convention, callers ignore OOM for this case, so
>  	 * we don't need to account for vmg->give_up_on_mm here.
>  	 */
> -	if (remove_next)
> +	if (remove_next) {
>  		ret = dup_anon_vma(target, next, &anon_dup);
> -	if (!ret && vmg->copied_from)
> +		if (ret)
> +			return ret;
> +	}
> +	if (vmg->copied_from) {
>  		ret = dup_anon_vma(target, vmg->copied_from, &anon_dup);
> -	if (ret)
> -		return ret;
> +		if (ret)
> +			return ret;
> +	}
>  
>  	if (remove_next) {
>  		vma_start_write(next);
> -- 
> 2.53.0.414.gf7e9f6c205-goog
> 
> 

