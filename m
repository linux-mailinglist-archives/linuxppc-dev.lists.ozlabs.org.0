Return-Path: <linuxppc-dev+bounces-10403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFB8B11CE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jul 2025 12:53:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpPqg2VCkz3bTf;
	Fri, 25 Jul 2025 20:53:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753433160;
	cv=fail; b=gvb0K4H8yqWxVbQmSyopg5fQYDGhF81+hQLc9sep6IMLO8xQvRcFFPrQNB1enHps9QvBFVt4FGP6kQyo4qg0toXvzn17VcCYNgh7myg4oNPxHaOMbT7gYrZ8Phjct0nVTD7H/ZU2tvZca9xYVQnYU8h7r3jkok6XhtTJP6wcKOLd/2zMndn9MyPgD4JEefMKq9RRnNaT/mnnbS0s1Z40cuJvh6BBKzborRZZL5AXnU6LChYmDDv9qMUQ2mAz35exkqaVeIL8PrjTjQfwNuoq43nPDcb5ZsLu6q+N4lUbYhRoAWqhAwBsEwfGOW5wvL2jd7mxzaSr8Si1ZpgmxoBUyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753433160; c=relaxed/relaxed;
	bh=Vnkm0woEXkLvAca3NQCppOHg8/PLiPgD4m9y99FspKU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MUEni8qlSTXFqO0MuJBuHDhxClXvhFbUaWTjPEgpdfdy+2OLalSVkgUX2H9gd6FPTzLIyIlnSV2CYahU3R75uXt9SlKR6l7EY2H5s16rlGdj85e3C4C5lwncBunFqNIqAyDa/SsXAqDkaalCl06HCDLqvIIDUG0tbdzYEJdT5MF1SAS0r67pz6M0gsa9Nbm/Czo+uXpB0JSfTZuu70eHt+hAdGwo4ULKVYEHt9i+8MpWsgDe1wpVFlasrwjpSRlOMWhWGRVlhfJUQqeT2oQvVMNzg7/096O23ghGcNc7mmY7YQrnuowwhOM5GqH5VGOxApbUGMa6L5695K9jkky2Ow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TvrEsvn/; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=alexios.zavras@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TvrEsvn/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=alexios.zavras@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Fri, 25 Jul 2025 18:45:56 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bpM0N6TYmz30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jul 2025 18:45:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753433157; x=1784969157;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-transfer-encoding;
  bh=Vnkm0woEXkLvAca3NQCppOHg8/PLiPgD4m9y99FspKU=;
  b=TvrEsvn/flw1nvh+PR46Y4qxz3VkJn36B199ffRXA2Q5c88Iyg/gmTAC
   kxQhXQJ8WfhKD1tovrXlRgSF6Zxj/RywexBRgGO9nWWbGYF6JyJVnmO5t
   qxv8hUJa1184fLKh2aLxWTFCmrUfm3Ht4aXuL8fQMml+MQF+KHy3SvKDF
   Qk71NBzCIGmVmXmzyDV0KoP/c+bNntRKNoUqqUAoQU2RTTzLMFH5K649H
   FY6Tb/sRrmP1/VUjr+PMzLOcZDCANcQmk2x/YrOERC7y0mbtmK1xKyvcc
   zna/mJTy4/v5AlSuXVvTE49DNKZIPhviuGl90S5E2QhTuTZ8PbOctINM9
   w==;
