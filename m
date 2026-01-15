Return-Path: <linuxppc-dev+bounces-15841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A34D24834
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 13:33:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsMpV5TRtz309N;
	Thu, 15 Jan 2026 23:33:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768480402;
	cv=pass; b=AYTz1xlMMjUWnk1dU7viLXOk6OuSkUeqo4hnETZJAKq3NNQRGQHcgg/dKt/CsHd0tBtPkbegir7Va9O3mfrXor5lkRj5F15ofWAevrH7CC2QAN5KFJJAu/JdPWGp6Q5apiEavIRuO4Qw9tjGSbGDnPm5BaZ4rSjHsh13I0FZJPKnoya/1MbEp+uh4axLkWUSoMCst+3e6x7mkY4IFtg7g2CUbt+DiMJU/MfRi0awAy8OSYMe/hFQfq1vqK7sb153JFvaiPximrB+L7b5bFDA0kN0o2hPUZ2IHJZOm7TsaKGhBmO51O5W2eeTShHcBFRB2qaxdurs9DDxO6qozgUwQg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768480402; c=relaxed/relaxed;
	bh=qQm0smqaFKTlz4zPJmdRlTK985Yzhr4QyPY+I4yrB0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HMmThxyzovpNv/bK+3L1v57O/KnhAhAlXr9h1UWCvhoGb7eM6oKv1KpoQBGPYpWb9VJ2ARDlwDhf3ZabqqkD36eteTNDgKEImpr1hbrCDX2icKsI8pBidQuF63GUHyrjW8Wxrqml+05GinRAsyfpE5oBigg6FMRoTCQdHHwk3D/dwTlrhJqAy4lH1bb+hJEqeQmkRV3Jo4ZMO7UPsmGpegmhbT0BzRd9EI73SRvTHufq3i00W/cQwZfpnf+Bh/p6ocfCKBa0NKqif+F2+QRlw7hCjNNxH725Cf5ObuaqEGD2Kxy3Fcmt6tPfrrT7m/ld7ISxgaZerPtugHLZeWRxEA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=l5tOK4AR; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nf5iH2QZ; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=l5tOK4AR;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nf5iH2QZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsMpT6Nw5z2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 23:33:21 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FB04Ej1361981;
	Thu, 15 Jan 2026 12:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qQm0smqaFKTlz4zPJm
	dRlTK985Yzhr4QyPY+I4yrB0M=; b=l5tOK4ARff2IHlE/nzl5ARcVkBd96Ivv4F
	vjdNmud7FcoI/m0SDQX77lvTCypmfNjcot0JR9fBc7OwW7MZmURxC67iAjeVkbX1
	2UFAg1oXUF8QNF9wXLivFsI8jKrnqLfvqzga5BIWTJPkUq0gQn3EiYSBalXAxG6G
	5V9acm0vo5Cn7w7DbrQjh/Jn7t8O6urF2Z1zSQPCymJpHcX9UeNEeT9kje7qXrCI
	21m2tuno+/Niij2T6GRbbaLbnTibFB3eyy1vf5fWJXMwnvAqxaiVk9VJnvz1qXfA
	BBgi8qbFORVghhISojoGAhQc5jBOlhWMtQyAVIoORX9ALIiuPlpw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bp5vp2wn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 12:32:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FCLQeF029350;
	Thu, 15 Jan 2026 12:32:51 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012053.outbound.protection.outlook.com [40.93.195.53])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7n2bpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 12:32:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELY/qp62z/PWRhZcPQvNX8iAY6fxwSXBl5Asz0M1At/kHQm8NDKtcYJfUoGSBRw44I+OepPPxfduLbrnK+mPvM/4V37Stsj7dJLzNr4lJyN6lWzD6IzPd6ozQ+rK/C2VFfuKEnBmKTO0pGWH0LvaHxG6xHMbwL2gPFwc2k0uYuypeX5X7/hAfa3Swc6dXEUTbBhwnifmzgedyF7tuKHqsDDbH7hfg6KfLjCZ1af+6txhFf58tDt53evfeCM/y/+WW41LoHBlzSS5fTt1BUjyU+XINzoMgYNBGym3sVurv/R/Ylu9xo1nGL8ZswxFDnohlaF1RWiw4IczjkmUv0vViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQm0smqaFKTlz4zPJmdRlTK985Yzhr4QyPY+I4yrB0M=;
 b=nmDWdZ1aOV6qtVfOMamVWzpfgYYiF2oC8M2ghRgOd6mkFbGZKr+8lA404kjxP3OHn7eJfE04dLNk7yD4SuI/0p/7Y/SYscLXnjxKKOrJ5G9DjpN6hyCzWE/e6QRNKPiDcXnWhmx/F8pIsRE6q5RkQe2y/Wz3QNKfBn+f+LQZOctkDwTWJ39drh8hNmfJn9Gy87q12SuKRKTu/KVuaE33Xwbkj8VmbeqgWZTkqjb10XANyGyjMIhpGFZhR7HjSfwMp0sMhc3g9Do6BJVH3cpjhX0G38iBItk8PcZKv9CVF7S+ju5ZA64aXSmigf2V2uFC+61KQwX3fXG7eY1hFk1oww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQm0smqaFKTlz4zPJmdRlTK985Yzhr4QyPY+I4yrB0M=;
 b=nf5iH2QZMVFfapjbYzlRTosbfZQo/iS6wBAAVS6mu7JmBdfGcCj7UtkOPshj+oeA/2TIy25y7e4TZX0UESExHMzijPpt2TZnRV/szGUc5F10lCHw/+YXRI+atndMdGYXbF01KF5J/g4SLPlif1cHx89w0i6+CKVasyQe/o7qjWg=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SA3PR10MB7072.namprd10.prod.outlook.com (2603:10b6:806:31d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 12:32:47 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 12:32:47 +0000
Date: Thu, 15 Jan 2026 12:32:50 +0000
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
Subject: Re: [PATCH v2 15/23] mm/balloon_compaction: assert that the
 balloon_pages_lock is held
Message-ID: <b19ef19f-7e11-4aa8-86a5-daf88d9df48a@lucifer.local>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-16-david@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092015.3928975-16-david@kernel.org>
X-ClientProxiedBy: LO4P123CA0403.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::12) To BL4PR10MB8229.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SA3PR10MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 65dc6e24-9fbd-40a2-4203-08de5432306c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z+WK35gvoGGHA4DWT6H1CITaZ54JoVcTaBR8EaiHU2D80qnJL8NzrbZeRlhO?=
 =?us-ascii?Q?EUBBk33/crZuP8QBOtiLaRorypAEggAKB0t2eJgJ/Mn1deoD1L1Yc67/tBFJ?=
 =?us-ascii?Q?qA3YRZ2EdrpU+37IlJIs6vWHF/qTQYC3HyBT0h84vy9NAuENa86tpSyItHWO?=
 =?us-ascii?Q?UDiyG2/b7OVsQcFnN0w8kfC41l4yCqNdbJMqZbqgg2Z0UgGRySE1I9qL+hfg?=
 =?us-ascii?Q?2yBwjTU+egkLK5b+LIqhGURTbkGa19hLA96qcaJTSN1ICBeILFuUJhsmiZT7?=
 =?us-ascii?Q?WQE4IXvI7yKoNWk1t7nFLnSMkAqmhp7cu7wkowcBaX8Z+t93RuxUpf3499Os?=
 =?us-ascii?Q?M0X7EyoPyEacoIp6166dqF3Ar+v7fu6DUzvHRlDI1na+J8Q3ye808xFyQmXw?=
 =?us-ascii?Q?zxbYFilpLmPcR2IWKM5UXBwQuLVZOC4gE8tn7lesECT/WN8SHbo7DecezRZr?=
 =?us-ascii?Q?q0+3AnT+A0gbjlXlHr+1QW1ZgS+q4RdHc2UQgQrGiQDONHm3q2iDk6t2CRAj?=
 =?us-ascii?Q?ZjdIA6SP2UiGbmexKbAy1LMbV4xiH8ftQkxelu8r15zxO8prdrLK2kkpftEg?=
 =?us-ascii?Q?8b1cTHZlt/UkWb/kefcRBKwNGVZRiJn3Rkpgr4h86t+ddTbCum9I3niU4wVz?=
 =?us-ascii?Q?DHwhtCDsq794nvW03490Raec6W86Oixw6tZcUKH1qUHDcnuopAsWogZVqT1Z?=
 =?us-ascii?Q?TlMagOy/BPkFW1vk9TMKc1uSttYx5q5He/nWgMorsIznx45eCllxsGITYX91?=
 =?us-ascii?Q?WrIxy7Ny4JdPhzrQOCtsVX8rp5l02TMrvJNoZ592nMCCxAhKORljvm1Qg12J?=
 =?us-ascii?Q?FCCfckoRUjAGX+X7PZAG8GMfhJEAqYZK0ZGl1BtqGSKgVP+bu81wbnb4wWfE?=
 =?us-ascii?Q?FEVGNmwSx/U660pbVUCdqF6tIkhQsns388lOk09AGEHAi8BuLp45wxF9hY3q?=
 =?us-ascii?Q?sLRBAwG9uG4CawpxemDsGkybUdp/PwKcAKuzrWHWDSFmMXCcHotM7Balyx+/?=
 =?us-ascii?Q?2Q4vDBvFbY7oBI6YaL+9/Iz6F8FaQMVMqdFRslRyVJn5WAI8ThcQKrIwQRPd?=
 =?us-ascii?Q?Ny3KhTO8PYeb+wiRjXZeAM1clL44ruH7WqFdqp9slSat1ommQsiQUnE7dCjX?=
 =?us-ascii?Q?WoZtlDWM/UjUbbIS7lr49RO3yYaaZxX3K95MdrUCsBI6tZbhBP7g07a6vLHn?=
 =?us-ascii?Q?5TxBjX1/K8V5VQdWXB8MA+9vJANB/Br5rR5R0NcwPfOV6CcSFI9PwDyAjqhU?=
 =?us-ascii?Q?HZHrBeGSyMPBf6soEunztd+8Oy/FeyUk/BiqDlwUsZZy17o13lTxfQAhgFVy?=
 =?us-ascii?Q?/k4Xl6eu1QRYTwpiaMDO57hW2rldhl1eg4FeAeGhuk9r2DK8h/K2/OrdRJk+?=
 =?us-ascii?Q?MRPyU/Huf9BbuaFxrgKAJahY0ApjYcYhw6bfJ8nuLxcI9/LUccwc54bgyDo1?=
 =?us-ascii?Q?8enemKfnXjd85ahd0MIJgwo/XOmwqeBzfIg28REuse5THBz2odMb6VjwWLQo?=
 =?us-ascii?Q?r+T7R7YWIYqqp/JmMnpOw/TmDnkr0vX7zM/FHtX8jBCUHQ3EAlAz9cuvtczJ?=
 =?us-ascii?Q?o0cexzdpqsS4ZizKUzg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L94XtKjPO4xXgmohYjdgb2MMKZxRlqGQA7xdv660Iun3csyXxNxeVNldHavo?=
 =?us-ascii?Q?uerQQjI8Jue15AvtL4OPfnbNwTYMk0/INqkuSP+Cb3+OiWw+T8UD0BdjIMP5?=
 =?us-ascii?Q?gX0gceEVLDzDUAOE0jgy2Mh72TIWiiqdibRBJV8rIaZC1jgbMyypfGqDAmF4?=
 =?us-ascii?Q?/l9rR+/uFz/J4nleQxBFeRfvuZAY+AfzbCGbkHhwD45haBSJnanSAch+sRUK?=
 =?us-ascii?Q?D2sGwYyE1cRNP+8eob6NLNH6u+33tTg3qs/pZYiCa64C4R3kh1bjemK1lQ1/?=
 =?us-ascii?Q?tR3ZXmazmnnh8Q5OEujYoKNnBYax2HOg0KcSgiAQ6m8FT4S0PL0smkEeQI0H?=
 =?us-ascii?Q?HP39JncxbXgMtbn8ZGDuj+6jIf+oYZrlrCpory+pDuyWMcpBuVCnRv0a0vn4?=
 =?us-ascii?Q?NNcoc7WnyLJQCBPz0/jvA3r1Syg933ig6lLfRPW6sd6nPmn9aWGjiAJdEeky?=
 =?us-ascii?Q?WlzcdhnPOp4JipPi7Y/SoEdTH7hCrFVkHkpnKy2PSg6IJepA46IpBHqpElOf?=
 =?us-ascii?Q?AEeAPBqbaj595wiUwSOUCpfTbtcWvBl11Da6npJ14X28E6gWUZujCp4e0gcM?=
 =?us-ascii?Q?VBRN1jbFeLovZUyoF+2G5FQKa2G1O95cfOH20ONOcFR3RD6ylVqQq6e/wXyY?=
 =?us-ascii?Q?zfZZNtEggq4hEksX/Kmfr9DOvRUIPYksB8cgxweOr3Oja3pmaE8Ojve197rI?=
 =?us-ascii?Q?Dcx6jNXs2zo4/lqlHvF51uAaFYHMqi2917fRU/bNKMPEPUc5/H1hcJsvAuvb?=
 =?us-ascii?Q?0aoozZTZ6mqFE/3h/Ls8NpgZJLVKKQR2QvjPgqL6qiEYKUCBg3lZVDXyhXWa?=
 =?us-ascii?Q?UPWlAoDv0IvQ3nKJuAnVZPDZFi1b5RM/wUcr+lLKhpAnvNdeVfzZRuRgvh4Q?=
 =?us-ascii?Q?6bcSzwQr3NYvlpQSy2VxeZTDF6VMZH5WqvDrstNpYbUWQLU0afDCz+9RuynC?=
 =?us-ascii?Q?sA9cv+y8wIX8r4BrkHeYGeHKWb46GUs1RniDbOVTUH89ulQhKsPjg05GM8EJ?=
 =?us-ascii?Q?R365FJ7w71z8fGYBiO7sqzBaVnh09DH6HBNaRQhrlQ5W5exFYCu374ml5K0C?=
 =?us-ascii?Q?9u7uDon5xnDDWAXDvsyOHMsEpndiN6nwb5O4PKxhWiz7Voskqwiltnd/cK7y?=
 =?us-ascii?Q?melQ1RSNI/CEKHF5EbE9+34j5UMoEUAPUffMb0zauFE28YFq1cckCImzl3eR?=
 =?us-ascii?Q?tjFME0Sg2M2D4+dKXcA6w8rX3P1yIzxFqS1nlsuAvRmHaLmT0dwewz/xyyIO?=
 =?us-ascii?Q?CdrSX1pj4EHW+0t2jlyuoxtgiNMvQ1c0VS1UA7qy1DB8NmnYiUAnqKEPGEpy?=
 =?us-ascii?Q?CxJu9kCzJ449RQk0XviWG9RdBwq8RPdZHFnSBk6i6AULDb+rFw23v4oD2rPS?=
 =?us-ascii?Q?Lyn02zZOHocQX8kVc8H/XOmL+vE9QnKqZGyjm03cq379Y6BMeQMMtq6f9qPx?=
 =?us-ascii?Q?bVcPLWqAB0HV883pGKHdtLHJIDS2F01F+kCN2+tIAnv/I6IAu9HBny5cuZfm?=
 =?us-ascii?Q?xdsEyPgp6Box3BHKXEhZs+EdLYT6fugJTgdlVJEKC+ecX13EibC4DroydkT1?=
 =?us-ascii?Q?o6W+oyYEWxx11F2pEckY0sfyMOuhFI3DLZyE4IWjykKlK3QYF017mAVFz8dI?=
 =?us-ascii?Q?bRGnYQ/D25F8fRyUB06oPDjTgL3HYStOwQHDPLI45M6UeVvwWSKTrXrTFMl8?=
 =?us-ascii?Q?oXWAkF+1X7b7Yb6cWqdWecBTvGWnyAsNColztmbmZQLkwk9xap4kO84NCH8H?=
 =?us-ascii?Q?Jxs8tSjujBG4TzhcyvrzewEgYcm6rEE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4mvHxSeSmdGnJYM3UxkbrCRQMhuKuDuqEmEI9ioY8r/tv7yFRVlmnff6E8AVR7nYlrDzTlKIMnWmmaVipG9PzYq6xVsZ9BV7ySWN25AWGM1ZrXFYLemfM1Y3hdc1V06a071Pbo88utQ/jbUxy0u4Ppsz1F6QlN35MxZwHGjm/trpisTQlQeVGr6LYDs+qFOk0R8ZVHjwwBkQ2RSoyHNhfZWMTLqpbrVhCWpPc/fLnnQfcjnaWP1rxhVJeKuvIbRzdUJ8atNw26JsAwwi0vE4NRYJeT2T4D+1N1uqp6LIFjjUjjTliskmqB3E1UuCZX2q4UYbk5jhnr/B+DWsy7UlIMx6B36vL9ZQyovIUPUl9atHS0xtLkakZfygzx7isXOqPkiR8Cq3jJ1QMbxnireCI+2rz8/cU2MQVg51J90XhkTXuuf4BRDXnHHZmhaZKUYTN6jdIw23IVCDhFlxji3wzg7vfsP5k6DWZ33EvYcQYXDl0SemNCA7onbzQUmVLnxg2rrqLsKVvegA56Oe26Tf4NFi0LJlXNzSXyLIc6d9DKPIx5YgztuP5+LERiw8qpPqLQK3UKOSQJyKO+ogKf/3c1NJ8LC6vkusThonbvXLOLo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65dc6e24-9fbd-40a2-4203-08de5432306c
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 12:32:47.1430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3u4gbw7SliC4kIIxHFYd5BbICej0ZWs6E/qwRD9RDjUXi3Ck2ZM7guzkRBlSlFitvA7YY51ywuT8rxM8jbFxZOTCSsRWXI7c7oGJp7r1Hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7072
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601150092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA5MyBTYWx0ZWRfX3yh5dT4IVX1k
 aDv/B2mQptVwVxjyD17h+LSb81jU/jJKNW3I+yIvxxVQ5Y3j22Ou8L1noE/MnH3s4+g6K5R0lyy
 4U7Res3OS0a33cLRGDsDKoBuOZYgeK7UcG65MLByHIfj5mX8wLfC0r9K02Il/8NSPpAacgyJYaA
 xNUBddmupMG5leohETpSZ7yPclwHzlH7vylvP+a/hWi3QlZ0m/mg4Wvfybt7HMfRFXk+zFD8m0A
 TAaFFrfv5o5gTzYs8lZwOzP60YBrT1qw8WRmt14ABAaIqr/WXLIDvmPMInPEhC9bEYwcvJuurdG
 +V4FrYbPkECcLJb+GVVNYhoW7Vlzf9paP29g3H6OlgWs3oDPVx1hjtl2yZs7p7hhTLFiTfgjOsI
 Cz7B6kTTWFKRNX7XyPimaIteCsmqZF6gfFH1irqTjveL4H9xcDxAfs6lWVSH424CcnLupSQgay7
 wRDsHuNY5vegWfX3ts3t8/PblLrlGhjbsACNuJAs=
