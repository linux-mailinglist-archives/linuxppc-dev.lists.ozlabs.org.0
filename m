Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA6C758BED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 05:17:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eexGN/rS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5LbB11PSz3cX4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 13:17:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eexGN/rS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=kevin.tian@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 19 Jul 2023 13:16:19 AEST
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5LZC0SXqz30f5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 13:16:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689736579; x=1721272579;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Mr7BUY4zc60aRuTSv2hIyuXH2IuyI/J0WPMw4qM1y6s=;
  b=eexGN/rSpJiRrThTzXUXJ6WTxtMa/T2idANY/Dxe1uetZ0KzAGmEcIn7
   4Fft0EQBD81dJaNqD1bF4IiNdENsQIblbm6mV8K2RG5zbn0McLXOr3A1z
   moYu93Nt01KCM7TewLFfU1S+Hfmz+zB0StEchJnMCf/pcK7iajlxJdKKO
   JCnfKFObGzmk/wde6KLWEUrusTpLA5EM/+A5WcWFWYXTIgeFyVEE0VURB
   EpC4phayDNF8nXg4YTzvJ1ojSeQ8xGutzJ4qaYMUdRRkTP79Lwn5novP0
   zvqMtKTLm9Ts3o5nz/jz1k8SMmA89Iuy+2+SYz3ySTAmr90F6zrcEStjr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345950647"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="345950647"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 20:15:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="723846508"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="723846508"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP; 18 Jul 2023 20:15:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 20:15:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 20:15:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 20:15:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 20:15:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6luLG3Jd2GAnoMbMV6EycJacbxGYvcQOpmm6Xx7oalRKOsTSmvfFPcsNBRwx9eYlSUdb9pUDEZ/ZGbxz70mSyHRWKkmHCKEIsfdoLF0RAPadHLcePEfQ9v4tNzgPkFibqlYja/McohcaoSWGgag1fr4xEFXuN605cGGCMdjPRO19OZGZ2Qh4OL5S8wzA58q6rkOCtxuwtvpm/Q7WO4CspHcG4lCnHZoM2toHjQAgoQ+VuXzR1PXC1Xs6v5St7r1+07NJDpRw2FvcNuyWsCKGryXlZSxpWyJKz/aZwx8Uo53SgLHtw0sTCFkotg6O5DS0Jic9VbvvlA5hmkpiCSbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mr7BUY4zc60aRuTSv2hIyuXH2IuyI/J0WPMw4qM1y6s=;
 b=Adbm6U6/UuKnPrN/d8iO26fJNwEkzr+I6OgpyVWe63yUWtZj8UlWOcXv5+iF1XqiEoJl9OYt0tfsIiyJ4rKRF4NbUtVvUyUbPH8jm95Ct/kIuk+Zh8INckgyvdmeDlnwmE7cXIy4/VqpyfrwMsg1LaLQjiZVHUwmD7ID33LPfS1wDImt3leMuiv1zzpMHUEBQU+7/JOmslbzS6OHEva5mUKwtu5hONqza8i+wTZTvDIzyHCiZLfHUmqe1syhHdm4WYrZNuhsn5btGtwtPFA7hwzPPPvr9R1yAM3vYTyFK5qenRxavzMDoYIOs1mF8F2COoptdZfHhnGreX42p1DYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA1PR11MB6685.namprd11.prod.outlook.com (2603:10b6:806:258::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 03:14:58 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::137b:ec82:a88c:8159]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::137b:ec82:a88c:8159%4]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 03:14:57 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, Alistair Popple
	<apopple@nvidia.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: RE: [PATCH 0/4] Invalidate secondary IOMMU TLB on permission upgrade
