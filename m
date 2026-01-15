Return-Path: <linuxppc-dev+bounces-15836-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45115D2477A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 13:29:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsMjV5nkvz309H;
	Thu, 15 Jan 2026 23:29:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768480142;
	cv=pass; b=icGQHrt12eAJEBgdpSLbMpZ3pmpBsTMfUn6dh/tDq830ERrkvV14D4hVsGbhSrakxjAl7j8+qXKb6PBadAqAWcEkrTYVnfdzfUosMqV5zJjCQI8r3PjGIlH+VR50aQ89yb6iaSIJbY+WfAgdv8+PB4PtACPuEDvt8uDorp1tZPl4U1+bsmZIXefZp7tGjgZuJF0fHy3Ekq3otimQd80DDUs4aB9M3MCo9QGzODVj0pvV2BJNvbsDSjHaoCr/U8VHk2s+kjMlgaRyR4Mq/+HZe1AlGKjzMbG0pdjaxCcQ126mpwnPsWa/oalPiU4YiPdldoE1py7jI/misxiLHkcIyw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768480142; c=relaxed/relaxed;
	bh=jNoYNCDZEhwG+3ZtZbzsZol8Sr2z4Q3D9OBVefu8VtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mkRWdTEMVgJPrDIqS5ZmP8rQiGMKlXzl1yu5HO2XW7LMRXGSThC+AzTQJ5oLGPl1NAft0V4E6CQg6OWbO/Df3wkxwAGup8xZsuQmKHSFd/fvSrjkfAl61cKyo1iflJQm3vtbhAPAuf3G2csDiL/mtX0ybWljirEhNoD43DhHCeB/57sr25fztv0tR0WFXT0DokTji/jbyaCNgO5BJM0YLkUsfv6Njc9VFdYXMUQDbpJHIE2jbjlzLBF2s3W6u62/DO77HfmTo2FUZLSuEJrHHRn4zAeSjR3tN7ZzHJJqu3kvyzn7J/xJyCahC1lDbkVS+j37LKu4w7MY/aj/xUYy9g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=CsNJ3TCN; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WZOpfBsp; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=CsNJ3TCN;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WZOpfBsp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsMjT6lGQz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 23:29:01 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FAvRn72754251;
	Thu, 15 Jan 2026 12:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jNoYNCDZEhwG+3ZtZb
	zsZol8Sr2z4Q3D9OBVefu8VtI=; b=CsNJ3TCNnVivWJF3rxJT4P40uVprFgKHh7
	tThgGjsvDAOlytX/qBHMzL49LBZyT9gq1mB3NzD6N41dIGXlIYbblB8mpW5ghEWG
	957HtC+4eh8zMZwKUZFbOx8OpxNgOqZmBUsaOnZEC4z9v++FZsNVj1cm0C4dipjb
	WbaMHARXqr2D3L3JwMbB8fvNwL2Lx0NMAvtBPR+Tj66Eecto+sWoKqcmAylBLiru
	lDkmYdXmN27GBUtbcoonjgkjMxEymc1fExCBbp/KruMbbqxplCylasTPgr3UlsKN
	dfWYlXls9hNZ3acemvoikHjqKBmBnvvmrfgJBhC5ETk2/d62s64A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkpwgqn57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 12:28:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FAq968005654;
	Thu, 15 Jan 2026 12:28:30 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7b1dgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 12:28:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iG7O69zlxomKzKA5xATa2rSlDcfKdA1GxHoY2NgQ3yReqMeym3xNwP2BeThrG/UnGIq7mKhXBab4xoytD6P4c1/UT68xmBVuLVIqx7OHlImPrpl0CyljF2q7m93vmWuw1UTFXcBxdkPNk0aiDjEGT/By2HWnUmuqOCv6ai2slOh0vmZeJEEdbrBBqbEW9iqNvT1IwWxt2ICOzpt3fIg/UqsyUCNWse+XX6Yr+CgA11Etb/HaCch96OZ2aPrB1PYpwuce16/CkeY+QJYnLO5ynWTSCJg0Dt7u7V95ZVywB35p8ZafgdFqEnovFdayjkNnCaLabojDJ9mgaiBSmIUg3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNoYNCDZEhwG+3ZtZbzsZol8Sr2z4Q3D9OBVefu8VtI=;
 b=X68u1cvLaLzCr3dEAX5rayaJjqOTnNUuQoGAM8PCZJJCFPv9RIUgG5Go+mob7zdqsOj6yNZFJCslMZOJbIMipt9cMSgotz7314ucMSZvfY641To2rDTYwPmd2PqMyk/Jm4djU/BWqQDlpZ7pjuIqKyIeOqIr0LpR5EnygYfpUu4UNr93y9Jfn7bxvsRV7mccutv6gLkAO9oiSNQGXw+IWjDlZltiHcLUz0nanRIqlTfHzEHum7LSE9RMZVAjZhJLP6iX7gl9cKueNRuzZ6Gb9960EVMSOsRM6ONSDMkt35ooPE7dAp+nYMqGOHD202VK9vGrlYmkSS39xnCWZiqyMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNoYNCDZEhwG+3ZtZbzsZol8Sr2z4Q3D9OBVefu8VtI=;
 b=WZOpfBspK+jyw6f1r5AUL37HzN+7r5vqxpqTLiun/5pTjX73M6VqE9udGcmweOWEU5zsyRzsIydDiJiciYqjoFLWttU5A6AGBRARwY2smR49AMSc/UyF3rzZY/9cbfUNJkXCrAhaKPibcBxNpr2jFX3La7w3RKKnQiR4p9aB6n8=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DS4PPFAEF42CAE1.namprd10.prod.outlook.com (2603:10b6:f:fc00::d40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 12:28:26 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 12:28:26 +0000
Date: Thu, 15 Jan 2026 12:28:28 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 11/23] drivers/virtio/virtio_balloon: stop using
 balloon_page_push/pop()
