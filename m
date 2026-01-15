Return-Path: <linuxppc-dev+bounces-15756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79391D222B0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 03:42:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds6h90Jjlz2xrC;
	Thu, 15 Jan 2026 13:42:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768444920;
	cv=fail; b=neaSFCMTL9WgSDGx93v4onPDYez92MjPeD9h+fEadxjipghayyTXwi0pp4EKfEJbtxd+PhlgKvJHC8ocGY4JfunEIbPGWeqYbdk5JrIpjFVhj0oxXtUkjgD93+3kVv/aM1IFD4NT0CKbaa7bT55W+bYeGq4PvSqHCv04dFa/goEiFKhRDqbgEvd2L21oVnK4CM7A3hp0Dds0C0HQU7kdwa3H9aIGZIbs3wRC0r4udnLf4/RyfkOY9QxWBHcBoO4pjpTJF/+C7VcTRd4gM8DGu8I3xWNl9iX+EfhFe8nYfGqiuEa9wRTO+wSXDyiS7bHXlWob+GrDOzoZ1HGSIbGRnA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768444920; c=relaxed/relaxed;
	bh=ytehREz8tiYcFGdmHJNZCQHpDxtcB7UrCtvHcXBlZQk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mfe4zsKJ836BzYzFDjMj3S38uB5GIAaZZdo9aX2sJ1iemsXp4oOxCPiJDHUGAQjVe0MW7NmG4LpYVGlT0aqiV3xnbFb88w5RUQgazs+14uF84LBG9JM7FoR1O4ZTZiOXMjnzRU4P+NfGtzw5QTx8qR1YV05iuQmfe71ouxE2fVfrpidg9Pb1SlkFIabzLqjt5tnB9DWAVifmw4tC3BQMxu7nv8haWSRpRHmqmbyxQrBk8qx2cmGEYowT5EEPP1AcK4yL1iAI2khKfLJYeMnfWAwjMH+Xc1LBAM23jinTBWc+uZ1BHpmKIIRGf49Mod2YN1uMlk8T1IOjSOn3MaCwoA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YYXEpDVy; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YYXEpDVy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=matthew.brost@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds6h61tN0z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 13:41:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768444919; x=1799980919;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=kDGQCZTDn0vUwIhyoG5mH7apyuYhqBhF7XrHBNfeiZY=;
  b=YYXEpDVynelxeFjKWa/kjLmUgDA/C0oZaaMOwz0K2fcSIu6J5aT7xNVw
   78W/w9ZwO4xoyvVrSzwyCY7bjXFuvpvUfIAKL0i9UZPBllciyjaqh0VqP
   OBFL1eWIMwYDMd0EccrTwUtvX4n+DPNANOoMZG5S85reC2CKNqVZjhdKo
   2ufQfGV4Go0ezf3F5vfCNDm52IkNK+0AJqsjQDdW0wY1A+aJtiDauNoux
   JvNP3Mymdi2AQoZya79H8r9Zbk9K66rJrwnsyThEHsLhAsLZr2FBQGHll
   l0qM7CaEmIqK0rG2t11HwI3j7IhhFJoq+suHE0YVmCnQqzBdreCGIH8DA
   A==;
