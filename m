Return-Path: <linuxppc-dev+bounces-15839-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0376ED247E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 13:31:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsMlt44gvz309N;
	Thu, 15 Jan 2026 23:31:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768480266;
	cv=pass; b=ZwydycKBqE6lmgh8BoSSZ5mJZkFGWA1nyrYnaYZ1qUwytiMesHwaSBIekzGHC3fgfhOzgbWrn/0ZPVLErNUmAnY73W3mgQ3YJnpuk+lu6uWmOMwLlKgthih5DHyGl5hnme06fVH3187P1nxbvchOqnpx6/XJ4XuGGCfH+M1k7ZPgAvUTb9xv5LVR4bSgVtu2LFV01e0bHgDc2gYBnVkBhLLB57htztocw4gkb5RREECGLK80WHMulaMRhEMBQBw1MOv9Jdwzou84rEseqS3l/zzCmR3tOas1+FV6c3XfSudmqo5KKz9pwYeWEgY9AQ6+OwsczvYYV2Mpa9ca9ArIpA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768480266; c=relaxed/relaxed;
	bh=xpm5iLX9UTk+may1fPfHPfJVyDWPbhTGsKcdfGsH49U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DTzhSoiGytViXPz7WZN+w1z1BmuBQRS4WiS0a+KDt7dPqGRYHT+6+YyQwsLA/rP3Yzl8BhygfpCjvpvy76Z8iykgMNGN8QMSqrDH1eKfOF++mqangdgOANNbqC3bFAtDbGOMP1ThvpMZK7RaP8KVKT2pI3CrgiI9Myp70BZ367T72E2lzG5R+rd3n9lIvmMbOp/yXg1cNtCiFOIcxwV5++Vc9TRXOwb6TXwBG5hPGSantAoNrxXb1+u9s+BQ2IcMvpZDnbZBNPFobSi4upCC8eiWQQ7/jfFWqmy0BRx6S4JTRix3mFfY8CtHmkFgPkRen3YucYhxqxEYAcwp94I5hg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=Y3d8LMU2; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=weUYK8Tc; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=Y3d8LMU2;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=weUYK8Tc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsMls58ywz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 23:31:04 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FAMIpP2682349;
	Thu, 15 Jan 2026 12:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=xpm5iLX9UTk+may1fP
	fHPfJVyDWPbhTGsKcdfGsH49U=; b=Y3d8LMU2KVgjs6V6Z7nPA1X++Rb9tWZotV
	s0s4pQ+Q6CJ3FWdfR97YOZrzsT70vRjAo1X43wDV9hmlas2XIik90ysUpUp9aEDI
	Tg/dTeS41UYd9IE72Dx+4Jlh1ZhLkE4V482TyDwvOHKpsrNjhWvqQE9xmQeUXvfR
	/OqqFzf+hf007p3B2efWYcQIQo2Z85puJgFAkJKK5n7Bv6Q1V3hYTIRZtT+RayMN
	WuHwL12r+XxclKbcn248nq44kBaeY31yu+pMBsa+XQHh6swTHctQFbI8foBpCJpV
	2HT3fIVRXBqG5EWBEXgqEuSwlrks9XpiyHqNZiiK7IDOBuTiDqFw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntb7pmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 12:30:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FBah4b003564;
	Thu, 15 Jan 2026 12:30:36 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7b8u1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 12:30:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPmmuJF147tk4vtXqeeZ9+5vfjKPmhy3CAvdOI8o+KYlxQmtRTEd14XBEVbMLgeiKvj2mv+zqVkNsVjTI5wbQ5KoCu1ft3DUmaWXlHR8HT1gVXHSKrevKZq0khstmrBhbFz+gGgCfz3pFp1X5NVAP4bENV1aS+zkulaUFIEjmOHyAp+uTxOhm/2lIqTHJAtA8A/QWOMTWYQQw9Fc7NuQ6D4w1BsmQP3bFUDLUVIo05xUxzzITrH6+twEwa2g5E3gr6iIfLjliKmee5A1+Y3idCD1AI/9Q6PTLR8kCQY7rPyZQ8R8RBjCs3r+JEMFVKg3pJE/ySOFzO7cpmHTAcabZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpm5iLX9UTk+may1fPfHPfJVyDWPbhTGsKcdfGsH49U=;
 b=JrgmorLWhcL4nW2TShTUGgbZmU5zaEkQT/HgqLfJfEBkmBGEyRWmM/bTxXcZD8ZtQZ1sagXVJVOAD00yGTuoGynrYkQxwtUrES314nalbkI5seANeMqAwOsLr9y2FkfxLvZK9zjFrKMzRe9sZ7jeeWyJMWdCGU+OnSljQDcCZ3SyTTv3YCpL0xzoJvF1K7g1wwcpiEs5qg+fgBbyAPE7s8hxigF2SnSYvLboznfCp7potzQHXOUM+EsTX33uVJnkUKXmpHOjsRbOz4kQsscK1isBnuCHME5GBdtSTRIX3YnSsxJ9y7jcfI+Y39CfOtkNCl9XHfG6LHMc0eRM8y+6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpm5iLX9UTk+may1fPfHPfJVyDWPbhTGsKcdfGsH49U=;
 b=weUYK8TctHizng6JsQi5psTRzkaHkcQdt6VW654Ru0tE/tVTxQrY8nalLvHoDiC2Y0UuXvO2W/e5V+sFg1lcOsTsm5klM3CtyoIq/1ksQIVwqUcml5VW/MOrXLPMQjNFEu8RM9KqEFE09LdflSdPDBVMQg/r2P1rK084NwwLr9s=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by IA1PR10MB6099.namprd10.prod.outlook.com (2603:10b6:208:3ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 12:30:33 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 12:30:33 +0000
Date: Thu, 15 Jan 2026 12:30:36 +0000
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
Subject: Re: [PATCH v2 13/23] mm/balloon_compaction: fold
 balloon_mapping_gfp_mask() into balloon_page_alloc()
Message-ID: <518220c4-c749-4def-9b10-65ff6018d9dc@lucifer.local>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-14-david@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092015.3928975-14-david@kernel.org>
X-ClientProxiedBy: LO4P265CA0101.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::10) To BL4PR10MB8229.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|IA1PR10MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b950c1-db16-4571-13b0-08de5431e083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oQbRknIyGe+s0WnS350HeaHC6Q1ZMKXyUnN91PAtHKE+CbKHFsFrda4VUU/w?=
 =?us-ascii?Q?hVx7PhR1/SY3/cq2km7mxcDIbcDw8FEqjm+UNClmJycv9rlkZxsEH6WD2/6k?=
 =?us-ascii?Q?/l+GzTKWmi/OXhknFg389YQpP0xtiHcD34pk9kSmH4t+wnnWjfFlU+PEVeu8?=
 =?us-ascii?Q?thVxoiGS/gtRwYYYblhAUKmYrXM2/W9W7xeOyCxEDLBK02B/Qw5H4+7wNZhW?=
 =?us-ascii?Q?A67U320edJ6U8Ie/miGORKxW2hp8mbmpNHjs3uVecfrhP7+UQxjoI60UIcsR?=
 =?us-ascii?Q?aBYgQ1DSCv+5dQfCjVpHCeuL2nF9cq9fPNna6dDtXnEtsGQBoDmEKIvItCar?=
 =?us-ascii?Q?i+Uf6aHkySOd3Pn9P5N2Q5DoBh7H0SMTsVzsnRcSomTy86NbT8C3dsZP4rp/?=
 =?us-ascii?Q?D6EjrtTJDef2yBSZdK7r/lRbjcVuzDo48XGGRAsh1b+OfurcsqrAkrsDiWWR?=
 =?us-ascii?Q?55IQcu1JKdcvAsu9aHh2BnqvXJeZJeTd8hAXGI/+Nm3a9Qd9+PjY0gQsR63j?=
 =?us-ascii?Q?HT81oLhE0vwzzmhcvPp6nGyogXUpXGlfeqVuf1vueuhgR5NVx05W6qU6fW79?=
 =?us-ascii?Q?MU0hevcmTpbi44LfXvhvcrVsZL+X7u7qWDhbDgcbF8Rq6qJT0jXIjj1kcSRt?=
 =?us-ascii?Q?ohOc5Yh1BINUwjRZg4X3zwudAgS6MkZBDYlPPh1neV9lE1uCF4iJE+ZyDMTm?=
 =?us-ascii?Q?PNPVjMmxEv1y3yzp41knxx2p+J3NAZjKXm0NtzArR6uj1qz/kmeOINaSesOf?=
 =?us-ascii?Q?IR5rVbY+CGU1KTYYhelUKybRfX5dN1VVNeVGHGMLfo0cDTXFWldZTQGWIhF5?=
 =?us-ascii?Q?fF8lRDMBvjENVMcrpEMIcl0bUbn9ezv0uW2zc9qteGsvL+b6vfFItnkR4ug3?=
 =?us-ascii?Q?t06a1Dcbsy97gQ80f8HsOh3Lmj0hunW1ssacSelYidYdOmVC1reaTQak+DeU?=
 =?us-ascii?Q?VS9QI6QYBbIqRX8BWdKcDP3iHlDL16qjPYpQ3k6Brnvp9SeY15pB7qGP24TO?=
 =?us-ascii?Q?4sJcPQMBSgB2BQdDkJGryxJ5x8nNn5O3iUz7W9JBsUIrBIlZTxJ7fA1BnR3P?=
 =?us-ascii?Q?UlpuGWJ3RluT3AezmTFU/EffU55Qn0HWZclk9Yuc0MMLuqdsiLoyL6wpARMV?=
 =?us-ascii?Q?Kzr8gzAO+IZ02Va/tChs5crlSta04VVjSR3jDidOLpBSLyD+dmqWC+htsQil?=
 =?us-ascii?Q?PXBOwvEsQ8OussVSZXPF7+oPIPPgTro6Rf4nhr0XApnw94v5qHFf7PRc8jeS?=
 =?us-ascii?Q?ETW0thJLPMWbeQubOVZmuSKjr2lPV0SU86ycdWBieVc4ggnkfr4NUVPIFmcL?=
 =?us-ascii?Q?9qIHG7jxTKSTtRswHUDFa4iRZAik/ZSsOLltxOAzPY+N86I4qQ1zLOKbsqre?=
 =?us-ascii?Q?EPlvIV8VY/ax64xJTNtqhxjDp1yUoTtEzBD7JkRMGiaUXBc3guKSw8lgR8Oo?=
 =?us-ascii?Q?lnH0IuXsW5HFmVn57w5Wd7J1vdtfKsIuDpZ3zq6g2j2TEIvlSb2kAFq8Ah1N?=
 =?us-ascii?Q?/H4wEHr9R70fix6yOMwq2s5MRYNBXX3DjQiYIXk3Mq6Gp7rPV+iq+XXimvPO?=
 =?us-ascii?Q?mFcdidFKdYCHgs0pgxs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HO2VBxlLxHEGSijZdsNVIOwhQrKONaq1HRu1Anqki8Ko/HId0WUVfzItMLfg?=
 =?us-ascii?Q?kQ9crAwP+R0eyHVLy0Yvgb9cf5YY3JxyHP3yCWy8IwWYSs/r9BImq4c5SRUn?=
 =?us-ascii?Q?DMDFyd5jDRCbu+uieCASdQ/KA32b1z9S5rhOcb+0lk4SiXa1wDYeVQj5kmEs?=
 =?us-ascii?Q?kJgVi1Pr2gJEqH8wakb+cVwKbAWcMGbNdIbB/pNYz3wxa1lezZ11AXO2Pqtc?=
 =?us-ascii?Q?ocWjxC1OquCwUynYoSnRXqBc6Mz9G9G9XSnMOdsW0+UKv3vTzSXszgopc+d1?=
 =?us-ascii?Q?ve0kc2d/XFDtT2KdS9tU6hTMEYX6Ck360gqjLzDTVwMj51dVUSl7vMZRLUQP?=
 =?us-ascii?Q?bLvocQkV4/06Q/fiq+xfKCb6QboH9y6yDTH5wTS4CmIfaa0rWbkvQCELJVLJ?=
 =?us-ascii?Q?SsVCmW93OC21xM+189laNiYpEffXWH7P0Scom0JCFjKHyJmWEI41KCXUSrus?=
 =?us-ascii?Q?EpX+ONPQQzOfuRzmWo8PVASzcF8H/fwFFhsc4GlxQLb+pHJKlc9vI+8ANGwN?=
 =?us-ascii?Q?LWgZoQ4LjxNt/akMQv7nCrc3N+l1rNYQa/xZlINzf6+qqXg0s8uSe4CIQiek?=
 =?us-ascii?Q?tgPCJjq57K2cSxydXhVayxyrJbmwoWKWzho9177DoBKX2IsMz1C7Jb2/eSkT?=
 =?us-ascii?Q?SCfSZZro/7wvqeSGH3r33w/Xv31ruY08fqkkNLe8wncUeqeeDtB++w9aR5IR?=
 =?us-ascii?Q?46LNyNSRgBYuWiHQG9BC0SpxCLlgpUTsOH9WfZErND3lFTwlnHSEqEjR2S1l?=
 =?us-ascii?Q?vfNMPzvm92BgSENBPcwsVXKB9mvfoJSW/Kym9AMpHrpuk9fr36XGXiLUQLiK?=
 =?us-ascii?Q?dKt6DZshRzXHUnTmmVcCbX0ygJ92lQrgnlbLFK38QexV8PKCXbduV+iGvlv8?=
 =?us-ascii?Q?jEkMsFkY+8PU4/K9UtqvjFkuvlbuKPWeurjVWw5mQhD6zN0izgcs63MI3JmZ?=
 =?us-ascii?Q?xqVVQhR3KITlv2bAXaWIYMHhyXBHivOSFYsGPDeTFvjorb2+kFRLhnhhd+Lr?=
 =?us-ascii?Q?/cHjJPaz13XzxFy7pvcmRlnrPHOtsgHEcE6s5rA3w9t7f/r8iSKAzo9WLfIt?=
 =?us-ascii?Q?9akvYGVBaa6/eIYBrPW5FrWi1urmgWIi9m1lgYqGKuHNe38G4hqlZyS9CF/X?=
 =?us-ascii?Q?TGcJLd19bKweHDyJ6iv9EtC6TGURmJAQgSjACLcqYmZfUjK0pCTRpZQzUinO?=
 =?us-ascii?Q?iVBNumgmi4r5Vc3gPowsXAb0H86uacpdQFuDh8HMC8W8rlSO+G1+yJGBmlsj?=
 =?us-ascii?Q?8nTYMD0vK5Fj2IQXdb6iIC2hDFpgbaUuDzye1GW7zrVYjuSpqpLzpCJ44hx6?=
 =?us-ascii?Q?gwsriYgTkWRvVM/+oQxsfafLXHmuiPt91qdQibxBJK3RGuabFIorMqn1uXWk?=
 =?us-ascii?Q?rBs7NMJhhWPV5MbaSiWFWm4NZCVI2hdq01y9v4aq6r6s9V0EJXiPQ0+Qu7XA?=
 =?us-ascii?Q?AgH/iuDcvoFI68S9g8SzztzBtN1T9viq/TmDU0d3WgO9SJSgO2bJQOhmW6YD?=
 =?us-ascii?Q?9G9K3h2hgvi6Fceld6Pjt5T6+92FbOCL0hp6KyAHJv100TMDfvL+VEr3wZHT?=
 =?us-ascii?Q?xmbAEIEPIu9fc5Cwopl60k6slaRJ4zvxgCAqI3j7e9+DIFYv2otQarZk6IEa?=
 =?us-ascii?Q?oXK2Hj6vDGOtcwtKVJLmUcq0lKOZdXxjW8AeCKXs8Zl8jJDflionrugiEfqC?=
 =?us-ascii?Q?H2b31uM8v5loN3B9E6vKqTur/q7wUPyNvpzxk47OgQFEP+igQ3KtSj/NkyXg?=
 =?us-ascii?Q?2zKX9oaJm4k1H+Ntikyqb4finMR7Xmg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9yb1qjIQppt0y5dkqTKeM4115XGUl11LobUuKnELPywhP6IAyfy5zl2wYzNUXv52p7t1ifgOP76cfa8XNKxLKBz9VUBy4EER5c2y73y5rn9jDwttujXVS2x9Yw4gsxPUynSoOSVZC22tL9eIS+m7Nl9nrl7R23samht8LU6p+vJB+B+q+yuiX77u+ZBN+6QFRtUTyV4zeB/SjpDriNMKHR4TVjS14r6RjWD+6ivRhDKsPicLf7VCn5gdqKMgc8YLb+un1tIaIVBdo7dFkcXUMO/9mtbqI6F5b/QsMMiszX/tAoIRNRMPaXye0dLXDOf/DbsaBBTwXQJv41HtOpBIxQtg8ZKJQg/RxNIa1x0F1q4uosrAQHgWyj9HGPqEYBFcGdgDFhn/6PpjVbW712zPHwdnrigNU6q7SoivJcM+XCvLpL1bkx/NMenAQCgy1WBq5L1VwSakssVjOM1Dv0UpjnW2MYEAY29tUi8HtDNavbP4z3uoZvYFPPC0I+14IjPSfbm3zjQrHLqCdYbyttaEacquiHCYz9YYnCNawqeaFtnOfUlNYFH1Gha62ohtsLxzaU39UxM5DO/Q8lD/Bpo73T0Z5J9HusOnA0L3rw4oV+4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b950c1-db16-4571-13b0-08de5431e083
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 12:30:33.0602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHfNruJR0GBQwJ+nP0No0/P6DbGPUKXBLo/4Uus4lBL9raISgx5S6HM6qFmT5A6skEQA5wio6z0kjzGp6EKDmxI0EkT9Q28zo1feK+9vzgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601150092
X-Proofpoint-GUID: 4sRgv7STqEznbX863AOG6I9Pf5btQefh
X-Proofpoint-ORIG-GUID: 4sRgv7STqEznbX863AOG6I9Pf5btQefh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA5MyBTYWx0ZWRfX+i56z0VFR3k2
 GeqexzhM6t63erzCbVG2I9CtlMOihcqek3Io86U+8bxAdFOVF2imIMZM2T3PIkeazJCHy5RaKr6
 0nvG5OdZ93K03/gdKdPMW1BFP5Zjkd/9RMPTCvUrY0KH0RvT/3NzOoksbvXTu6II3cFh0tM4JXh
 ESTqcjt0iqfPmLkThGhNcjNvQth4uXsJEPVLlwlSTGKtGa5Sgi+g/MxPkaCo3acZvrVVrvAaug4
 diCWhARxmaTLS9mFPvvxpJWVuPndvgy2qfJBeiAbI6Pk/Sz7b+i6gcquWrfijKzasuMxJly3dNi
 qY4lE/wjgpB5DnJHhNBHmItkf312tRb/ocnbxeENaxlwqogbdOtj4cnsnB2X0xFPqbRiOBrJTdC
 dngMLNjKQSRC3X7Jgwif0k9UcCWRMoPkPKeh3zhOafkV1+PwfIgOK/JxHN7aJZs8ABc0Oi/QWcB
 rNGQOSLAJKK/Adk8EhA==
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=6968dded cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=e0Z-gZkOWsdtRys8tFQA:9 a=CjuIK1q_8ugA:10
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:20:03AM +0100, David Hildenbrand (Red Hat) wrote:
> Let's just remove balloon_mapping_gfp_mask().

