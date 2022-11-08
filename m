Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E946210DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 13:35:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N66y3164xz3f82
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 23:35:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KfXASYF3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=kai.huang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KfXASYF3;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N64HQ01pnz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 21:35:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667903714; x=1699439714;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qETIum2KYwGc7vEfg46uyhkEvvddZG32/0wkkAWfUEI=;
  b=KfXASYF3KuXlwVNuz0Ey2T4XS8hXQTRBL0k1t23JzfXokYTD9xs0dWbM
   O6WXOQj4G91c2ouxde5nuiVVgGZQqX7fpNbGJg594W8O3UmoCAy+VVqrv
   Y1TIpJXt3UyIwcL4+jDOnOFNrFRGtl2Vovvydp7EQmPQBt57iS9g8NLxq
   SQ9d5hg0Fzn2FQJsfggyAiZFPPBKfO0OSHATkgvELxw34zq9F3UsPVOe7
   +/DDi666UoluisvT14Ba+exM41EhwcVozirJJpVoUFCQuYo9E5pWUEdTU
   9MOCT+EGD09FWgqcu0V5Cr4AhdlNdwxENYInj5OHXB3lwVd8/MsGZsibk
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="337389165"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="337389165"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 02:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="811192156"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="811192156"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP; 08 Nov 2022 02:35:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 02:35:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 02:35:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 8 Nov 2022 02:35:08 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 8 Nov 2022 02:35:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcGBZIVxpXcvEhb+31qU2B4b7IkFW0MTice/NY1lUI1+V2j1gLl4ZAfoCBJe5OSUtBJ74yl/XhLTxZf6h+4ZyAIDVLUy54JtKoam5QoEBCdYD+qukPOcqbTb6MZDPFjhJsHFS4mrMDrtsMfd33VzO0RtYTEEYhkvCAdGUrt65YGgfgqq4L43pxmns5+/GlOW02N1wSXxykkx2YAlT5TCfXvDz8WrrzB/HYVhO3NBV91iqiTTauez9GPu7Lj+l3iLq4+SYISkLCBTytse7bcFymIiu7o1lmC9gK327qvQoh6s5U+DdYs0ReSxWFcb/UCGQjgFRDC8wZ2sj6DCMqPDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qETIum2KYwGc7vEfg46uyhkEvvddZG32/0wkkAWfUEI=;
 b=RlxtWk57yEJVS3uSJ7fCsJ6lcS97nPjWdvCMAQLcGmDwQ5fm4M2rywq0A72Qeg9MJc4rNORUzTHGx3+ksDRlgy1LWgwMZEcPbHCdGM/x2pry2x4qT7nyTtPWw32fW2u5Tvu2A650KdFMBr6nrB6dsx0TNyOm/FER1X/HpvQ7tJ6ccZm4SCMUYl9EOVetM3+aUoH261wsQsqYWEWvRGTGjycGmJcsqxsZy0OM53q6QZ3yissAHr8C83oWxDhK3aYcU7vSuO7u7uqXukz9SuyDiAGH68nNzQx15yEkE92kQPxNf6y1wR8kvMsQS7CCZtbq4PTPIGzrewz/7LF7/WLlWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 10:35:03 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::6eb:99bf:5c45:a94b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::6eb:99bf:5c45:a94b%3]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 10:35:03 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
Thread-Topic: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
Thread-Index: AQHY7xGUTp4lUVPML0yWgaOmsA79Vq4uXPOAgADckACABM0oAIAAOK8AgABMrwCAADXwgIAAG2aA
Date: Tue, 8 Nov 2022 10:35:02 +0000
Message-ID: <4ea4f8422b22486717239b39a0c206e7a91d49a8.camel@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221104071749.GC1063309@ls.amr.corp.intel.com>
	 <Y2V1oslbw24/2Opd@google.com>
	 <20221107214634.GE1063309@ls.amr.corp.intel.com>
	 <bf29fe1ac84cae8ddb06e566b56c653600a1901c.camel@intel.com>
	 <20221108054354.GA1708572@ls.amr.corp.intel.com>
	 <9890f67846f1c2c6a12bd086fc822f0762966223.camel@intel.com>
