Return-Path: <linuxppc-dev+bounces-5274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F55A11926
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 06:45:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXw2W2wSWz3bSg;
	Wed, 15 Jan 2025 16:45:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736919939;
	cv=fail; b=kDlEIiaw3XFjLC90JMfU6CRHklCPdm7G7uPRStn1/4WYx6J1ODfHdNJzVeVcL86yavWU41PSZmS6ewJL948uumig9TyqdXLgGo66IFr6kKx3L1OF7yHxG3KFwd7qxSZ3YfyJO4/wQg4nqvBUeoK3TvDEsMgwxWCSWauJ1iXSTtt6eQdaNzyyWYCSWt+pGw7KioG/0lHiY1RKBXAYnmtMxcDvwvyWzS1voD4sEkb9OOfPPWzumZvlmXjoSPA/7QyWixhsc5THL4B25VUN5293UYn22I8KbjCjc/zkp9FMdjm6MCfaqBWOEUqdz3xBi3lIRkeOpXTVLKJb3qBwQ1Qv7w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736919939; c=relaxed/relaxed;
	bh=dwAsDqa83SBftxpZBhgIknSr+t8xo9ZEfQankdK2l3M=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NUudi6jday69oU2o2P3edyrT4+/NffzyeGDzhqO6+h5AzZj4TJzeqVuvOHEYxJJevoVx/hU9UdrjoCN9xpEtElx/JtnPYbpmrNMXo0giiBwRNZw42fuOzHT7/Ks9/6SFWCjlD4F/QF9PlJRrzdRZsBzoz8kbbnDxz/9+DNQOZUuwIwi/QMViMLUz+5HJzmGYpchHyKNGEGoY7ouFL8GuNKdeAY/iqLBe5SKdLPzyAfTTpLgAT7aC0JrtPAUCzmt15C+ttWLJc8Eh28n/BJQP0IRuErLTrsdsOIp3OTe8BHR93JgStIzL9AtkqHQ/4YiEWoidw1NsSpm9Ortf2Ddt6Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G9wiLZ+8; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G9wiLZ+8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXw2S6XL5z3bSN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 16:45:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736919937; x=1768455937;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Rag4rQfmoeiGqv6sC8nCDRn6Hg0Mac3OnSkHeNdxHSY=;
  b=G9wiLZ+8CZ+cPOgWFFP6VjkJVt9CD88Qpidn/BxlWpfA4hS3OdMBlp70
   3L/kBK42Zi733YRFcb7CgHi2qqpABEL21k0t29/WgLyw+vsO1vXncxLP0
   ynwXO/WFgS8jyqyOqsI7G6NDa5+5hruJWr+OmtfAYtQQLQKm7vbIHk/Fh
   ooblvsYuimnxdErWB/5Mt0o/2aXqi6ETcWjmVh5AoNUr3YX665NPQkBfB
   CwL/LLCUzBZItDdTT5cbHGFFnVPy0EDiuOnH128Q4VcPOdC34iS6l6OB/
   U3JJ+z5ki5HczC8g+qZGKm9raY4h/U1ld5RDgaLXWyy5lCI2pvW44rh+Q
   A==;
