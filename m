Return-Path: <linuxppc-dev+bounces-1632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C4987F33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 09:16:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFMFl2d1Pz305D;
	Fri, 27 Sep 2024 17:16:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727421371;
	cv=fail; b=NV/qW1ZTuqe1+ak7YRM1P45GTVDNUzLrTQStXiJVr9u9oVaSkw40DykSySt9xAelAmERndWsUI1g07bwVy4Tmsh5cVCH7NfYqL6JNTan0ql1XjFX630ZJAPLtQxJ+tQpSRojHLBe98MRELhWzECYWKcV4zLDVrG1owHIKLFu+Kc7LY1L/ZZlqZuubfAjHHqzP+Map/E8ZJdzNLeadMZQ0Ge6/dBGgHATsC/5Ew26Fi2xLMJUW7g4Bu3k3gZAX7T3NIs2Rx3PTFarX/SKFzymR0l0n+lQs3uc8CZFwKVNdBOYDWyQU/AiCq+bv+xwx8aH2TXa6/CsfKZKAPlRoYB50w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727421371; c=relaxed/relaxed;
	bh=wvzJfMTjCpLgevUw69jM60+GEUa0heiOcgtJnTKGihU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hPhlwpwFPZQpyRgTXsb+EyDw1CsYcfpfpPc6ROdG2jpiCtRyhyuqX03smg9VynNEvyS7Kbv3GH+fwdRwAxMh/eS60XsX1ig8FMy4nZJt4h6p/13Z3ne7hqN46tULYJTIVM4+dU1xVytYpuUjxiV/EXx1fewTOss32hFKMAm7FbjlUZxX83C4wZMB4mdQnRizQaQ9E/j9jMgyrCP3Q4RzdGr2z3DkXEbrERIlrzg4HWV4hgKSDZLfPvnmpst7JHn3pcx4YdQOncF5Wj2++RzNav9P3TrLdp1lmQeqBaZg489xB95I1qIO4iLBkqAMKrk4JjaA1QbsUkx137U7aKIr5w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G0ksq+DO; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G0ksq+DO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFMFj2g9Yz303d
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 17:16:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727421370; x=1758957370;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PyI5b7KSNKuqSdWvAcaxwpF1PLFb+NglfnHVqmyIGs8=;
  b=G0ksq+DOUImpAhPaoH94WgazOhcFqrXiKMdwcIqJofEoqRZpS20hXijd
   gafffFwwZ1Nf9kjkOx6pEC0N06H8MyKgpgkmz1EEaWxeOfMEiBkhI4EMn
   EYoR7JvYcUdMboCynckyoLbVabuofCt9JSKnyVPqHOtcav2PYx4mXu494
   JoUjnYiGXGwzztdV62fG4FXhJ71qjxNHdWk26ecz6NR4p58WHnnF+Ay9c
   2fXKCRCT988aMg45PoYzu9EllF36W+xyrMTKF0ylUHxZiwjS3+irwYjt+
   EBBY74YouSzsa5CIDxTRNM+NrjW9nwrtipwGf5RZmylkDtCh9Ad104jn0
   w==;