X-CSE-ConnectionGUID: /PMbFqivQmOcC9hfyoOtvA==
X-CSE-MsgGUID: 3CogZUoVTP+LInGWiwrczQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59417637"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="59417637"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 01:44:47 -0700
X-CSE-ConnectionGUID: pFBzT3uVT1m7YqSVIim9Jw==
X-CSE-MsgGUID: bCYdv8lhQni/HmhVM6VPZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161268366"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 01:44:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 01:44:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 01:44:45 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 01:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvQDUSfW3r78sE6R+T4iGFGLN//G4OML38v9gWDSBsQ0kyo0PGvFTzG1tmjJDV/CUa8klruvH9yYYIfduYDGnbCYdKHh1SQfg52rcajojd1qk71iPt3U0a7kwlOg9St5JUPqE+ckuiZKZefGsogk1Opa/Dj0rEbiY/BEWDdWS1oEGQdfId4G70N1W6ekyzXLGIa7s3P8RyyQ9er7Vx+8BBWljZxrp85WG40NqjLXJHnPEyfuugzaqsb6wWrUZ6s8exdqWyzmbhSysiUsmUrer2/J5rwTpdpdCR02SRX8/elehBURBKULzpdO3i7XxCJ2bF3WCqjo3FlWX4GS4wHQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6MSccMqEqqxZpRJPoKDptCD5sL4jgHBddmlLxKQzJw=;
 b=CmIGN6ny8Yo8E9GW1bzTAXd3/5bU6Hb8xWoRn0Ztnlb8oIlbHPzjX4Jojxt7VQFUWP9BZRAaQRcYLb6CpnDkAjjZ2V4HXleccvHnUnDt5Cq8NKLG78k89k+Pawk02BeusnE8jHULBVNDOZ2BGoYygprsRNB25gAcRMJHM4uiwFqJBPbSJ7Aopgvbpu3Wl4WSEnd+sedeyz5qTtOkcwXM29csf3lro/Odh47LMjUklrLwFSfycuYjFbDeJifOPSJ4AfzUG+vQtVEbC8/9n4XfXXsReob06zCyOa7iWkSHtm5BPoDz3nYUS+pfAXxWB9+f/phHY/+nRrqyKaNfc1kp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5400.namprd11.prod.outlook.com (2603:10b6:208:311::20)
 by MN6PR11MB8218.namprd11.prod.outlook.com (2603:10b6:208:47c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 08:44:38 +0000
Received: from BL1PR11MB5400.namprd11.prod.outlook.com
 ([fe80::4da3:f9f3:4dc4:43ec]) by BL1PR11MB5400.namprd11.prod.outlook.com
 ([fe80::4da3:f9f3:4dc4:43ec%6]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 08:44:38 +0000
From: "Zavras, Alexios" <alexios.zavras@intel.com>
To: Richard Fontana <rfontana@redhat.com>, "Maciej W. Rozycki"
	<macro@orcam.me.uk>
CC: Segher Boessenkool <segher@kernel.crashing.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Christoph Hellwig <hch@infradead.org>, "Thomas
 Huth" <thuth@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Thomas Gleixner <tglx@linutronix.de>,
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>, J Lovejoy
	<opensource@jilayne.com>
Subject: Re: [PATCH v2] powerpc: Replace the obsolete address of the FSF
Thread-Topic: [PATCH v2] powerpc: Replace the obsolete address of the FSF
Thread-Index: AQHb8iWnIlYuMC4FKk2vMUMFgL6wM7Qsa6cAgAAVcACAAAX6gIAAAK6AgAABnICAAOCFAIAAJIaAgAADjQCAAYfdAIAA9ZmAgBKKlnE=
Date: Fri, 25 Jul 2025 08:44:38 +0000
Message-ID: <BL1PR11MB54001A9B7367BD109A9B581D8959A@BL1PR11MB5400.namprd11.prod.outlook.com>
References: <20250711053509.194751-1-thuth@redhat.com>
 <2025071125-talon-clammy-4971@gregkh>
 <9f7242e8-1082-4a5d-bb6e-a80106d1b1f9@redhat.com>
 <2025071152-name-spoon-88e8@gregkh> <aHC-Ke2oLri_m7p6@infradead.org>
 <2025071119-important-convene-ab85@gregkh>
 <CAC1cPGx0Chmz3s+rd5AJAPNCuoyZX-AGC=hfp9JPAG_-H_J6vw@mail.gmail.com>
 <aHGafTZTcdlpw1gN@gate>
 <CAC1cPGzLK8w2e=vz3rgPwWBkqs_2estcbPJgXD-RRx4GjdcB+A@mail.gmail.com>
 <alpine.DEB.2.21.2507122332310.45111@angie.orcam.me.uk>
 <CAC1cPGwa=0zSL_c+HrjQoPryus6w_LCw9Cha7uENKHqCKOQkRQ@mail.gmail.com>
In-Reply-To: <CAC1cPGwa=0zSL_c+HrjQoPryus6w_LCw9Cha7uENKHqCKOQkRQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5400:EE_|MN6PR11MB8218:EE_
x-ms-office365-filtering-correlation-id: 47618906-f43a-4871-0848-08ddcb577d6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?REhLc1p1dVlSTGhSVjBDbUI1d0lQUWF2bmV1N3d1ek5wTjBwRnQ5ZnFDK3Uv?=
 =?utf-8?B?QVI1M2tKOVZjQWhaRkNybXdRRFZEZFBobEI1RVdNN1NPWVV5WXhVNnRrMnB4?=
 =?utf-8?B?WDhJdDVWRVJ2eGc4NFRGenpueVkvVkZ0SHplTzEyMk5Wc0w1d3oyUThrVVJz?=
 =?utf-8?B?RENKWVd4cGh2UDFXTTJyZS9rK1FaMHl4RGVKM280SklOdE9LSVVZdmRtbi95?=
 =?utf-8?B?d01CSmFLa2s4RFpEbFVqc1ZzS2Q0ZlZpMkhtNVh0OFgzUTNVTHhYZWQ4eWVm?=
 =?utf-8?B?L01Cdzc2WklrOUhFdlNNNE5jVGZrTk8yUE1VM3N1T1locW9FS0grSnBJVHVO?=
 =?utf-8?B?YjgyTDBOSHR2MFhYNXl0WmJyYXVZRmN0U2gvalIwOVdtYjlabnBzbnlhNHhX?=
 =?utf-8?B?cytQcTJiUzN2bWlxQzkybnFXdlNHcnlGa2pYWlluWVM3UVNHWTVjVVl3RndR?=
 =?utf-8?B?UVVubnVwZ2tPa05hMFpnemNOcmExL3NPZjZ6UUxnelhCditWMldMU3l1eHZB?=
 =?utf-8?B?Y2NxTVZZS3dIOVdZdlFZRmdMekEvemdZRC9FRkZVYisyUXBUUHpWb2huK25F?=
 =?utf-8?B?N2R1bmtYSVBiMm95WDhCZ1VPU1NtdCtVS1JhR0E0bzVuQzF4UStwOHFlVUNS?=
 =?utf-8?B?RFNaVmE0b3dveDNZODgzcmx1MEt3UzJYYmwyWVRaaXIwZUQzaDF2OHV3Zlls?=
 =?utf-8?B?V2tsVk8xWlVnYmc3ckgxM0h6elBOSGVsQk85NkhXL1NlSEU4bitzeXBHRmp2?=
 =?utf-8?B?dnJBa2FXOXJPWWRFblkwMG5TSm9kMjFpZDBtV1lqZFJ4VzI1eDZpVjRSTnMx?=
 =?utf-8?B?N2VESFdNU2xId3QyZUVVMVR2bW1jN1ZUT2JMQUxEMGxrUDkxZjc4Z2tXUlAw?=
 =?utf-8?B?bnA4R09sQU80eVB1K2dUNXkwSkw2SVU3QkROdDF5S2JoNmEyRnQzZnY4dnlm?=
 =?utf-8?B?NDRQa050ZUNtbVRXbXo5VXRQczFoK1o1eENuQkJXckorV3ZQc2thcWN4Zm9V?=
 =?utf-8?B?SGxmcU5JdFljV2xQd3JhQ21XVWwzRnRQZW94dnlGMUdFNUp5YktFbW9oUWpI?=
 =?utf-8?B?czdNUSt2NWU5VmtCU21nb2NjTWwvYUZyUkx1QVR2dzJjakpEM1JvWUdnTWln?=
 =?utf-8?B?Lzg2WFJUc1JETzRSMWcyUFRkZTJaZkljb3diZVhrWnpMN1pzR1RmOUorQzhv?=
 =?utf-8?B?dkZDZGJxQzlGM1NhK2x2ZzNhOVN6enBJVFNyOUszRVQ5SEp5cmQxSDM4cHlk?=
 =?utf-8?B?Sm5lVzhnY0tsYjN6aVFldlh5OWU4NEJoNjhyUDdqMlRETVZZWlo4bndOY2FS?=
 =?utf-8?B?bHoxaHFXYXV0aUtBZWc2RjJidEwzbEZhbzlpRzYrenhhekJrQks5WGIwME4w?=
 =?utf-8?B?ZXNtZmsxaEQvSThsRDB1bFpiSFlYUUJnM1RwMURXUm54eWdNWWZqUlhvdUUr?=
 =?utf-8?B?dXpoNXdNWG5JZnhKNDliVjdsWUN6Qk1DSVJSL2lZenV2ZHg3eEcvKzIxcCtZ?=
 =?utf-8?B?OWxiNTNUamxsOHdiVElKM2c4bDdidTZyNi81dkNrTHVLN2N1TDdJcklpZnlS?=
 =?utf-8?B?d0N2UXpHTU5ySG5IQVpTemp2cTFXL1RVa2NNdmd3T3RWTWFJWTFoUzYxdWRV?=
 =?utf-8?B?dllielNBQ2F2NzlKTlNicXl5Q0NsTm10dHZzcTV0KzNGNDg3alc1L3ZwcEY4?=
 =?utf-8?B?bjFEN1ZvMmlGTlpycVZ6R2t0b0k1Y2tjUEhQeFU2TmVmdTRTcnQ2Y3R4L0xM?=
 =?utf-8?B?cVZpeFY0bFpYTTViZmFxcTU1YkhtbHh4RUwyVmRXbWlkbzBac1d6bndZcGg2?=
 =?utf-8?B?UDZQSy9yalcxSy84YzZLM0NqdWhVa2RUVUZnZ3hZem5OdHhmQzkzWUNibnBl?=
 =?utf-8?B?WndUYzlCODBhdEljQVhFV0JYdTVWM3NZRm4rdmVHNEprWlFheXVtcVd1aTR3?=
 =?utf-8?Q?C/QcO3qD3JG+0zl/F+hkzKmHB+vTDnpZ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5400.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NG9oUVEyL0tyT1NTdUw0bmtyMUVhb2V6a0QyUVcwdjJUajM1aWg1dHQvU2sv?=
 =?utf-8?B?WkJGbGpLSlJFSUcwNHVhU3VhNm94SEorZ00yanM0WFh4K2tkakdISmg4RS8y?=
 =?utf-8?B?eHlvcEVyb2dBdTc0UVp5LzdmL3ZjNi9SWS9BWEI3TmYwZWd1ckRnRnYxNXF3?=
 =?utf-8?B?TU9mWlNJZXpyalNWS2R5MmxTd1JpTXNBWFlSNVhCdkRDZ0NaR1RRdjFOMVZN?=
 =?utf-8?B?UnA2d0dyRW9CVnRvSFEzYnZvSEsweXNRVC9nbkZhSzMxb3VDemQ2L1Q2VU9w?=
 =?utf-8?B?NXQ4anl3NGdhTnp4eStYS3lrOU1HTFdlblkydDBNVlh5YXNYKy8ycC9NakFm?=
 =?utf-8?B?WUF5bGVHSC9iRlVOTW5xRkY3NENhZnRaRVJPdTFPcVdUMU1MRW9QaXNpOThm?=
 =?utf-8?B?QkdrOXNud0thQjFPK1E4dERVUS9wYlpvSU1ML0ttRERqRHJNNWoxY1J5WXlZ?=
 =?utf-8?B?cGVvRE5lZkh3MEg2N3lIajkxZ2hLVnQrZzY2OHBoM3NDZ3ZSamFjR2k0S29V?=
 =?utf-8?B?VkNCWVdCWk1YdEJnSnRjc3d4S1NpM0xMK1lkRHlXSkJEQTl0VTgwamxpMkdF?=
 =?utf-8?B?MGNheFltN2RRVjVLYitLNDdFWUE2SnNJNlgzWmRnbzVUU0JiOGtRdE05aEVJ?=
 =?utf-8?B?V3VoaGZXVDk3Q2JOREV4WFhCbnFQbFlwRmNLZ1Y0ZEIvaWxGWlBzd2xiQlJD?=
 =?utf-8?B?djhYSy9JMS9ZODIwcEp6SlFxSkFYRXNsY0ZpdTZUME9hS25MK2Z5aU0rNFR3?=
 =?utf-8?B?VHFwOUNIemoxV3pJTVJ6akZSUWJ0ZkIvbXJJSXJ3VUhHYzdCWGJxbkova0g4?=
 =?utf-8?B?d0ZwUGFUMll2Yjl1UVBKdy9DcmZXZVhtbjFiVCs4SU10KzlFaFFCVGxMZ3hG?=
 =?utf-8?B?NUZSQ0RjSkFqVFlyWDFNK0lXbXFPRGQ0THpvcmx5TjJmRnNTTDdiZ3Jic0Mx?=
 =?utf-8?B?UDVOZW1TMVdVSk0wa0V4UVpHT2paSWpVbXMzNmZnNUUrWWNVWklhQldTSlVq?=
 =?utf-8?B?ZnN2aVlPazBCZE5WUEFLZ0ZOY1ZmU3RGOTJic1piMWR4ZzZob2hCSEErUG0z?=
 =?utf-8?B?Q1BlbThDaXNYamgxQStmeWwwSWhFOTNEdGZRWVRiWmFFZGcvK2Jkb21wTENH?=
 =?utf-8?B?d05iaTY5TFl6UXB2NloyODVFWFZUUDduKzNWMDZSLzh3NnF0OG1PbmpOanZ5?=
 =?utf-8?B?TlAvaGR2dXAyQlJtSk9iMGM5OEpCMlNGa2pPUm9YaEVtemtscVNVdE9sOW1n?=
 =?utf-8?B?NlVXZ25UMm9kYXByaDRVSlVWcVd4dy9SS2VadXhlQ1R1MU1NYkdmODVOMGpn?=
 =?utf-8?B?N0RtZEVSQUZSbmtpeEJmbERibWxjSG5NMWlidGJPWXJTeUJzMVhkT0JmVVlz?=
 =?utf-8?B?ZXIvZjRtbWNPT0YwbmMvQ3NhbWFYM2JiZDFydFBrYm0zRUVYKzRIV3RCTXhG?=
 =?utf-8?B?dHJBQUttNmg4bHk2Qm5aVWs2c0l1NkxhenVzdXdlL2ROZDR5b0NuZjF2WHh3?=
 =?utf-8?B?WHowTStRdVVrZTk2blo2d0tMOHljV2Y3dlhvempXb2YyQWNkcGRrNHVULy9T?=
 =?utf-8?B?eW5lS2Uzb08wWFNsZERlOTBqellTSVpyUkd5NGFIeFB2V3hxZWRlUW56WE9Q?=
 =?utf-8?B?WldCZG5TT21NSDZ5QVlSNXMyWXhDeFQ4UlFhbkoycGkwdTdEQjd5MGZISUpp?=
 =?utf-8?B?VzJYa1hwMCtmOWc4ZXcvaU83bm1QVFVUN1NhdUQyQVFJUFNTU3cvRS9sVTEz?=
 =?utf-8?B?cFdvdFFwUlNTcDA2SDFKUTRBcEcwVzFSRmxOelRQN1dFRnF5Ui9Sa2g3UndP?=
 =?utf-8?B?TTJ6NjNDaTZtUkZwbzdZZWJSb29CZVY4eGZQRnk2MWpSa2JralBDVDRDbEFD?=
 =?utf-8?B?cmV6dktkT0FMM1FEYmVSUzBzejJFd0NQYUllL0dSTWV5RlpWQnJsVFV1SDNu?=
 =?utf-8?B?MjJRelJLRUt3cE9HZUpKTDh0WHI4TEZwc1U4dUlRTVN0S1BuSFg5dHRUanBo?=
 =?utf-8?B?aTB0M054Z1pVc3R2UUo1bE5GL005UGdoTTBJZUxUMUk2TzhnbmVyaTE2cEZH?=
 =?utf-8?B?dkJ0bEtUdUVLU2dWSkhudlBTbVg0SEZMQWJidmdzV2xUSzVBNGNMaVVSbThz?=
 =?utf-8?Q?eXWZk/6bGFIouIZWxrlQcXtb4?=
Content-Type: text/plain; charset="utf-8"
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
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5400.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47618906-f43a-4871-0848-08ddcb577d6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 08:44:38.2979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OpGI0TAtN7j7bCgElnLnXPUjar19tfXdAzTpK0uwd8Y5U38I44tn93mPd1LEIh1eHV62pJ/mZNgloPxk9qjf57utrPgempIb/B2EoX7MMgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8218
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

RllJLCBJJ3ZlIHVwZGF0ZWQgdGhlIGRlZmluaXRpb24gb2YgdGhlIFNQRFggIkdOVS1jb21waWxl
ci1leGNlcHRpb24iCnRvIGluY2x1ZGUgYm90aCB2YXJpYW50cyBvZiAiY29tcGlsZWQgd2l0aCBH
Q0MiIGFuZCAiY29tcGlsZWQgd2l0aCBhIEdOVSBjb21waWxlciIuCkl0IHdpbGwgYmUgcHVibGlz
aGVkIGluIHRoZSBuZXh0IHJlbGVhc2Ugb2YgdGhlIFNQRFggTGljZW5zZSBMaXN0LgoKVGhlcmVm
b3JlLCBpdCBzaG91bGQgYmUgdXNlZCB0byBtYXJrIHRoZXNlIGZpbGVzCihJIHRoaW5rIEkgY291
bnRlZCA3IGluc3RhbmNlcyBvZiB0aGlzIHRleHQgaW4ga2VybmVsIGZpbGVzKS4KCi0tIHp2ciAt
LQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOsKgUmlj
aGFyZCBGb250YW5hIDxyZm9udGFuYUByZWRoYXQuY29tPgpTZW50OsKgU3VuZGF5LCBKdWx5IDEz
LCAyMDI1IDE1OjI3ClRvOsKgTWFjaWVqIFcuIFJvenlja2kgPG1hY3JvQG9yY2FtLm1lLnVrPgpD
YzrCoFNlZ2hlciBCb2Vzc2Vua29vbCA8c2VnaGVyQGtlcm5lbC5jcmFzaGluZy5vcmc+OyBHcmVn
IEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPjsgVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+
OyBNYWRoYXZhbiBTcmluaXZhc2FuIDxtYWRkeUBsaW51eC5pYm0uY29tPjsgTWljaGFlbCBFbGxl
cm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PjsgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+OyBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPjsgQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PjsgbGludXhwcGMtZGV2QGxpc3RzLm96
bGFicy5vcmcgPGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnPjsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZyA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IGt2bUB2Z2VyLmtl
cm5lbC5vcmcgPGt2bUB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1zcGR4QHZnZXIua2VybmVsLm9y
ZyA8bGludXgtc3BkeEB2Z2VyLmtlcm5lbC5vcmc+OyBKIExvdmVqb3kgPG9wZW5zb3VyY2VAamls
YXluZS5jb20+ClN1YmplY3Q6wqBSZTogW1BBVENIIHYyXSBwb3dlcnBjOiBSZXBsYWNlIHRoZSBv
YnNvbGV0ZSBhZGRyZXNzIG9mIHRoZSBGU0YKCgpPbiBTYXQsIEp1bCAxMiwgMjAyNSBhdCA2OjQ4
4oCvUE0gTWFjaWVqIFcuIFJvenlja2kgPG1hY3JvQG9yY2FtLm1lLnVrPiB3cm90ZToKCj4KCj4g
T24gRnJpLCAxMSBKdWwgMjAyNSwgUmljaGFyZCBGb250YW5hIHdyb3RlOgoKPgoKPiA+ID4gPiB3
aGlsZSB0aGlzIG9uZToKCj4gPiA+ID4KCj4gPiA+ID7CoCAqwqDCoMKgIEFzIGEgc3BlY2lhbCBl
eGNlcHRpb24sIGlmIHlvdSBsaW5rIHRoaXMgbGlicmFyeSB3aXRoIGZpbGVzCgo+ID4gPiA+wqAg
KsKgwqDCoCBjb21waWxlZCB3aXRoIEdDQyB0byBwcm9kdWNlIGFuIGV4ZWN1dGFibGUsIHRoaXMg
ZG9lcyBub3QgY2F1c2UKCj4gPiA+ID7CoCAqwqDCoMKgIHRoZSByZXN1bHRpbmcgZXhlY3V0YWJs
ZSB0byBiZSBjb3ZlcmVkIGJ5IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZS4KCj4gPiA+
ID7CoCAqwqDCoMKgIFRoaXMgZXhjZXB0aW9uIGRvZXMgbm90IGhvd2V2ZXIgaW52YWxpZGF0ZSBh
bnkgb3RoZXIgcmVhc29ucyB3aHkKCj4gPiA+ID7CoCAqwqDCoMKgIHRoZSBleGVjdXRhYmxlIGZp
bGUgbWlnaHQgYmUgY292ZXJlZCBieSB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuCgo+
ID4gPiA+Cgo+ID4gPiA+IGRvZXMgbm90IHNlZW0gdG8gYmUgaW4gdGhlIFNQRFggZXhjZXB0aW9u
IGxpc3QuIEl0IGlzIHZlcnkgc2ltaWxhciB0bwoKPiA+ID4gPiBgR05VLWNvbXBpbGVyLWV4Y2Vw
dGlvbmAgZXhjZXB0IGl0IHNwZWNpZmljYWxseSBtZW50aW9ucyBHQ0MgaW5zdGVhZAoKPiA+ID4g
PiBvZiBzYXlpbmcgImEgR05VIGNvbXBpbGVyIi4KCj4gPiA+Cgo+ID4gPiBodHRwczovL3NwZHgu
b3JnL2xpY2Vuc2VzL0dOVS1jb21waWxlci1leGNlcHRpb24uaHRtbAoKPiA+ID4KCj4gPiA+IGlz
IGV4YWN0bHkgdGhpcy4KCj4gPgoKPiA+IE5vLCBiZWNhdXNlIGBHTlUtY29tcGlsZXItZXhjZXB0
aW9uYCBhcyBkZWZpbmVkIGhlcmUKCj4gPiBodHRwczovL2dpdGh1Yi5jb20vc3BkeC9saWNlbnNl
LWxpc3QtWE1ML2Jsb2IvbWFpbi9zcmMvZXhjZXB0aW9ucy9HTlUtY29tcGlsZXItZXhjZXB0aW9u
LnhtbAoKPiA+IGFzc3VtZXMgdXNlIG9mIHRoZSB0ZXJtICJHQ0MiIHJhdGhlciB0aGFuICJhIEdO
VSBjb21waWxlciIuCgo+Cgo+wqAgSSBkb24ndCBrbm93IHdoYXQgdGhlIGxlZ2FsIHN0YXR1cyBv
ZiB0aGUgc3RhdGVtZW50IHJlZmVycmVkIGlzLCBob3dldmVyCgo+IHRoZSBvcmlnaW5hbCBleGNl
cHRpb24gYXMgcHVibGlzaGVkWzFdIGJ5IEZTRiBzYXlzOgoKPgoKPiAnIkdDQyIgbWVhbnMgYSB2
ZXJzaW9uIG9mIHRoZSBHTlUgQ29tcGlsZXIgQ29sbGVjdGlvbiwgd2l0aCBvciB3aXRob3V0Cgo+
IG1vZGlmaWNhdGlvbnMsIGdvdmVybmVkIGJ5IHZlcnNpb24gMyAob3IgYSBzcGVjaWZpZWQgbGF0
ZXIgdmVyc2lvbikgb2YgdGhlCgo+IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIChHUEwpIHdp
dGggdGhlIG9wdGlvbiBvZiB1c2luZyBhbnkgc3Vic2VxdWVudAoKPiB2ZXJzaW9ucyBwdWJsaXNo
ZWQgYnkgdGhlIEZTRi4nCgoKCj4gd2hpY2ggSSB0aGluayBtYWtlcyBpdCBjbGVhciB0aGF0ICJH
Q0MiIGlzIGEgY29sbGVjdGlvbiBvZiAiR05VIGNvbXBpbGVycyIKCj4gYW5kIHRoZXJlZm9yZSB0
aGUgdHdvIHRlcm1zIGFyZSBzeW5vbnltb3VzIHRvIGVhY2ggb3RoZXIgZm9yIHRoZSBwdXJwb3Nl
Cgo+IG9mIHNhaWQgZXhjZXB0aW9uIChpbiB0aGUgb2xkIGRheXMgIkdDQyIgc3Rvb2QgZm9yICJH
TlUgQyBDb21waWxlciIsIGJ1dAoKPiB0aGUgb2xkIG1lYW5pbmcgbWFrZXMgbm8gc2Vuc2UgYW55
bW9yZSBub3cgdGhhdCB3ZSBoYXZlIGNvbXBpbGVycyBmb3IgQWRhLAoKPiBGb3J0cmFuIGFuZCBt
YW55IG90aGVyIGxhbmd1YWdlcyBpbmNsdWRlZCBpbiBHQ0MpLgoKPgoKPsKgIE5CIHVwIHRvIGRh
dGUgdmVyc2lvbnMgb2YgQ1JUIGNvZGUgcmVmZXIgdG8gdGhlIGV4Y2VwdGlvbiBhcyBwdWJsaXNo
ZWQKCj4gcmF0aGVyIHRoYW4gcGFzdGluZyBhbiBvbGQgdmVyc2lvbiBvZiBpdHMgdGV4dDoKCj4K
Cj4gJ1VuZGVyIFNlY3Rpb24gNyBvZiBHUEwgdmVyc2lvbiAzLCB5b3UgYXJlIGdyYW50ZWQgYWRk
aXRpb25hbAoKPiBwZXJtaXNzaW9ucyBkZXNjcmliZWQgaW4gdGhlIEdDQyBSdW50aW1lIExpYnJh
cnkgRXhjZXB0aW9uLCB2ZXJzaW9uCgo+IDMuMSwgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24uJwoKPgoKPiBSZWZlcmVuY2VzOgoKPgoKPiBbMV0gIkdDQyBSdW50
aW1lIExpYnJhcnkgRXhjZXB0aW9uIiwgdmVyc2lvbiAzLjEsCgo+wqDCoMKgwqAgPGh0dHBzOi8v
d3d3LmdudS5vcmcvbGljZW5zZXMvZ2NjLWV4Y2VwdGlvbi0zLjEuaHRtbD4KCgoKSSB0aGluayB3
ZSdyZSBiYXNpY2FsbHkgdGFsa2luZyBwYXN0IGVhY2ggb3RoZXIuIFRoZSBkZWZpbml0aW9uIG9m
CgoiR0NDIiBpbiB0aGUgR0NDIHJ1bnRpbWUgbGlicmFyeSBleGNlcHRpb24gMy4xIGlzIGlycmVs
ZXZhbnQgYmVjYXVzZQoKdGhhdCBmaWxlIGRvZXMgbm90IHJlZmVyIHRvIHRoYXQgZXhjZXB0aW9u
LiBJbiBTUERYLCBsaWNlbnNlIChhbmQKCmV4Y2VwdGlvbikgaWRlbnRpZmllcnMgYXJlIHByZWNp
c2VseSBkZWZpbmVkLiBVbmxlc3MgSSdtIG1pc3NpbmcKCnNvbWV0aGluZyB0aGVyZSBpcyBubyBv
ZmZpY2lhbCBTUERYIGlkZW50aWZpZXIgdGhhdCBjb3JyZXNwb25kcyB0bwoKdGhpcyB0ZXh0OgoK
CgrCoCBBcyBhIHNwZWNpYWwgZXhjZXB0aW9uLCBpZiB5b3UgbGluayB0aGlzIGxpYnJhcnkgd2l0
aCBmaWxlcwoKwqAgY29tcGlsZWQgd2l0aCBHQ0MgdG8gcHJvZHVjZSBhbiBleGVjdXRhYmxlLCB0
aGlzIGRvZXMgbm90IGNhdXNlCgrCoCB0aGUgcmVzdWx0aW5nIGV4ZWN1dGFibGUgdG8gYmUgY292
ZXJlZCBieSB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuCgrCoCBUaGlzIGV4Y2VwdGlv
biBkb2VzIG5vdCBob3dldmVyIGludmFsaWRhdGUgYW55IG90aGVyIHJlYXNvbnMgd2h5CgrCoCB0
aGUgZXhlY3V0YWJsZSBmaWxlIG1pZ2h0IGJlIGNvdmVyZWQgYnkgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlLgoKCgpJJ20gbm90IHBlcnNvbmFsbHkgYSBtYWpvciBzdXBwb3J0ZXIgb2Yg
U1BEWCBhbmQgSSdtIHRoZSBsYXN0IHBlcnNvbgoKd2hvIHdvdWxkIHdhbnQgdG8gYmUgYXNzb2Np
YXRlZCB3aXRoIFNQRFggcGVkYW50aWNpc20gYnV0IGl0J3MgYQoKc3RhbmRhcmQgYW5kIGlmIHRo
ZSBMaW51eCBrZXJuZWwgcHJvamVjdCBpcyBnb2luZyB0byB1c2UgaXQgSU1PIGl0CgpzaG91bGQg
Y29uZm9ybSB0byB0aGF0IHN0YW5kYXJkLCBvdGhlcndpc2UgeW91J3JlIGJhc2ljYWxseSBtYWtp
bmcgYWQKCmhvYyBkZWZpbml0aW9ucyBvZiBwc2V1ZG8tU1BEWCBleHByZXNzaW9ucyBvciByZWRl
ZmluaXRpb25zIG9mCgphbHJlYWR5LWRlZmluZWQgU1BEWCBpZGVudGlmaWVycywgd2hpY2ggc2Vl
bXMgdG8gZGVmZWF0IHRoZSBwdXJwb3NlIG9mCgp1c2luZyBTUERYIGV4cHJlc3Npb25zIGF0IGFs
bC4gVW5kZXIgdGhhdCBzdGFuZGFyZCwgdGhlcmUgaXMgY3VycmVudGx5CgpubyBTUERYIGlkZW50
aWZpZXIgcmVwcmVzZW50aW5nIHRoZSBhYm92ZSB0ZXh0IChhcyBmYXIgYXMgSSBjYW4gdGVsbCku
CgpUaGUgc29sdXRpb24gaXMgZWl0aGVyIHRvIHByb3Bvc2UgYSBtb2RpZmljYXRpb24gb2YKCmBH
TlUtY29tcGlsZXItZXhjZXB0aW9uYCBzbyB0aGF0ICJHQ0MiIGlzIGFjY2VwdGVkIGFzIGFuIGFs
dGVybmF0aXZlCgp0byAiYSBHTlUgY29tcGlsZXIiLCBvciB0byBwcm9wb3NlIGEgbmV3IGV4Y2Vw
dGlvbiB0byBiZSBhZGRlZCB0bwoKU1BEWCdzIGV4Y2VwdGlvbiBsaXN0LCBvciB0byB1c2UgYSBj
dXN0b20tZGVmaW5lZCBgQWRkaXRpb25SZWYtYAoKaWRlbnRpZmllci4KCgoKUmljaGFyZAoKCgoK
CkludGVsIERldXRzY2hsYW5kIEdtYkgNClJlZ2lzdGVyZWQgQWRkcmVzczogQW0gQ2FtcGVvbiAx
MCwgODU1NzkgTmV1YmliZXJnLCBHZXJtYW55DQpUZWw6ICs0OSA4OSA5OSA4ODUzLTAsIHd3dy5p
bnRlbC5kZQ0KTWFuYWdpbmcgRGlyZWN0b3JzOiBTZWFuIEZlbm5lbGx5LCBKZWZmcmV5IFNjaG5l
aWRlcm1hbiwgVGlmZmFueSBEb29uIFNpbHZhDQpDaGFpcnBlcnNvbiBvZiB0aGUgU3VwZXJ2aXNv
cnkgQm9hcmQ6IE5pY29sZSBMYXUNClJlZ2lzdGVyZWQgT2ZmaWNlOiBNdW5pY2gNCkNvbW1lcmNp
YWwgUmVnaXN0ZXI6IEFtdHNnZXJpY2h0IE11ZW5jaGVuIEhSQiAxODY5MjgK


