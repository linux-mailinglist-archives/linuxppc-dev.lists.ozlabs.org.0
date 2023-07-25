Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F087627A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 02:12:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jDKTn8h6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9Z9P25Mpz3cYZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 10:12:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jDKTn8h6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=wei.w.wang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 26 Jul 2023 01:10:49 AEST
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9L7s5Q0Jz30Py
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 01:10:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690297850; x=1721833850;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=svwxbkWzcDLm+Jsk/Paivuy6EYxB/8JxGtdsVddH+ug=;
  b=jDKTn8h6YL/67sR7zpL69iz/uTck5tjSMjcEcw6jkFe987bp/g/T6KYm
   zGss+3ByVYaSt87yHjWT0vCn/lYiflu1ajr/3DzwTzZjYQLfmb4vAUWeN
   IJ8s1DYy37B3NLeVx8aolCk2mFZjfnbzbhCIjo4+cQWsUh4GGcCL06Z3b
   4D/YfCH+SyZi2X4KL2qFH5r/0YPkk2V5G6jEsqrzghfmtVX0wfuAFqfww
   /hleZzVdzRmarFpmgqjpw2eh8hf5DPszX2+HCYiDjF+tY42QYazeGvjS9
   uEuXilOB0p9bV5dTdfpVn9E9vZaRgZwjGkrj/hvRwSsTjglhbO6ufFvnA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="348028968"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="348028968"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 08:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720088314"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="720088314"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga007.jf.intel.com with ESMTP; 25 Jul 2023 08:09:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 08:09:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 08:09:32 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 08:09:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMHqZcPJv2nNkJeEvLssklcmRr3sn9hO4JIgLPBy1XAmqnHY49D7YAxfuyjVqAG00pL8gx+c6pdcsNLDg1rVksYN4gb5ixsqr1q3nbNV94inX+AnB/ywwvOGT7zCyaP+EA1lIZOYV7L8/bAeTaucszyP+lvimZ+7Psrmjg2gwHvwNeNhNl8ylRnTaCHHWPUmNqONfE58zAgEvPQSmx16MMJCmmHJZXzglBHiEmZpi6uAx6FUfDWenY9oBTwUTekmWZlF5x237RrN+0LHPcwLFdFS28oWYsd3Li+xoznkhldYCR3a9GsuMLXyHLW/JRWX9L2QCAnnQoWJmjwHEISlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svwxbkWzcDLm+Jsk/Paivuy6EYxB/8JxGtdsVddH+ug=;
 b=Xq/XJUGEzyawcU7x6mT7D+UmCUQ5hTB/6HCTE3CdzyQLllDOioblpRaa5rBZ5zPyalYjJjYVAP6mjn/Q7ouyXb1sIAacSh5BhtkbT6LJnaAkHnBaq/tt6O+jKcosv6zQM8PyeolVrpBG6/C3lTcTjICSeWIBOM/awsph2vBnkWPcd531wjcPpplWDGtFTxpA6orxK7G6x3W8rAI9iWU00yP6RPiIaky8UevNNOdIy+OoTjjZtH1VCRp2h4FIy5MdkK/ZJtj6G2CHiCl/VqrQP6xikubz+hQnkjMdwIF+wX/oyxYrEeRfsm7knWBrdkQWIvnvx3To3Y6WD0G9r63GQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6373.namprd11.prod.outlook.com (2603:10b6:8:cb::20) by
 SN7PR11MB6752.namprd11.prod.outlook.com (2603:10b6:806:264::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Tue, 25 Jul
 2023 15:09:30 +0000
Received: from DS0PR11MB6373.namprd11.prod.outlook.com
 ([fe80::ace1:c0df:7dd9:d94a]) by DS0PR11MB6373.namprd11.prod.outlook.com
 ([fe80::ace1:c0df:7dd9:d94a%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 15:09:29 +0000
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: "Christopherson,, Sean" <seanjc@google.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton
	<oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Paul Moore
	<paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn"
	<serge@hallyn.com>
Subject: RE: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
Thread-Topic: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl()
 for guest-specific backing memory
Thread-Index: AQHZudJw1MgLsjkkR0ChgAdWyO82ca/KHE2g
Date: Tue, 25 Jul 2023 15:09:29 +0000
Message-ID: <DS0PR11MB637386533A4A10667BA6DF03DC03A@DS0PR11MB6373.namprd11.prod.outlook.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-13-seanjc@google.com>
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6373:EE_|SN7PR11MB6752:EE_
x-ms-office365-filtering-correlation-id: 55702571-eaf1-4cae-24c5-08db8d2124fb
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pVGFVP1VpDwzcXIHzTURjZthNh7Dnz3IVsOZesWsayGWL1ztMoq3pRcl3w2N3W9BwDeDv6yoJUE7efWHxYciv9a85kQnb1eFQhGmGd86cIxVjZ8OA7ctNyTcgVXIaYb8yK3VB/e/SpCv1mibAfa+zNNzqif1JqB0YTBpZn3Ltqbvepi+uK6lhE1W22G4Svgfj934NGTwA5cEb1mjZJwgVY/bb2Hqzgv75OVbwAs4d7F41UDWRIR7v3WDfdvyYjVDFxyJN/sq3GnlDcDlm/n8h0jydZq91v9h3vllDh427jXcee38Ojn2WghcSkaQXJ0OQ0CYD3DrADdymwrCML8x6y05xn/SPUWY1kjBxh9Woz7ONpgjAVcHVX7/7AeKml+lSxqQ/czSfjJmkpah+xzsIg8b83VZNIO8axf7cO/f0S/QEeW4y66HhT/eEX1Ydn2Xl5pZOHUsuUctrnF24emQKKbN/y4Tqy0+pqxhy01Y9TRyaAFTVn6VQz2MoxsgYYna2Lkr15gl57jZ4rmEWOI7okfIBQIqzzk6hmrioftj91hLUSHLJkYFxWbkbjXAFIU+buXaU4eBQcolHFDfjBslYXmDoziRwq5PS4rJSDagqrv0IgumGC3Dkx5t0syBfzuaXnSQaYTslir49SfjljYWlQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6373.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199021)(54906003)(53546011)(478600001)(9686003)(7696005)(55016003)(71200400001)(26005)(6506007)(86362001)(186003)(110136005)(921005)(64756008)(66476007)(66556008)(4326008)(316002)(66446008)(76116006)(7406005)(7416002)(122000001)(82960400001)(38070700005)(52536014)(8676002)(38100700002)(66946007)(5660300002)(2906002)(33656002)(41300700001)(83380400001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkJ6T2hnbzZnd0xLZFJyR2Y4SnNjOWRtREhaUVJzL2MzdkRQVmNIQ1RKcmRP?=
 =?utf-8?B?dDc3a1dJdWFRVVVHN2hDMnEyNE5yVFZUSWdlZHN4YXIxVW1EbDZpR055UGJU?=
 =?utf-8?B?ZHRVZm0rQUQwK1creG05M0NBNHNUWE1BWEoxeHNtQ0cvWjlxMmxsNWo5MjVI?=
 =?utf-8?B?VXRpeUpabnJheXF0Nkh6QjQwOEI0TXc0bWFtWmNqNUZjZTA2bXU0YWV2Rkhl?=
 =?utf-8?B?YjRqOFZBZnE5YmwxSnVaU0hsazU1bUova053WWZPR0xUNVZtd29OeFZPOStp?=
 =?utf-8?B?UnUxbHhONjBqT01pL0cvQzBMcDVBMkpLeVBCSjNMb0JOVCswZ0ZMNlo5dEtp?=
 =?utf-8?B?eFZIUzBEdW1Va1dQbnVpT2w3MlBCcjRxdVVtc29BNXBFemFLaVFPT0lGcXNl?=
 =?utf-8?B?U0NubmM0OUxDM3F3ZGpmQkhuYXpKbktNVDVhM2pTSllFKzZ0UnVudUlCRnJo?=
 =?utf-8?B?bWlGS1FvVmttYzJGb1pNVVdtS2g1Y2lDN3pqK01GU2sySCtpbHd0VC80cTJV?=
 =?utf-8?B?dENaekxsUU5JeTR4Z2Z0aU1KT1lpbmJpV1lyS3JYdVU0YnJucStkWGcvakJi?=
 =?utf-8?B?RGdKdTgxVVAvczJsMjczdWRBS24vZGlESFJSeVYwRjZURk9JbXU1SUE2ZFVM?=
 =?utf-8?B?U3JRTFdxanVGaDJPbGlkNzB6ZEZmb1kvUFRDdTFBREwyZDIzcGtpUzdPN2h3?=
 =?utf-8?B?dlNVdEJmczVWRlN6RlJ2bWxWZTBaQmU0VFdvY1cySHBtOGFWbHFQZm5wSm80?=
 =?utf-8?B?MDAvODFqeENmRkhyK0FPNExzNHRZMmVQSFJFRWpOWU1vbUhsbDdZV2FtdDNE?=
 =?utf-8?B?UWs3Z1l3OEVBNXVsZ25oR0lVSVgwTXJTdUhFaXRJRmcwbnNMT3RGZVZXbVRH?=
 =?utf-8?B?V3oxNFp0b2QzUUo0U21PU2dMamVXNElxOUZyNkxWVVBDbzQ1SzRaMWxndzMx?=
 =?utf-8?B?dlVPdHlFa2xaUDVzb0FOYlNlUEN1Qkw5Mjh0OHNlbS92NHZDWWVKRmFJeTJq?=
 =?utf-8?B?eEw5TWMxMXM0M2ZOQ25Xb285MHR4aGQvS0hTQ0NGeVFPQ1dvOS9LL0dFZEZv?=
 =?utf-8?B?a2pKQXp0NFczMU1hQk1lN3BkN3ROeE5DbGhqbC9PdGl2T1FuQjFjajZ5VWVW?=
 =?utf-8?B?UXhaam9PdUpWZjlWbnNYWHJSSHF1cmprM05XNWJlcy9rYmFBVnhsby9vZ3NV?=
 =?utf-8?B?QlFYakdMcVRnTXhUNTVYSjYzdGtScndRUHlLc29PVDFjWlVFY2E2b0V5VkFr?=
 =?utf-8?B?YmVIM3U4S0NIc3A4cmVIYkFYYWhjT2ZLbjh3M0dYV2ZCelp0bzNHLzJXSlRW?=
 =?utf-8?B?VU1LTXBQL21xWVRRK3RBbFo2Ym5uOWkzMlBSMXcvN3FzL3JDektpTzZyMFV1?=
 =?utf-8?B?TWlVTUh4VUdXN2tPdXQwK0Q2TWJWdUM3cENDYlVqaERMb3Qza25XMEFOZjQx?=
 =?utf-8?B?OWR3a1NHUTNlbEsxajV0OGNZdVF0b2UxQjVHeUtwZTVJUkIwYkI3OXZMUVpv?=
 =?utf-8?B?V2J3OFpNMnpPWkF6ck5pNVg4N3Y4TjhtbzdhQTl3azBzd2hiaVhvVk1uWU16?=
 =?utf-8?B?QVJYRnVFU2djTk4xYmpxeEhnZXAyNXdheHBZQjVUQlo5NmN5VVhuVGRlZ1hq?=
 =?utf-8?B?NXR2L1RwQjZ4SUtYaFBVVlUyZHNvQ0Fqd0dLYzI4clF6SzhpRmQ5elB4WHNH?=
 =?utf-8?B?OUd4NkErcjdVSlRuM1dYWjdoSUZDcURaaXBRTzdCcWo1aGFpcGdlYWxBVm1S?=
 =?utf-8?B?bkdJZVQxOTcvb1kraFhUL0d1MGcwem5ZSGRpZkI5dllUME9vNTZHQThtNUxO?=
 =?utf-8?B?WVdPcEhaU25sb04vWGlRMjJ4YVVBQVhvbDNMM1ZobHRDTjM0dHdOU2JHOUdC?=
 =?utf-8?B?ZUpJZFhnSnIyM0pLUmtqTmRncUwrRTFiYy8vU3NQaU9wUWZUbUNTVDA2Y1U1?=
 =?utf-8?B?c2dmTUNlaHFrdVlVcVNUVUhmaU40S3QreFFUdlV6cXpGZjRONWFoVnhJVGdS?=
 =?utf-8?B?RTZrU20yclduSDRMNFZyd3BrSVRRVUFLWUh6SW81cFBiV0ozdExpZE1zeTgr?=
 =?utf-8?B?MGQwQ2VJVThSc2dOUHh0L2dYb0ZrbkVJMXFqTXhiaVRQdWUxSWREbU5POEhX?=
 =?utf-8?Q?guUos7oB1DO0TgiD8yOPdyoxD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55702571-eaf1-4cae-24c5-08db8d2124fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 15:09:29.6715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +CvbB+1DDP9yevWYvsQxktvLyAcvn7oEVnbPATMynuybFcPnYBU69i5trVKLywUcEcV4UdXDZqsXi2HI++TiXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6752
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 26 Jul 2023 10:11:06 +1000
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Chao Peng <chao.p.peng@linux.intel.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Isaku Yamahata <isaku.yamahata@gmail.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, Vlastimil Babka <vbabka@suse.cz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Quentin Perret <qperret@google.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "linux-fsdevel@v
 ger.kernel.org" <linux-fsdevel@vger.kernel.org>, Liam Merwick <liam.merwick@oracle.com>, "Annapurve, Vishal" <vannapurve@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkbmVzZGF5LCBKdWx5IDE5LCAyMDIzIDc6NDUgQU0sIFNlYW4gQ2hyaXN0b3BoZXJzb24g
d3JvdGU6DQo+ICtpbnQga3ZtX2dtZW1fZ2V0X3BmbihzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBr
dm1fbWVtb3J5X3Nsb3QgKnNsb3QsDQo+ICsJCSAgICAgZ2ZuX3QgZ2ZuLCBrdm1fcGZuX3QgKnBm
biwgaW50ICptYXhfb3JkZXIpIHsNCj4gKwlwZ29mZl90IGluZGV4ID0gZ2ZuIC0gc2xvdC0+YmFz
ZV9nZm4gKyBzbG90LT5nbWVtLnBnb2ZmOw0KPiArCXN0cnVjdCBrdm1fZ21lbSAqZ21lbTsNCj4g
KwlzdHJ1Y3QgZm9saW8gKmZvbGlvOw0KPiArCXN0cnVjdCBwYWdlICpwYWdlOw0KPiArCXN0cnVj
dCBmaWxlICpmaWxlOw0KPiArDQo+ICsJZmlsZSA9IGt2bV9nbWVtX2dldF9maWxlKHNsb3QpOw0K
PiArCWlmICghZmlsZSkNCj4gKwkJcmV0dXJuIC1FRkFVTFQ7DQo+ICsNCj4gKwlnbWVtID0gZmls
ZS0+cHJpdmF0ZV9kYXRhOw0KPiArDQo+ICsJaWYgKFdBUk5fT05fT05DRSh4YV9sb2FkKCZnbWVt
LT5iaW5kaW5ncywgaW5kZXgpICE9IHNsb3QpKSB7DQo+ICsJCWZwdXQoZmlsZSk7DQo+ICsJCXJl
dHVybiAtRUlPOw0KPiArCX0NCj4gKw0KPiArCWZvbGlvID0ga3ZtX2dtZW1fZ2V0X2ZvbGlvKGZp
bGVfaW5vZGUoZmlsZSksIGluZGV4KTsNCj4gKwlpZiAoIWZvbGlvKSB7DQo+ICsJCWZwdXQoZmls
ZSk7DQo+ICsJCXJldHVybiAtRU5PTUVNOw0KPiArCX0NCj4gKw0KPiArCXBhZ2UgPSBmb2xpb19m
aWxlX3BhZ2UoZm9saW8sIGluZGV4KTsNCj4gKw0KPiArCSpwZm4gPSBwYWdlX3RvX3BmbihwYWdl
KTsNCj4gKwkqbWF4X29yZGVyID0gY29tcG91bmRfb3JkZXIoY29tcG91bmRfaGVhZChwYWdlKSk7
DQoNCk1heWJlIGJldHRlciB0byBjaGVjayBpZiBjYWxsZXIgcHJvdmlkZWQgYSBidWZmZXIgdG8g
Z2V0IHRoZSBtYXhfb3JkZXI6DQppZiAobWF4X29yZGVyKQ0KCSptYXhfb3JkZXIgPSBjb21wb3Vu
ZF9vcmRlcihjb21wb3VuZF9oZWFkKHBhZ2UpKTsNCg0KVGhpcyBpcyB3aGF0IHRoZSBwcmV2aW91
cyB2ZXJzaW9uIGRpZCAocmVzdHJpY3RlZG1lbV9nZXRfcGFnZSksDQpzbyB0aGF0IGNhbGxlcnMg
d2hvIG9ubHkgd2FudCB0byBnZXQgYSBwZm4gZG9uJ3QgbmVlZCB0byBkZWZpbmUNCmFuIHVudXNl
ZCAib3JkZXIiIHBhcmFtLg0K
