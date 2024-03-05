Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4838721FB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 15:51:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CJvFzkTJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpz6h3sh8z3vct
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 01:51:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CJvFzkTJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpz5z0LQSz3vXw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 01:51:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709650279; x=1741186279;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AlT2pYpoQEJECbTtTtwGQ5rUmrzf5Plx9epuB0Kqhbs=;
  b=CJvFzkTJAdix3Y8PVH8Ivu4VAKaknjDsn3heBIksTJ4CVzGoQrAe56oO
   VLLDJmOhdX7amyRm7VVR+qh9Gx2iPXpLnnbsxbngdl0laHPQjNNoi8tQ0
   zyGY1H99kF1evQVrLcrb9D7wF0glf1Mgxt3aORgFX7ZK8acbZrZtLoACk
   mDRTnM4srpyAzgVV/3NyJkRYLlxuY8ExQy1Ktx5+ZK5CZSN9HXr7j0yXc
   YNQ2+97XxUNlZpzropmrZVV0bcZ11v46Bya7FSbIFe7WwATeGpC0+ydd4
   CaJGiXFWVZHFFsggKgm6/Mj5xwsf3PZ4eY0unJwSzbKhgeAulrYOnfh/f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4064553"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4064553"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 06:51:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9456871"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Mar 2024 06:51:13 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 06:51:12 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 06:51:12 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 06:51:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcCGfSmiappmBqVaEK1211Ynaslrtz1WI8bLmAsve2DBF6vj6YJTteM1/Ixw67aKBlGdmtoIu8zCO8bzY3ria+1myUQtokhWSF00sem+ZsX45w7EBF1uyzFiYEYmf+ZDhlJTBCeswjJCZPZ4R6FYwEUZRcOnkD00ZgUUsUI3MRjRstBlYgjHbHgIH3K0GW33AqxhtR9pb1A4YwqoFbysO0dIqNb6nksEOrdkYY8MkpPQTY30XYsaHWzbNj5rFZEHlehE9xMTjpbSX6DCOlVtl3hVLTZbcHn8y33RRGg6BZ96od6vXtASC/hqSx6pgAscS/QrLLKQi0AYyJsVP89PQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlT2pYpoQEJECbTtTtwGQ5rUmrzf5Plx9epuB0Kqhbs=;
 b=VCzABCyLXFyRMqqrT6CDsKqgCYEBNyrTvpFi3EV6hQZK6v888KZf5r4oSbrPepONbp3DZB8TwlL6QF/qq3SgNqWWgvZHN1f3XskqksNoW3CIzMzBIRKBaoqnR85R+OpQjv7WAGdXLqOpeJWbRis4ewfUlg8na809j7luSl5ufDgaHlYH0NsaywOX6vr7o9JPFPM8oFfleF4XdxhP/IqKo3zdzmGy3q73u6r/o/lgAx32V4nMpEE1Qj7zOIkqSoVm5wS3ross95V8fTERpIF98IJgG+fbubr37CNs/Qs6qXFWWBbVm/4kWfvdaRstYZXjw+U5juqF0tGVCCAUAqJs4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SN7PR11MB8112.namprd11.prod.outlook.com (2603:10b6:806:2ea::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Tue, 5 Mar
 2024 14:50:50 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b%5]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 14:50:50 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [RFC v2.1 07/12] powerpc: Use initializer for struct
 vm_unmapped_area_info
Thread-Topic: [RFC v2.1 07/12] powerpc: Use initializer for struct
 vm_unmapped_area_info
Thread-Index: AQHabDcI6aim2A+6H0Sqq0xL6Ioq6LEoVgEAgADqeQA=
Date: Tue, 5 Mar 2024 14:50:50 +0000
Message-ID: <677385430623d94cebb252e2a846ea4ae31a48ba.camel@intel.com>
References: <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
	 <20240302001714.674091-1-rick.p.edgecombe@intel.com>
	 <20240302001714.674091-7-rick.p.edgecombe@intel.com>
	 <87a5ndpklb.fsf@mail.lhotse>
