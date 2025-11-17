Return-Path: <linuxppc-dev+bounces-14215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 775C3C63797
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 11:17:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d93ZN2m08z2ynC;
	Mon, 17 Nov 2025 21:17:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763374620;
	cv=pass; b=NUPQwf0TJ02EMhUfzL73EHOr00Ha/1TU6+GeLNwh8MwLsrb6tiaY5h1eRq6EVP8CwJQF2bmR5NZuQ1Ed9e8xRUqR10Qw/EWOjvWdTn33WmdVQu/Lvk2ocldxVEy3tHwWI1CsncdwNb8Zbum8tQufosCqFhHIy+bhHipSMGVpNVxmlCuEQHXIKlzqFN4/iw6XsRS+Mi5kfsI87ccekDb2y36XI8eqAAepWdoHs5WE0aXn//VkcbM+0QpCWPwF9SWBK3QJ9gkLQYC4HTHYpjTTucJDK+R2sQl8ANYIsRdGkTV/xzK88k7gzUrrglEfQ4ClO5rjr9V/Aqy1jKkmIcjGcA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763374620; c=relaxed/relaxed;
	bh=XQMWMuHdkrI4O0BYfeyTa33hapYWT/0xB77ui7NrTJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=md30o/GYhEblamsLtdMA9CCyL0mNikP9y6pGgjXfoW/XgeTZD5X4ejn8g7k3vKt/YRtDQ2BqfGVCa/fgHhQAsBlknKiaveK71dn9IrFiSH0eUxCW8Dz2sRMugCz1sHU11bNAiXxfbV319CbR3IeLtSdHskVTEyL4PSXnQaV6tqxvuq93wWaDS4iTWT974vEj2iQHT1J3LZelHQcwMVyM3eek22ZVlUkcKgmyBVAmRc70iu4pvWLXWyPqJtohDkjYETxtvvjZStYTB0RyHvjdlShLbZZPwsqr7TuXEAa6LQspdDukvSbDHbcAq8b603flWMGIuXNqWWK3l78CHB2sFA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=G6l86Flf; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=tYWf2EEs; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=G6l86Flf;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=tYWf2EEs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d93ZL39Wdz2xFS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 21:16:56 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH9uoms020419;
	Mon, 17 Nov 2025 10:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=XQMWMuHdkrI4O0BYfe
	yTa33hapYWT/0xB77ui7NrTJQ=; b=G6l86Flfq1fSiEVTR/PbjfVfXkKRwksLJK
	MqyUDFm3deHg80udp5DoNAMHeBBFcJzo0m3XQYKSFy3YIw9RYPFhc4CZKG42CMPj
	7XdtkP7NKxEttlzSocW5bnM3uppPCleDcrVvufcLTQ9X2osthBxWwGT5gZG+2zNE
	l3DBWAJS3DCjFWUJnJnBArZmywuj/WcZ5lL9WbXeJZzPpXwvxtxk/Y27O2C6+39Z
	LnStB2wk76uzIkzOErE1S536spLrMxKqarV9AAHkMzu9DFDsMSksUl72xFaOs0JK
	u0zL2kGli2yv1NIt8OpioOyezkzNjFpQ8ecgzofMZNvnx5PpIEPw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbba83t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 10:16:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH8u8TS035937;
	Mon, 17 Nov 2025 10:16:30 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefyhqrfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 10:16:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Krulk7Sm88DYL+b7OGlehBU5KdjSOyypeVuZjCHpfVPXxxaBpjXIYcK5iujfznYjLuj/F9Z/3TtuCma0AUNdSPSbCF+AMVlxTNo0d4XvHF67xjl3tD38gQl7xJli1rkN7UI4ccH8TuRVZR0NLUoRO8pgzBys2rx6nTMasStjDWxj/KRf/rmLvH1E9w+YZ1e+9IUmSo9IXPUsTvaMmKC8lWien+IufUAxyvBBGKSj3rlncAzfH/g2Xw7JgK+R9JpRSc0PqyYJrq0JsdsXe88aO9KzpHNW3W1RGJOqaQN/OBJd0ADZF2QWQf/POkBAznA16rKy5wD+pgE8QB+VenJouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQMWMuHdkrI4O0BYfeyTa33hapYWT/0xB77ui7NrTJQ=;
 b=frBkbHUTBXoZ5sfDNMO7BxEgvv482k7ymg/sOhjj+uNDQ99hcHaZc9fpE0ftFw9MshGAsNx6ORQOi/X9QzZNKhUNvkobpWwzBJm/Kr5zdErq9+RQ6FMFSOK3skwxffp/nL5ky0Nk5z6jUlVZ037SbbLs2bifQUKjTeWaWrJCSSsB/rjgoD2pDVsQrUgVkLA7y9ag3Onl5YkOgoIIyYIs2mWkXyNnrFEuN1tKvLlBd3k5gvylX/WC+QfLkUIj4VrDDqR3F2Pc/mCB+wvD5ykbRNIqiLmIxW2GVss+OMmVeT7lgn5n5MvrtoZvJh678/J039UxTkGvO5x5F98V6LCg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQMWMuHdkrI4O0BYfeyTa33hapYWT/0xB77ui7NrTJQ=;
 b=tYWf2EEsNrWFOR65EwiMk/2ugmcRXJxG46a1OSvbtQ2NYY99G4+DhFCOGFbjZKGGl2ZJB6JDKQw2Gm3PIPPWI55LFPPOIaUB3M61EpTRxXYcKw0qhDQuDGQImorVP1prWb/qi9QyI7NucTrj6KqCe6p/WlC3j2jMBiXG/WsXNtI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB7816.namprd10.prod.outlook.com (2603:10b6:806:3a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 10:16:26 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 10:16:26 +0000
Date: Mon, 17 Nov 2025 10:16:09 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Donet Tom <donettom@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v1] mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb
Message-ID: <eb1df7ba-1ab6-4c0d-a54a-52d642595259@lucifer.local>
References: <20251112145632.508687-1-david@kernel.org>
 <eaf2e733-f967-43bb-88e6-7876a28a370c@lucifer.local>
 <3fa6d496-b9de-4b66-a7db-247eebec92ca@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fa6d496-b9de-4b66-a7db-247eebec92ca@kernel.org>