Thread-Topic: [PATCH 0/4] Invalidate secondary IOMMU TLB on permission upgrade
Thread-Index: AQHZuU1142PTIIcImUGZyGRSe0EPwK/AaNCAgAABeMA=
Date: Wed, 19 Jul 2023 03:14:57 +0000
Message-ID: <BN9PR11MB52765F6D915656C6AFD138FF8C39A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
 <45fadf89-27ec-07a9-746a-e5d14aba62a3@arm.com>
In-Reply-To: <45fadf89-27ec-07a9-746a-e5d14aba62a3@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA1PR11MB6685:EE_
x-ms-office365-filtering-correlation-id: 867b6b25-bdfe-45e2-e2d6-08db880654ae
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T0YSp+F+3Eu2PvCBmr9TmfVIcYqOZhMSgfbCHGA2inEdLFW/xD0NsmuJk0iJxbBthQi3WVrs6uU5zgKQpqvOeH8PY0Wk+tZ6W78bqNsshgiJhh1AE6nAjPrj5PRhYghLh90EBova4dQwIStBRoZfHXtaWz5JyDfWdNy7DeIO9CT6Qev42gCfvHi+fbOqWuZOzpS1ZCrN1/HxO4gx7Cj6p0nli9fhmnxTUuHvaWbpTAzUKm1b47eUFzMD1iOvKvHX0oEGeVgXiEj+DjiwjlYFDdEcMl793PaQSTo4KSoZwJ8iJ0uE2xlx9UEY64rq6yIY3sCPEsh4l2woFBSn55tKwdmesoT22/XTgHi0qzAYCDeqj/taHJA0xnZ2SCr01L2zmjLFOcGv4y/vOIZ+ARA9CGQYz4gZP8elDlVUp46Z/X9OZZcBmg5pd1DR3UOCT0tpM49R1fX5pQ+TPK4UqcZLTWQMJWDeP1bA1wtHRHGi0In1vL2tGYu3KS6jezqYQvNURgto3I7dBd0Vz8vkUN/2SfQ/c9407r1YI4HFy55MYd+WuCUKeVb/w1nIO2XmifIk2cUfF7Z/xShR9VrgsXKvEBhGx6nFgVe17CiRkXGsPlZrz+pi+2PE4+MuOWLDKJWS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199021)(86362001)(2906002)(8936002)(33656002)(8676002)(4326008)(83380400001)(38070700005)(316002)(41300700001)(7416002)(52536014)(5660300002)(122000001)(38100700002)(66946007)(54906003)(76116006)(64756008)(110136005)(66556008)(66476007)(66446008)(186003)(6506007)(26005)(9686003)(53546011)(82960400001)(478600001)(55016003)(71200400001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nzh2YmwyeDJsd0hNMWFCWDJGMmNWZm82c3JUMThITmJ2b0szZHBOWUhObEFE?=
 =?utf-8?B?b2ovb09xakQzcnI5b1BoYksyU0gxYWE5QkpTUnZ6SmhiTFB2b012dHNQeE1W?=
 =?utf-8?B?M3hTWGFqMVpvWE1YZ1RIS3I2SzFjUjZMWmpBSnYrQW1rZmJEY0RIaTNwK010?=
 =?utf-8?B?dmlDajV3NVRBK0FaUVU4Tlhqc1F3WFR5TDJYdnZMeTJTenZyTHh0OUs2TEUz?=
 =?utf-8?B?b0JxTm9OKytVdFF4N0gyMks1WmZ1R0pmZUhlL2dNd3NpWkFJMWxWUUt6V1B4?=
 =?utf-8?B?NHJUZ3VMTmxiMUIxalFLM3pyZU5LMnJRcFlpRVdSeDdqREdzME93YzNla1px?=
 =?utf-8?B?aGZIZGduZm1wMmc2dGVjSDhrSXp6VGM5K1lwaGFrKzQwb2JWbW11OUJIOGs0?=
 =?utf-8?B?dkoxbWlvdmkwSXo1WVRzY2RUZXkrbjMva3ZWRWltZ2wzVlVIak84Ulo4QlNw?=
 =?utf-8?B?RzNuclJ2enNBR1k5Z1RCVko2UmpyV3dkYXNmZWtLWVU3cUpibzhRdmh5T2kz?=
 =?utf-8?B?T0tyVGZBUWZnTjJBUkxaNmVOYXNYcFFTRVowOUNRNDNUbDF5VnBzR29EVndR?=
 =?utf-8?B?UjNHNW5BTWExWUcvanFYUEUvVHMvVkNFR283V0Izdmd0RG12ejBvbnNjSjN6?=
 =?utf-8?B?Z1dBOWZyL3dmVGZKM3lIMmxSN01BVVdaWGVuSmZ2ZVlaQ2x1RFN4YkpXYzZG?=
 =?utf-8?B?UHFxNzlZT21JejBBUEFMNUl6YlI3M0FBVEM1RGkvVlVXeHNCdThLdm5yMTd3?=
 =?utf-8?B?R0dQVU5uZHdZM2k4MFBwaTBQa2wwbFAySzhuQkdScEgzNzQrSFhsZm1pdWR5?=
 =?utf-8?B?ZUFUT1F6cTkvWU41bVJzUnY0enRvMlA2eGxZLzBkV1Bkb01ZYmVmQWVrRGEr?=
 =?utf-8?B?QkE1TEk2N2swNVJJbDhleE5ZMVlNS09xRDBreEJ4QWtqU0VWK1U5d0cwSnpp?=
 =?utf-8?B?SjV3SUVBWE9naitpdXluTnpOaDMyM0Y2K2RBTlAwaXZ1ZUMvL3gxdnVZbDFU?=
 =?utf-8?B?bjkxRC9BWnlkVGpCTXVSNzF4Nzh6ZEhmSFA5ZVpnOG94dDFGU2s0VkJiQjFD?=
 =?utf-8?B?eWlRallEMzR5Y05GanlVUkg1UE83b0o0QXd2Q1dIOE0zcVA5ZTBwaUNwYVV1?=
 =?utf-8?B?NG1xNktIYjFYVlNrOGNRME1MNWoyK3NrcnRYeElZbHJyU1ZhYm56TmQwdnp0?=
 =?utf-8?B?dmpySEtueEZIUkd6cXA3QzcvSkhuUVVXbzZ3MlhFYXh3L1Ryc25ha3U3NWph?=
 =?utf-8?B?S0g2eDNyOU1Ka1Awd3hkd0xTNUFiVFZHNHU3ZXFiN3N4clk5SWhSZURqcHRH?=
 =?utf-8?B?RGxkTGlUaUNTYmJoUWlkUXN6N2NaeTMzWWFYMndDczZNeWJIWjY1Ty9pOURC?=
 =?utf-8?B?TW4vZDdOUWpIM24vbmtwNG1nV3BVM25vUDVDanJrTWF4SnF1dDVqWkJCcUdH?=
 =?utf-8?B?RjBjMUZKL0NJWEpQMkplUURKRkdWR1lXMGM2RHBiTWczWlZSREFHUXRMVGda?=
 =?utf-8?B?NUY1VUxWRXhudFZHajRmOUxXZHRtQTBQRGIxcXp6ZGdSNDFPalVVdEZWYTE4?=
 =?utf-8?B?M09oeDNpUXFJcytnTndQcUwvN0FSRkRoVFVJK1M4TFZxR2ZBWGEwbVM5bDQv?=
 =?utf-8?B?S3JNeUJnUyt3R0JtQjI0VGUvUjVBM3B1aXlSZGs4dmF4SmF0UUpTTE1uVng5?=
 =?utf-8?B?OThBci93RktoelZJR2gwQWZIdXhUUFJDbEgwYzV4dFhpZGU2YzN5eDdHd2xI?=
 =?utf-8?B?L0VFeFJta0N1TzcxSVpMWFBsdlFmeGYrU2pCUENuV0U2OEFVS3hobml5K3Zp?=
 =?utf-8?B?d3A3ZE9Mc3gwQVkxN0lqbkpma21Jb3Eyb0RacEVwR2J6N1JYQU1oWXFSS0hV?=
 =?utf-8?B?cjkyZVB0OFIzK1RBM2ZGMjFjTTNjT29xTk1QSkJXMkN0SVA4V2pBWkFpSXRG?=
 =?utf-8?B?RmNnbGZzeWJqQ1hTNW4wRXVEWEkyRTk2dXZnRmkrZGNqcENoL2t1WVBueDMy?=
 =?utf-8?B?VHpWQ1Z0anRwYk9OaTNPV3BuSVREajcwMVlMNGFJWVFNWmhlSjVEZ1JqRENR?=
 =?utf-8?B?QXA3Wm9tcVRrTGFER1lXd1dBdXF2Z1BmbWJ2R3FrV1dXTVp6MHhhNVhzTmZm?=
 =?utf-8?Q?p5CQk+fst6viX231ttHOSm3Gh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867b6b25-bdfe-45e2-e2d6-08db880654ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 03:14:57.4974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dV3VqsZRc9ymbOSUR3lLrH/GnR1I6paXOGPxy8AGLUcL0sEehZuArFguH/KjGDHr42T0oxlMqB7OJP7d8cqDAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6685
X-OriginatorOrg: intel.com
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
Cc: "x86@kernel.org" <x86@kernel.org>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "Christopherson,, Sean" <seanjc@google.com>, "will@kernel.org" <will@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "zhi.wang.linux@gmail.com" <zhi.wang.linux@gmail.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "fbarrat@linux.ibm.com" <fbarrat@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBBbnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4NCj4g
U2VudDogV2VkbmVzZGF5LCBKdWx5IDE5LCAyMDIzIDExOjA0IEFNDQo+IA0KPiBPbiA3LzE4LzIz
IDEzOjI2LCBBbGlzdGFpciBQb3BwbGUgd3JvdGU6DQo+ID4gVGhlIG1haW4gY2hhbmdlIGlzIHRv
IG1vdmUgc2Vjb25kYXJ5IFRMQiBpbnZhbGlkYXRpb24gbW11IG5vdGlmaWVyDQo+ID4gY2FsbGJh
Y2tzIGludG8gdGhlIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBUTEIgZmx1c2hpbmcgZnVuY3Rpb25z
LiBUaGlzDQo+ID4gbWFrZXMgc2Vjb25kYXJ5IFRMQiBpbnZhbGlkYXRpb24gbW9zdGx5IG1hdGNo
IENQVSBpbnZhbGlkYXRpb24gd2hpbGUNCj4gPiBzdGlsbCBhbGxvd2luZyBlZmZpY2llbnQgcmFu
Z2UgYmFzZWQgaW52YWxpZGF0aW9ucyBiYXNlZCBvbiB0aGUNCj4gPiBleGlzdGluZyBUTEIgYmF0
Y2hpbmcgY29kZS4NCj4gPg0KPiA+ID09PT09PT09PT0NCj4gPiBCYWNrZ3JvdW5kDQo+ID4gPT09
PT09PT09PQ0KPiA+DQo+ID4gVGhlIGFybTY0IGFyY2hpdGVjdHVyZSBzcGVjaWZpZXMgVExCIHBl
cm1pc3Npb24gYml0cyBtYXkgYmUgY2FjaGVkIGFuZA0KPiA+IHRoZXJlZm9yZSB0aGUgVExCIG11
c3QgYmUgaW52YWxpZGF0ZWQgZHVyaW5nIHBlcm1pc3Npb24gdXBncmFkZXMuIEZvcg0KPiA+IHRo
ZSBDUFUgdGhpcyBjdXJyZW50bHkgb2NjdXJzIGluIHRoZSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMN
Cj4gPiBwdGVwX3NldF9hY2Nlc3NfZmxhZ3MoKSByb3V0aW5lLg0KPiA+DQo+ID4gU2Vjb25kYXJ5
IFRMQnMgc3VjaCBhcyBpbXBsZW1lbnRlZCBieSB0aGUgU01NVSBJT01NVSBtYXRjaCB0aGUgQ1BV
DQo+ID4gYXJjaGl0ZWN0dXJlIHNwZWNpZmljYXRpb24gYW5kIG1heSBhbHNvIGNhY2hlIHBlcm1p
c3Npb24gYml0cyBhbmQNCj4gPiByZXF1aXJlIHRoZSBzYW1lIFRMQiBpbnZhbGlkYXRpb25zLiBU
aGlzIG1heSBiZSBhY2hpZXZlZCBpbiBvbmUgb2YgdHdvDQo+ID4gd2F5cy4NCj4gPg0KPiA+IFNv
bWUgU01NVSBpbXBsZW1lbnRhdGlvbnMgaW1wbGVtZW50IGJyb2FkY2FzdCBUTEIgbWFpbnRlbmFu
Y2UNCj4gPiAoQlRNKS4gVGhpcyBzbm9vcHMgQ1BVIFRMQiBpbnZhbGlkYXRlcyBhbmQgd2lsbCBp
bnZhbGlkYXRlIGFueQ0KPiA+IHNlY29uZGFyeSBUTEIgYXQgdGhlIHNhbWUgdGltZSBhcyB0aGUg
Q1BVLiBIb3dldmVyIGltcGxlbWVudGF0aW9ucyBhcmUNCj4gPiBub3QgcmVxdWlyZWQgdG8gaW1w
bGVtZW50IEJUTS4NCj4gDQo+IFNvLCB0aGUgaW1wbGVtZW50YXRpb25zIHdpdGggQlRNIGRvIG5v
dCBldmVuIG5lZWQgYSBNTVUgbm90aWZpZXIgY2FsbGJhY2sNCj4gZm9yIHNlY29uZGFyeSBUTEIg
aW52YWxpZGF0aW9uIHB1cnBvc2UgPyBQZXJoYXBzIG1tdV9ub3RpZmllcl9yZWdpc3RlcigpDQo+
IGNvdWxkIGFsc28gYmUgc2tpcHBlZCBmb3Igc3VjaCBjYXNlcyBpLmUgd2l0aCBBUk1fU01NVV9G
RUFUX0JUTQ0KPiBlbmFibGVkID8NCj4gDQoNCk91dCBvZiBjdXJpb3NpdHkuIEhvdyBkb2VzIEJU
TSB3b3JrIHdpdGggZGV2aWNlIHRsYj8gQ2FuIFNNTVUgdHJhbnNsYXRlDQphIFRMQiBicm9hZGNh
c3QgcmVxdWVzdCAoYmFzZWQgb24gQVNJRCkgaW50byBhIHNldCBvZiBQQ0kgQVRTIGludmFsaWRh
dGlvbg0KcmVxdWVzdHMgKGJhc2VkIG9uIFBDSSByZXF1ZXN0b3IgSUQgYW5kIFBBU0lEKSBpbiBo
YXJkd2FyZT8NCg0KSWYgc29mdHdhcmUgaW50ZXJ2ZW50aW9uIGlzIHJlcXVpcmVkIHRoZW4gaXQg
bWlnaHQgYmUgdGhlIHJlYXNvbiB3aHkgbW11DQpub3RpZmllciBjYW5ub3QgYmUgc2tpcHBlZC4g
V2l0aCBCVE0gZW5hYmxlZCBpdCBqdXN0IG1lYW5zIHRoZSBub3RpZmllcg0KY2FsbGJhY2sgY2Fu
IHNraXAgaW90bGIgaW52YWxpZGF0aW9uLi4uDQo=
