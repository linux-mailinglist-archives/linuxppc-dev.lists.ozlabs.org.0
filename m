Return-Path: <linuxppc-dev+bounces-9156-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B370ACE7CE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 03:38:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCRt43JTdz2yRD;
	Thu,  5 Jun 2025 11:38:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749087500;
	cv=fail; b=LRsaHwCWGw5ceLk+vZQa4quzYMips1bCJGLBeov/AIx/LK3c0W2+c75GRuINjyzeqPQd5BquiEnp4z0iF8wE+VMiUGaeByMWrbBXVzVKTjAud5En+kPP6RER1vsHl+dogA3qZ4vnsFO8aj5yh8T3WR/8/klYPpdFO0YbYGxHdujzwiL3AdUWNQnycoE/StucmYWefY4f6nsnA51KqBFsvvFyKWJIP0fsqlgMHu4fVtYjE7BfCqcKtMMGd+gLTzy8aCjukNe+8tZ3Xocnqphs5aKep3FlR0jaQa4tglCSHJK0lI4T4W4qqxsPbGksPvD84OfXNzAcR9NQNcapIa6nFg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749087500; c=relaxed/relaxed;
	bh=TgpsqDkxcn8QeUWsScfwyCPAeddsdW8Kb6y9zFKne6s=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L2WiJR/nz5NOM7PA36V5JRb5Q+L0D18US/6bQdnkfThmQmLmBeLF73vhK2yLvTPHIMkAO8rGfGi3X9/Rp8+QZrCpaflBt2eiADZR+jwCVZmu+4LEnsCaHQsAW7ixyilH3tqa+PjKw3WqOf3p/vMpGOR904ceWz+owuveVHs+ySm6ftYFlGls3CV1c1/BG7PKSBH81ldOKPM+fIoItugFFfXQYy97nFaIKRbpxrRqyld5qHD0LOOyMSnOTQz4J0SGqEPD+IPPEoBCV6w6hwsybVGCBp2tm88hVmhjTojfpPkCK0SoOIMghgaOtYPFreY1kXcFFDRyIZ1+D4iWilCp4g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GQg28hPr; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GQg28hPr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCRt1441Qz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 11:38:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749087498; x=1780623498;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=AGj+aeqjKVAFivXiyiJYEs/2sAuUGl4LmvFhsC/o6pI=;
  b=GQg28hPr1I2HCqUFgHr3w160JsjC2RteTlw0nR7CGZqa19m7Ngpi6jZ9
   O/hnf68ImsaKIKfhl/VRjs9trsXcALD/5i6XPuF5SvUMFYxpJRhU1qVzO
   +XK+Iz4PvOyEzGV3IdTT3UL0Bu9oGumkbUdVPEempS9Wu9qwpaItnrZST
   vxKNqblc1mY55PI0nQKwHzGkzda3ugeofZnlKmfWlEtDjxcf+MruDJG28
   azjzJ2vvMQppNrXQJWdzd+A0wvBI68WRdE7cII6ltJoPzNfC3dFbaHks4
   1OfgLg/SccR+G1IeSlB7v0Ia3QPRHh6Tri3x+cxnCkrnZFMldrSkeB2ih
   A==;
