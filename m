Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F82756F36
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 23:58:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BR297PxG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4bYs5VBhz30Dw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 07:58:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BR297PxG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4RWk6gw3z2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 01:56:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689609363; x=1721145363;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pyrnp3e0ft0lUNotDieIaaw+/wrylRvfaKtSsCJv0Rw=;
  b=BR297PxGfWn4n7HenKto03yY4u9M9lSo7lSYy84ZWKJc3jhQ5g/lI2j1
   M3ZFACgyhd8ndHSfIGDa5+G4bL8y8MbQyE5gpFyWSpY7ajensvVlErt7e
   DaSWrAuEbO8CUJpus92MQ2Z/kBjlio9NxGhCBg91l7vmX7vbRNjpSS6W1
   S8i8mSQzaMgli4J0pd8aeRyMJhsqA1QCAZTGMW2MBcYwN6hPQPAyDZim6
   Nly6cnX+fyK3aJSr9oPi3Z8Axz1d6XxqZKsCL+39/n0YKXn6KYsmDHM3g
   WLzWAb/wARmjtnBhL9aFFVDwgdKMI36TGJ+umKldVeCbH10jdYJ88O5H0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="345557774"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="345557774"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 08:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="758469747"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="758469747"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga001.jf.intel.com with ESMTP; 17 Jul 2023 08:55:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 08:55:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 08:55:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 08:55:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 08:55:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFA8BL42bE+00z7BrVD+9wTd0fevA+7VtvGRkroCQm0JfeyPwCmV/Yv6FEJkJePiN/hOli6ieozJ57slH9Zh9RKQbxbo1L+KGAqO6DLGMweZm9KMslJqfSfzhfEOoZQgW+yD5na71FFpzNulJKI8D5ESLYkIx41ziWwlB4Ha66P0irfkF1JCE9wry0B8j1wtzprJ1FC/YAi8E0FSMZ6gKyiyo8islSULwnM7JQfp6kZWbKb2e4GH/iZWbboMXzJGrp2XBl4+MySQ6plfKbEUjwNxbqK0ypePWdbndRaZ2qVZHMBSELFz0HRHnn558zMae7GP2+jGyeo1zpJVVzBfdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyrnp3e0ft0lUNotDieIaaw+/wrylRvfaKtSsCJv0Rw=;
 b=XyqbnLziWMn6UY67nmZX94+HHxRQ5ZTGoBw/OZkc/XXkUCSAPSuDQHqLt/k/BXA1U1EjXYuFhyU7atBRmwvmXAakAXZAJ0/pYJuJQvEqboHUnx5P1OakW/bJmXK4Kid8bIr6E3lMaAAXWSW4z24jkZGBz4o7LvYyLV72DbZA/BAEtO0k7Q4IeWgozWA4uuI1lpqpmvBHYriDL/JngDrCZ7VRgviJqsr0nGYepc6YFE4uu7tNaUGf8CTxwN18E0EhCOjqp+mt+L45McVG3i/9WFLQUtajVsP/8ANmUywpokMo7RlB+sktSUNfQf9Hctx3pG4ESIOrlZP3uvuV1XXXCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by LV8PR11MB8770.namprd11.prod.outlook.com (2603:10b6:408:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 15:55:50 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::abd2:f781:1433:259]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::abd2:f781:1433:259%3]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 15:55:50 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v9 01/42] mm: Rename arch pte_mkwrite()'s to
 pte_mkwrite_novma()
Thread-Topic: [PATCH v9 01/42] mm: Rename arch pte_mkwrite()'s to
 pte_mkwrite_novma()
Thread-Index: AQHZnYu46x2k3QQH7UG560N9dHwyWK+6Ee4AgARBSoA=
Date: Mon, 17 Jul 2023 15:55:50 +0000
Message-ID: <87acbb49fa83b0e3f261315a531e105da9e5b9d6.camel@intel.com>
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
	 <20230613001108.3040476-2-rick.p.edgecombe@intel.com>
	 <b389274a-abed-40dc-8e33-7ce922ea9b61@sirena.org.uk>