Message-ID: <e35ce7ab-394f-4bb7-8e21-5a8b0c56754b@lucifer.local>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-12-david@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092015.3928975-12-david@kernel.org>
X-ClientProxiedBy: LO6P123CA0031.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::11) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
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
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DS4PPFAEF42CAE1:EE_
X-MS-Office365-Filtering-Correlation-Id: c6992cf3-dbb6-41d3-7fb3-08de543194d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xozOSPF1c67w2mmHm0zH5RuHTZwgCAsD7ToYQyT9ylp544QN+dfHQEd7WENc?=
 =?us-ascii?Q?RhBXf9dPiFwDiKFgQtELzp62bUE2B7xHk7QK7tgpyEZsCZ3o2XB8WKKUjQvk?=
 =?us-ascii?Q?UCw5SX+o0RSbMn7x5tseHLeIWxNBdZIiOcFu4Ooy4npE7Amk/auKRJ8wuJC6?=
 =?us-ascii?Q?2V6d24BwcvR3Dez7BEZ+zu/um4k91L1n6a8C/B+sTuF04IxY04gNYxRZPBwd?=
 =?us-ascii?Q?2PE4NdAEbRc0tkK6LZ6n7UlJs91isNZpMbkI4r8MIBaH0qEEti97M9eep+RF?=
 =?us-ascii?Q?rzNgnGQGmW17Jf8ZWiqbauEijC1LYvuKD1HcVtdYM/eYDbXjuLZFMKIr93vU?=
 =?us-ascii?Q?rjZfFuv3YnSuZorVUzkchTVLmH/mwyJYZQ9FjxyfViBq0lHJaDXycQMURjxs?=
 =?us-ascii?Q?wWaqCJCtjktWwFIW/mcPfMAcXHolabdP+SwWXIDTx2bSk8pzgBKyRXFJvGne?=
 =?us-ascii?Q?MfkkxPTGwGhlg1mQDmWhvUoAQa59hYjUStpIsbbrPkNy29UscDNOTFI/vE11?=
 =?us-ascii?Q?fevxkJnw/FmCIWg/skRv605pJBZLrKiiXOQ7FT5FirMCLxhoRYIMrJ8T11oG?=
 =?us-ascii?Q?jkxPp7DqLOfNvQ5i1M5nnVrfEABstw7N8vt+eFmV85xBrPjW3b2U9DdO41Hv?=
 =?us-ascii?Q?K1TbGv4LBAl3rkQ69Cx9hoD9ad9wDQI1ZIxJq/C7icS2XTPKzOumqRGEZ80q?=
 =?us-ascii?Q?Hua1q+yGN3cE5kmNm7XS/ut2/7DBjESPQLQzHCRx9g4xXTYJwltd0E5qeTUX?=
 =?us-ascii?Q?3ZZWJ+kzIf01UV1fiDF/pM2o357+tsMx5+sMXZIGEqNmgAGJEIs049y9uWcc?=
 =?us-ascii?Q?lfID78iL95aeDmoz8P+Y+p59hPLcXD5orZ4zbGMA7YSHjGoI2t01ukbqB2iu?=
 =?us-ascii?Q?MOCXYP1qogrSeuga9Z0SSOwpIcp96M4BL1ziR62Hx+57oLkStckRku/qw/05?=
 =?us-ascii?Q?kfrKHkO695oliluk+hXz1Zg0YzMWkRJN+HhQZHHix0M3IkNNgLuUNVcrtC2c?=
 =?us-ascii?Q?qy4qJOwy79oahZrhGNOU4iUFf5/S2YmMY2LK+ps7mZ8L7Td5lECKTDt5rIUo?=
 =?us-ascii?Q?l/sXj9VrSaVxINP38quqxKXOySomF3hIQK+/krWWnkwyunE2fGrfZ0k8eGbH?=
 =?us-ascii?Q?ChG+XYyM5aJ2wP1+iMabvCIyAYln2z7fzlWXB+M+aHnFMrya4foAttOLyOCy?=
 =?us-ascii?Q?VR5rtjT4PL9d3jZTrIbaR6ZKmZp/rDLXYP+tG9+1z/kQcmGL7HOE2NN5XhIP?=
 =?us-ascii?Q?wDAV+6iE85vSvGZkE4tWFTc5EywakL0S+ddiA+9pHUhq68wLpGKmLH2DxEnR?=
 =?us-ascii?Q?8/d5WW/HKZzeJiDcTlSCtowbuzUw5/xX/PFDrG5z5nU3HDJ5i5aTFIdcaEl5?=
 =?us-ascii?Q?i1tQoDCRVYvSEcnlLjkzqdmoJYQE5hgcQc6IJkfX2y00hv9ysFVgtWNoC9uP?=
 =?us-ascii?Q?6q8cM6BBoZ+EnZEsuaLfWzgV1i2Bqn5b0qFHmhFY3iR65j4ufIuV+HbWRCbW?=
 =?us-ascii?Q?9egQv57rIaZcK4D7R+J35Am0VRpixAEfYeC2jj59NljFhA9B2Pw8VCymwd67?=
 =?us-ascii?Q?we3Y1Q2tILkp7y9k0DY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d6Om3mS7yDTK6XlqmnC2+kWkbZUxHrwtxSoP6RVOc3/2q9KHx33xLZC1cX+Q?=
 =?us-ascii?Q?qYwXQ8svJtD8Koxj1ryQ0DjUp9iqkEGQd3ASZ1+H/G/1Wiq5Ik4C6CItqfsp?=
 =?us-ascii?Q?S3jjqZaIdXPvZCQ8te76A7yUZ//xfhnWUOIvSMUXPCJLbFXIEhf3L4VL5fAR?=
 =?us-ascii?Q?hbGGzqZ2gM3Z2dgYPXmGbUOubKakpEllmhtVB8kawColWqY52QZPf+x6g64I?=
 =?us-ascii?Q?P2NBv5FXl4nit9AaJtv0zk8cde0T1wSZyXLqHTyove80iPRN8kNm5CChCWwK?=
 =?us-ascii?Q?KlLjnqOfo3W8SyePPsiAm7LX6qkkqZUWYegCG+joud4y/ScDDjHDLPeHbb9P?=
 =?us-ascii?Q?83IfvZ6h+j+28YlOsuHv0V27w/3kVYcGTo73pcoOVXKEelc5aPm36Ms+EX5B?=
 =?us-ascii?Q?HRvkzR5pDyK6vmYZRkWzHnL5W66uClDbUrQONqq+q94UUn9EtUwptFyDZ+J5?=
 =?us-ascii?Q?tSNbYh0Z18/u8oEYAO/2XMcflVPVmPCfKthaHPXF3kuZDErqRB+/FRTA8Dbt?=
 =?us-ascii?Q?e6CPUpYu9ZslEjX7wMu7N890+Hg2Dvs28epmrzdo9LtCuIz0XJjbgpdVJLaI?=
 =?us-ascii?Q?GqcrsagLefgY5NYwJ6OjPnji0Y+3LeLej7xxdrouIzKO6qObYDvUbtlfjn2v?=
 =?us-ascii?Q?UmSvERKBpduU/non1zMAHAzgBYO3YceVGtqw21pUSFEEteWB23cISkDhRfCT?=
 =?us-ascii?Q?n3mpyzeRm11jeojE7c+x9sJWRb/MXKzNG44PKlvktZZ66vF1pd101IkDz2B1?=
 =?us-ascii?Q?HvWSskk+Myw2fUG2i8sfmZkCAZTvSP2TFokiDUfJji+ugRkIVysI1XPgr91i?=
 =?us-ascii?Q?flcmr/r2YiBNxSntp8AFy+aUucBmUOsec1Ik9pIaNDbh5tOVBoyxR4gJSijq?=
 =?us-ascii?Q?sRIRUvoYhq0EzO5rBNWhCHvFX077/2NQ9SJlJjCNdNnsPrePMaDklmJUyq3Q?=
 =?us-ascii?Q?C8DsQ+ie5uVYyAJlG3mcM+F9SdcATqh5USWmEcXKXGArMYjBCoXYsMQL8NO3?=
 =?us-ascii?Q?tQPEvmnQBLwep1IThZy0sw+h4yhq2r+HmTglq94HIOphpfyAfU+LMtXE/2Mx?=
 =?us-ascii?Q?5vJxdJbBY+5oeyBkYsOV8h2wdpUalLuozOvdZg1XfldZicg6CxJ5C7u9eSPK?=
 =?us-ascii?Q?NorYpVYmWB5qmOE6g6Xtq/fd3BSDYiXHina4ZnsW3vxeIz7cItWNmWzf11IE?=
 =?us-ascii?Q?aMsnOPsB1byDJeD+WJNEKhSPV4DTmjZX2g9KFXcT8eXMlin0fVFNo9KX3Wid?=
 =?us-ascii?Q?8nwIOufN6EsuEqdfZOyqYrnpEapsOJOw62TD5VZXLZCtgOjY+S3kBVIz+EgZ?=
 =?us-ascii?Q?F1z9OJHFFQAkkxUUwKmZ3TMfFHoMMT6ipMH5k0jGTCPGM2siUN44W98ztm3d?=
 =?us-ascii?Q?2qgVGH7ySHi+2727SbN1AfprQIfxe35/TmsiAgaQ7AXnyWtPCziP4DPHQqll?=
 =?us-ascii?Q?PkIzYkGKDCD82KIsLc21B14dC8p7bkOPXIbtZp5YdLAgLrUiRQ1x4YfL1To0?=
 =?us-ascii?Q?BXYYqQfAXEweHSKRZyvcIlGD0tiKyfju7C2QtOzYEHaNNIqr06xIilpVYf9p?=
 =?us-ascii?Q?GIdicGXvpPfDyfPRLii3TP84UOKvA6Z7gEfn6p6NZXFGE2UVaSrtSy1fiR3t?=
 =?us-ascii?Q?7BbMZS1A+RrFzlM4IpvdbqHXXr0qgx2Iq3WiA2LWyAZ8pCAsVhZdaAiU3HiQ?=
 =?us-ascii?Q?px+k4YESBZEqfa6xYn4kNvznTps7tOS67gaIGITKKPUp1iLkwZade2ZjIyVA?=
 =?us-ascii?Q?Cro6TY+aOAFmKKkUSuptHOnX4nlr6wI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LJ3QVlNenraHlBwK4weyMlm+mHjX1NNc6f2H+7hxkE3Syt6l2Hz+it9JxWZRq21IEH5VmAaB13/AmDclKGIKsBFInV1l63PzYR35sOryqhKPhRiN8XGI0hiHOASNmmlf35B3LnjzrKi34fjPc/GfmmiZrd+jOJLEUHqlHwdV3gI7ZNDeRG9TMUvCvrEcI5DmgxhZyVNvRXS0b5Xg/aP0ypDdhWfW8SddNLPE7eSrYiCBocATCOpYQ8jwAGfig/rujz6B+bLWt0Qluk3wRZEGFOxlQqitbWpkPKww4klzLyrNPIvOSImnp3D1hVM+RyzFsaKJEgsg/B9igHXBAvimczgxEO1M3dx/Fzm7IMzvFz7qKfjyzg3uSooNONj46WAVDcSpcXgaSnex4Q3c/qYsiA9ZTCCKgzI1UvYhaUMqXZUBPKg9x9erk/uhMRLMn/GJzIw93Zyk88Xp1s9SROmreMMFYn+Q3gypSCQb/86Az4JT7lsE3Q+7YYWEaTdY/tc17M3eOGFwXigrL+GffeFSMss1fVUwPkH+mqksc4hn+KTEykrImTPD2SziOAF5drXhnovCx38GCT32aZx408bIbVAhUhhW/PYH0H35VB6Mte0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6992cf3-dbb6-41d3-7fb3-08de543194d3
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 12:28:26.1038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXTcd/kwW6OYppzMw6cKsJB8tH0UTF/P0WnaXX78e/u3GGEq5D/1ss68RwDMtu7slzFMIHjbtjSlUgMmriaIdzp8iosOtLYk0VIoY8hupoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFAEF42CAE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601150092
X-Proofpoint-GUID: g8K4r4hPnlchlpSZDO7UtdPH2ZVv62QT
X-Proofpoint-ORIG-GUID: g8K4r4hPnlchlpSZDO7UtdPH2ZVv62QT
X-Authority-Analysis: v=2.4 cv=ZtLg6t7G c=1 sm=1 tr=0 ts=6968dd6f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=RKT3Z0S4k35IpmscdoAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA5MiBTYWx0ZWRfX1g2AAsNXEKuq
 DYl1to1OxsK4gl95/dVET81s7yO4V4NHhUrvgtgS64w+v+AFfTLpe8YP/Ucu0Wi9FZ2DIZdQJJn
 87pLbdt/ZWKFckCrmUo4D6De3mrRtAMsQjXoUSPRNWRr/KuVS2c/4bJRD/hqNkwwmxWjkpXclAN
 xoZxeJrFmmPPo8xOBCaAx0bu7mcV+/RVg5Xv5pJgj1Pele6646CMG4z0M3EgAL/Y16kDC4c8JTH
 9p5zwYJyNjLI4TmguIQarlx4bIDoNqMSfyqWeUvgtaP3hDnsL+rlq0DojX7zCrxvsQVmb0ZL5J8
 w3H3/mVW855xIQgbMhyxnYcFTjvvhUDbVIaouT36WDNbNaIcNLcJnyRVKo4/3Msv5YwIdRVcWTR
 SBsZ3FffmvBqeUrSBia1wYSdMX3+9u7drm/6FO7q61oyVFiNqTjJO19jw4/Keyr8eTZE1WlDVvN
 +AEmwihA5ZtScDVuGcw==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:20:01AM +0100, David Hildenbrand (Red Hat) wrote:
