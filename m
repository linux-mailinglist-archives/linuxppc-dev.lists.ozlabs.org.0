Return-Path: <linuxppc-dev+bounces-9049-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E68AC952C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 19:50:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b89jx3LT2z2xHv;
	Sat, 31 May 2025 03:49:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748627397;
	cv=pass; b=Zrzsj4Ep9B5NceBHNBYIrA2KA2d/qV7QqE43dQH5S5u/ZoqEi17x/CGfddCoLqgNvlzssJOWC81RleNZE4OCrlJTDKyvD92v2jAOQjilEGlmNPuGF+s9sUCf3coZUUoOqAx9m1o1NNNlcfRsEv3zG5m9JKSOZ5OpB7SX0KHS63Q4THaB/p8rDEJDTCvgQNyE2WgtoJVCu93vZBTZcz2+ZorgqMXSh8wBi7zE1TksNdZBDbizSG99My7S/BPdgFu/47uOwRUeyM7AmF/JIcd+AFPhh34exD/nch75Jwww0Mb4gMy4IfOpH1Q/BAEkEMLYck+gcsd77TUUH8Rs4evWXw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748627397; c=relaxed/relaxed;
	bh=z3IMNQdsmC2DCOkbLyx7xZc2rQ1pHkFPsx8mRJLi9aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LIPQU0ya2egYb5CPKuFn9MX0g73ir8rlEV+mw3kdxUXROQvjj1g14L3mqQ1p0IsxI53OHveg+PSOINVJ7Zzt2/amkwm5JCpWk6MxjrGvnulNftYvN2Y9VleNHffFIrvZLU5KTxQVENGd715R9a1B1IQRh8dHvktAcxs0xVhLSP1/DpOx3ZDbjxP/jlzmySLNNWf1r7oA06/vh3qKf51p0F7l6xlFysBbtkAOVBxHlJ+8XSESu68CzyZO/KGoQxm4qhOCFBlPNZ5rYx/Tiy7VChNful9wx+e+nW4nrjT1eSd3vkupiTUOARUEl7yZxDjN/p5/qKTZrL09mGY8C04u5w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=Y9maxsAT; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=oCyl+mXF; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=Y9maxsAT;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=oCyl+mXF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 5120 seconds by postgrey-1.37 at boromir; Sat, 31 May 2025 03:49:55 AEST
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b89jv6tKBz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 03:49:52 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UGN9np027654;
	Fri, 30 May 2025 16:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=z3IMNQdsmC2DCOkbLy
	x7xZc2rQ1pHkFPsx8mRJLi9aQ=; b=Y9maxsATkcbroTC7Gs2beoJCLF7Q5vQT8t
	oy17r4F49Nr8Ki1PdboBXmXfZSUM0V/Z2ipSfoKmZc2jRLvcbAXR3jAMSaMq3qGV
	NH6UIgQA48LvblJE51LECKWW8cy7ffC+mbo678G+ubDwVl9/z0j2MDGEtX64txCG
	G9IkH/b2GDbWno2pgUD6LVZXJzLxJQ3YWxX1/HGXFRrYEkcrkQhyU1HY3r40cRMY
	Cl/i+hu6tGfYA9KZSbtApSDhyfQYLWGxi7WwPklPn+TcLqeJ8UWMoz6HDigToTnR
	sWhXAD8ujMZBEsINl1/h0ah0jJJJr3mqy5VP+c31KnPQuXeW/E4g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46wjbcpjh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 16:23:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54UGE3kU019300;
	Fri, 30 May 2025 16:23:35 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jdg1uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 16:23:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIP9nKk1pq26oj2y5bu4bwf7t1LccVLx+R1Ij+q8Q2/aj9wIUCGhCcEKBXyhVHgdn3BOTBm3gQCwsBRJ2hWcL0ChguN0M2EVqUpvk7120FdGOMhEgVaIISbFbFk+yuRQ1tWk/+gRjCW6aFkdVc3aW85JbOC1RifjZyjht1lypqVa127f8vSAI8hMENS6StG6FQue+hXf57Uj5/AgfNJyJoGVhpQQMRGJ/As5lpAmwiYFz9gglSVJl7PTpBrxfsYkBeHzhFs/++NhwW894n+fxOkaNkgYwWJ+A8KY5w+dXGyZOS+kqpZxXT3hqRdP7OktlRCfOo1NQ8/ssBGPzeFWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3IMNQdsmC2DCOkbLyx7xZc2rQ1pHkFPsx8mRJLi9aQ=;
 b=B05DTUNndrRC/znt9MkRGOhx/LJjPfABIjHA+o7uIe2T9KXcQflos/rNmHizW4YDj+puszCbmvuS7lhH5wG7veJTOj8TWpwMkV2CSltoubWVCeuvtwHdvIwlJ1vLf6nyFzwxf+Khbn3unjBiLM56dApgHyV7CC9b+x0qHehvLbEAPOTv4MCp2DFogOBo0veHVTomXZBGm/Jy/gOBEGzrKAehU0mdfLmau+kCGxaarpDygb22D3EigOtbOW/lvrxPFj4rCTRjMrt4ia6jzxdoPpZ/Mz8IQsjCHBG6Nrzw4APlgS+1kBi6haZ8it66rArcQBEDLtGlfjJyRGtiIL6ClA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3IMNQdsmC2DCOkbLyx7xZc2rQ1pHkFPsx8mRJLi9aQ=;
 b=oCyl+mXFmpvBmRnPZxUw2KzJBEl6GocTDSe3Y1VqRHhhvj3wiDWH9alaPuD6cj60ovuNd7UxVNLF1ccohtV9TG7zhHWzY9HRCr+11MQ57JDXq9coHNsasy7szPdtscEU6gMwDirFj2PrmgA+3muA84uZozqe0EjWRn5masqUlEg=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM6PR10MB4218.namprd10.prod.outlook.com (2603:10b6:5:222::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.35; Fri, 30 May
 2025 16:23:32 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8746.035; Fri, 30 May 2025
 16:23:32 +0000
Date: Fri, 30 May 2025 12:23:19 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
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
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH v1 3/6] mm: Avoid calling page allocator from
 apply_to_page_range()
