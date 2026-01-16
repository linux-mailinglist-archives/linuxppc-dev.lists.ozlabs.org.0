Return-Path: <linuxppc-dev+bounces-15917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64616D338F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 17:44:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt5KR6nVPz309H;
	Sat, 17 Jan 2026 03:44:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768581851;
	cv=fail; b=HpbwncpbGm6voJzIaRu0k7JkB/dXqq15OxBQMakX7/bD7C1w/d/R71VR1vXEJDwSGvmBKVewoYFlI+DOMXAVFJcqMDjJSqRVE7I3HN9AVlqvaASAkAbnYMlXJ21mbnBIKNpSL7EjFX3100R1UCbp5+I43CcsMCHj2KpqQxkmRi03Mx+ELhwk6Iu7QhlouzuIzMZh3ueCZE2illObEbZH9ttAfZvQJIVSHAFr1Q5GnE2coZq98ZAk4qPgURvx5tdU0dUVQkBbVzBOy4ZKfv5IqGLNF3tOgB7zqddYWymCqRobqcEHZoG0mUPlfo/CeoKLX8Iyrp0SG/Uf4Q1F4cB8Xw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768581851; c=relaxed/relaxed;
	bh=UNAA5npnbzeZbPI3SJkOiufd4Gk60hu5LwfvjO8J9JY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fEFIl8GSEeiG9J6l8rU7cB8Fq/3XI0Bq2EK2fUM6x1UP4qwFmpKT1eUjbJUs3hpVThaKToHx8nzrVCNSHDwdWqwM9L0DnP9IaXZYLRUP40HM1+aZp8fZ5C2lxnQagyT5LAaYi65XN6lrHTlEQ/nHJS8upvuJSCbKtwhSq9TSdN/uxtZBAmcmpigJ2EKLJJ5g44v8v73j+80/QMNsnEW6XLDNYNnDHeMmCE6riNzsh0/zRlLzLiX5TRL1cwueNrhTJk//t94wGtOpQN38Hgi4XLNJeOrnxNptLtKUIovFumKanR/o7BjrV1QNTadPZmgAyaNepwehz871IJvx1Y15LA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eEKOkSHF; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=rodrigo.vivi@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eEKOkSHF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=rodrigo.vivi@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt5KQ65gLz2xnj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 03:44:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768581851; x=1800117851;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NT+m9YIP3QTsCC8EZrpqZn6qWTZXPtbKpU3DzatI3T0=;
  b=eEKOkSHFK9i0+U8ES9UuaDkDfR0veVNVhjn13jK53ZBDVbMi/eX+FsUd
   sqWGVve8sKtj0f32PypLWQ35nj9kDpdXVbvD2M9ZoZIPglRh544AFmsC2
   qVhi/h68qRRcWbIk2GWJ6aO8QEyZ7oPRoikWjSKdEW2A5IsN/id8I/fu9
   Dgbp8YBSEkj6oBsB884SKKpl8JMXN2jCLuWybmJAc347p+oNpDMH7ZYC8
   0niykDerbCxPnPSbf6IgO5TlgXgN9yOhAUa07QF6Qw54ghKocaGP61DOA
   aSS5DhZbv37HfZMbgDFei/WlF4tuI9KMCykgqTxYu4hxVs3PNDh33TE/g
   Q==;
