Return-Path: <linuxppc-dev+bounces-5261-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C76A1107A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 19:51:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXdWY4ndTz3bVk;
	Wed, 15 Jan 2025 05:51:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736880681;
	cv=fail; b=b+PeTu3wF2/1ckwrmarom+NIsLeKSItNBXatxUO8uPFz5V4z9KjWPTtx+35LPuLFI4aDZRTw0qrfP4G94jQeQgq08CksqHoQViP5xlRMppfZtzOMW1aPtxW26vOOgWx55/VxQvpfU9RpLe8wvPykhye195VDlU0IvlDg6EEDSqXW1OdSgcnA6hht5svY37/R2D1HzStyMvfhWhhDNc6S18qxFbe5dws4HAwBEWJUNfuTNd5YahwXFYez1w/rDXCki5zB8owF8Omn56yex+7y4G+T/vRmyDZBX1juaiYsUhHgOs1S60qZehtTsGFpGn10e6PUQ0sXvK+T9PP0sCnwQg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736880681; c=relaxed/relaxed;
	bh=eMryI1ibjV6DCpHmga+rjWzpYcwZmVNzXRWay0XOzPA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HgCUC7OfKjT4CwmB63pSq3+yL1NFK/BGhG47DviRrs/iPnLB3SX0uLD1tvZ8GaFfRR4ThjezZTpZfAGxNtU5AnVlI/P2JV4YX+VzpTsW+1/r6mJwAtuffI//NEXeUrpuF0iwxyxFTKf441MHQaXr9h9RQKoc8y2P24WUf/BmnCauVs38UokFq8lGA8QmLHz5yUbYA75EqKb6447IwoFSbyPKFuC4xjbZf9gaPjyz7KC3JCZQFi5QCbFpJEd4yvL+uLwatwWLBdzxD+ybeqyJK4fUij+1+/ZccefXLEUWd53FLKDQpVpb6z7pcJVcAQyyAigqN6eaZIOOxRh2dt1neQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M0wnWHXf; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M0wnWHXf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXdWT5tJwz30T0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 05:51:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736880678; x=1768416678;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qHJmo6VUjpqMFbgyBxGwXtfZ98tbI+btb0b5s+A3OKk=;
  b=M0wnWHXfKe9TLwLKbs++ro3tR94bq5InRXIsVqoZBRQlOeCM3cZVOcCE
   G9Fz57x/d6XCd/Xyi5Z9LQKfWy3LYAvMwoQqRoM8+vDhpx5Igr5jH5ALO
   nEWNHfEgAMId0avky+ZeWSCR5ondKJoCM6IaQZXgPOFGK/tbU0mtKL3JE
   GfYi/ge8Ne7trRSrfAhykBB0bVpZASt2oz8Bf5MsTGSHRRnBYIjFLZUuW
   ZSQga6E0VP7AZNO0+gNPTNLPhUSBBjYeeBV72cuyGrdP1Y/s/s25q5R8B
   TzE/IgeqiqfTVZOX5+F/Z+4NPEyVNgWKTxyOX3Ah/AEttqsTdG1Tz0BwP
   w==;
