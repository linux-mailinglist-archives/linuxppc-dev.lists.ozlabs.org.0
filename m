Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3C462B0BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 02:48:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBmCY34Hwz3cMY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 12:48:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BWoP87An;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BWoP87An;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBmBY0Jrtz3bjw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 12:47:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668563237; x=1700099237;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Mau0LE7ACRC5uxvYPmJkveKAExIXw120xLwnM8PzuPE=;
  b=BWoP87AnwmWnwPB6NssJu7bADuNjIyw2vaA8bxuQGm7DLUUaeFWKsP1u
   XHKMbbodlg8ogEAyi9jDnd7Pk7XgD6Bu238T/NgJ0oQZDzLL/GWSjI8uf
   1JLvWoA/ZrPMsxiaqOTO+T/YQCfm9ooKu577T/zKtiR/n00UPHGJsaUNX
   oVXfSQwKzuhac7D0Ih8IV4aE+cyIhZuiwmJD565/hHzFkLxWfXbc622Sp
   632aTc0EABoIRFrqUjYUMLB0/Jme2Iq0BnJf1KsPtr8yza4AI06If8AVb
   AcmnH0pdcFm5zdDSXTG1mBs4/NDKVsWaMe2qtnW9WkD5HdRGRGlfvk4aW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="376688937"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="376688937"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 17:47:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="813897182"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="813897182"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2022 17:47:07 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 17:47:06 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 17:47:06 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 17:47:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 17:47:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BM+WtL8obOtiBXd9s/gKH5TunKtCi5IfUm2Kd7N9EgqLp9l4lhUhdnGia3ZGA6skXLzvd1gCW5/q4euUTpV16/iGfK07s8q2xo/NreTMbamLYY+ScPxqivUKwpE2JX1Ul36r4MBD7UukHeKyvPnCJ8c656YF9nirtPBEWU9SAC8cmFaB2jXslKfwiKf1g1UXLPv5fMJd7s+AZMyLg/SOa7eaGGAoTCGQrBmvWtAU3u9qiOChIcBxo5BtNscrM+YJB+0ihtGUeeUJX+/C+oUkz2PQr+eVVGOrxeUf7JPb88RURuLVU8NUWEht8k/aiwUdC1N0PM5V/FqNmbVXg8lf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mau0LE7ACRC5uxvYPmJkveKAExIXw120xLwnM8PzuPE=;
 b=imD6LkY7pP4SLhptmtE6Y0gQMAtWCMrUwycL4OmIsvryoF5jXRBSkdPsZPAl271XLjhpbSNoQhtczhDJfsoIRjrn8KSlGSfztx4ILZtIO4iTVUZHC/sfug7+aph+tlEL5u5zAv/y5elKiKrt6zBvgE8fnVS9z3B8v2FBMswPLQiXitgTnYUVzC2/KWXdRAKb/0YCykDMdpKUASBoPXQZ0tprTG86Ni1ziMfXB/S4SFEHAx4sv76pN9ZRVRTkCBy33AzvEhcbNXl44MiUOa42soKDg8/4IHcpwYoDweqDgfXsmdbadnKAlxNDpjidrfht3YGuFDvcol2EWABcxDXRmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by BL1PR11MB5955.namprd11.prod.outlook.com (2603:10b6:208:386::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 01:46:52 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e%9]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 01:46:52 +0000
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
Subject: Re: [PATCH 13/44] KVM: x86: Serialize vendor module initialization
 (hardware setup)
Thread-Topic: [PATCH 13/44] KVM: x86: Serialize vendor module initialization
 (hardware setup)
