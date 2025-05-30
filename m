Return-Path: <linuxppc-dev+bounces-9040-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7C3AC925B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 17:17:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b86LC4CNVz2xHv;
	Sat, 31 May 2025 01:17:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748618259;
	cv=pass; b=UAZc5ygDKNx1a2kMxC5yocmnu2wMwhBVc44lWZvak0hSy4BH/w1DKQUPkO2GJa7qvmVLpYq7Gdl0FawLlqhd3+nWabEIIeZdefTWxQ1r+M33Rsj1wdJqHhygRyltKvZ4zlGOC3xikYoiGPuuGHy3CwDQsZMb+8LpUlkgAssXU/LYYR18WkdQCdQoVkJ+C/Tau8mhQniEKLWPIW1VZ1D8ngMKSGaiB+9NSChFuqxmrRo7+7j3rCqAk48twwrMes4huNOYdTYjLdCOD0OI/I1r9xLwohRAjDBlSIPwHP4TDL/eh0OAf6HV00lDKcRkHbHH78MkFMAIMr1qqfbeKeJFCg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748618259; c=relaxed/relaxed;
	bh=Y/QvbNlRztLrwVJRw4ySGtaqY6CZnBND7tiFkiatjrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aKTR8zJX2yR9yRsQ1+u3jfmialFGcSzkV9ONbYA1+ACJ2N7W/Y22Xo4zY2Gv2tfsjSXOxJn4p+yOCPgwAIK9QN8zX5zs0iw0xBjVZrDYAIeWa1OUBtv+uW2LTLQJWZJaWHcvlLgZ7HjgMGpmjJ6X6ZXL0eC5ebtNKmM84ilACoSaWbp/mFroEIK8+B20tY07ivoKVltxXJYBu+RsjYAFdCkOkMOdPpTI80bXSj1fQdPwGlwHUQK7/4CXwy6VON+0A4avTapanxBcUgiiE2FFTrDp6C67NsodSkhBAZN9OJaDpYAbiK7rac+BazBXUg2Uw2XznqMxT2k3P+hzIuYC6g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=Xktmjtnn; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hm8VXsYb; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=Xktmjtnn;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hm8VXsYb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1764 seconds by postgrey-1.37 at boromir; Sat, 31 May 2025 01:17:38 AEST
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b86LB2GV3z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 01:17:34 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAt2Ya029174;
	Fri, 30 May 2025 14:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Y/QvbNlRztLrwVJRw4
	ySGtaqY6CZnBND7tiFkiatjrw=; b=XktmjtnnRkTTu6cNN5L2nMyunFhoXbJeKk
	1S4c9o+BoKbY3oPSCMgSn57iEuKGWzX5nknXIg9MPKJKyl4SIT2XCXsklsCh61cM
	OvRvwnNYvFMge4Ry2RkCVvymt4r2d26Qucu0RK6yzP4vvDJpJRnaYzZrqhW+URel
	fdhWG+q1prMhsQfTYYB76uJNFtYGqNK+wwJ3GbVuSoT+4qUDIvcUnzGhXiKIrOke
	hYTjZcSVZSYeyyrhF0G1OOd3toJ2bvACA8e6OJOSEiLIeAe4W9Q+pmnYQBPH6kzz
	q7ljhZk5uSpR9Dxg/WN7Rvk2qeLlqQs0hKkCGpF21w7ClnKGP5IA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46wjbcpcbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 14:47:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54UCxaij019186;
	Fri, 30 May 2025 14:47:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jdce3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 14:47:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7ODIx+R/nRpXzcsFGB5OGzGR4oohX/jMqSfUA1HFYxMN9T0q23tfB9c8zk3UWeo03YKapiSYBb1z/kToePqqKuLtuy/93niwkF/4Uu6qtwAVQ+/gduxdFgtoXQDMRdyJb35/lyCIFYmhBAKJYwL0KRYOyO7pU3aSpufBHNQzTEBck23d+/YN+GrMO6hiooxgGxJ9TkqSCSlZol2OzZtvZRWyCu+WSraZnM38mfK0Tyr8JLaBSGRhJEis9WcvI1F89UQQQtGyB7BJ7ZATzXESX+6pEu9lHZIp+mUH2/qTaL953/eV8os9vs4tTce4aQauzUog+8i9aQL40j4l+he0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/QvbNlRztLrwVJRw4ySGtaqY6CZnBND7tiFkiatjrw=;
 b=FYpXkDsHtUcKBGlXosDyWVyvTtpTjFbDDmZ/jjt2GpBi62PKAcI6YIujpNpfEcSxeenmxaIj/nrKDV74AeiGijL1vMOF1UdwZZch33Z5n0pPVhbfmicp7dZMeVXhqCMzD2r91rebKEUjRPBOrMmk/xoQFbVWaoGgP3yXkx5DHegTh1+aVSFnbhWbE2sOHiVxQ6WLS7diF7OjwzkU2SQZUKuOmeYlrcKFbIR2A0bCpszi98aTvUBe3UvmBcC0BOukr8uAJUW7kpPdBkWOvwxQWrmQYUkx51DXA0voKtYeDn3M966qzdXOtqYChZfn6lIIVKFw6PpcHvStOun4vLCtoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/QvbNlRztLrwVJRw4ySGtaqY6CZnBND7tiFkiatjrw=;
 b=hm8VXsYbdpYqs2jWfqsQrkRfZfUl3QKg7DGGfNplhqObBD2e/RoSRo2eoPStyTYEO7eyJYcfag7YqTmCW8ZsGF96/WAPTFDg5/OgmLw6f11urfwew2ad6gbtumg59YQ6D3h89gAqfg6w9ZHqgZARA1rojVCuhWunMAuZQ9tqP58=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH3PPFF6F8BBAB5.namprd10.prod.outlook.com (2603:10b6:518:1::7da) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Fri, 30 May
 2025 14:47:16 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Fri, 30 May 2025
 14:47:16 +0000
