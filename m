Return-Path: <linuxppc-dev+bounces-15769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02539D22E79
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 08:43:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsFNF5dqqz2yFm;
	Thu, 15 Jan 2026 18:43:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768463021;
	cv=fail; b=GUNzR9p57ZHrrJ/EmI4qpaKOHW34ovwKyEcwBjp6iN/jXIYPOV+pehwiwQ2buirJGwqQdkyOtAY2V8lS1kYhKRvjTbnCEvokhUaGhBqtVARkNf2sMLDdBCM7R3HAJdnf9bIQsjblZSYCEukOsehP7jWIalxwFxAvvW5VNEdznF8I8KaxMqOjAxn7QIF+b84thtzCIYDvn0JLglYvTllsPZW31oqppMFLHNQ4aOUykoMt6WksgfC4vMRV4aUemlsOZ2XhWFb5yMiJKGuO4hcmbrJsQedIsC0yVQKhsb+OqLh9WWeMMkfsQXYsrmnWNpkPDk1a38JTEHYDbRkjTEJoJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768463021; c=relaxed/relaxed;
	bh=v+OFQgNrqDCI4noKRxOauwk0weXLhSep0zw3Dev13DI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iuMe5JOTAqxc2EOlS7EHQc2CDzSrZWWY0FfetmSWgzCU29kMi2BdK+ZtQCrddFOh/La5LeSfCVVLkTTYabAw72n5ysUUhqyX8pIbykQUKsIu5roju9q/uTFBjfLeOY5tbqVqUpVY2r7FN7JAvCsxsj8CKBBbgb/cKEzBt5ihqCMwa+2Qi9PHvC6lyUIBdQMBRFn/GpEDdJ//IxJ9qaK/+PtZMOtp7xRTK3wiHI/wuRdjlr3FkvBviLMxw6EwLJpaUz5s942R4oJ7D55JGEGUi0ZvtbOnTQSwqNEe36bLxnzWcMpn/jyuLXHLx+jsL96Ygj6gW8z/flccZPeMdUkcDw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BRxnwdvz; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BRxnwdvz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsFNB0kGhz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 18:43:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768463019; x=1799999019;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dabcjbrpJEaxdBBLzSHK0Hbk70BNMmWEIJBTE25kgBg=;
  b=BRxnwdvzvnQJO+PJom6XiS1mw9WvEWE64EZsa3MFosrKv/k09ct/ixvp
   r0h+bbQqVcSBSLHsKQz7Lj3F07vsdHmTYVvO4siDJiRfKM7VH9n3qXp8q
   V3bjG6nMxWLDVkDJ9nfZP7kZwhNBOz0BtAja5vadqIfZS4xksq2ctgl9L
   wWDbNUSYcCc6JCPHee5B4xggOLLJ0GCR5Qe8SJCEGxbApim6ZGy4Bomsa
   6TBD/j9nYf5R4K2ipLQTzmKafeS6SCqKrNynxmQpXBsUsuViDBgGyZpDK
   9y0hL5wCLhZJOzP2hhm9nt825LzdYZ6SwIi7///afBWgfevgvyOoVPP10
   Q==;
