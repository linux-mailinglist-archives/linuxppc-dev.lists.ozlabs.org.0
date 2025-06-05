Return-Path: <linuxppc-dev+bounces-9158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29501ACE81B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 03:59:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCSLh3bKfz2yZZ;
	Thu,  5 Jun 2025 11:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749088780;
	cv=fail; b=lDO35JkvLSlVruO7HkGKy0+jcmJZ9X2yGZb3rzVPD6G0PiL+wib1S8vqDQxjR5RqiZMqbnlUHCzoMLCakMRv7an2+0r7cqtsbd2iTjsNQcspJPTL5XTmO1PiQQUe9Gb5oX57F4x0bIuf2PJNEwjOg9Qo07Q9qpMa2GIMJR394pbRUDjgb2txrhnbwXql0v9CnG4/7DMMnylJcH0Vh3bQjDID6m0i9Dl9Wf62K1k+wctkieGxw/rJZ1wvZiv0cV36M4Q0uMtBPO7oK/7etElT+oy7fuykvxpaOg/7WEpg2dAPRoYxQEpMBKFpGNt+fJKUmsXMOxTQSYfRDLrN53FddA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749088780; c=relaxed/relaxed;
	bh=TqeZhNZeWFKq4OswiArec8QoaYfEsdU2+7yW+M6B0rI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hDAZ5dyd+WNyOFago77ziNhRr1RXw8mhXvmcETiQFEMedFAIIYz9IDFFfVNxiprE/2LKaI2iQZt7mWr0D/8Gx2xg1kfhhYDG7Fc1OpRb9lR5KO61cyI+418T9y04LYjJircLm9JGx7+YMgJC97iGVCDl6p9lsRC3f02rd0LXtSiI7qcPTz41eResEhEZDqnEzdvAwK6z6KDJv0bGkRCaO6dvYGMNj20Qbh+QUn++SW3lUxcHrM3etqfcxJtC3+TRNWfry7FQvKKTOfouWTITSOpa3MwgLTbAYXyjElZcsCkXSAToUPDDg3MLnic2BvywzCkAxdbnsrZBGn0S/syhyA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZylYjtpm; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZylYjtpm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCSLf1qZGz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 11:59:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749088779; x=1780624779;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nfpL2OcIVjcodReoWXVyoH7czE33uISBGzdtHIVOSEg=;
  b=ZylYjtpmOBo4aqIPnhsm48tONxwPvypYfHUTCCK1Iiy3Owfvs5mUUsj9
   kPBHhTB6yGQ47Ch6yVDPaEjw55hQ0c0B7qIXrN+M9cyg0UgdN9kgQykJ6
   v/T9ysRExN6FEc3WqCVE9yBWIJq3722q7Ia54l0cTCGd4LWIlKxHp16Mk
   nFnJxtitNyC9vFi3bP+rJOnhv7jhBSCf7FOjiBzPaX6giI55iN34y1AlZ
   zZ8Mg/pMUtIVmikT7n+PbN+C4ye23fWTbO1PBM5D0csd/DLRd5bFNu9T4
   56CWujyt+bZDJAzQ5haK9cN6ONeyTnKD2Saz6CUULyR4OZzDCdJVq8FQ9
   g==;
X-CSE-ConnectionGUID: fJmca3tKT5yv5tsn/sXhgw==
X-CSE-MsgGUID: 8lDyfnBJQAupJssBS108TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68629867"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="68629867"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 18:59:21 -0700
X-CSE-ConnectionGUID: ydu45TO3TYWVz4FbtTlzyg==
X-CSE-MsgGUID: P9YSHCfOTeG78AKFpYDl+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="146345170"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 18:59:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 18:59:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 18:59:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 18:59:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ianb8mKH6KTunPBhiCQH+urgj8rgqAIggKyPasHu7eW1zkDhpWV21C0s/zb6ALIIatINr1u7QUL0utxIcSa72wa9lVcOMEDSVA8vLQozfjt3wYcxCoU5SjzxHLRWOv9BglCzLByCZl00dyMLl0WmY0r0kzucKlSGTYalMJqQ/R4zm3TTgD0l9pR2fSXHQRNtmm7j7xYnqMCKKJU/C2tui5s2JovDU/nJE2B7pRvVxnImyVRMlYaDhtTrqc2ystwK9wTknfzUsDvkM8l3F4wasFeQYhJfCuT9XCqYFe/dC9hBA/UJJhmSTerSKgbnwf78bjZ4lAkgYa3eapzqSINg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqeZhNZeWFKq4OswiArec8QoaYfEsdU2+7yW+M6B0rI=;
 b=ueUv/oGGF5StVDMmDB75ukMqUJDL3p2QSIGkqRhhvfFtunL+4NxR6twQrl78QYwC0iHqu3peTunXAdQg1HM8CmPHFo4uBzRcYpbILGzW/TvmOZXRHlPVsJ+holGVKq4gsM1b02JNJd0w7okUWFMCa8HZYF4WsWc/bJW0/3p03T2o7OAtUJDQaaiBHw4+yjVCOjJ6641m0Wud8/aQpzudC3DjXdnKWjtqJNiwSU8DT/ERYY5lSB8TaX+c+0ESSCWguQ2jaS/N9jS1liPv814jtQJf5P6+qMzeJZ8nxQqYE0E2W8awx0z34DYdvPGxffdIV7otchJgRb6gUWjjFAswpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 01:59:12 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8769.031; Thu, 5 Jun 2025
 01:59:12 +0000