Message-ID: <6nf3cxwhij7jtfi2u6nmt4igezf754gmue5dfskn4jkfkxmjzr@7btdipzmzjuo>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, linux-mm@kvack.org
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
 <20250530140446.2387131-4-ryan.roberts@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530140446.2387131-4-ryan.roberts@arm.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::34) To PH0PR10MB5777.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM6PR10MB4218:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be6b663-a884-4de3-d462-08dd9f9651b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5HT7V/TJEwTo2zZW0rM9ZsHJfQTrhquflzi9GU9aGf1bUgCnGmDpC0UHzee8?=
 =?us-ascii?Q?pOM2WYan0fj2+qk9LPK0OfOeEUDrkmkC6XOW7D+NvjN0+sUp1q11nxzlYlWR?=
 =?us-ascii?Q?KlgLCsM6FYGDxGH6Je8s9CQUAJRGAiGnDKt/C9Ts7WKzeqdBV5PqbLSn5+wN?=
 =?us-ascii?Q?E77VM/DTfaQ4azHEJVyxBE4dx5G0UIBzscS/irKaZfJk6XCerh6NEc2CTt9u?=
 =?us-ascii?Q?8G7w4se68aakL58PA5cRfLyJ5i/6zmd5Q38HxDtY0Iq/G7dl0leqUfGCs537?=
 =?us-ascii?Q?MvU3eS0snhRQPRaPWYO56Izc56vBkAd9Es5Y1xLvJzkCqj6s9cu+uZVZfoA3?=
 =?us-ascii?Q?9a6YKRlpECqk0eLV++maFZ3pMMm0LQMACiLADW7PCrqpm4P/qvSRI9agUVcd?=
 =?us-ascii?Q?cQHF+WJRpMRBHrnj/p+vGjMas1Rp8qNe2z2r9YtiHPGYrD5+XyVDoP3P1qG6?=
 =?us-ascii?Q?/7ZBIScpzdttNg04Z0GfRGjBkyxOmtzos/LZalUndL9e1+ZeuEPW629NN05S?=
 =?us-ascii?Q?BoUy4g3UfcURMfvQAgHx3V3yCjiMMXpkaVdFQsgh1hXBw71tocPmAGtTq2Vg?=
 =?us-ascii?Q?WomDLf0wg0N7hA+hmMppfCE0mZuoP8m4lURcOteJOLBuIvnTWS95iqk8I5CE?=
 =?us-ascii?Q?QY/z/zgICyKwS3I6so1Y+Y9hqcyWq0WONxg7JhRLfkwPRpaO3YA4hqMeXH5c?=
 =?us-ascii?Q?4B8baik83sep1jvilJ08XoH8JGf4wQw+jglLOviI7P131fcb6gRl06DPMKu4?=
 =?us-ascii?Q?QJv6tkntdUJiWrg+r98N8uNge2i/cns23u3nwKVLRR9bqPdFgWftRUgiWAKP?=
 =?us-ascii?Q?0/GHDnMK82RRo8ZsG8fbEeHGgxHqIRKdqg2Pg34CeTqbPbhc3pyjORRuiXZ/?=
 =?us-ascii?Q?NPNVYFWTFOAOdF4yyR+dgLA0ry85yFj6Rr7Q04DY5T1pK29Pejr/9WI02wF0?=
 =?us-ascii?Q?o/eoosvcKZCo5iI3zeQ+znaII/LAf9geILgq6FrziZ+Kr84hc7JLekYX+ZJM?=
 =?us-ascii?Q?MPPrNtI0oEKvyluhw4P7oO64JMm8FZFzT6y05VVvjZ2NgM77/mFlns9thl2Z?=
 =?us-ascii?Q?4ERLwjlqFKdJDy9nrHn9p48l+Q5NkrN1fgyR6RCYBGcRBasfRpd+zzBr7wIR?=
 =?us-ascii?Q?MsdKtyFV9RcgFRw2P6DEyaKseiWw22AIA3EXfdd0clK7muvMG+vPWy8m6fMm?=
 =?us-ascii?Q?EZQqVzAnuc6THMieZoiHoOtQH56c+NHHxnrjO4aqu82xikd89vozRKsgVip3?=
 =?us-ascii?Q?SD1APnFBr56N4gLpDgq3n31pq3YiyPizlJ8wD9OkQAJJm07BQ7BLqj4hL9Sf?=
 =?us-ascii?Q?I8cMLfJ+LLnCe2vhunntRdu1xEdCP5nJ2JaKsa8XyA8C/6KoI6GxQekc47+b?=
 =?us-ascii?Q?L5HTpm9Hw8AEUKXZPkdXHd5s0v1jAW74PUjZ65L25A7Tgj4TPnPEUPbMQR5S?=
 =?us-ascii?Q?CkWU6TSOH0o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1hbAFM/AdoIhAGVP9GYa+QS4ch2Ju6Gzvz8mraHPe2WuiBRp+TRJL2r5tnNB?=
 =?us-ascii?Q?E1S68gKbzsMvaUrRGC5g9ftvF6uvzt4FW5b4frY6NxSL89U3/l0tgiKmJhRr?=
 =?us-ascii?Q?y1Nxi2ot1qqklzX51nto8pOHTkrgMCPK6ERHyx6MATtP8Bbn8Bn2vFri/g6m?=
 =?us-ascii?Q?q69vKgWMsgNLJCgBF+eIpwndG8suSQPwFHot13QHnheLfbjbqLHgkBMLuRmb?=
 =?us-ascii?Q?JGOigdDO54+oGI9PzWrHzOm6Xtu7WEpG/nb/F92h3DVevnFYuGKMmlJR9MvX?=
 =?us-ascii?Q?MKtJz4B96qEMKOZ8lHe4x1e7PUtjmjLFwFPDzLgIhmwz5BhnRuJT6otzwChy?=
 =?us-ascii?Q?CcVBJn35OYnU1VM5CxLWMnhTU4HTssG0KMHmrKyP4PUt6LwV68MisX8x+1F7?=
 =?us-ascii?Q?4ia8ABoABeygTq8XQZ83pbBNLIX1oeFU/O6U0+40m2eJuRW8be/9nb16cOWl?=
 =?us-ascii?Q?0MDiFMEG9MpXssFit/FSBZgq8qK6iWaG8JnG6knJbg1W4mxpqquOClOGPpB8?=
 =?us-ascii?Q?ogdRHTh/69guyjLnXeMRTlWMYAlnEgxM1yc3qJ4YAowtUIcCDi4qVMQkP7sw?=
 =?us-ascii?Q?RRcgDbQcZgtpMlOxjMRDE39dV6ZcAldz+MHxKNEM2aXDPDkHTv9wapWJRaed?=
 =?us-ascii?Q?GtFHFHCyxjiZO1ETSgclLjMWWQI5svITQ2KMpNqmiAi45UN7O3WHTTNPhmIb?=
 =?us-ascii?Q?VKR1Enu50KtHh6IWaUeMBkPFB7ap8CfAjspDqZ48RQ3rBdLjlvFXoKC3x/gW?=
 =?us-ascii?Q?2232Dd+IIc5jmxHrWE7+1P1LW+jYqqH9rTcOOzS5XR+794m5uZcgsAfxYXO3?=
 =?us-ascii?Q?+lDPBSmDIa2xvumyC0HroxeJRNdrPz41ZrKrCpWkjKuaa+rnfarGIWOVKWCL?=
 =?us-ascii?Q?7LsYMP41LQdORi2iWCVkvE65lwGLQqHZRtRXZPM5KqH4kBzEwk+ChkYFm25W?=
 =?us-ascii?Q?pL17Zfmww4gniRB1/ZxQsGGYy49iGoKi9OtOrF1IEF72pFS8hLXxrbmD70SJ?=
 =?us-ascii?Q?ofPKg6fr5ZsnCothc8x7CUn0/7X3QQhFGG0X7nqhceXlDpv6k0W1uB0RL+z5?=
 =?us-ascii?Q?x+CCh+SNo5aJVbqoM3F7Z1VPTYOPw/n/wel+7yTQGM7WFkqxw2rkBS10qr9z?=
 =?us-ascii?Q?cEIJW6kFrTbrBitzMFj4recrAG81JYUgXRGPD8XlS8VHsNw2EeFxnLs2a65N?=
 =?us-ascii?Q?Cw7teRvrPnAg1PvGI6eagtk0xSgOAI3fpgX5nGgGjZmwXzOyninjcpJ7oVSY?=
 =?us-ascii?Q?ijcdetf46ChCV6ck2RzcGRNngvKw1s2AThJlJwU2qkf7biQGWLrO6SxO5V/+?=
 =?us-ascii?Q?eb+78lRA/K9GVUic4FACiyQ5JAenUJA3dSfiPjlETsetARZtQgFcKa0GykLR?=
 =?us-ascii?Q?iPFtSNQ3eghjHXfAiYgv2xCKM5+D3irz/Gq8XPPHGOm0SCOVzDaDk7EyXE06?=
 =?us-ascii?Q?McCEJxjaXTyrg56VOkd+WaS42dQJ6DVZIR0hnzbpIkaDGHa+sFW8JgAWv3G1?=
 =?us-ascii?Q?qKjNdX/o6zk27hcm8Yun0ChCUYyq22PQNE0Zg0XIQk5h/AjBdpnJL+gTIuDB?=
 =?us-ascii?Q?/QtHwlH6Iu8bHBFosP7fiU6991tCnfdU54ArLkd0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KBKr0pL5HgZGkOok8B5HfawQ6ctregPXPVEk5dUOaZlbBoHbLKDlIqatRX9hNxA86sQ443J+gwMIpQM09SIopc+UIwBlBzaxkTX/wqZPVbjhOhvFgE5DSyiXSIPswdjsZIT84BiTaDO6mtMAhSpJ3ZOsKtsAwbYpFEWKT4DNYmvddeQqVW+QTtjz69vO9afq903t/GwjIxzP4WZgIp3QHr4hNXMJEjTmENMVMi5cVkOJ2g8CA3TApIvLgfUZe9rTWajc6s6NfuSRFCZmNAS3vTGlcvCLOJCxFtQGcPqs6ZNLoAvDtBMk3mV2oSRFu8pTaXz05CTkakQU5/U0M9aCie7zq7OSJQ0x6nqFn+WpwedhTEesCgB1dcN4tANh+Jzzp5JLkmaG+hYnLZvdZjCHsfDF7T4BMluhtnRqQUTxD3ACSm2KyWG+znLXggy8DvFN+xlZ1/qOTtpfP9bGPbLWf8VnpdNAVDxs1kVx1f84JuEnI3KkijXSddsj3CgjhpOMy6GigmL+en3khWFpN/QQh8Wsbt0d0QWxegs9n+4sN7qUSgWPxYWJhqMQnPcY3h8PcLAUvNtiPFcfkeRJ8Y2VkubUxi87tQ1hW3Dvtj9C7qQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be6b663-a884-4de3-d462-08dd9f9651b4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:23:32.3861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LQLNejlDYm4KVGqjMxTNaABALov65WQAJAG4Yi73QiAYLLQ1CukZoXCPD5VgxF5S61Bi+QsjDfanrNCC/F19A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4218
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300145
X-Proofpoint-GUID: 22ulwtNqNm5tFI6AH-5TBf-qOW4Gyq_x
X-Proofpoint-ORIG-GUID: 22ulwtNqNm5tFI6AH-5TBf-qOW4Gyq_x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0MyBTYWx0ZWRfX4HMZDLoR8DfV 37lOwoY4qz3TImL0+3UMQmzbvqkiwq5AxIlp9er8pJBSalRprWhESbEn1Q/dsfxN2wyzlKcZQMl DJariRI9Que0+Neq4NitZOpM6qOteaqH01fdiaa0vN2S5S+APAf+ug5Y2dKVMgNJk24iv2mmKkJ
 Im9ghpzjm0tg/uacEIm7QHnDCpHutQnm37vEGNTivF7ketd1GoNwVETEXtUbavJms3IvxmEX/QA 1drbnuCa5/h286riEXFucRQZTLKF4VbaPjNbvuQq+WqXdQWbhv7HT++wXaD896ORBVP+q8vb9Ro 06xurYb3f+IT6GGx205Iidq0NJp7eJJnJvYZKYhbkR+sD1Oprl3h6TktY8TbTdZ8l4Anb7lmX8y
 mdGyGB3Mwm4vpebfzRh+Xl47IsBlta80tNNMbhAX9+S1fip5IncFZlczjgSuHnsAILEt/+fL
