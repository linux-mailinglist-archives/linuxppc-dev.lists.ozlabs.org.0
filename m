Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8566406A0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 13:19:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNsSC1p9rz3bgp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 23:19:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gjk6+Pwl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gjk6+Pwl;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNsRD6yCzz3bZ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 23:18:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669983497; x=1701519497;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qWa+Kur2jQ5MlArignsIH8fWCzc+jLJwTgkSLUsEoPw=;
  b=gjk6+PwlpDtlEl8pDclatgEUKlvqniebUYdpb1idCBrVyuB9igO6dHSB
   N6N90vMo87SseyajladcTAT71lXcXCq0D6Nz7TUQQM6JO7hws4l5exuw6
   8AECUtuU4qCTU0edxEHknzpDlMIgNcUpfgDhd/pcH9b8ESnzpBtC2LYVG
   YS635c2HTDPPYYIhYdy724iWj06Wl5w7CucV4Ti4Ps6xMigZG4mkasyMG
   6iK5TIkBnGH3Z1TLjg+FSq31kKmOtRYE72UEEdGogP6kpRUwCSCDM8NBh
   uQejwts3MVpkqsv+xks1A1bFMPn+w4iIK3uCHXsFoTT4f3dewFP6NysWL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="299307555"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="299307555"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 04:18:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="647150771"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="647150771"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP; 02 Dec 2022 04:18:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 04:18:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 04:18:13 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 04:18:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCYbOfnWkHhnhXlanORZv0GkAAShMe7+CzSoErvpZlrvRWOm3mnz0e2NREBSyVRoHhTsaWLO1Rc8xi1mbMzjAIZjHx+mew8ZkMW2jRP5Jd9f3IoBYNSij/3vJXwJqwHhHL03x1Op4+oBylrGy0s2tXcaY+U46Q4wHRSVy7y0YVWXNz0KCGA1Aa3xar/oY3NR27DhBGJfIBxuVPawB4dBmKYrnVjvbrYIoOlhjZmKy4JaonrBnwD+qPKnikEFfbXoKLfAsyRyFkDpkPAtQ0SZc7yepzR4LLTFruNgdPs57GdwIX7bqhu78IyHi31ViYjkU6xtNFD2HiFrWuakhOuelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWa+Kur2jQ5MlArignsIH8fWCzc+jLJwTgkSLUsEoPw=;
 b=cn5ufoqcvKzwuqUSU06Z/IvCKpItRmF4ppW02MIC2i/jmyPOy/fwLLH+DG1R7HvrbRAWCyvxhvsQVcUgzPO3Jbhp579oIPLxmC8iimlU1868U4+2p2vH7BAI5xTf8POd3kfsVqap4ddthcma4nM6RiI81fWnjj8QfVtRuvQ97iBQZigeoIpTV0lwt7JD/lEJOorDNKSL6tsufnyr13ockQLKJeGJdXQtcPj8FxEmSZgjWcsJQRkfn7kli4qHnsl6ZqRIFnZTcQfcQHi5eF8ESTqH+NyuP9ApCLgGf7QeARYlIM0IqpZoYcMx5LK7f7ZE3xS3HFcBGtQAnzbYzl98RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by PH0PR11MB5061.namprd11.prod.outlook.com (2603:10b6:510:3c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 12:18:09 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e%9]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 12:18:09 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "maz@kernel.org"
	<maz@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"Christopherson,, Sean" <seanjc@google.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "paul@xen.org"
	<paul@xen.org>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "anup@brainfault.org"
	<anup@brainfault.org>
Subject: Re: [PATCH v2 32/50] KVM: Drop kvm_arch_check_processor_compat() hook
Thread-Topic: [PATCH v2 32/50] KVM: Drop kvm_arch_check_processor_compat()
 hook
Thread-Index: AQHZBRD4AAO4K0Fx806/0+nncoA/qq5ahiQA
Date: Fri, 2 Dec 2022 12:18:09 +0000
Message-ID: <0df9141e73f5a1b2571c0ed491495058e09b26ed.camel@intel.com>
References: <20221130230934.1014142-1-seanjc@google.com>
	 <20221130230934.1014142-33-seanjc@google.com>
