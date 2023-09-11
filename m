Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C5D79DB0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 23:40:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V3l1jIu2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlcS801Gxz3dTr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 07:39:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V3l1jIu2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkzs10rhqz3bxY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 07:10:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694466645; x=1726002645;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cz+v3li1JoGPwRcSsa49A9A/hlg8ps60ng4auSdFE3o=;
  b=V3l1jIu2nPNNJSDZ7FBUPxT1NVAtYEgt3jpoAS02aVBDYVrimNkfFvIj
   UctWg6P4Ca/kBZ6OAqZhIeHp2oItuDg7vbbOKS23l82K0WmPcoepmn/B8
   Jwwqr1emKzUhoHv2x6b0cFbEmNv/GAgQNG7vY37rTQtf9A/pDzHVAu1Ni
   bV6UbqlODC9mJCZdqfn3rODk3BBgewDtBBnvUjRt/xjQVq3AXKexTL9Re
   JWrhPDuWEm6KFaJdM+oEpKUUkC7eKDvyAWz1x4swCn8uoRJlhH8MD5ZL2
   B8HwkbU0thMElJ62zIE6tiYG6nnKNdErysceM1i7SuAvJj0zlMz16Ka7E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442211549"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="442211549"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 14:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="990249656"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="990249656"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Sep 2023 14:10:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 14:10:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 14:10:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 14:10:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 14:10:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwOINgTVrqg6AjV3tQUGEFF0oYkXq17zca5dEBEiB1OTWc8bx6wjXgy4Z6HgSiv8Sw6rdrFCiz6YDFYnzmjhfilLOntQFa8hMnwA1xBQZPcLk1W2X3ozVo/LxI06mqX8lu3fS3dFZmBYt3mYg9isiycJsdU2o+lDuCMwroUbGBceQomA0uYxGbL6df4acMTNFQBZgV08gByVD0s5FW8/AbtItmHPITSXB/zRPWBCY9ggxEedFWBi+AKzjo+cSYjXTYmUcXgr0eOdJm6w5GOrjQXoZbMO3vHk1pCN71dvPyo8+bIUR3qycbOGubDuHcEyIy3RiELze77NWxl/t4ESkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cz+v3li1JoGPwRcSsa49A9A/hlg8ps60ng4auSdFE3o=;
 b=MTaShp7v0ELm0nMWutwE1GzcfXqkHAOyGwHGPt4hQXZMQ8jUqFLzvJf/NuIw5ZKM2441oI6UPlBC2E7zhsIYi/Z0y6NQtrgdlAiEnTkWaTqd9QozFWBDLEZeVZoIAt8rX1oZGn3uutC4mRPUdgYpyXdup0Tq3k2hNF2t+V0DmkeBqwjilknq4euLgNLfa2dyGWbbz+g0MeWFg4JZO7MlEQc2kIjHylmGDuBMQVQzfMcuXa4tdB+I5S+ibU9ChU35n1xBhwDw5j7l9fxKcM/Avj/QCsrwGlG1Wu53YdWRbi1LhLLn/PCVI0UEhAAfoNkpHZlZhrAdNfzC1LZ8/9E/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB7202.namprd11.prod.outlook.com (2603:10b6:610:142::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 21:10:26 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::56f1:507b:133e:57cf]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::56f1:507b:133e:57cf%4]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 21:10:26 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Mehta, Sohil" <sohil.mehta@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-api@vger.kernel.org"
	<linux-api@vger.kernel.org>
