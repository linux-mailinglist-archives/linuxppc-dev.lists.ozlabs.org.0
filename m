Return-Path: <linuxppc-dev+bounces-10426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD21B14542
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jul 2025 02:18:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4brbXS6kGyz306d;
	Tue, 29 Jul 2025 10:18:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753748280;
	cv=pass; b=ACW7pF8uTWoqSJkkxzO4U4z9JIgLvDoxBIyfdiSQs9/lq64ItOJqx1oaKBfzvWD/zOM7W7rDAsN1ZxNSZtxc+rb7ZfTiA3NaFOgq3lyVJ0qJdr83oSiyxG6jxk4qNWzg7kYYg4MZQQaSJOXtI/BMWlzKPyTF8fVdIofog6VvbbGOQfWIfCXgJ87ExVV7yVI65wG9WRv6XM0AurEDI/huR0SQPUnfObNNTIUE6C0uSd66cyKdYqpbgsVuUCpR77tnps3KrFS9Mo7hSN81oYFfJvUIlQXIIKCEfr8rotKYb6KpSbB/H9fF0ZZj2QQaJqDHBNZAJPDcQifoOfZ1RDriqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753748280; c=relaxed/relaxed;
	bh=EFUHkSlvXsrYzXvNSjoGBk3BVmiDQU6GxvyNjvpsbk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=doMr2meq4IrL+47WFMbc4nGroobgE6qOxnOsfkq4kVJvh7IrZghXlsxA/7pGQIw2jg+6hJpSScudNRwKA+eNjJjlA0zagwceCvb0jQEO7TmqTSC4eBGVp+E9S3B5K5v9lNCE6kxu2fQILAX5LXrg9MdQtvVglo6JQdVepQqjiH6NoVFdUzS0xdt2ZYKpMHm0gy01F2HjlwuvXqgTU+SMjLNn/7CVOu6HL2E3YqYg2uwaBJKbfwigYe7doCIOjgJuolag55zinh+aZ7MTCvAW/gAcFQY4p10VX9W8IXtY4cHZLhguwNW37+hPmZ/H5hQQWTQK8TJj8vFFMLB2HgWHHg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=lQYPTufT; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=GpqPgI6F; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=harry.yoo@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=lQYPTufT;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=GpqPgI6F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=harry.yoo@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brbXR1M2bz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jul 2025 10:17:56 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SLfr9K012587;
	Tue, 29 Jul 2025 00:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=EFUHkSlvXsrYzXvNSj
	oGBk3BVmiDQU6GxvyNjvpsbk4=; b=lQYPTufTO6EElRnXlFdLJFYc1UUfDC7GLs
	AKjgFGPpHepTgTEBdOzlaABhQ3BJbPfL9ii+R2t+cXgq2gb4sjrMhlrmiGzSt5Aj
	dPplXEvzR7AAvReAJEXiZvBKSoU9LIRg0PB09vggwaELaMTh7eA13UvCwsTb8N5p
	thGKfzc4OrmUBsWwZ+y9XHxF5o/C8/GICLQMnMQ0xQlEU6XhJ7C154EuOANwBQyM
	YWiUv7sveWwvD5JJTIiPEVfxoLZnPjrjUPXBS6mY/u9ID/KbeJgHrXRn9fZfynVC
	2LPAo61A8NYzjOUl1MBGFD7/dqbagIspibnXJpHcLkl5KkLO8YJQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q2dxqab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Jul 2025 00:16:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56SNdRLr010485;
	Tue, 29 Jul 2025 00:16:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nf92fgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Jul 2025 00:16:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agtaWpUHhIrTA+2GY/DOuQn8gCvXDkZLckKl8huv/xVcu7Y9WENXcyoewANomRlNugAkOgr4wzpYErFGO2WQZaP7C2DHh6Qx4WzoYwblFYpcxaKjy25elr0ZtTzQ0x6L3me9e3Z6Dt5Rpz1o41Ek76o02ML27Gx9O9JZNNPSrXsRjTq3fTfB55oeJUf4aINgtRBB2HdOM0AM8jalIHc6CMr9PkkZMCXczqBYjuYLEHod9HU2D/CAw854t29GK8fjIfkzarmvTDooGRob1rmlAlQBo3CQuJOLfPzZOpJMuzh6kP6ucpMscPmm23Trr9agTwLSghGOGx0k+1U5hVZUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFUHkSlvXsrYzXvNSjoGBk3BVmiDQU6GxvyNjvpsbk4=;
 b=UXGt1GJh2huvWAAEOA3w6ni3fqlFRpOz9kMC57cRVCzlFeo5VYcwy4gJH8slhEKexhvAmvnInNryuAliWQsiHQ5Fvm9wheljEyOQD0553VZ7YHBiLUNowZeOh2R+aewtgTB4UwoKJo0jgQxlc25M7+4qcgOIpocKgI1ayo3A7GKmBdXmUp0NKcRIinfEI8xYhGV0N7Kjpxk7u+Ta41zHX7rjt5x94GF+/6QcIZmZqGC25niJPuU5mR2Ddyv6HX4QThTXcaSW7uNGyluZAqDMAxxISYhx/AYVQCUCHVPwd323LxtxseOedaF/nyW8WJfI/SDJsf6euacLBygBqCHbOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFUHkSlvXsrYzXvNSjoGBk3BVmiDQU6GxvyNjvpsbk4=;
 b=GpqPgI6Fw/U49WzUyboy7nRywIWiFbtCkQU2UpOQc5CVYaRVvWGDoj7srFrhdAkAXsix49rnZEtgrnxkzKDkFb1z5QIRTMvmkP7DpYoz6vkch8iJbzRCm2ufo/lVqfqQ+GvzYlGqhNPc5kVzFOmXUzeF3wc44FW1uV9PCfCuUN8=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by BLAPR10MB4947.namprd10.prod.outlook.com (2603:10b6:208:326::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 00:16:17 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 00:16:16 +0000
Date: Tue, 29 Jul 2025 09:15:51 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "David S . Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Kees Cook <kees@kernel.org>, Peter Xu <peterx@redhat.com>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Xu Xin <xu.xin16@zte.com.cn>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@suse.cz>,
        Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Rik van Riel <riel@surriel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Uladzislau Rezki <urezki@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-sgx@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        nvdimm@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mm: update core kernel code to use vm_flags_t
 consistently
Message-ID: <aIgSpAnU8EaIcqd9@hyeyoo>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
 <d1588e7bb96d1ea3fe7b9df2c699d5b4592d901d.1750274467.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1588e7bb96d1ea3fe7b9df2c699d5b4592d901d.1750274467.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: SL2P216CA0125.KORP216.PROD.OUTLOOK.COM (2603:1096:101::22)
 To CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
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
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|BLAPR10MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: e142fa97-0acb-4184-459f-08ddce35226b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Du7MGzMVwnIGpOA53teIT/Gehrmpj8NxLnAwptECrI7gE76mqeGOlmjoxsJ6?=
 =?us-ascii?Q?JWu/d6eF++8toBekKrkihX+LB5uEexUsDroGe0kysavKmxNqWNH87Oh72d9V?=
 =?us-ascii?Q?kqOl2QP99lUFNHa35550Z74ZHmkNLnQ9/jJPC002ZZOU2sAjeIoLXhA/l3KQ?=
 =?us-ascii?Q?qeH55x1DlkfolT6zbFbPkmfT5L52h+qMhhi8s890FQ0P+/Rr6Ww9Ro+DG9LB?=
 =?us-ascii?Q?gS2+7OVHAc0pBPL8shPaaE2IzMjU2PkkhoumwgjmWjmY3daQQ4mwq19ornG4?=
 =?us-ascii?Q?9Ktm9F7YvUfAzcijciq4dnSAvBYTKq55BT15u3xW5PYDDyylLZ30ZLq4H2IU?=
 =?us-ascii?Q?ZhjDMokLnPTNpcnkLihi4q0Rk/kgIi6JOLOD//ritJK4xs7uFGfm08MHURGq?=
 =?us-ascii?Q?GPnTXIS8n2mToBfq159uWXCHT7IXF9jz+fzmTST7JngInCoiJUUqM5Dcf/Gd?=
 =?us-ascii?Q?ZQgx5fWqavKRm6YvL2F994S9wkBBb8WzOF3ZuM1RTNpMBXpNtxokHR4whJJf?=
 =?us-ascii?Q?Gps8vuh5GYxrMKRD7eH94MEa0nkXR2YTCtg0bJ+tjFEnURtTa9yUWzplUKTw?=
 =?us-ascii?Q?QEJfo8fOI2LV1K9w5ytjVuy2AoVLgdugoU41nUx5zU9Q8JeOsUD+kQvnbeXi?=
 =?us-ascii?Q?HbB509YeVvIkFbDo6dIhPyypcBN1j9486FcDlMIT6nPZ2l9yfZ/UwwZfFJtb?=
 =?us-ascii?Q?UkND/n+4L6kWhqtLS8kVSbY84Si5svc6stBkqHJGicdwN/1jDexgupY3bSB0?=
 =?us-ascii?Q?bPi4c+2ItYQNHRsa5cWRXdwRC46R3ah53Sp4JU78IGra1eVlIdWmRMU3jgRv?=
 =?us-ascii?Q?PiGQMQAKqxPE8vX0UDtStXUrszYM9q/sGdOZMaE0shxsKMhTlBYvibRg9tKw?=
 =?us-ascii?Q?DgLxmbznSSTho49+tklw6bylx1Bp4YQqlAwdlUoFfTZLUYWBXtgebSurlPZ8?=
 =?us-ascii?Q?3fzeZpfsHhchGs8t68YSCHftwib3cDpXfdOkFi4W+wcPAXXs85i5RbshEXnv?=
 =?us-ascii?Q?mvB/N5GONyHIjQdfBK+HnZv9ifYeqAYsr/h4MlO7L9Hvdij+pT0tVwrDiqi4?=
 =?us-ascii?Q?pcitFIpvz30oQtPqzd80cZf9wxCvePSU0z9oXy09fINMKvdEusJtWddc0ejC?=
 =?us-ascii?Q?KFVd8sZdRYNvkH/sunxDCaB6UAmdHEJgq63CMlo2BPrOisksxnlOdHLWnAem?=
 =?us-ascii?Q?MMbz9tWZEr5rocOAVFuYugTEkH52qXq8W4CL2kMduzFg1Y29HlHsdBqli9kv?=
 =?us-ascii?Q?AosJjFAtzqa1jSs4Q4UmlFhvQs7Re/cst3ERfe0AbnonvcAljUCEZud7MPwS?=
 =?us-ascii?Q?j/BLPz8xPk9SMFjy+j58Q+OxOoB2gABMnuTsnOPGiGdC9IZX4+1EtnZo2tRb?=
 =?us-ascii?Q?vTynjUc61S5rGxNVb5HqH7tPSXZhp5fxzkTcXpHi1mblwcPy31AIiwdKoOmu?=
 =?us-ascii?Q?0j8PMXeB5n0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DedAmEmI8GnLrNgIu0+Qwtyd0EIQSrtvqw5/Ug9xYH89ncrTt1Vg5scMzIqy?=
 =?us-ascii?Q?EfBfDRhyBMkDRoyljLVXYIVuYUUSVRNp8Z+99/dzXW7/Jla+HgkGf0yUb8Ni?=
 =?us-ascii?Q?AtUIaTkTZFt0lLSQ9SnRhIl9In0KGZ4/vSfmRcYVNdbGUk4haODGhoUO1Hka?=
 =?us-ascii?Q?bSYNF8Tg/oKfIQkIwPysFw/AJmfflt0f6Z5PoMdv9Ln4vmlXPX5bWi1Midj/?=
 =?us-ascii?Q?gUpBbjpu26daycK3zZjBgaVnn9t8WXu0u++YcNCUsNFSkulNiiqJF3RNctaz?=
 =?us-ascii?Q?FU4Zf5Er0C8l8Sh7/ZlzeMcaZyV2kT1nu2eH7F3OOtHZgst54D03TVbh3EH8?=
 =?us-ascii?Q?/Mbj3mn9XaqizARY1OKBfLI4rh1PPQtQK+rYxYUI/CXokzDPEe6cF70BqBiw?=
 =?us-ascii?Q?hJmaGw4guTjUC9GgDypNCzQR3IVclQZ67TxQNxBougD7zNgxbQnWzR5chhZO?=
 =?us-ascii?Q?sWL30QZ7g90bwQoTG2GQvbJ1G2GuUzWsBoptyXEaDWOihKahSJuLgtEDL+6Y?=
 =?us-ascii?Q?9Q3xo6WeDRhqNAdYty37hSypiwjlTbxny7x3aF6fp/pAVr+e+YdmgOMRMfwz?=
 =?us-ascii?Q?PrTmpovmcXHnyXkaURQvzJj1fUBavp6GPOq0s581VoKJC2Vl5i2naQ3YCTMI?=
 =?us-ascii?Q?DVOSjhA9MSOtMKjdjmBQifwskxecTUgCjtwall9RUHLnOWC1zWdzdf1gjkWn?=
 =?us-ascii?Q?+vd8Xmryv3CxlRKQvoSbSW3iiYR2sEUPL87azFVoVBIB0TXKAdUZzv7AKPv+?=
 =?us-ascii?Q?fJEoNM1/eTEhnmG5KZdByZIMTX/ZaPKhUzBRZs5Tz2tykPLR0L1g1HYajyDD?=
 =?us-ascii?Q?8SzsT0o+f7AKvcKFAq/PUSlPQdp5CFDqdCUn/C6SZwD5rq2LqafU2tW0XXce?=
 =?us-ascii?Q?dBHQejYUuKh5jjfxrPv1lm8oxGq5a1DAHY+W1JjsqL4oU+fUL1jBbctrAJIn?=
 =?us-ascii?Q?SE8oaWXYxOoV5sZaukGTPVOAels4CUarzJED8LtWCwR2qkqLgyNwBj4wfuM9?=
 =?us-ascii?Q?qeANCy0LQ5I/K7GBJmZ3vDmWlD7jTSaZiaYEE0o5dNKtp2aFoVMk2YHFCLbq?=
 =?us-ascii?Q?+8MOZsUNlta49Xu5kRDL1cBPCq5+AnUcrVMlV56qxUGT7i33IwA/683OsT7A?=
 =?us-ascii?Q?ElEccjCQqBd3FcrY4eKnx1U3saVFLBx240eDtNHXU374Ax49hQJrvpRsOSS3?=
 =?us-ascii?Q?xRTxejKGZD6ZiCGc69JtlRw7YJSFAx6gIRAgdoGcqXqFlGRZwkKbwYNLP7af?=
 =?us-ascii?Q?9z4qghNpaPuwpZSjgnrWSpmyTd07cbNc0QUH9diNVcngInOLUbkwRk7UAxG4?=
 =?us-ascii?Q?gZ0sMkLXxGkG2/WRuBQ5o0FIqcgU792rrNaUxiheoaNUorW0DXjaWVSnQGgS?=
 =?us-ascii?Q?2NHkbUWVeds0dGVrYA9dxNKPs+Kw0ADJ+U4xW/hfOp8khbfLjDqoUBsmGMT6?=
 =?us-ascii?Q?9YIMSzY5jOLizlIIxfh2je5XkTi/RGK3VdJTG+lpg6m3midfo+NBMapx0OjP?=
 =?us-ascii?Q?t9/16rwprQ6/+2LWj/feSZkKXfC0ZjAknpU40hHYQAQoGwKLC8SDp5dfkg0S?=
 =?us-ascii?Q?vK0fN3go6/QD0xq8IXmM+IssJRBhNJk4fQC893t/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YQe21n/j+QHFOm9BrdLUZ2u/2pCaZxPEzH58gO4fNs9A5pcbV1GrpTHDnD27/GODRvLmKiCM5MMNSko6h7Dyxo7f2+w5HW8MLUGvsjV/EB4haxnqo0mm/scFp3i2agxQGXo7UwNhLMMoyrvFeFrNFuRyPhUpdd/J97GcI/zzyT7pFBwGZ6sH6AmnjAxr2yisnZXmkKyxzdAo4urGuwBQyt2cxh1zJNH8bkm7JsvAOQMVGaFYsB50HD8vu1XJ6bAlyB2FkZHXiLITtAGM9II2NuxDmKb1XEQYYH+zdyxohggt00XLy47M63u0EmXOe6l8TLYogFAl5HJrTMisymetHlda8CWcW7FGYBbiBkDfM3HIj62WpaSu6xYS55JtB5SuwZC8Bnq6wM45DYzPCWMGXQxFUT0DMkUuV5Gv6MrXYOcb8iRIIkqhkY/VshPrcU0Te9MjW6dJVgLN6HzQPlDuzv2xIXvz4XRDwpHJGFwopU2aJyuIL8HQxmV9FTC4Njm3z+zEm1/I5i97mg4FN6jbUMWIMmi5z0e9e/yZk2TuRHH41W6it3Hdy+yU0rrOCaiMOewF54mWk8c+0Io9Rzb1pFK9gfa0UEiE8gRXkqLVc2w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e142fa97-0acb-4184-459f-08ddce35226b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 00:16:16.6079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTJj1zA9f2rMCSbATjABS8wuYnpGHx/KJQsDWurxhE7FFLxfIDlQGYFm120gIZQDaUs4TBVVDOdNyAvJV6NC3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4947
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_05,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507290000
X-Proofpoint-GUID: PgLOk4fe-_LqdX85LMwOi0icI3PE6zbc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAwMCBTYWx0ZWRfX+1SPyFt17wG/
 deX88fFp+HTqk1jLv1dOBPFj4it4iISM4B4vX9Y1VjNUMXkDDoPGfZv8EI1Cmr788dOTZ9zWU5O
 ZrXdeRG17Q8G5jWDEvTcVHVjl36vtSPxEr/DIwaUjBpEilDoOVANQCqIKYy+GK8vAw3Kemads96
 e1dB/k/Y/KDP0wkDD/ajILnWgUi2IsZ+pdt5Xhz/1Zk8TqrircCKGvLM95SQ8knxh2CEVDuiJqg
 zuXZnP+rXPWh0hcGAafTjPz+EWCcEwnAm+wJRDkhx6KdDaLHfc14SucAe8aaVrwjmAzbr/b5fRz
 EfMZANs4yhzpVdcwSw3H04GRitULDu8xLSybeMrYNljhLNWrGWhtBKceB4Ckzzz8UDzRNEFr0TK
 nxPNV44u/yyXnQS7j8LLUp0fUPnmiSwJEOdpCSq6RCNAGE9B7zh1m7Gh45YhvKRaIYOD79kN
X-Proofpoint-ORIG-GUID: PgLOk4fe-_LqdX85LMwOi0icI3PE6zbc
X-Authority-Analysis: v=2.4 cv=A+5sP7WG c=1 sm=1 tr=0 ts=688812d6 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Bd0Lw-J_z1rzUkiQq3QA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13604
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 08:42:53PM +0100, Lorenzo Stoakes wrote:
> The core kernel code is currently very inconsistent in its use of
> vm_flags_t vs. unsigned long. This prevents us from changing the type of
> vm_flags_t in the future and is simply not correct, so correct this.
> 
> While this results in rather a lot of churn, it is a critical pre-requisite
> for a future planned change to VMA flag type.
> 
> Additionally, update VMA userland tests to account for the changes.
> 
> To make review easier and to break things into smaller parts, driver and
> architecture-specific changes is left for a subsequent commit.
> 
> The code has been adjusted to cascade the changes across all calling code
> as far as is needed.
> 
> We will adjust architecture-specific and driver code in a subsequent patch.
> 
> Overall, this patch does not introduce any functional change.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---

[Adding Uladzislau to Cc]

Hi Lorenzo, just wanted to clarify one thing.

You know, many people acked and reviewed it, which makes me wonder if
I'm misunderstanding something... but it wouldn't hurt to check, right? 

> diff --git a/mm/execmem.c b/mm/execmem.c
> index 9720ac2dfa41..bd95ff6a1d03 100644
> --- a/mm/execmem.c
> +++ b/mm/execmem.c
> @@ -26,7 +26,7 @@ static struct execmem_info default_execmem_info __ro_after_init;
>  
>  #ifdef CONFIG_MMU
>  static void *execmem_vmalloc(struct execmem_range *range, size_t size,
> -			     pgprot_t pgprot, unsigned long vm_flags)
> +			     pgprot_t pgprot, vm_flags_t vm_flags)
>  {
>  	bool kasan = range->flags & EXECMEM_KASAN_SHADOW;
>  	gfp_t gfp_flags = GFP_KERNEL | __GFP_NOWARN;

Is it intentional to use vm_flags_t for vm_struct flags, not vma flags?

You didn't update the type of struct vm_struct.flags field and vm_flags
parameter in __vmalloc_node_range_noprof() (of MMU version in mm/vmalloc.c)
...which makes me suspect it's not intentional?

> @@ -82,7 +82,7 @@ struct vm_struct *execmem_vmap(size_t size)
>  }
>  #else
>  static void *execmem_vmalloc(struct execmem_range *range, size_t size,
> -			     pgprot_t pgprot, unsigned long vm_flags)
> +			     pgprot_t pgprot, vm_flags_t vm_flags)
>  {
>  	return vmalloc(size);
>  }

