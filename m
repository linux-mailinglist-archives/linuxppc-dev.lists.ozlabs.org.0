Return-Path: <linuxppc-dev+bounces-2560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F8F9AF5E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 01:53:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZN5g16wzz2yMv;
	Fri, 25 Oct 2024 10:53:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729813991;
	cv=fail; b=Lm5bXnzU5oSa7g07bJH67IqtZ3vvMycKDslDymYASnNbF+1mWrx6quOJ5LsH/TUlr2P8CQ9GbqCqEihcvCBnQuxvCecNCqf3paELI1EuZXBl56Qlx4xjlxQp4nqWGk7rkBrHLn0I1iDVDAxv9EOX3Hbk0OSNOM6vii8X389DhYpT7Dh8zVZh+GATmU/v7BcD2mXLGKfKYqylCoQ4taGDbgybdssMDVsCl/csL3VbFQhBWJxOsYZ9Q2fyREmeCNpgiEqCmgQeo7KLmyVsHahkGN3m3O9bl4F/ooB0TM4GoCnrmXkK6uFgtRC/GaTSMDBSW/S9Z/guwYwcOrV1i/4tDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729813991; c=relaxed/relaxed;
	bh=OlkxyIkA+wMRBLzJNLU6Kd/gPuxuZesyfoHYM/PU1CY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YLOxu5TJlL2PPiqFEJ8KrJIg3dw4BdHWHkZhbYlqRR8T0RXwZDCk5czNrrOtw/+52mK2WgmsV1SsEzPGdKGfOArw1G9+WVAqAJFwEK3VV8kYa0EUO9Zw+xAcaZRNGuUKyZnsrSZHQFCQE2A+2rIUhYRCx1cPHvs3P+GKW/BuaSI8JUjFvGwQgAIt7sY0+41aHlOSBKjw+GkgNXra+Id1KcySRVdEK5HhK0VQbIQDRrc2cTXfSJrWdMqFmt/KfxZPnT6cthpwKnQeWvKI0Khb9yFpgPgZ9Jqs5CY8x/3dX+JefkctRpXF7bD8ca8x18YAbMb35NaCVjVDWCThXeevfA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ajNpBHMJ; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ajNpBHMJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZN5c15xfz2yLg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 10:53:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729813988; x=1761349988;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OWRUX2Yq/sgNbJqJizDqJdTxgIHSzfS4PWoR58XmnKg=;
  b=ajNpBHMJuRiRdUdnOIi3yWt8uQJd3rQKs1t+zv1eSfMwjWTpGil8wCfK
   CA2rrshIvNA3KGrRXk6nUJXRgoCvLzbp+W7C2trejUcQMYRQXpbG67y/Y
   k7XL67McciqT9WeN3bL/G+BNMOlQtaIBWB+h3Y5wPx4JGWGQJlBdmUTct
   K5rFAm/7m639KTMrG5R/UJNfVxt1c6bI+9WKiJc2L7+WD2k5QiAZt+NHu
   KNM03+sUlwUwq9N91/32iuYf+QXkqguimYiZQuLRcILKBnNcyoYzEVlrI
   JoY8JNXcfbkymPIIPqnomaRkm8s+eeKNBKtj1b+rlpbK4tXRgUKHKjq0o
   A==;
