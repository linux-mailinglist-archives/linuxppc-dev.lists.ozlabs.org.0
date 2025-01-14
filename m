Return-Path: <linuxppc-dev+bounces-5199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AC1A0FD53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 01:20:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX8sc4Tryz3cFf;
	Tue, 14 Jan 2025 11:20:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736814020;
	cv=fail; b=TQkltyaY6XxIzPVPHlB2dxzV4pQpdDQ9A58eG5hqjLqE1S4tf1nog0CX/1+km8bZ6Ux/ic0BZbtuGhOkvpClwmHWfv61H05locS0cHN5fvBdGZ5mPClPEjaS/YvonIB75LZTrZN0/0luysbJjmCeu1OSxR2uWR756JybM+NtfVzBhhOZR0xRBZyer8ppu6+qd499D6DOcUsDLC5v7vehG7T1g1lKgUQ+alMBNze7A4kbh9QUHDEGX7ASCSJW1cgzYsbduaqTesXI0F0JVZWv3rB1BueSfdepcymZKikmPsbjXY2CeunnYHMZ4YMYOEFGWhFUGgDBZtTmW5njigFp9w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736814020; c=relaxed/relaxed;
	bh=FBCVzAkowphirq3DXJhaHC1BtwnZGfNuJFJsgiImkxM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oTDO8c6tjybXQJZN21CcCKLkjSJcAyMMm+613fho+S8FSUJ2WSKXli472auUj4euZ5NNmkP7uIyQVADlV/o9A+qxb5xZmb6Y+322S2B3KIND1RwadA4M2OeS1lsiYcJv2e/9rasiCzylehYDZFUF+hO+3jAr89O/yGscxNHc++zPZjSIcuzAAQmjDHDavHnb+1xLOmEcD36DrloYD9y0L4xu9YMz7eLaU9hcyKsaL8ndo44oLXvEdqEO2wfl3/RKaLHdFXqg7jxOHbqWGKp8UbQRrMQtCnZLPRaWPdDSOAQ7dfvhA2DQeqXJHRX1vr79rZ3M3vuUCzEkFx8v0fv6fQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mjcE0vew; dkim-atps=neutral; spf=pass (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mjcE0vew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YX8sY6n79z30TL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 11:19:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736814020; x=1768350020;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rwU+UsO6zI4bPzyC6eBN46KIdct8xT4jSDf+Y51Hda0=;
  b=mjcE0vewrY39UIks8HCcq9/Fs1Tkl224kiNF4EEEwcm0sLpEodoPPp2a
   QoNwG75UGoG7lgNUw/Bp/xopggCEeptTXdQ3hQ27XdQyv1HGA0DMCBapw
   Es9Bb1hmwKTBN8etlbRqkMxL7+nnBnk05ftnDt5xmYQkj5PoqzYqZaO9u
   mxTaU1DmpL+UCpt88ENZuzR5WerUwRI2wLBCZ6XKI7STFCHpE93sGNVYA
   R/llqwOkdIuyEiInoccKmn2TwfeAEIe/bUJS/HRFTz4nrStyk8lnYuI1z
   Boc1/gD77ytqb1tgTrzzh85lbya2hszsOWBOUI5LInphg7S/U7mgglgS5
   Q==;
X-CSE-ConnectionGUID: RIDNkramT6K5psVsXBOVpQ==
X-CSE-MsgGUID: OBARzrgWSWqRrLg2SaMSYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="59581550"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="59581550"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 16:19:56 -0800
X-CSE-ConnectionGUID: 1vs3gYaKR3ya9Z1z5C4juA==
X-CSE-MsgGUID: szdNbJGPS2eMf+fRPGBj/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="109622774"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 16:19:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 16:19:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 16:19:55 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 16:19:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqy8g+qLUs4V3hETka21izlunlzrULvcRXkisqj5a6gmCVu1zESmd3xSWR5QjmN3DJYssW37CGVN3qzsyvf6hSXC8TwMg6QA/CexIBhhpdbcztPpH3UW4O424pUw8ALh52RwmPEBXeTqd46bAOEqPCEP8BXFYZMbzDdFduAMM4NhJ7po937T91eUWFlTUH6DXY/ZMMtYllAtggZJCpxT3s/FRiks+ZKjeSM9gnL8XfVQ0NmyzXLUbE52Esg5kIq16m3UfwZHCaXX/iPY6vYP9YXSOfvrGOen/WDSExorghxgjj65Xrx/eMnYsal1dS5v2jTY2rQ3ATC4RhqytJoOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBCVzAkowphirq3DXJhaHC1BtwnZGfNuJFJsgiImkxM=;
 b=OTDltwSCETp1ACviz+YPAEqWyDmK/7d4EF9SIrWUbx3qd6ZvNdJIcHQGPidJgSBeHL7d0ty1/vbHCRi9+0LidBJR73w17ABDVz4pi6lb9CLReWuPrabi7AVBtxmIALiYUb659bzfbZTeFZgsvZCL/YINUhRVZCrLE4AWfMVTDPP69NH3VBAxG2kWWuduZkyoy8TYBMDVx1qbzzyzFfrohJwSJGGj+IxFVAMTarAT0a/IKzWjNlZnsP+C2S/vqP2vA6VZbLG5Iq+I19QhVTWTUdwv9gIIUwNvShR+Ge3sZWnUoTk9LiE7GSr31IvpJCZZfSNLelp1nscxUC6O3TCImg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH8PR11MB6853.namprd11.prod.outlook.com (2603:10b6:510:22e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 00:19:52 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8335.011; Tue, 14 Jan 2025
 00:19:52 +0000
Date: Mon, 13 Jan 2025 16:19:48 -0800
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
Subject: Re: [PATCH v6 05/26] fs/dax: Create a common implementation to break
 DAX layouts
Message-ID: <6785ada48f85_20f3294e1@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <79936ac15c917f4004397027f648d4fc9c092424.1736488799.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79936ac15c917f4004397027f648d4fc9c092424.1736488799.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW2PR16CA0039.namprd16.prod.outlook.com
 (2603:10b6:907:1::16) To PH8PR11MB8107.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH8PR11MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: 6651a18f-cabe-4910-0505-08dd34312a3e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blYvK085RkJHTjZsVzVEY1FrK08wcU1WS1pZN3p4ejl5Z0JOeXdvQzIzd0tH?=
 =?utf-8?B?OHZqNXBBVHBQUmtWWmlIWHJZWGthK2NRSGtLaU5RcGNMc3B4SkJrQ202anJi?=
 =?utf-8?B?S253UmdQYUpvRGVuSU1uZEdRM2JVZlFXc29sZjcwOUQranpUWXJrRUtMRDh5?=
 =?utf-8?B?NDkwUC9mc3I4SDVVL1NUaTYrNnl0L0JoNFZBYnBsVzAxUWs1SjN6aTFUTVVS?=
 =?utf-8?B?c3hFTUNnVkZvcytZVnM2VnJrREZpK2IwT2tDOWdPL2RVS3dDSUsybHV0TjI3?=
 =?utf-8?B?dlNDcVZYNVhUZnhaKzZrVUZ5U09GdUprSHJQeUpJR0pxVDVNaFljWG8zOFlN?=
 =?utf-8?B?ZjFCWVBEbVVtenFQb05lOEVNcGNZVFJPcEt4bW9PK01xNnlLeHcwTzNlcXgv?=
 =?utf-8?B?MWtCMG96UG4zSkJXSHpuWUN3dFlBMXF2NzYvNFB3RGNhU3dPSmhlMngraGsy?=
 =?utf-8?B?VUtIZHFPZ1ZlUEFDMXFzdVNjWWlmTnFoUjBxaERVZG9NRGVMQkJJZGllRnhG?=
 =?utf-8?B?SmVzMlN5WHVuRGJ3M0xRdmxnOGdzbm9CcUJvNHRleFRuKzlubW84cHZHdHdD?=
 =?utf-8?B?RmRWb3RMWU1EYXVjVExMa3pWZGE5elVLRjVyblR4Z0JodDVjRTFIVC9YeS95?=
 =?utf-8?B?dlhKMGs2UG1ieStIamJQMEhXZ2FxQ2dpbnRpMmUwOXdWRmFJbUVIZGVjTW9J?=
 =?utf-8?B?NzFlWlJydEY3VjBjMDN5MFRUYmtuc05pdlg4eVRjZ1NRYURaTVJLZGloMzQz?=
 =?utf-8?B?Ykx6N00xVlZSZDJUR0lBc1pDb21kb3dpTWI4ODVHMFZ6am5GRVRUYmZPeU9s?=
 =?utf-8?B?eE9UeTliVVI5ek5yVy9laHdhSVRtaUorbzJPRFpZdVhGZG1UQ3VSVGpZQmRH?=
 =?utf-8?B?RDZndkNNMXlQYmFVNy9FYlF1dFRaYUl3YlpUM3pKcjBXcE9EM2RsaEdORFRh?=
 =?utf-8?B?dEtHRHdyTHZoTEFtRjZBblR4TkZJQjV0ZkMyZFNyL2dPL1puWDlBSy8vSmIv?=
 =?utf-8?B?Um02T2hrZlNyQkV1bHBJWjlsNlFCVllvTkl3eHQ1S1EreVlUZEtTcStpeTgy?=
 =?utf-8?B?a2VCWlBDeHdIK3NWNEhjL2wzQXZYSWgveG1URVpGN0tKUHFHYTRZeDFaZTJB?=
 =?utf-8?B?SUtpS252TmRnSDNFZEovTThqd2h3SGFqZVlQcCtuRWMwOVJLeHdvVXltVUFH?=
 =?utf-8?B?b0JxeDZseExlUXhoS3UxQ1pKQ3hpY3NFeE8yaHcvTWpZdGF6dFkrR0FxR3Zr?=
 =?utf-8?B?bCt5Qm1GWVRPaHAwYW45NnRyUEU5UVkyRUJ6bmVuaEtwMWZKdmNtQmtLTFVv?=
 =?utf-8?B?L0VmUXpYTWZwck1DTi9hdG12SFJDRktyZmoxN29zSTJvQ2l2MDhWaEVITTMw?=
 =?utf-8?B?ZTVKdEY3UnE3K1Z3N3BsWFRXVUc5ZVVKUFhpV3MyNjdmODZqYSs4T092TXc1?=
 =?utf-8?B?TWFFWlo5Ulc4M3ZhbytWSmRveDhmOFdGY3pxdStMbXVGZjh0U05naWZNUG1R?=
 =?utf-8?B?TUpmQUxoT3R5Q04wOG5RZ2hpclFjNWQ1Nytqc2RlZkRzVUdJUG5iRFBWZVVx?=
 =?utf-8?B?STlraU5sOXl3TlpQQ1VIeHFEQWlSYjJZMjIwZ3VCVlRaMXpRc1NwWTMxVzlk?=
 =?utf-8?B?T2ZCZzdzYUkxTEFBU3pqOWxMZnBzSTZYaU5mNURyQU9lNTJ6RFZZRlp4TjN6?=
 =?utf-8?B?L1R1U3JDbE1HMlZtK0Q2Z3IvVFQ3bDgyaW1iZldvV21KeUVyamxWQ05BSmtF?=
 =?utf-8?B?U3NTU1JQWXc0ekhaRG4yT3NwWUM4b3Vjc0cxWTY4VEF5OEovRlFzdWpoeGp0?=
 =?utf-8?B?V1lCb3ZUNVhsZWZ4YjlWOGdsQW9IYlBmZmdXSkI4ek11aVlvUWw4elBrbVFG?=
 =?utf-8?Q?q3EjPmM+wX+CD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGQ3TkE3cCtvQmZsT3daR1c4eTNiSktSTjduS3FPNGNQU1Z3amNRQTMzOHNn?=
 =?utf-8?B?OEVaNTljRElxRGVrS0N4NzNrL2F1VWJ0WFkwbVFxcnh4U1FQSkF0dnhxanoy?=
 =?utf-8?B?VW5VdDdNaGs3S1F4NmRKUTExdWNHRHFVSDZyMnlIZ2hLN1dBbFJzUnVYRzFQ?=
 =?utf-8?B?Sm9EOEsyMXBrd3lMcmMvVnNxUy9UY0I1MFhvdTRMdXBXZzMyOHRyK2F6Zmc4?=
 =?utf-8?B?UCtKdDRJRGZxQXM4a0hETUZJOGJnQVhXMVRrbnMwdUlOUTNoaWRZV09qOHBY?=
 =?utf-8?B?VEhvbTdUek1lOEYxT0txQ1p4UCtLTDFQVWhmbjhXOWZGN3dxRldVRldFWjE1?=
 =?utf-8?B?Yk5vWjVkdXBORm52a01EUnUxWVBna2lvc0h2TGlCWndSZng3WmVpeVplREVW?=
 =?utf-8?B?V2kvTmRiR2lnS2tLTDJhQVB2bzNhNnhyMmhKcmphWGcrUW0yUWNtMDY2MldU?=
 =?utf-8?B?KzdBWTV6alRueHlmZjkzWXkvbWlCeHlvQUNlTXUwbGUwZjV0aUVSN0NydGtt?=
 =?utf-8?B?T05meFY1dklDaStoVWlWKzhpNWhNcnpud0dCYVRVMUpxWXduVnhvWUp1WmtT?=
 =?utf-8?B?Q1N5SEhwY1hWM1kzaTN1bjJBTVdaT2FMOUlmbVAzQURSMUl2dHhQOXZBZnJm?=
 =?utf-8?B?bGY1V25TVDJyeVdRbnc0cTFYMUM5RW9uVXBmUUpsT2dBSUFnOXFVNXZybHRO?=
 =?utf-8?B?OHdrajBjbkdvZnNwTEd0YWlIeUdLRW9BaFlDMi9SYjBGb2hweXRTMTVEUU5i?=
 =?utf-8?B?MVRtVzVYUjkvUk00T0tqU2tEcDl4OTBHOFNzaHFQTnUwS05SaWhlWkNqbFhD?=
 =?utf-8?B?NXZtYWJRcGJhQmNiMVZqZVh2R3UxQTRnQ0p0OXRoRUlVQUNNRUVlbmM4akFM?=
 =?utf-8?B?R0hUVWlHMncxMWc2QjNvcHB6ay9qSkFhWVZSemQxUWxyWXk5RXZ0VzB6VDlw?=
 =?utf-8?B?TjdtY2xIcFY3a0F3OFAwbEl2Q2g0czJDbkhaL0taTDEvSFZuR2dWbU93MXpt?=
 =?utf-8?B?azVMQzFpK2hISDd2Sm9MeVorM0swaCtPdWtpUjd5ZmFzalcvWlUyT1FFcGdJ?=
 =?utf-8?B?dlF3U0hJTnI1S2l6cXd1ZW1aVHlEU21UV2FPb0F0MzgxVHNBN2pPZGFEUEJm?=
 =?utf-8?B?V1VxRW1lY1RWZW56a3M2dkk5bDh1TVV6ZU8zeThWc3R3L2VFdWdRUTVDUWlR?=
 =?utf-8?B?bTByc3FTaTdxRlVXbDRHaHAzN0UvV2tHSU1uUTdYSVZWYkRkeVQzWnJ5b1Fz?=
 =?utf-8?B?MnkzRmpLQjVtZjUzWEtUZlFBRGJVVDFTM3ZCT3JtTnFhd1Vtc0t2L1lpT1FJ?=
 =?utf-8?B?WmhjczNZOTcwSWlnZnJMM293OXVHK0F3Qitacno0ZCtVTE5xNzhuMG1sVDJQ?=
 =?utf-8?B?Y1AydHd1eGovSnFNN0IvVW1WK3pkeUM3cm9QR1o4QWdyZHdGaGNSc3owQTRJ?=
 =?utf-8?B?VGFTUUF4RFJINDIzWlcybVBDeXJrVG56R3RvYWNzYURqVHZmOUxwSzRuM0Uv?=
 =?utf-8?B?dWg0Sm00Q1pEU0dHb20xdkZEb2xzd3N2WCt0a2RJUW9IWW1BajNPUlhxcjgz?=
 =?utf-8?B?eUZ2cmVmVUoyVkpyQzRWRVJVbnlzMkRrTS9VS2twZGh3UTF3YVJmQ1BPcUlG?=
 =?utf-8?B?MitJYmwxUnprWGxQQksyY29jUnlOaDFSVEpJTVU4Q3oyTERRMGpWSkVOZ0FW?=
 =?utf-8?B?UjlDbnJxaGlGV2Vza3FQRGptMGhpRUtVeGJuaXU0RlhzSm4yUmtlbFVYSkVj?=
 =?utf-8?B?K25mWktPSVljaFB0ZFBQTjRTaGluL0dVelRKNGZNNElQaGxaWjR3amU2eWkv?=
 =?utf-8?B?aitzTEhmZWhPdDBYZzMrcHUzVmV1Tm9Id1hydUFRN095TGZjYkxENTdoNlBq?=
 =?utf-8?B?S1FBNlA4N0FydTdrTzFCVW5tNWtSSFNXdFl1ZVpvcFNGZXEzNVhwZ1l4RXlz?=
 =?utf-8?B?eEpQVW1ZTUlUMW4wOUVtWWE0L0tSUW9ndVF6Q3krdFRHL1kyejM2eEV5aUpj?=
 =?utf-8?B?cnBROUZLeHJJVFgvdUJXOEQ0aGNIbzJHN0FkblpQV09MQjU3NVpvWU93RzBm?=
 =?utf-8?B?RHRXQy85NElaOTlrNEdlK0N3YXV5c1NVcVlQdHJ3SnpmNUZvMGlKQUhpSHNa?=
 =?utf-8?B?Vi9QdEtXcTFLbDV2bkV0aXJIQ3MyNVdNTFZueHh2QVNBdDZXVkx3SFhmRHAr?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6651a18f-cabe-4910-0505-08dd34312a3e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 00:19:52.4942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1TrGKFP5D9WMMTtQPvGLcwWFzV7VFs91Wst9JATlYMO6ARemgRUaaBGDE5Dm2IhyuWt5nU4lMvk3a+6ib4TtIiW8zPLdDM0ds6u3N6JUyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6853
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Alistair Popple wrote:
> Prior to freeing a block file systems supporting FS DAX must check
> that the associated pages are both unmapped from user-space and not
> undergoing DMA or other access from eg. get_user_pages(). This is
> achieved by unmapping the file range and scanning the FS DAX
> page-cache to see if any pages within the mapping have an elevated
> refcount.
> 
> This is done using two functions - dax_layout_busy_page_range() which
> returns a page to wait for the refcount to become idle on. Rather than
> open-code this introduce a common implementation to both unmap and
> wait for the page to become idle.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> Changes for v5:
> 
>  - Don't wait for idle pages on non-DAX mappings
> 
> Changes for v4:
> 
>  - Fixed some build breakage due to missing symbol exports reported by
>    John Hubbard (thanks!).
[..]
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index cc1acb1..ee8e83f 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3917,15 +3917,7 @@ int ext4_break_layouts(struct inode *inode)
>  	if (WARN_ON_ONCE(!rwsem_is_locked(&inode->i_mapping->invalidate_lock)))
>  		return -EINVAL;
>  
> -	do {
> -		page = dax_layout_busy_page(inode->i_mapping);
> -		if (!page)
> -			return 0;
> -
> -		error = dax_wait_page_idle(page, ext4_wait_dax_page, inode);
> -	} while (error == 0);
> -
> -	return error;
> +	return dax_break_mapping_inode(inode, ext4_wait_dax_page);

I hit this in my compile testing:

fs/ext4/inode.c: In function ‘ext4_break_layouts’:
fs/ext4/inode.c:3915:13: error: unused variable ‘error’ [-Werror=unused-variable]
 3915 |         int error;
      |             ^~~~~
fs/ext4/inode.c:3914:22: error: unused variable ‘page’ [-Werror=unused-variable]
 3914 |         struct page *page;
      |                      ^~~~
cc1: all warnings being treated as errors

...which gets fixed up later on, but bisect breakage is unwanted.

The bots will probably find this too eventually.