X-CSE-ConnectionGUID: cV+YOZn2TWePd9FL4QTusg==
X-CSE-MsgGUID: NAdCv4SMQz6Vl3vIszt35w==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26721409"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26721409"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 00:16:03 -0700
X-CSE-ConnectionGUID: vdj0NRl0T5aDV3nn3vc1kA==
X-CSE-MsgGUID: T8EHBWs8SoqL9vKRY9FMzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="72754628"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 00:16:02 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 00:16:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 00:16:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 00:16:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 00:16:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIXhLVyFoCkRxmLJjX0ph3x1d1X4zvnIch9SdwJMJYntgfPNF7WLuqPxlAup7sEkvIdCboM/Tpa4RdGF0kfOFiBPw5OPapSlcXDP0xoOJjuT9yjFQ+US1OAppftGfZwUgSFQmx0w0iePUVkpPk07Exq0uSu4EhiFakMCfyF7zTJjsubViheQbhVDmKW2+ByhmtbvzTk2yClmDGtaMFymOoka5uE7RvuaUtZTyFn4w7Dw2qs4wwx+BU4ifH5GA8NehascWS2HFqOOKEIrwzY5IWJJeniGlQElguptpQxqFuPTzgiDqmUJt6FU9fJFJFlZbA9H50hvp6XqIJtXkSCIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvzJfMTjCpLgevUw69jM60+GEUa0heiOcgtJnTKGihU=;
 b=JyJ21IiePzA08IIPa+AuQqAxvA+uDKL81JLfs0K7n8W2m4fH9GB8tzLVLNNrRfhNMrKCOstVeiSt9D3XhyhdicZpZLeNHJhls78oK39yQ/aRmXvlpEK/HEQvyCs46dtt8VvmxmAIEDv5QXfm/8O2Fg6iR9Iav0onDI6IqJbZ9O/L8SAdbz+pKRR7OMZoocTabL3LcTN/PghM3DWyeD4yn9SkjgLufv2ZETezIIh1jLE+/rGkCNaQmF3FqxiswYacfAAgeH6fEbJrVU+Fwbc9CuwzHb4Do9uEqKfheqEQpbRIaB4vHvfXWSbKvB+V3TX72TDwmp12f8g1koPsN09/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 07:15:53 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%7]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 07:15:53 +0000
Date: Fri, 27 Sep 2024 00:15:49 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <dan.j.williams@intel.com>,
	<linux-mm@kvack.org>
CC: Alistair Popple <apopple@nvidia.com>, <vishal.l.verma@intel.com>,
	<dave.jiang@intel.com>, <logang@deltatee.com>, <bhelgaas@google.com>,
	<jack@suse.cz>, <jgg@ziepe.ca>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <dave.hansen@linux.intel.com>,
	<ira.weiny@intel.com>, <willy@infradead.org>, <djwong@kernel.org>,
	<tytso@mit.edu>, <linmiaohe@huawei.com>, <david@redhat.com>,
	<peterx@redhat.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <nvdimm@lists.linux.dev>,
	<linux-cxl@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>,
	<jhubbard@nvidia.com>, <hch@lst.de>, <david@fromorbit.com>
Subject: Re: [PATCH 09/12] mm: Update vm_normal_page() callers to accept FS
 DAX pages