X-CSE-ConnectionGUID: RKVvDWzNSt2rud6a3Ko9og==
X-CSE-MsgGUID: KEayPZmESXKnJNgUHATPVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73398190"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73398190"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 23:43:33 -0800
X-CSE-ConnectionGUID: CgWvbbnZTBCmAYFH3ctXtw==
X-CSE-MsgGUID: xEZe4xHZTmGVocW49TpMqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="236143592"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 23:43:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 23:43:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 23:43:31 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 23:43:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEL7j6C6LEbDUfZkgYsPlPJh/2mphvjALNti6q/C5pB+yNQZlKzqbjk5d8oXhCjavoAzGY8WYkPpiHtkSkks3gYJzc2Sw0cizD/3HmQXfx1LGSk0tgaKxZ2ZmuyS1Tp2b/uNRx/8jrgWHCrMkRcBd6GOaqrzx6+t0qHGu2PtdQ5MqqNNSxtoQr3ATRENYVMq7sS7KqFJ4l/T3JFmudNoInz+XS926tFm8Cpng3sbXyAlsIF0HTKkOPGZeEy4OWLJGNjcfEtmDwYGH07Pzrz1yhSeY7yR7JAvYHRqo86M5nPwBEAmg3+GLQIPykE1ot58PTE/OssjwGVRjDyoD+t1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+OFQgNrqDCI4noKRxOauwk0weXLhSep0zw3Dev13DI=;
 b=qsYM0rWcSN7qbbLv++UlQ0mDmSvDgyTb2UQ3YkcblUaFBsQXaiPpXK3221mWOjfUYjKJVuqbIxskl7L9Vc30SkGzeaw7Y2FGmSq9cmRtTupey8MUylqOqz6nlNd85cpPGZg6bPgNSuFArHCdjYtylgu2NKmEFtw7kD9CBLHxWs1b2S2Jpiw9I9ceUFy99bln4op+MV7Z8ESdaSTp+KH+eDsDWJRbTlGVZHjqbNve5SHmRuVowHt0q6wVohPaEyWEXt6DLgm+lYIukepxuVASIJaVAOU09OpCSfzNvSlSoWlSrYBqqmxJxouMlC5TBZ/4uNV+EVUwovdc/5RZwenpJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6715.namprd11.prod.outlook.com (2603:10b6:303:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 07:43:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 15 Jan 2026
 07:43:21 +0000
Date: Wed, 14 Jan 2026 23:43:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: Francois Dugast <francois.dugast@intel.com>,
	<intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Zi Yan
	<ziy@nvidia.com>, adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin
	<npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy
 (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Hildenbrand" <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, "Andrew
 Morton" <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Leon
 Romanovsky" <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
	<vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
	<surenb@google.com>, Michal Hocko <mhocko@suse.com>, Balbir Singh
	<balbirs@nvidia.com>, <linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-mm@kvack.org>,
	<linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <aWiall34yq5Eupkf@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <6spceodgfobizdaziju4yvvfydwvvik2wjyoyfuglozq533rgl@vmkotau3m3kw>
 <aWiBy3nZ4FrPYURF@lstrano-desk.jf.intel.com>
 <aWiGtlKI3LOtjUl6@lstrano-desk.jf.intel.com>
 <pgz2mhy4si2tu4iwusabjxxi4nctz3lamnpbg7773a2mp7srph@bz3ovwxuyakq>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pgz2mhy4si2tu4iwusabjxxi4nctz3lamnpbg7773a2mp7srph@bz3ovwxuyakq>
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 5576fdc0-3ecc-434c-e294-08de5409c1b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THZZSzRMeVdkRXNyc1ZNTWNNak9DdEVubjRLNWw2N29uQWI4RXQya2FKWnh0?=
 =?utf-8?B?UUJTOHg2MUUxVnVLMlVkUy9XUjBMZXdINEFoWDJHL1MzNCtEdS9BYzFzVXhn?=
 =?utf-8?B?VTc4LzJVQXFJczVHdVdrR0JqOUJpZUZXRFpxR0h5dGlnMXNycFQvQVMvN0dt?=
 =?utf-8?B?RmlnT3BIdlBSMEhSRE9QWEt2bjVvUVlpVkR2dU8ydVFlbFJXYlBBNXB3QnFP?=
 =?utf-8?B?RWtpN1R4ZWdHc2dFZFdlSWZtRVBZMXVRM1ArNkpNUnVsOGdLQWZRT2g0WkdH?=
 =?utf-8?B?VGRON25kVXlMREpiZFAvclZLNlJmSUl5SUx0Yml4TU0xUjk0TEV2QWEyaElz?=
 =?utf-8?B?YTBSS2F5bGJnR0dIZytEOENwNE40b24zSlVYYVlLcnJCMnpFcGFobjVmZGwx?=
 =?utf-8?B?V3RzTmZuWm9SZ1JjbEY4NnJCK0JTT1BvZzFRN0hoazk2YjhoMmRiNmYzcGZu?=
 =?utf-8?B?c2orNllSdUwxSndJa2xrTWh3eGJZc09LMklpVGo3Um1ybExmbnQydlZCM3k0?=
 =?utf-8?B?b1d6dldNcWxRNS9OZFZFc203ZWhEd1o2clFLb1Y1L3Q5MUpFb3l3eGVVVlNn?=
 =?utf-8?B?cDhCb3luanVBejlGVG1Dams1OUM1NDVrUHFLWWVqSHJ4eDdOMnNrRDRKUnNw?=
 =?utf-8?B?Q3V6UHNDSHl0dXk5ejV5R205TXVNWWgxcU8xaUxLcTJ1TmVRa29rbElMVkRW?=
 =?utf-8?B?S3pKZXExQzc0b1ZsRDRxQ1psOGhvTGhLczFseUlzdlJHZmU3ZU53dTRzQzRU?=
 =?utf-8?B?bi9VRzdhcENDOGNIZUNMeXJqeWpvVzBXdDdBL241a0VzSWFsdW41RDNXQ09i?=
 =?utf-8?B?TFBlQ3lUWjNVUkpwc3dvVzdrMmwxRUtReFRrdmQ0NXRWY0ZVY25QUnF4RVBz?=
 =?utf-8?B?YkxMM05yUnRDQVZ6S2JHYWovcHc3TkJYQVhXK3FpQzk2Y0VLS1A4dU5QVm1t?=
 =?utf-8?B?ZUpPUXBrTHNkekgydUVTb3lmSVNEbGhTYk53SStMenlrczgxM1dzUE03eXB3?=
 =?utf-8?B?Q0t3L1NFVHlVOVNpOTBYckljSFExL1J2OU9LWEhzcWUwWnlJYVcrUmhIYUY0?=
 =?utf-8?B?RmIyQXVabDR6cExRdkhHRlpSNHZKUWcrc2ZvZTBrNlRiWXFDQUFlSWhoYkhv?=
 =?utf-8?B?VnRHeEtUOUp6TkhRK3oySitYY1R1NzZkaFlkbGJFV2l2Nll6Qm12NUlSYzUz?=
 =?utf-8?B?Y215SEhoWitHN05wTVFZVG8zSDY2dStkaG52L0xPYzQ4dTQ0b2NBQ3ZOTWM2?=
 =?utf-8?B?Wlg2ek9hV3o2bHd4K2p2SEVHMGxpTC9pT0ZTVXhBUmx3RVltbmMrV0hkeFA2?=
 =?utf-8?B?M09hY3l3OWp5SEI4U1k3dXAzTXloZFZ5c05CMTJ0bjg4bmt1alBrSzZBSjVT?=
 =?utf-8?B?RXoxbS9iYjgxeFU4elErNXpHNlRRRVppblorZHJHTzA1S3FiU01aTENYVUp5?=
 =?utf-8?B?TG9sQ3RMVlhiSUZ2NG9WT29SQkhNd0pqcjUzZmVzdURiTVJhdzBzSEVlaFBm?=
 =?utf-8?B?QjFjd2orRHh3SzZsN3dkZWI1YmlsOWNsUG5SN0s0VDZDSVkrY3NhaFdtQjZi?=
 =?utf-8?B?WVZaTEYwTzA2K1M2SmJOaElRVVV1Zzhlbkg2WXZhQTd4dUphdGI5N2l4SHZC?=
 =?utf-8?B?aS9TQVlGeDQwK1NYN0VmOWxVTitEU0V4UEpOU2hwMnJrdUdtcmRsYitPeERz?=
 =?utf-8?B?UTJTdDRTT1FJcFFvcnYyZ2pveFBmdm9HakFFazgrOHd2Vkd2b05jeG9rZHp5?=
 =?utf-8?B?clhrSVh3bFdzZmp6YTJydGpFcWZYT2lJSi95SkxZMzRwUFUzakFLWDdtSVJk?=
 =?utf-8?B?a3orb0hpRVB6VjZQc3NpRjV3bG1OZVdGcE5tRHk1bGgrTm9KV2UrZ2tobmg4?=
 =?utf-8?B?WEFGN0I1MnoxRDAwbVVBTWVtRFBxZ0F4MnhHUUwzTG53UTBKQWtPUFA1U3hK?=
 =?utf-8?B?UWpDZ0h3ZlRucHNHNnovUWQ2MVNCb2MwanBBMlNTUC9XVXhTMEhYNTZncHV1?=
 =?utf-8?B?L3Y1czBVdlYwUXdsOU43VFlQbHpnaGpESmlvNVF5SVFwNjRzaVk2RjYwQzV1?=
 =?utf-8?Q?3niVlg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXhFSGd6N0I5N3pVL2xJSnJZejNEWXRuU3BzWlZkOFpWbW9sd1ZJNCtRZ1dv?=
 =?utf-8?B?NmtUcTVXdDhLM0pNSkl2bDgraFhORUVKd1hTYlE1K0t4OGdRSEtUd0swUWRV?=
 =?utf-8?B?T2p3RG1ieXVTYWN1RG05SDI0cUZlbThyMDQxcFdTS2FreGsrajhHMC9tN1NJ?=
 =?utf-8?B?ekxRcGgxS2hxem5mcGtqVHUzQnNrZnRDNC9Lc2pvOTJmMVZRT3JMc2MyZUp1?=
 =?utf-8?B?cjRjQ0dzOUxDQkJXT1BUUWV2ejZWbXlFKy9kazR5enNSR1VCcE1PNWVJUDNi?=
 =?utf-8?B?VWI1SUJRWmp5eExyUDhiZjN2VHBRL3kwK2ZWR0FzZE0rRUJsOTVjZ01nNzJQ?=
 =?utf-8?B?NENxaGRWNnI1RDE2RTRPYmFHWi95eEs1TXg2YVVqbFdBNDBFMnFHbnhrWTlU?=
 =?utf-8?B?SDN3aHpsK2Y4NG9EQVVESXJmSUozRHlZZWZ5UWRaWlExWmZhOThsdytDSlA0?=
 =?utf-8?B?VWpQb3htUTRLYWJYWXYzeVJ1a1l4QUVHYXFZQ0hFRFUyQjBMdGx6b0k1ZFBy?=
 =?utf-8?B?UDQ1MG5iSDYwVys5WGpuNFVSRXFSUlh6cENXOHNmM0g5K3gzRFp6VGZYSTJa?=
 =?utf-8?B?U0hZaFI5UmdheEVza2JqcmZoVHhzS0t1bEtrcHdPNE0rWmhCNG5NMGR1WHZQ?=
 =?utf-8?B?QzVsbWNBV3lZUFkwNnNMM0JyTGRyT0RtVzNVQ3pRN1FvNnpLNG9CUlRRUFpr?=
 =?utf-8?B?Qk1lY3RDdmFyTVVFbC92amNNS29ISDhXUUl1YThnYXM2U0VLckxtQTlleXMw?=
 =?utf-8?B?ekE3YWNDbkpXMXpKUWxzL0JmVkpNYTc3eVdYRHpPMGJZU2dKYkxEM1M3MG9h?=
 =?utf-8?B?TFh2bjJTVU11aWdGWWc1SlVZTWVDZGpzSkFpMURsRlRHUGZta2M3QjBZWWVj?=
 =?utf-8?B?ZFR3R1BhT3gwWWw1S1BxUHhKcVBzWU5kak8yekFhcGtHSkg2TEJncFY2RG02?=
 =?utf-8?B?QmNvTEZUNXlDOWFYUm1HZ3VFK1B4ZzVmcWNNc213d1QyZU8xNVNTdnRheDAw?=
 =?utf-8?B?dVVBb3Z0VDM4LzFGMG1MN25lOStRVUZZR3dDTzBPbGdHMjVnS2RTakIvMis3?=
 =?utf-8?B?bTVVUWV3OTBWQW5RV3VSSkRiVmtySXpMcWJxQzVNNUlzbWwrWlJiUHRtYW5k?=
 =?utf-8?B?MzFSQXlQaHg3eUdkOVgvaituNElFRkdWT1d2WUlMeCt1V3V1L0s5Tm00Nzh6?=
 =?utf-8?B?WW5kUytKb2taeVkyTFc1YjM5ckZmNVZ1djNvRUIvZnFDWStQQmwvbnNOZHp4?=
 =?utf-8?B?bzQ4RE1ud0V3UUZSeGpwb0RXL1kveHpTbVUzeWY0S0xTYlYzZEVOZ29JZXVh?=
 =?utf-8?B?dUhEZFA2T25HV3ExSEtwMkgrYWRyY3ZNZ0JEL3NsZVIxVlVLeFp1cTY5bm53?=
 =?utf-8?B?OXdOMnYwL1dRVVJNeW81TmRxSDF5T25ESEx3eUVvTFl4OEZTbXFsb1VBM3o3?=
 =?utf-8?B?Wm1vVXJmNHhuR2R6SFU3M1dRejBpalBHYlp0ZDZCdDVRK3JhVnRBZ3FsekhK?=
 =?utf-8?B?bUFpQ1BDeEw3RlZHY0xpNzhkaUlXUGRQa01DdFo0UDVTZ0p4VUZVS3JjdG5p?=
 =?utf-8?B?cm1tQVZYRkI4enlDSjlsMXlHdjIyQmdKbVZLbHhLT2o2c1JJZW0xSjNSL243?=
 =?utf-8?B?dCtHZzI1TkUvRlJxNVExbldnQmsvSmZXYzNyZGVFUTN6bXZIVnFhZWtseG8z?=
 =?utf-8?B?QTRhRk1XMXg3YUFnajB0UUJNWVB5UFBmNTI3cmt0NlY3NCtpSm9NQTVPSDNx?=
 =?utf-8?B?LzZWaFgwcmpFOU43a1FNY2NCUUI1L1A5eVJIQ2VxSFZoUnpOZnp3dGo4UHYy?=
 =?utf-8?B?TG1mNXZ4ZlVpLzlKMVc0MFl2T1NsUklDNUc2K2x0K0NTbEJJd2dzblhWd1lx?=
 =?utf-8?B?NHlxczFtcGFWSDE4T1dXelVaa2VIT2pMcVJPbVh1Njl2YVo3RGxQd3RXcFJF?=
 =?utf-8?B?OUlmdC9pejhJTFcvMFNqV0d1RXNMTUVwbnowUCtEZG43MHJlTDUza2hBYmFN?=
 =?utf-8?B?MzFkcHJtV0duZXRwRldEK2pyVCtFRHN0dmY5VmdsQ0l3OSt1M2YyWXBsK2pu?=
 =?utf-8?B?UVptMHowdmVhZkJXb3lmSndqbXpDNDZQalZhMXNnVGFOU2h3aHk2d05hdnV6?=
 =?utf-8?B?Z295WStKZ1RsVXlxRDVpVFRXZTArZWJWVm4weWhkUkNOd2FJbFJJMUl2U0ph?=
 =?utf-8?B?bHoyc2ZrTkhOcUFCMllYTlhNYWNhRXJSWHVmTGFEN0ozTmZVNEozU0pvVDdy?=
 =?utf-8?B?MXI5bVFXM1NlZG5NTWxvOTZNSjdXelpxZnkyOHJKZEVZTWdKWmtIOHRLS2Za?=
 =?utf-8?B?MG41UEFwMWpUbUJOejdDS0R2NDlKeExsRVNrZXdrd2djd3orcjB3UWIxbmtD?=
 =?utf-8?Q?Tez++52etbJPuhEc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5576fdc0-3ecc-434c-e294-08de5409c1b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:43:21.6182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nA7IC39vqsHSFk0hgF9BoeZ/3o4kA25yKcRxSQICvZCNKuh1SIF2fWCfesQKLJypzFs8iZDpQXE8HEBfbGKq8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6715
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 06:07:08PM +1100, Alistair Popple wrote:
> On 2026-01-15 at 17:18 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > On Wed, Jan 14, 2026 at 09:57:31PM -0800, Matthew Brost wrote:
> > > On Thu, Jan 15, 2026 at 04:27:26PM +1100, Alistair Popple wrote:
> > > > On 2026-01-15 at 06:19 +1100, Francois Dugast <francois.dugast@intel.com> wrote...
> > > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > > 
> > > > > Reinitialize metadata for large zone device private folios in
> > > > > zone_device_page_init prior to creating a higher-order zone device
> > > > > private folio. This step is necessary when the folio’s order changes
> > > > > dynamically between zone_device_page_init calls to avoid building a
> > > > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > > > must be passed in from the caller because the pgmap stored in the folio
> > > > > page may have been overwritten with a compound head.
> > > > 
> > > > Thanks for fixing, a couple of minor comments below.
> > > > 
> > > > > Cc: Zi Yan <ziy@nvidia.com>
> > > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > > Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> > > > > Cc: Nicholas Piggin <npiggin@gmail.com>
> > > > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > > > Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> > > > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > Cc: Lyude Paul <lyude@redhat.com>
> > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > Cc: David Hildenbrand <david@kernel.org>
> > > > > Cc: Oscar Salvador <osalvador@suse.de>
> > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > > > Cc: Leon Romanovsky <leon@kernel.org>
> > > > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > > > Cc: Mike Rapoport <rppt@kernel.org>
> > > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > > Cc: Michal Hocko <mhocko@suse.com>
> > > > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > > > Cc: linuxppc-dev@lists.ozlabs.org
> > > > > Cc: kvm@vger.kernel.org
> > > > > Cc: linux-kernel@vger.kernel.org
> > > > > Cc: amd-gfx@lists.freedesktop.org
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Cc: nouveau@lists.freedesktop.org
> > > > > Cc: linux-mm@kvack.org
> > > > > Cc: linux-cxl@vger.kernel.org
> > > > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > ---
> > > > >  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
> > > > >  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
> > > > >  drivers/gpu/drm/drm_pagemap.c            |  2 +-
> > > > >  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
> > > > >  include/linux/memremap.h                 |  9 ++++++---
> > > > >  lib/test_hmm.c                           |  4 +++-
> > > > >  mm/memremap.c                            | 20 +++++++++++++++++++-
> > > > >  7 files changed, 32 insertions(+), 9 deletions(-)
> > > > > 
> > > > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > > index e5000bef90f2..7cf9310de0ec 100644
> > > > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > > @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
> > > > >  
> > > > >  	dpage = pfn_to_page(uvmem_pfn);
> > > > >  	dpage->zone_device_data = pvt;
> > > > > -	zone_device_page_init(dpage, 0);
> > > > > +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
> > > > >  	return dpage;
> > > > >  out_clear:
> > > > >  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> > > > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > > index af53e796ea1b..6ada7b4af7c6 100644
> > > > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > > @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> > > > >  	page = pfn_to_page(pfn);
> > > > >  	svm_range_bo_ref(prange->svm_bo);
> > > > >  	page->zone_device_data = prange->svm_bo;
> > > > > -	zone_device_page_init(page, 0);
> > > > > +	zone_device_page_init(page, page_pgmap(page), 0);
> > > > >  }
> > > > >  
> > > > >  static void
> > > > > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > > > > index 03ee39a761a4..c497726b0147 100644
> > > > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > > > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> > > > >  					struct drm_pagemap_zdd *zdd)
> > > > >  {
> > > > >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > > > > -	zone_device_page_init(page, 0);
> > > > > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
> > > > >  }
> > > > >  
> > > > >  /**
> > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > > index 58071652679d..3d8031296eed 100644
> > > > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > > @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
> > > > >  			order = ilog2(DMEM_CHUNK_NPAGES);
> > > > >  	}
> > > > >  
> > > > > -	zone_device_folio_init(folio, order);
> > > > > +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
> > > > >  	return page;
> > > > >  }
> > > > >  
> > > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > > index 713ec0435b48..e3c2ccf872a8 100644
> > > > > --- a/include/linux/memremap.h
> > > > > +++ b/include/linux/memremap.h
> > > > > @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
> > > > >  }
> > > > >  
> > > > >  #ifdef CONFIG_ZONE_DEVICE
> > > > > -void zone_device_page_init(struct page *page, unsigned int order);
> > > > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > > +			   unsigned int order);
> > > > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > > > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > > > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > > > @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> > > > >  
> > > > >  unsigned long memremap_compat_align(void);
> > > > >  
> > > > > -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> > > > > +static inline void zone_device_folio_init(struct folio *folio,
> > > > > +					  struct dev_pagemap *pgmap,
> > > > > +					  unsigned int order)
> > > > >  {
> > > > > -	zone_device_page_init(&folio->page, order);
> > > > > +	zone_device_page_init(&folio->page, pgmap, order);
> > > > >  	if (order)
> > > > >  		folio_set_large_rmappable(folio);
> > > > >  }
> > > > > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> > > > > index 8af169d3873a..455a6862ae50 100644
> > > > > --- a/lib/test_hmm.c
> > > > > +++ b/lib/test_hmm.c
> > > > > @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
> > > > >  			goto error;
> > > > >  	}
> > > > >  
> > > > > -	zone_device_folio_init(page_folio(dpage), order);
> > > > > +	zone_device_folio_init(page_folio(dpage),
> > > > > +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> > > > > +			       order);
> > > > >  	dpage->zone_device_data = rpage;
> > > > >  	return dpage;
> > > > >  
> > > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > > index 63c6ab4fdf08..6f46ab14662b 100644
> > > > > --- a/mm/memremap.c
> > > > > +++ b/mm/memremap.c
> > > > > @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
> > > > >  	}
> > > > >  }
> > > > >  
> > > > > -void zone_device_page_init(struct page *page, unsigned int order)
> > > > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > > +			   unsigned int order)
> > > > >  {
> > > > > +	struct page *new_page = page;
> > > > > +	unsigned int i;
> > > > > +
> > > > >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> > > > >  
> > > > > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > > > > +		struct folio *new_folio = (struct folio *)new_page;
> > > > > +
> > > > > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > > > 
> > > > This seems odd to me, mainly due to the "magic" number. Why not just clear
> > > > the flags entirely? Or at least explicitly just clear the flags you care about
> > > > which would remove the need for the comment and  should let you use the proper
> > > > PageFlag functions.
> > > > 
> > > 
> > > I'm copying this from folio_reset_order [1]. My paranoia about touching
> > > anything related to struct page is high, so I did the same thing
> > > folio_reset_order does here.
> 
> So why not just use folio_reset_order() below?
> 
> > > 
> > > [1] https://elixir.bootlin.com/linux/v6.18.5/source/include/linux/mm.h#L1075
> > > 
> > 
> > This immediately hangs my first SVM test...
> > 
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 6f46ab14662b..ef8c56876cf5 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -488,7 +488,7 @@ void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> >         for (i = 0; i < (1UL << order); ++i, ++new_page) {
> >                 struct folio *new_folio = (struct folio *)new_page;
> > 
> > -               new_page->flags.f &= ~0xffUL;   /* Clear possible order, page head */
> > +               new_page->flags.f = 0;
> >  #ifdef NR_PAGES_IN_LARGE_FOLIO
> >                 ((struct folio *)(new_page - 1))->_nr_pages = 0;
> 
> This seems wrong to me - I saw your reply to Balbir but for an order-0 page
> isn't this going to access a completely different, possibly already allocated,
> page?
> 