In-Reply-To: <20221130230934.1014142-33-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|PH0PR11MB5061:EE_
x-ms-office365-filtering-correlation-id: 6e6cfe30-f235-4ab2-9f30-08dad45f466c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nr58f4BErK021cqXtEggkGQLQ2Z1rcoceTMDpJFs8oj0cgkTsQIK7oKSGXUbRUCIDON6LjIgx/bdAeTGKqG0zagClSLS6U1AOZiQ1HkhIFw8wJ68rBtI/pGTSymdw0xh9ZXBGlGXFs9E8nvBFib7WMDidw406LZH1ikZTiAFjtuLxFURPZbZ3NGGdgxvD4q53rYyxJFjwlvveTXMoebT5Ww0yY71wJWb7H16lkeWsk2CODazm+MVSmWeRQgDvI5sm38a5xwETUKjFq0KjD2gopSfQcqlnrt+ZMJMe8dc79tNOumJ4S/OTvEYaHqCkjt7xDrRiDlD8WmK5AYdEUbOAn22pwljh25cEpuMASkdmzZ9qfja7XJyc2uTIJTzoXaB/hXVTJFT31FPfzLPwYLi4dlEN0u4WDJ+kHKh8AxNw0ZcXrnfB2uwJL+DKejk7Viso3Mzy+htgCPAGDv5pGhgGQLttdrFXN0Hj4cDEMMGM0xpNIfZMuq308YKNCr98Dk1lkKLJsuMw2qcIbex+ZD8mTt3DRRZ67FhkiZLxzHqXTFPfxPdmJ0f3Z+y/lneSaRcjWI+nl0eFFm0SAHZb3+nIgv0IzvomifuTGlhN2okAKQgO4y4DDxg+QfBSI2Hj9jNl0PjhFTELoLqGlCddSkTSuyL1NiCZ/Lj+3g3pUfTNUqWNvTwCViDSr8YG+mOA5iWpVTLMJvFrrcmAn0G8sZdNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199015)(2616005)(110136005)(6486002)(316002)(38070700005)(54906003)(36756003)(921005)(86362001)(107886003)(82960400001)(38100700002)(6506007)(83380400001)(186003)(26005)(122000001)(6512007)(7406005)(4001150100001)(478600001)(2906002)(64756008)(66556008)(66476007)(41300700001)(5660300002)(71200400001)(8936002)(66946007)(76116006)(66446008)(91956017)(7416002)(8676002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2RpcCtZblYzdUZwNjZQMXFxMFRXOEhqNzFETjFqZDNTZ2MvVUZXOFRaT2xJ?=
 =?utf-8?B?T2tBM08wTVNGN1F6bmh1ODdySWZ6TCtaK2lBODZRWnpKcHNEeTNqa3ltcXRR?=
 =?utf-8?B?SGpKRGxhbzF4dkVlK1ZMWFBIRmJCWFNLa2NIU0lDZjY5QThheW5yQzVBREJy?=
 =?utf-8?B?UEtHNTNuVytLYWJ3bUNRZkJlQVFoT2FWcVpCdTROUGV6ZjBpelk2VEFWTTFj?=
 =?utf-8?B?NjRVMy9NNFZUZ0grWEU3VlM2MzdZSzFOUjZ5NDE2ajVlakxYODdvY1pFbXI3?=
 =?utf-8?B?RXVyZlhGaFNocldYcFhRTzAyZ1lCNkV4Rldaai9YSnEySWlsT3ZvZEl5T1c1?=
 =?utf-8?B?dEE0bUJMaWc1QTU0NlQ5enRvc25iYUFUNEp3NGdnRFlvb1JxOFIrTW43YWx2?=
 =?utf-8?B?aWJMTXZQQVdUa0plU3NEWElNd1pxRGQ4cEhtWG4wQzdZamthRTZ1NG1ibVF6?=
 =?utf-8?B?UnlodHpGMnFlU1kyK1ZhUk5BUjhYVTQzaEJvbjBKZlRKbStaMzNEaWNoekVx?=
 =?utf-8?B?Q1k5R1hmMFI1a0lpenc0Yi9yQnEyaXBZS3czd3hMTWRnRGpzQ3ljZ3RrM0Rn?=
 =?utf-8?B?MTd3ZEVYTUV2bUlEQ2t0eHdrYWYyUThXcXJFdE85SmxhQkMvRU9OUWx3YzdL?=
 =?utf-8?B?R3BTTjVEay9JSjgvUTZ0WkhRQ2N4dlNieG9HY2ZLSEJwRjUzUnhQaHZGQ1Jv?=
 =?utf-8?B?L05WdjArTUxvMWw4Nld6L3Rnd0xOeTBhaENHbEhkZGVwMWI2MnViWGJqKzlW?=
 =?utf-8?B?QWVTRmpXVy85Tkg3TnZtMFV3dXdlaTU1S0Joc202dThpWXJXeTNWVjF6VC9z?=
 =?utf-8?B?bkY1Z2EySVpVN1FEbnFXR1Y1N1lBcEVua2x5TEdRYVd0MGU4SW4vbjRpM0VG?=
 =?utf-8?B?cWNzeXViNE1ONlFFOEJhM0t2ckJVNDlKVEUyTk1JMUE3RnRiby9VbDJiVm9v?=
 =?utf-8?B?UG1OeDJIMXVlTk96bGd2Q1ZDbW9QN2xwdWluMmk3OE4yckh0WlJqdHBwTWhn?=
 =?utf-8?B?VGZMa3VTcUkxS3F0cFlGNmpjdDI4bmYySVU3dFdkVFRxTzRHcXQvTVRic1V2?=
 =?utf-8?B?V25KVHR6WlFGMkpQaEVxTjVMWmdpcWJTQmFHTUJzU1MwRGEwRDdsQ1ZFVk1h?=
 =?utf-8?B?Z0R1b2tVRmora0ZERXN5M09ET2ZvbXZsWExnMWc0R29WSmlicHd4QmpxNDBs?=
 =?utf-8?B?RXNoS1l0NUxMNHlwTzAxT1NvWVE5T3FXaUlubldaUVZGaWdNbHIxYmdBeHNZ?=
 =?utf-8?B?ejBwV0dtSHkrUlpWZkRFUnBHMU1TQTFVRmtWM1ZVR0pFbHErdnlNZCt1ZWxO?=
 =?utf-8?B?djNELzVJR2ZLV3RYWW1IWFIyNWhLVjVMVTdscjNZOE1yZE9mN1BORHdtSkdt?=
 =?utf-8?B?cjBGSFdYRGF3RFRmeXlpalZ1SUttL2NWVU9NOEdZNDBPN2NJcitwN0JlYTZX?=
 =?utf-8?B?VWdlMFZkNnZaTCtoOGEyRzRqWHZwMHFOMmVlQzNJNlVrQU9uOUpXZGRKNng2?=
 =?utf-8?B?OUEvTTZONFpUTkdJVjZKOWRBNDhzSTF3SU1yS1ZWZTBHTUJRWXNtZXlENUtP?=
 =?utf-8?B?UzVlUjFJZklrM21TQmRFOS83alNtTGdPa2hMOXpGT1ZsRkQ3aXpSWnFxZlcv?=
 =?utf-8?B?QzhPQ0R2a3pjK1NnaDJqUllJRjFlcWFKYzc5ZU1EbnR5aTY2aENibGxmemd5?=
 =?utf-8?B?WWttRnlZeWpyMjFiUUtBd25xWDBzMCtIdFBrV0JjSUtvTW0xMm5RQS9GbXFh?=
 =?utf-8?B?MUhGbWFveW5yZWVDZzl4YW0xV0dCVjhZREkxaHlpN3hhMkxkaXBBeUltdjZO?=
 =?utf-8?B?Vks3eVM3NWgvbjlFa2hMMXRZU1NERDFXY1owR211eEMxMUtsZEYwdmdFUjRZ?=
 =?utf-8?B?YnFJRXJEOWtXQ1QycUpzWDZUek1rMWN5ZFl3REQ4aW9VMktpVFRNcVFieW5T?=
 =?utf-8?B?VTA5U2hQdjlHSkRhT3hKOUdCK0QxZklWQWxiNGx4cGtwRHFhazYvQ0xrYncr?=
 =?utf-8?B?WndDRUFqVVppWTI4S29HZVI3VmpzWDM4WkdwUFFRWmNmbFhqWEpEK1dVd3VS?=
 =?utf-8?B?dUptNDZPdE5YTzNkV3pUUVBqZWREdDdFekFzUXVkUGJpMFo4R1ZVN3dQSnY4?=
 =?utf-8?B?N011NXJhM0N2czlBaGFIUEJKTnFpaW1PMFpNRktNcU1SNG5XZGV3U3hZNXEz?=
 =?utf-8?B?MHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEFC7CFE950C6D4880AF14DF26CA9D36@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6cfe30-f235-4ab2-9f30-08dad45f466c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 12:18:09.4382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zA2ANdJrZUdTwtrJSsjKd2MOX8WmoSMFb9K0KgmiEBgB51kaDRnluPiasFPIDB63buxEdRs/sWsiIEtQD9buiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5061
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "Yao, Yuan" <yuan.yao@intel.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Gao,
 Chao" <chao.gao@intel.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "philmd@linaro.org" <philmd@linaro.org>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "cohuck@redhat.com" <cohuck@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "james.morse@arm.com" <james.morse@arm.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIyLTExLTMwIGF0IDIzOjA5ICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBEcm9wIGt2bV9hcmNoX2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXQoKSBhbmQgaXRzIHN1
cHBvcnQgY29kZSBub3cgdGhhdCBhbGwNCj4gYXJjaGl0ZWN0dXJlIGltcGxlbWVudGF0aW9ucyBh
cmUgbm9wcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5q
Y0Bnb29nbGUuY29tPg0KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEBsaW5hcm8ub3JnPg0KPiBSZXZpZXdlZC1ieTogRXJpYyBGYXJtYW4gPGZhcm1hbkBsaW51
eC5pYm0uY29tPgkjIHMzOTANCj4gQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVs
dC5vcmc+DQoNCkZvciB4ODYsDQoNClJldmlld2VkLWJ5OiBLYWkgSHVhbmcgPGthaS5odWFuZ0Bp
bnRlbC5jb20+DQoNCj4gLS0tDQo+ICBhcmNoL2FybTY0L2t2bS9hcm0uYyAgICAgICB8ICA3ICst
LS0tLS0NCj4gIGFyY2gvbWlwcy9rdm0vbWlwcy5jICAgICAgIHwgIDcgKy0tLS0tLQ0KPiAgYXJj
aC9wb3dlcnBjL2t2bS9ib29rM3MuYyAgfCAgMiArLQ0KPiAgYXJjaC9wb3dlcnBjL2t2bS9lNTAw
LmMgICAgfCAgMiArLQ0KPiAgYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYyAgfCAgMiArLQ0KPiAg
YXJjaC9wb3dlcnBjL2t2bS9wb3dlcnBjLmMgfCAgNSAtLS0tLQ0KPiAgYXJjaC9yaXNjdi9rdm0v
bWFpbi5jICAgICAgfCAgNyArLS0tLS0tDQo+ICBhcmNoL3MzOTAva3ZtL2t2bS1zMzkwLmMgICB8
ICA3ICstLS0tLS0NCj4gIGFyY2gveDg2L2t2bS9zdm0vc3ZtLmMgICAgIHwgIDQgKystLQ0KPiAg
YXJjaC94ODYva3ZtL3ZteC92bXguYyAgICAgfCAgNCArKy0tDQo+ICBhcmNoL3g4Ni9rdm0veDg2
LmMgICAgICAgICB8ICA1IC0tLS0tDQo+ICBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggICB8ICA0
ICstLS0NCj4gIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICAgIHwgMjQgKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+ICAxMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA2NyBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2t2bS9hcm0uYyBiL2FyY2gv
YXJtNjQva3ZtL2FybS5jDQo+IGluZGV4IDkzNmVmN2QxZWE5NC4uZTkxNWIxZDlmMmNkIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL2FybTY0L2t2bS9hcm0uYw0KPiArKysgYi9hcmNoL2FybTY0L2t2bS9h
cm0uYw0KPiBAQCAtNjMsMTEgKzYzLDYgQEAgaW50IGt2bV9hcmNoX3ZjcHVfc2hvdWxkX2tpY2so
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQ0KPiAgCXJldHVybiBrdm1fdmNwdV9leGl0aW5nX2d1ZXN0
X21vZGUodmNwdSkgPT0gSU5fR1VFU1RfTU9ERTsNCj4gIH0NCj4gIA0KPiAtaW50IGt2bV9hcmNo
X2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXQodm9pZCAqb3BhcXVlKQ0KPiAtew0KPiAtCXJldHVybiAw
Ow0KPiAtfQ0KPiAtDQo+ICBpbnQga3ZtX3ZtX2lvY3RsX2VuYWJsZV9jYXAoc3RydWN0IGt2bSAq
a3ZtLA0KPiAgCQkJICAgIHN0cnVjdCBrdm1fZW5hYmxlX2NhcCAqY2FwKQ0KPiAgew0KPiBAQCAt
MjI3Myw3ICsyMjY4LDcgQEAgc3RhdGljIF9faW5pdCBpbnQga3ZtX2FybV9pbml0KHZvaWQpDQo+
ICAJICogRklYTUU6IERvIHNvbWV0aGluZyByZWFzb25hYmxlIGlmIGt2bV9pbml0KCkgZmFpbHMg
YWZ0ZXIgcEtWTQ0KPiAgCSAqIGh5cGVydmlzb3IgcHJvdGVjdGlvbiBpcyBmaW5hbGl6ZWQuDQo+
ICAJICovDQo+IC0JZXJyID0ga3ZtX2luaXQoTlVMTCwgc2l6ZW9mKHN0cnVjdCBrdm1fdmNwdSks
IDAsIFRISVNfTU9EVUxFKTsNCj4gKwllcnIgPSBrdm1faW5pdChzaXplb2Yoc3RydWN0IGt2bV92
Y3B1KSwgMCwgVEhJU19NT0RVTEUpOw0KPiAgCWlmIChlcnIpDQo+ICAJCWdvdG8gb3V0X3N1YnM7
DQo+ICANCj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9rdm0vbWlwcy5jIGIvYXJjaC9taXBzL2t2
bS9taXBzLmMNCj4gaW5kZXggM2NhZGU2NDg4MjdhLi4zNmM4OTkxYjVkMzkgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvbWlwcy9rdm0vbWlwcy5jDQo+ICsrKyBiL2FyY2gvbWlwcy9rdm0vbWlwcy5jDQo+
IEBAIC0xMzUsMTEgKzEzNSw2IEBAIHZvaWQga3ZtX2FyY2hfaGFyZHdhcmVfZGlzYWJsZSh2b2lk
KQ0KPiAgCWt2bV9taXBzX2NhbGxiYWNrcy0+aGFyZHdhcmVfZGlzYWJsZSgpOw0KPiAgfQ0KPiAg
DQo+IC1pbnQga3ZtX2FyY2hfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdCh2b2lkICpvcGFxdWUpDQo+
IC17DQo+IC0JcmV0dXJuIDA7DQo+IC19DQo+IC0NCj4gIGV4dGVybiB2b2lkIGt2bV9pbml0X2xv
b25nc29uX2lwaShzdHJ1Y3Qga3ZtICprdm0pOw0KPiAgDQo+ICBpbnQga3ZtX2FyY2hfaW5pdF92
bShzdHJ1Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxvbmcgdHlwZSkNCj4gQEAgLTE2MzYsNyArMTYz
MSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGt2bV9taXBzX2luaXQodm9pZCkNCj4gIA0KPiAgCXJl
Z2lzdGVyX2RpZV9ub3RpZmllcigma3ZtX21pcHNfY3NyX2RpZV9ub3RpZmllcik7DQo+ICANCj4g
LQlyZXQgPSBrdm1faW5pdChOVUxMLCBzaXplb2Yoc3RydWN0IGt2bV92Y3B1KSwgMCwgVEhJU19N
T0RVTEUpOw0KPiArCXJldCA9IGt2bV9pbml0KHNpemVvZihzdHJ1Y3Qga3ZtX3ZjcHUpLCAwLCBU
SElTX01PRFVMRSk7DQo+ICAJaWYgKHJldCkgew0KPiAgCQl1bnJlZ2lzdGVyX2RpZV9ub3RpZmll
cigma3ZtX21pcHNfY3NyX2RpZV9ub3RpZmllcik7DQo+ICAJCXJldHVybiByZXQ7DQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szcy5jIGIvYXJjaC9wb3dlcnBjL2t2bS9ib29r
M3MuYw0KPiBpbmRleCA4NzI4M2EwZTMzZDguLjU3ZjRlNzg5NmQ2NyAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2t2bS9ib29rM3MuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva3ZtL2Jvb2sz
cy5jDQo+IEBAIC0xMDUyLDcgKzEwNTIsNyBAQCBzdGF0aWMgaW50IGt2bXBwY19ib29rM3NfaW5p
dCh2b2lkKQ0KPiAgew0KPiAgCWludCByOw0KPiAgDQo+IC0JciA9IGt2bV9pbml0KE5VTEwsIHNp
emVvZihzdHJ1Y3Qga3ZtX3ZjcHUpLCAwLCBUSElTX01PRFVMRSk7DQo+ICsJciA9IGt2bV9pbml0
KHNpemVvZihzdHJ1Y3Qga3ZtX3ZjcHUpLCAwLCBUSElTX01PRFVMRSk7DQo+ICAJaWYgKHIpDQo+
ICAJCXJldHVybiByOw0KPiAgI2lmZGVmIENPTkZJR19LVk1fQk9PSzNTXzMyX0hBTkRMRVINCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rdm0vZTUwMC5jIGIvYXJjaC9wb3dlcnBjL2t2bS9l
NTAwLmMNCj4gaW5kZXggMGVhNjExOTBlYzA0Li5iMGY2OTU0Mjg3MzMgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gvcG93ZXJwYy9rdm0vZTUwMC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rdm0vZTUwMC5j
DQo+IEBAIC01MzEsNyArNTMxLDcgQEAgc3RhdGljIGludCBfX2luaXQga3ZtcHBjX2U1MDBfaW5p
dCh2b2lkKQ0KPiAgCWZsdXNoX2ljYWNoZV9yYW5nZShrdm1wcGNfYm9va2VfaGFuZGxlcnMsIGt2
bXBwY19ib29rZV9oYW5kbGVycyArDQo+ICAJCQkgICBpdm9yW21heF9pdm9yXSArIGhhbmRsZXJf
bGVuKTsNCj4gIA0KPiAtCXIgPSBrdm1faW5pdChOVUxMLCBzaXplb2Yoc3RydWN0IGt2bXBwY192
Y3B1X2U1MDApLCAwLCBUSElTX01PRFVMRSk7DQo+ICsJciA9IGt2bV9pbml0KHNpemVvZihzdHJ1
Y3Qga3ZtcHBjX3ZjcHVfZTUwMCksIDAsIFRISVNfTU9EVUxFKTsNCj4gIAlpZiAocikNCj4gIAkJ
Z290byBlcnJfb3V0Ow0KPiAgCWt2bV9vcHNfZTUwMC5vd25lciA9IFRISVNfTU9EVUxFOw0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYyBiL2FyY2gvcG93ZXJwYy9rdm0v
ZTUwMG1jLmMNCj4gaW5kZXggNzk1NjY3ZjdlYmYwLi42MTE1MzJhMGRlZGMgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvcG93ZXJwYy9rdm0vZTUwMG1jLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2t2bS9l
NTAwbWMuYw0KPiBAQCAtNDA0LDcgKzQwNCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGt2bXBwY19l
NTAwbWNfaW5pdCh2b2lkKQ0KPiAgCSAqLw0KPiAgCWt2bXBwY19pbml0X2xwaWQoS1ZNUFBDX05S
X0xQSURTL3RocmVhZHNfcGVyX2NvcmUpOw0KPiAgDQo+IC0JciA9IGt2bV9pbml0KE5VTEwsIHNp
emVvZihzdHJ1Y3Qga3ZtcHBjX3ZjcHVfZTUwMCksIDAsIFRISVNfTU9EVUxFKTsNCj4gKwlyID0g
a3ZtX2luaXQoc2l6ZW9mKHN0cnVjdCBrdm1wcGNfdmNwdV9lNTAwKSwgMCwgVEhJU19NT0RVTEUp
Ow0KPiAgCWlmIChyKQ0KPiAgCQlnb3RvIGVycl9vdXQ7DQo+ICAJa3ZtX29wc19lNTAwbWMub3du
ZXIgPSBUSElTX01PRFVMRTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rdm0vcG93ZXJw
Yy5jIGIvYXJjaC9wb3dlcnBjL2t2bS9wb3dlcnBjLmMNCj4gaW5kZXggMDFkMGY5OTM1ZTZjLi5m
NWI0ZmY2YmZjODkgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rdm0vcG93ZXJwYy5jDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9rdm0vcG93ZXJwYy5jDQo+IEBAIC00NDAsMTEgKzQ0MCw2IEBA
IGludCBrdm1fYXJjaF9oYXJkd2FyZV9lbmFibGUodm9pZCkNCj4gIAlyZXR1cm4gMDsNCj4gIH0N
Cj4gIA0KPiAtaW50IGt2bV9hcmNoX2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXQodm9pZCAqb3BhcXVl
KQ0KPiAtew0KPiAtCXJldHVybiAwOw0KPiAtfQ0KPiAtDQo+ICBpbnQga3ZtX2FyY2hfaW5pdF92
bShzdHJ1Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxvbmcgdHlwZSkNCj4gIHsNCj4gIAlzdHJ1Y3Qg
a3ZtcHBjX29wcyAqa3ZtX29wcyA9IE5VTEw7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2
bS9tYWluLmMgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMNCj4gaW5kZXggNDcxMGE2NzUxNjg3Li4z
NGMzZGVjZTY5OTAgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21haW4uYw0KPiArKysg
Yi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMNCj4gQEAgLTIwLDExICsyMCw2IEBAIGxvbmcga3ZtX2Fy
Y2hfZGV2X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLA0KPiAgCXJldHVybiAtRUlOVkFMOw0KPiAg
fQ0KPiAgDQo+IC1pbnQga3ZtX2FyY2hfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdCh2b2lkICpvcGFx
dWUpDQo+IC17DQo+IC0JcmV0dXJuIDA7DQo+IC19DQo+IC0NCj4gIGludCBrdm1fYXJjaF9oYXJk
d2FyZV9lbmFibGUodm9pZCkNCj4gIHsNCj4gIAl1bnNpZ25lZCBsb25nIGhpZGVsZWcsIGhlZGVs
ZWc7DQo+IEBAIC0xMTAsNiArMTA1LDYgQEAgc3RhdGljIGludCBfX2luaXQgcmlzY3Zfa3ZtX2lu
aXQodm9pZCkNCj4gIA0KPiAgCWt2bV9pbmZvKCJWTUlEICVsZCBiaXRzIGF2YWlsYWJsZVxuIiwg
a3ZtX3Jpc2N2X2dzdGFnZV92bWlkX2JpdHMoKSk7DQo+ICANCj4gLQlyZXR1cm4ga3ZtX2luaXQo
TlVMTCwgc2l6ZW9mKHN0cnVjdCBrdm1fdmNwdSksIDAsIFRISVNfTU9EVUxFKTsNCj4gKwlyZXR1
cm4ga3ZtX2luaXQoc2l6ZW9mKHN0cnVjdCBrdm1fdmNwdSksIDAsIFRISVNfTU9EVUxFKTsNCj4g
IH0NCj4gIG1vZHVsZV9pbml0KHJpc2N2X2t2bV9pbml0KTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gv
czM5MC9rdm0va3ZtLXMzOTAuYyBiL2FyY2gvczM5MC9rdm0va3ZtLXMzOTAuYw0KPiBpbmRleCAy
NWIwOGI5NTY4ODguLjdhZDgyNTJlOTJjMiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9zMzkwL2t2bS9r
dm0tczM5MC5jDQo+ICsrKyBiL2FyY2gvczM5MC9rdm0va3ZtLXMzOTAuYw0KPiBAQCAtMjYyLDEx
ICsyNjIsNiBAQCBpbnQga3ZtX2FyY2hfaGFyZHdhcmVfZW5hYmxlKHZvaWQpDQo+ICAJcmV0dXJu
IDA7DQo+ICB9DQo+ICANCj4gLWludCBrdm1fYXJjaF9jaGVja19wcm9jZXNzb3JfY29tcGF0KHZv
aWQgKm9wYXF1ZSkNCj4gLXsNCj4gLQlyZXR1cm4gMDsNCj4gLX0NCj4gLQ0KPiAgLyogZm9yd2Fy
ZCBkZWNsYXJhdGlvbnMgKi8NCj4gIHN0YXRpYyB2b2lkIGt2bV9nbWFwX25vdGlmaWVyKHN0cnVj
dCBnbWFwICpnbWFwLCB1bnNpZ25lZCBsb25nIHN0YXJ0LA0KPiAgCQkJICAgICAgdW5zaWduZWQg
bG9uZyBlbmQpOw0KPiBAQCAtNTcxNiw3ICs1NzExLDcgQEAgc3RhdGljIGludCBfX2luaXQga3Zt
X3MzOTBfaW5pdCh2b2lkKQ0KPiAgCWlmIChyKQ0KPiAgCQlyZXR1cm4gcjsNCj4gIA0KPiAtCXIg
PSBrdm1faW5pdChOVUxMLCBzaXplb2Yoc3RydWN0IGt2bV92Y3B1KSwgMCwgVEhJU19NT0RVTEUp
Ow0KPiArCXIgPSBrdm1faW5pdChzaXplb2Yoc3RydWN0IGt2bV92Y3B1KSwgMCwgVEhJU19NT0RV
TEUpOw0KPiAgCWlmIChyKSB7DQo+ICAJCV9fa3ZtX3MzOTBfZXhpdCgpOw0KPiAgCQlyZXR1cm4g
cjsNCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMgYi9hcmNoL3g4Ni9rdm0v
c3ZtL3N2bS5jDQo+IGluZGV4IGQ3ZWExYzExNzVjMi4uZDlhNTQ1OTA1OTFkIDEwMDY0NA0KPiAt
LS0gYS9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jDQo+ICsrKyBiL2FyY2gveDg2L2t2bS9zdm0vc3Zt
LmMNCj4gQEAgLTUxMDMsOCArNTEwMyw4IEBAIHN0YXRpYyBpbnQgX19pbml0IHN2bV9pbml0KHZv
aWQpDQo+ICAJICogQ29tbW9uIEtWTSBpbml0aWFsaXphdGlvbiBfbXVzdF8gY29tZSBsYXN0LCBh
ZnRlciB0aGlzLCAvZGV2L2t2bSBpcw0KPiAgCSAqIGV4cG9zZWQgdG8gdXNlcnNwYWNlIQ0KPiAg
CSAqLw0KPiAtCXIgPSBrdm1faW5pdChOVUxMLCBzaXplb2Yoc3RydWN0IHZjcHVfc3ZtKSwNCj4g
LQkJICAgICBfX2FsaWdub2ZfXyhzdHJ1Y3QgdmNwdV9zdm0pLCBUSElTX01PRFVMRSk7DQo+ICsJ
ciA9IGt2bV9pbml0KHNpemVvZihzdHJ1Y3QgdmNwdV9zdm0pLCBfX2FsaWdub2ZfXyhzdHJ1Y3Qg
dmNwdV9zdm0pLA0KPiArCQkgICAgIFRISVNfTU9EVUxFKTsNCj4gIAlpZiAocikNCj4gIAkJZ290
byBlcnJfa3ZtX2luaXQ7DQo+ICANCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14
LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jDQo+IGluZGV4IDhkZWIxYmQ2MGMxMC4uYjZmMDhh
MGExNDM1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jDQo+ICsrKyBiL2Fy
Y2gveDg2L2t2bS92bXgvdm14LmMNCj4gQEAgLTg1OTIsOCArODU5Miw4IEBAIHN0YXRpYyBpbnQg
X19pbml0IHZteF9pbml0KHZvaWQpDQo+ICAJICogQ29tbW9uIEtWTSBpbml0aWFsaXphdGlvbiBf
bXVzdF8gY29tZSBsYXN0LCBhZnRlciB0aGlzLCAvZGV2L2t2bSBpcw0KPiAgCSAqIGV4cG9zZWQg
dG8gdXNlcnNwYWNlIQ0KPiAgCSAqLw0KPiAtCXIgPSBrdm1faW5pdChOVUxMLCBzaXplb2Yoc3Ry
dWN0IHZjcHVfdm14KSwNCj4gLQkJICAgICBfX2FsaWdub2ZfXyhzdHJ1Y3QgdmNwdV92bXgpLCBU
SElTX01PRFVMRSk7DQo+ICsJciA9IGt2bV9pbml0KHNpemVvZihzdHJ1Y3QgdmNwdV92bXgpLCBf
X2FsaWdub2ZfXyhzdHJ1Y3QgdmNwdV92bXgpLA0KPiArCQkgICAgIFRISVNfTU9EVUxFKTsNCj4g
IAlpZiAocikNCj4gIAkJZ290byBlcnJfa3ZtX2luaXQ7DQo+ICANCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYw0KPiBpbmRleCAzNTcxYmM5Njhj
ZjguLjU2NjE1NmIzNDMxNCAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jDQo+ICsr
KyBiL2FyY2gveDg2L2t2bS94ODYuYw0KPiBAQCAtMTIwNzEsMTEgKzEyMDcxLDYgQEAgdm9pZCBr
dm1fYXJjaF9oYXJkd2FyZV9kaXNhYmxlKHZvaWQpDQo+ICAJZHJvcF91c2VyX3JldHVybl9ub3Rp
ZmllcnMoKTsNCj4gIH0NCj4gIA0KPiAtaW50IGt2bV9hcmNoX2NoZWNrX3Byb2Nlc3Nvcl9jb21w
YXQodm9pZCAqb3BhcXVlKQ0KPiAtew0KPiAtCXJldHVybiAwOw0KPiAtfQ0KPiAtDQo+ICBib29s
IGt2bV92Y3B1X2lzX3Jlc2V0X2JzcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpDQo+ICB7DQo+ICAJ
cmV0dXJuIHZjcHUtPmt2bS0+YXJjaC5ic3BfdmNwdV9pZCA9PSB2Y3B1LT52Y3B1X2lkOw0KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1f
aG9zdC5oDQo+IGluZGV4IDdkZGUyODMzM2U3Yy4uNjE2ZThlOTA1NThiIDEwMDY0NA0KPiAtLS0g
YS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9rdm1faG9z
dC5oDQo+IEBAIC05NTMsOCArOTUzLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGt2bV9pcnFmZF9l
eGl0KHZvaWQpDQo+ICB7DQo+ICB9DQo+ICAjZW5kaWYNCj4gLWludCBrdm1faW5pdCh2b2lkICpv
cGFxdWUsIHVuc2lnbmVkIHZjcHVfc2l6ZSwgdW5zaWduZWQgdmNwdV9hbGlnbiwNCj4gLQkJICBz
dHJ1Y3QgbW9kdWxlICptb2R1bGUpOw0KPiAraW50IGt2bV9pbml0KHVuc2lnbmVkIHZjcHVfc2l6
ZSwgdW5zaWduZWQgdmNwdV9hbGlnbiwgc3RydWN0IG1vZHVsZSAqbW9kdWxlKTsNCj4gIHZvaWQg
a3ZtX2V4aXQodm9pZCk7DQo+ICANCj4gIHZvaWQga3ZtX2dldF9rdm0oc3RydWN0IGt2bSAqa3Zt
KTsNCj4gQEAgLTE0NjAsNyArMTQ1OSw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fY3JlYXRl
X3ZjcHVfZGVidWdmcyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpIHt9DQo+ICANCj4gIGludCBrdm1f
YXJjaF9oYXJkd2FyZV9lbmFibGUodm9pZCk7DQo+ICB2b2lkIGt2bV9hcmNoX2hhcmR3YXJlX2Rp
c2FibGUodm9pZCk7DQo+IC1pbnQga3ZtX2FyY2hfY2hlY2tfcHJvY2Vzc29yX2NvbXBhdCh2b2lk
ICpvcGFxdWUpOw0KPiAgaW50IGt2bV9hcmNoX3ZjcHVfcnVubmFibGUoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KTsNCj4gIGJvb2wga3ZtX2FyY2hfdmNwdV9pbl9rZXJuZWwoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KTsNCj4gIGludCBrdm1fYXJjaF92Y3B1X3Nob3VsZF9raWNrKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSk7DQo+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0v
a3ZtX21haW4uYw0KPiBpbmRleCBhNGExMGEwYjMyMmYuLjM5MDBiZDNkNzVjYiAxMDA2NDQNCj4g
LS0tIGEvdmlydC9rdm0va3ZtX21haW4uYw0KPiArKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jDQo+
IEBAIC01ODMzLDM2ICs1ODMzLDE0IEBAIHZvaWQga3ZtX3VucmVnaXN0ZXJfcGVyZl9jYWxsYmFj
a3Modm9pZCkNCj4gIH0NCj4gICNlbmRpZg0KPiAgDQo+IC1zdHJ1Y3Qga3ZtX2NwdV9jb21wYXRf
Y2hlY2sgew0KPiAtCXZvaWQgKm9wYXF1ZTsNCj4gLQlpbnQgKnJldDsNCj4gLX07DQo+IC0NCj4g
LXN0YXRpYyB2b2lkIGNoZWNrX3Byb2Nlc3Nvcl9jb21wYXQodm9pZCAqZGF0YSkNCj4gK2ludCBr
dm1faW5pdCh1bnNpZ25lZCB2Y3B1X3NpemUsIHVuc2lnbmVkIHZjcHVfYWxpZ24sIHN0cnVjdCBt
b2R1bGUgKm1vZHVsZSkNCj4gIHsNCj4gLQlzdHJ1Y3Qga3ZtX2NwdV9jb21wYXRfY2hlY2sgKmMg
PSBkYXRhOw0KPiAtDQo+IC0JKmMtPnJldCA9IGt2bV9hcmNoX2NoZWNrX3Byb2Nlc3Nvcl9jb21w
YXQoYy0+b3BhcXVlKTsNCj4gLX0NCj4gLQ0KPiAtaW50IGt2bV9pbml0KHZvaWQgKm9wYXF1ZSwg
dW5zaWduZWQgdmNwdV9zaXplLCB1bnNpZ25lZCB2Y3B1X2FsaWduLA0KPiAtCQkgIHN0cnVjdCBt
b2R1bGUgKm1vZHVsZSkNCj4gLXsNCj4gLQlzdHJ1Y3Qga3ZtX2NwdV9jb21wYXRfY2hlY2sgYzsN
Cj4gIAlpbnQgcjsNCj4gIAlpbnQgY3B1Ow0KPiAgDQo+ICAJaWYgKCF6YWxsb2NfY3B1bWFza192
YXIoJmNwdXNfaGFyZHdhcmVfZW5hYmxlZCwgR0ZQX0tFUk5FTCkpDQo+ICAJCXJldHVybiAtRU5P
TUVNOw0KPiAgDQo+IC0JYy5yZXQgPSAmcjsNCj4gLQljLm9wYXF1ZSA9IG9wYXF1ZTsNCj4gLQlm
b3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkgew0KPiAtCQlzbXBfY2FsbF9mdW5jdGlvbl9zaW5nbGUo
Y3B1LCBjaGVja19wcm9jZXNzb3JfY29tcGF0LCAmYywgMSk7DQo+IC0JCWlmIChyIDwgMCkNCj4g
LQkJCWdvdG8gb3V0X2ZyZWVfMjsNCj4gLQl9DQo+IC0NCj4gIAlyID0gY3B1aHBfc2V0dXBfc3Rh
dGVfbm9jYWxscyhDUFVIUF9BUF9LVk1fU1RBUlRJTkcsICJrdm0vY3B1OnN0YXJ0aW5nIiwNCj4g
IAkJCQkgICAgICBrdm1fc3RhcnRpbmdfY3B1LCBrdm1fZHlpbmdfY3B1KTsNCj4gIAlpZiAocikN
Cg0K