Date: Wed, 4 Jun 2025 18:59:09 -0700
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
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
Message-ID: <6840f9ed3785a_249110084@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
X-ClientProxiedBy: SJ0PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::13) To PH8PR11MB8107.namprd11.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: 62dec856-fda4-4beb-5aa7-08dda3d49120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?39Wf5m4ct40NCB4EVaGzBhBzU+gpjZXTYoweYWfgP1RBBhvZZGXzFVD0rcD7?=
 =?us-ascii?Q?AgrmrnlYTTuo4vW4doKUZX10xG2YTNKEVJbfarL09eOyqIaYE7t6P9DiKgzF?=
 =?us-ascii?Q?OhhHLh0zIOU9wKYQahDf1ao5Kwva1bLGRbiT/aeF4ABS0rXfScuA3oQWTZsB?=
 =?us-ascii?Q?QdT6tupnmtb97wQaIgdzh68oV8tJ9aSUw45ruo7KMr+or1pf/NQBfjhbhZpd?=
 =?us-ascii?Q?2+5nT3mx6lr/QMqvC5U2t1OpzBuytf9/BNo2tItDOuaKwpVtqhPFzHR4UKWE?=
 =?us-ascii?Q?eHMF/Sj/fzQovwgWqKJ2dstXUjgKL+NWudsw9JG4la/NixjzpxARPxD1XV96?=
 =?us-ascii?Q?GkJiFwmhNdfE65VzEMonA+eI1SJNEVg3zQL7tG/K2zRCxmBqstPOFVajWTcc?=
 =?us-ascii?Q?P7UE6eOUmnSPeHpFw1AMvqmBHhZVXvZWm1aeMMdVYwQLYNk4qeMOUIzYqOiS?=
 =?us-ascii?Q?1MEaYozM0NGBnDj7vk12Q1dHkcEX1IbS75nAONsDpFvhaHZyTkEXDLr3o+7T?=
 =?us-ascii?Q?2S2CL6yxdPvu/TAMZevpbJr5zwIr6grXvjcBisrliAz2YuBLoIcC6Bm/Z2zI?=
 =?us-ascii?Q?Ob9m9y+GS9aRZ7AiAhZxDS3/3K3v/rQM7BZujj8nvrlJ/pBg0cGSXjnu/1TX?=
 =?us-ascii?Q?s1SchLDw6C6skjx/NREhsHdN+tJZywxqLSrqDE8OHUSPi5ocEjyq06dfMPIi?=
 =?us-ascii?Q?x+bxs1jPLGGlQBIvJMtGQZMB2NCI6qlncagvMbud/ydiO1JY7sbvuGSpegEF?=
 =?us-ascii?Q?BmJBuTv4Be4oehA4mDjW4t9vfFKudZYcgfe8W4xDjlbmRRVoMgAj4Njz6R4M?=
 =?us-ascii?Q?I9fIeumTwqLEZs2n/vLYdN5gVeK9aL/rsQuf2/eRdVbqUoinjEonF5Z0pSnT?=
 =?us-ascii?Q?6pTTMiL3mXZ2aKVegbr7qL1I6h+I0xR7CtZ4Vz7Zgoa/yjQL7jASJvUu+r5U?=
 =?us-ascii?Q?mCMRBsJQWcQxYwYe8ooKMcM1EytECUHFtnl0Rwh3TKhagucOKShKozNp9yK2?=
 =?us-ascii?Q?RUcEg4vSdJ2E9qNIr0OPRNb2+T7V/b3olyf5Nq619bm7PV5W5aGsaovuBp0i?=
 =?us-ascii?Q?OysQQ+TqlOwAYhErjC8jWAGG8rhf1HVmYDQSEb/bQmUbtEddXk8nc/F7FO6n?=
 =?us-ascii?Q?lcTJ+kAtsEiT9RwQbxsCebOtKjLfczlcdeSZG4f+mKVtnezmrh/+f40Df6tn?=
 =?us-ascii?Q?jSOT7NSoG/VMzpW/9bFj5ZejgbD8ybNYoDms07ZlLegHezJTBAxLuUQJjrd8?=
 =?us-ascii?Q?wmVHOE6+05EX00Gr28C/bMtGHBwzpgppL9i36NQdR71+3W0MsFZtSChO64ug?=
 =?us-ascii?Q?LtOM09bSLVcDj7hpx69vRQ1eSLdgbsnjRbfz85NpsV/xY7dIEcOm3M/wjuUS?=
 =?us-ascii?Q?lY4EW8UyCWqj/viumkx+d3+IEAmzG24y+9dzJxolvQLi9kQoYbrB/ooljb9f?=
 =?us-ascii?Q?0kHnhF7GHdI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lA1l8sWjxQ+gmRzLx+OkHn+bBccCHYBpO7CBmL/5MX2FhrIUVtcZ3d4+Bu/f?=
 =?us-ascii?Q?lf4FQruRQ6R3y/AvAX6XxKu8oTm0Vf8nD/shh+vUeAetcieFKm69ZG74KnNL?=
 =?us-ascii?Q?5+dgiZbZl3flBB/8t6RWBmr17DNo2YVRu6VI5Dci1WAo3AjePmTc1GBj0Nva?=
 =?us-ascii?Q?2IxlhjGwzPNzTeq4/nfLFB6O98IU3PICs10Och+q5utmEc8r8y5BYsHOG/1L?=
 =?us-ascii?Q?YATQo5pmbjEwf43WaGID2SCZFZOALeBc/d2GuN5Ui5O6ObaYjgU2FrEzkwIe?=
 =?us-ascii?Q?HZIYvV1CtH6zJIBPq1rCiZSir+NFzWLghlfxU+nD4I57H/gGX+eNZkt3p5Ca?=
 =?us-ascii?Q?JraWCEuHPBRygAayk+zG9S+XdKMEUQ2anQFgaXoKH6WaQX+/gOc1bNmV7Aur?=
 =?us-ascii?Q?y5POMR4KMGwU8JmUKhUc04UkoYx0oQtvwxD/Cmt82hSXXVnKuDKQliE3CY6S?=
 =?us-ascii?Q?9IdtwNvsKKgHiXnMWgmw33oEigqdJ8Wp7+m0fN1g32RBKuv8bROsY/mcq8rs?=
 =?us-ascii?Q?iSRC9yHUYALG8nszRUQNJizcpLBbum0Zt+FQHDJUwMGp7deDfAshtLIC2XbN?=
 =?us-ascii?Q?qh0ksyU5tNtut0aKJWP1WGPlLRUOrvTh52jDf8OZLLQb+A/xOpp1C++DnXRh?=
 =?us-ascii?Q?MBiCHUiUbmFNcd33wLCTG8fiKsxS4NwFqhW5AdYoRTNSzPVAWkRxe0Cw2IKs?=
 =?us-ascii?Q?3em2TsrACLX4n/jiLWaBOnURFgTN9Ubk6VbTsO5bLIKcrFC7RzVzCcJoudxm?=
 =?us-ascii?Q?dDC4KW6iudniUc61FNFwVBpN06MYtyT3o42xYyZ2Ll6ym29X0eOgaglRmN9A?=
 =?us-ascii?Q?TBlcFj4w2n3Q/bFU/4rdLrm0oJngISxjewET6S/QYO8UN5xMnpW6dLY1eUrw?=
 =?us-ascii?Q?xTdXOrY0OxDCDyf+m2fi7vNirEIQw5jGXHwE1adsfIw1V0Kk0U6Pj9VqebmE?=
 =?us-ascii?Q?J2s3hTQeNkiAuubZc8fRXv1vQfXc5OE6rwHFA/7sRLQQLPb5SjjOtTW3JoSU?=
 =?us-ascii?Q?Cs+ogMWjW6rVcVLGedEPtB9c0Y0908g09fH3YTgbmbUqzIj0ckzrMIPhQnvX?=
 =?us-ascii?Q?vxQfb2KLuppOPAFcH4b+NrtR3tvDGTC5EXKR08hpg+tnFKvUxb/BroL+GAuU?=
 =?us-ascii?Q?KQ4iKbRBVZ1KpepVMsJvStGEsMAOwTkLtkxqhRYbB0TIyDHMV+YfIseRLxbo?=
 =?us-ascii?Q?xGDA3UCr6AlmYAL8QbN987ywmzWaPTsgAxZIPXokwjpY1FJGz8esvVj9S+vd?=
 =?us-ascii?Q?0EB/+RO8od3eB0bvBrCzKG0wKwrmnMHkxBqP4833I2Mvdum65Dtyus3IuF20?=
 =?us-ascii?Q?pvlRlUcTXdY8J4TF2K1eNDDxnCD6AGnGjGy8Ai+WVrMI54FppcHXDsp9ytjR?=
 =?us-ascii?Q?pu0t/rnYzGlW5DaQIn64xDg7dYJ8ADnCxoN2wv2whKN9ZbO2HX/+bzHsdndz?=
 =?us-ascii?Q?NC2FOm7Ig95itmQ/hB1j8kR5PcOjqeZW8NeBbo3pIH4lbB7PpTXXawUx1hMb?=
 =?us-ascii?Q?fl233kejYKYBjEKA4wl2+A88vRcdXwOgy4WR1l3U910pn0Th5oUAIrdl6IOq?=
 =?us-ascii?Q?RWRERHth6ccKGLCSZ3jfdj6q7YIDzQq1+Qac/dKwfGB2Luajaf22xo2UWs6F?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dec856-fda4-4beb-5aa7-08dda3d49120
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 01:59:12.1877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ihh09ZvmuQw5JCe9POBPH4PwjvSWvMcggnsK8h6POm3gtlrQr36mz+OCChi6bMo+50UN5xYJcFhvtA6gbApuOhZeSUPMKwfqdHNrpShtwJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Alistair Popple wrote:
> Previously dax pages were skipped by the pagewalk code as pud_special() or
> vm_normal_page{_pmd}() would be false for DAX pages. Now that dax pages are
> refcounted normally that is no longer the case, so add explicit checks to
> skip them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/memremap.h | 11 +++++++++++
>  mm/pagewalk.c            | 12 ++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 4aa1519..54e8b57 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -198,6 +198,17 @@ static inline bool folio_is_fsdax(const struct folio *folio)
>  	return is_fsdax_page(&folio->page);
>  }
>  
> +static inline bool is_devdax_page(const struct page *page)
> +{
> +	return is_zone_device_page(page) &&
> +		page_pgmap(page)->type == MEMORY_DEVICE_GENERIC;
> +}
> +
> +static inline bool folio_is_devdax(const struct folio *folio)
> +{
> +	return is_devdax_page(&folio->page);
> +}
> +
>  #ifdef CONFIG_ZONE_DEVICE
>  void zone_device_page_init(struct page *page);
>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index e478777..0dfb9c2 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -884,6 +884,12 @@ struct folio *folio_walk_start(struct folio_walk *fw,
>  		 * support PUD mappings in VM_PFNMAP|VM_MIXEDMAP VMAs.
>  		 */
>  		page = pud_page(pud);
> +
> +		if (is_devdax_page(page)) {
> +			spin_unlock(ptl);
> +			goto not_found;
> +		}
> +
>  		goto found;
>  	}
>  
> @@ -911,7 +917,8 @@ struct folio *folio_walk_start(struct folio_walk *fw,
>  			goto pte_table;
>  		} else if (pmd_present(pmd)) {
>  			page = vm_normal_page_pmd(vma, addr, pmd);
> -			if (page) {
> +			if (page && !is_devdax_page(page) &&
> +			    !is_fsdax_page(page)) {

It just looks awkward to say "yup, normal page, but not *that*
'normal'".

What about something like the below? Either way you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 12d96659e8b4..4e549669166b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2471,6 +2471,27 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd);
 
+/* return normal pages backed by the page allocator */
+static inline struct page *vm_normal_gfp_pmd(struct vm_area_struct *vma,
+					     unsigned long addr, pmd_t pmd)
+{
+	struct page *page = vm_normal_page_pmd(vma, addr, pmd);
+
+	if (!is_devdax_page(page) && !is_fsdax_page(page))
+		return page;
+	return NULL;
+}
+
+static inline struct page *vm_normal_gfp_pte(struct vm_area_struct *vma,
+					     unsigned long addr, pte_t pte)
+{
+	struct page *page = vm_normal_page(vma, addr, pte);
+
+	if (!is_devdax_page(page) && !is_fsdax_page(page))
+		return page;
+	return NULL;
+}
+
 void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
 		  unsigned long size);
 void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index cca170fe5be5..54bfece05323 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -914,9 +914,8 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 			spin_unlock(ptl);
 			goto pte_table;
 		} else if (pmd_present(pmd)) {
-			page = vm_normal_page_pmd(vma, addr, pmd);
-			if (page && !is_devdax_page(page) &&
-			    !is_fsdax_page(page)) {
+			page = vm_normal_gfp_pmd(vma, addr, pmd);
+			if (page) {
 				goto found;
 			} else if ((flags & FW_ZEROPAGE) &&
 				    is_huge_zero_pmd(pmd)) {
@@ -949,9 +948,8 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 	fw->pte = pte;
 
 	if (pte_present(pte)) {
-		page = vm_normal_page(vma, addr, pte);
-		if (page && !is_devdax_page(page) &&
-		    !is_fsdax_page(page))
+		page = vm_normal_gfp_pte(vma, addr, pte);
+		if (page)
 			goto found;
 		if ((flags & FW_ZEROPAGE) &&
 		    is_zero_pfn(pte_pfn(pte))) {