ditto.

> @@ -284,7 +284,7 @@ void execmem_cache_make_ro(void)
>  
>  static int execmem_cache_populate(struct execmem_range *range, size_t size)
>  {
> -	unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
> +	vm_flags_t vm_flags = VM_ALLOW_HUGE_VMAP;
>  	struct vm_struct *vm;
>  	size_t alloc_size;
>  	int err = -ENOMEM;

ditto.

> @@ -407,7 +407,7 @@ void *execmem_alloc(enum execmem_type type, size_t size)
>  {
>  	struct execmem_range *range = &execmem_info->ranges[type];
>  	bool use_cache = range->flags & EXECMEM_ROX_CACHE;
> -	unsigned long vm_flags = VM_FLUSH_RESET_PERMS;
> +	vm_flags_t vm_flags = VM_FLUSH_RESET_PERMS;
>  	pgprot_t pgprot = range->pgprot;
>  	void *p;

ditto.
  
> diff --git a/mm/internal.h b/mm/internal.h
> index feda91c9b3f4..506c6fc8b6dc 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1360,7 +1360,7 @@ int migrate_device_coherent_folio(struct folio *folio);
>  
>  struct vm_struct *__get_vm_area_node(unsigned long size,
>  				     unsigned long align, unsigned long shift,
> -				     unsigned long flags, unsigned long start,
> +				     vm_flags_t vm_flags, unsigned long start,
>  				     unsigned long end, int node, gfp_t gfp_mask,
>  				     const void *caller);

ditto.

> diff --git a/mm/nommu.c b/mm/nommu.c
> index b624acec6d2e..87e1acab0d64 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -126,7 +126,7 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
>  
>  void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>  		unsigned long start, unsigned long end, gfp_t gfp_mask,
> -		pgprot_t prot, unsigned long vm_flags, int node,
> +		pgprot_t prot, vm_flags_t vm_flags, int node,
>  		const void *caller)
>  {

ditto.

>  	return __vmalloc_noprof(size, gfp_mask);

-- 
Cheers,
Harry / Hyeonggon

