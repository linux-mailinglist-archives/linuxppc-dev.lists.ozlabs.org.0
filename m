Return-Path: <linuxppc-dev+bounces-2531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A329AD883
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 01:38:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYlqY2x86z2ygG;
	Thu, 24 Oct 2024 10:38:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729726729;
	cv=fail; b=JBtfCRJOPXO8s0v+PAu8soohyYd+wDdzThcIHwD2h4pzhuVeDR3BdTaBbH0zg7MNIozcciZ+SwshyCBLsFdDxSZSHrmajPZxrGFwWS25WY3ICWccxHVw0NrW1ku77Oebh+1oLTCpz9rGI6Fgvattb4Edw9ewioCwjbFoxwhb4R7k4z7Rx44lynzydW7EILerC+Z9D+qqrmPcTVialJnoPRN7sI7aszWhVFLPReQuqi9NF1H/maDwTa09Lttwlo2iw2pSeW86kIt6uU91e7YAQgFTdkdNrQIzQEWnjfC9d9QzK3C+V4OdxqeABRRFm89cK+EFrSWCAk/2tv1IMX8AxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729726729; c=relaxed/relaxed;
	bh=1T5iVouKd4kFeV6cF+BxwWcSziD4udw3i9Qxxs607S8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IvrbHXrQI7+oHmsLf0vPXN9e5WRSH09qGQVaKCuQ+S+/hvwu4aU/IeQgFgP7WpjGoCDrICWIxaLh1CnzsvsvqESHR8Fmt5E5z1nAz7NlMwu7jqCaZ9NXIX8GV8BJOzZrso6SkIkeXm9TW8puJTZ7hymQ6ZSo7oWPu/aLQvmJlFBxkkjF1940zsCE2QhhZRvfkUyX7qVbhVtAuVvrBomCthdpOUe0ifpJtDmGNCLn3bMl/dYcOIGL3wvYtwwWlI1ppu/VgTA7J5gUMy1d1K+yy3iy16M7pF0Yq0rWPQiAQ1tKT/lC+Efe6rO9j+Tzo/YxAQMmIpzQztV8X6m0mIclOQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D1C0vkfq; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D1C0vkfq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYlqV4RxTz2y8d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 10:38:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729726727; x=1761262727;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=GV/CvCxxZYx9uOoLaMJjp/MlTpEuTuoqbqLGXsyG2mQ=;
  b=D1C0vkfqolUnZPhN3Nvj9clBPZa3HvdkVRQlziUe/eH0oDakfOb+a+jJ
   VX/q+8de9BeL9d1wOan2mTpfmpiQ0Jv47O/KYYW4Mqq4MCEKm034oofuZ
   HYWQ2gdlU97ikxYRAP7ZdKCexYwOVY+nEqJ35MrxZEHfggCY2ba/we9aL
   rbTyJbg2ZZBipeCm1ZqAtDJrOdoCQ/BTe980gTYq+NVSmbeIc/tiHFqDD
   kfqHFJckAWkFJxBvaIiSClPL19xEw0Pg/pkARC5DjtBC5SLyOXuqZf6yD
   SZnsX+LUSWkb3Tx5ugBzlWE6BYEzAhxSdu9RHa84TWnwHNKLdC5t5hr8n
   g==;