Date: Fri, 30 May 2025 15:47:12 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>,
        Ajay Kaher <ajay.kaher@broadcom.com>,
        Alexey Makhalov <alexey.makhalov@broadcom.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        David Hildenbrand <david@redhat.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
        linux-mm@kvack.org, Jann Horn <jannh@google.com>
Subject: Re: [RFC PATCH v1 0/6] Lazy mmu mode fixes and improvements
Message-ID: <5b5d6352-9018-4658-b8fe-6eadaad46881@lucifer.local>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530140446.2387131-1-ryan.roberts@arm.com>
X-ClientProxiedBy: LO4P123CA0458.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::13) To DM4PR10MB8218.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH3PPFF6F8BBAB5:EE_
X-MS-Office365-Filtering-Correlation-Id: 962566d2-3a42-40f2-d5b3-08dd9f88dee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DLGTfu3HT49n8mwVJV7dXPEjZ/IyVham/0OVA6vEuRGB0MFotU3JPOq1iKvH?=
 =?us-ascii?Q?ajZe43IsbzR69lpM8l25ZnRhN9GG8bb1DemrE7T1Rh7NSuvZEkdqXPWg0i6n?=
 =?us-ascii?Q?eHaRCz/J2B7MVHkONaSKaNA3y6OtMqvgLg/pt3qpPZtAOcPhrXtuIuliU2M5?=
 =?us-ascii?Q?XLlbAqycUthl9DNmik+zDuee/FwYeVB2tr4TE+5dsuhj61kjdEJtBD6sip0E?=
 =?us-ascii?Q?5w3YkOgZweqT7GAruGFzl+IudSQcb9P9THsSoZSH0wcAuJF+2DwxygiE54zK?=
 =?us-ascii?Q?zqSOJEoRvkgRUBIYjqAWeMmRnNj9GxNiV1N0k8PZYnCEDk+58wrsmjVwfsYW?=
 =?us-ascii?Q?VVcRP2CCZocpBC1RI/fGKlR6Iym4TMuYEYIpL7tNpZyx8TPiJhMupZ9TWeVl?=
 =?us-ascii?Q?jWVnVipKz618fNRmWNPbkKrHF+B8VnWvv59XfWj5b+IuIknee+KKza33BdXD?=
 =?us-ascii?Q?Hw74+ythuhdwtNsdz31iRwwKraZixhYVA+c8/uMUStQn7WndLZFMsiwxtAEx?=
 =?us-ascii?Q?EeMUGutBKpV2CIycCMO/RzHlfLSDaNS/prcKsQTcj1wpX3eizlCauaEgXbbU?=
 =?us-ascii?Q?1veCRrC1/Nwp0KigkyghczrmegfRA9AtyFSYI6seUMYgjiuKeoVyu5Zk/F9U?=
 =?us-ascii?Q?WkEXftAsS45IHnREyuJkZTbtsNBAFkWCMNP2GbQSdQYnct3ogp99RD62qNdR?=
 =?us-ascii?Q?1U0HuuUb5Sju6AYAlBcK8n+WahU6mtf5z84UXz7zdFWS3tupu5WwlauL166D?=
 =?us-ascii?Q?NKqDW9F1wcj2iILgdzRf578EVAmKKc6K3i7f/Y+0B6CIcTlZVEMXvGYhFzT+?=
 =?us-ascii?Q?7ZzNuvR2DToYUaWA5LpKm20cF5QxwGJsFrdUXKLIcs8YUf6xpiizjLjzJ6hY?=
 =?us-ascii?Q?nN4e7tlhz4ctbtNZCqqSXji9XDgE8MDMgK3WVfrghyNu7NOGc17c3eU6tYaI?=
 =?us-ascii?Q?A4MphqPhS1AV4loJCOijot3VcgNybgOoBi7Uh0Uyh8322TIZlsCZ2+EeOXLw?=
 =?us-ascii?Q?9YTsBmUNcI+Cq7iXW9mWoujdDX4HjkZiFu94VRBlMvJyCM3kzSI96Uu5thJL?=
 =?us-ascii?Q?oS5owQF8rP5uF64Qg3YrnvRdh8JqUodZ+Zax7/+6ZFZNtYADNI42r6nvbTRG?=
 =?us-ascii?Q?+x2pH7REKC0KhALVt+lM9TWhaqNM5Tk5f1Kho1nAxN1XznqUEPX7T1Wr9uvE?=
 =?us-ascii?Q?rs3uJqhLUdJTgAMK7mm0bawFZodBQ9c6PzR5X1skVyBIGZ6E0V/WIcFNF+1u?=
 =?us-ascii?Q?1Hxiqw7Bsnp8HvyHhud27UlFrMpROfQbIAVb8bKB1oVYDurFIiTPNth4dBWV?=
 =?us-ascii?Q?YAtX0vQ6h8wnNygG7uaznC2vtSxFTmeHUEq7uK3WYUpIbSWtSqHZ9DrCPjAr?=
 =?us-ascii?Q?TzVWELnhmb0EZIaKqV13SP+x8DrjMMvMLvTVGA5p0M71qMBSUQdLBAjcbGSS?=
 =?us-ascii?Q?+BdQ//Jl8f8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q+JC66hvzFm6Uk2dih2OEVT1uhV8iZlD0VieGfm0aT0rBIgio3g0k0BxZbHE?=
 =?us-ascii?Q?xukbdz/ZM5NwjG0/vXHsHfQuWU7LYOEigPAHbaKXoC48vstfFG9ZLn8KNnMG?=
 =?us-ascii?Q?xyGByIQeTc0+BzCVDAhi8P9kdLF/n7nfIygd6r6BM+bdTPVHViJvuHEsJ60V?=
 =?us-ascii?Q?zN5XLtfWTk1RsARjtt6rAYMDMXD46tWQW86nl/aQIqJUunsEGeJBG4MAmlfB?=
 =?us-ascii?Q?wMwUOEXnbqeUFZIPG0lw70EDmmRVi7GI4aC9fKu62FfphgYnIxUg9T2XHlRZ?=
 =?us-ascii?Q?GPUTJ31Z9yFc7hXaW29qJYvRckuMbvCoJrHShNIBhjMmvgiJVaw3kwxFzxuB?=
 =?us-ascii?Q?NTjmNdYM7xUdIwTmuT2fz3FSUZiWYHw8mymiRPx5Xc9pfXciy8r5a3yi3JS4?=
 =?us-ascii?Q?fq+rskupKWvcjrQSkF5bqgK69uQNtxODiQ1szZ6BKUKYCOvU07PTmvChhuE/?=
 =?us-ascii?Q?fF5wbzZpWsbl0DM8iZBrAJUiEl7t3X6vDFbpaQb52lODAEcVOdnltwVAnjlU?=
 =?us-ascii?Q?SImXimXsMk2i2sEjYAkJGrCLoJspK0lc5lle3v7de/KrUfFNuY7gEPnqfqON?=
 =?us-ascii?Q?7wBDnUs0blbtakT1fv2iQgrVlbfCXOjKvHWY8F65A99T3hzID9eYErOpyTyt?=
 =?us-ascii?Q?TTrbT87qIqX8wjOT4Mz1BQ/DwdOMjw9RYUtJjgTqjd9yGnM7ZCCRy+C+YPMV?=
 =?us-ascii?Q?evliq17uxIz2SyyFLjaiSAsuI3+tR4TevOsXF51sEcUNxOwQ6oPy9jYS7ssG?=
 =?us-ascii?Q?mQoCuQR1jU16NM++SZVuud9rnbA5CqiXTia0x/NLuecGDeayZC9GCL33u9mK?=
 =?us-ascii?Q?YtDgnSE8bbTTr0NjNB1bEwnXzvGlVDaivspE4WbNj7NY/tzuJ/jX2lDPeIt6?=
 =?us-ascii?Q?KZSHk+d7JS7QorIHnD87n47Bq+AZtTNgCBM8m3d40rX1nUevjJeIE2AX7HtS?=
 =?us-ascii?Q?vpKt1SvMB/u6ASHfDkZhVIi/OHNry6tDeY37YhqNDd1xxP48VNRy9zqAYOg1?=
 =?us-ascii?Q?ycD0etQFkwrCsiPUZFSCUkpf31dy9gvOGX1hz2jrEZKdMWFqbLuzLh+FXGol?=
 =?us-ascii?Q?oshoXrEqlc63TdnTyXIlYmiBjDyPD+Q2LeUmu/UFpwIUnDcHd6kFRTo9hlaH?=
 =?us-ascii?Q?QFeiKcA132B3PP7EP1ln2N9d3Zq/WNJufaBye+qtAscvnbst2PjFRnjauCEt?=
 =?us-ascii?Q?rLDz6PK1dCNxE8L88gehXHvSPMKOqFopuFmKFN2m3W1vzpyDKpH/cnzaORn7?=
 =?us-ascii?Q?s591aKz30VtfoZHss1mMw4m6trFHlVMCQI+Dn4K+/Dx3U7qBdNlJir0qkmg5?=
 =?us-ascii?Q?UfJcva5UBsf1ZUo30U8nlWwwUytMFTKwpqeY02IHwKkhgbQxlKxcug75dxP8?=
 =?us-ascii?Q?ClLDbrz74go12AUMybxcZfKo/knfk4l3rgPFP+LFPUiQqudQI9MmEFkSrPXC?=
 =?us-ascii?Q?UZSaKUhwgFrnCkVVB0sRK8LaFZ7eG8NA06JLyPF5bCBiOktlkAlZ/hFbp7SI?=
 =?us-ascii?Q?OqNIwjGyZ6UZYB51WnXonRPHu4pZJeGJK4AFqZ6g52JK3HCxzdcI53il0BAx?=
 =?us-ascii?Q?u6EvvDZDdCl7LhFtvR63yXE/n/jtsmIe++gFb7LptEPVKArvBfDnxirk3Rus?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ObqvUQbqL1TwvmcNRbHTslwpFkt0+TOvMUVI/s4ygbk3inFVNK5jHdS01pPTZlOVhptIcmoPaqg5cKX2rXPPzpgYd0VOW8TVBr8SC7Z2aFHqJIl9vX2hHPTAkIJQA/QYt1qcvcZ8iIG8gVfdAdC9jJwnz77en/92YVe/cD+DpE6ngi2Dw+zJKL4M0syip7PCQVoJocT15zpK9C0iDWJxxMk4Dpu2tFt0tvgYCA6UTAzbj3V0y0Xa2Z9eXywlj9wbhRJo8xhhWxKRjVixhuK3IqFSG8F5md1BWGAXcJdg43Qx5g+NDoVMn2oADL8nnMHeBqZteOzpuo7K38LokuOFxouar+x16P+IWQjK9emrZfBwXe0q/SgJiO0ClC9HAsERIU05j86rm291gS2QeehgUvDe35tkl2g8LLz4vtTbglVHupW0t5DB7d3dzKadmdu1+Gmn15unfc9veMAnaJ+2vKOpFONIAdFZ+fLg8m3EOsdaJQbZQzxnhC0k4JiF2j2/HM4hpQg99xPWZfABMTa+S35Lis21TXm1OXtWc7gdZKlzTFeWY3uEL9GU3X3i+clvOOwKZVndjWbm1oFZqLOz0RJZFMfMGWcQhFN7mVkV7Tk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962566d2-3a42-40f2-d5b3-08dd9f88dee9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 14:47:16.2589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paCbijAvqhoCcsUE4bx/XLCm21TtFmbcXyty7It48qaRkI8x9OkRvKDnxf4ULgv7XgPmx4YkQhn+tmxFQLGaTyfM7ZkMa5OllQcli09Dv7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF6F8BBAB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300129