X-ClientProxiedBy: LO4P302CA0008.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::16) To DM4PR10MB8218.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e39b889-3bb0-4af7-7d96-08de25c25dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a5QJqRhquhasDT6PfyDdCwsi+hfcmdwf92O2gpiZLCi0qeaIP6LxR5dkVX2M?=
 =?us-ascii?Q?ukWHdCpRsJZ9SxUU11RLuhfhUp6yoXwHinj/4WRzqqW5Hq3sLMlupSVQ81Im?=
 =?us-ascii?Q?GXJH8P1VWmu2rBQ7IKO7CLPYRcmXMpL3Swb5qFfkkBIJu5N932ZxrDPLRylv?=
 =?us-ascii?Q?/e5w+AXaGC2i4A+eQexa6LNf5152rvhpTp2UAulgummerlvi6v4Ge7Q3BehO?=
 =?us-ascii?Q?L1tuUUPYWSNUg4pJ9jQnP3S9BDCvQ5fjiLC2SJUM6p3is5JFHy5PJi7GkH05?=
 =?us-ascii?Q?TSkm9eDDn5hnWtEHy1mNxk77iLcUWggXcd9PHZVTFWTLG2kgIozm281DZ0bB?=
 =?us-ascii?Q?tjyKNiGuNWHrzLvbSCYb0NKxq5iZNBkDKfx32vZJclhUzZaTgrwZuXHAQw23?=
 =?us-ascii?Q?KX/tW/M0jTYZccvn6jWRUM/9ELpRaxB0B2HF+bgqUxudozwKPqAawDvfuDwO?=
 =?us-ascii?Q?koLEg0dDDM/jPFBYtYeEfmQTEovpFQIG3Xebsel1Y7sMV0EvRnERv6Tfd+go?=
 =?us-ascii?Q?KyUBYqK7whaAawxNJXJU4t25xackVdpd0Q6CMMXlpYIUQAm5002Z8H3vLGMM?=
 =?us-ascii?Q?Y3eTcqPU+jU1EvK/BejG+N2rNHqFA6kd/0CcL+j2kAvSA0Nq1YEqxOyWr40l?=
 =?us-ascii?Q?xgOtlUHJgXeuL2YaRKvM28qppIFv3CVe7xRSPWnh6Tiyjkg+Vd8OgQ7xM95m?=
 =?us-ascii?Q?/xqznbnl7w3b3M1e0pk1sWZEh7PHadfZmrHUKCwL2n8Qww1t4Rw4RnJvI9Mf?=
 =?us-ascii?Q?Uce5X3Ew/fOSwW7NV5LkRyqRlxDCoY66jr6GT/+WzLrjz24xdW1nQ5ssINub?=
 =?us-ascii?Q?N+UnkhLlQDxhFLmqiacu38NMxUyIHUCUZcnupsi3B0vXE3C+MIicdFaMiFgq?=
 =?us-ascii?Q?dD43Wnd64M1TV6sYjSFGg4ImK77CCjhYqXgr/GXP5wk5+afaQxrtohiSs6c+?=
 =?us-ascii?Q?9n9RYnqrWgiF4nAmVdtHwliz33CsGnBY951v94PyhOHjTRAzaBxmOLpnCeh0?=
 =?us-ascii?Q?vh/q31X/k6RyMdJOG4GNrpmlzlqdhxH/V7qAG09M05+B9IBi3iSr39BT2jNh?=
 =?us-ascii?Q?Ougy8eCjiAHxuIZVP8oT/rU+/jsauxMIKTVbEMedkzopJO75+tJVnN+SKqFb?=
 =?us-ascii?Q?cY1F5J1lA0EJQhPQNNUh33hqDkAEifCCRtGsbe+gZpGqUmjIf4DTymYH9j91?=
 =?us-ascii?Q?rd3RKJw7wLzWbKjk4zrhCvi6wYcSNqBVbTl2gjiwZIfpAh5CHEgcQpWDbZvm?=
 =?us-ascii?Q?HcwrbA/Ns8YecETTsRYqID8X36Ghro6XkD6c+NV9yiKb3qtX7TEoehSLaeAA?=
 =?us-ascii?Q?JOrEu+2JwHnVFnb/k2UQI49K/0+f+ApCqlkbzA2owProABW5J7mPC3iVPnqj?=
 =?us-ascii?Q?W841YB2n7IiRNPFaNHLYCJMxTJBISmyGTT5Nf+MG7SohHVrv/BWR4skaSI91?=
 =?us-ascii?Q?mA2gvf5v5patLdUchaIZjCMO1K9dwI90?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Od0zN6KnhhAOPvB487Qm8MAdoRi58r7LwPnJsRBk+uZ3Z6/XlThrGyYuQu4Z?=
 =?us-ascii?Q?vCGV+2oQmF7YVbII1l5QqmqO1KwoDce94rTyS57yl0JJiPeXH4ZtGivjOb2h?=
 =?us-ascii?Q?67RshTq+QjMGoP1TGbJ3ekLxqKd3TIPMRcii6ijGAoelqkWegxqeMOWvFuAc?=
 =?us-ascii?Q?/HjSE3jncBJhhKMDGhTIPuNkZ92amJAC4HK1S6rXfVuTHj1olZn/JvKGg/w+?=
 =?us-ascii?Q?FSN7ZB5foi43bCY7ZqHs7fkyARA4+60NdMSmTIH/qhhcUY0UyDWDVbf57vbC?=
 =?us-ascii?Q?cY2AxwDAUvU9qTonqRFvR9H20v0flnDVFTz9kJiXFgD/ndRFS2tOoP3OfdaL?=
 =?us-ascii?Q?kQDgpFglLmRvX5GdTqGhKxR1aBU08hTLvEIKf8oHNTFSw4X88hxmA/3o6vs6?=
 =?us-ascii?Q?+bGtSK601QZ1oXgNswbmd8H+f/QybFfdXJgo2aH5O7dndIB86+W2P9cq66gg?=
 =?us-ascii?Q?/u5H2OBqCbUzXOh+4dxLl23EvJMGseM5jM/7oqEnxk3ZoBo7MBDK6fM0tU6C?=
 =?us-ascii?Q?qu/lANHcoJXSVmG7lT4RvFb5ftwtRjmr6Tk1PWdt+vBRhTT2PRRD93u8csvb?=
 =?us-ascii?Q?/CfeA8E6vx0ZSoJPaQ+Hb8NaR/CWOWCzeEWR4gxRWUzPk/y5Epzh7PypgOsz?=
 =?us-ascii?Q?xnu/ZXhkUrViGO5pBhJmifl8l5t9cSsTZg1MdruKlLs6xj6W5iG9i9AIZPh2?=
 =?us-ascii?Q?oLQbwHAFflZroIqKX1UGp7eRcWvlhbzXPbpuYtUl6w8J+oYbXT6EdA3Ucht7?=
 =?us-ascii?Q?YOzlavxqCas0FbUJntoajyJcYUcbO/jnxXVSQdkyCrjqN12S9wR2CB0hfZiz?=
 =?us-ascii?Q?y/xovAGNEYcCf0m3pdhdmbeTLJuC6m8tKphSOxqRcz2hnMpHolJN7eP3AlEE?=
 =?us-ascii?Q?o/6bnBWTeUGW4L5ok2RkTSy8JHTfFBGU6nf0BGphVGu80A/haHboqLFx7Erh?=
 =?us-ascii?Q?v0FIY6X528bwamuX+U8xuIEsGag6Mh9KTmtmDXPQBYwzdX4E1K7o2ZgiLrt8?=
 =?us-ascii?Q?pHUNVlWKrWRT20vxbtNqCc0HBQd+umshBqRX40460EGC8BXu3iUQQu+cOEiP?=
 =?us-ascii?Q?vNXuUGMc8I/DvYatamp0TBXnhneB7zd2ZvbKk92eHsmr7vNA4dJofi3muHMs?=
 =?us-ascii?Q?Rd3nX9V1ticzWWgqE8OLI4am+PA0hhTixaVEMln+0QkexPIt1XRQlcTyquY/?=
 =?us-ascii?Q?OdEt+QY34AkJmGO+O9n0p4KZLKU4iC5oHg3OnfFuuVotDvA/QyVE1dYaTtZv?=
 =?us-ascii?Q?u3JoSRqlEfqABDVvZCQlTFsTubRgs6P1aV0YOdijmwNR3Tbv0aNdBCVygLJJ?=
 =?us-ascii?Q?waJDpnSRQ7AxEASDOeOpHK+qreuLPpf8AIvX3V5DtVT6NE3rfCnkRhZ0sNQQ?=
 =?us-ascii?Q?9NyAZzY0Kuo+hob0tPC5/X/IvAIbKi2UTrg/EhgnetHhnPh4XCil08enBboS?=
 =?us-ascii?Q?NCbFMnjNDvLVBg+0+b0gdfv2Q2Z5jgNwD/W+eC+RZOJ6v6An1dTfqbUJOe30?=
 =?us-ascii?Q?F9s67KhS8Zy8sv4Wu201Vn2gR10oNmyMPQm+d/WZqqA8prFNsYyZu2kV2j0A?=
 =?us-ascii?Q?C6BgyS33DbvSySgb6hwtMJgETzmQZd9yUx0l2MVUEIrkFCC+giocPTRZinRV?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	msJRMV2RvHsk/iX3kp8c6x3FVSP2CnnUDuADqkPn44Z+yPbXe5BecziwDfh2X2VrEAULcrFx0vxTAsUzJM7upP1t8Y3foazzV0KJ83/VDqcvSFuLSYUCXkFF/8FQ3cWv3yRo9Pu4N1Ir3Us5CtUKFKt84FEigFFwcamiiwCCCQ0STTDfot1hTu24Ra9hithXglVzVF01bab0GqbY2jtbh1FpHdq/TAWjL4nQfxYuSkFmrbSHcm+iCRitrVRSJuIdKAWsee4+1h3ef/OKPfBMqt2dQ0jYHHlVt6S5EZNGbjgcqR90l1v0M3jJrHwM4aH6b6X4llIrONMbfqmkUbdQom6by20/1m/ez88EHiMfc/vFhMXevkM/mw6iSmqAMhfxme+npGxyMOMEP1yr3+kE+KjUWzMw1lxO6F/DIMEH/7o1LzSn4/65sls4YdPsHlp2OagO5UpA+dpY1r0zUXO+/bQjHCCWDDF23tFohjRucqlposW1vmKgYkm6VdsaW/+aGr9eZ45PkSjYtjaRG5/kiFrkvcGZ977ZLcKApLOczGPbyASlBSVYTwTRr6lU/m8j6e+5f1CtMza9hU8oM5nYeEhZA0cD/BlrFxnpoJHXHUY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e39b889-3bb0-4af7-7d96-08de25c25dac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 10:16:26.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZ8pXctKIsIEQ7b4OdROc5g2pjpUNtpAbSRSEIjg/g5nVdfAii75hvsZwp8cZUIowpRUjAqtrz/3jdXzbwJNhW6Ss2Go+lTdkfx5l78Bs5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7816
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511170086
X-Authority-Analysis: v=2.4 cv=BoqQAIX5 c=1 sm=1 tr=0 ts=691af5ff b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pMh7kx767dpSZYzhpRsA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12098
X-Proofpoint-ORIG-GUID: pJsmWuXk8l9ew4HGeozriIQT4yguP4fR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX5egG/ETN4xGu
 GtS9Zfh00e68wTGaLD8I/5978s9pJHFNKCXzWtFeLTl3gwHLSsMnrykhMxXoLVui17whNBHz2M/
 Y0oS8Xp7MBynjO4GfwAJosu7xRTWyghtRlSjFa1G/jp8kgG2/rGjlFuMf0FeIeHThKVXV8yFIsW
 Fi2YH/K6h13zie51qXf1jGH2gxPMjBTqI+lkhp4j2wf+1v+MKLrgl3f3GU3MsRUxB6TCAhvOrK6
 hrG9AmQ1S7mXQPk6wHhpY043q4vARmq4bLVToLsFE08Rc+V7sRd2Ev0ev3C1iOHsWUCVRiBYoPb
 pmFEcfnWBp2yeer8Pwfr8aIAx73mY5e7EsPlt2WsDwBPygM7uy0qEx5G+6+Y7kl6TFckcSQFNgr
 w/vWn2J/DQZRnNcP33o1yY1JJumpvzM5EWYbp+my/q6E2wpmCM0=
