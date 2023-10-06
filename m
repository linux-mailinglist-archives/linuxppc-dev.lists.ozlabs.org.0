Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A777BCA80
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 01:40:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TzY645S9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S31xN6BTrz3vhr
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 10:40:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TzY645S9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Sat, 07 Oct 2023 07:02:49 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2K955JRvz3cgW
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 07:02:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696622570; x=1728158570;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=w18bicPFsa6muxGkgTV16Ht3yE15FqqvBTrUOmV0dfc=;
  b=TzY645S97HwpbPGscNlyRfI+4QLiDHQRq145vt4jrZVAzThybZOMzw2w
   ycqHxzj0gWUmYnR+eM4rPs4zMWLy3gpI8y3/VnrMMm/X6ob6Jj1MIzI0x
   arzjLfpsgQ9LCrlqSlqUPYCwIdEkp6EyrCrfiUUOVAkETfXTNspKW2WEQ
   esYH8pdV05Gb74wC7hl037NDkHch1F/D49ioIoWythc9QszOByRb+gpIe
   Fy/hvS0/pmpGbd+4iFYU64dj8iRPnUuQMqhAj+936LKz62XecT0121Ajz
   63dIv2xIq7EvBDJzkrJ/Vm0RlN/dRqzxiBXIDYSscPM03ujsE8juKe4Qa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="383710517"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="383710517"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 13:01:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="842947806"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="842947806"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Oct 2023 13:01:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 13:01:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 13:01:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 13:01:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 13:01:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDLREd1fmnJhWqMT+I3tNpL/XXE+IfEwf+CtlaNUhpAw5L/D8ZN4b6n32qSmyCR+Ktsbvr8Tz3kfW7pMYtWBQcEUtbIRc4/J0/CfT7NXmz7aPQA4/+hj6QEt7U1W+L4shGU6Uwt9KJXumLZfiykp1Lng1Ki0CY9qGbvMuZKnITSm0hNEInWajSPHklyou+/SMBM5ox3yu1f5K7khibVho2f5LVjbJQVaEZtH1cmGlIHxi38U80RCdjgBlkh/DrXs94moeit3SGtiBeLscK79N97x0x7AnGsVHjbDdYhAFVCaFUl4EGMhHL/3bjkc1iIsLv3BP4nbw/hSPZg/uccb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w18bicPFsa6muxGkgTV16Ht3yE15FqqvBTrUOmV0dfc=;
 b=YABE15NdwbB79Pd1NDFGK14mnTv9LUhNb8X/bLBz8kyhF53eDohBLVibU0JusdTPCyhhWKXzLYkwM7tF5dWjwUJdpbL6aSO0Zqua7XD9XEmOJk+G5xm3knVT3F56q28+OsXcpqjjOKJ20M8UdIdwsFu/J+o86Mdp66Qwh2Q6VxeVh/QzVCPIBU69f/sdnUw9Rsj1Kbvd4F1m7ce2GXYT4j4xQAzVQ6CwESWMik7sQTLWfAGcei5YNeBcnsW7CswsF9uMeBOrgz8uo8KXgIfT5q/avdr3vphTGLK4bzY3kKvGCCNKL2fmG64WgK3yZRuVRj4G9zeURvf1SLICVEBtnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24; Fri, 6 Oct
 2023 20:01:31 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::56f1:507b:133e:57cf]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::56f1:507b:133e:57cf%5]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 20:01:31 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Mehta, Sohil" <sohil.mehta@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "arnd@arndb.de"
	<arnd@arndb.de>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>