No — it accesses itself (new_page). It just uses some odd memory tricks
for this, which I agree isn’t the best thing I’ve ever written, but it
was the least-worst idea I had. I didn’t design the folio/page field
aliasing; I understand why it exists, but it still makes my head hurt.

folio->_nr_pages is page + 1 for reference (new_page after this math).
Again, if I touched this memory directly in new_page, it’s most likely
memcg_data, but that is hidden behind a Kconfig.

This just blindly implementing part of folio_reset_order which clears
_nr_pages.

> >  #endif
> > 
> > I can walk through exactly which flags need to be cleared, but my
> > feeling is that likely any flag that the order field overloads and can
> > possibly encode should be cleared—so bits 0–7 based on the existing
> > code.
> > 
> > How about in a follow-up we normalize setting / clearing the order flag
> > field with a #define and an inline helper?
> 
> Ie: Would something like the following work:
> 
> 		ClearPageHead(new_page);

Any of these bit could possibly be set the order field in a folio, which
modifies page + 1 flags field.

	PG_locked,		/* Page is locked. Don't touch. */
	PG_writeback,		/* Page is under writeback */
	PG_referenced,
	PG_uptodate,
	PG_dirty,
	PG_lru,
	PG_head,		/* Must be in bit 6 */
	PG_waiters,		/* Page has waiters, check its waitqueue. Must be bit #7 and in the same byte as "PG_locked" */

