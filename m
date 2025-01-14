Return-Path: <linuxppc-dev+bounces-5201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D856DA0FDCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 02:08:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX9xX4j7lz3bxR;
	Tue, 14 Jan 2025 12:08:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736816928;
	cv=fail; b=TSkNL5zinlltQeI8TjnNPhP6/mGfb1z7rpZdGTrdOdUlyKfH4aJGT3+rBhtqSbH/MVbjUykVRrIk07VsBs0/EXRaLYhsbgq3TIu2OBPtVUCytoe/KrCp3T/I0WOHT+k0zjRUpvadX31GB+kJp0xLLzC8km6wWO7jS6LnqxbbuZJsR5l8my1sxcQ+eOp6/oz+NJuCWKU0vJAdjQn3ibKrTkZMQPa7nTRJ/LdCM9vp7LSqCn+RR7AJ5jbuoKufRLigIYei/ZqWCvlmOKjTaGJ5U0P6BWc8r/V2USa/mAflFb+n/77Ecw+airm8jht2UnjLUCgZfwE1OgN9HaFjotaUrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736816928; c=relaxed/relaxed;
	bh=VYIewkt+XLCqz9tx+6mQrmlPPpI0KOzL4rtZcomYm9c=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PNHZWuxAnWk6NZ2C+8p88qo70sFNMBT5sLcN/rNMnpqWXgfooE8y3oojCRE9SzzUoLkpP7RCE2kCcAVD0F0/hATCuD+RS2HaLYJsmZ71mCTDOq4KmBUiTC14T9230CFrCG1PUpkIW5uFvBfz+jor2toJMkZcCR1BE0X//PUNlfKAC6DsH/vu/Zx9zM96tEgJ+2R7R85rsVZGiyErXlgm8IEeYQ4aanI3QXFg/koVn1XakCsnGztPubesNMf0KP89SKC+8IAtolNFH5UOws5wEW23yDEaJ9+4aYVXbEHj7PpNYpDSzEdwlvbXfBkrRyp5slpQ2spRRzKqXc5BOjJX7Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lhnOuFHj; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lhnOuFHj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YX9xV0m08z3bvW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 12:08:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736816927; x=1768352927;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HR2ADVwXW09JCDOuEqErw6abh4LescFw/Bx71Qw6iIo=;
  b=lhnOuFHjKIAMN97oTvR7TebgLLeNJUg8PTxrvlFMJMVEYxXxRdPVWPQb
   S/qpmBfUoFOvrwd+Xg0m+GjNPgMlr9UyOrZmFoeuzD5vhBGxw6Ar4GXlp
   JW4a4M4bGlGMn7VvkCjHUFMad/pdswHfqRlQcxUlbqaGQoWOdQlAm9zAT
   NnZ+i84hIABWajFZr6hbeMa7thFyAskk6yPRKxWP+LZJSeRT4BY9dEp++
   ZmbqOFgax9e9p2A7WLpwECHGpGQZZa4CvYLgp/Wne7om/2T1k6KKO7wFv
   nPbLynrc+tg4HPuVuD1Gis3Hj5Ak95ylW2H5RM8AuS+cbn+ouAUaGVBiZ
   g==;