X-CSE-ConnectionGUID: cMwxkB5mT/uFuzAqXbACuA==
X-CSE-MsgGUID: M82G+s96Rmiq1fhGvsrDoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40867029"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="40867029"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 16:52:59 -0700
X-CSE-ConnectionGUID: BPlmoy0VQWa5lwSU2BbZdw==
X-CSE-MsgGUID: dXcj5KKYQwGvUptCFr6S6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="85545453"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Oct 2024 16:52:59 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 16:52:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 16:52:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 16:52:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKo5UGZSgYwBl1Ol3CBEFHFc7O0jNlLk/Y+sN3c0Tzp62LWCLN9x/5Xlesrdyw2ohC46l/RUV6LprUiX5Akk2A4upVIpw8vw/bImBbClieYqDy4tTx5YJa1fZAVg5ZokSUDgFIVoT2pgaqhaU6eehXUoz72DsimcIoFg0Ead05LsUyi9LW3O0BjsRfPXKZqtHDXRF60YdiAIY1TuNlPkGX6Z4OylrBHa1c46yHNcg0rICQQJSSzijbjCt82YnXEwyzGMqw4kI966faN0kccUFNHo1ePpbfR5Js3vLasCWGkEG6RkLYPHLFOA6Osw9z6FK2cbodlsEykE4JfAw9nrPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlkxyIkA+wMRBLzJNLU6Kd/gPuxuZesyfoHYM/PU1CY=;
 b=vl4iaCkX+Qm7xC/LfbXggmVoHtT6Zp3OWyr3zXd+4wBVDKUN7kFBMKnqVLwVNBIvTNaF9Kmr9BzKQKWtM/92R9QAaa27exhYxxiEO/orAd68bBPHGNy2Z16eISabnT7f3UManEsSYQj3UfcwpFnxTF7doSNcARkafcItPKssRUjujrVHDKXUhBlfgaZk/Tc1OEvwmpQmR2eCa+nLTHgZzfG15ZXMY41gJpa/PaQ/dn/JEES3DpnLhYGHG+NN4ty5JdmRQu9F+f8dxIhkM7ekzqcnjGWDC7Nzb442AtLuiu9ESkTgA4UGWVB2LBlVQ4fFS+APvvGiIJ1Cd3+uOpllVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 23:52:55 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::c4e2:f07:bdaa:21ec]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::c4e2:f07:bdaa:21ec%6]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 23:52:55 +0000
Date: Thu, 24 Oct 2024 16:52:50 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, Dan Williams
	<dan.j.williams@intel.com>
CC: <linux-mm@kvack.org>, <vishal.l.verma@intel.com>, <dave.jiang@intel.com>,
	<logang@deltatee.com>, <bhelgaas@google.com>, <jack@suse.cz>, <jgg@ziepe.ca>,
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
Subject: Re: [PATCH 10/12] fs/dax: Properly refcount fs dax pages
Message-ID: <671addd27198f_10e5929472@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
 <9f4ef8eaba4c80230904da893018ce615b5c24b2.1725941415.git-series.apopple@nvidia.com>
 <66f665d084aab_964f22948c@dwillia2-xfh.jf.intel.com.notmuch>
 <871q06c4z7.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <871q06c4z7.fsf@nvdebian.thelocal>
