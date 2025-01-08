Return-Path: <linuxppc-dev+bounces-4875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF00A06786
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 22:52:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YT1q71kBzz2yRM;
	Thu,  9 Jan 2025 08:52:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736373139;
	cv=fail; b=X/7tYM8YjmLrQYVPnLewpHhYlxZ11eLc2ofcmhLBpOxQJpeiFxMSqzbYQtQBbLGNZha7sKwoAcm1XZuOfe7vNsitTUhYw1wdAUtf8CLT5gfgSDZ5JFaDGxo7q1q1jcwo6MLScktSea48w3NaI9TzOvzeyrjS/R5AtPK9i2T4qCNFZU2/fV9Tw/vozVi5aSzo/W1YT1+7ms3d3U2r/qRQ0pJLyL3KMHC7WCHvRw/ER3/uSSm/mkbRVIyW/SnAZbeVGNZ2Q6ltJRByHx0c9caOhEZupTU4f/CdtcFtdzlFGu0HXBctVonc2Q7PB1pnMjG5GVY5AW46A4N3niP7QYG7+w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736373139; c=relaxed/relaxed;
	bh=4FMvKpwn06CwLDJ3y2HvrddZiSBH1RttXUEp8yc3GW0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MetLrxr7kffqXMGq6OJnUO9MtqaHR0rG8VbrjyrHDySbTLQj5cRg5eBEQMXmVd+CeuudqAdiMhMNXwGqI9ybzQX+PKEWqd1l69OMuzJjWTwX32HtW2ThUlOc49YbOCEO3Qphk8aHsjIj4a6cCrlRcZgJM0FimVFkkRhyXKcyoWFcJV4rpaZSTjTyml07W6wZTsEO6bccEdIG3OFUD35I0el+Vec3Vn4NpZ7h7JR3J6NrNHr0mZqYLpPeakw5x+l/j66pEQ4aU/8PSAN4Bh6sEOvUDuntoVtqyANYDqPMatdtU+xYO0rIXhlDwVABbsAusI1HIZjsuaa2pn6v/rOixQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g0SMW1UE; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g0SMW1UE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YT1q41Fc8z2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 08:52:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736373136; x=1767909136;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KiAmBIUuV+En4f0W1609LSCOyBlQmJhL4abuUH3TUtA=;
  b=g0SMW1UEmQjQzofL6tMMRt0zwG4F321ShxGoguxuh2IKJhJtt5cvpnSn
   SCZb3z9Tlcce0tqJiUVHpypSA7WEqXiN4lOIJtjdM7u0sl04NmiTpQfUp
   0yxHhlw7x3tVMuhxH+fSYLOX2F6heAwisp7mnDVN1IBKoqJ3EAqhzApFP
   +slHNDTV7sQmKNpUlPnL9pd+xvEDmgXejjlCXvhVWxovMI8mIoGHYKI4J
   IvhPf7pZMturnh+AMnttBpO9p4aAhosYMw4Ap2ijDIlTSyyAuWGJ8YowN
   h+R+gesA9yWYT9XbyG90nXvxHrh7YpKteDrQVbXjMHT5HDvTpWt8u6ypx
   g==;
X-CSE-ConnectionGUID: 4LJBldwXTDSQek6hD52UVA==
X-CSE-MsgGUID: t1yqe7teRXSbCUZCkhdQIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="54034470"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="54034470"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 13:52:07 -0800
X-CSE-ConnectionGUID: uYUh7DFcT9S5gmND+zQnzA==
X-CSE-MsgGUID: RZGrm8k6RXeRCbsyG2U7Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="108209888"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Jan 2025 13:52:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 13:52:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 13:52:06 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 13:52:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPog+HGfPxdnMfyBfrV79wW2y8v8glEEM+dx9/IhHRCmy5+gjoGBm9PUDCihxi9b9fZUQAFo+1BXoSG4oRGiQC6xq+e23np2t5GOuML54n6tIWCJE3yuPybEE9YMQANGRwHo1fzIpA9QMQHY23NEaqKcglt5YthCtBiqvBoqmsS3eGmYriiz/t2DceyGZKf9i5qCkV8e3Spnod/+08HYkQFnKaxtG7EvfJkOoro14+eZV0jEvLLjHBU0HRm/NPOqSOjW+m+AONWFWnKuc7JhkcapFxHxwKozTTMgmbdxkJxfgUO4H453yYqOTFqXpiQBdRGTc4x/V7wz7jcKrgUxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FMvKpwn06CwLDJ3y2HvrddZiSBH1RttXUEp8yc3GW0=;
 b=W3LVpjglL8h7wv1V2ZQl45ZnoTLCTKkohKbh+sezNvGzUHLvBC3axLhFSqpAPVHE0ac0rPB10ZxLw010kc3oI8sv3mbdy9xmDJIgiJq3USnzKN/zzNvufRGYoov74nybTeF+O/AH0LinaeDJud1P+h10QFFCbWVhkPeJAys8S1mznwfz1Pdl2NkWcmcAsyiFc0QSBRisJOQYn17i6W6RtArh6OpVTTD6yfsMQysQ9/NAabL5sClnJWN5LBRXAjdT2bTK6jktNgOjbRofCQKz7Fp/OzP4QXHnngoNPV3d47r7w5UeBG/RR/AnU7sIcSN4irKHHzZjsvPoS/WWcAsjAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 21:52:03 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 21:52:03 +0000
