Return-Path: <linuxppc-dev+bounces-16119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNFaOOXPcWnSMQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 08:21:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BD66277C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 08:21:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxXXx5wQLz2ySb;
	Thu, 22 Jan 2026 18:21:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769066465;
	cv=fail; b=V3TN7yTzCpkuEmoDVNdEKHmu4I8JxhaUi0jwLxeTuHIIbTAfF+6a7Pw5upX4aOBget26e+ekOxXOHeXRP9o0KBr3Ky7/D6dP5UUHS7jyY+NxmjwrVlmwxtVTVOkQ2Cyu53HOaC4IHlXXnNdKEF7WI4P419vf+zTzgrFHypTT4zXtmwLBy5dJyca0G1bire9q/fzoHCzjKDya0xjKxVLW7UX+II+s7e85Ulov2t1EOH07ZNcNV2UAJI9dNGz0C5GDB4hXED1U0Az5vQLiqMbnLCqmkJVkKLQkrz+6KgZJI/8UjfyRp7hThDQ+u/pnPSO+dPbx7loFfVCMK3lSc76hPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769066465; c=relaxed/relaxed;
	bh=Vpp0BjdYaSjPEGTyUrlUM8/7+7yMaOLnIOsUBtvsURo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lxIQHIwcD+GpLjlgHq9hMDKo9IyrS1yQrlf0JxJ+AZQrTx8Y+G9XDT2C8c1lnKbn1B30bRl9BgvMhUjOit6oIjE6VZcqdzB/1VA+g+E/W9Jv+olizpuPMMkcF+F0EB1OgFmmKkV/f9w6N4et5WEtjDetTNPLpIZ2MPsCKkr4VL0ZlnbS6RQqyGJvud8VSEWFvCkQ30XfUAGEizub0oMYT/kQDuqTu+e3/m6iKr9iCCrShM5vp/teulTxuFWqx8xMLUd3nrnWCpZqtak3V5g5x7AV3jyodzH5HR7K7PPY1SzCCvIKi7JXgqBDMI5wV42ZO9aQiHohie5+Yz/pU0+VDA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MrDxy/Hx; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MrDxy/Hx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 22 Jan 2026 18:21:02 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxXXt2hjHz2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 18:21:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769066462; x=1800602462;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Z4QkvA6YaSEHgRxKpZoqYM/SfzsRr/RZN+7cnihz+mk=;
  b=MrDxy/HxgPZNq8GiAm18qB+V7N+p62pHn+B0VaKiUUAJvlv6aPQxUv3d
   DPC/EjnZjC8Et1RxZN67U8SyCH7c/uqg9lJqr3547k2d0+RC3xD3z90QN
   sJDDeCIkflnMky3AqNy6Z+GRh/MHpSZgrX9OoXJZ9DMVj/yOTQgXxzvJZ
   uf3iq/MTBw8brgL80b8yaoXjtI20mgvgpgkW0cQzzlR1mM5r75NhbZ/mw
   my7qMKQMjp36utK7ycvsndsf+R9SE9hds6mSL7SOZ8Lx/sNT9Vp2oOqgf
   jzFzuRFbMEYVgfL2xAuFyM0Q0kRZ1aKreOtTU85VhR6CHYTFFRbomKno6
   w==;