In-Reply-To: <b389274a-abed-40dc-8e33-7ce922ea9b61@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|LV8PR11MB8770:EE_
x-ms-office365-filtering-correlation-id: 842393ba-05d8-4e65-a368-08db86de4b47
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RwnCdwxG9RtVoyeu0N+QLV+LSeUJtOr2t20RL+5m/laBXJkInu+vzU/Vl5hWTGuswMqty6wTjelRsWHc8o3RHbvSmeS/I4I/xre3uVQ6iRNYtSjdbyDqt27U2cJHNRfSoTqXIjGi65wfpVAlj0oy5Rnft5oJawcihujeBq9smTDjyfAuMNVqG0ADePky1Zg/SV/C1Oxf2MejxVePdraxQ9SIFChPD6SN6V+Rdp1NIv6K8H6JwJ+x8zGyOqFdhDS7S+sc09kDRjVQwKe0aaFBKd9eV/X0uayCSil72AHVXbsPUGGiIZcShE8ItLBnhtcP4TU1rkEWfj/5X7P9NbmgxVVgT87yJXNADVlVSdUAQdbmDcbQ8my3oSZBb260ghnPp2IQiA1wkEe5yYDjt1IdNuPdYDHMXXqHVHu5DHLc66tKD/VY5eq3N0W+PjEBTCrs0FyXV2CuHOQwdkZIfDBkF4gwuWldmKChGRYv455ZlIaLPsCS6f4BFqQ8UjRwa3eiSBB8oV1Tj+SvWX3EhC3vP7DzuiiVlhGju6oKg+IlIbSwbNDWP6Kaf0Tnl+fWsAw/n1GRcQqqXN/WqD+QkqBwxpWYP3QQRTbBzkPUAOU2zXk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199021)(38070700005)(82960400001)(478600001)(83380400001)(186003)(2616005)(26005)(6506007)(6512007)(966005)(6916009)(8676002)(4326008)(41300700001)(2906002)(316002)(5660300002)(6486002)(86362001)(71200400001)(8936002)(54906003)(66446008)(122000001)(66946007)(64756008)(36756003)(76116006)(38100700002)(91956017)(66556008)(7406005)(7416002)(7366002)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzFVakpTSmZXUElMN3J4bldsTmxOdnhLaytJOFl2VWU4QzhVaUNlQWdHQS9i?=
 =?utf-8?B?VHM0M3JwNjFjR2pVSE5MbUQ1U1BVWUMyalZQc3haR0hKUDZFa2ZWUU84NlF5?=
 =?utf-8?B?cWhMQlh6by8wVWVmYm42RWFTMFRQTUhVSXF0eWhkS2dLVFQxM25KMHZqVTRm?=
 =?utf-8?B?bTJXbThkMVlwQ3hVUzBJNWRqQzFsVks0TENvM1MwVG0zWTFWcnl1MUJ3Tmkw?=
 =?utf-8?B?Z2RDWm1lbnY4Y3NWL28veUNVZzJDbzFyY3JNaDRlQXE1cE9IREVMWmNsUEo0?=
 =?utf-8?B?WUYybU1TdDQ3SlBIUnFERFBkYWRhR3o0RE1tbE5QaTlCNHJYQnltbVZMOTh6?=
 =?utf-8?B?MnZFUFBrLzYrci9uanlFME9EOVRiOWhNbVVEaXdCem8zQmFGQVpPL1Q1bm5a?=
 =?utf-8?B?ekVZWmVDa2hNZDc3UVhFd3hIanF4ZGl0ei9RSk1vRzVKMW1naURGcVNBMEEz?=
 =?utf-8?B?cldKSzcyemx3elc2Umc5WnFOV0xrYkRQZUJFanNkbTJDYWJrMmFZNFJOTVRr?=
 =?utf-8?B?NDVjaFZyaGVQOWgyRjdIbDZQTk1uS25lczh2TWdrSGk5OWg5YWhtMVdLZStN?=
 =?utf-8?B?aVV2NEhxUi9nM01iaVNvcUJta0k4VEJsTVExRFFwTG9wY3ZCYXBMYUd1aWxq?=
 =?utf-8?B?b0oweXA2RERwUWtpM3lmL0syU25RdG1jS01YRDh5b253dUQwdzZaR05MTjZ2?=
 =?utf-8?B?TkRUQmpTS2lQdVZQL2htWVRSNzZ3TnI5bE9qbHRWOHNrWUo3cnpVdzdOa0Iv?=
 =?utf-8?B?d1lLVXlWcGVhaGFZV0ZjWDZyaGxySHY3ZkxveDdQTllVZlFrOHBjQ1JhdDcv?=
 =?utf-8?B?czlKUjVCbVVVSEY3SjNad1hBMTc1TGpKaGZ3cUxqMWF0b245d1BPc2ptekRu?=
 =?utf-8?B?Zm42T2lKbjhmM2pMMlVzb2RIc2pFQnRQWm5ybTJFOTlXSGsxekpBU3BFYm5F?=
 =?utf-8?B?Y2RPcjJWOWQzMmkrZHlOZEFGd0FlZjRGZ0tYNjhvNzlxcnZraks1eEt6ZXJC?=
 =?utf-8?B?TXhXRDBFWGx2dXNZR1AxOFp1ZG01cGtHYmZHbFhVaWFFYjNuT2NFSWI4UC9n?=
 =?utf-8?B?aXRvajRxWE1DdThvWnpJZTU5RVJrdnF1WHF1Snd3dEd0RXhka1BZbkNiRk04?=
 =?utf-8?B?cjlpTjJlSjhYVnY2cFFyNHhjcXZBT2ZVMkV5VVRMRlBvM1g2Z0s0NHFzaHVI?=
 =?utf-8?B?ZHlWVU01ZmFJUURENmN3VzFscFUzQW9xdDVQdkswODJVVkpiVVgwRXpLTjZY?=
 =?utf-8?B?dlhRaUttZmZsYUZ6OUxHOG92TTdYK1hZVDA0S2syNlpMcHR0MllWbC9LazhL?=
 =?utf-8?B?UTIvVlh4U1p0US9vZHl2Rk5yc2J1MDhPZGhBWU4wUXJPN08zdmhqdmEyWHZF?=
 =?utf-8?B?L3J4ZHNjR0srMjFReHdma2ZlS2FYT3RxVldOSXZkZVFHMnM0TUZyUjlESlk3?=
 =?utf-8?B?L0h4R1IyLzdUUmZzU1h6WWxnVThYV2MwOGFnTlBJVEJOanNqZUdqYVpJVWdE?=
 =?utf-8?B?WDZkUXdjWE45ZWEwcWdhU29Pckp1UzZMYituSmdsajJYUlM1cSt4TXhPL3hj?=
 =?utf-8?B?NUc0bzV1QnRvNFA2Qk9nU21ZQXBBbDIyZ1dFbHRIa1EyVkcxUEZtRDdjaFEx?=
 =?utf-8?B?TGdia3ZhNFZUaEt5MHZCTUl2clJvTVMwQXZSRnJCWXNxeVI5S3BCZHBpRW8v?=
 =?utf-8?B?dndBaUpwVTRtM05XWFNvWWFCNVBTQW82TDhHUzd3TEU0VzF6ZlBMQ3NFblJj?=
 =?utf-8?B?L2N5K0R4U3JyWEFZNzdnUG9aS2tTa3E5blFhYStiejFnOXBYQUlCcWZOTlJS?=
 =?utf-8?B?TWZ3Mi8vMVErU1ppbCt4YmdDdnNTZ3cyVmlLbHJtK2tTakNFRlhnTkJXZ0cy?=
 =?utf-8?B?WVR3dFhjbnV4bHFSTy9kMEhtaHY3Nk56UzBKTSt1K0YzY01ZdFBzMmhrdTgz?=
 =?utf-8?B?UTU5czRoZ1Y3MTl5R1NRVkUvdk4xRkRrTENpZlhYbTJ4NTZVSmhDNzFaSU5O?=
 =?utf-8?B?NXNYZ3JlTHMrbXhsazFjeGNncDlTclM3T3FHUjlEVkQwVDdSRHh5NkYwS3Vj?=
 =?utf-8?B?OW1hRUkvRVFqUVRKSmtnMy9MZ21lc2w5M0xMdE01dW5lUVEwNDVHN0YxV3VW?=
 =?utf-8?B?V3YrSVdUN0RhUzhDait6a3dTR3dBRHpzdjV5TWFpUHNZTEE1a1BHSVhvQ2lO?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F76615E78E972040956CCDC0942351CA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842393ba-05d8-4e65-a368-08db86de4b47
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 15:55:50.6864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kc/iv+2N0HDSu5pNmYrS/qkLenQYjgtg+wM1EcGdTagdZH2THk1NmQV5BQs5xNNu+wgDdyamJT+fWb+sKlEbMr98GQyWN7wso9SlrHaCJa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8770
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 18 Jul 2023 07:55:09 +1000
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "david@redhat.com" <david@redhat.com>, "szabolcs.nagy@arm.com" <szabolcs.nagy@arm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "Eranian, Stephane" <eranian@google.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "Yang, Weijiang" <weijiang.yang@intel.com>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "nadav.amit@gmail.com" <nadav.amit@gmail.com>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "dethoma@microsoft.com" <dethoma@microsoft.com>, "torvalds@linuxfoundation.org" <torvalds@linuxfoundation.org>, "corbet@lwn.n
 et" <corbet@lwn.net>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "Syromiatnikov, Eugene" <esyr@redhat.com>, "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "hjl.tools@gmail.com" <hjl.tools@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "arnd@arndb.de" <arnd@arndb.de>, "jannh@google.com" <jannh@google.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "bp@alien8.de" <bp@alien8.de>, "Lutomirski, Andy" <luto@kernel.o
 rg>, "oleg@redhat.com" <oleg@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "debug@rivosinc.com" <debug@rivosinc.com>, "fweimer@redhat.com" <fweimer@redhat.com>, "monstr@monstr.eu" <monstr@monstr.eu>, "john.allen@amd.com" <john.allen@amd.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "kcc@google.com" <kcc@google.com>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "Schimpe, Christina" <christina.schimpe@intel.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gorcunov@gmail.com" <gorcunov@gmail.com>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Torvalds, Linus" <torvalds@linux-foundation.org>,
  "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCAyMDIzLTA3LTE0IGF0IDIzOjU3ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBNb24sIEp1biAxMiwgMjAyMyBhdCAwNToxMDoyN1BNIC0wNzAwLCBSaWNrIEVkZ2Vjb21iZSB3