X-Proofpoint-GUID: pJsmWuXk8l9ew4HGeozriIQT4yguP4fR
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 13, 2025 at 04:21:41PM +0100, David Hildenbrand (Red Hat) wrote:
> On 13.11.25 14:01, Lorenzo Stoakes wrote:
> > FYI, trivial to fix but a conflict on mm/Kconfig for mm-new:
>
> Thanks for the review!
>
> Yeah, this fix will have to obviously go in sooner. And it's easy to
> resolve.
>
> That's why this patch is already in  mm/mm-hotfixes-unstable.

Ack.

>
> [...]
>
> >
> > On Wed, Nov 12, 2025 at 03:56:32PM +0100, David Hildenbrand (Red Hat) wrote:
> > > In the past, CONFIG_ARCH_HAS_GIGANTIC_PAGE indicated that we support
> > > runtime allocation of gigantic hugetlb folios. In the meantime it evolved
> > > into a generic way for the architecture to state that it supports
> > > gigantic hugetlb folios.
> > >
> > > In commit fae7d834c43c ("mm: add __dump_folio()") we started using
> > > CONFIG_ARCH_HAS_GIGANTIC_PAGE to decide MAX_FOLIO_ORDER: whether we could
> >
> > Hm strange commit to introduce this :)
>
> The first commit to be confused about what CONFIG_ARCH_HAS_GIGANTIC_PAGE
> actually means (obviously hugetlb, ... :) ), and which sizes are possible...