Message-ID: <66f65ba5be661_964f229415@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
 <64f1664980bed3da01b771afdfc4056825b61277.1725941415.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <64f1664980bed3da01b771afdfc4056825b61277.1725941415.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW4PR04CA0061.namprd04.prod.outlook.com
 (2603:10b6:303:6b::6) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MW6PR11MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b172a0-704b-4239-c6c5-08dcdec43943
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VuhzwWkiVwlcfC4jmo1eDcIpTrj9enaJtLzHxmMJLvNqUVFK3fjAC0QJAkl2?=
 =?us-ascii?Q?9BmRtaqDEpUqMEnYchQNdIvpag1sCztqHBbWEVrSpOBiU0Q94YoNlGqbos/Y?=
 =?us-ascii?Q?vAk+GYaLwlEF3Tbn53uEAYWMSuiIMnB9KoGS7IrXX677Wjob8t6zbTChTJYY?=
 =?us-ascii?Q?VjHnmH5xJ8OOsAk07MRCacTewcScSEfPLcAhkhcFvuSozI5HAHuphz3K0oj3?=
 =?us-ascii?Q?59WpoLSpus8+vkRnCBoutgh06dz/aBJ3W1p4OzRc4IfGQ9vP4TQhu4VRROq9?=
 =?us-ascii?Q?CZdoyehno8XYbNnOWyrkGxnmrdgYN1/7uFQTcYbkzpHQ58RRJMpPpNza3/db?=
 =?us-ascii?Q?DGhoB83LWpiboMQCeepvpo0Maea88iW6J5S/8G1/yulFsfsoE/y+QrYXkZGp?=
 =?us-ascii?Q?GhTpGJml/OJUo1v/A690KCQ1YRDPkOT+/pJy4UAG40Tm89hm+vRY001+OS+b?=
 =?us-ascii?Q?bLcGTeQSOhUIDC82b3H14+QBasnGSqLnONrWWCw44NLX43IOkQWBWAZ3ZYnw?=
 =?us-ascii?Q?PjhCvV7r+Ch9FA5+oC3sJZL4gpGOBkkzBg4IO9qLdGXVWKcMK0m97mo7k19a?=
 =?us-ascii?Q?MDKxRBBLKZVAyi7KXkGMh8I+037BX1vXmfsr86ebcy87ErDtOpFOTdLgssr4?=
 =?us-ascii?Q?3t/fXXxlm71UEPa7qbpxs9qldDKW08BSl8QL9io/z5Q+wHJO2B+8V6MYAkv1?=
 =?us-ascii?Q?/rUJA4dznV9bHKktr8IrYGUtKdUK+H45QwmmZrrthWOt7mvW48qALyuF+AFS?=
 =?us-ascii?Q?nwe8vyUSSBgMfYKoVaWN7sR/kulob5aoax9J2CqhR/JfeHn0pTU+D7n8ayUp?=
 =?us-ascii?Q?2ElKUXHVnAh7LsNOD7HVwysIqIrqG2L3uKEtv9uUGP3y/ij8NQKXpjsSbM4o?=
 =?us-ascii?Q?L9oEqWG4CT9EbCJhmGqoYgBMqFzlYoqYRb+8yZHqQdzzNmr3fWwDrEcd2JYA?=
 =?us-ascii?Q?B2ElfE0BZQMSls9SeL2+fGXxpebgJ9S1OZoFZi/xWUkyrdMEUE5BpMf22InA?=
 =?us-ascii?Q?B6iARsEOn1YplGBRiFV20+7/rC+KP6wWbo5KLrxDVXbXpcqhTPZVyNIfnHlD?=
 =?us-ascii?Q?M/NsgIsG+wq37fcFZumBsGYG868VUKEoRD4EE0AHqWsFNku2LdoHkO5f477u?=
 =?us-ascii?Q?pz7h4FmH/SnfonPMM7W7mMMmt06/jOur85NA9DLLygzaV8j4Y8yxpEfsOd07?=
 =?us-ascii?Q?qiWxZtal/6MNWOSjr0bzeacbWhJWxvofpzHdSiuZgGY2/DRPhqiUifOXLsGv?=
 =?us-ascii?Q?qDnQBTEXwQIXuGBVQwn3vRhrmms1g6uoR3Ss/NAKdg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xpucomMBBXB31DURt7YWYV1ucyjJ0c6RrkYQySYQEr57EyQ1Bu/eZ+LEad73?=
 =?us-ascii?Q?cctUiCza8vtoxLxMSUsXM0GGttEbua5jns/xokBF4YXtpaQxfE5Rp6vLloQU?=
 =?us-ascii?Q?egEb6/lBpzDHWSpFn6bAs3bCBc4/Ljbp39YCR3XoSi+bEUFDtfXEXNvJ++/y?=
 =?us-ascii?Q?Fz0xKiVUj2WHxJd6XHMuuKfrC9phmaCPbTkLdicNtvw5rAWrZY5mHSEvlx1d?=
 =?us-ascii?Q?Bxq0OJpj4ujh4cMUEl+33XDtjkmdxrD+yw3Ry6+1v3CuEx+q3jJAlIcuGpq+?=
 =?us-ascii?Q?mlPuKjgsdDzdfBtahu/Qllcdc2QmEVoO3ZJ2+0zVa86LrQaknxeoCsnOC9Fo?=
 =?us-ascii?Q?h9NQNzXxffWkeDu/R0kDCNoKapUFMv+s9YzPiD76ZZuOUCS+r7pA7bZRq33g?=
 =?us-ascii?Q?Jdo2hGGGX3dHrpy047s2u0I9Eo8NrExTcNyGsm4SXsmkgGKSoBAXRdvye4ZJ?=
 =?us-ascii?Q?JOK1c6FY/F7cGNbzFpd4AhyfVqTh+p9nyEOhLwNxY5E7m2+S4S8VdQ0nHD/7?=
 =?us-ascii?Q?ByWEIvdLSVdIJp7E9/Gjfn8qU6SN0XDh3YPdwwYx7wdMknaC6JM2ajbYgcPl?=
 =?us-ascii?Q?9SjLrXX1ZBysqS/nYj4Sper5JWj6OOkBCW8bxBrrhOIQNfdtZnxNiTbfTmdX?=
 =?us-ascii?Q?9GPcz/QZv9psHLtEZrKiMaICuuSY3n1MRm8dhEeRaAHVFmIWv7TN6N2HVbPH?=
 =?us-ascii?Q?JFMeMkOnZhorsFGbyzzF4tB6KUDshTNPcztYsUVtCF7kMrfsxJA/OIrlznfI?=
 =?us-ascii?Q?n4CRTWRx2ev86JCi9S7jra3VIG77BfLhSkZWhJkZYVdQX65nzwZkDad2AygZ?=
 =?us-ascii?Q?/5SRqkDsFtqSDA0EulfmBC8b3P32blDGDjKYuBu9w812vBrEnXVeLm9+dkdn?=
 =?us-ascii?Q?8Ih8EVg0WP5gzNG+eVrBtiREqrq3Rb0hrPMVmKvqzeGCMwxoRnSiuuGwxfct?=
 =?us-ascii?Q?JzslzP7Qlsf2d6LkRXGjY7wnztR3aMzfrOSh5Fv1W+icf8xDGCVd/Wc7Sz6K?=
 =?us-ascii?Q?VNdr0yf2O+6dKaszVklQlIPuOj/LUgvRl7aP28c2D0snRWbtI3p3YKDiOgyu?=
 =?us-ascii?Q?Cnd80FaaSLJ7AbKmH3ccTs/VaGoSPnSMsRETtM0EptTOiDnE96ZiuDQEcLg4?=
 =?us-ascii?Q?UyccIVnnPch/H3DjaFMpRYMA33RaXUpg2+VbPqWvgNMuMKUXIVHXiq5BFwlF?=
 =?us-ascii?Q?NMJLzjm7oz0pcfy0EtLNQcg9QVle8ZvNV4KVdX8eEaNJv6Uz9Rlpe7b51u1X?=
 =?us-ascii?Q?zISnT6Y0MMG0xhOfcE10zabT2xPaMmD9mZ8KzJWSTwrmSDRZsvZGZqSeNMup?=
 =?us-ascii?Q?6VT+QrFXXlvzicQHxa6Zd0CB5IXQHGTlR7/TE8qb6HBjLrxaZk0Fh3N7e5cZ?=
 =?us-ascii?Q?OTjG7EzyOv8zVakoogdr2eGHj/M1RRsg0HwYmQmGBj4Ty4z7BExB/L0Qkznc?=
 =?us-ascii?Q?G/zPSoHX7V21tctVpkQIsOldtbWZUefuEka6ZiR6opX/8Dx2sGH+gXlyPBJk?=
 =?us-ascii?Q?Pn6XrB21lVQbvsI4IzWMX5y5d0sPYRelaOo0w06Yxg34bqR8SG2U5gp544Fm?=
 =?us-ascii?Q?L2A7TZMljxmrfl/RuPvw1qXA97qByCYdZpRX9VlSpX8MMskxxa9+M+gEP1Id?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b172a0-704b-4239-c6c5-08dcdec43943
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 07:15:53.6805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkxtra6wUGhXF4erD0PnhhxUE+qFmkrwAUIajUZ7aW1udcQ6Scic5aK/HBEMo6RlluxfvuxfpFR1xTx9S0yFG2nNoVe+JCQRETYMBXoUTp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8338
X-OriginatorOrg: intel.com