X-CSE-ConnectionGUID: KCN7lG3XRbOpca4zSuabGw==
X-CSE-MsgGUID: 8JaNZxJnTWCprmuhPkWeEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70218624"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="70218624"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 23:19:53 -0800
X-CSE-ConnectionGUID: hA7pCq19QASVCx1ifvFYBA==
X-CSE-MsgGUID: 4FN7r2WrSVKLSM0oDeU4pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="210814141"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 23:19:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 23:19:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 23:19:52 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 23:19:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6JVxiDpp0blTDAC8M7h8LD6Bxm7DZMQylLc+GaVZyevuE2udlAELr8SSeYqS3suJ0Y1lo7ErqK3y+0WMLsT6yHsqzoS+6jmhMoVR6TdUHgoSqZkghaJmB2+vgjkeBI29lBqcevrRZqxAKDGsbWZfmQ9uvhPT1TtDpOpC9fxtlzyIbB7BiiaWmyBgfjAZ28drQ7ZaC43obDWIZZ8GD9yq4Ls64Tb49lJsCcQ+5CDVA7VWmSsfLFPS7vmC0w7QiWEQdkcbNwZRS/smrlMgYs4yzKuvoXMjiT37FR4ureIY7ZvYqrS8Byo40mk5t909FSHd5CwfTUCR9O/FOCLiQjAwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vpp0BjdYaSjPEGTyUrlUM8/7+7yMaOLnIOsUBtvsURo=;
 b=dflqETHieaLEt/rm2cu9rFWdrEfrpr1q0QS+UmewTCjDzw4VglCuImX9A07dJ7X8HF2jidfd8GB402+Zpz3XU94uCuUyIkBlSU14jWfExHbQFMVMnjOAeopXYoBpCU4Y5mYpjNaVZ7to0Hsd1eIIrnEM8jpCSxi+5QLAY+gRLSecj5RVQCzyFxSAMZreTJ2WAb6qle19WmF1BNZOCVYbPJyn+HSnfQnKON4WCCRB55gXKwA1Ht5h6KkJc9h0dERcM+pOgB/gEEs+AIilXClwcHJbWdIpMT+A+rTA5dslZ1KBe8DRMDcjOvF2lJ8+4T8nUrJYidx5iC7Fyww3wKJkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6982.namprd11.prod.outlook.com (2603:10b6:303:228::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 07:19:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 22 Jan 2026
 07:19:49 +0000
Date: Wed, 21 Jan 2026 23:19:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zi Yan <ziy@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
	Matthew Wilcox <willy@infradead.org>, Alistair Popple <apopple@nvidia.com>,
	Vlastimil Babka <vbabka@suse.cz>, Francois Dugast
	<francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, adhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling
	<Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>, David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>, Andrew Morton
	<akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Liam R . Howlett"
	<Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
	<linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-mm@kvack.org>,
	<linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <aXHPkQfwhMHU/oP6@lstrano-desk.jf.intel.com>
References: <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
 <aWsdv6dX2RgqajFQ@lstrano-desk.jf.intel.com>
 <4k72r4n5poss2glrof5fsapczkpcrnpokposeikw5wjvtodbto@wpqsxoxzpvy6>
 <20260119142019.GG1134360@nvidia.com>
 <96926697-070C-45DE-AD26-559652625859@nvidia.com>
 <20260119203551.GQ1134360@nvidia.com>
 <ef6ef1e2-25f1-4f1b-a8d4-98c0d7b4ad0c@nvidia.com>
 <EE2956E3-CCEA-4EF9-A1A4-A483245091FC@nvidia.com>
 <20260120135340.GA1134360@nvidia.com>
 <F7E3DF24-A37B-40A0-A507-CEF4AB76C44D@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F7E3DF24-A37B-40A0-A507-CEF4AB76C44D@nvidia.com>
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: e45038de-e53e-4b57-9ca0-08de5986a0f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czB4ZjRQd1M3MUxTMkU4Y28yTWJ6djdHa3VaUXkxV05CL2VaS1ZDNVBwQXlw?=
 =?utf-8?B?RVRXWmtEYW5kTndza21lM2NRcFdpWExxUVNmWThFTW5WWmNYd25VVGdBRC9w?=
 =?utf-8?B?RDRCZnZoaHJ1RVErbmgwSVd4OWN6ekZGbmlVdzBWV3VRVlZmbW9lWmtRZlZR?=
 =?utf-8?B?L3JROE9ieitHMnF3dk9FOFk2b3BKQ3ZuTHMyYVRIYjFUMjN1em5NV2x4SHQr?=
 =?utf-8?B?QmdRRjdJV2lEK04vOXk5ZHIrd3pnV2lLRVJ2MVRKODFLZ1pVdzJLNE9uL00x?=
 =?utf-8?B?RFF3TVREaHYwQjViV3lWYjNEU2ZwVTJLWGVldCtoVk5JRngzenp5VkE4ZE5y?=
 =?utf-8?B?b0pOdXoxRE56MC8yemVZUDBpd0ZzbXB0YmoxZGxNa1pKTk8yd2lZZUFYd3hx?=
 =?utf-8?B?bmZDTmYxYk04aDVTb0d0MXkzZjBHVWhlNXozQmNlekcvYzhWVlF0Q0RwTVlT?=
 =?utf-8?B?MXUwY1FoaXNNY3BTUzZiaUcwcDgrTnhpR0pJVnJaVTBqL3p2LzVsQjdwOWNK?=
 =?utf-8?B?LzNWdHpUcERWZURGZ1pUZW56NUpQOUxCTTNFU0NmUVFTZU1BaWhjbllLZDBv?=
 =?utf-8?B?Z0hFa2NkZVFVNkd3ZlFzdGduMUFaL0thR3ppdjYvbmtiTGxHUHlkUWhEUXZm?=
 =?utf-8?B?UUZCOTM3MlJLcTR3RGZjNmVzY3B6K3pSd091akNIZFE4RWtIR0VYdmVzU0oz?=
 =?utf-8?B?czBoWW84eFdVSmE4UlRYYm5KS0p3bFd5OGpCOGpDKzhZV2N4SGlrVG1scENz?=
 =?utf-8?B?cVZWYkUxdDZuZExyOVRCc25COUIzVkF0N0o3b3IwN084azhPUXdrWW95QUFV?=
 =?utf-8?B?S2hScFlaOFdpcTVhWnVjVzN3VGpmdlhzRVBlMjNxcDZDV2hBRkJHSTZlTU5l?=
 =?utf-8?B?TVZyTkdkbHU4MmJMQkpvL3Z3YlNCbENWUWFOK2k5Qmx6dHg4eDV4UFl3OHhT?=
 =?utf-8?B?a0NrK2F6SkJSd2gxbTROZVpGTjk5TURxTWZoSk50MWZ3RzhENExxbXhxL3FD?=
 =?utf-8?B?Ny9GUFZEUU9PWFdZMW9oc3g0UXorcWl5eUFOQWxtMWhHN2xxeER4OTdsUy9R?=
 =?utf-8?B?SitRVjRMenErODN4SVEzdktjekNJZUNsVE5iWWFsL3JEVlcxcFAveDBpdHh4?=
 =?utf-8?B?QmkreTlLcDhQc1hGczczeFdTWFUvd2FhMkZFSk8vS1BrdFpDQTlOREpRYlZR?=
 =?utf-8?B?czFuRyt0eEdremQxMUMyRzUvUFJ1UGpVakQ5MHZIRTNaNHQ1cGxhMGhBakgw?=
 =?utf-8?B?SHBSR1I5d2haMkRkT29YdU5hZ2h5RzRoeElQbHpMSHUxS0ZHNXVvTHhsd3hX?=
 =?utf-8?B?eWJwNFUrV0VtejJLMURlcjZ1a25qV08yclRLMGlOczBhWmNjNHhjemtzVGNL?=
 =?utf-8?B?cUh3M3hUQXl6Rm9acmc2OGkyWVB3a1NiZ1c5K2pjRWRQMXlWczBwczN5V2tT?=
 =?utf-8?B?MStzNlVLbWZKbXN0SUwrRTVwYlc2MlZKUi9DWHQ3Z3VXSkhZTTdubjVjWGtu?=
 =?utf-8?B?aExNbHJHVXZTNjAxT3R1Tnh0dzNOdmdkc3RNUk12RmtyTHhlemdDUVJxUXVj?=
 =?utf-8?B?VzRUM252QzNXbC9WRVo1c2ZRSlZRa0VHdG5PcEg3WjU4WFdSbHVVMHJyYjZ1?=
 =?utf-8?B?UWhYNU9RZjdXeHJLVnJFa0drckhFWmpwMjRtaDdtRkpkaWZVUmRKODVxNUdN?=
 =?utf-8?B?ZFptcmFEY0VHTDNWdUNrc0ZuYm9hUTNpY3RzN000dCtLTVAxK3B4RWVkUjZW?=
 =?utf-8?B?d0RNNFJsWDBxV0J1YjRNSm9xU3lBWGd0Z1ZpTXN1Vldyek5NZG9LVmlOL3gx?=
 =?utf-8?B?OWcrcENrWVAvYUNKL1dRTWdOTEFKS283WHIrMHE3ZGRhVkFVd1p6Mk14bk5C?=
 =?utf-8?B?b25EbFZhZE5BZWJLc21URklSMjd3VlU4ZlFVRXdocG94QlVpbzVKTGJxY05v?=
 =?utf-8?B?bXVFUVlLekRpZ2lDUlluRERheG5GQm9MNlhuY0R4Qlc3YVNudXlhUFVjV3hy?=
 =?utf-8?B?bndERFZHaHVJSVZOVVhFTCtSNW45dlEyci9sOG5xeWRKRXFWL1YxeGNpeEZx?=
 =?utf-8?B?ckFFR3lvdzB1clJuNWVnalhVeG50V2JBaVFhVUY2ZjZkV3JJVldwMjF2akI2?=
 =?utf-8?Q?T1QY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjM5cXJubmhQRStXUzNhRk9HRlZ3TmhMMWM4UXNKd3V2V3hmQWZuSk90UU51?=
 =?utf-8?B?ZUNVMklXSk8yT1VZU3RRYTJaYndjQ2MzbE8vOUlQbUFvVjdoSmdiN25QQ3Y2?=
 =?utf-8?B?YWFzRE9FWDRXWmg3aDQ5dkZ0d1ZHY3g2Y2tBTXVqTlFmNFhFemhTMnlXN1pt?=
 =?utf-8?B?eGE2aGtYbFVpRm5LRThrK2hubmNPREVoK2h4WCtpME1wN0ZRVVdkL0NpdzVu?=
 =?utf-8?B?VjFSeDY2TWdYZnp1Z1htd3NuSzBpSGV4WWtpdm5XdHJrTWVvSEZRSCswQ1pp?=
 =?utf-8?B?WDNUck9LcVFOT3NuaXRvZDJzNWpWQVRCcXpxRXFBVE9NKzA3dUxzRWZsWDNC?=
 =?utf-8?B?Zk05VlRMSDZwR2tJVUhCRHdJQjk2c1FuZ3M2RnNCdTAwRCt0dUF2VXdIZUJz?=
 =?utf-8?B?d2F1UnFabTdmMHVPVWJCQkFaRFRySEJ2a3NoeEU0TnE0eitnN1NqdjdLeEt4?=
 =?utf-8?B?VjJXUzA3ZlRsTUFtQVp3NEdOc2hIQ3hsSGVyT2xhQ1UrZDVJKzBhbG1CV2Fr?=
 =?utf-8?B?TWZrbEVmQ2RqQW1DTUw3VXNKQ3lzcmg1TWZESm5rUGdLZFI3bFlETUZDQjhJ?=
 =?utf-8?B?UDhaS1BBTG55K3RuZEZ2NmhQNWhsT0d5S3M0K3pkNVZQNXR5WjllaHJPZGk1?=
 =?utf-8?B?NEZsd2N4bnRldThhb0FXZGtnc3c0S1V6dFpWcnY0dndvU2NQTEc4WFNkTm15?=
 =?utf-8?B?K2dwVFNGZCtobDRzZ081UzdVdE5wLzh0dEsxYnQrRmltZUxwaWVSUzliZHo4?=
 =?utf-8?B?MUc1TWFjRHdWcjUzNnBYNURWRTRRYVUrTnk1Q1VuTnR3VFByM3lOWE1KR0pK?=
 =?utf-8?B?MmJxa0NEbytibmlJU0cvTDNMWGxYK1VhUExjVnAxUlU3djVoL2ROZU9tVzlP?=
 =?utf-8?B?Y1F1WFNjMHpUY1R5aDBCbXhsZFlkWU14MFlBd1JoMnlNV0RrblNlQ3lkc2J6?=
 =?utf-8?B?a2pjNFkzaEhFWUhIekdML2dTcTJHaWpUT1J0VTBGMHJXVEJ6aGpBbFk1eHpy?=
 =?utf-8?B?aDZGdjF2TThMUjY4dENwdVNMdU1QZUdxbW0yOERxbXVTUDVPajZRaU5nNjFo?=
 =?utf-8?B?Nngwd09IWXY1aEF3c3JWRnVzR0JiRWNTVEdqWW82dG9uQUFmV250b1NJTEJK?=
 =?utf-8?B?WnZTeGY0SUlMMGFEOVNCclByTkxOZ3ozY3lBcmVUdTVUT0VkVnhteEhIdTE3?=
 =?utf-8?B?NFBBdnFTc09VWGpKOVlWNUxlVGlYaW5ldW85SlUvRkt0MTl0Zyt4ZVFNeTRv?=
 =?utf-8?B?TGYxK0xqRlRmZ0dtTWlGMHVZeTdsMzhzWWJkeVJ5RUEzWUZXTDN2cTlhTTFQ?=
 =?utf-8?B?ZVRoOUZ2RTRaaS81Q1ZEaUVNZlNKVHF6QTY5SG9xdTh2ZXIrWWdwbmsvSDA0?=
 =?utf-8?B?bVpOd3NLUkRJMW41MS9JaTBZYlh0WVU3bWVXZDZYMjkvdVUxam9LMytVQURq?=
 =?utf-8?B?NGJtVzJINE9vYm9vQWlvTXhJM0U0ejAzdnNHQ0lFWHM4MGZVakFOeWVKQ1d5?=
 =?utf-8?B?eE9OSFhUZWdueWdCWlRXaTM3RHNLWXp0NnVwTUJpZE9JdGIrVk5yaS9JSDl4?=
 =?utf-8?B?dkxwQ3N1QWlyR1ZMYzdXbkkrVWppb0JEZFFwaUk5M2haQ2NjU3JqbXhmSmZD?=
 =?utf-8?B?cEpSMzErWEN1Q1JsM01wUlgwQk4wWlU4RllTU2NaK2IwK3FPVGlMM21DQTk2?=
 =?utf-8?B?V1NveDVnTm5Zdk5WVUsrQzJwV3VEM0NGeWduTi9MQ0tuMG55Q3BvNHRCWCtu?=
 =?utf-8?B?K2lFTXlvUFhJUUVsaWJJdVZFM2U0WHB2eDhpNk9KL2luaVJIRUdLeVdScVdX?=
 =?utf-8?B?eG13b3gzV2lKL3RtN2s1VUpGZzVjZFFvUVVQalhOWmJCd2lKWlVWZDZpQy9p?=
 =?utf-8?B?NmJmaTRQRlRJemxuM1F5MUhvN0J3MlBBN3F3ZFptZmNLYVVBN3FEenVCVFVJ?=
 =?utf-8?B?citnSGNVSXA5TDF3aUU1MitCK0NHeGs0VVZ4VzdWNVh4Q3V6VmM4ZmhXRXVm?=
 =?utf-8?B?K0VVd1gvR3pZbWZkeGJORGwzQ3JMaFh6VTRCa2NKQjNuaTlGTWNyZkg1VmJ3?=
 =?utf-8?B?SHp3TTQwV2dKTURSZzJIWk9BQlZaY1h2UENPcVN1SzJHZnZuRkZ3KytaWjUy?=
 =?utf-8?B?V0tJampJd0lQa21IZ1JrZnhiazRCSWRUZDhWeWVrRTJ5SlhrbGVDQU5LTDl3?=
 =?utf-8?B?eGZRbGNUeXozRnVrUDUvaFJZQUNKR3hzVVhGVk5Ba3VsWDNPRnI4ZDRhT1Rk?=
 =?utf-8?B?dTQ3WUg5QVZrMllIcGcwSW1wQ25nakxPekFWS0habVoyVmtzM1I0eVRtTzVO?=
 =?utf-8?B?Q0RVdGJnUVdXTWcrcy8wODZydkFqU3UzYW9XTG0vMUZVdTFFUmxoUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e45038de-e53e-4b57-9ca0-08de5986a0f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 07:19:49.5712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cc8SrTJ0ZKI/r8/uxaSMVB0s8p9QOzuIsG9Oy3AH3emxPKc896u89OWizXx2KiCvn2hNWomUJo119STW+5Tawg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6982
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16119-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:jgg@nvidia.com,m:balbirs@nvidia.com,m:willy@infradead.org,m:apopple@nvidia.com,m:vbabka@suse.cz,m:francois.dugast@intel.com,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lyude@redhat.com,m:dakr@kernel.org,m:david@kernel.org,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:leon@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-cxl@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.brost@intel.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_CC(0.00)[nvidia.com,infradead.org,suse.cz,intel.com,lists.freedesktop.org,linux.ibm.com,gmail.com,ellerman.id.au,kernel.org,amd.com,ffwll.ch,linux.intel.com,suse.de,redhat.com,linux-foundation.org,oracle.com,google.com,suse.com,lists.ozlabs.org,vger.kernel.org,kvack.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lstrano-desk.jf.intel.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 51BD66277C
X-Rspamd-Action: no action

On Tue, Jan 20, 2026 at 10:01:18PM -0500, Zi Yan wrote:
> On 20 Jan 2026, at 8:53, Jason Gunthorpe wrote:
> 

This whole thread makes my head hurt, as does core MM.

IMO the TL;DR is:

- Why is Intel the only one proving this stuff works? We can debate all
  day about what should or should not work — but someone else needs to
  actually prove it.i, rather than type hypotheticals.

- Intel has demonstrated that this works and is still getting blocked.

- This entire thread is about a fixes patch for large device pages.
  Changing prep_compound_page is completely out of scope for a fixes
  patch, and honestly so is most of the rest of what’s being proposed.

- At a minimum, you must clear every page’s flags in the loop. So why not
  conservatively clear anything else a folio might have set before calling
  an existing core-MM function, ensuring the pages are in a known state?
  This is a fixes patch.

- Given the current state of the discussion, I don’t think large device
  pages should be in 6.19. And if so, why didn’t the entire device pages
  series receive this level of scrutiny earlier? It’s my mistake for not
  saying “no” until the reallocation at different sizes issue was resolved.

@Andrew. - I'd revert large device pages in 6.19 as it doesn't work and
we seemly cannot close on this.

Matt

> > On Mon, Jan 19, 2026 at 09:50:16PM -0500, Zi Yan wrote:
> >>>> I suppose we want some prep_single_page(page) and some reorg to share
> >>>> code with the other prep function.
> >>
> >> This is just an unnecessary need due to lack of knowledge of/do not want
> >> to investigate core MM page and folio initialization code.
> >
> > It will be better to keep this related code together, not spread all
> > around.
> 
> Or clarify what code is for preparing pages, which would go away at memdesc
> time, and what code is for preparing folios, which would stay.
> 
> >
> >>>> I don't think so. It should do the above job efficiently and iterate
> >>>> over the page list exactly once.
> >>
> >> folio initialization should not iterate over any page list, since folio is
> >> supposed to be treated as a whole instead of individual pages.
> >
> > The tail pages need to have the right data in them or compound_head
> > won't work.
> 
> That is done by set_compound_head() in prep_compound_tail().
> prep_compound_page() take cares of it. As long as it is called, even if
> the pages in that compound page have random states before, the compound
> page should function correctly afterwards.
> 
> >
> >> folio->mapping = NULL;
> >> folio->memcg_data = 0;
> >> folio->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
> >>
> >> should be enough.
> >
> > This seems believable to me for setting up an order 0 page.
> 
> It works for any folio, regardless of its order. fields used in second
> or third subpages are all taken care of by prep_compound_page().
> 
> >
> >> if (order)
> >> 	folio_set_large_rmappable(folio);
> >
> > That one is in zone_device_folio_init()
> 
> Yes. And the code location looks right to me.
> 
> >
> > And maybe the naming has got really confused if we have both functions
> > now :\
> 
> Yes. One of the issues is that device private code used to only handles
> order-0 pages and was converted to use high order folio directly without
> using high order page (namely compound page) as an intermediate step.
> This two-step-in-one caused confusion. But the key thing to avoid the
> confusion is that to form a high order folio, a list of contiguous pages
> would become a compound page by calling prep_compound_page(), then
> the compound page becomes a folio by calling folio_set_large_rmappable().
> 
> BTW, the code in prep_compound_head() after folio_set_order(folio, order)
> should belong to folio_set_large_rmappable() and they are causing confusion,
> since they are only applicable to rmappable large folios. I am going to
> send a patch to fix it.
> 
> 
> Best Regards,
> Yan, Zi

