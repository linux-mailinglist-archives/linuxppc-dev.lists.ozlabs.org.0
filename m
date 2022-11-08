Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C8F6210D1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 13:33:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N66w01PRTz3chb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 23:33:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FKZJ/qfE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FKZJ/qfE;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N626P2NRXz3bym
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 19:57:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667897837; x=1699433837;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DnY4GI4ctszLsVyKYIzppkno7Bey8nguHWmA/kMLyHw=;
  b=FKZJ/qfEZsaplt7p0Y9xNiBC/t1EWYTdjLnk4zFgl3qquwrhlUizJISH
   YTBxCvged/uW1XAc4at8usQRquJ+nN04iO5sxSub9UvBZMlF0K1XQSsN/
   1dgNViX1BbPLrcg9aWp67V9G61/oZbh8CSn44Ewj2tDdvOpq69+j/kjBq
   QbU2qmvPAyiUbA2bGtjn1PCCXLu4fkHpMSSohj+k+oICUXZFZXHKmxkXl
   T7Nb12sgqIVLrhEtiMjDWS9qJVC/ew8JtODHcwVHinNoZ/8yLb/MMflU5
   dZiE1cyJmhwrMwdSqmykKyDuwvwqVDd2v8SQVjauE4dRMpJ2uAbybU7yl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="298160761"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="298160761"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 00:57:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="965511553"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="965511553"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga005.fm.intel.com with ESMTP; 08 Nov 2022 00:57:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 00:57:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 8 Nov 2022 00:57:05 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 8 Nov 2022 00:57:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZ4VpC3xHD5YXm+1/4TWyZLRZz6g1OZ1GoaUKaDFinx4hoFhI1wg1oivcgcsLOH/NbPIxRBNfwHDz1ufiIBVxDowSgbERVipkGl03tPCaJ4QsDQua9MZ6q4c3vzRVFT20Qwlku+s4TTAZQeighcKbzgCzPDIyJFuzVlQWPJ++QZUOXhysITneIVaBgJW3FzgJk7zca6OQqx05p6c2+xAmvCWRZos7Dj8UVGADggvnqV3K2KrmQqSJiCIGILDnX3+jhlz2zZ/8G9MLyNT3Wr6qKqfLolm98JPhYKFsuJcrwiXNN0cFscpjpQ+vfKXoTVwBbgiPBpIUUIRzLSlFwmGhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnY4GI4ctszLsVyKYIzppkno7Bey8nguHWmA/kMLyHw=;
 b=E5xosGtt2mMZNgjxHHH54sQ3F/w8nHfcXgRPO0VVAPgvlJ7MoVyXMp09wBEgmLTdAFevaOYnJfBZcrkxQlDVzziEKeTUs5hJCq00KLouTJaWxSlAHWRvF9pSCOvXumkVxH5DB+QUzR2lFiRyH7aMrzLjuIrMFnESFdLZRvvMl3poYxOTUGbvvIjEh8/qqVB+ePFr3A1R89TIE994i5ci/SoBnB2T3/P67jaFuVDJtgvAOtvD52k3g95u5YRPQQWfR3BJ3zP+q6aFVI8CGa1DvFYKRfk48Ev6TmVwj40JVGkphmszvw4VEYeyou0XIcuybYXivO3WpVorm9a+2NunoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Tue, 8 Nov
 2022 08:56:58 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::6eb:99bf:5c45:a94b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::6eb:99bf:5c45:a94b%3]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 08:56:58 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
Thread-Topic: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
Thread-Index: AQHY7xGUTp4lUVPML0yWgaOmsA79Vq4uXPOAgADckACABM0oAIAAOK8AgABMrwCAADXwgA==
Date: Tue, 8 Nov 2022 08:56:58 +0000
Message-ID: <9890f67846f1c2c6a12bd086fc822f0762966223.camel@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221104071749.GC1063309@ls.amr.corp.intel.com>
	 <Y2V1oslbw24/2Opd@google.com>
	 <20221107214634.GE1063309@ls.amr.corp.intel.com>
	 <bf29fe1ac84cae8ddb06e566b56c653600a1901c.camel@intel.com>
	 <20221108054354.GA1708572@ls.amr.corp.intel.com>