X-Proofpoint-GUID: v1rN1q0eqsu-TfYexc4T7ciMW4RfY0nY
X-Authority-Analysis: v=2.4 cv=aZtsXBot c=1 sm=1 tr=0 ts=6968de74 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=b96Zw3UuhIaTbHaz3U8A:9 a=CjuIK1q_8ugA:10
 cc=ntf awl=host:12109
X-Proofpoint-ORIG-GUID: v1rN1q0eqsu-TfYexc4T7ciMW4RfY0nY
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:20:05AM +0100, David Hildenbrand (Red Hat) wrote:
> Let's add some sanity checks for holding the balloon_pages_lock when
> we're effectively inflating/deflating a page.
>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>

Seems reasonable to me, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/balloon_compaction.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> index 717bc43732d09..f6e0582bd7ffe 100644
> --- a/mm/balloon_compaction.c
> +++ b/mm/balloon_compaction.c
> @@ -33,6 +33,7 @@ static inline struct balloon_dev_info *balloon_page_device(struct page *page)
>  static inline void balloon_page_insert(struct balloon_dev_info *balloon,
>  				       struct page *page)
>  {
> +	lockdep_assert_held(&balloon_pages_lock);
>  	__SetPageOffline(page);
>  	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
>  		SetPageMovableOps(page);
> @@ -50,6 +51,7 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
>   */
>  static inline void balloon_page_finalize(struct page *page)
>  {
> +	lockdep_assert_held(&balloon_pages_lock);
>  	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
>  		set_page_private(page, 0);
>  	/* PageOffline is sticky until the page is freed to the buddy. */
> --
> 2.52.0
>