Thread-Index: AQHY7xHq2cS0mXAh8EqkP3LwhIvmL65A3HGA
Date: Wed, 16 Nov 2022 01:46:51 +0000
Message-ID: <e8e3b4c7bf3bd733c626618b57f9bf2f1835770e.camel@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-14-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-14-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|BL1PR11MB5955:EE_
x-ms-office365-filtering-correlation-id: ba13ab62-4e14-4773-a7a4-08dac7746ef2
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WZCT0SncC51GO28yUD+xZHv0F4f2xc+3Ke3MQyn8WbqwtI+86vkq/Ld3DvGoYtuj9/8awapGgAqMGb2Y1j5sUz8rWx233IuZV1NkW1nmCKLfJlv9dV7Fl10boHcuDdlHKvlXJkdUeodxyOD0neUoXoKYSG3SkHReH3KAV2e7tFC9QxpJ2arwPfobyI5XqSkxt6986GJSPhEqGay9V0QMF2JAYMUSmET3ijSDDn/96rIMfEsmUSvt/Sqt/GzbgohJ5lVlyi6igdM8HGmX44sz3ChRq6lQLugozcqY47cEs57J+jfiSB+3OVRMbLOd6m/wnDg+/53BmP5DZnZtvmm6xhjprt3LsmQbh6M14fpNYDF+3FASrqur4Ifjkruvg69UcI1C5Y9ORQpjZCaBQEHfxzMmzvOGPQ2CkNX1/pBojI/JGB+J612DsHTRdhjQWkHAnCSZtVsemoU1cnRe9BOhKlwCSFzOJvZx6jGgwayb4GUSKzg/q9Qegt6ipiWWwdYRlf6naIA5AUrJhqVDyu5KdDW0NbXBFiERHP6V47zXLy4+XqGhFqakdQLjtoS3HmW2xqzlzU4qC6HmhF9npPUBA5UodXCB7ZB7FknpQ42f7k+9l54lcyjp8Zpad3edk30ae0byU4EE6t42FlXPayWcNwsbHrLtAs6glZcHaOP7swghjVkXdzxnL2fB2iqF0allyj1N95bliC6EAG0fY1hMbR7y3WXRbYbSCvu3oDWDFFSAbW7fu2xvPaPRZvwys78Efe9GMJFwASOvTMnYdW/PzXvYAdIPJoJ0YPpJQBoWqfc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(39860400002)(366004)(376002)(396003)(451199015)(71200400001)(478600001)(122000001)(6486002)(110136005)(54906003)(76116006)(186003)(316002)(26005)(6512007)(83380400001)(66556008)(4326008)(64756008)(8676002)(36756003)(2616005)(66946007)(66476007)(8936002)(91956017)(66446008)(41300700001)(38070700005)(921005)(38100700002)(5660300002)(82960400001)(7416002)(7406005)(6506007)(86362001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmsvRGt0LzhNeU54QWk4Um0xNmNmQThVQUpla2lCK2VwRnduQjRxWk1VOHdy?=
 =?utf-8?B?WlB3SkFOV2RZNUs3YW5JVnNwcU5xTENwWWJ4c1Q2a2JtL3VuV3Q1RXI2SW5s?=
 =?utf-8?B?ZDVEWVZ4SmpJVThLdlY5dXdpS1dndmZHUVFiVi9DTk9Xem96MjJjT0o0WmpV?=
 =?utf-8?B?bWNLN0FTTytWeVRQSEtJaUs2eERjSmNkbzNiUFVDR3o0S2pDTEMrT0J0aC9F?=
 =?utf-8?B?a3dDSS9sSG84TmU3Q0Irai81STJIQ0FmVGMwOWVtUTRLTGZEeEpFSnJia0U4?=
 =?utf-8?B?ekFyWGNxRlBJMXE1K0tyZjc5SWtOd2xvZ0toN0gxQS9KS3czUHlsbGhETFJu?=
 =?utf-8?B?VXhoTHhZVVpLZUZUbm4vVXNKTG5GanJIc2NERFNxVXlZS1J5bVVlcmh0NUxS?=
 =?utf-8?B?d2Q5ZzZzUWE5Yk1rSDNhcXNOcHhSVUp0dm1BT2ZDK0t0ano3MVI3UzdLT2Z5?=
 =?utf-8?B?Zy9WcnFFWWN6a29WM1RmTDJYZnpGck8wdHN2RFpIOXNROFlwYlBRWWFDSHFS?=
 =?utf-8?B?WnZxc2NJdGNKMUFROUlEMjFjR0NpamtFakVEZTZaeVoxNFZERjBqWGVpck1F?=
 =?utf-8?B?Y3dIaEs4cTFnTG5KazZTNnAzVytFRHZHVG1JUGNFTEpjcDFVOE11aFBKT1dL?=
 =?utf-8?B?dkVpNUgyRENwYm5vazRacjJ2WWtqMU8rOTh6T2hFaXdkM2g2Mm82VC9zNHg3?=
 =?utf-8?B?Ky8wcUwxYmMrYnpVQUpnNXUzcWdUSVYySE4ySWh6YTFHUEhWS1N0S3VUYmJM?=
 =?utf-8?B?dDc2bCtzRVJuNWpKK0N1Zld1SVdKNFF6OW8zVm1YRTlZck43OXhtZmYvTkQw?=
 =?utf-8?B?RGFEMWUxT2w1ampKR0hoS3BQUG9oZkxTendQdmRmcW85aW1JYm56bDZuNjRy?=
 =?utf-8?B?MGxYWWJVQjR6akZEK3Q4bFRQczl3TGV4UE5SK1QvWG5SdFh1Zk93R1o3RVhO?=
 =?utf-8?B?d3prd0JLeHY2VWxxeGNRYXhKbWRJVU5uNWw4cVJKVndrTTdjSG1vaUNzSFFm?=
 =?utf-8?B?NWh5dXVaSGpVWTUxUXBvWjltNDU0OHhMTXBrV0RvaVAyWDNXeTIwYmIrQUtX?=
 =?utf-8?B?N2ZaV2prMWxBL3k2aVEzYUx1LzFHczdOUnZKUGJ6cExSMVlVRUd2cUNDaTB2?=
 =?utf-8?B?ckZUTm1rNHRsMUNzay83L1BNWDJZZHczMWdlaERCUkI2YjFxUGJ5ZzhYM0dI?=
 =?utf-8?B?VXBzVlR1TmR4RHlsRWJsSWJwVktLS1JxNGJCdmpRTXVUR1lJQ1hQb01ZQ3RP?=
 =?utf-8?B?azdJeXI2VzRncVppeTZ2eGtmV3dFeCtNb0l0ZXBnYy8zalhIdnRidXhMZG13?=
 =?utf-8?B?MmxsTUV3bkhNTmNyT2dNOWI2SXRKZzBJVVhuMWVkMEljeEFNLy9oRWppT1hL?=
 =?utf-8?B?SWpNWU5tdTVyTWZLK3d2TG1GbHhRSkZhK21yc1grVHlZQ2JxVWJXYXkrZFd1?=
 =?utf-8?B?VVNnVHQvem5VT2d5TVd2UEo3WklwNU5oRS9Kd25DS2hvRE0wQjljbDRPQjF5?=
 =?utf-8?B?VnJPRUpkOUNld0EzSzFhcHlXUUFReDQwSVRrVmlVWTN1am0yelBsUDI1WnZP?=
 =?utf-8?B?TDhvM3JWbFVkeHNVUDZubmFDUEp4RTdQem5vMnV2NTRPOWs1Q2J0MUJHdWdY?=
 =?utf-8?B?WXZ5SU9mMDhKaXBDZGduWEVuclliOXJxRS80c0tkd0tzaWNkVEN1SjBYZ0Ur?=
 =?utf-8?B?NmovQWFYb1V1K1lZbzNKdnRGQVZTRXZwMFQ5Q1UrbXpuclNySE5pNXlsSnJv?=
 =?utf-8?B?M1VOUmQ1Y3hZR1hZVHZyT3pXSUxyOUZjbFBWM1hXWW1CK21mb2NxcjdpR0VF?=
 =?utf-8?B?UWs2dHFLOEdhMTM5M0dZa0ttaldUSVhVSEh1K1dTeUR3YVBxSURHN0JJcGtq?=
 =?utf-8?B?eTRydk5EWGpmaVZibTllMXFkMTY4UDJJSDM0K0s0L1M3a1R1dm1JOTBHQU1F?=
 =?utf-8?B?aEE0U1lMQVZVN0trZWNQUUpGTXk2TUEzOGd1VVQ0TE9vTitVczN4UFlJRmJZ?=
 =?utf-8?B?N0dxbUUrcis2eC9iOVlVU2o0Sm14Nlhsa1Y0SzQrblh6RnJhNGNuNUJlM3RZ?=
 =?utf-8?B?NHpuK2JENmNNSlRVSGpjRThEWC9ualhDdXR6TDIyVXNHNjZiZEhZZk1WeldE?=
 =?utf-8?B?WmVrcFhoK05CRWhQQUJwS1QrUllXZWRvQVBDejd6QlM0R2FPbVBDdUxnM0d4?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EFCF1F2EBB7CE48AB9819352B425CDF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba13ab62-4e14-4773-a7a4-08dac7746ef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 01:46:51.7407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QKK1Ze0TAVAfwWgEyaoUrtbbVOPHC0I6JwVjIkCWtOO486x0EtRlFirBY/ui7f2i3e59aPw5QoBSkPS993g+Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5955
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

T24gV2VkLCAyMDIyLTExLTAyIGF0IDIzOjE4ICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBBY3F1aXJlIGEgbmV3IG11dGV4LCB2ZW5kb3JfbW9kdWxlX2xvY2ssIGluIGt2bV94
ODZfdmVuZG9yX2luaXQoKSB3aGlsZQ0KPiBkb2luZyBoYXJkd2FyZSBzZXR1cCB0byBlbnN1cmUg
dGhhdCBjb25jdXJyZW50IGNhbGxzIGFyZSBmdWxseSBzZXJpYWxpemVkLg0KPiBLVk0gcmVqZWN0
cyBhdHRlbXB0cyB0byBsb2FkIHZlbmRvciBtb2R1bGVzIGlmIGEgZGlmZmVyZW50IG1vZHVsZSBo
YXMNCj4gYWxyZWFkeSBiZWVuIGxvYWRlZCwgYnV0IGRvZXNuJ3QgaGFuZGxlIHRoZSBjYXNlIHdo
ZXJlIG11bHRpcGxlIHZlbmRvcg0KPiBtb2R1bGVzIGFyZSBsb2FkZWQgYXQgdGhlIHNhbWUgdGlt
ZSwgYW5kIG1vZHVsZV9pbml0KCkgZG9lc24ndCBydW4gdW5kZXINCj4gdGhlIGdsb2JhbCBtb2R1
bGVfbXV0ZXguDQo+IA0KPiBOb3RlLCBpbiBwcmFjdGljZSwgdGhpcyBpcyBsaWtlbHkgYSBiZW5p
Z24gYnVnIGFzIG5vIHBsYXRmb3JtIGV4aXN0cyB0aGF0DQo+IHN1cHBvcnRzIGJvdGggU1ZNIGFu
ZCBWTVgsIGkuZS4gYmFycmluZyBhIHdlaXJkIFZNIHNldHVwLCBvbmUgb2YgdGhlDQo+IHZlbmRv
ciBtb2R1bGVzIGlzIGd1YXJhbnRlZWQgdG8gZmFpbCBhIHN1cHBvcnQgY2hlY2sgYmVmb3JlIG1v
ZGlmeWluZw0KPiBjb21tb24gS1ZNIHN0YXRlLg0KPiANCj4gQWx0ZXJuYXRpdmVseSwgS1ZNIGNv
dWxkIHBlcmZvcm0gYW4gYXRvbWljIENNUFhDSEcgb24gLmhhcmR3YXJlX2VuYWJsZSwNCj4gYnV0
IHRoYXQgY29tZXMgd2l0aCBpdHMgb3duIHVnbGluZXNzIGFzIGl0IHdvdWxkIHJlcXVpcmUgc2V0
dGluZw0KPiAuaGFyZHdhcmVfZW5hYmxlIGJlZm9yZSBzdWNjZXNzIGlzIGd1YXJhbnRlZWQsIGUu
Zy4gYXR0ZW1wdGluZyB0byBsb2FkDQo+IHRoZSAid3JvbmciIGNvdWxkIHJlc3VsdCBpbiBzcHVy
aW91cyBmYWlsdXJlIHRvIGxvYWQgdGhlICJyaWdodCIgbW9kdWxlLg0KPiANCj4gSW50cm9kdWNl
IGEgbmV3IG11dGV4IGFzIHVzaW5nIGt2bV9sb2NrIGlzIGV4dHJlbWVseSBkZWFkbG9jayBwcm9u
ZSBkdWUNCj4gdG8ga3ZtX2xvY2sgYmVpbmcgdGFrZW4gdW5kZXIgY3B1c193cml0ZV9sb2NrKCks
IGFuZCBpbiB0aGUgZnV0dXJlLCB1bmRlcg0KPiB1bmRlciBjcHVzX3JlYWRfbG9jaygpLiAgQW55
IG9wZXJhdGlvbiB0aGF0IHRha2VzIGNwdXNfcmVhZF9sb2NrKCkgd2hpbGUNCj4gaG9sZGluZyBr
dm1fbG9jayB3b3VsZCBwb3RlbnRpYWxseSBkZWFkbG9jaywgZS5nLiBrdm1fdGltZXJfaW5pdCgp
IHRha2VzDQo+IGNwdXNfcmVhZF9sb2NrKCkgdG8gcmVnaXN0ZXIgYSBjYWxsYmFjay4gIEluIHRo
ZW9yeSwgS1ZNIGNvdWxkIGF2b2lkDQo+IHN1Y2ggcHJvYmxlbWF0aWMgcGF0aHMsIGkuZS4gZG8g
bGVzcyBzZXR1cCB1bmRlciBrdm1fbG9jaywgYnV0IGF2b2lkaW5nDQo+IGFsbCBjYWxscyB0byBj
cHVzX3JlYWRfbG9jaygpIGlzIHN1YnRseSBkaWZmaWN1bHQgYW5kIHRodXMgZnJhZ2lsZS4gIEUu
Zy4NCj4gdXBkYXRpbmcgc3RhdGljIGNhbGxzIGFsc28gYWNxdWlyZXMgY3B1c19yZWFkX2xvY2so
KS4NCj4gDQo+IEludmVydGluZyB0aGUgbG9jayBvcmRlcmluZywgaS5lLiBhbHdheXMgdGFraW5n
IGt2bV9sb2NrIG91dHNpZGUNCj4gY3B1c19yZWFkX2xvY2soKSwgaXMgbm90IGEgdmlhYmxlIG9w
dGlvbiwgZS5nLiBrdm1fb25saW5lX2NwdSgpIHRha2VzDQo+IGt2bV9sb2NrIGFuZCBpcyBjYWxs
ZWQgdW5kZXIgY3B1c193cml0ZV9sb2NrKCkuDQoNCiJrdm1fb25saW5lX2NwdSgpIHRha2VzIGt2
bV9sb2NrIGFuZCBpcyBjYWxsZWQgdW5kZXIgY3B1c193cml0ZV9sb2NrKCkiIGhhc24ndA0KaGFw
cGVuZWQgeWV0Lg0KDQo+IA0KPiBUaGUgbG9ja2RlcCBzcGxhdCBiZWxvdyBpcyBkZXBlbmRlbnQg
b24gZnV0dXJlIHBhdGNoZXMgdG8gdGFrZQ0KPiBjcHVzX3JlYWRfbG9jaygpIGluIGhhcmR3YXJl
X2VuYWJsZV9hbGwoKSwgYnV0IGFzIGFib3ZlLCBkZWFkbG9jayBpcw0KPiBhbHJlYWR5IGlzIGFs
cmVhZHkgcG9zc2libGUuDQoNCklJVUMga3ZtX2xvY2sgYnkgZGVzaWduIGlzIHN1cHBvc2VkIHRv
IHByb3RlY3Qgdm1fbGlzdCwgdGh1cyBJTUhPIG5hdHVyYWxseSBpdA0KZG9lc24ndCBmaXQgdG8g
cHJvdGVjdCBtdWx0aXBsZSB2ZW5kb3IgbW9kdWxlIGxvYWRpbmcuDQoNCkxvb2tzIGFib3ZlIGFy
Z3VtZW50IGlzIGdvb2QgZW5vdWdoLiAgSSBhbSBub3Qgc3VyZSAgd2hldGhlciB3ZSBuZWVkIGFk
ZGl0aW9uYWwNCmp1c3RpZmljYXRpb24gd2hpY2ggY29tZXMgZnJvbSBmdXR1cmUgcGF0Y2hlcy4g
OikNCg0KQWxzbywgZG8geW91IGFsc28gd2FudCB0byB1cGRhdGUgRG9jdW1lbnRhdGlvbi92aXJ0
L2t2bS9sb2NraW5nLnJzdCIgaW4gdGhpcw0KcGF0Y2g/DQoNCj4gDQo+IA0KPiAgID09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiAgIFdBUk5J
Tkc6IHBvc3NpYmxlIGNpcmN1bGFyIGxvY2tpbmcgZGVwZW5kZW5jeSBkZXRlY3RlZA0KPiAgIDYu
MC4wLXNtcC0tN2VjOTMyNDRmMTk0LWluaXQyICMyNyBUYWludGVkOiBHICAgICAgICAgICBPDQo+
ICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ICAgc3RhYmxlLzI1MTgzMyBpcyB0cnlpbmcgdG8gYWNxdWlyZSBsb2NrOg0KPiAgIGZmZmZm
ZmZmYzA5N2VhMjggKGt2bV9sb2NrKXsrLisufS17MzozfSwgYXQ6IGhhcmR3YXJlX2VuYWJsZV9h
bGwrMHgxZi8weGMwIFtrdm1dDQo+IA0KPiAgICAgICAgICAgICAgICBidXQgdGFzayBpcyBhbHJl
YWR5IGhvbGRpbmcgbG9jazoNCj4gICBmZmZmZmZmZmEyNDU2ODI4IChjcHVfaG90cGx1Z19sb2Nr
KXsrKysrfS17MDowfSwgYXQ6IGhhcmR3YXJlX2VuYWJsZV9hbGwrMHhmLzB4YzAgW2t2bV0NCj4g
DQo+ICAgICAgICAgICAgICAgIHdoaWNoIGxvY2sgYWxyZWFkeSBkZXBlbmRzIG9uIHRoZSBuZXcg
bG9jay4NCj4gDQo+ICAgICAgICAgICAgICAgIHRoZSBleGlzdGluZyBkZXBlbmRlbmN5IGNoYWlu
IChpbiByZXZlcnNlIG9yZGVyKSBpczoNCj4gDQo+ICAgICAgICAgICAgICAgIC0+ICMxIChjcHVf
aG90cGx1Z19sb2NrKXsrKysrfS17MDowfToNCj4gICAgICAgICAgY3B1c19yZWFkX2xvY2srMHgy
YS8weGEwDQo+ICAgICAgICAgIF9fY3B1aHBfc2V0dXBfc3RhdGUrMHgyYi8weDYwDQo+ICAgICAg
ICAgIF9fa3ZtX3g4Nl92ZW5kb3JfaW5pdCsweDE2YS8weDE4NzAgW2t2bV0NCj4gICAgICAgICAg
a3ZtX3g4Nl92ZW5kb3JfaW5pdCsweDIzLzB4NDAgW2t2bV0NCj4gICAgICAgICAgMHhmZmZmZmZm
ZmMwYTRkMDJiDQo+ICAgICAgICAgIGRvX29uZV9pbml0Y2FsbCsweDExMC8weDIwMA0KPiAgICAg
ICAgICBkb19pbml0X21vZHVsZSsweDRmLzB4MjUwDQo+ICAgICAgICAgIGxvYWRfbW9kdWxlKzB4
MTczMC8weDE4ZjANCj4gICAgICAgICAgX19zZV9zeXNfZmluaXRfbW9kdWxlKzB4Y2EvMHgxMDAN
Cj4gICAgICAgICAgX194NjRfc3lzX2Zpbml0X21vZHVsZSsweDFkLzB4MjANCj4gICAgICAgICAg
ZG9fc3lzY2FsbF82NCsweDNkLzB4ODANCj4gICAgICAgICAgZW50cnlfU1lTQ0FMTF82NF9hZnRl
cl9od2ZyYW1lKzB4NjMvMHhjZA0KPiANCj4gICAgICAgICAgICAgICAgLT4gIzAgKGt2bV9sb2Nr
KXsrLisufS17MzozfToNCj4gICAgICAgICAgX19sb2NrX2FjcXVpcmUrMHgxNmY0LzB4MzBkMA0K
PiAgICAgICAgICBsb2NrX2FjcXVpcmUrMHhiMi8weDE5MA0KPiAgICAgICAgICBfX211dGV4X2xv
Y2srMHg5OC8weDZmMA0KPiAgICAgICAgICBtdXRleF9sb2NrX25lc3RlZCsweDFiLzB4MjANCj4g
ICAgICAgICAgaGFyZHdhcmVfZW5hYmxlX2FsbCsweDFmLzB4YzAgW2t2bV0NCj4gICAgICAgICAg
a3ZtX2Rldl9pb2N0bCsweDQ1ZS8weDkzMCBba3ZtXQ0KPiAgICAgICAgICBfX3NlX3N5c19pb2N0
bCsweDc3LzB4YzANCj4gICAgICAgICAgX194NjRfc3lzX2lvY3RsKzB4MWQvMHgyMA0KPiAgICAg
ICAgICBkb19zeXNjYWxsXzY0KzB4M2QvMHg4MA0KPiAgICAgICAgICBlbnRyeV9TWVNDQUxMXzY0
X2FmdGVyX2h3ZnJhbWUrMHg2My8weGNkDQo+IA0KPiAgICAgICAgICAgICAgICBvdGhlciBpbmZv
IHRoYXQgbWlnaHQgaGVscCB1cyBkZWJ1ZyB0aGlzOg0KPiANCj4gICAgUG9zc2libGUgdW5zYWZl
IGxvY2tpbmcgc2NlbmFyaW86DQo+IA0KPiAgICAgICAgICBDUFUwICAgICAgICAgICAgICAgICAg
ICBDUFUxDQo+ICAgICAgICAgIC0tLS0gICAgICAgICAgICAgICAgICAgIC0tLS0NCj4gICAgIGxv
Y2soY3B1X2hvdHBsdWdfbG9jayk7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxvY2soa3ZtX2xvY2spOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb2Nr
KGNwdV9ob3RwbHVnX2xvY2spOw0KPiAgICAgbG9jayhrdm1fbG9jayk7DQo+IA0KPiAgICAgICAg
ICAgICAgICAgKioqIERFQURMT0NLICoqKg0KPiANCj4gICAxIGxvY2sgaGVsZCBieSBzdGFibGUv
MjUxODMzOg0KPiAgICAjMDogZmZmZmZmZmZhMjQ1NjgyOCAoY3B1X2hvdHBsdWdfbG9jayl7Kysr
K30tezA6MH0sIGF0OiBoYXJkd2FyZV9lbmFibGVfYWxsKzB4Zi8weGMwIFtrdm1dDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4NCj4g
LS0tDQo+ICBhcmNoL3g4Ni9rdm0veDg2LmMgfCAxOCArKysrKysrKysrKysrKysrLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYw0KPiBpbmRl
eCBhMGNhNDAxZDNjZGYuLjIxODcwNzU5N2JlYSAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYva3Zt
L3g4Ni5jDQo+ICsrKyBiL2FyY2gveDg2L2t2bS94ODYuYw0KPiBAQCAtMTI4LDYgKzEyOCw3IEBA
IHN0YXRpYyBpbnQga3ZtX3ZjcHVfZG9fc2luZ2xlc3RlcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Ow0KPiAgc3RhdGljIGludCBfX3NldF9zcmVnczIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1
Y3Qga3ZtX3NyZWdzMiAqc3JlZ3MyKTsNCj4gIHN0YXRpYyB2b2lkIF9fZ2V0X3NyZWdzMihzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fc3JlZ3MyICpzcmVnczIpOw0KPiAgDQo+ICtz
dGF0aWMgREVGSU5FX01VVEVYKHZlbmRvcl9tb2R1bGVfbG9jayk7DQo+ICBzdHJ1Y3Qga3ZtX3g4
Nl9vcHMga3ZtX3g4Nl9vcHMgX19yZWFkX21vc3RseTsNCj4gIA0KPiAgI2RlZmluZSBLVk1fWDg2
X09QKGZ1bmMpCQkJCQkgICAgIFwNCj4gQEAgLTkyODAsNyArOTI4MSw3IEBAIHZvaWQga3ZtX2Fy
Y2hfZXhpdCh2b2lkKQ0KPiAgDQo+ICB9DQo+ICANCj4gLWludCBrdm1feDg2X3ZlbmRvcl9pbml0
KHN0cnVjdCBrdm1feDg2X2luaXRfb3BzICpvcHMpDQo+ICtzdGF0aWMgaW50IF9fa3ZtX3g4Nl92
ZW5kb3JfaW5pdChzdHJ1Y3Qga3ZtX3g4Nl9pbml0X29wcyAqb3BzKQ0KPiAgew0KPiAgCXU2NCBo
b3N0X3BhdDsNCj4gIAlpbnQgcjsNCj4gQEAgLTk0MTMsNiArOTQxNCwxNyBAQCBpbnQga3ZtX3g4
Nl92ZW5kb3JfaW5pdChzdHJ1Y3Qga3ZtX3g4Nl9pbml0X29wcyAqb3BzKQ0KPiAgCWttZW1fY2Fj
aGVfZGVzdHJveSh4ODZfZW11bGF0b3JfY2FjaGUpOw0KPiAgCXJldHVybiByOw0KPiAgfQ0KPiAr
DQo+ICtpbnQga3ZtX3g4Nl92ZW5kb3JfaW5pdChzdHJ1Y3Qga3ZtX3g4Nl9pbml0X29wcyAqb3Bz
KQ0KPiArew0KPiArCWludCByOw0KPiArDQo+ICsJbXV0ZXhfbG9jaygmdmVuZG9yX21vZHVsZV9s
b2NrKTsNCj4gKwlyID0gX19rdm1feDg2X3ZlbmRvcl9pbml0KG9wcyk7DQo+ICsJbXV0ZXhfdW5s
b2NrKCZ2ZW5kb3JfbW9kdWxlX2xvY2spOw0KPiArDQo+ICsJcmV0dXJuIHI7DQo+ICt9DQo+ICBF
WFBPUlRfU1lNQk9MX0dQTChrdm1feDg2X3ZlbmRvcl9pbml0KTsNCj4gIA0KPiAgdm9pZCBrdm1f
eDg2X3ZlbmRvcl9leGl0KHZvaWQpDQo+IEBAIC05NDM1LDcgKzk0NDcsNiBAQCB2b2lkIGt2bV94
ODZfdmVuZG9yX2V4aXQodm9pZCkNCj4gIAljYW5jZWxfd29ya19zeW5jKCZwdmNsb2NrX2d0b2Rf
d29yayk7DQo+ICAjZW5kaWYNCj4gIAlzdGF0aWNfY2FsbChrdm1feDg2X2hhcmR3YXJlX3Vuc2V0
dXApKCk7DQo+IC0Ja3ZtX3g4Nl9vcHMuaGFyZHdhcmVfZW5hYmxlID0gTlVMTDsNCj4gIAlrdm1f
bW11X3ZlbmRvcl9tb2R1bGVfZXhpdCgpOw0KPiAgCWZyZWVfcGVyY3B1KHVzZXJfcmV0dXJuX21z
cnMpOw0KPiAgCWttZW1fY2FjaGVfZGVzdHJveSh4ODZfZW11bGF0b3JfY2FjaGUpOw0KPiBAQCAt
OTQ0Myw2ICs5NDU0LDkgQEAgdm9pZCBrdm1feDg2X3ZlbmRvcl9leGl0KHZvaWQpDQo+ICAJc3Rh
dGljX2tleV9kZWZlcnJlZF9mbHVzaCgma3ZtX3hlbl9lbmFibGVkKTsNCj4gIAlXQVJOX09OKHN0
YXRpY19icmFuY2hfdW5saWtlbHkoJmt2bV94ZW5fZW5hYmxlZC5rZXkpKTsNCj4gICNlbmRpZg0K
PiArCW11dGV4X2xvY2soJnZlbmRvcl9tb2R1bGVfbG9jayk7DQo+ICsJa3ZtX3g4Nl9vcHMuaGFy
ZHdhcmVfZW5hYmxlID0gTlVMTDsNCj4gKwltdXRleF91bmxvY2soJnZlbmRvcl9tb2R1bGVfbG9j
ayk7DQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MX0dQTChrdm1feDg2X3ZlbmRvcl9leGl0KTsNCj4g
IA0KDQo=