Date: Wed, 8 Jan 2025 13:51:58 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>, Alistair Popple
	<apopple@nvidia.com>
CC: <dan.j.williams@intel.com>, <linux-mm@kvack.org>, <lina@asahilina.net>,
	<zhang.lyra@gmail.com>, <gerald.schaefer@linux.ibm.com>,
	<vishal.l.verma@intel.com>, <dave.jiang@intel.com>, <logang@deltatee.com>,
	<bhelgaas@google.com>, <jack@suse.cz>, <jgg@ziepe.ca>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <dave.hansen@linux.intel.com>, <ira.weiny@intel.com>,
	<willy@infradead.org>, <djwong@kernel.org>, <tytso@mit.edu>,
	<linmiaohe@huawei.com>, <david@redhat.com>, <peterx@redhat.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<nvdimm@lists.linux.dev>, <linux-cxl@vger.kernel.org>,
	<linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
	<linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
	<david@fromorbit.com>
Subject: Re: [PATCH v5 00/25] fs/dax: Fix ZONE_DEVICE page reference counts
Message-ID: <677ef37ec8d26_2aff429467@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
 <20250107222643.80d5509219d6b66c15b1b8af@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250107222643.80d5509219d6b66c15b1b8af@linux-foundation.org>
X-ClientProxiedBy: MW4PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:303:8d::31) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MN2PR11MB4661:EE_
X-MS-Office365-Filtering-Correlation-Id: cddb1d73-2dbe-4588-a87e-08dd302eaf9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vd7RAj9aI7bUStBnKdTOY45MMAfSi7m8zchWPxWX+MsseXbWTi+HR8KOpfJD?=
 =?us-ascii?Q?LF0mEMKn3Gj0s03TibXYasjHAa9kd2hgcR7A4TgRANKwwas54HA2UseFKfx5?=
 =?us-ascii?Q?TkPYwMgL7QUCH9Zy9mwPDZWYApx3S3V3SfknpNLZDn1CZYDuOo2FYs4SdXzn?=
 =?us-ascii?Q?Lc+NL4eiMRNO7XmJfHMxoZVhU1zOUICKwyaPZq7DJdj/4uwrI7mnXz8f3fnn?=
 =?us-ascii?Q?g2clrKxMnXnmMLU+y/aI0SL/Rf7F13I1Bem9nPsvslqsqyz00XqktUddSITr?=
 =?us-ascii?Q?lUl8jEeqPE6mQ1u3S/d6yWbn+PYAEzcNBJQ3YTdTfWrYekdJdJ4uoKpoVreH?=
 =?us-ascii?Q?ZcEnCJBXuvWDH0WAVZUHn4gEFy6WM8VV/QyrMfby8eH36WRrg18KEG3u4WHc?=
 =?us-ascii?Q?cJioMxrKdwjdVhPemLccIl2DeiXtqXeoAn55bQMzcil56qOOqknHQEsLQVDI?=
 =?us-ascii?Q?Du75/VmTe7OygFwU3uzKlrrIiuHL5X5IjiuOqSlfYPHKz9kBcZJmK9MkedBt?=
 =?us-ascii?Q?Mv/zWuuD/MP14AbVsDA4El6usu6Krv0ZoQ2u6j/2H5if+Lt2latG2tj7lH2/?=
 =?us-ascii?Q?Si+cc7A29YbAMs/LPzTbDnii/+gYp/2aEa1fNneV78wn1V5T+F6DbD0szC9k?=
 =?us-ascii?Q?D+8K0NYn9itShHzKKcBAYRf0E22OPBL1Wa1QBoz6ujrWGwgwip3vNaNVbNkn?=
 =?us-ascii?Q?DGLT2poK5MGcaXG3y3ltmJdYtNgpSZhNJpLWgLCHg9Bw0T8sxJqRYUrcsJqz?=
 =?us-ascii?Q?HjtvyZ7tIOUKbYwRRBgC7pVdTok+DByAdqiHoaoxoVY8FfaOyc50Ws1YNfJ9?=
 =?us-ascii?Q?RliZLVoSvA1+l+JaC11lxHWC6ZG3JW+IzphRgdnY2Q1lzitnE72V0KIctBvH?=
 =?us-ascii?Q?zRhHEDJvyHgStH2maBUo+mCA0mUUXM4K5oSLvwc3zaQxy/gd0QpbkYo1LBSD?=
 =?us-ascii?Q?0GDVbKWWC22irjxLXTLOfKO1EhFYFlPGlrXdpj45jOSy5cg/36lGSzTSA9X7?=
 =?us-ascii?Q?i6DWH/bnX/kiHjcj9qqwxGwenaT5Aukd15ykJBqA5FJ3HbsZD4LYbl8j/x6p?=
 =?us-ascii?Q?6ptWw/Wyjq/99b6zhH+5FpxpvJeY9lqU6vl/diGG4EwaMF9PEnVL2a0MPS8a?=
 =?us-ascii?Q?U4NqrnCJRXK/hGLlArEm55fOJaPqs6W5gIK10sTjU0pznowuWqwhHnOKtdyU?=
 =?us-ascii?Q?FHlGqrQXXg888S9EoZ976wag2hnn1Op8juAb8gkZce3jQciBb/G7bPolLIiU?=
 =?us-ascii?Q?W7lzsNeFFzjqi4SG6/bD9VG4kn4QJqZQfPwCIO2iZfc99uhWHJ4TYAxIoyH6?=
 =?us-ascii?Q?1uYtbxNflOyj4N5/RtMXuz4U32jTWg0Ue8YyFlIM17n0qg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PEGM1CDchaVi3bAjBL1qzjKYARNCpEwTiubzmjfIBClDz1Qh49sdnm7kSfvx?=
 =?us-ascii?Q?J7Y9gH8E2QlaTBRrR078LcRXAZVdDki0Qwtrb6BC9gqeZ2sRddFM++XH8H/D?=
 =?us-ascii?Q?fFrvW/HlIjum5if9uNLURSKBEWsCU7yEMusb3HJx/gwYiPrXzRIYDxiwQmZY?=
 =?us-ascii?Q?5vVawqhL0ljFqOTkTroy0fkbxiWyIHKG1aGehQe8k9RAUmlYPh6nrJgXs6mV?=
 =?us-ascii?Q?5S2F4stO5hHhvg1eOKiledstnzJLjoSesgvcxe+jyu73D4UHLPUl1AthgC/C?=
 =?us-ascii?Q?/obF0goXfM9PRTnD1op6byTxvVZveBsJ+NF18wf8CPdCHFVry4L90XOnWPC3?=
 =?us-ascii?Q?OAhMHZeLceI7nOgHNBM8s0ovV0avL4Tf8kRP56S7osqytVrVyh0u4QBgQ+29?=
 =?us-ascii?Q?Ee9xTFSQFYu4edzGzzo8T9NK3VpCzal9Y6BJmjtCKnnW7uY5sWTwNuUZ1RrG?=
 =?us-ascii?Q?ifWm7wjM2Spl53lwdztxcwKFYcPztCagwEwbfmKmh8BKKftr5uA6BYj3bxuA?=
 =?us-ascii?Q?7jdopOMhIDSE3Qol7O1Fcu4km1Zg/O4+qTYl4KJKwAkj13WSEMLSLDxeBNlD?=
 =?us-ascii?Q?w2WCbLGVfL7IIhxaQB91zPv0aS7gm/1/nruB4Z/Pmdl8hDRuJyliS7zNX73g?=
 =?us-ascii?Q?NYMc0HgVbTLtRl83TaBfvxD+0kyqzZckcuT9DXDp0Tm0yxePL105v+bA9htn?=
 =?us-ascii?Q?z2fIEiF6fJzL1FuPEu7ST3q3Cwh1v1LM6ySkPFHI+7gJuUovzqbyWDsXr2wz?=
 =?us-ascii?Q?jpKKAWQWUpt8Wh5L5arl3EX00CrF6ClIzCf63N1aIIpTuEgeEufdmpfOvCKk?=
 =?us-ascii?Q?29G4ZIxbfJNcFrq7sZgbgYXfYfMDs8swlL8vpPMCZesgCRdDerQKyWnRVW1R?=
 =?us-ascii?Q?9fsvlrI2/2ps7z5NPWN5BIl3G7B5WgO4475ggETWzH+NIZbh7zCy+dByCkUe?=
 =?us-ascii?Q?/mASKehpjBVfi9nZc1eer1zblAfq9YA7S/l5oc12R05ruS5gs/DMnQQOXwYN?=
 =?us-ascii?Q?iygXMcvZOAHvO95FH9m3kai0w6fw9kcl05ZSgIfVVk1RrqpxHTM87mVhCuRq?=
 =?us-ascii?Q?6QruB+yTAzw8ZA44U9wY2cN/x0VPQnqN1n4NUPXJdArPdtxKagZQYAg5nygf?=
 =?us-ascii?Q?nnPB6QhIb+Np8A1UOctatcUfqQWfyRYIbMCClXKtz5q6+PvF+woMT56lvSjR?=
 =?us-ascii?Q?DgkyaMS6JKGVO8BtwtEboCeLBst/JUNqYZjNhXUNJxbtmSNOjhJca4RmQhBP?=
 =?us-ascii?Q?xAAxM0qMC7GDFGSjrEtcl4uovWNFlT8MhDsKnlAnafHashYqaU9nFvb9y2Ok?=
 =?us-ascii?Q?xgmf375hdoAxqQ1T5iySgtguAl9xWlEVVaLym2faNAiUwramtn0gk1uvVB35?=
 =?us-ascii?Q?S5RhhDFRLqNq3J9RoxsqUVPFqNVoK/qLjFaf18uQc5Lq4e+3NcWt5gZeNNNI?=
 =?us-ascii?Q?hxVhrf4eyNx82AxWjUlxHZMv6KwMXsyqqnADq5QXHocXTlDOttLydNf51dz/?=
 =?us-ascii?Q?fsREaiOUtNbRGFB8/8ej+fO9eI+VZtAlDaOWcE203aKMMNUks+KWz5xI5oSc?=
 =?us-ascii?Q?VJWp21rLudNPUhlqMWnFvAVKoshuY1KDy4xAa1y100OW6KffuuH1N05ZXz1D?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cddb1d73-2dbe-4588-a87e-08dd302eaf9e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 21:52:03.1084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+DmFBUQ3ByAU2CLU7SdMwXBjRKzTI5QFcDSRbLfXEJ6L4UswmwD0bQ+VZI0p4x6wSO4ph6Rt1Sg15kdHtMd7H7YXDcvBl3P+xuqqVwflTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Andrew Morton wrote:
> On Tue,  7 Jan 2025 14:42:16 +1100 Alistair Popple <apopple@nvidia.com> wrote:
> 
> > Device and FS DAX pages have always maintained their own page
> > reference counts without following the normal rules for page reference
> > counting. In particular pages are considered free when the refcount
> > hits one rather than zero and refcounts are not added when mapping the
> > page.
> > 
> > Tracking this requires special PTE bits (PTE_DEVMAP) and a secondary
> > mechanism for allowing GUP to hold references on the page (see
> > get_dev_pagemap). However there doesn't seem to be any reason why FS
> > DAX pages need their own reference counting scheme.
> > 
> > By treating the refcounts on these pages the same way as normal pages
> > we can remove a lot of special checks. In particular pXd_trans_huge()
> > becomes the same as pXd_leaf(), although I haven't made that change
> > here. It also frees up a valuable SW define PTE bit on architectures
> > that have devmap PTE bits defined.
> > 
> > It also almost certainly allows further clean-up of the devmap managed
> > functions, but I have left that as a future improvment. It also
> > enables support for compound ZONE_DEVICE pages which is one of my
> > primary motivators for doing this work.
> > 
> 
> https://lkml.kernel.org/r/wysuus23bqmjtwkfu3zutqtmkse3ki3erf45x32yezlrl24qto@xlqt7qducyld
> made me expect merge/build/runtime issues, however this series merges
> and builds OK on mm-unstable.  Did something change?  What's the story
> here?
> 
> Oh well, it built so I'll ship it!

So my plan is to review this latest set on top of -next as is and then
rebase (or ask Alistair to rebase) on a mainline tag so I can identify
the merge conflicts with -mm and communicate those to Linus.

I will double check that you have pulled these back out of mm-unstable
before doing that to avoid a double-commit conflicts in -next, but for
now exposure in mm-unstable is good to flush out issues.