X-CSE-ConnectionGUID: d21xrxZtSI+r9NfMgtv6dQ==
X-CSE-MsgGUID: sZSkGg7iQ+O3+/Jov7N3Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36982463"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="36982463"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 17:08:39 -0800
X-CSE-ConnectionGUID: UcmAwjGVRvOBKwl4SoD9qg==
X-CSE-MsgGUID: gcGX7QpITJSf0SHi6XFbVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="104732910"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 17:08:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 17:08:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 17:08:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 17:08:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vm9mpSA/dFfYq/XY04rVzNFlQNrYNr+FT2EWbs+Xx890syVfLkMQvpm5I4jmozlCLryefe7a+uBB0BOfFe+N4oib6IQQAP535EVPsebBY3NJQf7q2PrwGa7yGxywjc6Rn8eh5k6/g0LS1vPJ19wTwMxPk8AXw250v53M9+bJtmpwnVr8013v78N+9ry40shVuTMZ8XvPb/V5waoedhSTeh6Wf332k1WbLVEfwXhNpCulDLUR1C+/mSnG8Y5Ai7T5FXXoJe/DmOjSJEx52b03Uk6c4xm1bCmU1MmDXup6jQEDb1PHaivGhpTC/fo/lCI1tJXJJqoI4qrgQ4A7VZe7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYIewkt+XLCqz9tx+6mQrmlPPpI0KOzL4rtZcomYm9c=;
 b=xq23JIgcfJYpfhntqdVBzQ2GKtSCzKZldsDAnboiPk5tKeOH7S7o6oidgpGfBBaHeti1fjj22WMtvaBxd5MW0mfwJyxuhf6xIqsUcuE9/fcMIs3i/YB0OBaW+51TXdHRm3XcLEzi1q63/omiJ4JeCC0XCs0e4974ShAoJ1w2mnZzJh/qTZeKACXzWu/gtTAymA1b7em9P2RB7OKPgNdndMlGmJuPU1Mf7B4Opc6ni5LauK7GwkDA5gSd6vc3h3J+4EAmE7lFplLKEayFGoJ0vcJBBnbmOvryW9jqcvkLgpytrNGrx562cV94U0BPGFDQpvzRLVh7utp8Q8viNHBDPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA2PR11MB4857.namprd11.prod.outlook.com (2603:10b6:806:fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 01:08:36 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8335.011; Tue, 14 Jan 2025
 01:08:35 +0000
Date: Mon, 13 Jan 2025 17:08:31 -0800
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
Subject: Re: [PATCH v6 12/26] mm/memory: Enhance
 insert_page_into_pte_locked() to create writable mappings
Message-ID: <6785b90f300d8_20fa29465@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <68974d46091eea460f404f8ced3c6de5964c9ec4.1736488799.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <68974d46091eea460f404f8ced3c6de5964c9ec4.1736488799.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW4PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:303:8c::18) To PH8PR11MB8107.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA2PR11MB4857:EE_
X-MS-Office365-Filtering-Correlation-Id: 2884963d-bf2c-457c-d2f0-08dd3437f8a1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jzGwgLjlp1/3gZwdW2SD4pdMm14vUJPK/8a5m5LO5NH6FKfwBF5L63kG78yE?=
 =?us-ascii?Q?5ZVSxJp0vWAPCM1JCOrjq50cch4fds9L26+cU2LZaFKz/z+1oNZiyPCpxG75?=
 =?us-ascii?Q?rO9B2wH0b4qFNILbuqfmxlUKjTgKaH332wQ6PpIin3uFRLXIOjGOPcNUIucP?=
 =?us-ascii?Q?+ojazEY6oIfmtzgeq01KreWeL+zDWCuDjI1CpF4YfIivNRespgQBUUzHghFI?=
 =?us-ascii?Q?pd61q/X4P6E+pT1syi61RSdTcsnxWPQthctuiF9eRg5rCTehRXH22YHOkQqr?=
 =?us-ascii?Q?H2g2P4q6ZayjVzxlK+32keoUkVRj3vSYVVO+V0k/NRXMTTDJ9oJfCLwjDlkU?=
 =?us-ascii?Q?lDh5By7OJD/B+sBLcqCDiB2uwporm3mqA8Bv3vVAYGQbg9S/cXfMGskGDQwh?=
 =?us-ascii?Q?SRjudCm/+bXqWFJUmmDYRS1ssSXbt2j7emG0ix+ufUTQ3PEX5LF4a+Y7mRgn?=
 =?us-ascii?Q?RXj5hmXJvoB4SvY3uhBx6Kasuye7e6v1yMfuDuVJ7gjeSWyA4HEtPd8+929W?=
 =?us-ascii?Q?VzFTl5inBL9gJFEjLV3gzxHnXn/SH6BTTRJk9oAhkm9S9b4r/iafEV9Hwto1?=
 =?us-ascii?Q?Otm41UtdSrJOr2LkbQHJMekeUOTGs6lYjvcqHCEYE/FUsE1Z8QXa4/hyb8yr?=
 =?us-ascii?Q?70I7ENPe9fNXv2zGiNSQQJjDhCxRyp2YURpF/qFtx0jK32abhI9JR0WljVUk?=
 =?us-ascii?Q?Ipvg8/OVCu6Gt2vhRvBi8t7kt/ni4LF2PdKvRQ8YuTv6Wg+Pve0yGvogfoD3?=
 =?us-ascii?Q?zoO4zYNzqJWrve2n+9gTsqXgYuuH9+OLASbYCH+Avx9V+2qPr32W18yxsRR1?=
 =?us-ascii?Q?hu0xOjoVk6axIUVCglu2kw/8FL9pv4js8PvbXuRPPD+PIObW00nP4LpMIbun?=
 =?us-ascii?Q?CXenyjK7QHvDtHzWBbvga3ttQlMiJAChBPkCb2MlP3BXmgafSy0MuCA8fIXp?=
 =?us-ascii?Q?kTiN9Q2IUnKOTNrO6OEdP9C/OGFjf6kMgsTC2gwsbqvm1DwNMSrePBhFF8vn?=
 =?us-ascii?Q?p6aB1R1FVHbpdZMHggF7RkQNzvHy42dk5T6sipJhJWgEEznE9KMT0HhwUV3I?=
 =?us-ascii?Q?3JGqunRdJbK2m9Cb0HARiKYpSJ3xt0k7iOztU4LFu/q07AX38AVomVZ9SJ9k?=
 =?us-ascii?Q?Lwmh+mqWx41EixM4CLOS1YjkiG28ZLQmBi4DijMIp//XMEjjKUXWWb8KIH7+?=
 =?us-ascii?Q?eKL8ceO/Ofc7TsjPrDQWcIcekPyxBJX3R3hyPoqg2+JV+yIfon3cyq7T22l3?=
 =?us-ascii?Q?U/v/ytyx8noMv7/LvpebwriXkeecilAslPReS+vHjCRpzJ7S7znxPeefPJVr?=
 =?us-ascii?Q?/NahUcMRuSD+yli4VfVi578kPEEUwq6fQNxJ/bvdFsuWtxjx8Tw6EWq/m4mQ?=
 =?us-ascii?Q?c3sqQ8xng90JTkz+muDxpfqA8hQl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VaeNEeWr/vegVYFtp48ecFuZLfwrE3PMi61y6zsiafWD9eqsVfxIClHgkyR+?=
 =?us-ascii?Q?Z8fWsJucENUpj0uSqul8b4MoLwDrz0qYneJT1ZMaPm9LQywqxRR/IQ5GxLLS?=
 =?us-ascii?Q?kVNcJ6S5B8iQa0ju79Fw8xgt2USKpmTimuPyp0JfBka5f2a4sWVi0f6KbVn7?=
 =?us-ascii?Q?9wzCZYTdcoP9k0nUeRaWdnUgOZd0Ztp9bWvEzYi0GJCksYB2X+pr+oyMfmsn?=
 =?us-ascii?Q?VtCoD64iAuveofHzOR09D+UTPwp35QgoEIovVw2pvE1aB3OOWaG2cbCKeofp?=
 =?us-ascii?Q?O+zArJcLoOa15x06vM1ceJxUTnqjqnWM5oxJfe8r8BSGvD8uMLwREEFKIuTH?=
 =?us-ascii?Q?wMGUCPDqFyfvBbTRNJIqo2O2X1JZ07lWV8HXhbIJxLUamZoNgLFFdF9iHm+g?=
 =?us-ascii?Q?ojWbr6kF8CAUim2f5WQzY4W4vSxbD0cOyoHj3IBqF4OEdAUvm122p5mHGmlH?=
 =?us-ascii?Q?sikESS7bj7eZAB3UBmhUu1wGJs/580VKx7TiDwV7vNNdAlNVOZcX/Gs4GIYG?=
 =?us-ascii?Q?tw8sSG69MkDh2C2pF9qzwHhL2ePFUAlzTg2UVwOvTpIMZS9E9v2IohEwpaID?=
 =?us-ascii?Q?MRy6Xx0TUbebo621vmhQugu1d+ZlTAcnoJyY2aeHGVDrRoLS3pTzanokSVkR?=
 =?us-ascii?Q?WYrbTQtCeVd2lE2dJYFDz75cKaSZA9cWUjNiwgOQuCUgIkXedmqsRhn2ueH3?=
 =?us-ascii?Q?M38kyHAqLaIqvVAnKsMyHIarF0nwfF8zUwST9MwBJfMcjhTO+at7OqKuwP5/?=
 =?us-ascii?Q?KmdQCrJJAGKHt1iSmHYAbqT6TWU4A8mCXVccnlOx9SwOtWmfbiVCphdYOrnE?=
 =?us-ascii?Q?zg8GnxFyCPoj2nFX6dRibsj+Ue3mdPnllfhUvy0BCUKggeQxw2NMyIdzWgKi?=
 =?us-ascii?Q?Nu0F78+jWZWqLmFh3kCQzzldnk8JDn/aTSGljqx+MmPy/JLLxlmHGKeG4Brt?=
 =?us-ascii?Q?uS0Q4a0ua1D0XBFuXQxX/o7kA7hhvkdxWKKXGlmhtjBuVTK3RKPRGaYrTJ+M?=
 =?us-ascii?Q?52MnVH1mQLeo+e3F0C24a4NkbIex2SqLXkk0UCimpQYH7FjgMJR9ZTktzrif?=
 =?us-ascii?Q?aNyAn3wF5wN8jE+vpQwmbaRXPwvEx5UkZO/xc6AdMw0W94V6eb/aPHqE4AOm?=
 =?us-ascii?Q?wArmuHmOT+i/zVSXxNg2vTs88+X9WQ7ceAif2jklQvKy76ee/kUsANIOJ5k0?=
 =?us-ascii?Q?TcCSFZmzI2pR+ynLUCcsJlngCpfdoOeB3MHzLsoUzxgrmBapnyizjhW65z3g?=
 =?us-ascii?Q?fPNiNhXbK+M2qCcWg12hEZTCkSlqcI2PwxWRilqIHWXG4ltfvsJ2dixAeetX?=
 =?us-ascii?Q?XbzEu6k/LR+SPLvHCq/xTKDGk1kNG1wPxXCVw22PNgtLl5Biig0MB51IJ9wq?=
 =?us-ascii?Q?06X95DOPBXdKC15bxMAo2CreSynGvIK4qzy0t7YmsNTFBEY5i+3sBoP35w1j?=
 =?us-ascii?Q?2AxtNIUvEpIKvOa3dB0IVu6956maUKd3u6kGmPGm0+QmYLW/pqImVjfb0Kfs?=
 =?us-ascii?Q?0eoTHGfl6rXvOOWxWa7j59VMRhuEQfHH55UcB0jiuvdMDIgAzbJawCXdHZE8?=
 =?us-ascii?Q?X+XlVZmKOqLdXWGS9Ap687GOMYENbvTj3MXjPUlAea09fKLeSHwWFgJ/FMRv?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2884963d-bf2c-457c-d2f0-08dd3437f8a1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 01:08:35.7252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTRHqxpYizgGFGqEMo61tKfgd6nLQnjTMWK2HdyVnIKI2XUMe0zd6kPtcZShl24JjWH3lwq3p01zKYxx6VweZNsKowcTxkJ/o5mM/3jbuak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4857
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Alistair Popple wrote:
> In preparation for using insert_page() for DAX, enhance
> insert_page_into_pte_locked() to handle establishing writable
> mappings.  Recall that DAX returns VM_FAULT_NOPAGE after installing a
> PTE which bypasses the typical set_pte_range() in finish_fault.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> 
> ---
> 
> Changes for v5:
>  - Minor comment/formatting fixes suggested by David Hildenbrand
> 
> Changes since v2:
> 
>  - New patch split out from "mm/memory: Add dax_insert_pfn"
> ---
>  mm/memory.c | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 06bb29e..8531acb 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2126,19 +2126,40 @@ static int validate_page_before_insert(struct vm_area_struct *vma,
>  }
>  
>  static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
> -			unsigned long addr, struct page *page, pgprot_t prot)
> +				unsigned long addr, struct page *page,
> +				pgprot_t prot, bool mkwrite)
>  {
>  	struct folio *folio = page_folio(page);
> +	pte_t entry = ptep_get(pte);
>  	pte_t pteval;
>  
> -	if (!pte_none(ptep_get(pte)))
> -		return -EBUSY;
> +	if (!pte_none(entry)) {
> +		if (!mkwrite)
> +			return -EBUSY;
> +
> +		/* see insert_pfn(). */
> +		if (pte_pfn(entry) != page_to_pfn(page)) {
> +			WARN_ON_ONCE(!is_zero_pfn(pte_pfn(entry)));
> +			return -EFAULT;
> +		}
> +		entry = maybe_mkwrite(entry, vma);
> +		entry = pte_mkyoung(entry);
> +		if (ptep_set_access_flags(vma, addr, pte, entry, 1))
> +			update_mmu_cache(vma, addr, pte);
> +		return 0;
> +	}

This hunk feels like it is begging to be unified with insert_pfn() after
pfn_t dies. Perhaps a TODO to remember to come back and unify them, or
you can go append that work to your pfn_t removal series?

Other than that you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