In-Reply-To: <9890f67846f1c2c6a12bd086fc822f0762966223.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|PH7PR11MB7513:EE_
x-ms-office365-filtering-correlation-id: 28b49618-ff8e-49fc-5549-08dac174e50f
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EFHMvj7I1yz7sZnu9UDrM4O3YcFgNcKtVXqye4FRiBAgQgV7hqhUxoAfqAH/3zWNBlcSJxVcSzL1PpmMl+T5qypZopMOcWafjryrp3f8kC+mPm38fIuEIb313BRm0aZmk+et/F8EBzjBTSTV7mGgnTMFUMNOuBuofYE54g0vql0O4tYEAmDM4LmM/qObuYoKuHSctZgIEZvaIR/7yOuUq8C7Hh4Ehp2//CAuOU7AwqeN1JPwu1jImgDaPT2+JkJnPo3DTIdwagR6YvNLQtX0g2VPPqCv4WlBRTYwZtXUt2Svm/K6g7jt3Mqbt5jUzEGDTC5oZt73Tga6N5jcQ3kY7hcVzuUtSlWT+Zn0XuQoyY5vmiWbIddnI3lXfMZePX/wBw8fNs7Xo+A0JfnPJR22xjea7M6FhU6u/Edz5tJDuxXXJ7Q01IXd29+ZukQQOJvb8f01V+J7+GC8AlvqdI7edwzFoccB5NJDBMHqs48wJNxhBejWu7Ozx0yHjHH98xlblXQ2S9qET3bD28UxXYcpDrhzwbPKVguWZAS/v1XG+uZ5yqSrnFntleCLaGIAC8JmHQPQFXwU5uQrYdDcgzWV1uEcFxo360MeU6t8TUvyiekLjM9+4lCVb5pLwtn8pB66YTebLS4NtM1uBoYVR11Yyf9GK4xfQhS+LYBtCyvo9gxRswu0pqD5l1OfV34fjcPuuPPQ8AJ5JPfZhcZEAIVFFLR0qOciVU7EW46y7oH5/lGa+XcfhjpeNhF8sU6hKBst
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199015)(36756003)(86362001)(38070700005)(82960400001)(83380400001)(7406005)(2906002)(5660300002)(7416002)(6506007)(186003)(38100700002)(2616005)(107886003)(26005)(122000001)(6512007)(76116006)(66946007)(91956017)(6916009)(478600001)(66556008)(71200400001)(64756008)(66476007)(4326008)(66446008)(8676002)(41300700001)(6486002)(316002)(54906003)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFovc1VFcXBGa2NUa0dTbXducnJ2UWJIdERGdktPOWxvelppZXlwUjhRYnVi?=
 =?utf-8?B?UUNyaFF0R2FPMGZRcVBOaW9rTHd2Wmt5SGxTSG8zakRpbWJHM0IxYVlKRWhB?=
 =?utf-8?B?SmFPWkVvQ0tYZ0lXVWJqLzRLTUY5MitMVHd5dk9hbzlCUFllMEpTSk04bDBh?=
 =?utf-8?B?VnJZRlVXdSs3MGxKT2MwS1hxQU5WK3RLV2lpUjlrczFqY1NBK2FqOGxQRXZj?=
 =?utf-8?B?ZXFLaGhLeVFzeGpmUUNVY2h1VHBkSHJKTHY1M2VjWHNVN1NYd09HZDZDTE0x?=
 =?utf-8?B?MVRsbHBDVG5adFRjdHZ3VU1QNkJ0cVoyeWl1MFk3Y3BzSUhybDB5bUxqa2VK?=
 =?utf-8?B?RWlvWGc4ZTFZVEJaTVJudkd4NS9PVWRYaTBuVU0waFVWQWd1Q0xxRGdpMjZM?=
 =?utf-8?B?eXpNZ1JGbStaOStOT3NZdnRXRzNmWGNBSzBXbm9qTVFDejJQRjJvMlFxQnRO?=
 =?utf-8?B?OHdiL0NyZHRiQ0NzQmxFVWppa0NHL0duSEl3T3VWSTdjcVJ4WUc1NmVTeE9w?=
 =?utf-8?B?UjliS0M2T3V3d2NTdFNsdC9XNXRBTy9vaE1uZlJWRjdvSElGL3U1RFFGelk0?=
 =?utf-8?B?Y2tER0pySEkwSDNvU2hUVkpkZU5Ga2FtRVlGUWpHaTY4NzgvbC96NXZFaFZu?=
 =?utf-8?B?T1ZNb1NodmZVa1Zrb1l1aFlHa3k1aTVKZzdJcnExTGR1ajMrNGJ3ZytMQlZT?=
 =?utf-8?B?czdOZVB4T2VMbnJKTlllSjVMUDVCTHo1QU9DaU9QL2NRZVBoSjhsN1hKWFZr?=
 =?utf-8?B?NS84MVBaM21nZ2dtdWlubGVZcEZTVDM5T00wM0h4clUzemkvNkhleDVlc2Vj?=
 =?utf-8?B?U1dUN3RNdlA5WjdST2hURXVlWFNVNWZ3NGtUZjFsR1BPSCtUT09qeERadFdZ?=
 =?utf-8?B?Z1N4QTNoeTNGcGx0WWtuZUNubnQwOHk1K0wzc1dZNWcvaXRySXhDQUpqVkRk?=
 =?utf-8?B?bWdrV3REY1U2NmZYU2JxTWNQWG1kMUs0UkJ4elpWTU1VM1JyVHpodUkyKzRG?=
 =?utf-8?B?MThMV0cxdG92Q2tGQUdCSVM2WDVURC9FaWpsWEdsd244MUdldVJ5TmxybDZJ?=
 =?utf-8?B?RmpNT2tmK0R5Tk1NU0NROE1YTEcveFFxdkpqemdIT0dSNkdtZHBSWXRNcWxi?=
 =?utf-8?B?MFRhOU83dHpqY29qTHo3T1Q0cWhPMEF4R2pwdUlDL1hmVjVabXFmLy9BWWYv?=
 =?utf-8?B?T0N4aWY0b1lORi9MSHhCMmlUeFFkcHdubGRzL2REMUdEbUZZcWpKUTJlcGI1?=
 =?utf-8?B?elVmWFdlN0FuaGlORjE2cFVxZUF2T21MMk9kSEkvM0x3K0JzTFFHNWVTM0Mw?=
 =?utf-8?B?b3BYU2lQTGNuMGp1Q1hKOEJyTkRJa2ZuZDcvTXdJbkZkRFJwYVN5bVl6WEhU?=
 =?utf-8?B?MndYRndxRjErOTFRUFZTNHUrSmY1aG1MMFgxVFZaYmRkSjZqSHY1TXhBS1Vm?=
 =?utf-8?B?WGlBUTlMcXB5djdQYUNvbTBYSG4yckNSZVAzS2Y5b1Y5YjlZaHpvK0tXdytK?=
 =?utf-8?B?bzM4cXdMQzEzZGpGZjY2cVdTZ1UyUXBMakJEMyt3VytRSWphM2VubFNRSHBH?=
 =?utf-8?B?c1VUa2d5NTVLaXg5SDA4UGxkRXFJLzMrRVRPSFFtdU13MTJ0a29WM3VtMDc4?=
 =?utf-8?B?a2NvdDFqS1lBcXJsZklFVjM3UG45Z3ZsWitTeFpIUkFrRDQ5UnlJVENWQTc4?=
 =?utf-8?B?NnpiWml0Umw5NkNHV2picWxUQzFPdS9pS3h0YWhLQitnWDNGb2s3ZEpHeUR0?=
 =?utf-8?B?MjZmNVBpcHhVL05EZ0hWQmNiUDJqSDdtTEhSRTlEc2NLbG5lTEVwOWlLYWh2?=
 =?utf-8?B?OEhNRnBMczFnMHhVOUFFUkY5Vkt3V29BaXRlbmFTbzVsRm02TW9rdkRqZlo0?=
 =?utf-8?B?SWpocjB1L0tOM0VvUU1mcHdjYUlxZHNrK2UyOVF0bHdZaFN4RGZKVldRVWUr?=
 =?utf-8?B?YTA0ZTQzdFhkR2RtdDlKRWVtK2pPTzFwcjJJR2tiVkZKNkRodFFVR0RaS2tw?=
 =?utf-8?B?dG1MWEtsOEZDeDRLMWJKTVdFTFd6bkR1cEhOd1VzMWF3V2tNdDhGN2NYM1RZ?=
 =?utf-8?B?Y01YY0lTUVNvY202eHNXOHFxQUFUWXlmaENOYndjdDI1cGU0Yk5CbWlyWEtk?=
 =?utf-8?B?YUZHRHZtS0JNc3FXVUREZlpZTlA1aGI3Q25OREhaR3hVZUhrc2ROWXFnVklG?=
 =?utf-8?B?MHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29C96261C107024F81A22260C6B7C04A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b49618-ff8e-49fc-5549-08dac174e50f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 10:35:02.9231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BGpd/xqpcNQRreIBOeohnpoO/4LrzcGf3XilZADIvgXV6u6g86+e6qRV2fANY5077fjOTQ0vyt0wMi0Xd3yvpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
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

