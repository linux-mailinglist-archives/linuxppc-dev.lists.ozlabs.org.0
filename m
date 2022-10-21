Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F7606E92
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 05:58:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtrLK6Mxbz3cfQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 14:58:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MAwwSEaM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MAwwSEaM;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtrKJ1N93z2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 14:57:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666324676; x=1697860676;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UoeGhhJfg9RqM8bgRUh7KQy7OPJaGBWDOYpCQr+g19s=;
  b=MAwwSEaM/czPbRR2oFcFP73CqgrOVnzt/NTLJkjHHjFntSC1tLa6CuWt
   M0iohGNVju+GuKbaXCd6xL3KOPKshrYVulR+HhcOWjrryvfvDoU8nmaVg
   0TsbqadxPf1fmyJbv2o6H4ksT4yPtPzrARlk8Qg14uggTry5SmqXJkufh
   7Kg8+hwH+u/r95SsnDFa1bOMO9S3jkDRk+o5pzN6VZP75GXPp6ja23xDP
   tr2OTHXQ6HcxoV4G9gsFm7MHhNwcfLAwf6j74XPBPl61MZGTvNPuz3nUU
   ad9TQkUwqw3nqzbJlHA+PfiQ+lA1m4kTjXxGd/e1gS8zg8grLwkB03oik
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="368951341"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="368951341"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 20:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="735293209"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="735293209"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP; 20 Oct 2022 20:57:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 20:57:44 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 20:57:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 20:57:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 20:57:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXSUT7KZ8v9Gjc4g3CPuwaIYIplPeBeZrRxyAeccTNDjmpEhEp6rvwUSb9GyeFzjE126g+RhWEbu5vWRIakGvLMRevlIyGh3FPcCNboh7jKdW63sNw0CFKKRm66dHTzE244cWvH0GIB3os7AOQtC3vi9qokJ7hj/6k+DUQc87rrT/ziLkB5MX0gNhmYRsi6irKTBDWagwv0VqxJRCG6WFLf3cv2ItyVpLU3FN6JgREo0LQ2jvnImzeEFZ5pyzPiuJwBnE4WrzwbPdge46ymJb38otiY3uoiyBdMZQNUf1ZEaOlKlwBoXc0wTYHd+JrxV7LMFg7rRUOfE/ruShuJN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoeGhhJfg9RqM8bgRUh7KQy7OPJaGBWDOYpCQr+g19s=;
 b=KOpdhDZbhKyT/MyyL2J8KyjwyjoPUM+pjDn1PBmewKo/I0D4D68pGrWvwVrjVvn2UasYx2bdAbS/8yzUfikukAaiSeImHQbgdHKU9RQ8YzoKbt1qhLeCKjoEhDJXAg71fJ1wy/aEVDEzbH+vM3LXuFO5p/kEP9FfRW895LD3XcoV5HbXFaA5/Rub6Eeh+XK7qE5jtPTlaX7Gl4LdFq/BlOKiP0WByZelISdYgpxv7ItiItszpZsfInIrygW+anUmx6+hsy5QNJlbbjov5wIfmJLuGeoarGhUf7k9IvpN0GEV+DENF+tiU4Xbzlrx3F/E3aE7QDU5AZkKOt6hRGPuPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32; Fri, 21 Oct 2022 03:57:33 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::10a6:b76c:4fb1:2d60]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::10a6:b76c:4fb1:2d60%6]) with mapi id 15.20.5723.033; Fri, 21 Oct 2022
 03:57:33 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Subject: RE: [PATCH v2] mm, hwpoison: Try to recover from copy-on write faults
Thread-Topic: [PATCH v2] mm, hwpoison: Try to recover from copy-on write
 faults
Thread-Index: AQHY4918CFTupvxOP023uLR6ydGaFK4WhsUAgAGNU5+AACXZ4A==
Date: Fri, 21 Oct 2022 03:57:33 +0000
Message-ID: <SJ1PR11MB6083C2295753E7EDAE0EFA0FFC2D9@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <SJ1PR11MB60838C1F65CA293188BB442DFC289@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20221019170835.155381-1-tony.luck@intel.com>
 <893b681b-726e-94e3-441e-4d68c767778a@linux.alibaba.com>
 <Y1GqGbBNk6fX/OnD@agluck-desk3.sc.intel.com>
 <900bd42d-10c2-e83d-80ad-5c1fa94e8d94@huawei.com>
