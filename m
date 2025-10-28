Return-Path: <linuxppc-dev+bounces-13422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2A7C12FC3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 06:39:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwfMF1s6Mz3fmr;
	Tue, 28 Oct 2025 16:39:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761629961;
	cv=fail; b=UUOpzqaDzNAZdTWmKFxarOjMYZBwq+a6FsoKYQOO+j18/Jd7W3ghf81kp1IrFacSK5C6sRO2LGI8rDvBCAfMCfD0T1wP/5DqbiUpBftmFsoveyNMRN/moxlgjGHA/CnQWW7Aiml1cG+cPydbTaxwuzUIZrA6mLuS9KzNWnlOEU3AULhZYjb+piLlncKGnRZunnjFuMC4HNbRVGxjVDSkfpQcze5rg4NfUkOf2irjmHf5nUXDiUiylnQHOgHK8/oSqC360mURYze+q3B5fHzdeQfnMzOKQ2T7y1ppQXFffPrr2GmAyrz3se950vB49wH+SQmzF/kdobqJR4bmbAdZ8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761629961; c=relaxed/relaxed;
	bh=h8k4brh66KBVcQ4GqmzGfZSKzMa7On53kGYgaWRMQgc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IoW6+pF0v2g6J7ToACxoD0r7aar1KHSCur+itz0XrLfQpY4pmMFMKyuxBJhSvvfCS4jow1Rw8Fr1wglSC0tKVmHEjHANlxGs1aUSi4tJNRHTNqCVICQkj+Va0/ymXimpi3EsPPBLdiptfkYovhoDD5iNCKMMD9yktLo1aTGvC2B1sC3t78puXa9ztfJHVxFu3hIxI7yi/+q6kGb5sKFODSmxZmDAtE4ev8hM0ohRxJssjbheSkiV4fi2vq3XHGwvNp/tH8z7Wrerv91KsI3sni+OJxHEInDQYzbu3yZAHJa5tdJkZqNmCfUxovV1CpiyOro/l6xmWjCWT3gH222pBg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dA/3mNnG; dkim-atps=neutral; spf=pass (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dA/3mNnG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwfMC6kxgz3fmn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 16:39:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761629960; x=1793165960;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=TX3QK2a4KxJiOLoyJON9pbkXOOjZQpC0j8rV/ox9yQg=;
  b=dA/3mNnGUWhR/0B2vowWnZfUMrDNr4xlo/f+91atmCNjFTyaiSW2JPzF
   aUjoWBonu4pevISBY8q9rEJSYEJMVQFK+We2HsrT+AY3H8D0KWbgjAhVR
   7YJQ3xxCXjVrbVy6Zbm+q7xo/ME/+Mdlkf60oMRfIiEcMJps5n170/cSV
   uWZsuPykiz9RXE5l/kvF9KLB0CwASkOK4kXDT/R6WiJesEUQovWOh4d+1
   4aeGeXkWx3lP+XIb76SvlUTx2X2GC6IfLIAytnCihCeXCv/tLbmBcbiDM
   pIgfkkXU4mm93jnuGLbHEPxjfE+ar6efVp2JsCCspjn4TV1Q+I8J+Ejx4
   g==;
X-CSE-ConnectionGUID: HsM/O+FUQrSGXabV0pL7KA==
X-CSE-MsgGUID: WjhIwsXkQ4afnQgUSpO4Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63647288"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63647288"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 22:39:17 -0700
X-CSE-ConnectionGUID: cwtsJ5AdQUe6zIJiqiC+Rg==
X-CSE-MsgGUID: F/fE7unJS42gMzKo41M/gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="208849223"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 22:39:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 22:39:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 22:39:13 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 22:39:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKHSJHYVQPzPtiYZYijelR9CKjR2FZJGwtTccJzesHwoLk21YcgQx57TxCWPhky0nec4X+eHo9pWSbDSqAizGYZ/Fx+I7dqQcfqFaHFdzjIrZ80+WkUtFnOUIx5VsZ/X/3qV/NjsDpL8FcxrSVZxmdiYmbyCXXrMSYDEmGM1khv1vATrXxL/9w6KxJWUaOpFCva+isPFRjmcJpJ+Zj1rqvvyDcqz1rkYzrP1iFX2IxOj2RHD4tMUisqH/4Kh5tPnwYQN70jDFiVzc2MClqLS9nnkAamQm/UY8zAkFvDdceKPDyxwF2YKdCtidvIo7Sm6WVC95TYClVLNww8F+v7bqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8k4brh66KBVcQ4GqmzGfZSKzMa7On53kGYgaWRMQgc=;
 b=Qpmn/MqlPcgz55QblR8Hz+yXrKCqQAkGi5ORCyH/iIk39Zh0TB2fE1uuclTB3tLBEpis4zJ+EqwWK/yOiADOO4eXgzXk0XS7bpMQMU2JLZoGSbiwJ7d8hfFrY6OgOy7cfSxbSfL9+L0290Yfe1GuBX4eXW71dkPlShU25CQVXR2XJeJRHj0yMj9CHZvrvd6Aarc37MukZ17M7RHWgIt0TdI+KnMx0XLreb3PTtFEvcJK2kkrxivlFNAcQpsGl0cTAUQRbYcd04gFhWc8+Z4SWr8o3a4obKwTEBAN6ae9ZOCZ/FJ1V+Dpey2hpTYEnw0ZU8NyxTLURQJ+QVVZ3i4stQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 DM3PPF0644BB20C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f06) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 05:39:11 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 05:39:11 +0000