X-CSE-ConnectionGUID: ikKQYiUHQfmMsl8JvlPwvQ==
X-CSE-MsgGUID: BXeF0NeSTUayMGko013XCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73604736"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73604736"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 18:41:54 -0800
X-CSE-ConnectionGUID: j38kb4lhQ5akHzIBFzhr6Q==
X-CSE-MsgGUID: OFieJN/uSxS9n5o9pksiDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="235559253"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 18:41:53 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 18:41:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 18:41:52 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 18:41:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucvyPFFRB26wQvfnEqM5i5pg8i6nE4uAvrBHziwurVHDlSYX6HgQoV+vBlsrgtBCYdxdFI37O9E6PbQTmX8tcQzp2ZRpcJxNot1fJVLNold9cxPpXYgvJctaJSEaRs23fkRAUYVy+LNbH3qR94iNLxsBErwU1zGMojH9s+fdNkVtiwzwOd5f/qcmsPAl07GNDidOcHlnbwnWlYEXPCbIW7hk9/4dsBeuEdHUYoLNsjQApH++HIFxn8syGWutecgQnuxulssIr2f/iRlrqlx0t47FmOI61kADqOnYN334JCiUd42iQtiPwp3S7Rwn2JLwidf1+JKl/fZEf6JkdbI8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytehREz8tiYcFGdmHJNZCQHpDxtcB7UrCtvHcXBlZQk=;
 b=i0AkBCKio1MC/FP8d2J5sxiejnEOpQjXQ52Rpxh5ZWg804Nx34tO35JFa2u1Tcd32xggEx7dQX+E1aOQsx+xnP8k4X9fmdUgdLVUrHr8sTBngRp+kwiV+qTNMvbDApu1R/Fj907fWeOSJ1QiyfeEaDkVr+bM6ioZ0cMGTGWn+0BCYzlh/+WIDmRgWeEK6PirZSRfFLJecTvQvmN/fbR3+IVrBu+yTkKp/pzsYHANkhaaz58o6xr/94HYmcgG8cZQMAPbS0FbSAHy5LufW6W40PCBYRyKPGk3xHT9xWCFZtOWK3TLRe4QIa3eU8RmbuaHO+uVs2CvcDoD2pBBFcemlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 02:41:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Thu, 15 Jan 2026
 02:41:49 +0000
Date: Wed, 14 Jan 2026 18:41:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: Francois Dugast <francois.dugast@intel.com>,
	<intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Zi Yan
	<ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>, adhavan Srinivasan
	<maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman
	<mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
	<alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Hildenbrand" <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, "Andrew
 Morton" <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Leon
 Romanovsky" <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
	<vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
	<surenb@google.com>, Michal Hocko <mhocko@suse.com>,
	<linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-mm@kvack.org>,
	<linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <aWhT6i3lFxkqnbST@lstrano-desk.jf.intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <4cd42f41-660d-40a6-8365-e06fa4fca6a1@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cd42f41-660d-40a6-8365-e06fa4fca6a1@nvidia.com>
