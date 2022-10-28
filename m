Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1ED611730
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 18:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzSKf3ltgz2xHb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 03:14:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P62CFSSW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P62CFSSW;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzSJh160sz2xHJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 03:13:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666973604; x=1698509604;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/Bo8kKiuA6YqBeKm/DYCRshxpG8c6+bAYgY28Ah9Leo=;
  b=P62CFSSWWpESDFXJtQIsXfcsRX8Su5eOBgmYeeSeadAa7OXx3hZ157Pl
   A6dJbgiZzUYtmSRoZ9qy8+3MOrN49JVTjvH1uhnXfRWVmGfVC4GZZg5cc
   GJzSE2v/zCvlqZLNiHkNIDonsXx5IE/jGI0FmUw7c1IYEa69LPg0ib1ao
   BSuLDAOuc++kLkGPUKblDLdb0W65Z8qkNCtDKxnAYrWXVn5RPChGiTUGG
   RaWqavsb4Ll6LJsd90QVYx/TyOPEiwZgUXO6F1Sk0n9FDpzOH8x/pnUgk
   Zqp7i5BHGiLtnfj/P52SyROrYeTJ9p/10YrOoMl/sLEYZoVDwvcnCjM/A
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="288243372"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="288243372"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 09:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="722103354"
X-IronPort-AV: E=Sophos;i="5.95,221,1661842800"; 
   d="scan'208";a="722103354"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Oct 2022 09:13:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 09:13:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 09:13:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 28 Oct 2022 09:13:10 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 28 Oct 2022 09:13:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+MBXljgcCBguwwBgsYAqyrkdAks+93MHI+OQW+lRU+IPNgIvwudv0Ezzrq1mi9GNgepnyl8gGgXIBsEskBg+0mJ8rYrIwRF0hAWKfVPYoXbSXRL4V8Erh5fO7jGAbffvkglUy0vEn/d/+Im2TPtCSbMGAL+6eZ9O0iWEcIk5GwQQWXv3+5pQ+6QmgLOKCiZjoPoZv/b3nOTKm34krc3It5ApEkXielkG4dmxDahCDprVyVYyG3Bs2WT/vFrWFGbjaNhaP9xBvZH9s3t2IEENdsazYi007pPHTeu1uzmHlgcxaVwjT0RViJSZfucZgy6M78HRRxexs+ZbZixnnC90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Bo8kKiuA6YqBeKm/DYCRshxpG8c6+bAYgY28Ah9Leo=;
 b=chX1ckC4co5lZ+nIYYl2kNUhl73fcX+WlNoRcantWZz6J7yGuFK2KnLfOrOezQRUtnx33eb/orq1bXTlJEg4TwliIHeXC1Gf88nbERHX6s8X7Iu9xP9M0qlZ741/fNcbQynDGk00qeye5q0kkY6deG8sEKqnur4OCUMUuULMOfz/izSksHfRmO8kyyiVEedxboS0feeqGT32EK566xmmrZnaJ9248uleMD4+/p4jp/Wd/0EV7H2XFegpYLqsKiYObi7aBbci/2wMCfB4xghrL/Y/LBZgU7oHaF9IbsqPYKbfOx0riLe2k8fen/QaCy+Wiuvbfba9XLnwwwb7SXNsYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH8PR11MB7047.namprd11.prod.outlook.com (2603:10b6:510:215::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 16:13:08 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::51de:f739:3681:b16f]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::51de:f739:3681:b16f%7]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 16:13:08 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Subject: RE: [PATCH v3 2/2] mm, hwpoison: When copy-on-write hits poison, take
 page offline
Thread-Topic: [PATCH v3 2/2] mm, hwpoison: When copy-on-write hits poison,
 take page offline
Thread-Index: AQHY5YfqmLntvmoGXUWRwO1ZO/f4S64jHvAAgADlmYA=
Date: Fri, 28 Oct 2022 16:13:08 +0000
Message-ID: <SJ1PR11MB608354A1D8817902D7FC9DFAFC329@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20221019170835.155381-1-tony.luck@intel.com>
 <20221021200120.175753-1-tony.luck@intel.com>
 <20221021200120.175753-3-tony.luck@intel.com>
 <c5ade8ea-6349-7ade-f245-273de69888a4@huawei.com>