X-CSE-ConnectionGUID: 8+mk3Ht0Tp2XDHCtMP8RQQ==
X-CSE-MsgGUID: Wj5kZvH2S6+AUy3uPacA+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29563579"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="29563579"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 16:38:41 -0700
X-CSE-ConnectionGUID: EsdqAuI9SYm9B2Lo5VLhoQ==
X-CSE-MsgGUID: K9mEBdz/SGetpXw4+PFzQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80830968"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Oct 2024 16:38:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 16:38:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 16:38:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 16:38:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxXpCSh/m47kU4TSJnwKW5Mw96jOcgh2XC0E2rGPoRntjKlTTytIf881TdJ4TpgiPkX9q8onCbnjOS3XV2XU2TugqkgADnyXUI72TQlLFZHfLp7+9f1abxcBi94nbQTZaWlKX5N/+uhWlD6ssR36yQV6VNdrpXqx2BCmZgZocjn7VURmZm6kWBj94VFX7HZmCuErChQ/njnCsJZxs5fDWt6LGBgV7FZ9pr3LhC9v6dEWDMZ+vHaQ0kItzkaElccVcye9dH5UKyv/VqI60wTLCs/toOhYiV5Jrf3yiSJmjc87NLDdk4sgtWHvcnAHzWTnUyUdMOpem8ux2SZ6Q7tEIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1T5iVouKd4kFeV6cF+BxwWcSziD4udw3i9Qxxs607S8=;
 b=K8dag2F5wiRh4+YpOqCMkYCsridLmINpBoxlRsuET/w0575gtM7QyHgVo7JsHK2wwwZAPjOkT322QQIoaog9POjSb25CGk3gJrbkABGps+UXsMKOdXkmlhI0tKybfoStgBWvQaxXugYQSliXcJ3H2P8a0/RhIzFtn+oxXtHwOvaxGnDC3MqEOyE918atdtJZxMO6F6vW6rUTtPPPSOKItaX7GbOc13Vcvmd6eD/hEYgdzL+TEGXn/UMDogk5zt+9n3fiYWjKynieh+3GiGoqbionAdGJN+TsGK1lWeLDXtOJ8hMJkO9YCycAlvY6hrq2rnUcEhA0Y2MBVwdQHWsXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 23:38:35 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 23:38:35 +0000
Date: Wed, 23 Oct 2024 16:38:30 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: Dan Williams <dan.j.williams@intel.com>, <linux-mm@kvack.org>,
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
Subject: Re: [PATCH 07/12] huge_memory: Allow mappings of PMD sized pages
Message-ID: <671988f6c0141_4bc2294b9@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
 <b63e8b07ceed8cf7b9cd07332132d6713853c777.1725941415.git-series.apopple@nvidia.com>
 <66f61ce4da80_964f2294fb@dwillia2-xfh.jf.intel.com.notmuch>
 <87bjznnp6v.fsf@nvdebian.thelocal>
 <875xpicsbd.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <875xpicsbd.fsf@nvdebian.thelocal>