X-Proofpoint-GUID: CAC20cpsWRupwdAhkQC36DRJpwiI6bc-
X-Proofpoint-ORIG-GUID: CAC20cpsWRupwdAhkQC36DRJpwiI6bc-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEyOSBTYWx0ZWRfX5bt/W3HQfBxj jR99AVdDh774mt+1De3uIlimIO6UUEtJSo7mQgI4LFDbcCUea8Xsi1dXbt/kNFcKmCwS804oUSA lcCCwpUa7HFoWPVNxbrsdT3GDPqvYZGr6WodjqgmuO6Ez/lDTS1fNI85/tC1ZW0emmJk8omNnXy
 Uv+5zu0uSeJ29JBlhNWy3QbZLKOugalA1J+d0XUdn8ZYGOKwtkBjCfTTEPAlnmppa2ggBLH+a8C cA6SSen2wDNN7LM9hk/xLfnfisGwiXEKf6WGzXH8sBD3XDbusxHYGLspQT7N0RyKouv+8wUlRVQ NhuEwz3qZkWRXDywc/oH/RlEv3KshBga4zmoDM8M7XwDKb37BVhil3n59gaZrp3i1IHRWnk1QG/
 Q2Jv633wTy+yDVt1H5jQzkmDtMl21iExwyImNY/1MzaNlVr2aE/EM/1wJKcvU78aS6Hz7MkG
