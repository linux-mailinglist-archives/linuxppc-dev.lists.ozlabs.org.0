Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA6F76D341
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 18:04:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NPuBrRpa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGGyH1jbmz3cJg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:04:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NPuBrRpa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=vishal.l.verma@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 03 Aug 2023 02:03:48 AEST
Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGGxJ3RkKz2yVH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 02:03:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690992228; x=1722528228;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+0diCtfzi1+oLfpWFYTCq3Gk5YJf0UF2of5CU8vtMRw=;
  b=NPuBrRpaWGmcEqyW9qLNFPg4nXkjq3BXgptjY/xSaZ5TddWDoWCn+NZP
   mWFNjG9YSrFgWtz2agPUxC6qF9r9+ue/FGTVqKjUBooxySk8rUgDGT3sW
   S2magl4U4BOeDlRMd6YAqRw3fE3NOkFaWBrQwSw5KOCU9Hvfsz6INsZwe
   SdRUyMgWK0AsYMSVRE3QR24BLYlH4+f7+FjVffQWexidyF5sNAHWK6mH5
   qbroeyNbLCLUI0r+oWgdN72HNZoollCmNWC1onxS8i3uM1y0VyfCmQPOr
   oGWEK3lU5/bxgyfbpU8LMj7tB7rEI2r627pzQcOi05E7mnU5ZJPnoD3i2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369628337"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="369628337"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 09:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="758802670"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="758802670"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP; 02 Aug 2023 09:02:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 09:02:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 2 Aug 2023 09:02:33 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 2 Aug 2023 09:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFODl3kErOVRQi7epcQgXqdN3LjhC23N5J/WJ17mMhFsuh7CR6jcFYDIFVYmVkUcqUPwa+l+oxFoxJ4BsLPDBIdtH2movb57RoHhHPSAb+cRI6T+AMwLZ1J2tvffV+FVnwX72m4fkdr1mz7FXg6JrK+nGdhCJ5fo9QlsLClOlNS9lRPZOhvIw1ydO0PmoyJKB532t+pCvBqQ8Yf+q0gfJvG5LjdeXgnVNnJA0nliZjktln/toDLneZxXfD+fXKYgEkqwh5Rx1pCeZxiDcLuVcVkVSWBtJgA0sU2oKl9AZSATpw0MRU2R9UBj/GIbKvUmgBdY3SukVG2o79BwhpK+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0diCtfzi1+oLfpWFYTCq3Gk5YJf0UF2of5CU8vtMRw=;
 b=hGrA/GRYzdEPptcqKpODeIGbW0vCaJRlBuqaSo3kDOkLgpwVGBpwonJM8CFSnHfYNFhhUp5eKz3GS2E7fUb0jHbU3yqMfhjcpYUqdxeoDOgmO4U4dlidSPsqmcoAGoYZnuyQ5GbaDz8E8muSXWuFzD+jvwjqh4oqu8zILTLKyxDs+yc7WWsUW0csMMWCX7Rz0gu4Gkq+o5PoZa4CGKUteFbFHUg04WD3xf1DFR+ErEM70VT7eGFrW9ocRkirV4cfUUdFN+qt5YHkDlZctM1w+zbhdG2mJSv1LprzxgpwUSGiMqBH2YB8asPNlqyIET5A/5FJyuODQJ/Z49BT3PGzLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7125.namprd11.prod.outlook.com (2603:10b6:303:219::12)
 by MW4PR11MB6839.namprd11.prod.outlook.com (2603:10b6:303:220::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 16:02:30 +0000
Received: from MW4PR11MB7125.namprd11.prod.outlook.com
 ([fe80::cb1f:f744:409c:69b3]) by MW4PR11MB7125.namprd11.prod.outlook.com
 ([fe80::cb1f:f744:409c:69b3%4]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 16:02:30 +0000
From: "Verma, Vishal L" <vishal.l.verma@intel.com>
To: "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "Hocko, Michal"
	<mhocko@suse.com>, "david@redhat.com" <david@redhat.com>
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
Thread-Topic: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
Thread-Index: AQHZxDKQtb/B0wzPUEqIYzAoJpACCa/VJFEAgAAIWYCAABbfAIABLEYAgAC5/wCAAADsAIAAANIAgAABhwA=
Date: Wed, 2 Aug 2023 16:02:29 +0000
Message-ID: <dc15be80a0852b6e211045539f8b63491debbb25.camel@intel.com>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
	 <20230801044116.10674-8-aneesh.kumar@linux.ibm.com>
	 <ZMjJPFcXlt+aeCUB@dhcp22.suse.cz>
	 <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
	 <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
	 <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
	 <ZMp7Vr8PbfoADQw0@dhcp22.suse.cz>
	 <31305ab7-1e65-80aa-ee91-9190c8f67430@redhat.com>
	 <6f66dfcc-3d2a-c47c-1b84-c0d5210564d6@linux.ibm.com>
In-Reply-To: <6f66dfcc-3d2a-c47c-1b84-c0d5210564d6@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7125:EE_|MW4PR11MB6839:EE_
x-ms-office365-filtering-correlation-id: a148a6d7-50b1-4fd5-5a50-08db9371dfe4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CLRgtLzQZzHXLZW2PhnPPWoRn1RhSiW/Q2nQdCVIJBQvGwQAdr0OHuHjLAgJTK93q6nKJOWVEHogYtUiSwUy5W9P/dV5YUSTa4XiamMWaerkvqjQEO6NBRxY3pRIw2IDKJjtmaCKWbE1I6R22ycZ4JynHUT6Cze6Erkp9KK1Wn+0CKZWaML1bsj77sPlPQu72i6+JTTtCNDezk5lvpqwefpW5X3yKfFFcEnXO0mbDcGQcQHRU4x/ZVj4fuWvD2OxL19th9gzRcoSgpdVg/9WEiB5szPS9TGkXaPHSu+q2ZcmFQ9nhU9JrEhZPFjgsxAhdxRlPAYP09eXMCrNm5Cfl9RM2KlelCzxDkmIG8owSB4PGq9bKvWL8mmsiHG+ZbFaZlUZgnC2dYd+5SEurLePvFQpQQ2Lbe9FJ3rA1Ob4Xxq2krzhrseQh8P2mgHowWhSSlat2ob905xDsJ2nIjyIroUmc3o4Ntty2vekdsdNYkEtYd5jgz2NHK9whEN00noWMErmtKgxl2CLLNl1TR2B0Q5jLGdTvPibNm6pqpPkzl5IO3xLNXn6h3nhcpnzei49i0Ozq7O+hHpRokwLDWOqIZmT+/iiriyBi5CJhYy1Tveo/WcyrMmcEkyLonBsaIpW52u+dhbC8j56rCkX1p+jTw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7125.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(15650500001)(8936002)(8676002)(5660300002)(26005)(41300700001)(2906002)(83380400001)(38070700005)(7416002)(36756003)(2616005)(478600001)(54906003)(122000001)(110136005)(38100700002)(316002)(86362001)(6506007)(53546011)(64756008)(6486002)(76116006)(71200400001)(66946007)(66556008)(66476007)(66446008)(82960400001)(4326008)(186003)(6512007)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlhnMlowNmFVVFJNdmZZQ3VVTG5MRFRWQ3k2WDdwSGhmbnRuYkxaR0ZzQmFJ?=
 =?utf-8?B?TCtqUEtuN0hqZVhNSVF0OGpUQWtoSHlCWVhPQWYzNGh6VEdNZ1dKNm9Vaks5?=
 =?utf-8?B?NzRxMkJHY0ZjMUlOMkQvNHhzeWlXVFdGNFpZVzdxa2VWdzBINFBEOUQ0amRM?=
 =?utf-8?B?aDhsejZDL0QyVWt0ZnBwa2l0RmZvcmpNWGZpYlhNVmlGdEdyUE1qUnJjTFRP?=
 =?utf-8?B?cGZCYmNHRG9pcnFKQ2hwQ21DNytaNnpwOXNwNG5LWHZHQ0VacVpKZDhnMU83?=
 =?utf-8?B?K2FBU0hMbFE0TXY3cnU3S3hwTEU4bVJCc0tGTmlXZnBtNmxOaDZPQ0pCYkNn?=
 =?utf-8?B?RWQyNWJXbElsN1ZaYWdSbmtJL2V6SXhUa3A3aWdiWC93enY4N2U2R0NzVDJk?=
 =?utf-8?B?Nm9sU2JINmdHQ3BxK3BhYkI3YWNvK2ZweDdveE9TWm5mSVp1QWVFcEdBOXdD?=
 =?utf-8?B?VmJiZk5vMElJM0RNR1BJcHpvdFk2eWlBWVVFTGtKSTB3WmJ5WS91akdQNzdE?=
 =?utf-8?B?Wkg5UUNQVG14RmlqZURmNEtzekVKcXl2T0VmQjFyS00yeDE1ZGhpcngzWnl5?=
 =?utf-8?B?VWZ0ZWRPbUlidmNZcW41aFlXOXVObjA0c21qTm5iV0djeVUyeWZOaHBhZ21E?=
 =?utf-8?B?aTdMUG5VcVNZTVFYTTY2eUtqLzhLVFNWNTV2UDF0aE5GSGkyOU90dUVuQTJn?=
 =?utf-8?B?LzBNWENDVy92SlhPUG00Yk9SdFJwUTVaRDlNQjJoVHpIZi9Vcnd5OFhPZzJU?=
 =?utf-8?B?MU1ad1QyK0xqeFJTMU1SZDkrbjl6KzJTZExqRUFybFordmEyWEJxajhZUXQz?=
 =?utf-8?B?NGlDajRqUytHK0VRMG4yczFjTWJBV1AzS1g1UzJlbVVRUDlta08rTzJPRzJ6?=
 =?utf-8?B?czA3NUQxMUFHL2ZqYUNLSlhsWDZQRVN3R3dBVCtPYzZmcmhFK203Z3hBbHY4?=
 =?utf-8?B?U3RxTCtZSjF3YS9qeGVaRzl0WEJQZTZxaXRWZi9zbnZQUlFkRDAxY2pkbkNP?=
 =?utf-8?B?b2VKMzJtUjgyRFFIMHBUdmEyQ0NsT3NTZy9SdXJEVUlMK1VwNy9RWllPV1NH?=
 =?utf-8?B?bjZ5bjEweldmWE05NlJib2ZSTHI2eXBNeHhOMVUxK2EyREVDM3VNWTY0aElt?=
 =?utf-8?B?b2JXOEpKcUhlNDlOVVNnVmxJb0pvYkdQT2NIcktscUhhWUNHcnFQMG5qWWZp?=
 =?utf-8?B?eGNUZm9RMzFaOFhPVDVhV1ZmaG9uT1hoMGFOSWs3eE4vaEdLL1VaTVBSTlFq?=
 =?utf-8?B?djFZT0tQckpkZXpzSGE4VUR3eXdJVTF0YklaSmEzTWhzUmF3QlByWVcvSlVt?=
 =?utf-8?B?b1BLQy9NUjdDWkpOMUtMSGZrbGw1eFlTeFBOc3pLODNrMFdQTThscTNjK3F3?=
 =?utf-8?B?aDNuUytuUmVLM1BadVZPSVRlVmtHb2JmU0dkajUxaitJemVVOUEyYitpSTM5?=
 =?utf-8?B?blVGb3lmdFB6WjdyZ1FTWWhjemV6MHlFU2swWjBRS3NWNGtLQVVpTHI4anQy?=
 =?utf-8?B?S3BERTVNWkhTOGxQN01XUC9yV2kvM1hweGJlU0pVQU16MmViRnpoQ2lySWxp?=
 =?utf-8?B?OVk2RGNrcGF2dzZtbkMrckkzRnp5aGprRWxDZ3IvTC9uYVViMGwzZ1RFeVl4?=
 =?utf-8?B?dWsxWHh1djFucmlNUXZTK1k1MklnZW84OWk2NTk1ZDV2SjUwOURNcEtjVzVw?=
 =?utf-8?B?OHhlb3d5NlA2SldwTUxJVFdxZGhsclpjZVJodTJkU2dZZE4vZkt3cXRDTzQ1?=
 =?utf-8?B?dUp3UHRiUXVrVFg4VXJOTHhmdmthaXpQTnM4M0NWVFFBQ1NITjVqVXlzbGFI?=
 =?utf-8?B?L1h0aHVhbFdNWmRkOTlaRHlKeXJOM3dqcmMzWlphODNuUW40RjBTZXNla08z?=
 =?utf-8?B?ZkRybGxPS1ROQXdvbUtCOE0xWitBUkx3Zm43SGdkRitheXA2NXo4czFsOHJz?=
 =?utf-8?B?M20wejZpV2kxdTdWUkFLVTNZOVgyMUY1Z0lDZ3Rpb1RkMkptRExSelVZK3ps?=
 =?utf-8?B?cTExWGFKb1RSVzd0VVJXSkxEbDRpaGVzTVFXemIzV3pvTksxQTh2ZStPKyt3?=
 =?utf-8?B?Yi9UaFhiSnhBSDFhaVZ1cjN0Q1hQaWw0MnFoQ1Qvd0QweUFVdjRVOUc1LzhP?=
 =?utf-8?B?RUphQmJudlRTZW8yMTNlVFZ6SS9pY0NEZ3B2KzBTU1pDaEljWTJPNllMT1JX?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C0271A84000F245AED6BF3B14A9B128@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7125.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a148a6d7-50b1-4fd5-5a50-08db9371dfe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 16:02:29.9853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wDFLpJpUnxWS/luxissNZON5YyHqJLylpIZMTKdSUA/PEBqaZW2CWZMuPOXIBhXzaCEQ+C84iWajxO4QKNc2UQnapvDCOs0Fj53mbMTjohE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6839
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "osalvador@suse.de" <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIzLTA4LTAyIGF0IDIxOjI3ICswNTMwLCBBbmVlc2ggS3VtYXIgSyBWIHdyb3Rl
Og0KPiBPbiA4LzIvMjMgOToyNCBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6DQo+ID4gT24g
MDIuMDguMjMgMTc6NTAsIE1pY2hhbCBIb2NrbyB3cm90ZToNCj4gPiA+IE9uIFdlZCAwMi0wOC0y
MyAxMDoxNTowNCwgQW5lZXNoIEt1bWFyIEsgViB3cm90ZToNCj4gPiA+ID4gT24gOC8xLzIzIDQ6
MjAgUE0sIE1pY2hhbCBIb2NrbyB3cm90ZToNCj4gPiA+ID4gPiBPbiBUdWUgMDEtMDgtMjMgMTQ6
NTg6MjksIEFuZWVzaCBLdW1hciBLIFYgd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiA4LzEvMjMgMjoy
OCBQTSwgTWljaGFsIEhvY2tvIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBPbiBUdWUgMDEtMDgtMjMg
MTA6MTE6MTYsIEFuZWVzaCBLdW1hciBLLlYgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gQWxsb3cg
dXBkYXRpbmcgbWVtbWFwX29uX21lbW9yeSBtb2RlIGFmdGVyIHRoZSBrZXJuZWwgYm9vdC4gTWVt
b3J5DQo+ID4gPiA+ID4gPiA+ID4gaG90cGx1ZyBkb25lIGFmdGVyIHRoZSBtb2RlIHVwZGF0ZSB3
aWxsIHVzZSB0aGUgbmV3IG1tZW1hcF9vbl9tZW1vcnkNCj4gPiA+ID4gPiA+ID4gPiB2YWx1ZS4N
Cj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IFdlbGwsIHRoaXMgaXMgYSB1c2VyIHNwYWNl
IGtBQkkgZXh0ZW5zaW9uIGFuZCBhcyBzdWNoIHlvdSBzaG91bGQgc3BlbmQNCj4gPiA+ID4gPiA+
ID4gbW9yZSB3b3JkcyBhYm91dCB0aGUgdXNlY2FzZS4gV2h5IHdlIGNvdWxkIGxpdmUgd2l0aCB0
aGlzIHN0YXRpYyBhbmQgbm93DQo+ID4gPiA+ID4gPiA+IG5lZWQgZHluYW1pYz8NCj4gPiA+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFRoaXMgZW5hYmxlcyBlYXN5IHRlc3Rp
bmcgb2YgbWVtbWFwX29uX21lbW9yeSBmZWF0dXJlIHdpdGhvdXQgYSBrZXJuZWwgcmVib290Lg0K
PiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRlc3RpbmcgYWxvbmUgaXMgcmF0aGVyIHdlYWsgYXJndW1l
bnQgdG8gYmUgaG9uZXN0Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gSSBhbHNvIGV4cGVjdCBw
ZW9wbGUgd2FudGluZyB0byB1c2UgdGhhdCB3aGVuIHRoZXkgZmluZCBkYXgga21lbSBtZW1vcnkg
b25saW5lDQo+ID4gPiA+ID4gPiBmYWlsaW5nIGJlY2F1c2Ugb2Ygc3RydWN0IHBhZ2UgYWxsb2Nh
dGlvbiBmYWlsdXJlc1sxXS4gVXNlciBjb3VsZCByZWJvb3QgYmFjayB3aXRoDQo+ID4gPiA+ID4g
PiBtZW1tYXBfb25fbWVtb3J5PXkga2VybmVsIHBhcmFtZXRlci4gQnV0IGJlaW5nIGFibGUgdG8g
ZW5hYmxlIGl0IHZpYSBzeXNmcyBtYWtlcw0KPiA+ID4gPiA+ID4gdGhlIGZlYXR1cmUgbXVjaCBt
b3JlIHVzZWZ1bC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBTdXJlIGl0IGNhbiBiZSB1c2VmdWwg
YnV0IHRoYXQgaG9sZHMgZm9yIGFueSBmZWF0dXJlLCByaWdodC4gVGhlIG1haW4NCj4gPiA+ID4g
PiBxdWVzdGlvbiBpcyB3aGV0aGVyIHRoaXMgaXMgd29ydGggbWFpbnRhaW5nLiBUaGUgY3VycmVu
dCBpbXBsZW1lbnRhdGlvbg0KPiA+ID4gPiA+IHNlZW1zIHJhdGhlciB0cml2aWFsIHdoaWNoIGlz
IGFuIGFyZ3VtZW50IHRvIGhhdmUgaXQgYnV0IGFyZSB0aGVyZSBhbnkNCj4gPiA+ID4gPiByaXNr
cyBsb25nIHRlcm0/IEhhdmUgeW91IGV2YWx1YXRlZCBhIHBvdGVudGlhbCBsb25nIHRlcm0gbWFp
bnRlbmFuY2UNCj4gPiA+ID4gPiBjb3N0PyBUaGVyZSBpcyBubyBlYXN5IHdheSB0byBnbyBiYWNr
IGFuZCBkaXNhYmxlIGl0IGxhdGVyIG9uIHdpdGhvdXQNCj4gPiA+ID4gPiBicmVha2luZyBzb21l
IHVzZXJzcGFjZS4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBBbGwgdGhhdCBzaG91bGQgYmUgaW4g
dGhlIGNoYW5nZWxvZyENCj4gPiA+ID4gDQo+ID4gPiA+IEkgdXBkYXRlZCBpdCBhcyBiZWxvdy4N
Cj4gPiA+ID4gDQo+ID4gPiA+IG1tL21lbW9yeV9ob3RwbHVnOiBFbmFibGUgcnVudGltZSB1cGRh
dGUgb2YgbWVtbWFwX29uX21lbW9yeSBwYXJhbWV0ZXINCj4gPiA+ID4gDQo+ID4gPiA+IEFsbG93
IHVwZGF0aW5nIG1lbW1hcF9vbl9tZW1vcnkgbW9kZSBhZnRlciB0aGUga2VybmVsIGJvb3QuIE1l
bW9yeQ0KPiA+ID4gPiBob3RwbHVnIGRvbmUgYWZ0ZXIgdGhlIG1vZGUgdXBkYXRlIHdpbGwgdXNl
IHRoZSBuZXcgbW1lbWFwX29uX21lbW9yeQ0KPiA+ID4gPiB2YWx1ZS4NCj4gPiA+ID4gDQo+ID4g
PiA+IEl0IGlzIG5vdyBwb3NzaWJsZSB0byB0ZXN0IHRoZSBtZW1tYXBfb25fbWVtb3J5IGZlYXR1
cmUgZWFzaWx5IHdpdGhvdXQNCj4gPiA+ID4gdGhlIG5lZWQgZm9yIGEga2VybmVsIHJlYm9vdC4g
QWRkaXRpb25hbGx5LCBmb3IgdGhvc2UgZW5jb3VudGVyaW5nDQo+ID4gPiA+IHN0cnVjdCBwYWdl
IGFsbG9jYXRpb24gZmFpbHVyZXMgd2hpbGUgdXNpbmcgZGF4IGttZW0gbWVtb3J5IG9ubGluZSwg
dGhpcw0KPiA+ID4gPiBmZWF0dXJlIG1heSBwcm92ZSB1c2VmdWwuIEluc3RlYWQgb2YgcmVib290
aW5nIHdpdGggdGhlDQo+ID4gPiA+IG1lbW1hcF9vbl9tZW1vcnk9eSBrZXJuZWwgcGFyYW1ldGVy
LCB1c2VycyBjYW4gbm93IGVuYWJsZSBpdCB2aWEgc3lzZnMsDQo+ID4gPiA+IHdoaWNoIGdyZWF0
bHkgZW5oYW5jZXMgaXRzIHVzZWZ1bG5lc3MuDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gSSBkbyBu
b3QgcmVhbGx5IHNlZSBhIHNvbGlkIGFyZ3VtZW50IHdoeSByZWJvb3RpbmcgaXMgcmVhbGx5IGEg
cHJvYmxlbQ0KPiA+ID4gVEJILiBBbHNvIGlzIHRoZSBnbG9iYWwgcG9saWN5IGtub2IgcmVhbGx5
IHRoZSByaWdodCBmaXQgZm9yIGV4aXN0aW5nDQo+ID4gPiBob3RwbHVnIHVzZWNhc2VzPyBJbiBv
dGhlciB3b3JkcywgaWYgd2UgcmVhbGx5IHdhbnQgdG8gbWFrZQ0KPiA+ID4gbWVtbWFwX29uX21l
bW9yeSBtb3JlIGZsZXhpYmxlIHdvdWxkIGl0IG1ha2UgbW9yZSBzZW5zZSB0byBoYXZlIGl0IHBl
cg0KPiA+ID4gbWVtb3J5IGJsb2NrIHByb3BlcnR5IGluc3RlYWQgKHRoZSBnbG9iYWwga25vYiBi
ZWluZyB0aGUgZGVmYXVsdCBpZg0KPiA+ID4gYWRtaW4gZG9lc24ndCBzcGVjaWZ5IGl0IGRpZmZl
cmVudGx5KS4NCj4gPiANCj4gPiBQZXIgbWVtb3J5IGJsb2NrIGlzbid0IHBvc3NpYmxlLCBkdWUg
dG8gdGhlIGNyZWF0aW9uIG9yZGVyLiBBbHNvLCBJIHRoaW5rIGl0J3Mgbm90IHRoZSByaWdodCBh
cHByb2FjaC4NCj4gPiANCj4gPiBJIHRob3VnaHQgYWJvdXQgZHJpdmVyIHRvZ2dsZXMuIEF0IGxl
YXN0IGZvciBkYXgva21lbSBwZW9wbGUgYXJlIGxvb2tpbmcgaW50byB0aGF0Og0KPiA+IA0KPiA+
IGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvMjAyMzA4MDEtdnYta21lbV9tZW1tYXAtdjMtMi00
MDZlOWFhZjU2ODlAaW50ZWwuY29tDQo+ID4gDQo+ID4gV2hlcmUgdGhhdCBjYW4gYWxzbyBiZSB0
b2dnbGVkIHBlciBkZXZpY2UuDQo+ID4gDQo+IA0KPiBUaGF0IHN0aWxsIGlzIGRlcGVuZGVudCBv
biB0aGUgZ2xvYmFsIG1lbW1hcF9vbl9tZW1vcnkgZW5hYmxlZCByaWdodD8gV2UgY291bGQgbWFr
ZSB0aGUgZGF4IGZhY2lsaXR5IGluZGVwZW5kZW50IG9mIHRoZQ0KPiBnbG9iYWwgZmVhdHVyZSB0
b2dnbGU/IA0KDQpDb3JyZWN0IC0gdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIHRob3NlIERhdmlkIGxp
bmtlZCBkb2VzIGRlcGVuZCBvbiB0aGUNCmdsb2JhbCBtZW1tYXBfb25fbWVtb3J5IHBhcmFtLiBT
aW5jZSBrbWVtJ3MgYmVoYXZpb3IgZm9yIGRheCBkZXZpY2VzIGlzDQpzZXQgdXAgdG8gYmUgdHVy
bmVkIG9uIC8gb2ZmIGR5bmFtaWNhbGx5IHZpYSBzeXNmcywgaXQgd291bGQgYmUgbmljZSB0bw0K
aGF2ZSBhIHNpbWlsYXIgZmFjaWxpdHkgZm9yIHRoaXMgZmxhZy4NCg0KSSBkaWQgdHJ5IHRoZSBt
YWtpbmcgZGF4IGluZGVwZW5kZW50IG9mIG1lbW1hcF9vbl9tZW1vcnkgYXBwcm9hY2ggaW4gbXkN
CmZpcnN0IHBvc3Rpbmc6DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL252ZGltbS8yMDIzMDYx
My12di1rbWVtX21lbW1hcC12MS0xLWY2ZGU5YzZhZjJjNkBpbnRlbC5jb20vDQoNCldlIGNhbiBj
ZXJ0YWlubHkgcmV2aXNpdCB0aGF0IGlmIGl0IGxvb2tzIG1vcmUgc3VpdGFibGUuDQo=