Yeah, sigh, we love to make things confusing :)

>
> [...]
>
> > >
> > > To fix it, let's make powerpc select CONFIG_ARCH_HAS_GIGANTIC_PAGE with
> > > hugetlb on powerpc, and increase the maximum folio size with hugetlb to 16
> > > GiB (possible on arm64 and powerpc). Note that on some powerpc
> >
> > I guess this is due to 64 KiB base page possibilities. Fun :)
> >
> > Will this cause powerpc to now support gigantic hugetlb pages when it didn't
> > before?
>
> It's not really related to 64K IIRC, just the way
> CONFIG_ARCH_FORCE_MAX_ORDER and other things interact with powerpcs ways of
> mapping cont-pmd-like things for hugetlb.

Ah OK, as I was thinking if it's base pages we could just keep order the
same... if it's somehow possible to get higher sizes even with without then
makes sense to specify.

Lord... I wonder if we should have a doc somewhere describing all the ins and
outs of this?

Not that I'm asking my perenially busy co-maintainer to do _even more_ work but
maybe an idea for the future :P

>
> This patch here doesn't change any of that, it just makes us now correctly
> detect that gigantic folios are indeed possible.
>
> >
> > > configurations, whether we actually have gigantic pages
> > > depends on the setting of CONFIG_ARCH_FORCE_MAX_ORDER, but there is
> > > nothing really problematic about setting it unconditionally: we just try to
> > > keep the value small so we can better detect problems in __dump_folio()
> > > and inconsistencies around the expected largest folio in the system.
> > >
> > > Ideally, we'd have a better way to obtain the maximum hugetlb folio size
> > > and detect ourselves whether we really end up with gigantic folios. Let's
> > > defer bigger changes and fix the warnings first.
> >
> > Right.
> >
> > >
> > > While at it, handle gigantic DAX folios more clearly: DAX can only
> > > end up creating gigantic folios with HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
> >
> > Yes, this is... quite something. Config implying gigantic THP possible but
> > actually only relevant to DAX...
> >
> > >
> > > Add a new Kconfig option HAVE_GIGANTIC_FOLIOS to make both cases
> > > clearer. In particular, worry about ARCH_HAS_GIGANTIC_PAGE only with
> > > HUGETLB_PAGE.
> >
> > Hm, I see:
> >
> > config HUGETLB_PAGE
> > 	def_bool HUGETLBFS
> > 	select XARRAY_MULTI
> >
> >
> > Which means (unless I misunderstand Kconfig, very possible :) that this is
> > always set if HUGETLBFS is specified.
>
> Yeah, def_bool enforces that both are set.
>
> > Would it be clearer to just check for
> > CONFIG_HUGETLBFS?
>
> IMHO, MM code should focus on CONFIG_HUGETLB_PAGE (especially when dealing
> with the page/folio aspects), not the FS part of it.