X-CSE-ConnectionGUID: P0RFVC3pRhuIm2iQqdCddQ==
X-CSE-MsgGUID: 9OI68FINT0O7LwYLky0QDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47683227"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="47683227"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 10:51:12 -0800
X-CSE-ConnectionGUID: 2v/CLY4gS+CM4vFB9ugdUQ==
X-CSE-MsgGUID: 5Sq64L8KRsKKjrrz/cxLcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104757565"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Jan 2025 10:51:12 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 10:51:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 10:51:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 10:51:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+jmBgi58VOMSRPoLJNKrLXnc6NktCIfK9iRruxAdaWehKuhzYxB6B8VTyOyhJWA/tdStHCop/iSyFjOenz4BU+ag7Y0QfuZQkSdgjqVgYhJeaD73c+QB/vIt7gzbgaVzsY84SvLvuYnjRW+wUnglkqlaphFK3/r8+KIGtAYiET97lRpkOZ5HgXJ+WaHMv4rWwCBEln0gc4CtgKPZQI9+++kjgEWj1/C233eDN1zeOGByw/8y2PNc901CTqAQ5zDZ+2Uigxbq8abHi0m0MMg+0QHlbaY6o0Yu5T6LjcRJ3Gi542CnFYhhLT8aphBMZg3pI9unDnly4fBXFdfnR150Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMryI1ibjV6DCpHmga+rjWzpYcwZmVNzXRWay0XOzPA=;
 b=wgV5YN7iro9zF8sgDXd3ZknPACdOhX1lhKcW6IK2JGkG7k6ki+6C5zR4X2rlbRSUmYr4QVDp0qjZGhbryasxZDDPZVgbjY0ChHHkX8zxj4f52iz7UxolMg2N20YNppTj0gZyCLZqcEo0S9t1U7CXtTCgLvGBnYkizmVVMmlZN0UbEY0VsnnapeP2pOW3umaPJ6anWQ4SMore1tdtpKaHun9xxLqw4VdILPwqRb8nsvu3rvfuhgl9YlcEcxT3ILe39wKs9G413lR/VArOOvLTWerB1fMwJbmsh0HQ6DUECA5/WL6gAb7dpsReTysdH6VSuUFCoUC+wWM7QVixWH2VGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA0PR11MB7956.namprd11.prod.outlook.com (2603:10b6:208:40b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 18:50:54 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 18:50:54 +0000
Date: Tue, 14 Jan 2025 10:50:49 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <akpm@linux-foundation.org>,
	<dan.j.williams@intel.com>, <linux-mm@kvack.org>
CC: <alison.schofield@intel.com>, Alistair Popple <apopple@nvidia.com>,
	<lina@asahilina.net>, <zhang.lyra@gmail.com>,
	<gerald.schaefer@linux.ibm.com>, <vishal.l.verma@intel.com>,
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
	<jhubbard@nvidia.com>, <hch@lst.de>, <david@fromorbit.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <loongarch@lists.linux.dev>
Subject: Re: [PATCH v6 23/26] mm: Remove pXX_devmap callers
Message-ID: <6786b209929e2_20f32945c@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <78cb5dce28a7895cc606e76b8e072efe18e24de1.1736488799.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <78cb5dce28a7895cc606e76b8e072efe18e24de1.1736488799.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW3PR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:303:2a::11) To PH8PR11MB8107.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA0PR11MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab07e93-5b81-458f-2c79-08dd34cc5f9a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YsPMrkNCAOPEkQoCz2IvWulBCFX+fPo65NVNhR0zdzkkyoN+/+o2pj1gcyGa?=
 =?us-ascii?Q?fs75xZp7iqW79SH6onHmyt2RY5ScnwJTStqORpAh5T+Kewc2XVVguPEkzw+x?=
 =?us-ascii?Q?XqTluBO5xB9ykH42MAdgoiWX8xzLvPmI+YZLZMwVpcwK00tANml1JFsBkmJt?=
 =?us-ascii?Q?Rr1KHyb/21TEE2PQiB/vURmhb2uBX38I+JnPvwMik0ZouRXV6V234nByPuQ2?=
 =?us-ascii?Q?vWU5FdVAqOpwiQybCTSZx9mTFXnBKWoFXQm98XoFCPbKhsv0ysdO+r8RUjBD?=
 =?us-ascii?Q?2e76b828JYp7SvA/vhoeyD3daNtDwTe9C+A3aqs+o61tnRp5FoahSRLDa+r1?=
 =?us-ascii?Q?ksiYASDs0N/UKetQW97sSEpL/jIQWnb2w7mxIUjIDTsqkLEVzwXTkXdNqv84?=
 =?us-ascii?Q?fev2jcz4cGF00JXuVL6ZS+9WHDnhIglsp+Fd2e0MbnY+HYMvnnbcyx6Ujf92?=
 =?us-ascii?Q?5jboI05WUOHB9FxhotGgFJmghIR4BbtJBUj25LpNAXNRiI8cXDpFbS6W7kbz?=
 =?us-ascii?Q?z2PWYUXgyZLu6b9M3QKwn84y8YdsFtceGla+HDSC7hW4x9G0zqZj9VdWJDv5?=
 =?us-ascii?Q?vZjfP9NXhThX/+vBqG7rFVO59264jWDIE7NEE347h9W+PuHL6rOV6cHcYgV4?=
 =?us-ascii?Q?M0AzlZWs5DO4UxoCjtrZTAI5YoIx9Tk3uDqWRLyHYZj+orW6pYP0WP9qt83o?=
 =?us-ascii?Q?X3rGDq7UvRcMp9wSRRDQtWW086r2O56DnEwLD/VYeUiVy+Hw5WBMLVURE8pQ?=
 =?us-ascii?Q?CLn1jfhQI4n2oGcY0oF4ARSanjkJmrCyDAYCKrpNRI9JqGqSe84gk/61hrCc?=
 =?us-ascii?Q?TyWIjOfNBMRCS9G/afo9JsgrLFJeLbhm9y+hDjh7xSldZRkn3qqx8TGWrtGn?=
 =?us-ascii?Q?rkuAeKXmicaNyxlWSlPahXP2mLgo47JHHlVFKIY3KyCwDy3dhXsV5jYTLBq1?=
 =?us-ascii?Q?8hwtZWTq49uBpikgepv6Y+mJAguG2/8QysmcLFqxuIb9EW2ShepgfobWbh6c?=
 =?us-ascii?Q?d7fXLUOpCaD6dTm0QwuUsuZXE3NFig0UdPQZVyHrfjWCl3sx541sWAVyFDM7?=
 =?us-ascii?Q?9Rgx2eOl7MSYnnDKSpuTJl8osexiMadiUO+kjwxG8DgitT1BEgGiqMkI1mS+?=
 =?us-ascii?Q?vmb+gNRpy1OYAtjGT2f0hudhV+b3ImFrKTx9cU78Pf7t8a/VwjJrLIXLiQzk?=
 =?us-ascii?Q?AKJ7tgwifkqEmUhBF8KkCBnJpfmmf7iJYSIxTbX+550ttUSB2yNeRPESM/3N?=
 =?us-ascii?Q?/+pOOODhbZjrdK+OdGiA+O6v11Z+G4jdUtq5XHgj2ReFUOuVrjeHakaJHWew?=
 =?us-ascii?Q?XPZJa8xSwgRAhl8wkxy4y4X6XnaTP4PHr3HQqE8ovzH3eXgmUXbEIeQzzhWb?=
 =?us-ascii?Q?TvfvHR/ErrTTmVdLSvYBWufnnrnc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kDBa6yISTMxd/sU136Yzb6z23MJc4SGiRLRjYAxuulYVnX/N1Te9ozm68Z4k?=
 =?us-ascii?Q?nL6KgJY4YfMCRGV5Ir0/fB6HScC58r6E5zHTqgHctZb3fm52/zpndQT1cpI7?=
 =?us-ascii?Q?ohCy1/q5NPz9SBpt84bdQetLLRB05U3xHAdfHVbMs/xcYZrWscgIF6Xagcby?=
 =?us-ascii?Q?84b4ThwzAXry/iE6deVZIQ/PYQ59AOmI/fwyLCxxxWDKfSHhrQ4uXTfS+FAL?=
 =?us-ascii?Q?pUdn1jFaJukYIzH5TrmBnyDlLAUrWI3c5m7AdpKGhneokMLc+CiuG69o425y?=
 =?us-ascii?Q?p0roDTw+sK7Tq3vvnG8hQahATW0vAJPC8CNWLUEzpXVBbSn23jcm00T/aHKW?=
 =?us-ascii?Q?Lg0ZpdcZDpwmXLt1yxLisuQlu5bByPV2RudSWZNrH86tet5jpcaSyTvQqan7?=
 =?us-ascii?Q?/KwdcqsnM0aYEkLVFo0GqG0m/NkFahYgF6mq//nHTLTYtMJVW8bdDj88v5BD?=
 =?us-ascii?Q?1ZAnPlakJ9ytrf/x8+uZSXkIb3Kz+0PU66d2YD3bdeHkjjaGF620ClAfN0F8?=
 =?us-ascii?Q?zXGByp75R3m7jgDUZfKcgerIWTP65rFGty4YuOsIH3tClgHbQu76J4UZzhvd?=
 =?us-ascii?Q?Xxc0M3iZ0dgtkAJccqG4wLLnSG9eBbQ6+WWGE+nWcKyTzGKkQ7W0mUj+8IvY?=
 =?us-ascii?Q?v6HUXvCwDrF6DW+6DoNt06rTFKTHpUkIrpVutMEOFj3IdlXFQb6+MR+csB0D?=
 =?us-ascii?Q?9OqmRQXo6NXVcCXWoxuI+er8d3xKv5qhjjZOm39CHhYzo/ZUwWvxBsCyFhOk?=
 =?us-ascii?Q?uLqN5zFjYIsgjiQittWDc0fqsZrVokkGCf2zxRBUytpt6FeBHDvl8q6gq8bX?=
 =?us-ascii?Q?4Q0W87UC5EX+vfc3EtoimKZ2W4OVHb/ajF31oawmrW2pDb59dRhneX4Y0YgM?=
 =?us-ascii?Q?svLMcx9NhPlDeL7aORcDw1Se+dWb9LXM/a9ADyQOu9SbalfVI0r7xaNcegTG?=
 =?us-ascii?Q?eIQvG2iShoZb+E8rt+G2iVklb9RUlwGGTm1vFje6z+/btZ6IweEcDTbLoLFR?=
 =?us-ascii?Q?XNGeQTq7HaZAS9FeZZ/2bE9AIjXf7hTBdLbg1Tohi3zRbRrp/agIwNOWe5XC?=
 =?us-ascii?Q?+eQ5IQki3AxCr/any3IqeujxsHLTYez2s0+cJECq4dd796UrsgURcxUQjEdI?=
 =?us-ascii?Q?6xQv4ZANmzRe/KjsDOApgT0/hZbsrKDFB6tOEI0LgXom8vw11P08SXI3jZBQ?=
 =?us-ascii?Q?qMQLTHf74i5L8MKJaspVmAbpq9ElWDrMK7EqlBA5sSqEKvZmf7YY94LeJO8I?=
 =?us-ascii?Q?jVK4q+uRn0XLaKBRADG0ZNC4VGrUiNZD19206SGVlKm3gQp2kMADbq62Gpz2?=
 =?us-ascii?Q?t6Jd/JjDORInzfERTLJenWN8Jf7ukDGKJi5pc3k6di5SrnRDyCDq5BzEnyHg?=
 =?us-ascii?Q?t0BzxwBmx4fGW1/1Byu9oLQj7t8xcRvKoDwcyqKee5cml8oSquRejdNDwLH5?=
 =?us-ascii?Q?nPO/3gfy/hUSYd3iqT8gU6Aeot9zS4O9e2EwCx5v62r60lZXfUSRhJIAV3vt?=
 =?us-ascii?Q?ugPjIyL43mysRhSH7LmB19aoQbVUs9J3dZvDXbgkBedRi0mlgXPSR7QzzuW8?=
 =?us-ascii?Q?A+gAn6N2JMLI4sgPPhkBsJ9KYehen/4TSs2I/ZSQ/kP5cQpAOIiS3UK8GrIq?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab07e93-5b81-458f-2c79-08dd34cc5f9a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 18:50:53.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uC65HX62NSkSdWpU9FpRTEJVgGeQMgGJDhDTLTfnQWm9/fxXU9AwynTedVW076dIhw/uCilqSf65znv4GbucwREo9jC5knKtDkqsqCn9psY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7956
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Alistair Popple wrote:
> The devmap PTE special bit was used to detect mappings of FS DAX
> pages. This tracking was required to ensure the generic mm did not
> manipulate the page reference counts as FS DAX implemented it's own
> reference counting scheme.
> 
> Now that FS DAX pages have their references counted the same way as
> normal pages this tracking is no longer needed and can be
> removed.
> 
> Almost all existing uses of pmd_devmap() are paired with a check of
> pmd_trans_huge(). As pmd_trans_huge() now returns true for FS DAX pages
> dropping the check in these cases doesn't change anything.
> 
> However care needs to be taken because pmd_trans_huge() also checks that
> a page is not an FS DAX page. This is dealt with either by checking
> !vma_is_dax() or relying on the fact that the page pointer was obtained
> from a page list. This is possible because zone device pages cannot
> appear in any page list due to sharing page->lru with page->pgmap.

While the patch looks straightforward I think part of taking "care" in
this case is to split it such that any of those careful conversions have
their own bisect point in the history.

Perhaps this can move to follow-on series to not blow up the patch count
of the base series? ...but first want to get your reaction to splitting
for bisect purposes.

