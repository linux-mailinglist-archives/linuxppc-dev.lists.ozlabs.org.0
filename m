Return-Path: <linuxppc-dev+bounces-14471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AA4C83181
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 03:28:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFmpM5N7Wz2yFJ;
	Tue, 25 Nov 2025 13:28:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764037723;
	cv=fail; b=ApSee0vCCHeNLNRTx86Zp7nngnfyJOjkzTv5531lAwKdwkl+Mzm7NB2RNsAUt+RqQIg4X375fR0HnQlGLLqAeeG2rbHfUwt+hQBogrV/HiMvLNCS00aMRP72v6U28RbbkBxThVpJYh6hOYhsAi1AWy+0BAPKc0n08+pUWapiXFSOm5E+6SqQKvjsJ9sOycQuxnwnPMeJBqfS8MVnu/YcncRy0MHztMIHyQMoZf9G2Gh1Yos3zma4MPCUfpVT0RS2HEb+WwH2VwQnhTVTp3f712uuWTzdqAGVJ+un771112n6rPna4RU05jLwqdskQ4FGqCynC6la06hGdzVKn/khFw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764037723; c=relaxed/relaxed;
	bh=YA65fme9hELvGn5h/lkuw5mMsHQDFNZ+dvNBUWPq3Bc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XmSR411aqPIJXNAoKu0bQVbB4lEx1s8Z5ihv9AjJbR0IbtxyeDQ848umISfPn0Gjdt8xZypa24ay23oEX6y6ZdZX9votEVsTbZXvDg0O5x8bl514SJWBoJwxFwj0rBePBR4Kq50PGupKwbYpoNG5DIfIML3rrbCwCPw48CJHB+luoVaD5FSFJF3m3Y5fjad+8YthfHuhvZpNaqPX/tTxOCKTMUpQu1uRVJrx1WGgf3qYo6vOC/dgOhgrbY1Z++vJvFMoG72WlU0W+/KOWGlXxZsdAPpApknJfMMYM8yhBoBF37QyyLD4Wu5V6BvF6QLX+3EaWmeFl0u141+SJTPZ1w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aGhUDoIp; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=philip.li@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aGhUDoIp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=philip.li@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFmpK1LtDz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 13:28:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764037722; x=1795573722;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=sHzmEeY0m6/8gbSy5q1XET+JlFGYfFo7Nr7ibwgYNTA=;
  b=aGhUDoIpIz0tVs4zhKZbrvwvxA30E1ID2/SJVAxVosTShA6BAVbanqb8
   fKOpjHVqY5tCxjEVu5FQLwbpgmNRBUdkeGoGlWyMRKqXlpzsL0i4WNvrZ
   FvYsKaZ65a/33yJzmo+kqbRuRGF5zpleosupYCXMHx2KL8hC+Nxqarv9N
   7S6Y8vluks+yIRqxPfQAU4Db8VQFr0alsotkf4vJvhp101D/opqYKb0f5
   tBhfoXZHbLhxAHHjzCSwG7+onfdOsEiqFqaL3f6LrSYHUxIvdRPv/R78U
   D7eZqPcpvPe/49z0h60zGyvo53hhFV7Is+rryw930y0GyoURnHkDjHxZQ
   w==;