X-CSE-ConnectionGUID: S1M7nihETSmFt9byA3dsig==
X-CSE-MsgGUID: 0qsTDtHOTni/fRcos83pLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80620171"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="80620171"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 08:44:08 -0800
X-CSE-ConnectionGUID: GW4ogReTQtaGvsdfcWF90w==
X-CSE-MsgGUID: M26tkflfRUe5AG+UpBtlcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="205335890"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 08:44:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 08:44:06 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 08:44:06 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 08:44:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjNWjkO/TSziJ8kzFzZHQDjK3dtug2/jDFsA+8tELiBm4YFY3jZNPYOxW9xo1gEEdpbunVWSwoP8Qbgi2q8JLrYchbyLgFucwR3e8ZtS0lLQaeJP9QILqmoPdwxIRIsOJvXEJYzmeYp+7MTa4ydwQFb8bIndICPiRymm2qebGy7p0zfA/HjtLHTaMKqoJSppct+pP81ML8df574W5P7DEmjQWgFj8bfo9NCKJKZBqQuhIAJOxi7ZTp5GkA/CyzNf0a7mbEakfWp8I7yDdLEgFaAyVKHQd/esVb8IXIIzPEYZuHpc6g41Lm0oeRU614QQprZYL6vxyBKnhRZaubEaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNAA5npnbzeZbPI3SJkOiufd4Gk60hu5LwfvjO8J9JY=;
 b=OwVJnmg14TLFE6HpiXV6qmAv1hQg6ExHWT0K/KhStuxRZX4H3Ai0hZmqESR6NVSzeW7RYvuA8al8ngqmN+fHllo2meAwTq5hnXoiHiwDw7q79+MIwR81/fACQff/32eKvGoSDsdYS3LyJdnGLu4AEcb0Z3WM6gG5cp1fIEYM/Jo+E3rtbN5csRRsSVo3UUhh3KGyFcFQZSbZL0kT6fJHWdwwWYcWLflQC/mAkkU3ShXERgB2STqDNxPPqkATjJEaz4yONk3Qte2uXMse12BaNpDxlLOyDrehp+m8HklvcJdSO1iTXQWQVzYWSmfe/WoaMnFRH1K3Ylty35r6y2DroQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.5; Fri, 16 Jan 2026 16:44:01 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 16:44:00 +0000