X-ClientProxiedBy: MW4PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:303:b7::25) To SA3PR11MB8118.namprd11.prod.outlook.com
 (2603:10b6:806:2f1::13)
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
X-MS-TrafficTypeDiagnostic: SA3PR11MB8118:EE_|PH7PR11MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 740826d6-2291-424c-6d33-08dcf486fa92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WZTbXED83HRJm0ik+lh3NA6t9oz2IQPGcBHZ9Gq+iT1CRImpBSt4U+CY7ZYQ?=
 =?us-ascii?Q?vnrGiyMuVEM3i6D3h0rkAwi1AMhaM4kU9bzzOvB35gIGLYieMLzvK2ki3uiP?=
 =?us-ascii?Q?qWfbFy78CoTOViQk55tTmESZgazHJZTd4IzHqQH9/HI0GgFQQrkNPC0/kuUt?=
 =?us-ascii?Q?5xk2QjkyGCHKeYjU3JDb+pb3zIbv0YJDwN4kpCb25VP+ARtWdpxUB+9fAINw?=
 =?us-ascii?Q?6OS+Muf1BROz2rdv8sCzQ4iSxJWSlY3tPKo2RtpysOQmIq06n80KIYSh7umn?=
 =?us-ascii?Q?HDv33rSSInE4fvm6wuaHw6T+vzKXHL3xC7/UuUOtYNmxyGJ8ZSj6g2UFGM4L?=
 =?us-ascii?Q?nssqeYwl6tvpvYFh7La92WnmOoLmZ3r/Nv+iDi5wHI/SUPTU59iOb8yNiCt2?=
 =?us-ascii?Q?TMooGAMJMuvKg4cGcHws34QcfCG7v0YBUKV/GEr58XGjznnOe1FUw/EMMDOb?=
 =?us-ascii?Q?/QtBq3vx3wn5XMXCy7cMnKmj0A15l2/IUrGvzpY59j3wJ+ZxjxlBbsNzIoqP?=
 =?us-ascii?Q?fdQTtKjyIxTLzfsDe69e2txCzfgsHAw+7do+NCvEtVwrfGSo91bRW4Pw7e9D?=
 =?us-ascii?Q?mXeIxA879yy+ikSOEIJHj+HGe1kXneN2xoyJprFSWXteUKD1k8WCaZRDWVng?=
 =?us-ascii?Q?G9D0VHaOzPqPzaEOeu1ZkFQ4ZfmOSbrdabV9Y11fw7/T1RoXjHTrXCud4Uj7?=
 =?us-ascii?Q?7BsLJ3MJO90/HBc0LOdkJQNvkiY6gX/SfCW/TaTk9iMulqzGBgyIDxCk4a7o?=
 =?us-ascii?Q?TYE9uieGu9Nd46u16clKw1ykztxi6xJQf2pmmBZLXbie3Yo91+1jwnmbVcgw?=
 =?us-ascii?Q?Ex6Kee5DaacYef/Cg+iOGaNBdFp4hZfo5dvJkNlujlT32Z3X1mOJLE7lnSe3?=
 =?us-ascii?Q?R3oOEm5+ioqf7/TBfYb0Ot5POgDqFPXqwE5xZPIJybIzviNWgFxdDPqAjBy4?=
 =?us-ascii?Q?bRfOteVtZ+NsIEMGtgX6oTzMTUvBhxlSPpNtt8tm21J+vnBjWKdjVfl/YYZu?=
 =?us-ascii?Q?ar5C6xsTgRuyv913dfmiRKTUyRix/kc5yGumFAXBHDzkRkf0arf8WIvAbYOo?=
 =?us-ascii?Q?dKuZ+oMuTd/A+LXkh9fAQyHzLDCMI2vHRQkexarYpXRcYpfaNWJHmZOzGcih?=
 =?us-ascii?Q?zQuHnFSqUQS9QeJWsyKn+uvkLPx6rMRY/mPNfJ9q4FBmomDj3BrnjvTrPqYZ?=
 =?us-ascii?Q?vMkWCyX1xdWV1XUUVxigQKK6qCUppce7MlOEhE7jNGY0dgU3ORRDWCIjp/EB?=
 =?us-ascii?Q?Cc8QbhWvRDimjQLfD5uGaARj5U/2hQwu/SAdHUwNIauyni+3JgA/2s5+I/0W?=
 =?us-ascii?Q?QTgWbccMtEMd7zkRzC2x3RfR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB8118.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WJkHGgePMQaof5yoVSB6JLrOeNR21jyDxwhIbBAnR0FFP7WsgHkdm428aT0l?=
 =?us-ascii?Q?8taYukS6EZjd00w98IxN8jZphBb0MXfkYQPKh/my+wcWwjlL9qwvyJatbfM9?=
 =?us-ascii?Q?Uyh3gj2gd3UJrBOE6rq05kky+0fk1EM14n9tPv/2At6FXiOr2uCDvMct82k4?=
 =?us-ascii?Q?poSW95x3OBjYJnO7xtqDoq6D34s5aT28HxB1lAFF7cBbB+hISl/p2cRYF/Gv?=
 =?us-ascii?Q?LVMtuShPXz8OoNn5dvLV+R2kLKpW0K2jKbnBy8t6o9rl3xGcfd60kwER6KW/?=
 =?us-ascii?Q?G6GFLzAUzbgUd3uyxU2iH6cIxWHvagjChaYwFh6mLIvjOkPoPDuY3tiyLg7+?=
 =?us-ascii?Q?4ykBPxKF37isHMoz16gX3kiJ8HOtb2J8nFRCM8LbqfMNU/CmaYfwddnxocoj?=
 =?us-ascii?Q?JArDNdMwQeCMTaEJB35MXeLRfz5BZr5mmLCYVCR4oFugK28dWFSKANK8DSis?=
 =?us-ascii?Q?jeiuqv2jlMP0C9GccNDLL/K4hCqh7JMhx8OH8zmn8G6+WFjzIe96LDQXZpST?=
 =?us-ascii?Q?t78JOTEV3eUXgEXq8xGdd327G2iv0Fplr4pHBiHVDKmpMfh9TjeDLcMAY3Fk?=
 =?us-ascii?Q?6VRdgnVbCW+IZOG6fSMkMKT6zbTGqjRlZ+ZQYkXySUtc/i2nj/yWGQkDUTTp?=
 =?us-ascii?Q?IMC0mHi360vNhaTLN5Vh7UWdXtPiUVlUwBb3WU9KgJIuSaK2gWFSgixNBFco?=
 =?us-ascii?Q?O6vFNQiP/MSBOGRWJf+0RvlDMU9nsu9+T9olJQMwq7yPyKutszCgOzXOkXAm?=
 =?us-ascii?Q?WHEtizVdJGpoGw7UWjbX8p4udZOuV+kHEzyeTqMJKtamLREaWvm1+8AR7+oV?=
 =?us-ascii?Q?0INymI8ao8/8GahoFMDCdZEMLvGLYvH/PTbbSUU0JiM+nO1GPeYKByDss0PM?=
 =?us-ascii?Q?N+RJogiHedMBa3AEQv4pzHj/7WHuKpr2tXKaRugl+0e2Tid69jeMjdZJF5Vo?=
 =?us-ascii?Q?p5Bk8JN0zG9XVM/VjQboqQTuS4SQnvXEqe1h8MsTfG1abvkgODyR4i5Jqu3j?=
 =?us-ascii?Q?9atduw92N45n1o8HeSE6iNQsWP1fo91GZXeC5RBiOOoAcsGilLkrakCvWDL/?=
 =?us-ascii?Q?b5u5W2DEC4VpQaWdlbfGXyZGv6XgWMjxYd9ETnjJKbO1AWegi6jMzoLEVkbA?=
 =?us-ascii?Q?jWbfqeWiqizmak5jYzcVc2dIVfYM6udoYUQ7tl4lAlQJQtRG2Wnl6mFxIPhS?=
 =?us-ascii?Q?FaTHzSx3F4KbAi6xBWR1cfLOPARcmNnzKHjiNZpvL7m+Ktiw8Py7QNG3TmIf?=
 =?us-ascii?Q?eScPbizv/GDNlVtbWUD/4OTtAZFoOKVoAUwI/RRxBx893JP9y/TWucy2T+LW?=
 =?us-ascii?Q?+JJTzKYfx8VlFWWLbhmQmy5/B76Gq654eSHN0bVp8RxtL2GCHoeqlCecdkAa?=
 =?us-ascii?Q?LAHrMfASCW3Aay5Is6ErmCmMxFGrAknb63AO5bOpfnfXqeFk9atuII+FXptb?=
 =?us-ascii?Q?z9vEAiY1l4rm5mn1uT1wwTdrvMk9N94gIvh/vQpHDm/mb1rvy32jhqst7014?=
 =?us-ascii?Q?HUZzZPPfLZXsszu+YByTSLbygOVABV5gy9zGEiewYkCdcZ8NiPZUja3qBWcr?=
 =?us-ascii?Q?QaJV3poPrksZ17Y2uL9mvCrZSH5KbAMnCB3dJqTAMr0V2gVH3A8MxOB/Adq2?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 740826d6-2291-424c-6d33-08dcf486fa92
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 23:52:55.1413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGcRrIgVRXEMOAnmbv2oxmsUUEkelpjFHLCmXQizgXuIdKv5GN5wwBZ7IS4FOgTJrDhVE4pLuGaf2wlMNfooPWu0tTonobqDE+nW+OaZJO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Alistair Popple wrote:
[..]
> >
> > Was there a discussion I missed about why the conversion to typical
> > folios allows the page->share accounting to be dropped.
> 
> The problem with keeping it is we now treat DAX pages as "normal"
> pages according to vm_normal_page(). As such we use the normal paths
> for unmapping pages.
> 
> Specifically page->share accounting relies on PAGE_MAPPING_DAX_SHARED
> aka PAGE_MAPPING_ANON which causes folio_test_anon(), PageAnon(),
> etc. to return true leading to all sorts of issues in at least the
> unmap paths.