Subject: Re: [PATCH 2/2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
Thread-Topic: [PATCH 2/2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
Thread-Index: AQHZ5NpRkTepLBjCJE2MYA1Hq+GzELAWHwiA
Date: Mon, 11 Sep 2023 21:10:26 +0000
Message-ID: <8b7106881fa227a64b4e951c6b9240a7126ac4a2.camel@intel.com>
References: <20230911180210.1060504-1-sohil.mehta@intel.com>
	 <20230911180210.1060504-3-sohil.mehta@intel.com>
In-Reply-To: <20230911180210.1060504-3-sohil.mehta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CH3PR11MB7202:EE_
x-ms-office365-filtering-correlation-id: 23acd5b9-46fa-400f-3bb1-08dbb30b852c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OK8B7vokoD78jQYDjMuVPzAbbtFM6XAEjY9hKSs3AZuq1kG1CuguVaD+9tWZoX/lt2LI3AJ9gb12yjEXWlA06xZjNX5z6bqDqvDfndlJG7u6PmFpGRVs1fqith4R2Pm4xxE1622OtHqSYgDAzgT1b0wsfwjgN/MWY13ZmdQ/bxfeaUfvgSpo7JrHAQbRyZrLoRYEwkc4WWJ15S/sKqsdasGTjjL6FV2p6Vv1oBV4/aZXJ93fqWHY9xMuNAihCLbHiME/YWu1TWs71jvaV7lLLUD4qU454C25GLfTS7mj46pkXR8O1KKUNM9jIbs+LgWaS8TT/rreJrbXlLgjvFooh1C3v9ch/ObDxvMF3eE0qmYW3Z/P6rwgDZriUZHnN6kBM8HgeQXdkKTrTUd/8E+1XJwomLgYrjqj/TwKyD5gCu3WG58j8h9wdRBKIjZ55a0mzUXrrd+4xpVrosm4LiBBE80lnTqC4ooDP21tP42JYtqJOYtLJBXO0ZL8bmYI3TXNVDzaCUM050i8r1Z5J2gGcDTJjINfxvQzSXxA6nG+RU5STlH09rBhemp4JxGPvqLD2wBrVfureooBNTB5Gz5MEa8vujk4TLJ32bEVOZI6Nq4fgro9dN3RaKb439NQmM1H
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(1800799009)(186009)(451199024)(122000001)(71200400001)(6486002)(6506007)(110136005)(8676002)(86362001)(82960400001)(38070700005)(36756003)(38100700002)(4744005)(6512007)(83380400001)(2906002)(8936002)(66476007)(4326008)(2616005)(66446008)(316002)(41300700001)(7406005)(478600001)(7416002)(5660300002)(64756008)(54906003)(7366002)(26005)(66556008)(76116006)(66946007)(91956017);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDJYWVdKOCtMSVNGRkRPTWpuTGJJNkkxU044b1lpUnhta25TUFZrUXZDSWts?=
 =?utf-8?B?TEttRWp1V2owMW5kUDJiVTBCUnI1QUYvOFdDNy8rUUlHREpMSG1Xd2lsUTRZ?=
 =?utf-8?B?SjZyVUdOT1AyRUhMMzZUZlFtcEMwQmcxUTZzQitYQ3k0R1dGcG40YXNsN0pC?=
 =?utf-8?B?dGlDNWJZODNHcXdHY2VzOU92M21GeE05MlhyZVhpazJ0dnQ5T0NnZnd3WDZt?=
 =?utf-8?B?Nk16bjZzd2FMWkRVNVhQTjl3RkVicVBWZUdOT05tL1FLR2I0S1lXUThTY210?=
 =?utf-8?B?eGhaTzRzUmJCTEd3TUtFQllPdDd0ajNnTHJXL3o5SzZVdlRPZk0xUVEvb00y?=
 =?utf-8?B?a0xkMTFDZmhaR2plODgrdDFTaC9aN0R4aHJQNjJoRjVlZ0xjUWVGV2lxK0pE?=
 =?utf-8?B?aEpCdTY3Q2VpZWlPR1UxZGM1N0ltSU1NWGU1YW9mdzY5d29RaTNJbDd4UUhk?=
 =?utf-8?B?ZjVsWHlwcjRSenM5aFcvaUFJM0VzYXBuMUdmNE1Ud1E0alh2Sng5dTVDYWUy?=
 =?utf-8?B?c2dIMHV5b2xtbVAvRmZzOG85VkJhK09qeGh1Q1l2VStrOVdva05NKzFWV0hj?=
 =?utf-8?B?S01DeStXRmx4KzA4MENIM01ZQUo3TmhVTWEzRnU4Q2xXV04vTW00bjZUWjdt?=
 =?utf-8?B?WUxTTUY2MnlrSnE4Yi8yZkoxd1NIK2Q0S1lkTWNsdUhCbUZMbmt4ZlVtNWJq?=
 =?utf-8?B?bTZnd2RiR2NRbHhkbmwyNlZoMHo4ODl1U3FsZnMwNWdlcUVvdmdqWmNFRzAz?=
 =?utf-8?B?Y0NaajFNNjFQanUvem8wUEhaTDFFOWhFRDNBUmVFbVFGNlRpS3FCU2Z6UWtG?=
 =?utf-8?B?ZHdzTE00S0lKVEJyQVJGYkRmSFZoZjFlazZWMzBSRnFtYzVrTFNBV0NNNExl?=
 =?utf-8?B?bDNhZFplTWdjODI2ME5QVGpwdVVTejVRbkE4T0VvbUJrd3k0RjJHamxoMjlI?=
 =?utf-8?B?TC8wTlM4c2dPWmE5bDNQT1BEV01PVlRJZGl3U200RndtcG1kUllqd2I4UVhu?=
 =?utf-8?B?cEhPNXNFTzF3K04xYlpJdTh1WHZzWTJZcE1KdHYrN05Cc1ZrUDFsRTdYd0Y5?=
 =?utf-8?B?bml1ZkdVdzNqNmdOdUhUU2F3cHQvQ1I3eXBxbXYra2E1K1RYWDJha2M0WUJ2?=
 =?utf-8?B?VDM2VXhKaG9WQlpzanFmdGRxOGU1Q0EzOXBzS3NMeFB6OStJQWlmR1dpV1hm?=
 =?utf-8?B?M1R3eVlMWXJCR3BGUWZLQ2FKeWJGTzkrbElKdWtWUkNPK3ZYazRIcXd4Z2d4?=
 =?utf-8?B?RkdZSjdBM0ZLdzFXS3I4b3VwNmJ0N0svLzVUV05iS3lRSkRSMHd2VXhQeHBv?=
 =?utf-8?B?Vm83a3dZd2MrUkppUVJoQkZSZ1JESzQvODJLWFhiTGJLMEE5dEZxOTNidjk3?=
 =?utf-8?B?QVh2eE1DYTRDTHV6MVJ2eWR6dkt6V0tvckk1d1IzQk5tS3lma29ZdjNNc0xk?=
 =?utf-8?B?UWtPWXdURHQydngxclM4b0FNSlV0V0hMRHRBS21rTVFJeC9xckZJWFBnd252?=
 =?utf-8?B?Y2w3UVN3bHg0NFpOMlgveUhHUmJmREsxeWdrcW9mUkpxYXRwTG93d0NQSDRi?=
 =?utf-8?B?LytCYzduQjRUUmc3eGU2V0FMSVJxSnlsL0dKQUlOV0F2bVAyRHFKQXQ4aEFq?=
 =?utf-8?B?QkpXK2h5TGxtVGptTm56cy8ySkNCanRxUjRzOUc0VnVLZ2hHU3UzUVVTZVZY?=
 =?utf-8?B?ZEs5cGZhaHpPVENSQ2dyRHJaTzhuL0FRcXhZVy94VkQrTFBaQVFGd3gyRUE2?=
 =?utf-8?B?dHF5azIyN1k5dkxHOG50U3BZR2QvUVRZeHFvYStMMFVPeENSVDJvNlIrSktv?=
 =?utf-8?B?VFNZeVRvQzZDYjZSckV5Zm1qbDE0RCtsWWtJSk9HM0xZa3hDd1V2YkkvVGpp?=
 =?utf-8?B?Mzg0ZmZ1ejdWZStzRDhQY0RSVExxMnErMzd4Vk1BU2YyZ2dQU2pWY1p0dHRk?=
 =?utf-8?B?dkRTTUpNc1F3TEtHRTMvdGt2RFo3QTBCa3ppT08vbDBRNWpnZHI4RU1vbWJj?=
 =?utf-8?B?S0RIR3p1N3EzWTlKKzVKa05zWnRSVW1CSXJqdDZEVFZjZGg2ZUxlcmRXc1Uy?=
 =?utf-8?B?U2JDS0FVajlaZTRqTkZiOHdTZ1QwbUswWFZib041U2ErV090S0NObFVCM1VY?=
 =?utf-8?B?Rkx3VXJZQnhWNXhDaDQ5L00vOEltZVJJVGx1V2V1NVdzQWlaL3FKTzJpenY3?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1955378CE723A64F8B91F3A248378666@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23acd5b9-46fa-400f-3bb1-08dbb30b852c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2023 21:10:26.3311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HLaoGmYZB49/k7gO5MHzCV3kWlkKIzYkFOA/yfaxaK6+Pz0NRaJ3iQ/UgYr90m463Lzfq/eY7NDmV2nbTKXOHYz+4COL3FjVF3YqWAst0BM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7202
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 13 Sep 2023 07:36:32 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "irogers@google.com" <irogers@google.com>, "dalias@libc.org" <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "James.Bottomley@HansenPartnership.com" <James.Bottomley@HansenPartnership.com>, "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, "schwab@linux-m68k.org" <schwab@linux-m68k.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "will@kernel.org" <will@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "ysato@users.sourceforge.jp" <ysato@users.sourceforg
 e.jp>, "deller@gmx.de" <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, "mattst88@gmail.com" <mattst88@gmail.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "arnd@arndb.de" <arnd@arndb.de>, "brgerst@gmail.com" <brgerst@gmail.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "richard.henderson@linaro.org" <richard.henderson@linaro.org>, "acme@kernel.org" <acme@kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "broonie@kernel.org" <broonie@kernel.org>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "npiggin@gmail.com" <npiggin@gmail.com>, "Lutomirski, Andy" <luto@kernel.org>, "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>, "namhyung@kern
 el.org" <namhyung@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "debug@rivosinc.com" <debug@rivosinc.com>, "chris@zankel.net" <chris@zankel.net>, "monstr@monstr.eu" <monstr@monstr.eu>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "rmclure@linux.ibm.com" <rmclure@linux.ibm.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>, "Hunter, Adrian" <adrian.hunter@intel.com>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "slyich@gmail.com" <slyich@gmail.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIzLTA5LTExIGF0IDE4OjAyICswMDAwLCBTb2hpbCBNZWh0YSB3cm90ZToKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsLnRibAo+IGIv
YXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsLnRibAo+IGluZGV4IDIwZTUwNTg2
ZThhMi4uMjc2N2I4YTQyNjM2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lz
Y2FsbHMvc3lzY2FsbC50YmwKPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3N5c2NhbGxzL3N5
c2NhbGwudGJsCj4gQEAgLTUzOSwzICs1MzksNCBAQAo+IMKgNDUwwqDCoMKgwqBub3NwdcKgwqDC
oHNldF9tZW1wb2xpY3lfaG9tZV9ub2RlwqDCoMKgwqDCoMKgwqDCoMKgc3lzX3NldF9tZW1wb2xp
Y3lfaG9tCj4gZV9ub2RlCj4gwqA0NTHCoMKgwqDCoGNvbW1vbsKgwqBjYWNoZXN0YXTCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3lzX2NhY2hlc3RhdAo+IMKg
NDUywqDCoMKgwqBjb21tb27CoMKgZmNobW9kYXQywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHN5c19mY2htb2RhdDIKPiArNDUzwqDCoMKgwqBjb21tb27CoMKg
bWFwX3NoYWRvd19zdGFja8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3lzX21hcF9z
aGFkb3dfc3RhY2sKCkkgbm90aWNlZCBpbiBwb3dlcnBjLCB0aGUgbm90IGltcGxlbWVudGVkIHN5
c2NhbGxzIGFyZSBtYW51YWxseSBtYXBwZWQKdG8gc3lzX25pX3N5c2NhbGwuIEl0IGFsc28gaGFz
IHNvbWUgc3BlY2lhbCBleHRyYSBzeXNfbmlfc3lzY2FsbCgpCmltcGxlbWVudGF0aW9uIGJpdHMg
dG8gaGFuZGxlIGJvdGggQVJDSF9IQVNfU1lTQ0FMTF9XUkFQUEVSIGFuZAohQVJDSF9IQVNfU1lT
Q0FMTF9XUkFQUEVSLiBTbyB3b25kZXJpbmcgaWYgaXQgbWlnaHQgbmVlZCBzcGVjaWFsCnRyZWF0
bWVudC4gRGlkIHlvdSBzZWUgdGhvc2UgcGFydHM/Cgo=