Date: Fri, 16 Jan 2026 11:43:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>, Felix Kuehling
	<Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Lyude Paul
	<lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	<nouveau@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, adhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling
	<Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>, David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>, Andrew Morton
	<akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky
	<leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R .
 Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, "Mike
 Rapoport" <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, "Michal
 Hocko" <mhocko@suse.com>, Balbir Singh <balbirs@nvidia.com>,
	<linuxppc-dev@lists.ozlabs.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-mm@kvack.org>,
	<linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <aWpqxS7FrV0KffLr@intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114192111.1267147-2-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
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
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 29715aa9-d4f4-42ed-c80a-08de551e7356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFQwOXR4c2JJc0hyUGZEanhtR2Mycis2VkFPbDhWdVBMZHpDa21heEVqdVNE?=
 =?utf-8?B?TmdOQnBzb3lrL2tVb1RUeXpCQ09hWW1TK0NtWnlkNElYOCtUQzBrSTNnZllu?=
 =?utf-8?B?RUlvOXFrYmtWbVhWR0ZNdFB2VTlHWi83MUpidDc3MGYzenZBNEp3bHdCd3Zu?=
 =?utf-8?B?TDhBcXRTQnJqQ3U1ZTdVQWZsZWM5cEIwMy9XTVNtWkd5T3l6Tm9oKzN3RTgr?=
 =?utf-8?B?UVpoaUk1dzZSZXJEKzh4cmVXZktLVllCbkFpeFdSdDZqZGY1YVMvd0ZadEJ4?=
 =?utf-8?B?SE05N3c2ME92QmovaGRBVUFYVlZpN2xISUFuSEcrUWExMi9wMW1Dcmx4RXdJ?=
 =?utf-8?B?a0pyNHIwV05NRHE0eWgzLzkrVm5nVG9mRExvVHVOV2tNQmgyS2xnWEMyRSsy?=
 =?utf-8?B?TG1Pd2RXUjFSMkpBT29RTlQ2aExBajNvMmJoK2tNNGdWT3JNeXRMcVF0NTMx?=
 =?utf-8?B?YWRWRDg5U2ZUd0xWRnQ2WXJIN0JiNjN1eVROaEtFY1p2Ym96QlhLRnFpeXlp?=
 =?utf-8?B?YmlkNFpOREVzQUx5bldqcWdyVjdYVU11bnZlMENiWU43VVo5cm0rYzk5bFhl?=
 =?utf-8?B?eUlvNSt0MzhUZEJCaFVZYU0yQUtPdHZLWUsyVzcrTExXWHpobEJYOUYyYWZC?=
 =?utf-8?B?cVJWRHhjVDYvVG55Z3p2TldndFcyT283MWNxNzZMbXI3c0hyTk9DTyt2UExj?=
 =?utf-8?B?bGFHQm1GT3NCNDRVc2cvYmdFY3RBN3NIM1NOckRoMmU1VTdsZmUrNkxEM0VQ?=
 =?utf-8?B?a3ArTlJGRkJncGllcjFoMlh0WkhKMmhzRERmMUwya3hrMUxmSFZTOHVXcERp?=
 =?utf-8?B?K1dWb2lzQXIyYWhIZHlsbkQ1OE15cU5laHlRTitBVCtoZ1htUjc5Y1JlRnFS?=
 =?utf-8?B?dTJTZGI5eWtJdXdWV05QS0lDckFYOURkajRPMm93bTBYYXdXV2c1Nk5lVWxL?=
 =?utf-8?B?aGxETDF2RzVTYXBhczZxOEVMRXVGTDE5bjFadHYwQnZwV21iZTlJUWs3ajZM?=
 =?utf-8?B?ZmJvRkVROG1Jc01HcE12UmVKMDlMKzlhUlc4TVVnNGR3YlVMR2ZKQ2lqb2hk?=
 =?utf-8?B?bHFlVHVFeXJKU2pmd0dGcTBvSnZxMlI3V3NiWk9FK25nSDJJMk9kS0xzZmtQ?=
 =?utf-8?B?M1ZLMjRpRTFxOGtHcFdEYWVoN0ovRzU0QzNSOC9OelJwSkljYXNLT0ZRT1ZW?=
 =?utf-8?B?djVYcllaajMrVU0wVXFyZFVtY01BUUk0cllzWm1RY2RSUlYrYjJ6d0gzTGRi?=
 =?utf-8?B?TkpwNXArNlJlTENHUXkzZmdKbjFLNWtJSzk0YnFDZlI4aDR1anZPMS9IL0dx?=
 =?utf-8?B?cXR1dHE3RWhMQ2dyRFRwQ3pnQXJRWWNVSUFBSFJWTndzSnhyN1IwTlRxbzhm?=
 =?utf-8?B?WDMzLzUxY21PYnpGc3FHTlI2ZlRmVGlmSWREcm55MG13YmI2eEhFMy9rUzA1?=
 =?utf-8?B?MGsxVTg0SmtMRjlFc2M0bnBjNTVYYkpueVlCS1JJMUsvWnZKc0lobm5MM2xw?=
 =?utf-8?B?VU1xSmRxNHBHZ3pyMjJaVWZBUnRRSFU2cHdLaDJZdVAwSXhwSFcrVDhaL2VC?=
 =?utf-8?B?anNqYmZPallYTHNlQlJpeXNZVVRSMkFvVTFDQWUxbmhmOVlRRDVuUnh5UjNN?=
 =?utf-8?B?UzNiSkt4T1pMRFFmc2ZvNzdDZGlHcElTMmZNZjhvRzNxRU9sb3dtREpYNXJ1?=
 =?utf-8?B?YUp6R1o3Zzl4YkdVamlONUhXTW1zQVpoR1hXMVk0Q29JR1g1Yjcxb04reEZs?=
 =?utf-8?B?QXdGeEZmd2Z3cmlMNFpsOXlpYktndFZ5b3NHejVmVU9abGJPYnpIMElUUHlz?=
 =?utf-8?B?RFFuNHRsTnZYK1JrbHFnTmdhV0xXZEVzNzMwRnFPcGFwT2FxeVBKSEU0Qmdn?=
 =?utf-8?B?QVo1bDBKWDlCaDZ4U2pZRDdVMHJlMUwvRmRzbGpwak0wYm80ZURITEJOZUly?=
 =?utf-8?B?U1lneVVoSEw5bFl0NDYvMncyOEtydXpScGs5YzdVb1RYdEVqRkNrNks0WjRn?=
 =?utf-8?B?dko2eC9VMFA2VVJPOHBRdDhFd1UwWSs1akJQa3hycEJVaHMwQWNDaFNlZnho?=
 =?utf-8?B?TUdseWpEaUxkZVV2OGRjMitHTDZqZXJwTnVtRHdpOG1wYVZZSURhN2kxZlRq?=
 =?utf-8?Q?ZYyI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGNCWFJHSU9pcHhGS3V5ZkZkMHNhZEQ1RWQ4WUZ5VlN4OXhMcGd4amo5Q1pK?=
 =?utf-8?B?SDRpbEkzWUJ5TTFnWUdsbTVYY3F2SzBFVXNQcUpXTDRaUlJaN3p2NzF0KzFN?=
 =?utf-8?B?UlNTd2JLVUtyWGh3VFZnUTcvV2NjTmZOb2xkbkg2dnRObXdibmsvU2x0SStX?=
 =?utf-8?B?VEhsWVlxTVZJdjh0UEtaRUJVVDFtVWJ5Z0dUTndKbktpaFVBZUFCV285bCtC?=
 =?utf-8?B?WU1VS0pDTHVvOEFJd3JJdEFjV1l5TzQ1Mi9iRWVLa3hJeUZ4V0tUWW9LZnpI?=
 =?utf-8?B?ckhrZlpUbmxXdjVPNUFHalZicmNIbmVLOXlMUDRNZys2bjRHOEFKbFlmZzNt?=
 =?utf-8?B?NmhJQ3FWbFpNQW56Ty9SSGR5bEgySC93RmxrUCs4WGJLQ1pxbjJ1QkZUMUxR?=
 =?utf-8?B?d0Q1NGJtRS9WRDRkNHdFN01tb1N0Q1RvamFZclM1azZYRm55a1NNM0N0L1oz?=
 =?utf-8?B?QUM5V3pwN2R5WGE0TWFvM1N2RVM0TE1kRU1JZGtJeXJuMmJUd2tpMDgvWlF5?=
 =?utf-8?B?WDZFMUo5dGF3WnRSeDErbDJzdXlUd0JxUnZGZFNCSm9RNTBEcXJHN3NuQkU5?=
 =?utf-8?B?MU5JNFlTZWZPdG52KzJnYzdnT3IraTEzMXVyaS9Ebml2eG51MWQzamlXTm9F?=
 =?utf-8?B?YVVNeUtxZnlka2ZhN0Q1YytnZDBIMHhNWURORk44bmRhMDBsWXRSUnF0U3RG?=
 =?utf-8?B?czJtckppTDNmV3BRanR2Mk42U2RpdmUwODF6N25Rck9NVzN0dzlYYTZzeG9X?=
 =?utf-8?B?azlVR0JCczdKcGgyRXVOaG9Sd3d1eUE5aHhvTHBCMDQ3cTgyU3hQQVcwN1Fo?=
 =?utf-8?B?YWYrQzZqVzNLcWkvNXhES3c3QXZ1NXFtbFE5ZjBIa2pkQmROWmNOT2N1V20w?=
 =?utf-8?B?QXlnTit5TmNwN2VyQ2VwMXlBZ3VCWWtDLzlBaFhoUzNTQUtTZks3anAxUEk0?=
 =?utf-8?B?WHZzVGV6QlVVYkdpb0lDZEdhV08rL0RpQXJYOENIWmFPeGcyd3dsTEtGRXVz?=
 =?utf-8?B?WUtvaVpmenJBakd1Umg0V0p4MThhV2FJOUlTeGEyT2w0czNSTFdnYVpueVhk?=
 =?utf-8?B?SVBwR3NyWGY3V3VJaHZQUWxtWDJHTnRWYVNBMmJtaXFuNkQ3ZnZSWlRKcXZJ?=
 =?utf-8?B?WGVPWkx2TjNjWXlrblpJQy9tMmloVFBraFBsbzU0NGlINGRnUFpEdDg3U3c4?=
 =?utf-8?B?UVNFNGh1ZFB5Yi8wUURFTERaNXhtUmRXVzVZR1JPenBPbmYrZTNEdkR0THZs?=
 =?utf-8?B?ZWxPS2NWRG1KRURXa1hiMW9TcHdTUWtEd0hXT2U4N3lhZzdJUEFkaUJ6dXBZ?=
 =?utf-8?B?bmVJSG5FWnNiWSt6WXNJaFE2anNpdHBEeFdQTzVWOVdnNXU0aGdPbmtIUjV1?=
 =?utf-8?B?a0N3dkZONHZvZkpZTlFrZm5qZ3RSUmR3am1iRE90MUFKSWU2T29sR08vOWFE?=
 =?utf-8?B?UHFGQnJrYnl3ZDRzUFpPeGtJUlF1WEdRQlRtZWdhbmhrSGk4cUZrOEFINWZS?=
 =?utf-8?B?RG54SERlNTVoV0hJS3oxN2tGZzRwUnBIREZsYWc5UGN3Y2k5enVUZWtybWxM?=
 =?utf-8?B?MEFKSC9aSExUS3NnVXN0TWZWaS9zS0hZclRpeHdKSzJXR3JhM1RUaG9QZUkx?=
 =?utf-8?B?R3JLSlBncjhZQVdMR2FJU1B4azRGM3N5VEwzK3VSNDQzdHo3UU5nTHRxN3F2?=
 =?utf-8?B?QnltazVRWjN5dUtKMHlVa2h1U3ltclErK1lUSDRMenFiS3o1Q1A2MWllT2g5?=
 =?utf-8?B?dFVHWUYzOGtpV2h4T2NpaDd5dm1ZanVmRll4aC81TEJsaHJkdXBrbE5ZVm8v?=
 =?utf-8?B?VzdwV29ST2FBNEl5bzNSZEpTRld4aXJyUnhxR2JsWGVXVG1ZaFlRSUJZUm15?=
 =?utf-8?B?S21ZdjZRckczblRFTythb2J3eERncjdzS0xXeTEzWUNzNVpXSnU1M0VkUVBE?=
 =?utf-8?B?aFJZVnJ6M3FwcXVoRGFKU01yL0NIT3hYZjg1Q3RPZmNEeW1scEIzbUVVQlJx?=
 =?utf-8?B?UFFEeTZiTUZMTjA5ZDBvdEdGUjRuWUxYRTliNUpQSlJqN1NyVzN5S3RmOHBI?=
 =?utf-8?B?TTFRa3ZCcUVFL0xNa0UzMjVhbXZlQ21RMEErS2dPY1pqb3dETkM5eDcvUzNS?=
 =?utf-8?B?cmw1MmlySTQrOStpa1NpeitiVHhGelZYU3hQa3lyZHZlWk12UCtnVVdyMDhM?=
 =?utf-8?B?MlpDSVVPZlA2OXAwZy96Qkc2NUp3cjhCK2FlYWoxZkwwWkFzeHBrTmJ4Wkxx?=
 =?utf-8?B?dFJnN3J6ZlZmM1Y5bXRZRE1pdzJ2UWM0K2ZvV1Y1cVpzNUYyMnI0SkExTnlZ?=
 =?utf-8?B?UTFZSUg1aUN2cUIzOFlSVHdaNytPY3JUQW9IMlJKeFRBTUtHd1BIQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29715aa9-d4f4-42ed-c80a-08de551e7356
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:44:00.8103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GPzny6s1UQBNkYkjw4SzqNoskV9MwYM/zBbRqW4fRB42QNzOJDwThBpDyxvA4F9ZKAl2upl442yB0jAYBtVYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6214
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 08:19:52PM +0100, Francois Dugast wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Reinitialize metadata for large zone device private folios in
> zone_device_page_init prior to creating a higher-order zone device
> private folio. This step is necessary when the folio’s order changes
> dynamically between zone_device_page_init calls to avoid building a
> corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> must be passed in from the caller because the pgmap stored in the folio
> page may have been overwritten with a compound head.
> 
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: kvm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-mm@kvack.org
> Cc: linux-cxl@vger.kernel.org
> Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-