X-CSE-ConnectionGUID: GXXTaQNRT3iSC5arXsNwTQ==
X-CSE-MsgGUID: 5kfiBcrzTXWqrU5ZuxY4Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68627995"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="68627995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 18:38:11 -0700
X-CSE-ConnectionGUID: zHqGCrLLSpOpI3zP4vasbQ==
X-CSE-MsgGUID: NMQpJrGcRFab3SXC49wmUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="182562649"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 18:38:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 18:38:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 18:38:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.73)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 18:38:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUJGQW2UqBEkQ5bcdWjL1KmtnqE3ObJGXoGbf+HQlzBtapW4Rnc5J3HFx+oYMZj/2knfMYKG6DFUGQ/hnq6/y9hbB4oTA/3WJVVNnJWXlT4cgGOFjotodFyMzFa3F+r71OSkeCwN5yV6HY/WicrPVLsdyQELkGT5qRMHD8US9lEL4My8MQMKZKWkS0qTaOLgGiLEkNyK78GKGta7eWBPh51kQ+NxATwuPDa2AfVwb0R6OloqyrIUCNheDcCXZWzaLrRa3vzGB6REXOIv988gj7C6OfigIZqcoUdq2JOdM73Is4ri0eOevMC19e//968MxJ1X/DVE6QMGLGt09yd6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgpsqDkxcn8QeUWsScfwyCPAeddsdW8Kb6y9zFKne6s=;
 b=VRVmybhx3ZvsAz+ZmFjOFlUH3nprakKSHjpeFPoJw4Flms5JSJ14Z+n7tbWs39ENfQcpbT0rVQ13EPKgP483C9q8sfmXV+iIwMr7q6etVq10CIzfVfVviroYoW9b+1DtaSRhu9guzXmeFYsDFPf1YD8IPzxiOII4Rum4xmnPh+/uX8YbJzKAwOnnVWzJgzUMFgqvP8kbX2NxwDPDOj9Wrfcp8DSCzv510wHKpHOZcL/wi1sxMmbuc4rf3AHiyrz5x48Q0W5jt6JGyPgwD4Y/39B95M0KMYoRiJn77LTfBSRzR3joPdsP3qmadKFv92S8Ucwi59P7K0lIZLSyd6x7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 01:38:03 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8769.031; Thu, 5 Jun 2025
 01:38:03 +0000
Date: Wed, 4 Jun 2025 18:37:58 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>
CC: Alistair Popple <apopple@nvidia.com>, <gerald.schaefer@linux.ibm.com>,
	<dan.j.williams@intel.com>, <jgg@ziepe.ca>, <willy@infradead.org>,
	<david@redhat.com>, <linux-kernel@vger.kernel.org>, <nvdimm@lists.linux.dev>,
	<linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
	<linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
	<zhang.lyra@gmail.com>, <debug@rivosinc.com>, <bjorn@kernel.org>,
	<balbirs@nvidia.com>, <lorenzo.stoakes@oracle.com>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-cxl@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<John@groves.net>