T24gVHVlLCAyMDIyLTExLTA4IGF0IDA4OjU2ICswMDAwLCBIdWFuZywgS2FpIHdyb3RlOg0KPiBP
biBNb24sIDIwMjItMTEtMDcgYXQgMjE6NDMgLTA4MDAsIElzYWt1IFlhbWFoYXRhIHdyb3RlOg0K
PiA+IE9uIFR1ZSwgTm92IDA4LCAyMDIyIGF0IDAxOjA5OjI3QU0gKzAwMDAsDQo+ID4gIkh1YW5n
LCBLYWkiIDxrYWkuaHVhbmdAaW50ZWwuY29tPiB3cm90ZToNCj4gPiANCj4gPiA+IE9uIE1vbiwg
MjAyMi0xMS0wNyBhdCAxMzo0NiAtMDgwMCwgSXNha3UgWWFtYWhhdGEgd3JvdGU6DQo+ID4gPiA+
ID4gT24gRnJpLCBOb3YgMDQsIDIwMjIsIElzYWt1IFlhbWFoYXRhIHdyb3RlOg0KPiA+ID4gPiA+
ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2ggc2VyaWVzLiBJIHRoZSByZWJhc2VkIFREWCBLVk0gcGF0
Y2ggc2VyaWVzIGFuZCBpdA0KPiA+ID4gPiA+ID4gd29ya2VkLg0KPiA+ID4gPiA+ID4gU2luY2Ug
Y3B1IG9mZmxpbmUgbmVlZHMgdG8gYmUgcmVqZWN0ZWQgaW4gc29tZSBjYXNlcyhUbyBrZWVwIGF0
IGxlYXN0IG9uZQ0KPiA+ID4gPiA+ID4gY3B1DQo+ID4gPiA+ID4gPiBvbiBhIHBhY2thZ2UpLCBh
cmNoIGhvb2sgZm9yIGNwdSBvZmZsaW5lIGlzIG5lZWRlZC4NCj4gPiA+ID4gPiANCj4gPiA+ID4g
PiBJIGhhdGUgdG8gYnJpbmcgdGhpcyB1cCBiZWNhdXNlIEkgZG91YnQgdGhlcmUncyBhIHJlYWwg
dXNlIGNhc2UgZm9yIFNVU1BFTkQNCj4gPiA+ID4gPiB3aXRoDQo+ID4gPiA+ID4gVERYLCBidXQg
dGhlIENQVSBvZmZsaW5lIHBhdGggaXNuJ3QganVzdCBmb3IgdHJ1ZSBvZmZsaW5pbmcgb2YgQ1BV
cy7CoCBXaGVuDQo+ID4gPiA+ID4gdGhlDQo+ID4gPiA+ID4gc3lzdGVtIGVudGVycyBTVVNQRU5E
LCBvbmx5IHRoZSBpbml0aWF0aW5nIENQVSBnb2VzIHRocm91Z2gNCj4gPiA+ID4gPiBrdm1fc3Vz
cGVuZCgpK2t2bV9yZXN1bWUoKSwNCj4gPiA+ID4gPiBhbGwgcmVzcG9uZGluZyBDUFVzIGdvIHRo
cm91Z2ggQ1BVIG9mZmxpbmUrb25saW5lLsKgIEkuZS4gZGlzYWxsb3dpbmcgYWxsDQo+ID4gPiA+
ID4gQ1BVcyBmcm9tDQo+ID4gPiA+ID4gZ29pbmcgIm9mZmxpbmUiIHdpbGwgcHJldmVudCBzdXNw
ZW5kaW5nIHRoZSBzeXN0ZW0uDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGUgY3VycmVudCBURFggS1ZN
IGltcGxlbWVudGF0aW9uIGRpc2FsbG93cyBDUFUgcGFja2FnZSBmcm9tIG9mZmxpbmUgb25seQ0K
PiA+ID4gPiB3aGVuDQo+ID4gPiA+IFREcyBhcmUgcnVubmluZy7CoCBJZiBubyBURCBpcyBydW5u
aW5nLCBDUFUgb2ZmbGluZSBpcyBhbGxvd2VkLsKgIFNvIGJlZm9yZQ0KPiA+ID4gPiBTVVNQRU5E
LCBURHMgbmVlZCB0byBiZSBraWxsZWQgdmlhIHN5c3RlbWQgb3Igc29tZXRoaW5nLsKgIEFmdGVy
IGtpbGxpbmcgVERzLA0KPiA+ID4gPiB0aGUNCj4gPiA+ID4gc3lzdGVtIGNhbiBlbnRlciBpbnRv
IFNVU1BFTkQgc3RhdGUuDQo+ID4gPiANCj4gPiA+IFRoaXMgc2VlbXMgbm90IGNvcnJlY3QuICBZ
b3UgbmVlZCBvbmUgY3B1IGZvciBlYWNoIHRvIGJlIG9ubGluZSBpbiBvcmRlciB0bw0KPiA+ID4g
Y3JlYXRlIFREIGFzIHdlbGwsIGFzIFRESC5NTkcuS0VZLkNPTkZJRyBuZWVkcyB0byBiZSBjYWxs
ZWQgb24gYWxsIHBhY2thZ2VzLA0KPiA+ID4gY29ycmVjdD8NCj4gPiANCj4gPiBUaGF0J3MgY29y
cmVjdC4gSW4gc3VjaCBjYXNlLCB0aGUgY3JlYXRpb24gb2YgVEQgZmFpbHMuICBURCBjcmVhdGlv
biBjaGVja3MgaWYNCj4gPiBhdCBsZWFzdCBvbmUgY3B1IGlzIG9ubGluZSBvbiBhbGwgQ1BVIHBh
Y2thZ2VzLiAgSWYgbm8sIGVycm9yLg0KPiANCj4gSSB0aGluayB3ZSBjYW4ganVzdCBhbHdheXMg
cmVmdXNlIHRvIG9mZmxpbmUgdGhlIGxhc3QgY3B1IGZvciBlYWNoIHBhY2thZ2Ugd2hlbg0KPiBU
RFggaXMgZW5hYmxlZC4gIEl0J3Mgc2ltcGxlciBJIGd1ZXNzLg0KDQpTb3JyeSBJIHdhc24ndCBy
ZWFkaW5nIGNhcmVmdWxseS4gIFBsZWFzZSBpZ25vcmUuICBXZSBuZWVkIHRvIHN1cHBvcnQgc3Vz
cGVuZCA6KQ0K