Date: Tue, 28 Oct 2025 13:37:11 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
CC: <seanjc@google.com>, <ackerleytng@google.com>, <anup@brainfault.org>,
	<aou@eecs.berkeley.edu>, <binbin.wu@linux.intel.com>,
	<borntraeger@linux.ibm.com>, <chenhuacai@kernel.org>,
	<frankja@linux.ibm.com>, <imbrenda@linux.ibm.com>, <ira.weiny@intel.com>,
	<kai.huang@intel.com>, <kas@kernel.org>, <kvm-riscv@lists.infradead.org>,
	<kvm@vger.kernel.org>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<loongarch@lists.linux.dev>, <maddy@linux.ibm.com>, <maobibo@loongson.cn>,
	<maz@kernel.org>, <michael.roth@amd.com>, <oliver.upton@linux.dev>,
	<palmer@dabbelt.com>, <pbonzini@redhat.com>, <pjw@kernel.org>,
	<vannapurve@google.com>, <x86@kernel.org>, <zhaotianrui@loongson.cn>
Subject: Re: [PATCH] KVM: TDX: Take MMU lock around tdh_vp_init()
Message-ID: <aQBWh/eG0BcC1boo@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <aP-1qlTkmFUgTld-@google.com>
 <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6)
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|DM3PPF0644BB20C:EE_
X-MS-Office365-Filtering-Correlation-Id: 672f7153-663e-45d3-a8c3-08de15e45266
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ESl9wnng1ee3WkuCxFdde7fAJTm0lzLL+oZMrNgtdJF1zOGpQiDyB5b627+B?=
 =?us-ascii?Q?L6bqYyGGztCSQsjtb6Rwc9kGLpcPRUntzDozrXv04Cq5nCSQweBJshL7N7u5?=
 =?us-ascii?Q?Wy3JRGcy9NRtFWzxVk4E+OJtSyUuBhABWt3wcoqX8qnbk/d6dgCm8dAtdWkY?=
 =?us-ascii?Q?X48wU7Qae6AZ8XbxHGMSnNCP5rqo+fPSUXdwec15PmRXwG2bFRpm8iLQh2Ce?=
 =?us-ascii?Q?sD0VsMh2ofvlmrHG5WeF8Pux/59K6HXFlTqDP2pnAQR5lJFB3I8watpG+xf9?=
 =?us-ascii?Q?RF0rsVJyOEWu53Qw/lx0R0YsG8eMlf2ZiTl/sZK6FJyhoJiQOFLnuCtJ/cxl?=
 =?us-ascii?Q?sRzQ1bJnPTXssHFZpteQcRsBkLO2hYHfPOVwrZ5s0BA8X0XktYmSNLbnsj65?=
 =?us-ascii?Q?U8ejtPLLZEy8sT2yUfbJundeYgfuPw5iCMmLzdC4VGVCTYlDz/aMai7BOyEJ?=
 =?us-ascii?Q?QYFd8Omv/3997KpP9ELMPE22205aeobuRjUlIbs4cetA5TAo54npFBKfdNSu?=
 =?us-ascii?Q?uqXLgu0axO/amjmFt48lr68Fsm23GafdVj9W/vj586NiiyVA9D2U68PweTf3?=
 =?us-ascii?Q?P8SvEn8d51DCnx2ZvytWhzykQryRY1JafUpP2V7fBgG7W5oQuSVqJayrB85i?=
 =?us-ascii?Q?QhqKVEFs7myOWaofzMEpRXkPiDG/0hn5xt+RIRxXgasGbTwj6cQVe/G7KwkQ?=
 =?us-ascii?Q?vs+vnG4HyshYntdD6lTWFXRhqF+vz+9VrcOgtfAsIq/jZwKb6P8nmeoJTPof?=
 =?us-ascii?Q?LVFPa2kTfeQusnMyd3fvjnUnJojYgcPepRgS0pAjx/RrH5zRNR8MUgV8t8tp?=
 =?us-ascii?Q?wAhs8Xdv/LGl2vAZB5/roEVCfMa/oZqGzCOlg0Wie15hRqZaqXNtHjrtULwe?=
 =?us-ascii?Q?cvxdRHq3SX6eo6n3sMZ3rS7PNxYRNhiBH5ciH2WWGdVAzBeF5m/sXHmpdUMg?=
 =?us-ascii?Q?Vykb9DjzTdJT+lSFYM19R7dnamiJf4JrNqzS/lVVNmTkH927U43l7xn3yaXO?=
 =?us-ascii?Q?jFScQaANFjyCUzTrwDCWcuNAlaoDTFuqgGU4FJiR9l6zkPq7FQBVeiK8xiCv?=
 =?us-ascii?Q?dn6vJ0dbton928sFhoQgrpUj0xIwPfhIhsxsikn4JoYOcEnbiHtAJKmy/a5B?=
 =?us-ascii?Q?wfqni7wrgJYaM7xntJL33ouv8Bf/QpRg2URorz3F7vNg4EFR9BVKaJbv2yr6?=
 =?us-ascii?Q?sh8WMi2Gqsv3yW6knXAzr74cQEFaqiOJY8dq2WL/M83nnN3bPJcLXbwyg60y?=
 =?us-ascii?Q?uA+J5DAW332BrPlieS+4EjPvNfG/JuYGhvV0k4APIfcxkhgFp1nYxcfCtck3?=
 =?us-ascii?Q?//G8egmqUudSa9oO8qWxT1+yW2m2ieCSNfiUKWWEQX8yZJ7HDKO31uLcJ3Q4?=
 =?us-ascii?Q?Ihc2248ZfZG/Un8eWUI72+ZZXnIEk/y6snPnnAbdTWSINHXLdfhNVXQonJ+E?=
 =?us-ascii?Q?LDOQEJc0dtk21TpoxKC/cYbraXlnTt3s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GQP9ks88jnsRer/ownZiyqRKgCyQLCd0FFqoJouUqDtcYye9d+DuZUHw/6Ur?=
 =?us-ascii?Q?gU3Er+zRE69VG/yLjoXelA7slKxlx9KEPMndnNMtXffYQ7+Gy+WAQ7guJ8H4?=
 =?us-ascii?Q?apqRHpLfJYLtpU1KILhufxBDPUzMW8GCOS+Zq+hdB1HphtJapWSEahZHTLdu?=
 =?us-ascii?Q?6a/J8Qd+32Cd6zwPpIlmUQFD0jpRYhgHrZakwV8cITusse/7rU1Ot7j9bCGR?=
 =?us-ascii?Q?iJdEQpH9z3bPbeLB16AFQqXaEIAZCYBoGjDiHkp8uz0vQiP43iEoo2b2TMfu?=
 =?us-ascii?Q?dbRRFQT8coUJZLf6Xig5aWzl4e/1z6eIUbwBfz8nExWRXlksqVVXvZ5EC98H?=
 =?us-ascii?Q?T7Cr84kJvR3kY9sEcuIPwYZE0yqz168UaN1rbm6OGTwOk/igtuK9lVVh4Cdu?=
 =?us-ascii?Q?ihxsqc9v54rA5vMmT0/MhT5G2Ro+tTslseMjjp01/PARYbpU8+cQsJLHEFpk?=
 =?us-ascii?Q?QSv3wPc4QXuJybsIDcubW1cuPeR9zy4kVcp78xLBkbg7wpOBzGNAuMR3GQun?=
 =?us-ascii?Q?CiAYlmLgdOoVwrQqY5Z+dSGd9ib59+0mGcMpJMb2LEhDNWlG8pgPlENoGK0L?=
 =?us-ascii?Q?QkfC+oiMCYSTfNaZmYSaVST373mLQY3ldc7YNhKm4BWAgRA6td6vjDKYIMH4?=
 =?us-ascii?Q?L/JVt0jRwbdnPg4tz1Oc/Y/lwS9U7iGv/CXIW0w/Y9at6cGrmxV00xCcFFHO?=
 =?us-ascii?Q?CdfbxoSL7Eietre8WmcfwjrT8wStsGcSCpo+J5R4oWqNL6lzbp+v9amKBw3P?=
 =?us-ascii?Q?cT2FgQniQIIyYZqybJNnJvkgQd1NDZsuMkFYDWksnyUnKRG0C70dVhcvbBet?=
 =?us-ascii?Q?BpuoRzz7TKl5FgkPZ4SlGljtmYB4YnGzK/5tQNcvMdYpr2xF7GrrL7cnnf66?=
 =?us-ascii?Q?WeDPjxgyGQfJzDsQu2yWcNX5wBizSJzWJOSnot6bB9tv+MwiiU2cotWC7ai8?=
 =?us-ascii?Q?jMP9aSMC6t7J0CB9bRh70N67ZhUFT00sgcasVQp4FyTA7GtuWjZvWf6ZWuMW?=
 =?us-ascii?Q?PY+PXVDzRtlweABdvdMS6SZJ9mWLdjMNObpbPkVpEzQ6YzWOKCKaixvXptaj?=
 =?us-ascii?Q?nzSMec+1vJt1HuwT7k4x//qUihJVbognu1y/D7x78UiI7oyPs8D/WyFd53I4?=
 =?us-ascii?Q?Bv0XHtlWfaB2IdE7osm1ZwPMegxffLvgTA+NT0x3dDu9pCmDycgTvnDZPBj1?=
 =?us-ascii?Q?4ZpZTPJAOH1ztQ/LMVOLtszI2SkVssfPGO3CzXh7twQRvhO/KoBJoyVBR5+z?=
 =?us-ascii?Q?/vc1GHBDh32c1NipblRGgNAg5R/yrQODDxEOhjwJHZODYv2QIdBoGi56I6o9?=
 =?us-ascii?Q?tCkqrinSoOHLq4SimSRsqvPs+bFnAMhxH+YcKSVYUrrr+puTPpxPth2mMat+?=
 =?us-ascii?Q?8V0VYk0cSPcR5iRoRbbXTrgrIHkRxZKGKVqzoNjSBsNN41QLIlniEKi8rm4t?=
 =?us-ascii?Q?T1TKjAgV00TDjKO6jxZwpKXO3AZDi80z47qODwIjsnVlEVFwAugQ6X9phT/a?=
 =?us-ascii?Q?FAITi7eF9QeFtS1NXnjD/D6kg6KrDxEUdnUEyBwEJfdL8FwWfOrSRBpprSXs?=
 =?us-ascii?Q?8ASv09E3Bdnw2ymFZe4QIHFBw2kYH492OK/a/n+j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 672f7153-663e-45d3-a8c3-08de15e45266
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 05:39:11.4779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgODYJ8S03JEGl+Tm7dfz1AGSzecmX92cYRQnZm0iNerHT2TJa/y6Nc83dv01fGw5dXoMd1ymfTOlcMYXaSF7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0644BB20C
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 27, 2025 at 05:28:24PM -0700, Rick Edgecombe wrote:
> Take MMU lock around tdh_vp_init() in KVM_TDX_INIT_VCPU to prevent
> meeting contention during retries in some no-fail MMU paths.
> 
> The TDX module takes various try-locks internally, which can cause
> SEAMCALLs to return an error code when contention is met. Dealing with
> an error in some of the MMU paths that make SEAMCALLs is not straight
> forward, so KVM takes steps to ensure that these will meet no contention
> during a single BUSY error retry. The whole scheme relies on KVM to take
> appropriate steps to avoid making any SEAMCALLs that could contend while
> the retry is happening.
> 
> Unfortunately, there is a case where contention could be met if userspace
> does something unusual. Specifically, hole punching a gmem fd while
> initializing the TD vCPU. The impact would be triggering a KVM_BUG_ON().
> 
> The resource being contended is called the "TDR resource" in TDX docs 
> parlance. The tdh_vp_init() can take this resource as exclusive if the 
> 'version' passed is 1, which happens to be version the kernel passes. The 
> various MMU operations (tdh_mem_range_block(), tdh_mem_track() and 
> tdh_mem_page_remove()) take it as shared.
> 
> There isn't a KVM lock that maps conceptually and in a lock order friendly 
> way to the TDR lock. So to minimize infrastructure, just take MMU lock 
> around tdh_vp_init(). This makes the operations we care about mutually 
> exclusive. Since the other operations are under a write mmu_lock, the code 
> could just take the lock for read, however this is weirdly inverted from 
> the actual underlying resource being contended. Since this is covering an 
> edge case that shouldn't be hit in normal usage, be a little less weird 
> and take the mmu_lock for write around the call.
> 
> Fixes: 02ab57707bdb ("KVM: TDX: Implement hooks to propagate changes of TDP MMU mirror page table")
> Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
> Hi,
> 
> It was indeed awkward, as Sean must have sniffed. But seems ok enough to
> close the issue.
> 
> Yan, can you give it a look?
It passed my local tests. LGTM. Thanks!

