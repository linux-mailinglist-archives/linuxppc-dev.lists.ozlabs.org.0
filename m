Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A435362AEA6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 23:52:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBhJQ3ylpz3cKn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 09:52:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fToguRGK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fToguRGK;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBhHS42kPz2xl2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 09:51:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668552676; x=1700088676;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Id9CJ010hZQrzCKCZzN+7N28EWpNpbcUrm8PpIkmY9A=;
  b=fToguRGKs4i1ks2a3OFUe4Iac4yP7RQAB5J2S+2vjdg0LUiU4VsoeKqw
   dCEUpDXEnw9QzNsmfSmK6pQ283b1CzRwt8tsQZC4AimN1CTqtkryNEZNj
   1wgcO2RMdKt8JqsnXINuyXWrVUogiEGlASzcn0h+s+JPnks1cFmmrBBsg
   lboktnbS8wm63NiiT0HCl+JMP9wn1cB07cjaP8W7CRcDxXAafFe2PaQI7
   4RS1aXD+O1I/9twjF3+LlnrgEMakBI0R2FVECDi4EhASDjtYVrEJojey4
   qGB0XjSGRgfwBVhavq8ej/vnkB4uokccihIHKcxrPU4qdzPK8RoosLCW/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="292779954"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="292779954"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 14:51:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="813850750"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="813850750"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2022 14:51:06 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 14:51:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 14:51:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 14:51:05 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 14:51:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FL5NykcSipw4m358QNbwNp/bW1DIVcqZQ7F7r7n/Er/J1ZgXlLAX/00pocpm0d6LWN1LOV8OZca2xnKM8Dzd/XMOb4pGObLhd0UhvigBbdW0olWUjXRHeFki7mNh2jbhv3X1bIXa/E43oGpCr/T+L1CxrT+NgoXkTx6TASZibajFilW4b+yHzV9k1zXxoZdTg5QmXGw2FV+4a4nb60+4YVaNCpC0aYNPQKBd3YSe13ooWMcRD+bdo4N62/52RlVQdMxuNljafUYAmq7JYxBkoxhtYTct61To9QupKNPm8J2I7ooPdreEJC+vi0UbR1/N/dOS0WsBCFR0z0y6V2WudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Id9CJ010hZQrzCKCZzN+7N28EWpNpbcUrm8PpIkmY9A=;
 b=cGoN0xGleq0DgpBB5dJkJx5qSLXQolLFSTrITDVTmsHk431Ulpefh3c+XBXN2ac6gs+Ip86f/Zt79BIQfff74N5Po+o01WeyBkdV0ui9lYTVSkRKaJdDP1LZFMPQFacSJm7iMpyvQQh0Sqc3G8L8NJn1MQ0iie7DjMbka2XYGsLvpW8gSX2Djm1w+8CvZw4FQ7PTyLfsz7OMQVMuzlff2IZlQO+VeKgpW/w0h6gYndUY/Yg6U2SPQ0gZzQjB1bhxFsh4G45IuPP8Nfz19Vp9anmJBl2bH2mPWCeDdy7GwLhWT37HDhhjz2j06NPqCK28AGM++2ieoGKYBRs8NDKdoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by DS0PR11MB6446.namprd11.prod.outlook.com (2603:10b6:8:c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 22:50:58 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e%9]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 22:50:58 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "Christopherson,, Sean" <seanjc@google.com>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>, "vkuznets@redhat.com"
	<vkuznets@redhat.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"maz@kernel.org" <maz@kernel.org>, "anup@brainfault.org"
	<anup@brainfault.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"frankja@linux.ibm.com" <frankja@linux.ibm.com>
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
Thread-Topic: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
Thread-Index: AQHY7xJYAEcAAtH3n0umIziHts2F+q5Aq0uA
Date: Tue, 15 Nov 2022 22:50:58 +0000
Message-ID: <95c3cce88560024566f3b4b0061ca7e62a8a4286.camel@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-34-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-34-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|DS0PR11MB6446:EE_
x-ms-office365-filtering-correlation-id: 569664df-15f1-44d4-6425-08dac75bdca9
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w2uPuqnrEZ1KxxWf3DEp8bM1pV0JEIB322+43kqrP8rRNZXG2sZulHVEFy4AdfsAzpUkgbfdS/895VeTEohv7IPH5rjfsFkgBR58uU8Rk0j4g0upyq0Wwf4xtil1Rj4iPzmOxDmgSkhSd4ZuosTB0U5HILXpDbMQKUmymt6aDGEsiDnk0tIEFzGWSKB+XQguw8NMdQDmNySJOItQwF+7lk7ZZ4G3J98NGKxnP0zsbQQRKsC2bBRCTaHS1t9LAIPMbtRMgW4wtR7HQZFxy8nqAU5O28w+Kszv/DwFO1FEasSr4wrgHDp2mU6qbBgXggoa1yBgzzal6yXvCSPUi+6nYYONNYIwCW9P4gR8RBEstCU4CBUV394zZqO8cW5H9LhAIEt89F+zvWWbuMgE4bev8BMyOL8bjCb4dGPNxz1SthjmHbYV6ZzCLD9y7pIMgJiysb4tfrZCutfUMGr8Ssyy2MaqlaBOzphZgzwxyfvIlGlRi3AzyhdrsNXXVKkXfNvM5nebds/iiJmBSguZEal44fmqi3UIY+UJYRrFDUcnHLBjUpE1xjZKKATHWwFFUbJ0iuVOjJURwxxG/jCM+2DeI/LCA7FnOZONiUgVC3T1umTDfch3L6Ug89osmu4mDHY8HwU0oKLR7X05/tgLnbIqjHcQirSSr9S5aTd6Q0nE5YvGVd6W/yKQl5Gs6IgocmqAsmBUyB/5Y/BtQVRgI4TQYrh2a03KXMgbmRSPVT6FX/6qokmOdWiyGJ5zFtA2oOz22DhIcjBCk83TZbGqSp5MVDcvJ8ykWILygJ0iWqsapj4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199015)(86362001)(36756003)(2906002)(4744005)(122000001)(7416002)(7406005)(8936002)(83380400001)(38070700005)(921005)(38100700002)(82960400001)(186003)(2616005)(110136005)(54906003)(316002)(91956017)(66946007)(478600001)(6486002)(66446008)(71200400001)(8676002)(4326008)(66556008)(41300700001)(76116006)(64756008)(6512007)(66476007)(6506007)(26005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHNZU2tjMjBxYUdDWmxobFViMVFCNG1RcHFPdklFcXNLZDMvSUcwTVBMcDBJ?=
 =?utf-8?B?aUxQUkIzU2FnTXlKSmRkTUxYeWZSd3gvWThBendqRUIrbVFBenQ3RysyZlJK?=
 =?utf-8?B?UDVoR1c5eFVFTHRsQ0l4Wi9qejVYS0cxSFFjM3JiWkMxMzlpbWM3RGc2Qjhs?=
 =?utf-8?B?NjI4eXVkenl0UVRWdDJBM0FWdVZSckV2M2ZYRGovRURYb3UwZXlzM1JSUFF6?=
 =?utf-8?B?VXVTRlFUTzVnazFwWnc3dU13VmtCMlBVRG1xWUIwRk1mbXlmTlpzOGNJK2Rr?=
 =?utf-8?B?QWk3NTROclo3WVNrdWJnTDI2Z0hyaXRWVjNHZGR1NXBkVFJqdjNGNldFUlhX?=
 =?utf-8?B?ZGtRMG9CS0VuYUJkTTB6d2FYcW5VQmJoZWlNQ1BLT0dyalVsb2FZOThFb2tF?=
 =?utf-8?B?VU44SlFtTUFvNlNsN1BheFp0VW5PREhUSGZCRng4SklpNmhqRnJEaEFvV1FX?=
 =?utf-8?B?dGZ4aWJ6dU1RUGxnQ0t4Q3E4NVdCRVNQdjFKOTFRWGZQU1ZqdWhPWFpJRDhx?=
 =?utf-8?B?d25WTENFMlFWWFNHWXNFYjRVVTNLbTYyWngvMnd6TWhzMjlNdnBYTUVWVG5F?=
 =?utf-8?B?R0NEdG1Idisra2s3bDV3akZuSzAvK3pXdGFaVDg3a3E1d05LckZSS1B6eDZ1?=
 =?utf-8?B?aytzd3pXRnZla2V0Z1dSaFc3OWk2aGtaQmVyOHVxZVZKdXQwWDRvWEs3QkhG?=
 =?utf-8?B?VEMzbDRuOUZPbzFuV1I0YVNoaXljZ3dWY1Nad0lOYUNnMWpQdjJ6ZTVSUktS?=
 =?utf-8?B?WFMzT1ZVQVovUjlIUHZhZktzZEFZbEpQNUNDLzNiNGhuSG5nc2wwNHhaRmVZ?=
 =?utf-8?B?YytRZDNGTytBdGpkL2JvZExiNlRkVU5WaFZhWGFDeS9qK3QyUHNuNG9yZENu?=
 =?utf-8?B?M3ZScSt5djFieUprZG5RZi8wUEh5MTNTdUpZOTM0eEhPT3dxclh6d2VpQjR6?=
 =?utf-8?B?YlZlVUxGYUhIVjFaV3NqZi9OTHlCYVFBWGk1dStZbytPUHhjbDRtcUFJK1dx?=
 =?utf-8?B?ODRuRU1NVm1vQlJBVWc2cHJFbDV6OFAxcnhBNFZmYVVCK0V4dlpieVNpSGdw?=
 =?utf-8?B?VENQVjZSM1Z4dThKeVg3Q1lKUUtPV1h4RlRydDV1Q1E4LzZkcHMrcG9HMEpQ?=
 =?utf-8?B?OXRBTU9YdDd0NVg1c21GUitmWDdSOFBLcDNWUnVYcTkzYlJiOXFCa01Ec3VE?=
 =?utf-8?B?ZEdVMWJlL3pmbzZoKzBDVjg3aXd1eHBxTEVNRUJaeS9XRktIcUE1SVZCMnc4?=
 =?utf-8?B?bWx4cXFYb0RwZ2xOZVBSKzBSMnVNS2ZIbG5OUy9RMWJ5L1AyVTViQ2hFaXRm?=
 =?utf-8?B?SUtQdVgvdjg5dnhqNDF1ZGFsSmNCc0FCL3R4RTdwZ1UrV2NxcDhRUE0rN0J2?=
 =?utf-8?B?S3UybUhpQ3hTQkpreUp0S2VGNFlpdVJaV0c2ZlRjZDdSSlEwUFdtVnR2VGJQ?=
 =?utf-8?B?c09PVTdLUngyMzNVN0NjV1dVYjNSR1FwWG81WUhwV1dycVhXc1ZHMHZHK2x2?=
 =?utf-8?B?LzJhSVJRMU81dDBaU1g2RDFSUU9ObG1UQTFBbkJOcThQTkhLSythRUlFckVY?=
 =?utf-8?B?eU5NaGRoWEltQjFvblRwdkgzM0diVDdHRWVEaWVjRWh1ejRwU1JBdms2a3l2?=
 =?utf-8?B?TTNkRGdzUkwzblJDRXF2dm1VUFZJQTJSdHB3OGNFVTdGRHgwRnVOaUVZVW51?=
 =?utf-8?B?c281cURhVDVPT2dRNzJ1Ym5JY0E4TVA2U3hISVFoQzlYT3NtRmt3SGNwM0NM?=
 =?utf-8?B?UmxoaHlmbVdSaUJBc0UxMFZidVloNUtKV3B1TDFiczZOTW84VC9RY0dTVk9T?=
 =?utf-8?B?ejRQaFRGZk9GdHFuMXVDMWJSQWxmZE5tNS9sTWk4b1NFTWtyVDNBRkpkYWlM?=
 =?utf-8?B?OWwrbXU4NzFUZkhqQm10bmVuekt4ZE80S2FKWkplNTlwZWNOK3V2S3VLOUdX?=
 =?utf-8?B?eDhJSTdoQlpUOEdUU1ZSZXZGcWJGTXQramE1MGcxUytpd2NUNjhqWnhzSDZK?=
 =?utf-8?B?REN3Rk9wNlU5OFdEOXNpd2N1ZWk0OUErRnNJeU55anpPN21KUURONzJITzZt?=
 =?utf-8?B?SkQzYzZXVFoxUGdqSUNkdllUOUdONEtrWVBYVlBPNG1LTHlxSEdDU3ZYQ2pG?=
 =?utf-8?B?Rk9kcWs4UzU4ZDAzYjdZZG11R2tGbjBvbWk2QVhQZU9FRm5yMGdmZE9OQTZt?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D9A696E9729B54B9B3A7E1647236A8D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 569664df-15f1-44d4-6425-08dac75bdca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 22:50:58.4074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tn1XQviIcsMEX9UeYLC7SL9qjSSb1e6znuuwLT02zXAg1WZJnh6BNqRmyyArD8LElL6EoQ+8R4hn6n3iXvAt+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6446
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "Yao, Yuan" <yuan.yao@intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Gao, Chao" <chao.gao@intel.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "james.morse@arm.com" <james.morse@arm.com>, "kvm-riscv
 @lists.infradead.org" <kvm-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIyLTExLTAyIGF0IDIzOjE5ICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiArc3RhdGljIGJvb2wgX19pbml0IGt2bV9pc192bXhfc3VwcG9ydGVkKHZvaWQpDQo+
ICt7DQo+ICsJaWYgKCFjcHVfaGFzX3ZteCgpKSB7DQo+ICsJCXByX2VycigiQ1BVIGRvZXNuJ3Qg
c3VwcG9ydCBWTVhcbiIpOw0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+ICsJaWYg
KCFib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfTVNSX0lBMzJfRkVBVF9DVEwpIHx8DQo+ICsJwqDC
oMKgICFib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfVk1YKSkgew0KPiArCQlwcl9lcnIoIlZNWCBu
b3QgZW5hYmxlZCBpbiBNU1JfSUEzMl9GRUFUX0NUTFxuIik7DQo+ICsJCXJldHVybiBmYWxzZTsN
Cj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gdHJ1ZTsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyBpbnQg
X19pbml0IHZteF9jaGVja19wcm9jZXNzb3JfY29tcGF0KHZvaWQpDQo+IMKgew0KPiDCoAlzdHJ1
Y3Qgdm1jc19jb25maWcgdm1jc19jb25mOw0KPiDCoAlzdHJ1Y3Qgdm14X2NhcGFiaWxpdHkgdm14
X2NhcDsNCj4gwqANCj4gLQlpZiAoIXRoaXNfY3B1X2hhcyhYODZfRkVBVFVSRV9NU1JfSUEzMl9G
RUFUX0NUTCkgfHwNCj4gLQnCoMKgwqAgIXRoaXNfY3B1X2hhcyhYODZfRkVBVFVSRV9WTVgpKSB7
DQo+IC0JCXByX2VycigiVk1YIGlzIGRpc2FibGVkIG9uIENQVSAlZFxuIiwgc21wX3Byb2Nlc3Nv
cl9pZCgpKTsNCj4gKwlpZiAoIWt2bV9pc192bXhfc3VwcG9ydGVkKCkpDQo+IMKgCQlyZXR1cm4g
LUVJTzsNCj4gLQl9DQo+IMKgDQoNCkxvb2tzIHRoZXJlJ3MgYSBmdW5jdGlvbmFsIGNoYW5nZSBo
ZXJlIC0tIHRoZSBvbGQgY29kZSBjaGVja3MgbG9jYWwgY3B1J3MNCmZlYXR1cmUgYml0cyBidXQg
dGhlIG5ldyBjb2RlIGFsd2F5cyBjaGVja3MgYnNwJ3MgZmVhdHVyZSBiaXRzLiAgU2hvdWxkIGhh
dmUgbm8NCnByb2JsZW0gSSB0aGluaywgdGhvdWdoLg0K