Oh, I missed that PAGE_MAPPING_DAX_SHARED aliases with
PAGE_MAPPING_ANON.

> There hasn't been a previous discussion on this, but given this is
> only used to print warnings it seemed easier to get rid of it. I
> probably should have called that out more clearly in the commit
> message though.
> 
> > I assume this is because the page->mapping validation was dropped, which
> > I think might be useful to keep at least for one development cycle to
> > make sure this conversion is not triggering any of the old warnings.
> >
> > Otherwise, the ->share field of 'struct page' can also be cleaned up.
> 
> Yes, we should also clean up the ->share field, unless you have an
> alternate suggestion to solve the above issue.

kmalloc mininimum alignment is 8, so there is room to do this?

---
diff --git a/fs/dax.c b/fs/dax.c
index c62acd2812f8..a70f081c32cb 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -322,7 +322,7 @@ static unsigned long dax_end_pfn(void *entry)
 
 static inline bool dax_page_is_shared(struct page *page)
 {
-	return page->mapping == PAGE_MAPPING_DAX_SHARED;
+	return folio_test_dax_shared(page_folio(page));
 }
 
 /*
@@ -331,14 +331,14 @@ static inline bool dax_page_is_shared(struct page *page)
  */
 static inline void dax_page_share_get(struct page *page)
 {
-	if (page->mapping != PAGE_MAPPING_DAX_SHARED) {
+	if (!dax_page_is_shared(page)) {
 		/*
 		 * Reset the index if the page was already mapped
 		 * regularly before.
 		 */
 		if (page->mapping)
 			page->share = 1;
-		page->mapping = PAGE_MAPPING_DAX_SHARED;
+		page->mapping = (void *)PAGE_MAPPING_DAX_SHARED;
 	}
 	page->share++;
 }
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 1b3a76710487..21b355999ce0 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -666,13 +666,14 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
 #define PAGE_MAPPING_ANON	0x1
 #define PAGE_MAPPING_MOVABLE	0x2
 #define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
-#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
+/* to be removed once typical page refcounting for dax proves stable */
+#define PAGE_MAPPING_DAX_SHARED	0x4
+#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE | PAGE_MAPPING_DAX_SHARED)
 
 /*
  * Different with flags above, this flag is used only for fsdax mode.  It
  * indicates that this page->mapping is now under reflink case.
  */
-#define PAGE_MAPPING_DAX_SHARED	((void *)0x1)
 
 static __always_inline bool folio_mapping_flags(const struct folio *folio)
 {
@@ -689,6 +690,11 @@ static __always_inline bool folio_test_anon(const struct folio *folio)
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
 }
 
+static __always_inline bool folio_test_dax_shared(const struct folio *folio)
+{
+	return ((unsigned long)folio->mapping & PAGE_MAPPING_DAX_SHARED) != 0;
+}
+
 static __always_inline bool PageAnon(const struct page *page)
 {
 	return folio_test_anon(page_folio(page));
---

...and keep the validation around at least for one post conversion
development cycle?

> > It does have implications for the dax dma-idle tracking thought, see
> > below.
> >
> >>  {
> >> -	unsigned long pfn;
> >> +	unsigned long order = dax_entry_order(entry);
> >> +	struct folio *folio = dax_to_folio(entry);
> >>  
> >> -	if (IS_ENABLED(CONFIG_FS_DAX_LIMITED))
> >> +	if (!dax_entry_size(entry))
> >>  		return;
> >>  
> >> -	for_each_mapped_pfn(entry, pfn) {
> >> -		struct page *page = pfn_to_page(pfn);
> >> -
> >> -		WARN_ON_ONCE(trunc && page_ref_count(page) > 1);
> >> -		if (dax_page_is_shared(page)) {
> >> -			/* keep the shared flag if this page is still shared */
> >> -			if (dax_page_share_put(page) > 0)
> >> -				continue;
> >> -		} else
> >> -			WARN_ON_ONCE(page->mapping && page->mapping != mapping);
> >> -		page->mapping = NULL;
> >> -		page->index = 0;
> >> -	}
> >> +	/*
> >> +	 * We don't hold a reference for the DAX pagecache entry for the
> >> +	 * page. But we need to initialise the folio so we can hand it
> >> +	 * out. Nothing else should have a reference either.
> >> +	 */
> >> +	WARN_ON_ONCE(folio_ref_count(folio));
> >
> > Per above I would feel more comfortable if we kept the paranoia around
> > to ensure that all the pages in this folio have dropped all references
> > and cleared ->mapping and ->index.
> >
> > That paranoia can be placed behind a CONFIG_DEBUB_VM check, and we can
> > delete in a follow-on development cycle, but in the meantime it helps to
> > prove the correctness of the conversion.
> 
> I'm ok with paranoia, but as noted above the issue is that at a minimum
> page->mapping (and probably index) now needs to be valid for any code
> that might walk the page tables.

A quick look seems to say the confusion is limited to aliasing
PAGE_MAPPING_ANON.

> > [..]
> >> @@ -1189,11 +1165,14 @@ static vm_fault_t dax_load_hole(struct xa_state *xas, struct vm_fault *vmf,
> >>  	struct inode *inode = iter->inode;
> >>  	unsigned long vaddr = vmf->address;
> >>  	pfn_t pfn = pfn_to_pfn_t(my_zero_pfn(vaddr));
> >> +	struct page *page = pfn_t_to_page(pfn);
> >>  	vm_fault_t ret;
> >>  
> >>  	*entry = dax_insert_entry(xas, vmf, iter, *entry, pfn, DAX_ZERO_PAGE);
> >>  
> >> -	ret = vmf_insert_mixed(vmf->vma, vaddr, pfn);
> >> +	page_ref_inc(page);
> >> +	ret = dax_insert_pfn(vmf, pfn, false);
> >> +	put_page(page);
> >
> > Per above I think it is problematic to have pages live in the system
> > without a refcount.
> 
> I'm a bit confused by this - the pages have a reference taken on them
> when they are mapped. They only live in the system without a refcount
> when the mm considers them free (except for the bit between getting
> created in dax_associate_entry() and actually getting mapped but as
> noted I will fix that).
> 
> > One scenario where this might be needed is invalidate_inode_pages() vs
> > DMA. The invaldation should pause and wait for DMA pins to be dropped
> > before the mapping xarray is cleaned up and the dax folio is marked
> > free.
> 
> I'm not really following this scenario, or at least how it relates to
> the comment above. If the page is pinned for DMA it will have taken a
> refcount on it and so the page won't be considered free/idle per
> dax_wait_page_idle() or any of the other mm code.

[ tl;dr: I think we're ok, analysis below, but I did talk myself into
the proposed dax_busy_page() changes indeed being broken and needing to
remain checking for refcount > 1, not > 0 ]

It's not the mm code I am worried about. It's the filesystem block
allocator staying in-sync with the allocation state of the page.

fs/dax.c is charged with converting idle storage blocks to pfns to
mapped folios. Once they are mapped, DMA can pin the folio, but nothing
in fs/dax.c pins the mapping. In the pagecache case the page reference
is sufficient to keep the DMA-busy page from being reused. In the dax
case something needs to arrange for DMA to be idle before
dax_delete_mapping_entry().

However, looking at XFS it indeed makes that guarantee. First it does
xfs_break_dax_layouts() then it does truncate_inode_pages() =>
dax_delete_mapping_entry().

It follows that that the DMA-idle condition still needs to look for the
case where the refcount is > 1 rather than 0 since refcount == 1 is the
page-mapped-but-DMA-idle condition.

[..]
> >> @@ -1649,9 +1627,10 @@ static vm_fault_t dax_fault_iter(struct vm_fault *vmf,
> >>  	loff_t pos = (loff_t)xas->xa_index << PAGE_SHIFT;
> >>  	bool write = iter->flags & IOMAP_WRITE;
> >>  	unsigned long entry_flags = pmd ? DAX_PMD : 0;
> >> -	int err = 0;
> >> +	int ret, err = 0;
> >>  	pfn_t pfn;
> >>  	void *kaddr;
> >> +	struct page *page;
> >>  
> >>  	if (!pmd && vmf->cow_page)
> >>  		return dax_fault_cow_page(vmf, iter);
> >> @@ -1684,14 +1663,21 @@ static vm_fault_t dax_fault_iter(struct vm_fault *vmf,
> >>  	if (dax_fault_is_synchronous(iter, vmf->vma))
> >>  		return dax_fault_synchronous_pfnp(pfnp, pfn);
> >>  
> >> -	/* insert PMD pfn */
> >> +	page = pfn_t_to_page(pfn);
> >
> > I think this is clearer if dax_insert_entry() returns folios with an
> > elevated refrence count that is dropped when the folio is invalidated
> > out of the mapping.
> 
> I presume this comment is for the next line:
> 
> +	page_ref_inc(page);
>  
> I can move that into dax_insert_entry(), but we would still need to
> drop it after calling vmf_insert_*() to ensure we get the 1 -> 0
> transition when the page is unmapped and therefore
> freed. Alternatively we can make it so vmf_insert_*() don't take
> references on the page, and instead ownership of the reference is
> transfered to the mapping. Personally I prefered having those
> functions take their own reference but let me know what you think.

Oh, the model I was thinking was that until vmf_insert_XXX() succeeds
then the page was never allocated because it was never mapped. What
happens with the code as proposed is that put_page() triggers page-free
semantics on vmf_insert_XXX() failures, right?

There is no need to invoke the page-free / final-put path on
vmf_insert_XXX() error because the storage-block / pfn never actually
transitioned into a page / folio.

> > [..]
> >> @@ -519,21 +529,3 @@ void zone_device_page_init(struct page *page)
> >>  	lock_page(page);
> >>  }
> >>  EXPORT_SYMBOL_GPL(zone_device_page_init);
> >> -
> >> -#ifdef CONFIG_FS_DAX
> >> -bool __put_devmap_managed_folio_refs(struct folio *folio, int refs)
> >> -{
> >> -	if (folio->pgmap->type != MEMORY_DEVICE_FS_DAX)
> >> -		return false;
> >> -
> >> -	/*
> >> -	 * fsdax page refcounts are 1-based, rather than 0-based: if
> >> -	 * refcount is 1, then the page is free and the refcount is
> >> -	 * stable because nobody holds a reference on the page.
> >> -	 */
> >> -	if (folio_ref_sub_return(folio, refs) == 1)
> >> -		wake_up_var(&folio->_refcount);
> >> -	return true;
> >
> > It follow from the refcount disvussion above that I think there is an
> > argument to still keep this wakeup based on the 2->1 transitition.
> > pagecache pages are refcount==1 when they are dma-idle but still
> > allocated. To keep the same semantics for dax a dax_folio would have an
> > elevated refcount whenever it is referenced by mapping entry.
> 
> I'm not sold on keeping it as it doesn't seem to offer any benefit
> IMHO. I know both Jason and Christoph were keen to see it go so it be
> good to get their feedback too. Also one of the primary goals of this
> series was to refcount the page normally so we could remove the whole
> "page is free with a refcount of 1" semantics.

The page is still free at refcount 0, no argument there. But, by
introducing a new "page refcount is elevated while mapped" (as it
should), it follows that "page is DMA idle at refcount == 1", right?
Otherwise, the current assumption that fileystems can have
dax_layout_busy_page_range() poll on the state of the pfn in the mapping
is broken because page refcount == 0 also means no page to mapping
association.