Yeah this is another weird fs/mm split for something that really is ultimately
an mm thing...

>
> $ git grep CONFIG_HUGETLB_PAGE | wc -l
> 45
> $ git grep CONFIG_HUGETLBFS | wc -l
> 7
>
> Unsurprisingly, we are not being completely consistent :)

Well fair enough :)

>
> >
> > >
> > > Note: with enabling CONFIG_ARCH_HAS_GIGANTIC_PAGE on powerpc, we will now
> > > also allow for runtime allocations of folios in some more powerpc configs.
> >
> > Ah OK you're answering the above. I mean I don't think it'll be a problem
> > either.
> >
> > > I don't think this is a problem, but if it is we could handle it through
> > > __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED.
> > >
> > > While __dump_page()/__dump_folio was also problematic (not handling dumping
> > > of tail pages of such gigantic folios correctly), it doesn't relevant
> > > critical enough to mark it as a fix.
> >
> > Small typo 'it doesn't relevant critical enough' -> 'it doesn't seem
> > critical enough' perhaps? Doesn't really matter, only fixup if respin or
> > easy for Andrew to fix.
>
> Ah yes, thanks.
>
> >
> > Are you planning to do follow ups then I guess?
>
> As time permits, I think this all needs to be reworked :(

Yup! :)