Yeah... this was silly. :)

>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/balloon_compaction.h |  7 -------
>  mm/balloon_compaction.c            | 12 ++++++++----
>  2 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
> index e5451cf1f6589..d1d4739398978 100644
> --- a/include/linux/balloon_compaction.h
> +++ b/include/linux/balloon_compaction.h
> @@ -106,13 +106,6 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
>  	list_add(&page->lru, &balloon->pages);
>  }
>
> -static inline gfp_t balloon_mapping_gfp_mask(void)
> -{
> -	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
> -		return GFP_HIGHUSER_MOVABLE;
> -	return GFP_HIGHUSER;
> -}
> -
>  /*
>   * balloon_page_finalize - prepare a balloon page that was removed from the
>   *			   balloon list for release to the page allocator
> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> index 90b2d61a593b7..709c57c00b481 100644
> --- a/mm/balloon_compaction.c
> +++ b/mm/balloon_compaction.c
> @@ -112,10 +112,14 @@ EXPORT_SYMBOL_GPL(balloon_page_list_dequeue);
>   */
>  struct page *balloon_page_alloc(void)
>  {
> -	struct page *page = alloc_page(balloon_mapping_gfp_mask() |
> -				       __GFP_NOMEMALLOC | __GFP_NORETRY |
> -				       __GFP_NOWARN);
> -	return page;
> +	gfp_t gfp_flags = __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN;
> +
> +	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
> +		gfp_flags |= GFP_HIGHUSER_MOVABLE;
> +	else
> +		gfp_flags |= GFP_HIGHUSER;
> +
> +	return alloc_page(gfp_flags);
>  }
>  EXPORT_SYMBOL_GPL(balloon_page_alloc);
>
> --
> 2.52.0
>