In-Reply-To: <c5ade8ea-6349-7ade-f245-273de69888a4@huawei.com>
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
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH8PR11MB7047:EE_
x-ms-office365-filtering-correlation-id: afbe65cc-4eb9-4e58-70ac-08dab8ff4d8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qv7AIIDRB/i04Ge2+24NTJNGv+1ohgJNrJR2Ovpaew8pgkWnqusnU8mlL7XrauI0g4EcC2fxCwi/3tE7LkjnmueJ+19yN5chD0mkk+JoXXr9Cd7etDeAMCrSoZpMxxC4CCpv/tjqYHrxO9VFZFTdYNumzwrMT/c4JuqT6SlCeixf+owxcCLiwGFVOyIec5Iho+omQmJuw+POlV9xs8Ol4y7anm82XdbfRLmkBCC9B1l8pYlX1H2P50D6koSxUJeTBcGL/xBq1Uq27ibiBlLSEk0M82sBWMNQSSs1Fe5pJNX1vuw93qTR107PpmQJ3aiDqKM7CQr43ig11YcpkTNiRro0qdN+71vjmVL5hu3vad+juiUjz4JNV9bVXPXcjofegeLgWOSiKFLLyF1E92oyEJDtEiA6ioF10MehkSs12n1DLdpFhRpQHK6nnXVZS2cnCxdGtq5vN3mjvqE9yLyP9rSzo09AnTmuxsJns8SHXCd+9jmI9DbgCDRZx1pOKWL5o8NeovUcjyh4t8S4yb2p2x5sbjo4DRKMpNm9r5puSxWUURiUw82Cv4MmHlIUTozKNKNtpDsXe/WwXfV2rUcXRGWlRD1wioa63N2C0Dun97oa60HSrWzGJNNntQTEb9dXAL7F4h2nfbqOX80zoe8YfuJ0G/XHIzhcs6jEwF9Q3Xxeqidyk+SqpvvOs9oMKCdofRGafeoHmnlmmxwa8hqm4NEEXR7QY1M3wTJNE431qPYTlf7ash3ThDbHMqvg5LHBCk1hQWv3u80rvkBmF1/A4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199015)(6506007)(4744005)(9686003)(26005)(52536014)(8936002)(7696005)(5660300002)(4326008)(64756008)(2906002)(66476007)(82960400001)(6916009)(38070700005)(8676002)(122000001)(66556008)(33656002)(66446008)(55016003)(41300700001)(66946007)(76116006)(186003)(478600001)(316002)(7416002)(83380400001)(54906003)(71200400001)(86362001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bCtBVkdWQk1mOGZES3lkc2VtQkRMMUp2Yk1GUkJFVkpSS3k3bFpLaG9BcU5E?=
 =?utf-8?B?eGhsSXdYc202TitPVVZkd2xYalE2Nzl0WnUvcllzMVRqcytjdXRaOER2ZlVo?=
 =?utf-8?B?Nnp6UWZlaVlPRzlXSDRON2pCZG9tSEpvOFNnMktaWExNWmowM1JHZ01ha0hz?=
 =?utf-8?B?cCs4eVFzRjczTzl4U2kwWVpKUUJwYU40Y2xpZFY1OEZlZmovMXp3YlZKcllK?=
 =?utf-8?B?QlQ3eVZWN0R0ZXd5M1hIQ1ByOXJ1bGxFRHNsbmpyWGJrdDZacXMxRk1uSVlB?=
 =?utf-8?B?a0s5dEJuOStZQmtvL2xmcTZNeHpPd0tVSnk1MFhld2hneVBBaTJIYXVWZVBv?=
 =?utf-8?B?aTI0RFB4MjFsdWJiVUxxTG9BTEN2eWtqZkUyaWtlS1hjdnJ0V2k4eENQK1M5?=
 =?utf-8?B?d3VObWtlZkV3NmdYQkdxNUZjdyt6MTVxSWdoVzVMZmJLdnhHZlJaM2dtZ0tt?=
 =?utf-8?B?R1VtcVdsMGxTS0k1R2I4ZVJydXVZMmU1OWc2T2FJOVExTkhkekloOC9lSXNm?=
 =?utf-8?B?cVFyeVgxOUg1akVQa1ljRk1MMzVSMzBIclkyQjhCS2diL1pieDF3bzJUUFdn?=
 =?utf-8?B?Z2NWUG5WWUtJSUNJeFVySlhyV2FTU1lmNS85RUVxVVdUNVNWNlR4WUNNNjYx?=
 =?utf-8?B?SmF1N2tzRjhRUXNtbHZlNUFnYUY3QzMveGEwZlJmS2RHMXI1UlNHM0tmS1Ro?=
 =?utf-8?B?aUpkNnZ3KzA0VXdEUmpKZE9HR1FUanJZZ3VWd2gyYzVZdDRUWWFsU1ptVExq?=
 =?utf-8?B?THhsa0tsSnlWOEZSS3JDWFdSN21QMHlObkgvSlIyVEhHcVY4UVRkSEc5U1JZ?=
 =?utf-8?B?SlBXbmR2dERTWEF6L3FDREF3V2c5TmxpRkFZSTJQSmhabitEaFNxSzJXdUFo?=
 =?utf-8?B?dGM3NkpsdFZOU0VodzdrRnVSMG5DNExBdHBpSHp2QVVuQVEybkcyRklDS01t?=
 =?utf-8?B?ckxuVVdHUlZ3a0trL1RvRERZYm1CMERILzhKVmRpWWM1TWJPRDZhZENJbjhL?=
 =?utf-8?B?QnUwSy8zN3lsRTBtdTEzZ09qZ0g4M0tuSGpIM240amxscmpkbUc5REk1RFhy?=
 =?utf-8?B?b1hnTnJsSU9XZnBGTjhGL2VPVy9YKzRnemtZYnZsYW42NlJHRWtIMVBxWDRS?=
 =?utf-8?B?WTdjZHZxOS92b1E3VGdnaDYxRGYvbmNzZEgyOFpEUlBybE5Xd0JiVFVab2JT?=
 =?utf-8?B?YlNMRTNFdkVDU0lTRGR5Y0VjQy96a3RCT2JlL0tiT1luOFpiNkwxYzlxTVpW?=
 =?utf-8?B?TndSY2QyMkZHMklud2JwWXp0ZkVsQ0FEQ0JCN2ZWY251ZmlEd2IzS2RmWTE2?=
 =?utf-8?B?bFViRS8rZXdmVFlFdFc4YTRmZFkzYXJQVzFFRWp3NUdMUCtobVJBNiszSzdp?=
 =?utf-8?B?QWZHNzgrYyt3L1JHN1V1WStDRTJMTjdKdFVQQ3g2OTYrcXBIdUl5WHZxVUpp?=
 =?utf-8?B?amtuQ243WkdDT2RpemYxZlBLU3NyVmtOd1h5ZE91TXVPV0IwSy84VWRkV3dD?=
 =?utf-8?B?dyt2akQySXgzSHUxYzJaUW5qeUlqc0FnRmduZmxwdndYaWNpMktiQXlCOVRS?=
 =?utf-8?B?SUV1aVVrdmg0V0xWMGlWRktyVXluRC85R3lyNmpaUE9yMDlaMzRRUkE4YVJU?=
 =?utf-8?B?WkVGTUg1Y3l6amRsYUxiOEx5KzJ3bFZYM2V5WU9ocHJ5eEJ0Q2NkQU1lTmcv?=
 =?utf-8?B?bllCZnFBa3U1N0k3RlV0S1BUQkV3NlhVU2l0ZENtU255SmFFWVFjMDF0V3I0?=
 =?utf-8?B?VDdyY0ZYMmRUTDlXMTFibTZhc0s0ekYrNjR1THI4K0QxL25JSGpBdUF6MVJs?=
 =?utf-8?B?dkJIa1d5UjJPZnFSdjY3dmFqM0F2blJKZnY5V2FyeG1JMDVqK1pYZHlwYVZy?=
 =?utf-8?B?MU1kV2trajhNQkZQSDZBckN3L2NVeDdzL3doRWZpdlRtY0RGcXpGbUZYQlBJ?=
 =?utf-8?B?SHhpS0Nud1BMdWhMcHBUeGd6bDF2ckc4WFBRMktYTVdUOFkvYmczMlREcmp5?=
 =?utf-8?B?WHBmNlpidHhJUFJrOVpiNER0b28zTG10QXRvb0xFR1JUTG95dFRUSFMvbzZJ?=
 =?utf-8?B?VVE5YkV2MERzZ3FLTWVoaU56a1QvZEM0Y1lpWmxnYXpIQ1VDQTVncmZ4RHRn?=
 =?utf-8?Q?REpBEWFg1mSm+HQSmJPSqgzrG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afbe65cc-4eb9-4e58-70ac-08dab8ff4d8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2022 16:13:08.3229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EOtL6rvXbry+yfzgBKKlmz7/U4a/cU7rwOcouL3hDB+tK3xiFzRwk877gYviOzGC1ZZtneaoXLLFGvqUwqrcJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7047
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
Cc: Matthew Wilcox <willy@infradead.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>, Shuai Xue <xueshuai@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pj4gQ2Fubm90IGNhbGwgbWVtb3J5X2ZhaWx1cmUoKSBkaXJlY3RseSBmcm9tIHRoZSBmYXVsdCBo
YW5kbGVyIGJlY2F1c2UNCj4+IG1tYXBfbG9jayAoYW5kIG90aGVycykgYXJlIGhlbGQuDQo+DQo+
IENvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiB3aGljaCBsb2NrIG1ha2VzIGl0IHVuZmVhc2libGUg
dG8gY2FsbCBtZW1vcnlfZmFpbHVyZSgpIGRpcmVjdGx5IGFuZA0KPiB3aHk/IEknbSBzb21ld2hh
dCBjb25mdXNlZC4gQnV0IEkgYWdyZWUgdXNpbmcgbWVtb3J5X2ZhaWx1cmVfcXVldWUoKSBzaG91
bGQgYmUgYSBnb29kIGlkZWEuDQoNCkkgdHJpZWQgY2FsbGluZyBtZW1vcnlfZmFpbHVyZSgpIGRp
cmVjdGx5LCBhbmQgbXkgc3lzdGVtIGp1c3QgaHVuZy4gSSBtYWRlIHRoZSBhc3N1bXB0aW9uDQp0
aGF0IGl0IGhhZCBkZWFkbG9ja2VkIGJhc2VkIHNvbWV3aGF0IG9uIHRoZSBjb21tZW50cyBpbiBt
bS9tZW1vcnkuYyBhYm91dCBtbWFwX2xvY2sNCmJlaW5nIGhlbGQgLi4uIGJ1dCBJIGRpZG4ndCBk
aWcgaW50byB3aGF0IGhhZCBnb25lIHdyb25nLg0KDQotVG9ueQ0K