Alistair Popple wrote:
> Currently if a PTE points to a FS DAX page vm_normal_page() will
> return NULL as these have their own special refcounting scheme. A
> future change will allow FS DAX pages to be refcounted the same as any
> other normal page.
> 
> Therefore vm_normal_page() will start returning FS DAX pages. To avoid
> any change in behaviour callers that don't expect FS DAX pages will
> need to explicitly check for this. As vm_normal_page() can already
> return ZONE_DEVICE pages most callers already include a check for any
> ZONE_DEVICE page.
> 
> However some callers don't, so add explicit checks where required.

I would expect justification for each of these conversions, and
hopefully with fsdax returning fully formed folios there is less need to
sprinkle these checks around.

At a minimum I think this patch needs to be broken up by file touched.

> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  arch/x86/mm/pat/memtype.c |  4 +++-
>  fs/proc/task_mmu.c        | 16 ++++++++++++----
>  mm/memcontrol-v1.c        |  2 +-
>  3 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index 1fa0bf6..eb84593 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -951,6 +951,7 @@ static void free_pfn_range(u64 paddr, unsigned long size)
>  static int follow_phys(struct vm_area_struct *vma, unsigned long *prot,
>  		resource_size_t *phys)
>  {
> +	struct folio *folio;
>  	pte_t *ptep, pte;
>  	spinlock_t *ptl;
>  
> @@ -960,7 +961,8 @@ static int follow_phys(struct vm_area_struct *vma, unsigned long *prot,
>  	pte = ptep_get(ptep);
>  
>  	/* Never return PFNs of anon folios in COW mappings. */
> -	if (vm_normal_folio(vma, vma->vm_start, pte)) {
> +	folio = vm_normal_folio(vma, vma->vm_start, pte);
> +	if (folio || (folio && !folio_is_device_dax(folio))) {

...for example, I do not immediately see why follow_phys() would need to
be careful with fsdax pages?

...but I do see why copy_page_range() (which calls follow_phys() through
track_pfn_copy()) might care. It just turns out that vma_needs_copy(),
afaics, bypasses dax MAP_SHARED mappings.

So this touch of memtype.c looks like it can be dropped.

>  		pte_unmap_unlock(ptep, ptl);
>  		return -EINVAL;
>  	}
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 5f171ad..456b010 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -816,6 +816,8 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
>  
>  	if (pte_present(ptent)) {
>  		page = vm_normal_page(vma, addr, ptent);
> +		if (page && is_device_dax_page(page))
> +			page = NULL;
>  		young = pte_young(ptent);
>  		dirty = pte_dirty(ptent);
>  		present = true;
> @@ -864,6 +866,8 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
>  
>  	if (pmd_present(*pmd)) {
>  		page = vm_normal_page_pmd(vma, addr, *pmd);
> +		if (page && is_device_dax_page(page))
> +			page = NULL;
>  		present = true;
>  	} else if (unlikely(thp_migration_supported() && is_swap_pmd(*pmd))) {
>  		swp_entry_t entry = pmd_to_swp_entry(*pmd);

The above can be replaced with a catch like

   if (folio_test_device(folio))
	return;

...in smaps_account() since ZONE_DEVICE pages are not suitable to
account as they do not reflect any memory pressure on the system memory
pool.

> @@ -1385,7 +1389,7 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
>  	if (likely(!test_bit(MMF_HAS_PINNED, &vma->vm_mm->flags)))
>  		return false;
>  	folio = vm_normal_folio(vma, addr, pte);
> -	if (!folio)
> +	if (!folio || folio_is_device_dax(folio))
>  		return false;
>  	return folio_maybe_dma_pinned(folio);

The whole point of ZONE_DEVICE is to account for DMA so I see no reason
for pte_is_pinned() to special case dax. The caller of pte_is_pinned()
is doing it for soft_dirty reasons, and I believe soft_dirty is already
disabled for vma_is_dax(). I assume MEMORY_DEVICE_PRIVATE also does not
support soft-dirty, so I expect all ZONE_DEVICE already opt-out of this.

>  }
> @@ -1710,6 +1714,8 @@ static pagemap_entry_t pte_to_pagemap_entry(struct pagemapread *pm,
>  			frame = pte_pfn(pte);
>  		flags |= PM_PRESENT;
>  		page = vm_normal_page(vma, addr, pte);
> +		if (page && is_device_dax_page(page))
> +			page = NULL;
>  		if (pte_soft_dirty(pte))
>  			flags |= PM_SOFT_DIRTY;
>  		if (pte_uffd_wp(pte))
> @@ -2096,7 +2102,8 @@ static unsigned long pagemap_page_category(struct pagemap_scan_private *p,
>  
>  		if (p->masks_of_interest & PAGE_IS_FILE) {
>  			page = vm_normal_page(vma, addr, pte);
> -			if (page && !PageAnon(page))
> +			if (page && !PageAnon(page) &&
> +			    !is_device_dax_page(page))
>  				categories |= PAGE_IS_FILE;
>  		}
>  
> @@ -2158,7 +2165,8 @@ static unsigned long pagemap_thp_category(struct pagemap_scan_private *p,
>  
>  		if (p->masks_of_interest & PAGE_IS_FILE) {
>  			page = vm_normal_page_pmd(vma, addr, pmd);
> -			if (page && !PageAnon(page))
> +			if (page && !PageAnon(page) &&
> +			    !is_device_dax_page(page))
>  				categories |= PAGE_IS_FILE;
>  		}
>  
> @@ -2919,7 +2927,7 @@ static struct page *can_gather_numa_stats_pmd(pmd_t pmd,
>  		return NULL;
>  
>  	page = vm_normal_page_pmd(vma, addr, pmd);
> -	if (!page)
> +	if (!page || is_device_dax_page(page))
>  		return NULL;

I am not immediately seeing a reason to block pagemap_read() from
interrogating dax-backed virtual mappings. I think these protections can
be dropped.

>  
>  	if (PageReserved(page))
> diff --git a/mm/memcontrol-v1.c b/mm/memcontrol-v1.c
> index b37c0d8..e16053c 100644
> --- a/mm/memcontrol-v1.c
> +++ b/mm/memcontrol-v1.c
> @@ -667,7 +667,7 @@ static struct page *mc_handle_present_pte(struct vm_area_struct *vma,
>  {
>  	struct page *page = vm_normal_page(vma, addr, ptent);
>  
> -	if (!page)
> +	if (!page || is_device_dax_page(page))
>  		return NULL;
>  	if (PageAnon(page)) {
>  		if (!(mc.flags & MOVE_ANON))

I think this better handled with something like this to disable all
memcg accounting for ZONE_DEVICE pages:


diff --git a/mm/memcontrol-v1.c b/mm/memcontrol-v1.c
index b37c0d870816..cfc43e8c59fe 100644
--- a/mm/memcontrol-v1.c
+++ b/mm/memcontrol-v1.c
@@ -940,8 +940,7 @@ static enum mc_target_type get_mctgt_type(struct vm_area_struct *vma,
                 */
                if (folio_memcg(folio) == mc.from) {
                        ret = MC_TARGET_PAGE;
-                       if (folio_is_device_private(folio) ||
-                           folio_is_device_coherent(folio))
+                       if (folio_is_device(folio))
                                ret = MC_TARGET_DEVICE;
                        if (target)
                                target->folio = folio;