X-Authority-Analysis: v=2.4 cv=c8qrQQ9l c=1 sm=1 tr=0 ts=6839c4f7 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=KazR_yWdSLylfOF19RIA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13206
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

+cc Jann who is a specialist in all things page table-y and especially scary
edge cases :)

On Fri, May 30, 2025 at 03:04:38PM +0100, Ryan Roberts wrote:
> Hi All,
>
> I recently added support for lazy mmu mode on arm64. The series is now in
> Linus's tree so should be in v6.16-rc1. But during testing in linux-next we
> found some ugly corners (unexpected nesting). I was able to fix those issues by
> making the arm64 implementation more permissive (like the other arches). But
> this is quite fragile IMHO. So I'd rather fix the root cause and ensure that
> lazy mmu mode never nests, and more importantly, that code never makes pgtable
> modifications expecting them to be immediate, not knowing that it's actually in
> lazy mmu mode so the changes get deferred.

When you say fragile, are you confident it _works_ but perhaps not quite as well
as you want? Or are you concerned this might be broken upstream in any way?

I am thinking specifically about the proposed use in Dev's new series [0] and
obviously hoping (and assuming in fact) that it's the former :)

[0]: https://lore.kernel.org/linux-mm/20250530090407.19237-1-dev.jain@arm.com/