>
> [...]
>
> > > @@ -137,6 +137,7 @@ config PPC
> > >   	select ARCH_HAS_DMA_OPS			if PPC64
> > >   	select ARCH_HAS_FORTIFY_SOURCE
> > >   	select ARCH_HAS_GCOV_PROFILE_ALL
> > > +	select ARCH_HAS_GIGANTIC_PAGE		if ARCH_SUPPORTS_HUGETLBFS
> >
> > Given we know the architecture can support it (presumably all powerpc
> > arches or all that can support hugetlbfs anyway?), this seems reasonable.
>
> powerpc allows for quite some different configs, so I assume there are some
> configs that don't allow ARCH_SUPPORTS_HUGETLBFS.

Ah OK.

>
> [...]
>
> > >   /*
> > >    * There is no real limit on the folio size. We limit them to the maximum we
> > > - * currently expect (e.g., hugetlb, dax).
> > > + * currently expect: with hugetlb, we expect no folios larger than 16 GiB.
> >
> > Maybe worth saying 'see CONFIG_HAVE_GIGANTIC_FOLIOS definition' or something?
>
> To me that's implied from the initial ifdef. But not strong opinion about
> spelling that out.
>
> >
> > > + */
> > > +#define MAX_FOLIO_ORDER		get_order(SZ_16G)
> >
> > Hmm, is the base page size somehow runtime adjustable on powerpc? Why isn't
> > PUD_ORDER good enough here?
>
> We tried P4D_ORDER but even that doesn't work. I think we effectively end up
> with cont-pmd/cont-PUD mappings (or even cont-p4d, I am not 100% sure
> because the folding code complicates that).