> Posted here, but applies on top of this series.
> 
> Thanks,
> 
> Rick
> ---
>  arch/x86/kvm/vmx/tdx.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index daec88d4b88d..8bf5d2624152 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -2938,9 +2938,18 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
>  		}
>  	}
>  
> -	err = tdh_vp_init(&tdx->vp, vcpu_rcx, vcpu->vcpu_id);
> -	if (TDX_BUG_ON(err, TDH_VP_INIT, vcpu->kvm))
> -		return -EIO;
> +	/*
> +	 * tdh_vp_init() can take a exclusive lock of the TDR resource inside
> +	 * the TDX module. This resource is also taken as shared in several
> +	 * no-fail MMU paths, which could return TDX_OPERAND_BUSY on contention.
> +	 * A read lock here would be enough to exclude the contention, but take
> +	 * a write lock to avoid the weird inversion.
> +	 */
> +	scoped_guard(write_lock, &vcpu->kvm->mmu_lock) {
> +		err = tdh_vp_init(&tdx->vp, vcpu_rcx, vcpu->vcpu_id);
> +		if (TDX_BUG_ON(err, TDH_VP_INIT, vcpu->kvm))
> +			return -EIO;
> +	}
>  
>  	vcpu->arch.mp_state = KVM_MP_STATE_RUNNABLE;
>  
> -- 
> 2.51.1
> 