In-Reply-To: <87a5ndpklb.fsf@mail.lhotse>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|SN7PR11MB8112:EE_
x-ms-office365-filtering-correlation-id: 665191a4-1946-430a-0974-08dc3d23a672
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dcy2n53FC/JPJUBRtOI2DZWfUOnEYpUF2YwgX0ZN2vQzeP2jpYac0HNJjm+sk14804vrknMn4tlwualeLPVfcyWza47ccaTbC/hS+vclNvKYOWu6Vi5UDnC80a3PwjlqB+MgEeV2E2/k0ZWWs3nIjP80ypRQq3Xeugneu8Mbwu2WW8vFvbTrr9TOGx97mYNbKXBolzrehxpxoZ/hDEY92dz96iY8Bplrr6PclbkaAK4TDD5KGiXKivduf6CTeoQhlaWbH6aefaza4mt9lXOO2/91Dcbh4YafF2DOLLaBvqq8n/ILmy2VXgGY4Fhtyrkn8if13xV7yuo0f8AZcdiFsiiG6D0Bf0zFc6r//wvMXwKbxtQqRY8f7CZXSskBC/Ww4uGQ/FXI+kzmuntvDgatEaVFA2sckwi8GbH2uthGlzPhQT2FMCglhisSi9tAc7/9XBPsXD7DvuDxJVh0wxnJBf25mJxcY6kpEBMd/B/5NBpKUkZ+f8CUSwEERCwCHfpbkuL7n8OQ9NS9Z8St4otL6Db/5h2azGCAYqe+R8Qup9P3Pm0R6+yEoprKcYZEUpyN2nQLdACkCjuKItKoU+gJCMqFGGLHA3S6lxA8uubXHKM60MNtOEKsB3PM0FWmK2mjNzFOM0sdEUMDjDCmx8XoV/FmhqFSRqLWUmweJYKC+aQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFNXYit5Rm44QS9yZ0FNcGxFYzhEaG9Kc25IQXhCd0hINk1OZndjOFhmdmNJ?=
 =?utf-8?B?TE8rM2w3elg1aTcwV1kyd2pJcWZNL2lmTTk0ODYwRFo4RHFkVFI3MW1wUEpy?=
 =?utf-8?B?M2oyWEV1cmFQTnpYMWs4dG1haVhCdVd3Yi9zaXR0bFpJeFRYelhkWTlTdGt6?=
 =?utf-8?B?YmwyWmI0QlRYVmlnK3RQNEFVZ3F6ODFwc2lYSnNKajVaejBDczRDdkRaM2NL?=
 =?utf-8?B?VHZNWFNuNmdSNzBUblFkZ09pSi82WmhKTTZ4UmtsZmtLOVNwMUdXTXJTMldm?=
 =?utf-8?B?RlBscndmenQxVFZjQncyQi9qOGZsRHFGUlFrTjM1ZEZkWWVxWkQ5Ti9GbXNN?=
 =?utf-8?B?SW9qZGoweXJvREFIT1RqR1ZSOWJRRzEwaDZzUHVRSjFiZXdVOGUwNFo1T0dR?=
 =?utf-8?B?K284bDdyZE5jckV6UzZ4aTUrZkVIdWxRRG5RckZRTy9xZ3hjTDBXaXZPZkZ1?=
 =?utf-8?B?YXlpcXBuUFBRQ2pQNGQ0MmJZR2k4dlhPOVR1b2NFUDFOTDZHV2dONmJXSUc5?=
 =?utf-8?B?TTQ2NnBFNHBrQlpBOWNCcnRYb0JmUXlNdWlMVU8wdVZDKzR4Z2RuTUlPWk9p?=
 =?utf-8?B?Y3Z5c3lPNzN4TTVtRkJFMGhqbVRWdFdVY3lJMXlGVVErOS8yTGpDYnNVVlRn?=
 =?utf-8?B?eDlhcm9HZmRrQklFaTFjeWZXRlRiSkV2Y29FYlgxKzQ3bmE5TGZIeENTSXNq?=
 =?utf-8?B?WkE1T1I3aFFFaGJSVlFCOENHOGVZMVpWbjlyM0ZVQktYVXYzbDZ6QXRSQ2xt?=
 =?utf-8?B?OE9TRWhrTFVVY0tpV01EWU9FTGxjNHJUK2VaNVJrZ29UUzBwUytKK1B6Y2hs?=
 =?utf-8?B?cytIQ29vNmkra0Uwa0VvQVRIRTlLS1BrakNLYitkbEwyZFEybkY3TTFkK2R4?=
 =?utf-8?B?WjNHZk8xVWd2L0docjlldkVVWkYvaDk5VzlESFVGSEtROFZ6SlpEUTY5Tkpa?=
 =?utf-8?B?MHJjLzBUTGo2S2tLMzg4L1VrdGpzZ0tFOTlzREJRVGNSVlVHZExEZzNTOW44?=
 =?utf-8?B?WGVSM1RCUDZRQ1dnQmZMMVB1cHIweHBIUEgxbFhzaHRnMmNqRXlMbUFtZGFz?=
 =?utf-8?B?VUlHeXlqUEc2d0lVSWJ0K2VtY3BNSE9mUllqdjJTTU5meVZWWnpCNFQ1SDlP?=
 =?utf-8?B?ZGFOWmgzVUdJTU0yazBWVVJ3L09IVkNuTkxvRWxLc1IyQ0V6N05TcXVvUFdW?=
 =?utf-8?B?dTYwNXVyWm5ob1pFM2tONUtlZ0RRVkZ4cFIrNXZPQVIydTgrZUQvTHhwR1Vj?=
 =?utf-8?B?cHh4U2hUUmZyZWJaK3J2SEFCeGt4SXpqS3REQm95YXBWTXVqZjExN0hnRkEr?=
 =?utf-8?B?cEFKSVc5WXNVMDBaT2EvRDVrK050R2Y5dWdYUzNCNHBSK3ZHTnpYcktQanFV?=
 =?utf-8?B?V1VIbm1NZlRBR1puWjFiM0djNkwzWGF6b1JRMHJaZlN3RnhHYUw0WTczeTln?=
 =?utf-8?B?UDY5ZGkrelY3QUNUVVkwV1JibVZUZnZNQjhNTWc3K0d1cG12VXFSbmY3S2M5?=
 =?utf-8?B?QU1yVGJvNlZTNlowNUpISkFFQk0xRDE0dWZyRm5YblFpd0FuRDBaNkxKZHBk?=
 =?utf-8?B?ODhJS2QzY0s4TGxUbmlvS2NJcC9ralpjM2R1RGlTYXgrSDlMRkF0Sk5SbThx?=
 =?utf-8?B?UW9pZlB3aUV2Nk9SUVdGMUpJY1YxWlUxRmk1V3RxeVM1eVhCQ2cvcng1YVRG?=
 =?utf-8?B?anBMdytDWVNydEZSK01BVnFVb1AwSnB0N1E4MGF0SlJnZXYrM1JZblc4ZHQ2?=
 =?utf-8?B?ek9BZ29aZUlKWDdJdTd5d05Ya1JHOUdmcWZiU1hoa2JYUUdnVDAvdExSR3NY?=
 =?utf-8?B?Z1NFN05pOHFmU1p2emtxRzFBU0hTVktuWGtsYmNQbnpnQUp3eWpPTERsR2Ra?=
 =?utf-8?B?SGJUUUJhR210OFVsTSt5NVA3NDBwQTA1N1hxbnF4OHJOSW4xeWF4bFNkcnE0?=
 =?utf-8?B?K3pGT0JGSXdTRld0OXFRRFN4S1hEMkZwd0FRK213RzRUanA4RHB3TmNoRW16?=
 =?utf-8?B?ZW5iK3FJMVZyK25vRDdVMzdnY3p4MWE1MkF5Q29NQkdmeUJNNUJIMHA0YW5J?=
 =?utf-8?B?bVQ4RitnS3B2U2tiVm9YWE5CUFR6ZTVTQUpXT0ZaNDVnK2lvMDlGeUpHUDBY?=
 =?utf-8?B?SDZiSndidldLemE3SjRPbUhEaVlNUFdmQlkvK2pkcGpSb0J5QUVEZ2tYcW4w?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4827E1BD9BCAE042913A3C98A795921F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665191a4-1946-430a-0974-08dc3d23a672
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 14:50:50.4892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IG2H06kEHKf5atyC15k/GXbZ0aKGzOEQKBZK1wXCydGt5b4hXb2lgFXEl3fnFesva/3Zwg1tBkGyfL3ywu3RGDupURa6K6W7EI1gJ44FmkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8112
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
Cc: "x86@kernel.org" <x86@kernel.org>, "keescook@chromium.org" <keescook@chromium.org>, "peterz@infradead.org" <peterz@infradead.org>, "broonie@kernel.org" <broonie@kernel.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "luto@kernel.org" <luto@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "debug@rivosinc.com" <debug@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDI0LTAzLTA1IGF0IDExOjUxICsxMTAwLCBNaWNoYWVsIEVsbGVybWFuIHdyb3Rl
Og0KPiBJIGdhdmUgaXQgYSBxdWljayBib290IHRlc3QsIGFsbCBnb29kLg0KPiANCj4gQWNrZWQt
Ynk6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4gKHBvd2VycGMpDQoNClRo
YW5rcyEgQ2hyaXN0b3BoZSB3YXMgYWR2b2NhdGluZyBmb3Igc2xpZ2h0IHNwaW4gb24gdGhpcyAo
bm90IGRvaW5nDQp0aGUgbWVtYmVyIGluaXRpYWxpemluZyBpbiB0aGUgZGVjbGFyYXRpb24sIGJ1
dCBkcm9wcGluZyB0aGUNCmFzc2lnbm1lbnRzIHRoYXQgc2V0IDApOg0KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC9lYzNlMzc3YS1jMGEwLTRkZDMtOWNiOS05NjUxN2U1NGQxN2VAY3Nncm91
cC5ldS8NCg0KSSdsbCBsZWF2ZSBpdCBhcyB0ZXN0ZWQgaGVyZSwgdW5sZXNzIEkgaGVhciBvdGhl
cndpc2UuDQo=