X-ClientProxiedBy: BYAPR11CA0068.namprd11.prod.outlook.com
 (2603:10b6:a03:80::45) To PH7PR11MB6522.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: e53ecfe6-016a-40c4-14d0-08de53dfa23d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTVLQXJMV3hCalZUVmlBcDNqYWxmcEtlZDJHa3BzNXpnNnQyREZxRE43QnFK?=
 =?utf-8?B?bmZDcUYwZWRYUWVEODBwQ21ESmlmRi82Zyt6dFNaY2JzV0drN28rUzlKbUxU?=
 =?utf-8?B?T1ZSdnBrOExRQ0VDK21vNTF6SzY1UkZNK3kxREdmc002UFFiRXRJZHNUbVdG?=
 =?utf-8?B?a2kySGJUNGlFSzV2WFpNbkloSTRadDQ5L2lwdWNPTytxcThHUjFPRjdoaE5V?=
 =?utf-8?B?emZjMjRZV3JHelFhTzNUUjBrOFVWSm8wa1ZaWUdXbC9kVm55cmhmR1hRU0h3?=
 =?utf-8?B?cjZwU0d2YzNCaS8rY2wrd0dlUTZiSnpoQ0xxblNCSU1Bb2o4RU9oOUw5a2kr?=
 =?utf-8?B?aDNuN1Zxd1lDRzhnbmoyK2xkL2MxYU5TSk5sUGtxVlVlcTRGTkhuUmpFbWVn?=
 =?utf-8?B?a2xHQmVuRFdHVjQ2TFlRTVZKU0VUanJBZXJDU2VRbEJzanNnNjQ3aEhLcGlW?=
 =?utf-8?B?UDJCMllxeVN6a2JiOEU1bFVVNHlFZGtqblZkekVGcnpFMmhjTjM3b1NWQi9C?=
 =?utf-8?B?OURPS3p2L29XdEd2Y0U5Q1U2TTJEcXExVGsvMktQRDlGYXptWklzUGlHSWxs?=
 =?utf-8?B?M1pLejBZK3NZRURIeUJtM0pXQjdINFUxNzh0eG1HbSt5emJsWEhrQTBRNmQ1?=
 =?utf-8?B?UGoxbGpjM2JnMDRJc0sxZkdEZnVRTjlMR2hTalYwOTlpTTNNQi96aHJFTHBt?=
 =?utf-8?B?RTVmZ2ZFQUpUVm9tM1pTSDgvelgxZ2UwSXpCeGp2K0NnRXBJaGRVd0RiZjBF?=
 =?utf-8?B?cFNMWnFvaDR6TnNXaUtaMDEyL251aW40aXdJMXpGZFRsSDluV1N1MzRpM0dI?=
 =?utf-8?B?V1BGdnAwYmJaL3kvWHZVeG9PMTB5bTdVMW53NUJOLzEydWdQLysvMGJlYzB4?=
 =?utf-8?B?M24vV1psVThtUEFaNUFSTkR3M0dHY3F0WWthZkNocVczKzdrTUU4ZjBrV2pL?=
 =?utf-8?B?K1kwUmFxY2RBaTJucVBiYi9taXZNOXhPQXJPOXhhaDRyQWYzVGYzb01kZmQ0?=
 =?utf-8?B?bzJ0c2l0MURlZDh2Y0JxVzNmUFVxVjNyUU5vS2N2YjFOSFQyTktqTE4vNzl2?=
 =?utf-8?B?TmRlRlpjeDZETVVYN0lTSm5OdVB6KzBXOG5pdHBncmhZRmdDTlBtUTA2SVJX?=
 =?utf-8?B?MGNtUG1IZ2ZFcGN3WVRFajFuWUtlZU92c0QyNWZobUROdk5Pd05SeUVjSzB5?=
 =?utf-8?B?elBaTzdlckUyVENtQ3RsUEdtblQ5TCsxNk1taVhaTWlBQ3A3M2tTS1NNRS9X?=
 =?utf-8?B?ZUtxWVBTRElCWXNjdmpkWVVrMFBhRmV4Y001ZlRKVTJFN2ZZN2lTM0R0b3JL?=
 =?utf-8?B?TlREbFJFK1ZyL3F0bDQvMHZlcEdLc05TSkpzRm0xT2gyOVFLZERtWUFNc2Va?=
 =?utf-8?B?L096VWZHSVZ1VnVsbXArNUhsY1M5ZThIdFc0eWREbUh2bUwzMUQ3cDBmSU83?=
 =?utf-8?B?c3dIS2RFT01PYmtSa2lmNEw5RXcxTGh5VmZoS3pLVGxYOGpIL0ZXR1Rjb2wy?=
 =?utf-8?B?dEdxRG56WXRYdFliQ0ZGVURGQW90b1paOTVMc2ZiSFBBTktaazAwZ2RCU01P?=
 =?utf-8?B?Sll2SzVwK0VNcHh1Q1V6THFmdHdBTWtSMjJaSG45bzE3Q2kza1p5enJvWWtp?=
 =?utf-8?B?eDBpYWZsMkVtOS82MGd0S2ZDWFBNa2FVMlVnOXlZY09qbmQwRHdPcHFSWVZP?=
 =?utf-8?B?aXdXOEhmQzlJY1RuSDdTTjBhVHcrMkFYVTNJdUIvbXB4ajB0LytvNlJZby9i?=
 =?utf-8?B?VHVvMDZBMWliakVHTFdLT3BnRzNwM0E4OVc2UlJsOUNQSnpYME1keFZZN2VV?=
 =?utf-8?B?UHQ4c2c0b1NWb3EwYlFiTWcwR1MyQ2psMDU4V1lPdG5PdlRaUHBUVE9mdmRX?=
 =?utf-8?B?VXA2OEdJME9oakMzWi9IcVplcDVuKzdTZklFNHoxRjA0ZEdtNkNNOUlIcmZa?=
 =?utf-8?B?NWtybkZrK2JOVWRUUmdSTitBcUZkT1JVTG1xNi9ndWs1UzJseUcyTkdHbU85?=
 =?utf-8?B?TFN2dHRhMmE4N2JYMEFUOFRsbWxRTDlpd0FuYWxQU3haVUxNb3BiZTJrYkFU?=
 =?utf-8?B?alNrUUFlMjdKUEFmWnNWejZ5NlhEMFFsSjFVZDQva1BMaEN6bFg2a0ZVY1FU?=
 =?utf-8?Q?kuxY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEdWMi9kSTNnRmM3cU40MnRJaFNUN3JjN2NaUUs5SkJrUEV2OVgwNXo5T0h3?=
 =?utf-8?B?NlRaM3BiZCt1QW0xci8xTmdwaVRvb2hrK0FoQlVER09PSnNYbEMwelVSckVu?=
 =?utf-8?B?Y0FxTUdxWVZFTTR2KzRMMXQ5ZmRvZ0tlZzl6T0MxYUcvbHpqcnNNdndmSnNO?=
 =?utf-8?B?cm5zMWhFTlVuZTluSXVJb2lEV29EZHVyQWkvS1BzV0xrbHV1bllodWl1VnRU?=
 =?utf-8?B?TGJDWThOeWJSbnpYWFJCVWFpUkN3MVVjWnFVSGhKVVhlWHc5VWI3T2I0akF4?=
 =?utf-8?B?UjRxZWk2VXdNaTdNMmx0aGhmN3F2QTN2cDlzM29sK25MZ3lPQjRRaitMVGNy?=
 =?utf-8?B?NGhSTUFPc0l4b1N0RWg5MFZ3Y0FndG9iNy8rakNzRzlVVS82TVJXRHlscHlV?=
 =?utf-8?B?ekNweU1abnNoSmZ2NGlaVjB5ZTBuVklBZmtCblE1VEJKWmx4bm5TTTFjUUpw?=
 =?utf-8?B?NWZKVE1aYWVqakh2YzhnMkNGTkRpMWRPRlVteVc1c2pmT09ON2luMFl4L0JX?=
 =?utf-8?B?WSs0b3k4ZXdzWUwzbTJwTjVwK1ZpS2Q2NFFCWFF6ajNsT05USk1lVnBmMVl2?=
 =?utf-8?B?ajBXWVFWS3JyU1A3eGl2a0VQSVdybWVMd3F1L2s1ZmxQYVFaSE5MK1VhbExI?=
 =?utf-8?B?cWdUUUI4Q2VFQjl3dzFVN0grbTc4ZUpBT0FSZFV1aDlNeTNMSmdQWTRWRllv?=
 =?utf-8?B?Um5HeTRMN08rVGgwV01yVCtRVWRPR01ERXE4QzdpRDE4SXFhZzU1REFFNEZk?=
 =?utf-8?B?WTNiL1BnQVJ3bnIrTWR1L1dNdTBxcHZoTnY3c3BicjA2LzRSRXNEbWJkWnBt?=
 =?utf-8?B?MW52N0ZvazNkb3FDZkVlck4zK1lhYXZUK3ZXTndzZWxxNWh5TUVKaXY1UVN5?=
 =?utf-8?B?eW5Cc1YrWm1XRWF1bWEvNHl4UHRmZnRFN0pzY1NOaVYyL3ZTT2F4allMTlFO?=
 =?utf-8?B?MXRwOERUTjhicDZvOXp0WXJVTWpURUJLb2daS0p5ckkraE1McC8rb0tJNUpN?=
 =?utf-8?B?K3ZlMk1XQ2VwSTFDaXFHVU1kVm9zWUZNdy9DUW1razBMSDV1d05sVWdIcmpj?=
 =?utf-8?B?OTMvM3R6cXBTbGY2VGk0dkIxL3J1U3NoWDJvaXJSdmJXWnJIaGNEOW85SkIv?=
 =?utf-8?B?UlBxTFI5KzZKRU9XMVA1RjdCUnhBL3lwU0ZrREVvcGI3Zkc5ZGNabmlwcFVY?=
 =?utf-8?B?UjZOSTg4R1pWNEdrWVBqWHIrdU9PQ3lVVEgzQ3dsSS9hbUQ1cTVUUS9wZGs0?=
 =?utf-8?B?dEM4Wm5jS0xLUjBEakdDS1gzRjEyblRjeUpOajhOaDRxWFFKYTA5STFScG9M?=
 =?utf-8?B?djc3U1pVakhqN2ZUM3NZdUh4SFdtbytOTllCOXVhNlJCZ0VHSTZsSU9uckZj?=
 =?utf-8?B?VVh5bnJzemZFcC9qeTNnKytTWDdDV1RMMXZXUy9XUTduMnRqL01WY2tCbU1v?=
 =?utf-8?B?K3ZuM29Ebk1DbjFSUkJ2ZWhJUlFkei9qazNqa3laMEh5Nk05NmQra1dBcTVZ?=
 =?utf-8?B?amFHeXg2Ry9WR2xWaE1QVGQ0WkRFT1JpZ0dRKzdtRldjOVZQL1BXdGJSd3Zj?=
 =?utf-8?B?QlZPUFVCb2praUN1TGxRdGpRZWNETVVlViszYnppaEtINmR0VUp4U2E0b296?=
 =?utf-8?B?WHdvdDRhVG9UZFZzT3B2NlNwNU1qN3F1Z1Q1eHNJMno3cmRSQTY2dkxvT1RW?=
 =?utf-8?B?SERVYzdFOEpxTldydkdRLys3WDdPamxEMWpRSEVyb0lHL3NYT1B1TFNSK3VX?=
 =?utf-8?B?OEFuV2RHN1JxcS9BV2w3TFh6VG5mWGx1YXo3RE1nSm05N1ZqakRnS25idTcr?=
 =?utf-8?B?MGIxTHVMbC9wYWR6MWVrZzZEdkFtT095dW5tdU94RWtRSHFmeDZFanh6QWhu?=
 =?utf-8?B?c25TdndRM3RvSmgyMjduemdGbk1kc2hYd2JjMlBYWHczd1JYNXFzNjNlU0t3?=
 =?utf-8?B?SDVqUFBtbjRjMzN3M2cva241UW5sc0R2a0h2bGJlemMxMVBkRkRvZjJia0VL?=
 =?utf-8?B?M3FsaFVsOHNIUEtSTmVqU3M5cmsxZ2R2L1h5U0w1WklvSTVMMkU2Mk13bytk?=
 =?utf-8?B?WlcwbTU5Y0RQSXU5SzBHK0ZDemtFTlh3bk04L0krRlAwa0hNc1k2cG10bDh5?=
 =?utf-8?B?a2JVK0RxSU5HOFFyQ0o4Vkt2VkFZVktuajNpcjJiMkhDMi9JbUZsRWRXSDFH?=
 =?utf-8?B?S3VwbkxuWUt2U2JnTFRPWk42ekc1UGpmZk1FMlZnUmRNZTg3QUhOK3R3bVdO?=
 =?utf-8?B?d0t1QjhNL0pIMXhVYmpQMCtBRElVR1l1cVBYVGhRMjg0aWpEMFBRdEd3TDRX?=
 =?utf-8?B?ZHNoNFRVNmtSYWFreERZdW9ONzdNcGRwa2lRNjVFdVNvcDVXNytXRFZzL0JQ?=
 =?utf-8?Q?hos8oCtMF8w2lKCs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e53ecfe6-016a-40c4-14d0-08de53dfa23d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 02:41:49.9292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEC5Je2ZvI1axW83/Pm0EFYrZ3hFejnzlJX1/NZyI35NXF8/DE2yp1RQqPivTmA4eTFtknZD7wvom4qXXO0Exg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 01:36:11PM +1100, Balbir Singh wrote:
> On 1/15/26 06:19, Francois Dugast wrote:
> > From: Matthew Brost <matthew.brost@intel.com>
> > 
> > Reinitialize metadata for large zone device private folios in
> > zone_device_page_init prior to creating a higher-order zone device
> > private folio. This step is necessary when the folio’s order changes
> > dynamically between zone_device_page_init calls to avoid building a
> > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > must be passed in from the caller because the pgmap stored in the folio
> > page may have been overwritten with a compound head.
> > 
> > Cc: Zi Yan <ziy@nvidia.com>
> > Cc: Alistair Popple <apopple@nvidia.com>
> > Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Leon Romanovsky <leon@kernel.org>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Cc: Balbir Singh <balbirs@nvidia.com>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: kvm@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: nouveau@lists.freedesktop.org
> > Cc: linux-mm@kvack.org
> > Cc: linux-cxl@vger.kernel.org
> > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
> >  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
> >  drivers/gpu/drm/drm_pagemap.c            |  2 +-
> >  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
> >  include/linux/memremap.h                 |  9 ++++++---
> >  lib/test_hmm.c                           |  4 +++-
> >  mm/memremap.c                            | 20 +++++++++++++++++++-
> >  7 files changed, 32 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > index e5000bef90f2..7cf9310de0ec 100644
> > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
> >  
> >  	dpage = pfn_to_page(uvmem_pfn);
> >  	dpage->zone_device_data = pvt;
> > -	zone_device_page_init(dpage, 0);
> > +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
> >  	return dpage;
> >  out_clear:
> >  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > index af53e796ea1b..6ada7b4af7c6 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> >  	page = pfn_to_page(pfn);
> >  	svm_range_bo_ref(prange->svm_bo);
> >  	page->zone_device_data = prange->svm_bo;
> > -	zone_device_page_init(page, 0);
> > +	zone_device_page_init(page, page_pgmap(page), 0);
> >  }
> >  
> >  static void
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index 03ee39a761a4..c497726b0147 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> >  					struct drm_pagemap_zdd *zdd)
> >  {
> >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > -	zone_device_page_init(page, 0);
> > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > index 58071652679d..3d8031296eed 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
> >  			order = ilog2(DMEM_CHUNK_NPAGES);
> >  	}
> >  
> > -	zone_device_folio_init(folio, order);
> > +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
> >  	return page;
> >  }
> >  
> > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > index 713ec0435b48..e3c2ccf872a8 100644
> > --- a/include/linux/memremap.h
> > +++ b/include/linux/memremap.h
> > @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
> >  }
> >  
> >  #ifdef CONFIG_ZONE_DEVICE
> > -void zone_device_page_init(struct page *page, unsigned int order);
> > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > +			   unsigned int order);
> >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> >  void memunmap_pages(struct dev_pagemap *pgmap);
> >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> >  
> >  unsigned long memremap_compat_align(void);
> >  
> > -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> > +static inline void zone_device_folio_init(struct folio *folio,
> > +					  struct dev_pagemap *pgmap,
> > +					  unsigned int order)
> >  {
> > -	zone_device_page_init(&folio->page, order);
> > +	zone_device_page_init(&folio->page, pgmap, order);
> >  	if (order)
> >  		folio_set_large_rmappable(folio);
> >  }
> > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> > index 8af169d3873a..455a6862ae50 100644
> > --- a/lib/test_hmm.c
> > +++ b/lib/test_hmm.c
> > @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
> >  			goto error;
> >  	}
> >  
> > -	zone_device_folio_init(page_folio(dpage), order);
> > +	zone_device_folio_init(page_folio(dpage),
> > +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> > +			       order);
> >  	dpage->zone_device_data = rpage;
> >  	return dpage;
> >  
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 63c6ab4fdf08..6f46ab14662b 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
> >  	}
> >  }
> >  
> > -void zone_device_page_init(struct page *page, unsigned int order)
> > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > +			   unsigned int order)
> >  {
> > +	struct page *new_page = page;
> > +	unsigned int i;
> > +
> >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> >  
> > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > +		struct folio *new_folio = (struct folio *)new_page;
> > +
> > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > +#endif
> 
> Not sure I follow the new_page - 1? What happens when order is 0?
> 

This is just to get _nr_pages in the new_page as folio->_nr_pages is in
the folio's second page. So it just modifying itself. I agree this is a
bit goofy but couldn't think of a better way to do this. In the page
structure this is the memcg_data field on most builds.

Matt

> > +		new_folio->mapping = NULL;
> > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > +	}
> > +
> >  	/*
> >  	 * Drivers shouldn't be allocating pages after calling
> >  	 * memunmap_pages().
> 
> I wish we did not have to pass in the pgmap, but I can see why
> we can't rely on the existing pgmap
> 
> Balbir
> 