>
> The first 2 patches are unrelated, very obvious bug fixes. They don't affect
> arm64 because arm64 only uses lazy mmu for kernel mappings. But I noticed them
> during code review and think they should be fixed.
>
> The next 3 patches are aimed at solving the nesting issue.
>
> And the final patch is reverting the "permissive" fix I did for arm64, which is
> no longer needed after the previous 3 patches.
>
> I've labelled this RFC for now because it depends on the arm64 lazy mmu patches
> in Linus's master, so it won't apply to mm-unstable. But I'm keen to get review
> and siince I'm touching various arches and modifying some core mm stuff, I
> thought that might take a while so thought I'd beat the rush and get a first
> version out early.
>
> I've build-tested all the affected arches. And I've run mm selftests for the
> arm64 build, with no issues (with DEBUG_PAGEALLOC and KFENCE enabled).
>
> Applies against Linus's master branch (f66bc387efbe).
>
> Thanks,
> Ryan
>
>
> Ryan Roberts (6):
>   fs/proc/task_mmu: Fix pte update and tlb maintenance ordering in
>     pagemap_scan_pmd_entry()
>   mm: Fix pte update and tlb maintenance ordering in
>     migrate_vma_collect_pmd()
>   mm: Avoid calling page allocator from apply_to_page_range()
>   mm: Introduce arch_in_lazy_mmu_mode()
>   mm: Avoid calling page allocator while in lazy mmu mode
>   Revert "arm64/mm: Permit lazy_mmu_mode to be nested"
>
>  arch/arm64/include/asm/pgtable.h              | 22 ++++----
>  .../include/asm/book3s/64/tlbflush-hash.h     | 15 ++++++
>  arch/sparc/include/asm/tlbflush_64.h          |  1 +
>  arch/sparc/mm/tlb.c                           | 12 +++++
>  arch/x86/include/asm/paravirt.h               |  5 ++
>  arch/x86/include/asm/paravirt_types.h         |  1 +
>  arch/x86/kernel/paravirt.c                    |  6 +++
>  arch/x86/xen/mmu_pv.c                         |  6 +++
>  fs/proc/task_mmu.c                            |  3 +-
>  include/asm-generic/tlb.h                     |  2 +
>  include/linux/mm.h                            |  6 +++
>  include/linux/pgtable.h                       |  1 +
>  kernel/bpf/arena.c                            |  6 +--
>  mm/kasan/shadow.c                             |  2 +-
>  mm/memory.c                                   | 54 ++++++++++++++-----
>  mm/migrate_device.c                           |  3 +-
>  mm/mmu_gather.c                               | 15 ++++++
>  17 files changed, 128 insertions(+), 32 deletions(-)
>
> --
> 2.43.0
>