X-CSE-ConnectionGUID: k3n/IXA7QT6tkKXnc8V3+Q==
X-CSE-MsgGUID: W/siRgs6SaWxQklhGxZSFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83441934"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="83441934"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 18:28:34 -0800
X-CSE-ConnectionGUID: ikLyDofDQY6LNFuMoTSMiw==
X-CSE-MsgGUID: yZQwDP/jQtG5Oek7RD+gXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="196795037"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 18:28:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 18:28:32 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 18:28:32 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 18:28:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFuKFwIopinx17BxkKYiePz9QaBwksFTYfkssUPZcPeDJKBPVkbmlHcJy6fSgXhER4yjPXtOTMoM4V+WCNarVTnnxnSx0FEiLzeKfiFx1PI7XPq+LkcWFLcKE4xy0tC9Rnja3PrqJQNqkiC5cB13C/382iQQBElcT0QAxekrVzE72fAqmgkDvdNs/ZwCe+NjiI0lrvQqHZAQAa1VU1h7fEkJaM/TycLNe/UVAF3c1tXnPn29XkNBO6exnfAX0SJ5FlYIYF16pJXudoORqkRqnY8KYJHWpXJfgCJ9oE0dQaXqgUen/RXkv5qVIvI7bssYZeKNb8Dp/P+OCpV+RZ1P2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YA65fme9hELvGn5h/lkuw5mMsHQDFNZ+dvNBUWPq3Bc=;
 b=d/UHp9S3AjqaJoLdAA2jbQqvca/W4zT4cT+0/Tf3zvpOJMY5lbzUTy9val6tiUOmJ9EZgsSq0f9pkNW9BzC3Y2sKQKplv1zdkjs92C5moKYFTenE8mp9GGAhmgmX2qkWEnQFnecvpkg6FtdfufAvquryJckev37tArn297swvcX/0xVV95WRlAIg2BgpDatyjsLsTAoFBrC9qZaQdvv+wVS3IdudzKRH/yX428z9A5l6PJ2AaQ3DE8vg/NWk6MHrZOGKejgPQ8MP7tGjtS3wf/sy2NAKhn20Tm0Cn8Ra5KX2BEgVClcu4ia8vVZFDOQeZ9K0YqUtC2B+iMU5Dexk+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB7895.namprd11.prod.outlook.com (2603:10b6:610:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 02:28:25 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 02:28:25 +0000
Date: Tue, 25 Nov 2025 10:28:15 +0800
From: Philip Li <philip.li@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: kernel test robot <lkp@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Ingo Molnar <mingo@kernel.org>, "Peter Zijlstra (Intel)"
	<peterz@infradead.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	<linuxppc-dev@lists.ozlabs.org>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [tip:core/rseq 25/39] include/linux/rseq_entry.h:132:3: error:
 invalid operand for instruction
Message-ID: <aSUUPxIo3XSyhwAd@rli9-mobl>
References: <202511250134.i0Jm8d7I-lkp@intel.com>
 <874iqji6n1.ffs@tglx>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <874iqji6n1.ffs@tglx>
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
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
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CH3PR11MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6b4993-2270-41bd-b492-08de2bca4fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/bUTcMtU0QgPGsLv69E3CXQCNDjlDAJep7PKFMNBNMp/IvwUvotVNdfUivTM?=
 =?us-ascii?Q?omSDNydOrhFLfG2NZLV4e7nnapfrY0wmzoa3N26RKT3AQoNLc/9wGQVNlyBf?=
 =?us-ascii?Q?lmzPHT6+RhojD7Tlf6yxfVYwjZHOxQIRUz31i+uaKAprR8MzAcVfvEh2KRRs?=
 =?us-ascii?Q?r1paBPb/8n/jK478qQwwv+1AZaiQDhT3AdBqIKj3B2b9gAOSufkDtTJfBX3e?=
 =?us-ascii?Q?/vNjis2+mjz5c9XBVvkfCeGJYyeB/x9Zt6mNl1sa+k+VPCHwt44v4iZ3nb1W?=
 =?us-ascii?Q?CobwFQHqWlv6ObZGP/OLFcCIE2aujx0rpt/YI1/BnMXlndE7f09AxfIOeo4D?=
 =?us-ascii?Q?AZJH7Ooj1CxOHYfqJ/mW40v4rrGl9mCBLBK5oQougim8b+ZSABruygz7Q/GC?=
 =?us-ascii?Q?su2pPakkNlWS9IRcglr2/fxBYZ2mJ3h04BVYRi7+mDjrCVuPhGwxOrbP5uhz?=
 =?us-ascii?Q?bpWxCG7EjK3FM5NStXOlhUGqRuquhsZx54HGOXAfThF6wlpFJ4+EnGtDkG30?=
 =?us-ascii?Q?BVGO4c8luJX35huyAofSIYYicx4Lqa+JsKipwTRw47HfbFJ99UvDNC/40Pjs?=
 =?us-ascii?Q?2FUU9K0y8Tx6rYXm7gqUUj/9ZjeNjhPonZBIYYRYEceghJNZVPMtq1jzo33n?=
 =?us-ascii?Q?lO1EnWGNOtzKfvYwWSPnVrixZ/5DMknEm4ku5HB3b38Mpa9ys+H1JUA1OODC?=
 =?us-ascii?Q?xuJp1czmK/kQ+YxaeazQzsY15SMxf5FH2TajBvvSDW/RZuel5N50NbvNVFqj?=
 =?us-ascii?Q?JbXpU55iiOExbQWvCpSdmmzepmgceK8a97t9PMo7lymma+vtACxjvAMjelwj?=
 =?us-ascii?Q?yp95rIWlIeg8PHGow0uGvputSpisVbj60w2aipQY9JhorxE+AjuybOZD04xi?=
 =?us-ascii?Q?Ue4gYv5oepbIZ0Y61iAmhz5XOIgV9hP/caOp80VVn3rOLhxHiPU/Py7A/qHL?=
 =?us-ascii?Q?tLtMye9FgHv9delKmcuPHekC9uiZ5Chia5i1tcpmhCFBJrw2IEh0Ugv4lCey?=
 =?us-ascii?Q?OGXs9EpViepu8YivfRlpGRCUEJuC6P3IyQGpgG9fWgoBhIl8k1Jj/XOuXKwA?=
 =?us-ascii?Q?6PC4fxAOo1AjDXJ6+rawo16J1JPRJqfJbuX4fBL1L+VZ5NVipBSTz0wsgf4q?=
 =?us-ascii?Q?oS/0QV/2V+ohhIvAwOwFrD0OBlXwIf0B7AaokjTBAsEdVsnedoGB9CtHBZJH?=
 =?us-ascii?Q?0O+FcaJY2xUuizbk+dslWCsIACDr7NIUX1nA0hz5YZR9i+fakzDG7Hj7AGOg?=
 =?us-ascii?Q?anBghfgJoLMGIEGr4iwhld6ZVBWfG7C1FegRfuM37bPXx+3KQTbonjrpqoW1?=
 =?us-ascii?Q?Akxvrq4Cx3gRCnQnrpX3nzhY0PzchInUqGKnPnZnYHDn+NiI2DN+pA5SpfEJ?=
 =?us-ascii?Q?mBIilzy5tUEsALYheaU7iGeCOwe6rIHNZWYe7uLOECfWROuiLxV0EjclouGb?=
 =?us-ascii?Q?+P3YgvTDVYznqjfIhhkuTddTamKh9f25MAo0oWJbT+o/Wf902iBAYQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lex490FBmteS/KMmP/uPAxQP3IOwIXk/3dmBIa+IY1mquT/lret9z4J4LFbR?=
 =?us-ascii?Q?oHHFx1AcWETW3moU6FvaDMRGaQwB+Cyo17EcpC7MB++Hli2K1NbzOnbuQduO?=
 =?us-ascii?Q?nDLnFqjV4c5vCX7n1yZhfau8r4Cw/G98QBkPn2rb2f5j6DLQexrOEtoGPbUi?=
 =?us-ascii?Q?G6CjyWOzEINVX9PfobR1P4XTdO5v1A64qsvRLFbUOzpmGYsMocxqUqTC/olv?=
 =?us-ascii?Q?T18tvf6d9iGNfX3IIijiumDmTMOXVNvx8GdQ59YElJPYQ79DuEu+mhLCYWWT?=
 =?us-ascii?Q?fo3B+7VFacl5QqDZc12TQvDqFDzHeFfU99AoFSFNHri8vf4ZwUtNKx2L6U/o?=
 =?us-ascii?Q?zkPSwvPhfX/5sgQuCqMy06JVaSKmEsc4LahOc1kExYTwCfT+waXYiT4bDGmX?=
 =?us-ascii?Q?a90Ml8pIr2RmfQM85P3Gp5nbhlSr2fai1FhXyBlX3tVYMiZ8ikvFhBIXvdVA?=
 =?us-ascii?Q?4atyzOA4fgtz1Neb+NyEEdZru1HsM07yqDU8Rzw//6+S8uGNUH/NJIZp4K+u?=
 =?us-ascii?Q?6+yHyePHA4ecLc4RMGoFTfs7DAlW7Ya2OHNtK6IMH2CaoofxN8mdBBolpFGT?=
 =?us-ascii?Q?I4byYPZHE7e8p/muYwhUBb+lThLSUHC0Q4xW2ohQR7pfyPMJN3kG34imj0KB?=
 =?us-ascii?Q?oJEdtHTg2rggmygUjR5tQDEovqCNN9aGsI19s3nc6zbnBefcOXer60M7s8Ln?=
 =?us-ascii?Q?njM+drq8Sbqb31sPhiAZxh49ntsCclPtFI95xO4XcbEkTGd8I/lAXS0L/m0B?=
 =?us-ascii?Q?o4xYmtCsENB89+FCSjLE25xOt4lWihljAHQC06CssByqNl504oo45MkpWXke?=
 =?us-ascii?Q?bkqEFeKVohfpW+WbxPcB9JheCuZJFQ4P9jBwPBa1akZFzA6lR9yiZhYGmtWS?=
 =?us-ascii?Q?VBrcEJe3N8eH+4CFWBLzTc2wsf3mXTXItXg0GFtuoxQo0i0DC+oharLEA1LM?=
 =?us-ascii?Q?6pD1PWNCU+z96Vluo9lxaEdsLAN2QoPWS6ztYQdkf5bbVM+upzDKWqBAqQDY?=
 =?us-ascii?Q?KePtwAyrbMYrMw8iUyqvGsyjGaC/HrLSynimQ41SFg5POjOcPjxS0oBqR/Oq?=
 =?us-ascii?Q?S3Iu35+E5TNl6oi0QtxLGhGQjf3ikgItlKB0a/leMTJavVr9YJL3pLJy9wm2?=
 =?us-ascii?Q?ixGqQA3U4DsLGR8P4M7nSYuxTIXYupZqTkAuLZJo4My1ma08b6ZQIb9GhjsZ?=
 =?us-ascii?Q?FJ3eFUXGrC5rlpBkYGMMwkMhLylc9vcXl6OXttbLteQsmEZ0UCg3lObUUAF7?=
 =?us-ascii?Q?3gl7AtBzy3NZ09ShCm2WbPGstulyN/LAlalzmHtAc3no7CkNtJvAdZcVhGYo?=
 =?us-ascii?Q?lG0/xQ6XvNnNloDYrSYIUXekvtjDxm/IrjRfY6Ca4hAIa5XqL/aOg6YZqJ9W?=
 =?us-ascii?Q?aLC7cnWBZNmVFYkTGDz23ie8c5tyB7yquKlFTzi1568JEwCSU1f2CMoR43mQ?=
 =?us-ascii?Q?LTomxcWtAr7IGfBBw2ifUhW17Y0iaynHuQPWMN0XPeUWpQsa7E9+i2n0r/eV?=
 =?us-ascii?Q?YZCqPR7qiLBAlkhyBMaPU2JsbhQZZlKrpDWVko6r4+sbISnZGmWEeV6pDm8k?=
 =?us-ascii?Q?uh/vHVY0rgUZ7gB1BdU4eOVbLi4Z6moeaN0boDLF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6b4993-2270-41bd-b492-08de2bca4fa6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 02:28:25.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjcCngSv5dAnbD8LCLFae8NwivXTKbaeoWi1tEvDbDttVU7o1oS+yKIqvXjmw6P0Gppelxz9wn5GHFu0MqCWAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7895
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 24, 2025 at 08:15:46PM +0100, Thomas Gleixner wrote:
> On Tue, Nov 25 2025 at 01:37, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/rseq
> > head:   21782b3a5cd40892cb2995aa1ec3e74dd1112f1d
> > commit: abc850e7616c91ebaa3f5ba3617ab0a104d45039 [25/39] rseq: Provide and use rseq_update_user_cs()
> > config: powerpc-randconfig-002-20251124 (https://download.01.org/0day-ci/archive/20251125/202511250134.i0Jm8d7I-lkp@intel.com/config)
> > compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250134.i0Jm8d7I-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202511250134.i0Jm8d7I-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from kernel/rseq.c:75:
> >>> include/linux/rseq_entry.h:132:3: error: invalid operand for instruction
> >                    unsafe_get_user(start_ip, &ucs->start_ip, efault);
> >                    ^
> >    include/linux/uaccess.h:606:2: note: expanded from macro 'unsafe_get_user'
> >            arch_unsafe_get_user(x, ptr, local_label);      \
> >            ^
> >    arch/powerpc/include/asm/uaccess.h:458:2: note: expanded from macro 'arch_unsafe_get_user'
> >            __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
> >            ^
> >    arch/powerpc/include/asm/uaccess.h:282:2: note: expanded from macro '__get_user_size_goto'
> >            __get_user_size_allowed(x, ptr, size, __gus_retval);    \
> >            ^
> >    arch/powerpc/include/asm/uaccess.h:273:10: note: expanded from macro '__get_user_size_allowed'
> >            case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
> >                    ^
> >    arch/powerpc/include/asm/uaccess.h:256:4: note: expanded from macro '__get_user_asm2'
> >                    "       li %1+1,0\n"                    \
> >                     ^
> >    <inline asm>:7:5: note: instantiated into assembly here
> >            li 31+1,0
> 
> Definitely not a problem of tip core/rseq. It just ends up in
> __get_user_asm2() and then the compiler gets unhappy about the PowerPC
> inline assembly for whatever reason.

Thanks, got it, I will configure the bot to avoid sending further report
for this.

> 
> Thanks,
> 
>         tglx
>  
> 
> 