Ah wow, didn't even know such things could be a thing :)

>
> See powerpcs variant of huge_pte_alloc() where we have stuff like
>
> p4d = p4d_offset(pgd_offset(mm, addr), addr);
> if (!mm_pud_folded(mm) && sz >= P4D_SIZE)
> 	return (pte_t *)p4d;
>
> As soon as we go to things like P4D_ORDER we're suddenly in the range of 512
> GiB on x86 etc, so that's also not what we want as an easy fix. (and it
> didn't work)

Yeah... better to be explicit about the ppc case I think you're right.

>
> >
> > Or does powerpc have some way of getting 16 GiB gigantic pages even with 4
> > KiB base page size?
>
> IIUC, yes.
>
> Take a look at MMU_PAGE_16G.

Ack yeah, surprising, but these arches can be a whole other world... too used to
basic arm64/x86-64 :)

>
> There is MMU_PAGE_64G already defined, but it's essentially unused for now.

Hmm :)

>
> >
> > > +#else
> > > +/*
> > > + * Without hugetlb, gigantic folios that are bigger than a single PUD are
> > > + * currently impossible.
> > >    */
> > >   #define MAX_FOLIO_ORDER		PUD_ORDER
> > >   #endif
> > > diff --git a/mm/Kconfig b/mm/Kconfig
> > > index 0e26f4fc8717b..ca3f146bc7053 100644
> > > --- a/mm/Kconfig
> > > +++ b/mm/Kconfig
> > > @@ -908,6 +908,13 @@ config PAGE_MAPCOUNT
> > >   config PGTABLE_HAS_HUGE_LEAVES
> > >   	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
> > >
> > > +#
> > > +# We can end up creating gigantic folio.
> > > +#
> > > +config HAVE_GIGANTIC_FOLIOS
> > > +	def_bool (HUGETLB_PAGE && ARCH_HAS_GIGANTIC_PAGE) || \
> > > +		 (ZONE_DEVICE && HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> >
> > Maybe worth spelling out in a comment these two cases?
>
> Not sure if the comments wouldn't just explain what we are reading?
>
> "gigantic folios with hugetlb, PUD-sized folios with ZONE_DEVICE"?

Yeah true not vital.

>
> --
> Cheers
>
> David

Cheers, Lorenzo

