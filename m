Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F41C7747BB0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 05:06:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AYcDPRL4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qwl1Y6QVhz3blb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 13:06:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AYcDPRL4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=rui.zhang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 05 Jul 2023 13:05:53 AEST
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qwl0d0Q0Qz300N
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 13:05:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688526353; x=1720062353;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ypjrmyvcDdD1Dm2V4KadVpZ7TGSrJeli25Hclpdahig=;
  b=AYcDPRL4BYkwfKMKPCZYJuY3PefxszmEhgGserjRw+mCLYm3hqe0h0yw
   YpuwStItQ1bTHRqEI6DfQIgPhMpT7BCX7/Wkmrg/LyilEvwKfPsfYiX92
   3C6/H283aAjaa5q/KVIPGHNVF3u6CUqEeaWQT1Uztj9rd6ScJ+0lPJYn2
   VuhwFS/5iaI3YVSk6AknSPUC8f8VOzawvO+FVY1TEo72qQvO12+8ReTzn
   26aX/c7lzXa/U3nzm9R/LY/WWnrXycV+SEBOSZEin60gwk1gsTZCcbZrX
   u/BLJU/Yxp1FAqwqi3DAnMItH+/dQla/+oq/fnN62mQmwRT0O3LLf+ho0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="343568617"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="343568617"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 20:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="789010355"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="789010355"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 20:04:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 20:04:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 20:04:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 20:04:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 20:04:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi0EQMD00HAEELAPOQUXLE5w02SLzDtxH3g7iGi0kVwbOrmBYX3Yk90glFSRQUqyD35d4LIegBhFofDuM4Z3WhpT6b6UmGv2epuPhfPkYtAmb6P445VOVSkbZbnktd0KcqS1/1pqwXsOGFvOaNiqGptyUr31h3i7A4GwyhZBcY7D2IKeV7XXSydPt3mdE1I28mO3AEt9EjalLNjLyJOLfk42mkZruk/OtFvhIwPoPTz2/AO1vPvvfiwAN+nBn/yaSwLz9/MfkL34QMicL1NmNmfBqwK+dk6Y5KWpqMmHY2L4CGTyWQaVOV7x8yKDiBfVmd7lk8E5Z3PJ3KbLKoaEEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypjrmyvcDdD1Dm2V4KadVpZ7TGSrJeli25Hclpdahig=;
 b=MN9XWmUIyIEnyxhEPt3X5l/mKd7uKfTlrJKA2tnsAYxvQE0knEyEELFYw9b91qIQBYIc/ysWaZ54MScXMMKfNZxZcCONRnetahQMssG6VdygshvD6i5D8s4pNrM8aPJyKQz1S33IcbmW3yM8nz7erW5DjYTxJDgcO/e+gs6MxHuiFGmF4Gt/z2yfIqFhCATGnW+brMHNtsz3FcKyA3gc+SDWvakQOMwL2Y0BwGsddMMydhl0joJnEU2YjhsVegmV/m9FSd7ilb4f8IiWjnTH7ZcRL8LWAx/hGybapLczHfImE5IFKBxIiZTgN868uhJcL8IX6sxNv1qshuZ9//4RPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6622.namprd11.prod.outlook.com (2603:10b6:a03:478::6)
 by LV8PR11MB8679.namprd11.prod.outlook.com (2603:10b6:408:1f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 03:04:35 +0000
Received: from SJ0PR11MB6622.namprd11.prod.outlook.com
 ([fe80::23ed:f657:76a5:722d]) by SJ0PR11MB6622.namprd11.prod.outlook.com
 ([fe80::23ed:f657:76a5:722d%2]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 03:04:34 +0000
From: "Zhang, Rui" <rui.zhang@intel.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"ldufour@linux.ibm.com" <ldufour@linux.ibm.com>
Subject: Re: [PATCH v3 0/9] Introduce SMT level and add PowerPC support
Thread-Topic: [PATCH v3 0/9] Introduce SMT level and add PowerPC support
Thread-Index: AQHZqpdPipMkDEaCxk+ex22yllwl0a+qhZ8A
Date: Wed, 5 Jul 2023 03:04:34 +0000
Message-ID: <44bf8b00c960473e37e35571104b5a1b24673142.camel@intel.com>
References: <20230629143149.79073-1-ldufour@linux.ibm.com>
In-Reply-To: <20230629143149.79073-1-ldufour@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6622:EE_|LV8PR11MB8679:EE_
x-ms-office365-filtering-correlation-id: ea5331b0-b377-43ca-8098-08db7d048fc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eaDdeMijDtwkv+twSemg2nx502kDhNwlZqV7kb1sgEVlZMjFOZn7GTFl6As4kswQOD5MNIqAL1ihGxWaOGxwQ9ti6mRjhxbWrDEjvC9yDXvQ2fbCShikVXXHotIapyuoZU1ojD+nAAzZtI3+LbDHquF3Yx2veHIRuBYzP2TUv7phD2fewSlrikKND3hq9TiGZRToKioLjlRUoXQRNufEEFlFMAE/aJdOXwM6UBmNbR9zLQD/dzLb41oKEnVlNRCS9zU9/ZF/NexL9KCSFD05HI4/4qEBYD9CyyvKrZo5Mm8xSNl547RhoL0Y55ky2iwLoKFojKdKeuRZKtgoj/Q2UJsMWdDJ6Avdz+xgC3ZDl+VRsVgLLBfiOiXt47Uf+SuYFyZ3MALLpEQkToCZjZ5JOkDD/Z1ndrOnzQHIlRLbGYojXndFP2oWJYlAeyd5iZhlY2o/3YG+5RKa/eXZfBBsb/VcfqQOXdNYx4dbZW2KT04TWU80UO3L9Qbi0j+0JdUIoqY2OCMW01Tl3mkjgpEttNvb920xrNW9FxzdhAMzdnU9GehDlGuWOOcMR803gqpMA1uegjhMp+y0ymAqtrzultH1V6BwuFDyAvvjcQWxCEH9zeEh6NrcozktNAqdqfJdn767agb/CZYxxTZxa+FdnA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6622.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(186003)(82960400001)(478600001)(6512007)(966005)(26005)(6506007)(86362001)(71200400001)(2616005)(316002)(110136005)(83380400001)(54906003)(38100700002)(6486002)(66556008)(76116006)(91956017)(122000001)(64756008)(66446008)(66946007)(4326008)(66476007)(7416002)(5660300002)(8676002)(8936002)(38070700005)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXZ6VWpPbmx2cFdFTXAyUldUajNmOTRBWW5Vd21md045VWVtRUNIY1Y1blN2?=
 =?utf-8?B?cUt2dWl3NTBERnlIR3ptZDJaaC9MdlRmQzlJUUQ3aWdRMStWcTV1ZU5GVnk2?=
 =?utf-8?B?Uzh0QTM5QTZTWkE0bmYzYm9QZ1dPNElLZC9sZldwTWhVeWVLVDMyQTNtNU44?=
 =?utf-8?B?RjJuRDlhTWVkRW1QZENIMzVFR3Y3d3gyM04vTHdDaVNSNnExeFFMZ1V2THEy?=
 =?utf-8?B?TjdvNHNZTDVKc2xHeVAwYjB6VlQxaXB3Mjd1Z3dyMWU3eHBaemp5R1BuU3ZV?=
 =?utf-8?B?S2NQdmZXUlFxM0VXL0Z2Q200bEVudENSUXlzSWM3cFdIa2ljd1cydmJqNmVz?=
 =?utf-8?B?N2tCckJYdlA2aHVaVld3aUVzZUtXQm9PNTRNdE83K0hRRGgrMGhueTl4ZDBx?=
 =?utf-8?B?bDJ1S3V3WkkreHRJR3BGM1JkZ3ZCM1FWV2pObHdvc0dzWlZNd2F0dllzNkVF?=
 =?utf-8?B?YlRlaFl5aWhPazhIUzdQbXlHamhDYVR2aTh3aDFOSWpkS3RJZmhBNUhlNnYx?=
 =?utf-8?B?cUpZVUdZR0hBZnRFaE1uT09wZFhXbXdYa0paaEtpUEV6bGFuVGpwZjkzeXVk?=
 =?utf-8?B?K3liNW9TNVprTGY3Z3pXZGh3Sld4eUQrak55VlVHNVZNWGY1bFNIZFBJbkZr?=
 =?utf-8?B?dW0wVDlRWkNDNEVTTmk0UW1hU1BWYzVuNmJ6dVFqK3JTNXZFZUc5cTNnQUtp?=
 =?utf-8?B?L3pDM2MreUpYYkltcTV4cDFxWWpsMlI1c09LcFhOa2RkcGRkMHFBRGI3eDJz?=
 =?utf-8?B?NHdmb2NMcnMzazEvOU5UNFR6aWZzYkxhZVFFRlZab0RCS0lqVUdqbVhTUVg3?=
 =?utf-8?B?cmxvenV0dUhBWDNOY1oxLzJjaEdvZ1RyTVpvV3FjMUJPaVQ3KzdNOWtKWVEw?=
 =?utf-8?B?bzVXQkducUhBb3JZekpDRUlteE5SOFFKQTFLN0t3cVdiQXllemVZTFBFY3ls?=
 =?utf-8?B?a3Q4cXRVY0lmZnJXQmNIbHBwQURHamJteGVXeHgzbHJyT2gvMGVTRVlVamVF?=
 =?utf-8?B?V1hSTnBBZGsvOWhUNkxmZFpZS1E5bVNnaEFFa1M4ZUdkZFVTWk9mZE1aTTgw?=
 =?utf-8?B?QWRJejRnY21IdFJGYUkrTm5BaTNnN3BkMUNJU0NrOFpSSjBiWXozOFEvdEQ1?=
 =?utf-8?B?U2d1OGpyczBXdFNDRmFpQVEvcmk2bHMwZnFRdXJhUFNUK3ZCK0lKbCt4OHI1?=
 =?utf-8?B?bzBWWXcyWWtOVml2UVN5TlF0Q3RxVW10TmF5R0NoamxBeHZ2KzlQQTJ3UkFI?=
 =?utf-8?B?RHZvK3JLUWtXT213bXFTaUtuME12Rmp0WTVvVVFEeUo4dlFDQVVjU0hHWUJL?=
 =?utf-8?B?cG9GeGl2ZzJvRkY1c25xQWtBVjR0bFRuYXhpK0xGVXN6MHhoSDl2RGp4QkxP?=
 =?utf-8?B?YzUyZWlURml6cHdwWFpZbE5vL2xtVVREdEYwaTZ0Kys5Z1ZydTZhQkx4WmlC?=
 =?utf-8?B?WWZxYTJZZ1NLTGJCTUxnM2xKQmZ6NHRSYyt5TDlGWFdGSVhTMEtNbjFMSmVp?=
 =?utf-8?B?MlFyWVdWOWZjQjl4K2xZN2FLVWR0YzF0eTRRRWprSHUwRGUybjhBVnRLY0lP?=
 =?utf-8?B?dnlsMUNwMXlocXIxQ3lJclJVcWJCVDd1SnpONWhCLzgyTE5Kajg5ZmdaVE1m?=
 =?utf-8?B?RU5Cak1wb3hoa3hGUmVuNDh0cldUd3JzV2NDUnZ4citEb2ZodkFZTFRIKzQ0?=
 =?utf-8?B?NDAzeW82VFozTHZCTm5TWjBta2JRdmpkbEtOa211MloraERpL1Y1bUIzc05U?=
 =?utf-8?B?QXJDTGFlVW96MUEvVm5pbkVxTE00Zm80REZTSFpRSStaY3pQOVk1V2J1RTBn?=
 =?utf-8?B?K2VyTDdFNmE2M1ZEMHFocXlkZXp5NzhiT2RONG9LZFlDVXZLbWp1WDNkdFNz?=
 =?utf-8?B?dzd6RDgwVW5OM1gxSDhIWGNhaEZrbEorNHI5OC9Zb3BoQkVpQjk2TmgvYnVu?=
 =?utf-8?B?elZXVG5GYUE0RHhySHVSbUdsK2pmSkdxckt2WXhyRVZoWlZYaGRUcy85Vzl5?=
 =?utf-8?B?ZnlmQUVXSE1IdmNFRXZLRllWZmdSZjRGZmVPVy9qNVdaSXJhaVoyQjE4Nmxp?=
 =?utf-8?B?VDZkNnhDRzdiRVdRN0xnSXk4dWlkWkNMbGw1YmdRSmJhRVRrQTlWaHo1M2RK?=
 =?utf-8?B?SkJtL25XU2hXbjlhZHJXN09BUzROMTZiUjVUZ0JNbHFzQ0pKODhVKzZSTEE4?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00155FDFEC60D2409F3535FC5A776A1B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5331b0-b377-43ca-8098-08db7d048fc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 03:04:34.8330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VsIv7kvKr/Jhy95bHdebm3Bl+c7SGoSJKu4itvpxXDTtOdRhBnp0nplKPnICKP07mtBif9Ri8H1qWpGGsveUOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8679
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "tglx@linutronix.de" <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksIExhdXJlbnQsCgpJIHdhbnQgdG8gdGVzdCB0aGlzIHBhdGNoIHNldCBhbmQgZm91bmQgdGhh
dCBpdCBkb2VzIG5vdCBhcHBseSBvbiB0b3AKb2YgbGF0ZXN0IHVzcHRyZWFtIGdpdCwgYmVjYXVz
ZSBvZiBzb21lIGNoYW5nZXMgaW4gdGhpcyBtZXJnZSB3aW5kb3csCnNvIGJldHRlciByZWJhc2Uu
Cgp0aGFua3MsCnJ1aQoKT24gVGh1LCAyMDIzLTA2LTI5IGF0IDE2OjMxICswMjAwLCBMYXVyZW50
IER1Zm91ciB3cm90ZToKPiBJJ20gdGFraW5nIG92ZXIgdGhlIHNlcmllcyBNaWNoYWVsIHNlbnQg
cHJldmlvdXNseSBbMV0gd2hpY2ggaXMKPiBzbWFydGx5Cj4gcmV2aWV3aW5nIHRoZSBpbml0aWFs
IHNlcmllcyBJIHNlbnQgWzJdLsKgIFRoaXMgc2VyaWVzIGlzIGFkZHJlc3NpbmcKPiB0aGUKPiBj
b21tZW50cyBzZW50IGJ5IFRob21hcyBhbmQgbWUgb24gdGhlIE1pY2hhZWwncyBvbmUuCj4gCj4g
SGVyZSBpcyBhIHNob3J0IGludHJvZHVjdGlvbiB0byB0aGUgaXNzdWUgdGhpcyBzZXJpZXMgaXMg
YWRkcmVzc2luZzoKPiAKPiBXaGVuIGEgbmV3IENQVSBpcyBhZGRlZCwgdGhlIGtlcm5lbCBpcyBh
Y3RpdmF0aW5nIGFsbCBpdHMgdGhyZWFkcy4KPiBUaGlzCj4gbGVhZHMgdG8gd2VpcmQsIGJ1dCBm
dW5jdGlvbmFsLCByZXN1bHQgd2hlbiBhZGRpbmcgQ1BVIG9uIGEgU01UIDQKPiBzeXN0ZW0KPiBm
b3IgaW5zdGFuY2UuCj4gCj4gSGVyZSB0aGUgbmV3bHkgYWRkZWQgQ1BVIDEgaGFzIDggdGhyZWFk
cyB3aGlsZSB0aGUgb3RoZXIgb25lIGhhcyA0Cj4gdGhyZWFkcwo+IGFjdGl2ZSAoc3lzdGVtIGhh
cyBiZWVuIGJvb3RlZCB3aXRoIHRoZSAnc210LWVuYWJsZWQ9NCcga2VybmVsCj4gb3B0aW9uKToK
PiAKPiBsdGNkZW4zLWxwMTI6fiAjIHBwYzY0X2NwdSAtLWluZm8KPiBDb3JlwqDCoCAwOsKgwqDC
oCAwKsKgwqDCoCAxKsKgwqDCoCAyKsKgwqDCoCAzKsKgwqDCoCA0wqDCoMKgwqAgNcKgwqDCoMKg
IDbCoMKgwqDCoCA3Cj4gQ29yZcKgwqAgMTrCoMKgwqAgOCrCoMKgwqAgOSrCoMKgIDEwKsKgwqAg
MTEqwqDCoCAxMirCoMKgIDEzKsKgwqAgMTQqwqDCoCAxNSoKPiAKPiBUaGlzIG1peGVkIFNNVCBs
ZXZlbCBtYXkgY29uZnVzZWQgZW5kIHVzZXJzIGFuZC9vciBzb21lIGFwcGxpY2F0aW9ucy4KPiAK
PiBUaGVyZSBpcyBubyBTTVQgbGV2ZWwgcmVjb3JkZWQgaW4gdGhlIGtlcm5lbCAoY29tbW9uIGNv
ZGUpLCBuZWl0aGVyCj4gaW4gdXNlcgo+IHNwYWNlLCBhcyBmYXIgYXMgSSBrbm93LiBTdWNoIGEg
bGV2ZWwgaXMgaGVscGZ1bCB3aGVuIGFkZGluZyBuZXcgQ1BVCj4gb3IKPiB3aGVuIG9wdGltaXpp
bmcgdGhlIGVuZXJneSBlZmZpY2llbmN5ICh3aGVuIHJlYWN0aXZhdGluZyBDUFVzKS4KPiAKPiBX
aGVuIFNNUCBhbmQgSE9UUExVR19TTVQgYXJlIGRlZmluZWQsIHRoaXMgc2VyaWVzIGlzIGFkZGlu
ZyBhIG5ldyBTTVQKPiBsZXZlbAo+IChjcHVfc210X251bV90aHJlYWRzKSBhbmQgZmV3IGNhbGxi
YWNrcyBhbGxvd2luZyB0aGUgYXJjaGl0ZWN0dXJlCj4gY29kZSB0bwo+IGZpbmUgY29udHJvbCB0
aGlzIHZhbHVlLCBzZXR0aW5nIGEgbWF4IGFuZCBhICJhdCBib290IiBsZXZlbCwgYW5kCj4gY29u
dHJvbGluZyB3aGV0aGVyIGEgdGhyZWFkIHNob3VsZCBiZSBvbmxpbmVkIG9yIG5vdC4KPiAKPiB2
MzoKPiDCoCBGaXggYSBidWlsZCBlcnJvciBpbiB0aGUgcGF0Y2ggNi85Cj4gdjI6Cj4gwqAgQXMg
VGhvbWFzIHN1Z2dlc3RlZCwKPiDCoMKgwqAgUmV3b3JkIHNvbWUgY29tbWl0J3MgZGVzY3JpcHRp
b24KPiDCoMKgwqAgUmVtb3ZlIHRvcG9sb2d5X3NtdF9zdXBwb3J0ZWQoKQo+IMKgwqDCoCBSZW1v
dmUgdG9wb2xvZ3lfc210X3RocmVhZHNfc3VwcG9ydGVkKCkKPiDCoMKgwqAgSW50cm9kdWNlIENP
TkZJR19TTVRfTlVNX1RIUkVBRFNfRFlOQU1JQwo+IMKgwqDCoCBSZW1vdmUgc3dpdGNoKCkgaW4g
X19zdG9yZV9zbXRfY29udHJvbCgpCj4gwqAgVXBkYXRlIGtlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+
IAo+IFsxXQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4cHBjLWRldi8yMDIzMDUyNDE1
NTYzMC43OTQ1ODQtMS1tcGVAZWxsZXJtYW4uaWQuYXUvCj4gWzJdCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXhwcGMtZGV2LzIwMjMwMzMxMTUzOTA1LjMxNjk4LTEtbGR1Zm91ckBsaW51
eC5pYm0uY29tLwo+IAo+IExhdXJlbnQgRHVmb3VyICgxKToKPiDCoCBjcHUvU01UOiBSZW1vdmUg
dG9wb2xvZ3lfc210X3N1cHBvcnRlZCgpCj4gCj4gTWljaGFlbCBFbGxlcm1hbiAoOCk6Cj4gwqAg
Y3B1L1NNVDogTW92ZSBTTVQgcHJvdG90eXBlcyBpbnRvIGNwdV9zbXQuaAo+IMKgIGNwdS9TTVQ6
IE1vdmUgc210L2NvbnRyb2wgc2ltcGxlIGV4aXQgY2FzZXMgZWFybGllcgo+IMKgIGNwdS9TTVQ6
IFN0b3JlIHRoZSBjdXJyZW50L21heCBudW1iZXIgb2YgdGhyZWFkcwo+IMKgIGNwdS9TTVQ6IENy
ZWF0ZSB0b3BvbG9neV9zbXRfdGhyZWFkX2FsbG93ZWQoKQo+IMKgIGNwdS9TTVQ6IEFsbG93IGVu
YWJsaW5nIHBhcnRpYWwgU01UIHN0YXRlcyB2aWEgc3lzZnMKPiDCoCBwb3dlcnBjL3BzZXJpZXM6
IEluaXRpYWxpc2UgQ1BVIGhvdHBsdWcgY2FsbGJhY2tzIGVhcmxpZXIKPiDCoCBwb3dlcnBjOiBB
ZGQgSE9UUExVR19TTVQgc3VwcG9ydAo+IMKgIHBvd2VycGMvcHNlcmllczogSG9ub3VyIGN1cnJl
bnQgU01UIHN0YXRlIHdoZW4gRExQQVIgb25saW5pbmcgQ1BVcwo+IAo+IMKgLi4uL0FCSS90ZXN0
aW5nL3N5c2ZzLWRldmljZXMtc3lzdGVtLWNwdcKgwqDCoMKgwqAgfMKgwqAgMSArCj4gwqAuLi4v
YWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0wqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0
ICstCj4gwqBhcmNoL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArCj4gwqBhcmNoL3Bvd2VycGMv
S2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDIgKwo+IMKgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3RvcG9sb2d5LmjCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMTUgKysrCj4gwqBhcmNoL3Bvd2VycGMva2VybmVsL3NtcC5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA4ICstCj4gwqBhcmNo
L3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvaG90cGx1Zy1jcHUuY8KgIHzCoCAzMCArKystLQo+
IMKgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3BzZXJpZXMuaMKgwqDCoMKgwqAgfMKg
wqAgMiArCj4gwqBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvc2V0dXAuY8KgwqDCoMKg
wqDCoMKgIHzCoMKgIDIgKwo+IMKgYXJjaC94ODYvaW5jbHVkZS9hc20vdG9wb2xvZ3kuaMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNCArLQo+IMKgYXJjaC94ODYva2VybmVsL2Nw
dS9idWdzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICst
Cj4gwqBhcmNoL3g4Ni9rZXJuZWwvc21wYm9vdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCA4IC0tCj4gwqBpbmNsdWRlL2xpbnV4L2NwdS5owqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjUgKy0tLQo+
IMKgaW5jbHVkZS9saW51eC9jcHVfc210LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMzMgKysrKysKPiDCoGtlcm5lbC9jcHUuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEx
OCArKysrKysrKysrKysrKy0tCj4gLS0KPiDCoDE1IGZpbGVzIGNoYW5nZWQsIDE4NyBpbnNlcnRp
b25zKCspLCA3MSBkZWxldGlvbnMoLSkKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xp
bnV4L2NwdV9zbXQuaAo+IAoK