X-Authority-Analysis: v=2.4 cv=c8qrQQ9l c=1 sm=1 tr=0 ts=6839db88 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=BttKmYIqwxqZfdoHdj4A:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13206
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Ryan Roberts <ryan.roberts@arm.com> [250530 10:05]:
> Lazy mmu mode applies to the current task and permits pte modifications
> to be deferred and updated at a later time in a batch to improve
> performance. apply_to_page_range() calls its callback in lazy mmu mode
> and some of those callbacks call into the page allocator to either
> allocate or free pages.
> 
> This is problematic with CONFIG_DEBUG_PAGEALLOC because
> debug_pagealloc_[un]map_pages() calls the arch implementation of
> __kernel_map_pages() which must modify the ptes for the linear map.
> 
> There are two possibilities at this point:
> 
>  - If the arch implementation modifies the ptes directly without first
>    entering lazy mmu mode, the pte modifications may get deferred until
>    the existing lazy mmu mode is exited. This could result in taking
>    spurious faults for example.
> 
>  - If the arch implementation enters a nested lazy mmu mode before
>    modification of the ptes (many arches use apply_to_page_range()),
>    then the linear map updates will definitely be applied upon leaving
>    the inner lazy mmu mode. But because lazy mmu mode does not support
>    nesting, the remainder of the outer user is no longer in lazy mmu
>    mode and the optimization opportunity is lost.
> 
> So let's just ensure that the page allocator is never called from within
> lazy mmu mode. New "_nolazy" variants of apply_to_page_range() and
> apply_to_existing_page_range() are introduced which don't enter lazy mmu
> mode. Then users which need to call into the page allocator within their
> callback are updated to use the _nolazy variants.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  include/linux/mm.h |  6 ++++++
>  kernel/bpf/arena.c |  6 +++---
>  mm/kasan/shadow.c  |  2 +-
>  mm/memory.c        | 54 +++++++++++++++++++++++++++++++++++-----------
>  4 files changed, 51 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index e51dba8398f7..11cae6ce04ff 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3743,9 +3743,15 @@ static inline bool gup_can_follow_protnone(struct vm_area_struct *vma,
>  typedef int (*pte_fn_t)(pte_t *pte, unsigned long addr, void *data);
>  extern int apply_to_page_range(struct mm_struct *mm, unsigned long address,
>  			       unsigned long size, pte_fn_t fn, void *data);
> +extern int apply_to_page_range_nolazy(struct mm_struct *mm,
> +				      unsigned long address, unsigned long size,
> +				      pte_fn_t fn, void *data);

We are removing externs as things are edited, so probably drop them
here.

>  extern int apply_to_existing_page_range(struct mm_struct *mm,
>  				   unsigned long address, unsigned long size,
>  				   pte_fn_t fn, void *data);
> +extern int apply_to_existing_page_range_nolazy(struct mm_struct *mm,
> +				   unsigned long address, unsigned long size,
> +				   pte_fn_t fn, void *data);
>  
>  #ifdef CONFIG_PAGE_POISONING
>  extern void __kernel_poison_pages(struct page *page, int numpages);
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 0d56cea71602..ca833cfeefb7 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -187,10 +187,10 @@ static void arena_map_free(struct bpf_map *map)
>  	/*
>  	 * free_vm_area() calls remove_vm_area() that calls free_unmap_vmap_area().
>  	 * It unmaps everything from vmalloc area and clears pgtables.
> -	 * Call apply_to_existing_page_range() first to find populated ptes and
> -	 * free those pages.
> +	 * Call apply_to_existing_page_range_nolazy() first to find populated
> +	 * ptes and free those pages.
>  	 */
> -	apply_to_existing_page_range(&init_mm, bpf_arena_get_kern_vm_start(arena),
> +	apply_to_existing_page_range_nolazy(&init_mm, bpf_arena_get_kern_vm_start(arena),
>  				     KERN_VM_SZ - GUARD_SZ, existing_page_cb, NULL);
>  	free_vm_area(arena->kern_vm);
>  	range_tree_destroy(&arena->rt);
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index d2c70cd2afb1..2325c5166c3a 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -590,7 +590,7 @@ void kasan_release_vmalloc(unsigned long start, unsigned long end,
>  
>  
>  		if (flags & KASAN_VMALLOC_PAGE_RANGE)
> -			apply_to_existing_page_range(&init_mm,
> +			apply_to_existing_page_range_nolazy(&init_mm,
>  					     (unsigned long)shadow_start,
>  					     size, kasan_depopulate_vmalloc_pte,
>  					     NULL);
> diff --git a/mm/memory.c b/mm/memory.c
> index 49199410805c..24436074ce48 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2913,7 +2913,7 @@ EXPORT_SYMBOL(vm_iomap_memory);
>  static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  				     unsigned long addr, unsigned long end,
>  				     pte_fn_t fn, void *data, bool create,
> -				     pgtbl_mod_mask *mask)
> +				     pgtbl_mod_mask *mask, bool lazy_mmu)
>  {
>  	pte_t *pte, *mapped_pte;
>  	int err = 0;
> @@ -2933,7 +2933,8 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  			return -EINVAL;
>  	}
>  
> -	arch_enter_lazy_mmu_mode();
> +	if (lazy_mmu)
> +		arch_enter_lazy_mmu_mode();
>  
>  	if (fn) {
>  		do {
> @@ -2946,7 +2947,8 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  	}
>  	*mask |= PGTBL_PTE_MODIFIED;
>  
> -	arch_leave_lazy_mmu_mode();
> +	if (lazy_mmu)
> +		arch_leave_lazy_mmu_mode();
>  
>  	if (mm != &init_mm)
>  		pte_unmap_unlock(mapped_pte, ptl);
> @@ -2956,7 +2958,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
>  				     unsigned long addr, unsigned long end,
>  				     pte_fn_t fn, void *data, bool create,
> -				     pgtbl_mod_mask *mask)
> +				     pgtbl_mod_mask *mask, bool lazy_mmu)

I am having a hard time understanding why other lazy mmus were more
self-contained, but arm has added arguments to generic code?

>  {
>  	pmd_t *pmd;
>  	unsigned long next;
> @@ -2983,7 +2985,7 @@ static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
>  			pmd_clear_bad(pmd);
>  		}
>  		err = apply_to_pte_range(mm, pmd, addr, next,
> -					 fn, data, create, mask);
> +					 fn, data, create, mask, lazy_mmu);
>  		if (err)
>  			break;
>  	} while (pmd++, addr = next, addr != end);
> @@ -2994,7 +2996,7 @@ static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
>  static int apply_to_pud_range(struct mm_struct *mm, p4d_t *p4d,
>  				     unsigned long addr, unsigned long end,
>  				     pte_fn_t fn, void *data, bool create,
> -				     pgtbl_mod_mask *mask)
> +				     pgtbl_mod_mask *mask, bool lazy_mmu)
>  {
>  	pud_t *pud;
>  	unsigned long next;
> @@ -3019,7 +3021,7 @@ static int apply_to_pud_range(struct mm_struct *mm, p4d_t *p4d,
>  			pud_clear_bad(pud);
>  		}
>  		err = apply_to_pmd_range(mm, pud, addr, next,
> -					 fn, data, create, mask);
> +					 fn, data, create, mask, lazy_mmu);
>  		if (err)
>  			break;
>  	} while (pud++, addr = next, addr != end);
> @@ -3030,7 +3032,7 @@ static int apply_to_pud_range(struct mm_struct *mm, p4d_t *p4d,
>  static int apply_to_p4d_range(struct mm_struct *mm, pgd_t *pgd,
>  				     unsigned long addr, unsigned long end,
>  				     pte_fn_t fn, void *data, bool create,
> -				     pgtbl_mod_mask *mask)
> +				     pgtbl_mod_mask *mask, bool lazy_mmu)
>  {
>  	p4d_t *p4d;
>  	unsigned long next;
> @@ -3055,7 +3057,7 @@ static int apply_to_p4d_range(struct mm_struct *mm, pgd_t *pgd,
>  			p4d_clear_bad(p4d);
>  		}
>  		err = apply_to_pud_range(mm, p4d, addr, next,
> -					 fn, data, create, mask);
> +					 fn, data, create, mask, lazy_mmu);
>  		if (err)
>  			break;
>  	} while (p4d++, addr = next, addr != end);
> @@ -3065,7 +3067,7 @@ static int apply_to_p4d_range(struct mm_struct *mm, pgd_t *pgd,
>  
>  static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
>  				 unsigned long size, pte_fn_t fn,
> -				 void *data, bool create)
> +				 void *data, bool create, bool lazy_mmu)
>  {
>  	pgd_t *pgd;
>  	unsigned long start = addr, next;
> @@ -3091,7 +3093,7 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
>  			pgd_clear_bad(pgd);
>  		}
>  		err = apply_to_p4d_range(mm, pgd, addr, next,
> -					 fn, data, create, &mask);
> +					 fn, data, create, &mask, lazy_mmu);