In-Reply-To: <900bd42d-10c2-e83d-80ad-5c1fa94e8d94@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|DS0PR11MB6399:EE_
x-ms-office365-filtering-correlation-id: 8af630a6-108b-4913-26f5-08dab318624d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7StHzhRo1VbmflmxsGRaSy+LN+zTG1/6r5POjQidqJG+OakTScDQyTBPQ31yENk2+bgPqu+yFAR/na1M4zpiVLMAis52Wm4SCo87vrq3E1UJex2ChCal1Fu03wjSiWvvFYoFSULXVACuTkJJekHym9JOKwNNORyVwIQ0a0J82T2j29QQzNVkDmAIGlaiyxZC6brOyMzeq3YBPaHiN0szDojeR0cd31sW9fPwdJdS5yQzfx/wy6SURQbV1flW0fw5FBK6jMahdnjdlIsgjZQvrENtEc/6bkTV1ECAmxNExchgv0varuOW9e6xe9n30BSbAhyQij7pKsJ79jgubL960RrzREvo4N6om53gcxYr/WfX7tn+j1QTAkjN7MHSjnzcu7eluh8WkvH3fhgUsOQFrA8MjhQNKuFz1idr0Adi2EQSFGPznV7WR1GalV1nFmSPNTp8Qyz3xeJK6XfrTE1xCHc2T2rxrameQjeEMQFvuGepVeVwPoUSJKaYAhdbV353nUKDXoM39J0985j3avFJIfiLjW0+61t2Z/KtKmHdKVU4ny/FBJ8VwX7MIimWogkPAnTVQNGvZ9AGv+IfmVhxEeEPEZT+XlfupK+WCDqEDoieMIGX4c0P35bD4TSuzYLT5MsZqHwz8HvlMeVfX8SmIvHRmiqIPFP7YiWw5Ti96qeXsdxgE7rG+qbUr6i1rqXNin7BsIMW+fYHSDekvVQ4gWfFEu06cE6Q1Ei6FqQShroFr++vQ70zef3oe+1aSnDqo3YPfaG6uFjhd9tXFS0fzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199015)(7416002)(33656002)(52536014)(6506007)(66556008)(8676002)(66946007)(41300700001)(66476007)(38100700002)(4326008)(66446008)(64756008)(8936002)(76116006)(5660300002)(82960400001)(86362001)(2906002)(26005)(478600001)(83380400001)(9686003)(38070700005)(122000001)(55016003)(316002)(71200400001)(54906003)(6916009)(186003)(7696005)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlNqR2prZWk0TDdtL24zQzloc1hZYklFQjdZcnJwQWthVkY0VE5EOUdBYmdG?=
 =?utf-8?B?a2FyNVhXcjg0dS9nR2ZkV1RtUEZGSS9PNmxJVUlhUGwxMC9yTGx4MTdjdkl3?=
 =?utf-8?B?TzNhRFl6UThCdDQxTklDMWYyRGdhWEs1YzlGbkhkQU1nRmZLdTBtUGlGdUVV?=
 =?utf-8?B?amdqYTJGMFE4MWVqL0JvbjRvbjI0RDhxM05MT201b0wxS2NxMmpBbTg1bXFs?=
 =?utf-8?B?bVMweUhUalhNSjBMWURrZDRKTVQwNHl5U3Zkd3RVbTlMRklpbWdWVnVhV1lL?=
 =?utf-8?B?b3dTNTlKM0FhNE5OS0Q1ZmwzWnFPKzNpZHVMRy9nWWNnLzVCUDNQQWYwcHdH?=
 =?utf-8?B?cmo0T2oyYWVBUG9iQTliNlE3MGRpek9HVHRlODVsMDNTTTBGbnU2cEVJMlFm?=
 =?utf-8?B?bUVlTWZpeS9lMlVzcXFPaC8vTVZudnJQZkVZU1hjbmxiQU9xZm4yVjQ0dEs4?=
 =?utf-8?B?VXVHcndhN2NYdmNNZXExNWpoZ0hxeEs2bWg3YmJid0hVZVk3R05JOTZVU3B5?=
 =?utf-8?B?YndEYXhsMU5aTi9uRGpGMSt4dXJaaGZXNWJrSUQ2S2ZqRUw1WjN3b0pqN2hv?=
 =?utf-8?B?NDdPSStFdFFMNTU0bERjRndLaVNDZVlYMDUwcXRPWWVJd0xLY1FYRGc2L0pW?=
 =?utf-8?B?MGFUUXplb0E3QTQxN1R6aVN2bnZEREtLZ3RqNUhWZ0MvMHlJSCsxb09jZTlm?=
 =?utf-8?B?c2prYlRaQWF0SklYalhkcW1KdWF3LytlcjF3REZGMlZ0ZnZ0V3lqMFMyRnEz?=
 =?utf-8?B?WUdEZ294ZnhiTk9tWUJERTFwd0k5VnBZckFuRmRhREhScG90SVNHYWU3TXhn?=
 =?utf-8?B?c0t3eWhiS3hRVVJRem9ITGJydUVxMUIvVERUc0t2bkV3ZHpBR256MmFXYmFt?=
 =?utf-8?B?MVZJYVBYS0YzQWJ4QXJPUG5EbWR1dC8rREJ4Rm5PZ1gyV3ZwOVlCYXJ0d1Vw?=
 =?utf-8?B?ZzdUVHZuUXVBMHhzTWNCTDFjNks2YjZ3d0RmVnRwWVdSNXVTN3VManlIR2Rr?=
 =?utf-8?B?cjhtV3ZCbUVubFBVeHVueEErV2E2NksyU0lmTkJzLzR1b202NXF0bzR3RE1Z?=
 =?utf-8?B?Z2hWVy9acGpSVDZjamNNdzRPV05GZVNJNmZHa1NQZlZZU2FlQkdNNHB4WW54?=
 =?utf-8?B?TnRCRUJTTEhnejBVL2V5SjhKMnFJbVN6WFBzbXF4UTRmUHJxUVEycmJWN2N0?=
 =?utf-8?B?N2JPWTgrK0RWaUZTTkllbjJiazR4YnE1Y2ZwNnJ1VGpjQUNGUGFhUHZEdHU1?=
 =?utf-8?B?OFhGT1JkbjRJZU92Vy9UVXdkRzBwUDFhRGUrOEk2V1JrVGZHWG8vbkdLWXVV?=
 =?utf-8?B?N3pnMXdSR04rNWNYdkY1N203OE1HV1FVME1PQjB5N3RNd1hiVHdZWFphcmQ1?=
 =?utf-8?B?TmE2R0FPNHZ6WWExVDEwMUpEaFJJVVY1VlkvUjhhZGMzcjFZa2psSlpkZVNi?=
 =?utf-8?B?NDRmVzZZTjVHV2NyYklFSk5ST0RqelhPUHJTK0M5OUNMUDBUZlMzMFBDL08w?=
 =?utf-8?B?dVRuU3BVSkFCV2QxOEtubE5XcXQwZWtNbDZ0KzdXeXRiZkgrMllUUldOSGIy?=
 =?utf-8?B?VnNwNThGenIza3Z0S3lXQU9xYWhNdkpjcGN0anlRRys0K011SWp4RnRKVDVl?=
 =?utf-8?B?SElaVTBUR0tmelptZEJSV05CeXFGWkRJdTc0UjU3ejB1cUdWayt0dEdHWGw2?=
 =?utf-8?B?cjFOblhnTTEvWFJIS1lmTE44ZGk1Y2RuOTNJQVhEU1o3N1haUHpBV2NiN2p2?=
 =?utf-8?B?SG14RnNMNDFtNno5L0xqM0JkaEM5d3BRYmhudGtKYXd2YlhhTEprMjFrdzBw?=
 =?utf-8?B?bmVvZnRPanErOGlQUE5VdmNRRE9seEJybnRjZHpwMXNIRHNBNHRDTVl5bHhB?=
 =?utf-8?B?ckdpaVJyZWhSTlZBK3FTcmE3Vmx3NU5VYlhwNVMvSVZHRXpPSG9NRlhyek9B?=
 =?utf-8?B?cFZrNHU3akNWU1c2RGY2NGgrVWFLNTM2QThaQVQrWnZwZWJZUGZoWWRRVGp0?=
 =?utf-8?B?MVAyaTQ5eWcwRUlFZDlGeDBMcERvZzVTWE5ZUUg1elF3VEdvMU50NjF4ODNp?=
 =?utf-8?B?QnlqOVlUcVNlWU1od0tGWkhkempuanVyeDU1OFgvLzdHQ3VKQTZDY3drdEo5?=
 =?utf-8?Q?KcacpLUwwE6x00bBmKvoGSuQ5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af630a6-108b-4913-26f5-08dab318624d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 03:57:33.5532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uozflwIs613C64sYhu9CMu9leP/iuJnRbcaBvF2yn4k6/Yvj+ev6C0CqqRDrPPiYDB1Nu6lwrVYDN4Q2R71bxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6399
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
Cc: Naoya Horiguchi <naoya.horiguchi@nec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, Shuai Xue <xueshuai@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pj4gKwlJTklUX1dPUksoJnAtPndvcmssIGRvX3NjaGVkX21lbW9yeV9mYWlsdXJlKTsNCj4+ICsJ
cC0+cGZuID0gcGZuOw0KPj4gKwlzY2hlZHVsZV93b3JrKCZwLT53b3JrKTsNCj4NCj4gVGhlcmUg
aXMgYWxyZWFkeSBtZW1vcnlfZmFpbHVyZV9xdWV1ZSgpIHRoYXQgY2FuIGRvIHRoaXMuIENhbiB3
ZSB1c2UgaXQgZGlyZWN0bHk/DQoNCk1pYW9oZSBMaW4sDQoNClllcywgY2FuIHVzZSB0aGF0LiBB
IHRob3VzYW5kIHRoYW5rcyBmb3IgcG9pbnRpbmcgaXQgb3V0LiBJIGp1c3QgdHJpZWQgaXQsIGFu
ZCBpdCB3b3Jrcw0KcGVyZmVjdGx5Lg0KDQpJIHRoaW5rIEknbGwgbmVlZCB0byBhZGQgYW4gZW1w
dHkgc3R1YiB2ZXJzaW9uIGZvciB0aGUgQ09ORklHX01FTU9SWV9GQUlMVVJFPW4NCmJ1aWxkLiBC
dXQgdGhhdCdzIHRyaXZpYWwuDQoNCi1Ub255DQoNCg==