Subject: Re: [PATCH 02/12] mm: Convert pXd_devmap checks to vma_is_dax
Message-ID: <6840f4f65a981_2491100b3@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
X-ClientProxiedBy: BYAPR01CA0025.prod.exchangelabs.com (2603:10b6:a02:80::38)
 To PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
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
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA1PR11MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e15110-6b18-4268-f4d8-08dda3d19c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lW5bg1r/mhCCdlV69bKn9AXX7xxpnAYFzeJLow9o1rRGqgXSNyWSB8VClRWx?=
 =?us-ascii?Q?UpvjaL7oGaIY321vsxUrZiDIyE6/69myVAhFGryd4lwGsHWNusm9vF7xXE9F?=
 =?us-ascii?Q?LS4kyIylkaUj7eeo8ApsRzofO75PXFj5BtXXiUMlqQFL6iJb2LR8JxyZdn9P?=
 =?us-ascii?Q?cJWuBMT7SJxCMKujt0dWdOJ+G0JmSfbQCfOHNqY9tHwfN9/4lfIA6HqwEiG5?=
 =?us-ascii?Q?M5DzqHlSp+XUBOIGVOS2dlNteBeRxjPQLp2u8inbRrHbKBLHcbPpiWqfA9sQ?=
 =?us-ascii?Q?3eXIsNKPS3OE7Z3AjkSVLuIoquxsDi0aYNyuF7MMkr2MCEvKOsORxWUGTdyu?=
 =?us-ascii?Q?9aWh92MGcQKUxuzrzKY79IfDaTHMlNdbZuOxlt4n9dMdy/eEJNbI/Yi7E7sI?=
 =?us-ascii?Q?3hWX1c68Rg6ogXe3qN1+pH/tiPBSrrPg0LNypLVp0910eWrNxjT8X4uadLzX?=
 =?us-ascii?Q?iDg/Lp5fb6h8BvEPff4SSoQbGxeImoa30QihVmXYnuB94exnPjp0vgrJ6oIB?=
 =?us-ascii?Q?zPXE5dY9dqcBU6fVIZozlIh88fS5eLq3j1Q0aA2znOgGGZLENjAGdC8MdUEQ?=
 =?us-ascii?Q?HJu/iedy4w7LvvPfN7KYu0JyQTl5AL8dxD1bbqc1AqzDJfwi8wE983amfQXC?=
 =?us-ascii?Q?Kq6Hv8AjAC+7FGcKL5OMT/MIObAqr70UxiOBOPIKtcG/ZMXf4grU+6u7XOTk?=
 =?us-ascii?Q?TQEQVQenEUtaOrjchfYMGChPMWmE80Wodk02EfRJ4I49aBTqMts82Btn0Iw0?=
 =?us-ascii?Q?whCR/+QnhCH7xAb2V5DH6YL/aEYPGlIig0OTf3DInomjcTuHx4Duu3mmwRzA?=
 =?us-ascii?Q?JBluN2RjgK3Ih5gZvNboCd/iUmHVLnPM0DwFkz9l1EhNlDKUBzjR7+uvtK4v?=
 =?us-ascii?Q?YT1pJ6ppSqNrYB3ntO7bw91pWViqq8OfE7QW6LF3AWAV0BxhLl9+rl182rYA?=
 =?us-ascii?Q?0bnSNyE4FiMq2hdc9pQL/3Sa9eWyT/LsCTqd66TbD70eOEH0fn3y7tjEVJqJ?=
 =?us-ascii?Q?nEDAw93Xo89lcE/Mnynez27KDzW5BBs7N4V9+/ulrkOKOmxj/+SI+wt/tA7G?=
 =?us-ascii?Q?ukXM96XujmBzXVu3LWq8SmwX9WahNM/s059QZ/I/HudhtxN6ki06RJKOKbQn?=
 =?us-ascii?Q?6vAAfaBL5aM6J4rhAM4gbkE4cH4P7IrqxQb81BeIOgN/dSWrl8G+I9T6NwN8?=
 =?us-ascii?Q?9Ke+bTeFU2apSBxqn9DmKtN0tXEEWYHXbXHp5Ypogwa0OHELNs0PrIgt9Elo?=
 =?us-ascii?Q?zvMduw2rvzExYnzu6Y3PouytOtd5GWvh7mJUkmld3kvKlEZlr9mX7Po/cSzZ?=
 =?us-ascii?Q?+iWc2Jxq/oLDo05CptSiieOGdwROG6FzllXE/qDQYajNgJZ679aDJjVskK8L?=
 =?us-ascii?Q?/UmvASaHnVODUHSv/H9Eb3r+mUBATfxAbLhXb+7NMlI2FJWzQ3G/5f4fZOLU?=
 =?us-ascii?Q?ChrH0LMTJH0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vRSxZ10/swKa4CHSWm2C7YUtBe7g7XKEGAKjq3F3iJXRG77QAiI1kVNury2b?=
 =?us-ascii?Q?J5cfaKTMekxqtN9NfyLAk3j3G1DmXylcSR4AB2G7c3ArlVWSVf6zyEL9QWzD?=
 =?us-ascii?Q?giQAUgPhZqsYF0+wRMc6C8N4KtSS8Nru9bh/SjZUNEv8MM/fGm8LjKAxtM+Q?=
 =?us-ascii?Q?oFGPJ3+DA/80W3JpTZDMEF6rvBqaFPCsgDhUHylNBRtqUSfCEEpl8GmaWIVX?=
 =?us-ascii?Q?IWlO0J3mQ8sLSg/Yolodwy7Bzj+BVd01cgQJinQxVHxPWR/OErT5m+Ck1Fjb?=
 =?us-ascii?Q?Mt2BWcTez7N1LvwasrFnOD78F0Ar2zW3Gd8eZUHwENu8Op8b07MTDQoiGi7s?=
 =?us-ascii?Q?qQWEeUNovUSOUtSep5Q+6qrt86Ug6KQeKNSW5K9XojShUdWLWBf5ILbRp8Ys?=
 =?us-ascii?Q?hr543k5r6aCadn6FbcquxeZYaboDOSHlBw0cb+mauuC0BPYFGd0o6HKy5kwh?=
 =?us-ascii?Q?wBpZ9GO0s/QFaPAAl1RxHfaczFzUeJYVyO4mwCkz5qv/9PXQNSgeqgZOf52W?=
 =?us-ascii?Q?etK2NnKUVDythOdbMlQeZq1i8ZSoK+Mj9RaqEh0vpha1xRI1nKanUSSe03wR?=
 =?us-ascii?Q?we4+k+jUm25szkirV9zGEIl+YZ2AgOENn/83o/vsaFm1piLHJ2aKrAYMIFNc?=
 =?us-ascii?Q?BiwmVxPLE6uX/8rAKzcbGNeclUBRoRNABcsUefybf38bkMF8N0t2sWclqlQt?=
 =?us-ascii?Q?8wOAOCtoPfLkxcgShMwc2Im1uBG9/b9Uynmm3Tgc4wIy33eXiGQ2SwJGwj03?=
 =?us-ascii?Q?eBCsyUJJc7EeHy+gO4ky2BS2OrdOyqRrNHFQLMW86LQSnlHr2onTgr2AJvTS?=
 =?us-ascii?Q?ZwjGTbwMNTeatAho2zkiGm8YCLVfCFouS7ZP6jezPYFXPYKxOmu8TOGyHUuc?=
 =?us-ascii?Q?WDBugLUx6MVtGN/13EggV6gtVgRs/BBQ6N7YkUuaS0IB5zbOHX1GDzbX7y9D?=
 =?us-ascii?Q?fFhc1GX+ppC+ts65r4SOfpr7Vn8HBvj5rhFz5CHXwq3ZA78vqjMOC+AwI5tM?=
 =?us-ascii?Q?FLiFCJ94zmxcMLQMfq4te93ljLYW+zPdD3RiNtTjVNePSpGdDpxczQ7ORM1m?=
 =?us-ascii?Q?/RgMPwhqkd6DZ1+tQY37N2hTT3wQT3v2o48AontVU5dFTtVfFEpvsA22PCZQ?=
 =?us-ascii?Q?XGujzbDRlGOmXnIaTJxjjVev61z3uHUJyYPXH8gM0Fp89olRyCGpUiOZxhtP?=
 =?us-ascii?Q?UXHadCr2El4vIdy6a5kr0zyeYJHD+wIKoORjzaXlKSylSB3X/bbNlHYPz4Il?=
 =?us-ascii?Q?zqxKMvcSLsm53ZcZgCmMfHNogGIEmx/XEHYYryeya4ugPxPwGYUGk6l/1fCh?=
 =?us-ascii?Q?GITDoK/8d42I8u9R/m/xty+idXaNkptY/BwUmZxYQdWK2RS1vjRFsCxRvFF/?=
 =?us-ascii?Q?xATNBOHz43Mzg0RrTJb6bGx4pj1n6OLbOAVLf6dWAoAVFYHf2Um8Xj3PT8gC?=
 =?us-ascii?Q?M4MPUku541WyU3+OlgHDoY8pwvzpo1dx07hziCGYT+SElxqJjPa/JadNsdc0?=
 =?us-ascii?Q?kThpYiUZkbwknWW3MkE5E8kwY3RLxd+tlVkepvLD+RUoJq7g63TJVt5Cmz4m?=
 =?us-ascii?Q?jTW+92MQdCILVBSaBNbdy/q+KLD+GeSfgp7dOKLyCPOoWRKRXwe9eq4D7ckc?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e15110-6b18-4268-f4d8-08dda3d19c98
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 01:38:03.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkeZN2X/UyCsf+Np3b+qWHCmILQEglBeCvzFdCC7hRBCI5NcnIZadQmyuNX4GBO8hA/cx1100G6EDJtk1RAtp5vgfOddQO+JdVqd590VbDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Alistair Popple wrote:
> Currently dax is the only user of pmd and pud mapped ZONE_DEVICE
> pages. Therefore page walkers that want to exclude DAX pages can check
> pmd_devmap or pud_devmap. However soon dax will no longer set PFN_DEV,
> meaning dax pages are mapped as normal pages.
> 
> Ensure page walkers that currently use pXd_devmap to skip DAX pages
> continue to do so by adding explicit checks of the VMA instead.

tl;dr:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

So I went through all the p[mu]d_devmap() checks and indeed this is the
set I also come up with that are implicitly checking for "dax" instead
of checking for "is this a larger than base pte size mapping".

While I am a little uncomfortable with the generality of calling the
policy "dax" in these locations I think it is ok for now. I.e. the
fundamental detail in these paths is "huge pte, but not typical
page-allocator THP page"

Also I would have felt better if some of the leftover places that are
doing "dax" checks but not updated were noted in the changelog just for
review purposes. Like:

"Note paths like follow_huge_pud and follow_pmd_mask also have 'dax'
checks, but those paths are for maintaining dev_pagemap refcounts which
no longer (since v6.15) need to be managed for dax pages. A later patch
cleans those up."