In-Reply-To: <20221108054354.GA1708572@ls.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|CO6PR11MB5651:EE_
x-ms-office365-filtering-correlation-id: c7ea250f-9f74-4ffc-8590-08dac1673194
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z8nILbfukv/920VsX9+cBmYnKv1pe5rhWpxDdbeHsz2bdBNnYR8XEUMbCMol3xC1PvdRMOCi9DRl3JV46wzn5El+0J1Ks9sgAXGwaKpyidPeiPswCDk2efKhLHFjStJro2F3ruM4H6PFpRIensyqYYKhXgxETtbOqais72q1CrqmXTZoUIK6WC9m8PmiYbU2hBUM6MgbHkpxH00thDxr+chaMyN54JSVxjWKGUx88ja0xs8R8a59Dqj9De8uzSt4LX2fB7sbWmi5FaTjL8FeSwEDiZt2g7dBDA2rZ7GqzfrX1WyfL5wS7xVAZZbSHQtf8w7GaTq8+Kr9bXb8NbZ7279GS3PNUxhTVj75BHLOEvnOGXnTkWcv69DR2WIofuRLkIHxcle07Lddw4AL5Mzgw1PUzIQ42PLoNHUXu+7R0tGMpCwHHC9lPB89w2zsP11rhZ9s0uGHBYuyXAmYWQ7AweebaFNTJ4CsEb7D0SLmqbXAsRej1FpJgdAizKUKIH7P6eyJufBCdj5ihdjB6pYUGaC8cc3ahwO2fUzOH2sVVD3310YZ3UI79Cehqppc6bvjNeFsJtm8aw9J/byEcezH0vJnzHvL0rRdv27QeYJ72e8QDdxFsV1R/kmaWJg9VrUryY8JaEUIxtnMqWJIDETR6xEIbuuiNbWLm5V6HxdqTh2SM46JVZix+2g/u63GwetXhnKPKeXMF7MULkOqonPkKKE8bJb7EcZCoZnMxSt3fa61T40ZNuEFJN98LBJm3/TJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199015)(2906002)(66946007)(478600001)(64756008)(8676002)(76116006)(66556008)(66476007)(8936002)(41300700001)(6486002)(7416002)(71200400001)(6512007)(7406005)(5660300002)(6916009)(4326008)(91956017)(66446008)(83380400001)(38070700005)(316002)(122000001)(82960400001)(86362001)(6506007)(107886003)(2616005)(38100700002)(26005)(54906003)(186003)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUNlWDZLWk9USzhQaDBCNm01RDhLV2YvYllqRGo1dFk3bDR1ckpEUkNmbVBx?=
 =?utf-8?B?QlBoaFVqelBReGRVNzV0TXp6R2hJZmN3cWZKdjJOcVBNU0RDeFBoMEFLZnBt?=
 =?utf-8?B?bjVxeS9lWFZIOThWRWxrRVZBck1mSGl4V1o2WGRpcWVzTzVHZU00YnNUYkIr?=
 =?utf-8?B?bmIzQkZVMEhqU2o2Tnhnc2ladXpocUJPZVAxdWgrVDIrVGx3Q3E5dmNNVjhu?=
 =?utf-8?B?djA1TVlPbkgwR1pkSmo3d09aWkt6Q1RZWUY0cjlac2QrWlAvQUk3OFVGVm5w?=
 =?utf-8?B?dFcxVTRJWWRpSWVSSGhBNjY3VUhTQjZrNDZ4U3FkSUF6ZVQ0ZnJzaDVaNlY4?=
 =?utf-8?B?Q2tScUdPME1sdm9IR1VPQlV6OHpwNFczcC8rL0E4WldKMnRXWEROaWNRdW1K?=
 =?utf-8?B?cHlacGNkVWEwaFNwa0FlcklBVm93MmRWOUlTSDZKKzhJcjQ2eWkrRGZVTkcv?=
 =?utf-8?B?TlgzK3k2STZwb3BzMHc4ZUJiU1U2TkdaUWgyREFteGVFWmFqYUJ2V1BWU3BO?=
 =?utf-8?B?TVhFSWRIVm5jelFWVDJSZm0vSGVFcEJRamVUM3lIdzRPdGZZNCtDa29YaUlp?=
 =?utf-8?B?VWxsV0dYRlVud1o5aTdMcVI4TWo2aUtPWk5HVzRXdkZIVlcweWRVNlZmL2Ix?=
 =?utf-8?B?QXNycmVpQlJiOUJWZTllV1RINTZ5OGRkMUt5NWNzMkVvZUJpdm9rUlpwZkZ1?=
 =?utf-8?B?by9uaTZ6a1ZRVEFBa3J3M1UyZ0V3UmNlUTlqS2VxSzZjcFBoZVljbWtYM3Vn?=
 =?utf-8?B?Z3B4QzZIZnVRTFJqMFg0SzNKdW5abjE1YWNodjNvbERXc3lSNFFSTlA3VFdR?=
 =?utf-8?B?bFBybWVVQ3lSNE1vSlVBcmpKOXNpWkk0T0s3dEUvY20wTldUa2tKSWx0VEdK?=
 =?utf-8?B?M2VGY0lFZXJnZXo0ekFseFdUREFzM1RVZVRBVERhWkt3REhIQVRtZmZLN3E0?=
 =?utf-8?B?RyswajF3MjZkWFdBYzY5ZzhDS0ZaSXlEeDBweUZJMDkrU0JTQUlUNVJGNCt3?=
 =?utf-8?B?UVR6dzBxQWRTd1dhdVY4WjU3ekVwRHBaR2VRQU9WeUErSGJRd3NCemM1K08v?=
 =?utf-8?B?NGlqemFuTWpENFdyODlBUi8xTmlNbFU5QkxhSXBlNm1scTFFQzdBTHFYUnI1?=
 =?utf-8?B?WVVZa0RvVVR1LzE2ck40RHl0RkVQQUhnbUtLdHlDMVVZdy9LSUFQMzZ5UnlH?=
 =?utf-8?B?QzFWZzRQMEVZU3drUWM5alFJOVJnVTZ5a0Z5dUpRYmxKVFM2K3AwTm5iMnJH?=
 =?utf-8?B?REZtRWdqbzJEN3MwRnlMbUg3Ymh3TGlINzRtVUlSM3BkTkxOdnhUWWpXRU5L?=
 =?utf-8?B?cVhDTE9EWlRvcmNJY24zdFlBamF6cDZPN2tTZThVTnNZcHZXc2lWeXN0MGY4?=
 =?utf-8?B?STZJQU9vMWxzK3I0VGtCL2xOYm9rTUZDL3ZsYWhKT3VDbGZOSE1JUTVNQjV2?=
 =?utf-8?B?bnR3OCt2dmNJNHQzelB1WDVZSDVTUmttRXNjSGlyK2s4T3ZZRDZkdlpoZzgr?=
 =?utf-8?B?Tnp1d0RSVUt4VjNrR2Jyemk4NUgzTjdZaUZLRzd4b0l4bVVTdktNWUZlc0pH?=
 =?utf-8?B?Tjc3dWJZVmxFb29GRFVHNjlXZ3lNL2QwbnY0WWN1Rkd6RU9kMkdzeng3MEEx?=
 =?utf-8?B?V1FJT3ZZeEtjL0hFQklWdUtaa0ExWU5yUlZvbmEwT2lmWDVGblZJbEQ3cFo4?=
 =?utf-8?B?ejU4RzdURlYwUXlWR3RCSTUzRHpOcGd0cmFNSUhwNGpoQ2ZOMkR5YmJqalJi?=
 =?utf-8?B?bU8wKzZ5aGNxRGtPRjIrdWprNGpOYlMwK1NENjZDa1V2aUdlRTFoa3I0SnN6?=
 =?utf-8?B?RjNMR0ZXQUhxR1Noa3BPL2lxZ3JXU01oelJBMjNsaVZBRWg2cDNRMUJDdk5M?=
 =?utf-8?B?dVJGM1plSDlya1RCbjRwQWNwalFGRDhOdEVtMkRyb2FsM2daYnZQRXR5TjQv?=
 =?utf-8?B?dElTZ3EzNzNmQzJIRlVLTGVuRHVSOTNnS2VSTkxISEJwSGVJSzJHaTd3c1pC?=
 =?utf-8?B?TDkwWVkwd1lyQ1VxT2dEMFVBL0JlVTh4SmVxaVFYSzV4dWhieDhWbHlSOWZP?=
 =?utf-8?B?TXozeUliVWtFenRFYUhWbDArcjdVbFZldTlUcjR6VEl6T01DdTZsd0NwV2xW?=
 =?utf-8?B?bnQ0RnU2VnRIMWprL2xsSVVycG1KYytIMllWekI1TkhSK2lUVENxNks5Z2gw?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <343C7E70FD73E4469ABC157AAE8098A5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ea250f-9f74-4ffc-8590-08dac1673194
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 08:56:58.3487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2EoLGI5I2s7IBJ7vuf8qI4LOuhPlDlK4Gw8r59e1QyEl68UA007LGgukLW24AJNbiYINjkB8n2c+UY4WaliWqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5651
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 08 Nov 2022 23:30:58 +1100
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>, "david@redhat.com" <david@redhat.com>, "anup@brainfault.org" <anup@brainfault.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>, "james.morse@arm.com" <james.morse@arm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Gao, Chao" <chao.gao@intel.com>, "farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Yao, Yuan" <yuan.yao@intel.com>, "kvmarm@lists.linux
 .dev" <kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>, "Christopherson,,
 Sean" <seanjc@google.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIyLTExLTA3IGF0IDIxOjQzIC0wODAwLCBJc2FrdSBZYW1haGF0YSB3cm90ZToN