So a common order-9 (2MB) folio would have PG_locked | PG_uptodate set.
Now we get stuck on the next page lock because PG_locked is set.
Offhand, I don’t know if different orders—which set different bits—cause
any nasty issues either. So I figured the safest thing was clear any
bits which folio order can set within subsequent page's memory flags
like folio_reset_order does.

> 		clear_compound_head(new_page);
> 		folio_reset_order(new_folio);
> 
> Which would also deal with setting _nr_pages.
>

folio_reset_order(new_folio) would set _nr_pages in the memory that is
new_page + 1. So let's say that page has a ref count + memcg_data, now
that memory is corrupted and will crash the kernel.

All of the above is why is took me multiple hours to write 6 lines of
code :).
 
> > Matt
> > 
> > > > > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > > > > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > > > > +#endif
> > > > > +		new_folio->mapping = NULL;
> > > > > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > > > > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> > > > 
> > > > It would be nice if the FS DAX code actually used this as well. Is there a
> > > > reason that change was dropped from the series?
> > > > 
> > > 
> > > I don't have a test platform for FS DAX. In prior revisions, I was just
> > > moving existing FS DAX code to a helper, which I felt confident about.
> > > 
> > > This revision is slightly different, and I don't feel comfortable
> > > modifying FS DAX code without a test platform. I agree we should update
> > > FS DAX, but that should be done in a follow-up with coordinated testing.
> 
> Fair enough, I figured something like this might be your answer :-) You
> could update it and ask people with access to such a system to test it though
> (unfortunately my setup has bit-rotted beyond repair).
> 
> But I'm ok leaving to for a future change.
>

I did a quick grep in fs/dax.c and don’t see zone_device_page_init
called there. It probably could be used if it’s creating compound pages
and drop the open-coded reinit when shared == 0, but yeah, that’s not
something I can blindly code without testing.

I can try to put something together for people to test soonish.

Matt

> > > 
> > > Matt 
> > > 
> > > > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > > > +	}
> > > > > +
> > > > >  	/*
> > > > >  	 * Drivers shouldn't be allocating pages after calling
> > > > >  	 * memunmap_pages().
> > > > > -- 
> > > > > 2.43.0
> > > > > 