> Let's stop using these functions so we can remove them. They look like
> belonging to the balloon API for managing the device balloon list when
> really they are just simple helpers only used by virtio-balloon.
>
> Let's just inline them and switch to a proper
> list_for_each_entry_safe().
>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>

Overall LGTM, some small enquiry really below. So:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  drivers/virtio/virtio_balloon.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 15c1cf5fd249c..6ae00de78b61b 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -242,8 +242,8 @@ static void set_page_pfns(struct virtio_balloon *vb,
>  static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
>  {
>  	unsigned int num_allocated_pages;
> +	struct page *page, *next;
>  	unsigned int num_pfns;
> -	struct page *page;
>  	LIST_HEAD(pages);
>
>  	/* We can only do one array worth at a time. */
> @@ -262,14 +262,15 @@ static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
>  			break;
>  		}
>
> -		balloon_page_push(&pages, page);

Seems this function is unused now, wonder if you remove in a subsequent patch?
If not should remove :)

Just had a look at it and what a silly function, guess was used for kinda
'self-documenting' that it was a balloon page insertion.

> +		list_add(&page->lru, &pages);
>  	}
>
>  	mutex_lock(&vb->balloon_lock);
>
>  	vb->num_pfns = 0;
>
> -	while ((page = balloon_page_pop(&pages))) {
> +	list_for_each_entry_safe(page, next, &pages, lru) {
> +		list_del(&page->lru);
>  		balloon_page_enqueue(&vb->vb_dev_info, page);
>
>  		set_page_pfns(vb, vb->pfns + vb->num_pfns, page);
> @@ -474,15 +475,19 @@ static inline s64 towards_target(struct virtio_balloon *vb)
>  static unsigned long return_free_pages_to_mm(struct virtio_balloon *vb,
>  					     unsigned long num_to_return)
>  {
> -	struct page *page;
> -	unsigned long num_returned;
> +	unsigned long num_returned = 0;
> +	struct page *page, *next;
> +
> +	if (unlikely(!num_to_return))
> +		return 0;
>
>  	spin_lock_irq(&vb->free_page_list_lock);
> -	for (num_returned = 0; num_returned < num_to_return; num_returned++) {
> -		page = balloon_page_pop(&vb->free_page_list);
> -		if (!page)
> -			break;
> +
> +	list_for_each_entry_safe(page, next, &vb->free_page_list, lru) {
> +		list_del(&page->lru);
>  		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
> +		if (++num_returned == num_to_return)
> +			break;
>  	}
>  	vb->num_free_page_blocks -= num_returned;
>  	spin_unlock_irq(&vb->free_page_list_lock);
> @@ -717,7 +722,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
>  		}
>  		virtqueue_kick(vq);
>  		spin_lock_irq(&vb->free_page_list_lock);
> -		balloon_page_push(&vb->free_page_list, page);
> +		list_add(&page->lru, &vb->free_page_list);
>  		vb->num_free_page_blocks++;
>  		spin_unlock_irq(&vb->free_page_list_lock);
>  	} else {
> --
> 2.52.0
>