This is annoying.  We now have a bool, bool passed through with mask
inserted in the middle.

>  		if (err)
>  			break;
>  	} while (pgd++, addr = next, addr != end);
> @@ -3105,11 +3107,14 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
>  /*
>   * Scan a region of virtual memory, filling in page tables as necessary
>   * and calling a provided function on each leaf page table.
> + *
> + * fn() is called in lazy mmu mode. As a result, the callback must be careful
> + * not to perform memory allocation.
>   */
>  int apply_to_page_range(struct mm_struct *mm, unsigned long addr,
>  			unsigned long size, pte_fn_t fn, void *data)
>  {
> -	return __apply_to_page_range(mm, addr, size, fn, data, true);
> +	return __apply_to_page_range(mm, addr, size, fn, data, true, true);

Please add something here to tell me what false, true is.

>  }
>  EXPORT_SYMBOL_GPL(apply_to_page_range);
>  
> @@ -3117,13 +3122,36 @@ EXPORT_SYMBOL_GPL(apply_to_page_range);
>   * Scan a region of virtual memory, calling a provided function on
>   * each leaf page table where it exists.
>   *
> + * fn() is called in lazy mmu mode. As a result, the callback must be careful
> + * not to perform memory allocation.
> + *
>   * Unlike apply_to_page_range, this does _not_ fill in page tables
>   * where they are absent.
>   */
>  int apply_to_existing_page_range(struct mm_struct *mm, unsigned long addr,
>  				 unsigned long size, pte_fn_t fn, void *data)
>  {
> -	return __apply_to_page_range(mm, addr, size, fn, data, false);
> +	return __apply_to_page_range(mm, addr, size, fn, data, false, true);

every..

> +}
> +
> +/*
> + * As per apply_to_page_range() but fn() is not called in lazy mmu mode.
> + */
> +int apply_to_page_range_nolazy(struct mm_struct *mm, unsigned long addr,
> +			       unsigned long size, pte_fn_t fn, void *data)
> +{
> +	return __apply_to_page_range(mm, addr, size, fn, data, true, false);

one...

> +}
> +
> +/*
> + * As per apply_to_existing_page_range() but fn() is not called in lazy mmu
> + * mode.
> + */
> +int apply_to_existing_page_range_nolazy(struct mm_struct *mm,
> +					unsigned long addr, unsigned long size,
> +					pte_fn_t fn, void *data)
> +{
> +	return __apply_to_page_range(mm, addr, size, fn, data, false, false);

adds confusion :)


These wrappers are terrible for readability and annoying for argument
lists too.

Could we do something like the pgtbl_mod_mask or zap_details and pass
through a struct or one unsigned int for create and lazy_mmu?

At least we'd have better self-documenting code in the wrappers.. and if
we ever need a third boolean, we could avoid multiplying the wrappers
again.

WDYT?

Cheers,
Liam