X-ClientProxiedBy: MW3PR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:303:2a::24) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM4PR11MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: cb99e4b2-c0b6-4ec6-671d-08dcf3bbcff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TMDY8HZb/y3LgkYyTBBZLbckk+tsQbXeNcoAoeSXOvPNYrL+j4UM/x2Y5lF+?=
 =?us-ascii?Q?DMxxPeKx/cT4cMsefW4At2egNUoI7jnvauhhhDVWLtDfGaTq53EoHB/wIJ4R?=
 =?us-ascii?Q?e/nczgfXP1AYLmHbJ8PVSdN8D44clFOLeTEKc/Dd+Gxbj8ggqji5IJfr6tqr?=
 =?us-ascii?Q?iUcPqF9BaTW+xsfHJ+epaxFIuqiAcQNNZAAykv+GYp3JUM6Yvgy25L8SpD9j?=
 =?us-ascii?Q?8vNMdRbvjE0ns4DtQQsY7txQt27N8fcHgQvvp6oNImJihlpV4dDcdAqHPz1z?=
 =?us-ascii?Q?bSO6y8rbBVwyW3mFBsY437RTZ0VmVxVT07wimCTbajTr1z0HVNXn2KsWsV4A?=
 =?us-ascii?Q?ke8K0E24H44Bz/vqurjaLkkBJ4G5wfm4wQVsBdUdMA7hNwnwfzpCmzXGWH3b?=
 =?us-ascii?Q?Tzq95h2BMPvyyI3jO23EM3dL7Xuymk/RO2NOWDyVLrV4ND7AB6GN01KKicD6?=
 =?us-ascii?Q?FQW/BPvud+YEnCNaMC0hlR/NqJtNxbVhSrqOQH9JNVTTMO6oCwmZG8SDK6f8?=
 =?us-ascii?Q?8WgaiPKne+O2DEBJnFysftNdm8e91gBgjaJWijskG+1OFHpcS4ulRFQcFvTi?=
 =?us-ascii?Q?Ry4TwVm80wVaCPpMehI3Lms9BRwnzGqkLEhL9rkImb7Qt+zGp1TPLQpfH2tJ?=
 =?us-ascii?Q?/jh6jCgAUvmM6s5/6pLEQqKjEqDRJPzKiFh3iFpFR6xoHzBaH/SG7Pe3PBnV?=
 =?us-ascii?Q?PzOJc6DkrNjpadwrP0jWdButFt/d3WuqiLSM85K/Y35XQuHlgjpKdEycDNMr?=
 =?us-ascii?Q?p+jfO5+ZbZJfY9JjffeZBaxTQdBEXFptRvc7KkoB4KtNhN5di/9/05gTsBAJ?=
 =?us-ascii?Q?8jJGSe2FzeEOHmpSxgIaF493a/Z1V++kqDrO5C4tqIGIuGlps9fHPs59TafD?=
 =?us-ascii?Q?/K/1HOFTNqNdqOUr0w4vKQZZoP78IVZeXBoQRj1aH+ykB+G1y0iC9WXfq7ha?=
 =?us-ascii?Q?plj+PFmdxMwAQafEEmONsfqIJXEqo6ISzvVed0Uta29pUHP3vW0LpObum58s?=
 =?us-ascii?Q?0jyWGXile1A76Gmp6TRB0SVUydGxZkt8C1T40s7XbFCTJmAnArwyJMsKFa1T?=
 =?us-ascii?Q?kCkrLJJc/ch/L81ut+zo+YJGd5jILAJSv4KMsvNx1UkwO3Fjo5aNWdR/OroV?=
 =?us-ascii?Q?zQddWmtARCxY83Ehv2XtXnuuoD1y2CTWRm/DJhThoJjXLdeeOJZKgJj1a8SC?=
 =?us-ascii?Q?zfn1ae7I1hbSy7830FAmFB9oIYgziCobRFyq+mJwuaTPXFjG7GJLqkNlAs1F?=
 =?us-ascii?Q?gc7d6kU3my6qr3lAkY6FA9ZT5DroW8wZ+cOmOcUHpo/oZzfM0hurJWeouHRm?=
 =?us-ascii?Q?J2U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PA/gw3JqJgwCyzXb0jMMbu9OwLOn8I/S7YA1XhPnyWqDVmEFyC5ha9RxMQRd?=
 =?us-ascii?Q?jtk87dNjrwsDj5v7z8s70FWmUII6Gu8dVDL/LIS651fwC75zMc99R/bRrc2K?=
 =?us-ascii?Q?9XMNA7qa/kh20sN/2GcZOj8uaB9LvLo/hnKgIpZ+yW+kAZSFyW+wAsT+dRlm?=
 =?us-ascii?Q?Ki1knUJ45u6aHb9jv9zT+DCPASZq7uZzXkW7DSRWiZCDU8FWsRtlefCqhOLo?=
 =?us-ascii?Q?Nblz2GnZBiVsa4AulT0Vq6RVIPC6qn31s7VNGtx+DoT8Em8Q/erhRhfy0JrN?=
 =?us-ascii?Q?pUbVRXG470Dk4gawOZyR6DYoagA4ExWvepqyfzOEFx0JtrEHTkY+LgD4NSrw?=
 =?us-ascii?Q?qO9xE8pVUplrQv0smhMIKXa3vIsjM34PyfFmIyJNZzLORbOwKiOnn5mzQtHM?=
 =?us-ascii?Q?m5PZhMv83iA+3p2vpNCtW5OUNVJ/cEoDvytrYOR/okFfq5CpYCFhywgY1nyC?=
 =?us-ascii?Q?pnz8+m3Zuhqm80nuyQQy+f4hJYULGzQ1PSPbSdTAeshbHoZhXUhccQWK9sl5?=
 =?us-ascii?Q?BfbFys1VnTp46kHuNob+E94zjkYxX70bX+lZVerNvikWbxTxcQBDXs4PdG+f?=
 =?us-ascii?Q?UIaRiW6gWdF1RP+jCOYKFevqntC6ifnDnZkNOClNf4AYLG1TU0UwvKorWNdJ?=
 =?us-ascii?Q?VmxYygZ5F2k/PCG96F5GlPqNbmKENNkIchMDdtSGDvx3i6Y0ZUEX8KjrP8LZ?=
 =?us-ascii?Q?fF7ZZQM0ny1jXH/HedU5JpYNQmvk77dvkye59vPz8/96IibOkFW+tnNpljQX?=
 =?us-ascii?Q?UEdBvrxb1kUhgBcsqu12OaTDJMoL9J5nRZ8/TD9Ee25So6/LCR2WNK8av8uL?=
 =?us-ascii?Q?jeDv1K31d13Sv9Y7GVbSVjRrXPV95tdjuauLtwY9uFd77KXd2n7B+Twk8ycn?=
 =?us-ascii?Q?R+SDnAhM4egjyLu9qypMvLuMWewAyBYcDPJQLu0tKv/vTBVIn88cas+/A4ka?=
 =?us-ascii?Q?7XeFf5UiIJ9/z9N86qTSQap5cvVaSIKRzm6ZsHKUdoniPngvDO5zOgbgZvAJ?=
 =?us-ascii?Q?e8ttjCFPokk/Af6zQRJFEyOF+7ok0NlGGAjXOoA+pM+lG49JdZ8hpSGS8BGt?=
 =?us-ascii?Q?LTtA7x5OEe+45kkX36pQvbaVkxXWTa66+IrF/0Z2nNrFW0UklOM6uLNwcV0e?=
 =?us-ascii?Q?hFyN/djAYPJ3vksaL5W41SVd4U0o40jHDM1mWIaKk9Sh/rcQKzvv2Tg2l4/Y?=
 =?us-ascii?Q?EvQL4XbqqNMrIDpKevTkH9bvwdMMEMtnlsSKdQh0+GZdi/OltyebgrCnYpEb?=
 =?us-ascii?Q?6UyMSy6WT7Zo+r296TcmGCTwjzymINpKShA6Wrq6ngHpiMrpJD9+iMj7Er9/?=
 =?us-ascii?Q?66mCrex9CLaj4z1nqklWu7iZLYh3qC/b0pnoJPK5xje80GiFTvvFMZU11UU+?=
 =?us-ascii?Q?0+Ai0/sk6SauUG4I1QRUIgVx7ik3CdqohRhAmCBhhdMA9sm+GiBbLL5Esl+c?=
 =?us-ascii?Q?1/7rKID9Vw6fvIFmB1nfkfmmkJljk6vQu1B9pMflzISbBEOoeFqwq6WNmLEr?=
 =?us-ascii?Q?1boqrlLvDhANqfC+Mc7aSBCNt3fqs+zX2iljcbeSUNHAW9VYIVltfun6IstC?=
 =?us-ascii?Q?RntaREr1ghoYvK5uVkzjfsP4wOrAqxyNIcEETAryh/pciujDoMRjUYDYv9SN?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb99e4b2-c0b6-4ec6-671d-08dcf3bbcff7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 23:38:35.4723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dasVcGBbRLKcKPaG9n5hm92IBoaqxMmsJT0zt+bnIul/1D4GhaL9oNXi25fIB9UnbRZ6wcIoY9lXg3TKsa5lGUel6yIMXeYdGP9taTJlU1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6141
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Alistair Popple wrote:
> 
> Alistair Popple <apopple@nvidia.com> writes:
> 
> > Alistair Popple wrote:
> >> Dan Williams <dan.j.williams@intel.com> writes:
> 
> [...]
> 
> >>> +
> >>> +	return VM_FAULT_NOPAGE;
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(dax_insert_pfn_pmd);
> >>
> >> Like I mentioned before, lets make the exported function
> >> vmf_insert_folio() and move the pte, pmd, pud internal private / static
> >> details of the implementation. The "dax_" specific aspect of this was
> >> removed at the conversion of a dax_pfn to a folio.
> >
> > Ok, let me try that. Note that vmf_insert_pfn{_pmd|_pud} will have to
> > stick around though.
> 
> Creating a single vmf_insert_folio() seems somewhat difficult because it
> needs to be called from multiple fault paths (either PTE, PMD or PUD
> fault) and do something different for each.
> 
> Specifically the issue I ran into is that DAX does not downgrade PMD
> entries to PTE entries if they are backed by storage. So the PTE fault
> handler will get a PMD-sized DAX entry and therefore a PMD size folio.
> 
> The way I tried implementing vmf_insert_folio() was to look at
> folio_order() to determine which internal implementation to call. But
> that doesn't work for a PTE fault, because there's no way to determine
> if we should PTE map a subpage or PMD map the entire folio.

Ah, that conflict makes sense.

> We could pass down some context as to what type of fault we're handling,
> or add it to the vmf struct, but that seems excessive given callers
> already know this and could just call a specific
> vmf_insert_page_{pte|pmd|pud}.

Ok, I think it is good to capture that "because dax does not downgrade
entries it may satisfy PTE faults with PMD inserts", or something like
that in comment or changelog.