Subject: Re: [PATCH v2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
Thread-Topic: [PATCH v2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
Thread-Index: AQHZ5z2WzPjTzalN7Ei06VoIKvvJZ7A4YMaAgAAFboCAAAaGAIAE5JYA
Date: Fri, 6 Oct 2023 20:01:31 +0000
Message-ID: <3bd9a85c6f10279af6372cf17064978ad38c18b3.camel@intel.com>
References: <20230914185804.2000497-1-sohil.mehta@intel.com>
	 <487836fc-7c9f-2662-66a4-fa5e3829cf6b@intel.com>
	 <231994b0-ca11-4347-8d93-ce66fdbe3d25@app.fastmail.com>
	 <622b95d8-f8ad-5bd4-0145-d6aed2e3c07d@intel.com>
In-Reply-To: <622b95d8-f8ad-5bd4-0145-d6aed2e3c07d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|SA3PR11MB7655:EE_
x-ms-office365-filtering-correlation-id: b2d26037-faf1-48cc-8352-08dbc6a708bb
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jaX1Pd6ew70OEJ8SnmQTMbzU9crA0n7TyQtG7/s7zq10nJhRlgLbrqT0kTBhRbQs0DeG5Q2OUSC1sf5Zc9kZagmBl3/eL0BiVJSjjeG85LNAZYY3wxlXvlRe0wRukh6SeX7+N3xukFsa03O/SM8F0Demp1Z6QT9JeVL5ENgdlRhKdenh3mewROtbcUsS/etkIpw74dcp7e+8xImLOqUgmUmTGSq5PKoA/qlKVqGIBfjn6w6bqIR61kxRga5h3hQhQDnTfaO4SINf4Qn7y+OyimJ9JsyICSus1F+IOQfSCiL0KMKRJrrTHs6KEN7uvKYMKZZSxrCF2fNilvF7IMm2A8usqSZ1Ace1XLwD3TribKZPdRqHO9H/rpK/mzApDcPgN1Ixl0s0T9MH5bWvQoYsft1wTHdBYCxJXNYGLg3w99Bck/0S5QMiQVAeEr2sBKe+RjVKL9rMyIb1DB1tVHUcTHDpIU7Bd+LczGtIBhByVdbxiojQ7my5E07ystRhjWZ6332/bFlwHpQNKHQq4qToCTOvvWwNmJ/b9nuCyxfZN4OP6dZGnd1KUh5iPwWqFCcV8lYaq5IhemEgiP/PwHsgIGOP5vMcy/AnKzrncxauXVNcFLWX0Fe4ReD7fOA2v1yD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(8936002)(2616005)(66946007)(54906003)(66446008)(66476007)(66556008)(64756008)(316002)(41300700001)(6506007)(86362001)(6512007)(26005)(36756003)(71200400001)(6486002)(38100700002)(82960400001)(122000001)(478600001)(76116006)(110136005)(91956017)(4744005)(7366002)(7416002)(7406005)(38070700005)(2906002)(4326008)(5660300002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDNCTDcvd3F5djFlaDY3QTQzVDU0Y2Z0VXZ2aGlpTFpla01XU2Q2YnA0MEhj?=
 =?utf-8?B?bi93bUtpZUlEVDVZR0ZGTmJ1bS9BNE8xcm9vbmtRQmtwb0taQmhQclFkbEV4?=
 =?utf-8?B?UUNtaURuUGFFZ2JjeFJJMyswc1VXckJiRlZ0WFVYTkd0c1hWZmZuVm1QdWNZ?=
 =?utf-8?B?NnhMYjlTZzRXcTN5VVg3RFNFWkd2ZkdJR2lya0lZMmMwbXJ5MXZkTnc1d2Y4?=
 =?utf-8?B?NjhvYmlVc0NxMlo4M2VFL010d1psdEVpclJNV0JUdXgvUVQ1bUZCbit5MkRx?=
 =?utf-8?B?UjE4alpMYU1xTlZsMjVOSFBOcWVWZE91TjVsRzZpTmlVV0JSK25MS3JXYzFs?=
 =?utf-8?B?TWRSUUpYM0p0ZklrNFJFNGhxRFR3a3ZnNnRxL0JFMjFad1J2bEY3VEduVnVo?=
 =?utf-8?B?YnlSQnYyaGxHanBnQlVZN1o0MlpuYlpGZExMNE5YM0lzQjlvNnI5VHIydldy?=
 =?utf-8?B?RGFhZ2pRUy92QTl4MnBtYXE2czFDcEZEeVd0dW1QNDJreUZ5TjB5cjRlZ2FV?=
 =?utf-8?B?NlRJMUpCb3NybFRZcjI4MFFhS0dXVmpBclFTeG1kdTVMQlpOTmNmZk9lYmRl?=
 =?utf-8?B?K3pPdkl0cmJCVHNWbGtBYm9TZ24vNFZRVVMwYmlmeWVaYmZsekN1ZDZIeENt?=
 =?utf-8?B?YWJEZkVPbm5rYVVFdTJBR05IenYvakVZdFArY1J1WWRJWW84d1lqS29QVkwr?=
 =?utf-8?B?RWMxa0MrTjZTMEpJVkw2cGFBRGVmWS9TTEhHaFp2TXMvRmZpekwvOUFoWGpM?=
 =?utf-8?B?OEFJMGFRWktodXlpdnRqNU8wOHI1YlRNRTA2RG1CYnBsQWpqSkhobk95Rkpi?=
 =?utf-8?B?eWg1U29vbWdvZXFCZjVDSzNKRmtBd3U5dXp1NDV6cE8zVTBocm82VitZSW5n?=
 =?utf-8?B?L01PZlM4RzVWWmkvUUFxZWoveGo0Uk10VnRlWmJiR1lGQ2FXbThIdHJIRUF1?=
 =?utf-8?B?M1FRWEV5UkE2cWRsQTZBSDRjR1g5M0lSWEJnTUxwd0NMM0ZGOVJ1bnBYaFNQ?=
 =?utf-8?B?SWNXNHplYjhFNnFESURKSlNvVGlVcW1BRmUwSzRJL1V1SCtuUDVtMlZ4bFBK?=
 =?utf-8?B?NWh3VG9PaWJybGUyd1NIelR2c3BHWXVwNGRPZFB4UzR5SllyK2dneW9mTlk5?=
 =?utf-8?B?QS9XbFNjQlUwMnJMMWFsckFvbFhoWURxN0ZBc1JFUHUvbWZUYmw5TXVyZFN6?=
 =?utf-8?B?b0V3OXNTdmkweEIvdWx2YTF4NHIyYVJYWDA4ZEwzdmJiNm5LK0xRSDJucEdF?=
 =?utf-8?B?RkpyU2lxdzhPc3krZTZhSkhzdVhJdkFQWHNGM1RFMVM0Y3BpSWQxTmpsQ21a?=
 =?utf-8?B?eTNieU90emk3L1FDdjgraUR1akNnWHorOHd4V25TRWFBRWY1WUc1Z3FndVNU?=
 =?utf-8?B?TEpPeDduYWM0c3FvTDQ3STYvdEd3dVd0WlRSVlI5UkpKUFhFY1RVWElIcXJH?=
 =?utf-8?B?eWRuOCtNSWJSSVRlU0NOSk1oUlRoaWpFRWgwVjYzNlAwWk0zSFlSdGxoMTFS?=
 =?utf-8?B?b0lVanpyUTV0L09POHJlRnREZlJmQ1hNeE94ekNvUC81Q1prYUZSMTlnZnpN?=
 =?utf-8?B?dVNzRUV5UnAxS0g3K0doaGJoMzNMTWVERlNLMlB6WXNjcDBvK3Zmc0w4eloy?=
 =?utf-8?B?SUsrYy91TVdzV2ZQN3gyK25DN3NkTUVBOW1SNVEwZHNJR0h6NFJLZVdhSFdE?=
 =?utf-8?B?Y05ZcEhWa3JNbGY2VThFTGV2V2JWRm8rakdFMUJqbEpGWXFjRWhuVXZiNzBN?=
 =?utf-8?B?b3ZhKzNrNHVwdDJHNS9UYkFLWTJhYjl3WjBSbng0UUdyUXRUSWp4VlllcFgy?=
 =?utf-8?B?Skl6SUQ5czhzQzZNclhKSXBCNDRkWGpmZFlCWm1uM2ozNnpQdmJSa0NSRXAw?=
 =?utf-8?B?bUVSOHRZS2Q0d2Fuai9mYjh1akljc3JlYjlLbUwyTnhMamJTcDNETU5wS0VQ?=
 =?utf-8?B?dEg1ZDNFZFV0T0RhOUpadmw4R2s2Q05URzVWdGpMb2RnbGRMakVjL0dhbmxM?=
 =?utf-8?B?RllsZEZjbnlLVGZZU3JNU0owbVJ2WTVpdFp6dE1HbGZxb3pqdmR6YkZ0UWow?=
 =?utf-8?B?ZllzckNyMEVMTXVnOUFnd1hEZnlGREg3VlgyZCt6ZlZmMVNBUzFqdWdFR0d6?=
 =?utf-8?B?QlBRemJHVnJibkZLZ0crVk9obmNvQ1ZDQ1NxUVFVMU1QNFV2SldkdG53bG1r?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C2B3A20E2357943B9266903966FAF59@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d26037-faf1-48cc-8352-08dbc6a708bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 20:01:31.1308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+a1VFJnoIQj7e9E6vA7aNpD9bLEnNFQ9SCLb2RbHpQ+n+fwWkFOHk4aPyQw6o99d0pByBmjyl6/DnKmvIfacs1wG89qpEjTdZ0PYDilOxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Sun, 08 Oct 2023 10:36:54 +1100
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "irogers@google.com" <irogers@google.com>, "dalias@libc.org" <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "Hunter, Adrian" <adrian.hunter@intel.com>, "James.Bottomley@HansenPartnership.com" <James.Bottomley@HansenPartnership.com>, "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, "schwab@linux-m68k.org" <schwab@linux-m68k.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "will@kernel.org" <will@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "deller@gmx.de" <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <
 linux@armlinux.org.uk>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, "mattst88@gmail.com" <mattst88@gmail.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "slyich@gmail.com" <slyich@gmail.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "brgerst@gmail.com" <brgerst@gmail.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "richard.henderson@linaro.org" <richard.henderson@linaro.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "broonie@kernel.org" <broonie@kernel.org>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "acme@kernel.org" <acme@kernel.org>, "Lutomirski, Andy" <luto@kernel.org>, "glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>, "namhyung@kernel.org" <namhyung@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" 
 <linux-arm-kernel@lists.infradead.org>, "debug@rivosinc.com" <debug@rivosinc.com>, "chris@zankel.net" <chris@zankel.net>, "monstr@monstr.eu" <monstr@monstr.eu>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "rmclure@linux.ibm.com" <rmclure@linux.ibm.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIzLTEwLTAzIGF0IDEwOjE4IC0wNzAwLCBTb2hpbCBNZWh0YSB3cm90ZToNCj4g
PiBJZiB5b3UgbGlrZSwgSSBjYW4gcGljayB0aGlzIHVwIGZvciA2LjcgdGhyb3VnaCB0aGUgYXNt
LWdlbmVyaWMNCj4gPiB0cmVlLiBJZiB5b3UgdGhpbmsgdGhpcyBzaG91bGQgYmUgcGFydCBvZiA2
LjYsIEkgd291bGQgc3VnZ2VzdA0KPiA+IHRvIG1lcmdlIGl0IHRocm91Z2ggdGhlIHRyZWUgdGhh
dCBvcmlnaW5hbGx5IGNvbnRhaW5lZCB0aGUNCj4gPiBzeXNjYWxsIGNvZGUuDQo+ID4gDQo+IA0K
PiBEYXZlLCBJbmdvLCB3b3VsZCB5b3UgcHJlZmVyIHRvIHRha2UgdGhpcyBwYXRjaCB0aHJvdWdo
IDYuNiBvciBkZWZlcg0KPiBpdA0KPiB1bnRpbCA2Ljc/DQo+IA0KPiBJdCdzIG5vdCBuZWNlc3Nh
cmlseSBhIGZpeCBidXQgaXQgZG9lcyBoZWxwIGZpbmlzaCB1cCB0aGUgc2hzdGsNCj4gc3lzY2Fs
bA0KPiBhZGRlZCB3aXRoIDYuNi4gQWxzbywgaXQgbWlnaHQgaGVscCByZWR1Y2Ugc29tZSBtZXJn
ZSBjb25mbGljdHMgbGF0ZXINCj4gaWYNCj4gbmV3ZXIgc3lzY2FsbHMgYXJlIGJlaW5nIGFkZGVk
IGR1cmluZyB0aGUgNi43IHdpbmRvdy4NCg0KSGkgQXJuZCwNCg0KSXQgZG9lc24ndCBsb29rIGxp
a2UgYW55b25lIGlzIHBvdW5jaW5nIG9uIHRoZSBzeXNjYWxsIG51bWJlciBpbiBsaW51eC0NCm5l
eHQgY3VycmVudGx5LiBJdCBtaWdodCBiZSBuaWNlIHRvIGhhdmUgdGhpcyBwYXRjaCBnbyB0aHJv
dWdoIGxpbnV4LQ0KbmV4dCBzaW5jZSBpdCB0b3VjaGVzIHNvIG1hbnkgYXJjaGl0ZWN0dXJlcy4g
QW5kIGl0IHNvdW5kcyBsaWtlIHg4Ng0KZm9sayBhcmUgb2sgd2l0aCB0aGlzLCBzbyBpZiB5b3Ug
Y291bGQgcGljayBpdCB1cCBmb3IgNi43IHRoYXQgd291bGQgYmUNCmdyZWF0LiBUaGFua3MhDQo=