AMD folks, ack to get this patch through drm-misc-next or even perhaps some mm
related tree?

>  drivers/gpu/drm/drm_pagemap.c            |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-

Nouveau folks, ack as well?

>  include/linux/memremap.h                 |  9 ++++++---
>  lib/test_hmm.c                           |  4 +++-
>  mm/memremap.c                            | 20 +++++++++++++++++++-
>  7 files changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index e5000bef90f2..7cf9310de0ec 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>  
>  	dpage = pfn_to_page(uvmem_pfn);
>  	dpage->zone_device_data = pvt;
> -	zone_device_page_init(dpage, 0);
> +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
>  	return dpage;
>  out_clear:
>  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index af53e796ea1b..6ada7b4af7c6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
>  	page = pfn_to_page(pfn);
>  	svm_range_bo_ref(prange->svm_bo);
>  	page->zone_device_data = prange->svm_bo;
> -	zone_device_page_init(page, 0);
> +	zone_device_page_init(page, page_pgmap(page), 0);
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 03ee39a761a4..c497726b0147 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  					struct drm_pagemap_zdd *zdd)
>  {
>  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> -	zone_device_page_init(page, 0);
> +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 58071652679d..3d8031296eed 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
>  			order = ilog2(DMEM_CHUNK_NPAGES);
>  	}
>  
> -	zone_device_folio_init(folio, order);
> +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
>  	return page;
>  }
>  
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 713ec0435b48..e3c2ccf872a8 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
>  }
>  
>  #ifdef CONFIG_ZONE_DEVICE
> -void zone_device_page_init(struct page *page, unsigned int order);
> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> +			   unsigned int order);
>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>  void memunmap_pages(struct dev_pagemap *pgmap);
>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>  
>  unsigned long memremap_compat_align(void);
>  
> -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> +static inline void zone_device_folio_init(struct folio *folio,
> +					  struct dev_pagemap *pgmap,
> +					  unsigned int order)
>  {
> -	zone_device_page_init(&folio->page, order);
> +	zone_device_page_init(&folio->page, pgmap, order);
>  	if (order)
>  		folio_set_large_rmappable(folio);
>  }
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 8af169d3873a..455a6862ae50 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
>  			goto error;
>  	}
>  
> -	zone_device_folio_init(page_folio(dpage), order);
> +	zone_device_folio_init(page_folio(dpage),
> +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> +			       order);
>  	dpage->zone_device_data = rpage;
>  	return dpage;
>  
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 63c6ab4fdf08..6f46ab14662b 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
>  	}
>  }
>  
> -void zone_device_page_init(struct page *page, unsigned int order)
> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> +			   unsigned int order)
>  {
> +	struct page *new_page = page;
> +	unsigned int i;
> +
>  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>  
> +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> +		struct folio *new_folio = (struct folio *)new_page;
> +
> +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> +#ifdef NR_PAGES_IN_LARGE_FOLIO
> +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> +#endif
> +		new_folio->mapping = NULL;
> +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> +		new_folio->share = 0;   /* fsdax only, unused for device private */
> +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> +	}
> +
>  	/*
>  	 * Drivers shouldn't be allocating pages after calling
>  	 * memunmap_pages().
> -- 
> 2.43.0
> 