X-CSE-ConnectionGUID: 0uAsOREqQlS22X1Z2RhnBg==
X-CSE-MsgGUID: Ttkaz5onRo2foPWeLlecJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="41176874"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="41176874"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 21:45:20 -0800
X-CSE-ConnectionGUID: +dSrfhqvTVaVYKB+6mVGWQ==
X-CSE-MsgGUID: HHkWPYFfT66nqUn+A02QXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104897592"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Jan 2025 21:45:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 21:45:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 21:45:17 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 21:45:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6KPePJY0VCY6h6gfoOdWes6MM4QKmp2kV7+wfZdhPwoA8Ti0N96ZWROPoP1x8fxEtLRW+7wSCC8h1Yd9+4pjmQVmQOqZqLbqZzdni4R3EYDGJV6Ta+0BNDfWuGED5lXdPMAGYt8SdQfnWm3nbW5RNMMmm+vvhcWT21fDhTSDIsgxuRMJ3WHPt0x5lIU/90BDnTAy+O8infy3kdNIwxhV9h4ETATWWyHFlFmWyhXWDIdwfPHdOfSV5zOzU8s4Qmm2D1/rnTiXL2kMlHSx1DiEsRMK6JjZoUMEufdYhdULgKwuq1VUgIF830gVqR44/JG4ylOwJtNI9GdSRvYltH9wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwAsDqa83SBftxpZBhgIknSr+t8xo9ZEfQankdK2l3M=;
 b=SH0ziOvH1MFmdBSuVZdYB5wvmngkKf4NGOFajn7k76gAfRLmfRd03zDX+YUOLy2b6vmEMvg1PtlFhqA22/+ZZtNcpppJ8AOrc/y38d8GQLHsCt6HWEdLyE15Z7mim4X8YhoR0LJRuYBSOa9LHIa98KzQLSzf0OAmCnG0uu22J2RV2Js30aof32HKFJqJGXfPuK4y5sPJH9w75NCmKjhzPYHIaiPB+SLzhq8K7ibDl+DcioaSppmO45qUcHcJkIPFcX4kSBlQSTsouSnaAAPyC1HAH6ie160XPNmLdR1z2SDhiTJLLwvDreRhFj+5n+nY+GBg93F4ISU8gpEfFtRV7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MW4PR11MB6811.namprd11.prod.outlook.com (2603:10b6:303:208::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 15 Jan
 2025 05:44:43 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 05:44:43 +0000
Date: Tue, 14 Jan 2025 21:44:38 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, Dan Williams
	<dan.j.williams@intel.com>
CC: <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<alison.schofield@intel.com>, <lina@asahilina.net>, <zhang.lyra@gmail.com>,
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
Subject: Re: [PATCH v6 08/26] fs/dax: Remove PAGE_MAPPING_DAX_SHARED mapping
 flag
Message-ID: <67874b46c0493_20fa2941d@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <b8b39849e171c120442963d3fd81c49a8f005bf0.1736488799.git-series.apopple@nvidia.com>
 <6785b5525dd93_20fa294f2@dwillia2-xfh.jf.intel.com.notmuch>
 <pxpog7xsknwpaqh44vjkg5anegfwxizn6sgpdipntsljx5jg2s@rwqa5zfxooag>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <pxpog7xsknwpaqh44vjkg5anegfwxizn6sgpdipntsljx5jg2s@rwqa5zfxooag>
X-ClientProxiedBy: MW4P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::10) To PH8PR11MB8107.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MW4PR11MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a129ec-1459-49b3-5c98-08dd3527b619
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?06KpsT/QPJ971IC9WWwh4e2lDyWW+S7eeXH4qJPNaffOL+b/AufKCXx5lcpC?=
 =?us-ascii?Q?ubk5awfO//jN+KA8lBDKmS4aLD0KHZP1sN+7FRFMXz5NdJiaba2RPPZsfZve?=
 =?us-ascii?Q?ybnH3vM1fU7EUPn9ZHZ0rvlbkwEkeKt9dEGweelK+BzVxNHUTVw5QdvuwYcd?=
 =?us-ascii?Q?1/DpBjygqzfUi2Ds650Vr8nygXGLXT0NodPD29eH9rIKoiRVDkeXpoYsulZR?=
 =?us-ascii?Q?7fWxMOzpseZIhdIrO6eLa76sKkLJdBFhSy6mD7sINHDbGm7livLujzhqAWPX?=
 =?us-ascii?Q?tvJ1ekd0LSjWJwvqboqgx/mHZ/9QJYsfqWtqEiQw4kO6QaB1Dii9vPWN/je7?=
 =?us-ascii?Q?JVOzWilBIX0IMTDyJoA5/v6rB7Y0Ck5wbGQ4eG9UfxNBnrKSe8n01vRjS/A/?=
 =?us-ascii?Q?01+zhXhHFZJF7ptm9KJ7rgF6geyoHrwFCw07cR8jMjOSHAQTfdF4+cr8kIZI?=
 =?us-ascii?Q?WAIDuoopZeO9GJAazKTADnzckdbXXB6hOy7QV3FlolY/iZN8gERc1HTRqbCr?=
 =?us-ascii?Q?TDeIfhQ43bGjSt3jokU2ubjLT2VcRjx/4zrzC4RIVsUwiHlJ5zjzzhXEqVZv?=
 =?us-ascii?Q?67TeYTELE6pCxdtaDA7W4VkMn2YpKgXHvUT75xYcqbxsEFwYp4o5L/lR/Xy5?=
 =?us-ascii?Q?PHvYcb35Mbe1Rk4XWGLq0iRyOE03b0+Oej/LpyMILyQbmqmO77fslQxRFJYm?=
 =?us-ascii?Q?q299VXLp7U3wP2fa4+6/rsUePl/90ni3TF7S/FJxGrJ6i9K0cC8jpMQ+EVZy?=
 =?us-ascii?Q?N/AZS3lp5rD0eXcmD2U9zQYqEDIbXPLGjujgtSETSwSnzvH5AA+SPS0AaahS?=
 =?us-ascii?Q?lD6ymgsPEzwY2IuyHaiSZ7aY0hA+VNctujELBO++fnaCINucaO4ulRzUpQ4U?=
 =?us-ascii?Q?xKURWUGKcKD4WX6vMqVntgv81Pso89Y5N8PjuOUEoA0ca8T23Mfb+9SKLsZ7?=
 =?us-ascii?Q?A1949IK67BelIwJfK1v4tsl+DwNtuIso1A9VZPwZH+GN9Qpic7wVuvbH19Na?=
 =?us-ascii?Q?+KfbsfX2BOXGqBbD9xVs98mnihUbmJsiGDXuSY8aJ36HdHNjiVUUGplqrs4x?=
 =?us-ascii?Q?ILmJVbh+d8xL0uLrHuILtez7I24IqUn01CzHEJWpscrRn10Brx5nyWeRJcU8?=
 =?us-ascii?Q?kExwk00smj9Dch0HZPcLtWc+Lm7sHZmLrvBYmxpDptrY1NrvGou4Al2NwpyX?=
 =?us-ascii?Q?yJr/UUGlW8jFL5xEYy+FiR33wMwX9t5DctunlK8WKrrcz32yAmVLlKUnq89/?=
 =?us-ascii?Q?eqMqbvE6NGTyLm+UPnZpDqrdPoYhvG60EZtyt/VkjQYI0aqcu6NZzzk8+Jf8?=
 =?us-ascii?Q?ngZk2HXBFZLJFBNTVhliLPXnozv9G3JlXh7HwFo5DUsvOq5TzchniXwW1H/2?=
 =?us-ascii?Q?LyqMp/21GBJ1L/b1KsA8j0Ppx/6x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VoWQhXkXyPS+81OOtBnYGW7ICXZDnZ05kLckHpF5DZ/K9KoUikGG4c6mZhe7?=
 =?us-ascii?Q?lF+wtck7SaeDCxPK4E1IPPQnlm/a2IhoBXT4iSQ+BabW+henkErTNo8dqOoY?=
 =?us-ascii?Q?4mFykoZxxJCKflOcz66cHOqiXFR75m5PH1Tq/vljbDfaJv8moyoaC72jiSz2?=
 =?us-ascii?Q?hNndj9W05JzxHQXkC9bgC/+ui9nETcwCSBYfIEiA5Zo7vAHeyIBmbvtxLZfx?=
 =?us-ascii?Q?JOVH3sniaL05jnxw51FGeqWCW93UORzfA6S7WO/awou71HvSOaGWl2o0Ti5T?=
 =?us-ascii?Q?jWY/8FZze/9roS/LUVQO7a5Va/MEGhQdYfOqj3Knu3eECex/IYsdtdxJpuDZ?=
 =?us-ascii?Q?FwQNjoJ110Jgft8HkigrGIjJdVsyHIF6zUTjxVh+eWN3boVNqPCbgdm03kmZ?=
 =?us-ascii?Q?JHWT1rPxjBwGc84hoa6s1NniXsYowixpETCYQJdp+AkQ1Z+JOcYY92GiqvrV?=
 =?us-ascii?Q?eRxbGxI7DxIblfSoZNs0gSJ2OakckcFub0QgKn3qaIBxO7Q8SmHELokBje1P?=
 =?us-ascii?Q?n4vZH18hR4OsEGtFdSecmBppHUy0ViltX1cG720Tz0p9xfXjQqQoYCRPUpYa?=
 =?us-ascii?Q?GPb2WmBBOKEYnmqrS8FxIs+AopSfkV4b200KbBoLRCwXzsIYIo7f9tVPn5XP?=
 =?us-ascii?Q?4EKahwLPP+ktN35bzkEixkl9fWSSWRdDU3upbKYlJfiIht9NG1zDYOZFV1mQ?=
 =?us-ascii?Q?ymRvSrKCTXEyxSFPNrplw3Wn7gWwGgOfS2uUvRmK9qR5d0rJPn9OvijJniSM?=
 =?us-ascii?Q?Bowg5i/0zcsjewuXK0ULwS3TzJo08qC4pwds0SHvoBJ3ZbBNFpsmZzw1CJlC?=
 =?us-ascii?Q?zlT2EqjxXh25nO36ljmq7k6y4yg5E8hnJr6tFmmysekIY3Gkqn0hxkEJIKih?=
 =?us-ascii?Q?9Fif3Yy2QA/jHFH26UOEAdZcTS8F71DMjjE2bZHirG6Tawr40OymB02K+8sG?=
 =?us-ascii?Q?Jo3oFTEWtTbT9UYZzW2lPXGEEioBKryeduHCTb7V46+wAPGF0vCm0XUj3GME?=
 =?us-ascii?Q?+ZRdr6JMCUtB6kTNF8f64eCXDjA/TgU99qxrUK2bgM3C0ho3MisDl7x0Me/Z?=
 =?us-ascii?Q?mqevgyN1yGBTmjxPXjvmnjMNvNSrQu2q0hgW1PI3a5Hbvro72RCuBTvSXM7p?=
 =?us-ascii?Q?DEAik2iZmkNMQtqoWBmFfnE234C0jpT1hW7iF6fxqvHdhlJDVzBG0mKbOa01?=
 =?us-ascii?Q?0LiwiDxKck1YX7IMjwEeA6PwIOCNvLZvJtxiwYrZ/Tzp39eM4im59e3yoLpN?=
 =?us-ascii?Q?biCtNf3Cq2g7tluSYjXOOqUV3jH3v7eVtbCnVZyxBYBNHKcrtO5GFJMHhFwZ?=
 =?us-ascii?Q?fdDRhVLC8d4ZU3Nkib3cE31dWuyHLLbvDPwp7OSCyE9hUfpO5VLcmATzo5gL?=
 =?us-ascii?Q?jsqNS3tsJkvmR0bNCAyV7hWKemRrJkvQHdRlZ8bDc+tWuYuquFJnj7rilY+/?=
 =?us-ascii?Q?tLGES4E9ZpKg7OmFO83dM6+FpAP6cwmgxUonLx0ZfnwKRH/ByP37vCzx+YHW?=
 =?us-ascii?Q?OIjp/WJTCTWJktflIQBCZtRieBEHHcAYG/NC5gxhG/g3r5jStpy8QeFctAb3?=
 =?us-ascii?Q?9sMqwGeOUd8R4PBR7xeK+pObQhotq8pe6WhQEiIjC1xwPohLQcwJmo0qbKEa?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a129ec-1459-49b3-5c98-08dd3527b619
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 05:44:43.2936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pVl0zV8YoEFocKu2RZB+2jhfFTvGoR6BSrsxtQtcnbSk5WfpqYS/1j+1mNIuexf0N7gyrpfcZOiaDMTkPJPx0R+OgjgPkN9xiVMRfU0s4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6811
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Alistair Popple wrote:
[..]
> > How does this case happen? I don't think any page would ever enter with
> > both ->mapping and ->share set, right?
> 
> Sigh. You're right - it can't. This patch series is getting a litte bit large
> and unweildy with all the prerequisite bugfixes and cleanups. Obviously I fixed
> this when developing the main fs dax count fixup but forgot to rebase the fix
> further back in the series.

I assumed as much when I got to that patch.

> Anyway I have fixed that now, thanks.

You deserve a large helping of grace for waking and then slaying this
old dragon.