Cj4gT24gVHVlLCBOb3YgMDgsIDIwMjIgYXQgMDE6MDk6MjdBTSArMDAwMCwNCj4gIkh1YW5nLCBL
YWkiIDxrYWkuaHVhbmdAaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+ID4gT24gTW9uLCAyMDIyLTEx
LTA3IGF0IDEzOjQ2IC0wODAwLCBJc2FrdSBZYW1haGF0YSB3cm90ZToNCj4gPiA+ID4gT24gRnJp
LCBOb3YgMDQsIDIwMjIsIElzYWt1IFlhbWFoYXRhIHdyb3RlOg0KPiA+ID4gPiA+IFRoYW5rcyBm
b3IgdGhlIHBhdGNoIHNlcmllcy4gSSB0aGUgcmViYXNlZCBURFggS1ZNIHBhdGNoIHNlcmllcyBh
bmQgaXQNCj4gPiA+ID4gPiB3b3JrZWQuDQo+ID4gPiA+ID4gU2luY2UgY3B1IG9mZmxpbmUgbmVl
ZHMgdG8gYmUgcmVqZWN0ZWQgaW4gc29tZSBjYXNlcyhUbyBrZWVwIGF0IGxlYXN0IG9uZQ0KPiA+
ID4gPiA+IGNwdQ0KPiA+ID4gPiA+IG9uIGEgcGFja2FnZSksIGFyY2ggaG9vayBmb3IgY3B1IG9m
ZmxpbmUgaXMgbmVlZGVkLg0KPiA+ID4gPiANCj4gPiA+ID4gSSBoYXRlIHRvIGJyaW5nIHRoaXMg
dXAgYmVjYXVzZSBJIGRvdWJ0IHRoZXJlJ3MgYSByZWFsIHVzZSBjYXNlIGZvciBTVVNQRU5EDQo+
ID4gPiA+IHdpdGgNCj4gPiA+ID4gVERYLCBidXQgdGhlIENQVSBvZmZsaW5lIHBhdGggaXNuJ3Qg
anVzdCBmb3IgdHJ1ZSBvZmZsaW5pbmcgb2YgQ1BVcy7CoCBXaGVuDQo+ID4gPiA+IHRoZQ0KPiA+
ID4gPiBzeXN0ZW0gZW50ZXJzIFNVU1BFTkQsIG9ubHkgdGhlIGluaXRpYXRpbmcgQ1BVIGdvZXMg
dGhyb3VnaA0KPiA+ID4gPiBrdm1fc3VzcGVuZCgpK2t2bV9yZXN1bWUoKSwNCj4gPiA+ID4gYWxs
IHJlc3BvbmRpbmcgQ1BVcyBnbyB0aHJvdWdoIENQVSBvZmZsaW5lK29ubGluZS7CoCBJLmUuIGRp
c2FsbG93aW5nIGFsbA0KPiA+ID4gPiBDUFVzIGZyb20NCj4gPiA+ID4gZ29pbmcgIm9mZmxpbmUi
IHdpbGwgcHJldmVudCBzdXNwZW5kaW5nIHRoZSBzeXN0ZW0uDQo+ID4gPiANCj4gPiA+IFRoZSBj
dXJyZW50IFREWCBLVk0gaW1wbGVtZW50YXRpb24gZGlzYWxsb3dzIENQVSBwYWNrYWdlIGZyb20g
b2ZmbGluZSBvbmx5DQo+ID4gPiB3aGVuDQo+ID4gPiBURHMgYXJlIHJ1bm5pbmcuwqAgSWYgbm8g
VEQgaXMgcnVubmluZywgQ1BVIG9mZmxpbmUgaXMgYWxsb3dlZC7CoCBTbyBiZWZvcmUNCj4gPiA+
IFNVU1BFTkQsIFREcyBuZWVkIHRvIGJlIGtpbGxlZCB2aWEgc3lzdGVtZCBvciBzb21ldGhpbmcu
wqAgQWZ0ZXIga2lsbGluZyBURHMsDQo+ID4gPiB0aGUNCj4gPiA+IHN5c3RlbSBjYW4gZW50ZXIg
aW50byBTVVNQRU5EIHN0YXRlLg0KPiA+IA0KPiA+IFRoaXMgc2VlbXMgbm90IGNvcnJlY3QuICBZ
b3UgbmVlZCBvbmUgY3B1IGZvciBlYWNoIHRvIGJlIG9ubGluZSBpbiBvcmRlciB0bw0KPiA+IGNy
ZWF0ZSBURCBhcyB3ZWxsLCBhcyBUREguTU5HLktFWS5DT05GSUcgbmVlZHMgdG8gYmUgY2FsbGVk
IG9uIGFsbCBwYWNrYWdlcywNCj4gPiBjb3JyZWN0Pw0KPiANCj4gVGhhdCdzIGNvcnJlY3QuIElu
IHN1Y2ggY2FzZSwgdGhlIGNyZWF0aW9uIG9mIFREIGZhaWxzLiAgVEQgY3JlYXRpb24gY2hlY2tz
IGlmDQo+IGF0IGxlYXN0IG9uZSBjcHUgaXMgb25saW5lIG9uIGFsbCBDUFUgcGFja2FnZXMuICBJ
ZiBubywgZXJyb3IuDQoNCkkgdGhpbmsgd2UgY2FuIGp1c3QgYWx3YXlzIHJlZnVzZSB0byBvZmZs
aW5lIHRoZSBsYXN0IGNwdSBmb3IgZWFjaCBwYWNrYWdlIHdoZW4NClREWCBpcyBlbmFibGVkLiAg
SXQncyBzaW1wbGVyIEkgZ3Vlc3MuDQo=