cm90ZToNCj4gPiBUaGUgeDg2IFNoYWRvdyBzdGFjayBmZWF0dXJlIGluY2x1ZGVzIGEgbmV3IHR5
cGUgb2YgbWVtb3J5IGNhbGxlZA0KPiA+IHNoYWRvdw0KPiA+IHN0YWNrLiBUaGlzIHNoYWRvdyBz
dGFjayBtZW1vcnkgaGFzIHNvbWUgdW51c3VhbCBwcm9wZXJ0aWVzLCB3aGljaA0KPiA+IHJlcXVp
cmVzDQo+ID4gc29tZSBjb3JlIG1tIGNoYW5nZXMgdG8gZnVuY3Rpb24gcHJvcGVybHkuDQo+IA0K
PiBUaGlzIHNlZW1zIHRvIGJyZWFrIHNwYXJjNjRfZGVmY29uZmlnIHdoZW4gYXBwbGllZCBvbiB0
b3Agb2YgdjYuNS0NCj4gcmMxOg0KPiANCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL2Jy
b29uaWUvZ2l0L2Jpc2VjdC9pbmNsdWRlL2xpbnV4L21tLmg6MjksDQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gL2hvbWUvYnJvb25pZS9naXQvYmlzZWN0L25ldC9jb3Jl
L3NrYnVmZi5jOjQwOg0KPiAvaG9tZS9icm9vbmllL2dpdC9iaXNlY3QvaW5jbHVkZS9saW51eC9w
Z3RhYmxlLmg6IEluIGZ1bmN0aW9uDQo+ICdwbWRfbWt3cml0ZSc6DQo+IC9ob21lL2Jyb29uaWUv
Z2l0L2Jpc2VjdC9pbmNsdWRlL2xpbnV4L3BndGFibGUuaDo1Mjg6OTogZXJyb3I6DQo+IGltcGxp
Y2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdwbWRfbWt3cml0ZV9ub3ZtYSc7IGRpZCB5b3Ug
bWVhbg0KPiAncHRlX21rd3JpdGVfbm92bWEnPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1k
ZWNsYXJhdGlvbl0NCj4gwqAgcmV0dXJuIHBtZF9ta3dyaXRlX25vdm1hKHBtZCk7DQo+IMKgwqDC
oMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn4NCj4gwqDCoMKgwqDCoMKgwqDCoCBwdGVfbWt3
cml0ZV9ub3ZtYQ0KPiAvaG9tZS9icm9vbmllL2dpdC9iaXNlY3QvaW5jbHVkZS9saW51eC9wZ3Rh
YmxlLmg6NTI4Ojk6IGVycm9yOg0KPiBpbmNvbXBhdGlibGUgdHlwZXMgd2hlbiByZXR1cm5pbmcg
dHlwZSAnaW50JyBidXQgJ3BtZF90JyB7YWthICdzdHJ1Y3QNCj4gPGFub255bW91cz4nfSB3YXMg
ZXhwZWN0ZWQNCj4gwqAgcmV0dXJuIHBtZF9ta3dyaXRlX25vdm1hKHBtZCk7DQo+IMKgwqDCoMKg
wqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiANCj4gVGhlIHNhbWUgaXNzdWUgc2Vl
bXMgdG8gYXBwbHkgd2l0aCB0aGUgdmVyc2lvbiB0aGF0IHdhcyBpbiAtbmV4dA0KPiBiYXNlZA0K
PiBvbiB2Ni40LXJjNCB0b28uDQoNClRoZSB2ZXJzaW9uIGluIHlvdXIgYnJhbmNoIGlzIG5vdCB0
aGUgc2FtZSBhcyB0aGUgdmVyc2lvbiBpbiB0aXAgKHdoaWNoDQpoYWQgYSBzcXVhc2hlZCBidWls
ZCBmaXgpLiBJIHdhcyBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgYnVpbGQgZXJyb3Igd2l0aA0KeW91
ciBicmFuY2guIEJ1dCBub3Qgd2l0aCB0aGUgb25lIGluIHRpcCByZWJhc2VkIG9uIHY2LjUtcmMx
LiBTbyBjYW4NCnlvdSB0cnkgdGhpcyB2ZXJzaW9uOg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGlwL3RpcC5naXQvY29tbWl0Lz9oPXg4Ni9zaHN0ayZp
ZD04OTkyMjNkNjljZTlmMzM4MDU2ZjRjNDFlZjg3MGQ3MDA0MGZjODYwDQoNCg0K
