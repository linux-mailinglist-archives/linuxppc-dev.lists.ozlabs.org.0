Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A456BE64B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 11:12:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdKgY0B2Sz3f48
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 21:12:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=gJhFUrm7;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=qKDehRbT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=216.71.145.153; helo=esa2.hc3370-68.iphmx.com; envelope-from=prvs=433d55c46=roger.pau@citrix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=gJhFUrm7;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=qKDehRbT;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Fri, 17 Mar 2023 21:11:32 AEDT
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com [216.71.145.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdKfX4zlKz3bg8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 21:11:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679047892;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=oG+GuC170kdBf40LSErSu1XCM+dGmq0tl4FrZaxGWPM=;
  b=gJhFUrm7NOz2uYhgf4Bdd+D7PxD/t4OJkj0TNTxczP8EKBtYtnVxOPA2
   FUTnR31B2nrcvqh3AuIBNKwyXq1+LxesVnrCq7EzoaCnkrAumFy3uoOdN
   3bzwadU39rxT7O9J8u8slCms9oElrNzwEkP2T9JWBF8gk9Fdx83eHS5f/
   E=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 101159545
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xDWGFq8iP4FeQdtIjC8IDrUDNX+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 jEaUG+OOa2KM2T8Lo1yOo2xoR8Ou5Dcx4IwTQRvrXo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklJ+
 cJfJy8KMyufvMGHxuKBSbdytpUKeZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUvgNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXxHqmCd9OSdVU8NYzhQeq4mdKWCEGUFiZj9WB1xeBavt2f
 hl8Fi0G6PJaGFaQZsLmQxSyrXqAvxgdc9ldCes37EeK0KW8ywSWHG8fVRZadccr8sQxQFQC0
 0eEt97tATF1tbSTD3ORsL6JxRu9IyUaLm8qYS4CUBsL5MTlrIgvjxXJCNF5H8adjNzvGCr0y
 jqbhCsznbMeiYgMzarT1VTGhS+845vEVAg44i3JUW+/qAB0foioY8qv81ezxeZNKsOVQ0eMu
 FAAmtOC96YeAJeVjiuPTe4RWraz6J6tNDzanE53B5Jk+zmz03qiZpxLpjZsIE5jKYADYzCBX
 aPIkQZY5ZsWNn36a6ZyOti1E55zk/imEsn5XPfJaNYIeoJ2aAKM4CBpYwiXwnzpl08v16o4P
 P93bPqRMJrTMow/pBLeegvX+eVDKvwWrY8Lea3G8g==
IronPort-HdrOrdr: A9a23:9C4lJK43UenTY4oI5wPXwHPXdLJyesId70hD6qm+c31om6uj5q
 aTdZUgpHjJYVMqMk3I9ursBEDtex/hHNtOkOos1VnLZnibhILqFvAe0WPaqweQZBEWj9Qtq5
 uIEZIfNDSANykfsS+g2njALz9I+rDum5xAx92urUuFKzsEV0gK1XYdNu/0KCNLrSB9dOsEPa
 vZyMpbhiaqPU8aZt68ARA+LpL+juyOupL6QAIMQyUq4gmWjT+u9dfBYmOl9yZbfTNT4KsotV
 PImQzh5qmlrrWSxxLG23XIhq4m6OfJ+59sBNGslsNQEDnqhwqyDb4RI4G/gA==
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="101159545"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Mar 2023 06:10:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YehLoSqViowLKcRP+0bl5QYfNNtUuClCgQhzMkQ/6m5AEyh1x8qS7VtjZ+3vNibQu2/2oX8KpPvjSE9lh8qgLYBy+4VqB7x8BBoGN5IcsekO9d96QVo3QNghDfcvhyXEJ4vSO51F3WiwSLWXW0enj0VquSdvf+1Utvmj6cBPuevJDnz7NvbDKy74sz1owz7Pv9QCLs7SmoDqmAKQrUE6cseNLZUbciSzVfSE+1R+49Sa3f205cPQHPhLpFBwF//ZuHSUtr1W5kKxMR3dO7/mzF922yHiRPtiXKCRFzsiliGWHOAq8lyiIT3gWHmhIgFxb/eI0FXDpdIho0cJ2Rqkpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8GsiQBlm4hLz7y6kw5Td54cT9cIfMCcsYGltzz/eOw=;
 b=ljqwYtETOFY0AzJq+Ms/tMsNrs8tiVjXeJno1eyxqKCvcuZR2dGa0IgmjllLE1LhgRltflch18Qny/IxRJ+cdQ84SZnMCbWVXle1sL3PgYVi2dh+P0tdtT/HvVeWzJlPefibN2wromE2mNXszQJ4c5wWSGg7pnpMK4Dq3qItEwuMU5pcQGM4mirEiRsQN3swqFgkv1Qr3Kah8UIiuFD2RB0N0A0R39WL/0ZHJ3DgfjgrfAz8neJntX+PXzjJpQG4301t495O7EtUqel6WjIcp0k2589qzsxH09txU0iPK2dY9PZCy24ksVpaKODBKsV3MwIUh9hhLyd9oCHu7KoOGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8GsiQBlm4hLz7y6kw5Td54cT9cIfMCcsYGltzz/eOw=;
 b=qKDehRbTA2+5IARRjSqME6HNaP3C8jXvHtkGgikOWbvAzZw7kXIiWcXF0xG+zP1vgI9BcOccl+TvNTQL4PE76nqApvQarONVU8Na/rHkTzUO/l2QpSe3jJBR9a9HOYcGmdfz691F4nBG/685wjVWWZENkHN4yRV0PYuX2umf1i0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5085.namprd03.prod.outlook.com (2603:10b6:208:1ab::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 10:10:18 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Fri, 17 Mar 2023
 10:10:18 +0000
Date: Fri, 17 Mar 2023 11:10:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] hvc/xen: prevent concurrent accesses to the shared
 ring
Message-ID: <ZBQ8hXiPvrbneKUF@Air-de-Roger>
References: <20221130150919.13935-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2211301657200.4039@ubuntu-linux-20-04-desktop>
 <Y4nkFZal7oy+aICa@Air-de-Roger>
 <Y5cgYLNwtPbmP1JL@Air-de-Roger>
 <ZAm8BDGTMaI0XmMI@Air-de-Roger>
 <87zg8lo7fw.fsf@mpe.ellerman.id.au>
 <ZAr16LM+qpGqa1h6@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZAr16LM+qpGqa1h6@Air-de-Roger>
X-ClientProxiedBy: LO4P123CA0540.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: efe421bf-e4d7-4033-d74a-08db26cfcf61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eyUzcg0In2e+/wjM9mr0ys9Mqa0cjK54h1i9ar/5fLR8zKn4OI+4D3JhSTMZyk8O6sIsbtD4YMkeJc0b1pY56zXk7uXJMIe/folL/3EdMZR+gxEG7MnKY1wgNYfJYiI4cTD0oK/0PP5T4brE2rDvxwO1eAPMa2uiuCJIYWe+2rx2XlUqCHjyYe5OMAQOX02YhLnwQEPUCt6ULpXgCqcJe/QatgCbaBGn5ruvsEO7X9Zv3wUOllvZlHn6ETqSBFpWyjUJUlDhB6V9Ze3XuvmOccoJZvK5a5jDD6C71o6wImBeK7v7tUYH3+irr9ALHWf33Q1o/U9mBHA+8l001zmc3PdYMUk42aVhW/sMfpypKUxDJch/rjwUbH3+BGRQ1odaUGT2OZSDIJsoYtyt+TYnN5kYXGmJfZkhjkagoPmmjkFteq3Cx31zFb+OsfeoXHnVH/4JGnaJvzAuO/elvuCbmDatJUomd1ZjmuBLERnhU9oK+AovujubUEVts17Z8uMLvX7yBRYJv5tzjRhZ/5mctgGVL9e4b0lv66xJE1hZb/bDi+jz/9N6LrtRb9ZeSgue9cD7tY0Zz+HvyYyYC2yEyy2gx4ogbFlXssFGyywL97//J1FO5brn+Vc3gyJKi859DhHWLQn688HcizqEbc0wOA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199018)(2906002)(8936002)(4326008)(66946007)(8676002)(66476007)(66556008)(5660300002)(41300700001)(83380400001)(110136005)(316002)(54906003)(6486002)(6666004)(85182001)(186003)(478600001)(9686003)(6512007)(26005)(6506007)(33716001)(82960400001)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?aHZHcGJ1aG1GQUlNRWlScUNTY2p5Qng2Z0JqdWNEK2Ftc2FuSUFCV09yVFFY?=
 =?utf-8?B?MVVkZU00M0lqMTIxNmwyczVDY0M2YWs1RXZXdzdWM0ZRdVI4eno1RVYxRDhB?=
 =?utf-8?B?VUJaMG03cFJidnNMcnNiMlhXY2FsRVZGNUhQdDgxMklDMXZNbHp2NWJ0Mkxj?=
 =?utf-8?B?K2huR3Z2c0ZPMUlqVFdqa3lLTVdsTFdIWHROQnRRL290VDBHeUlIWEhST2pL?=
 =?utf-8?B?dkhnL01keDFDd2QzczlLZUx1eS9MQnlLQ0c1b2o5ckh3OUJkQy9ZMXBGSVNy?=
 =?utf-8?B?OGE3RCtmUXRTeDhNOWFQbmQ3c3gwa0JkOTlUY1pQOGtSZkdpN3hldjlDTVBv?=
 =?utf-8?B?VFp6Uzl0Z3ZRT2RZYTYyOTA2UWdVZ2hHYjc2VjZWc1JLa2ZXWm04UGR3V3Bl?=
 =?utf-8?B?RkUveTNOZUlaZytrdDR4SVNOUnBjUkZ6bmtSZUR2V3ZmcTI2QXErcmJiS1VI?=
 =?utf-8?B?UDk3bWhZNmZnbll4U3V2MGtTSTNFRVJDVVAyOU5vbTF2QmdHMlNnam1LRHpU?=
 =?utf-8?B?Q2RydDJlQlBrR2k0bzFLeVNzQnpyWWlLQWROT3FBNlNpQ1Z4RERrQllRd2FS?=
 =?utf-8?B?VjJ4Z0tFdUgyVEM2bUh3ZElBaFIyZ2wxMlNnM3lXUm9JenFXc0NRYk1YS0lw?=
 =?utf-8?B?L0ZPcERXTXN1T3JlMUMvY3JuTUdXN1lVTmtIWE1hQjROaDJaQmdLbmhpeHVF?=
 =?utf-8?B?ck5wU2pVWjF4VFpQV2FITXNVRTk0eUY4R0lIUVI4ZUY0RGJTd0NYcVFyNFVa?=
 =?utf-8?B?Q0puNTJxZ2llUXh0bTV2aVJ3SEpWNStLRU82MkMvMGVhR0RFQ0poTTZTajlr?=
 =?utf-8?B?bDJwSmViVUxTUUI0cTJ0MXdLNEhaSmRQNjFHZG1jVlNHQ1lkaklvV3VaQ1J1?=
 =?utf-8?B?dGlnbkUyd2l1amd0eHZEL25EQ1JVbm9zS1ZzNWhYeUJ2MUlTZlNhajEzZmZN?=
 =?utf-8?B?aGl5R2J6NXlMaTltQnNwL09Nb0gyeG8rekZia3lxbHJPWHNSYnlWV2RVbnlh?=
 =?utf-8?B?Q2VzVU9PcVJxSU54ZlZ2cTlzL01DZG1nQ1BKaGZ2ekUrdjMvSUZTeWo1THBO?=
 =?utf-8?B?ZWhJQVZYOVR5S0xaVG92bG1JclVoQkowUEV0bENjU2VOd29rNnBmNzVuMEZ0?=
 =?utf-8?B?ODdtUkROZWNkVzRZQmFiaFpwbDBIMFBMaE1wbWpIYkdZbG82VGFOQUVvaExV?=
 =?utf-8?B?N3JjQ2U1WnJuZjNEQjRueW9OcXdsZ0xaZlF3RFBZbjVROGVJMEE3VUIwNGRP?=
 =?utf-8?B?akhsVng5MFlIUUxOSmt4NGdqc0F6eEdCL1MvUDJ5ZmhFYkk5ZWZIWkc5Mkxk?=
 =?utf-8?B?d1JZNGE2NXZzZTlnRDNtMGcrV0o0c2VWK2JpcHpGcUpodmdGeWYwYVh5WERo?=
 =?utf-8?B?L0xWTDNSaU8reHM5SEZ3TG9iVFg1KzVrbnBncUJsc3JtcVJUNFllalA0OFd5?=
 =?utf-8?B?MkZ4Vy9zNTY2M0dRN2JWcEtNRnZMMUVGUHBzYmo3dTJONkhOSGZvZHRYQzFv?=
 =?utf-8?B?bVpGK2NZOWM0RTBiVHZQYStJZnpuK2NvUnJBYVZEVWdiM0hhZzVaN2xKcGZs?=
 =?utf-8?B?NFBCR0I0RHg1eXphcUs4MnhoQk5FWTEzRnc2MUsrMkZZRWZHTllZblZhWFV0?=
 =?utf-8?B?L2RVWktiOWEzUDZHdFB6OWdESURjOHRNbEhNTWdscUw0MCtPWUp4SklWbGVV?=
 =?utf-8?B?V2g1TCtwVElGdXRMUXp4WXJnY0V1bzRYQ1BLSVdKNHk3djNGVytJUEVMNzBv?=
 =?utf-8?B?RnE1SHhPMXdVSkREVzIybTlMN0lsVURjVERxNjZnVHg4RC9SZjM3WUk1dVg4?=
 =?utf-8?B?VlQybDltQlJtMzhFUVpzemNtUnBUM2dKai9TUWtsVC9UY1RiNTJwOWQ5SzlW?=
 =?utf-8?B?QWVXVXdoRitaaWhPeWdjNHE1aWp0bjFIQjdFUzhhNlpvWUVQQlNTd29wc2ZL?=
 =?utf-8?B?bmpsMmdiYndBam1zT0QvbW1DQ1VUWG9zWDlHU0FSUVpGRkdBQW5pc0N0eElH?=
 =?utf-8?B?UkpBb0tsdDhHMGtCTWJaUkI4bFBjcXBxUEI5UlBwSURnRGVnNDNjK1VSM0gr?=
 =?utf-8?B?aFFuOUJVZkwwSDBhTTRHVVRFMkdSSTJ1anVrbnIzMUxWUTlIQ2tGVk9USGZV?=
 =?utf-8?B?QUNEV1RGVklucnU3d0xjRGhQbGh6UWpLTmc4UERZdGJhakplMFFNR0xUSW1L?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?eDltU2NFVGhLSjk3YWQ0UXNBRkR6U1AxRVNrUWZRRFYzNVBHQ1NiUUFmQVo4?=
 =?utf-8?B?Tkp0d0F0SFFwNUtFaU5lTDhNdXhHa0hqTDFDRWpjVE9yQloycCtYV285UDVx?=
 =?utf-8?B?TUp4L2hJVS9qblRCOTdrRjZTK1l4ejk2M2Z2a01CRDVGUEM1bFVqVlg0TXdw?=
 =?utf-8?B?emZFWm95MmJYbjlFME8vTmd0eDVCc0xrOTkrMEF6WGprMW5OcGxDTzBrczlV?=
 =?utf-8?B?VG5wVHRReGdPMUt4RUd1Q2tzdVQ2RjZ0cEZ5RXowV1k0dEliM1FYOXRyZHZT?=
 =?utf-8?B?dDliVjVTcmdRRkYyamVmOWoxeEVhSVFoTEpLRW9FdXdQa0xEUU5LSWFxQWty?=
 =?utf-8?B?OTlCMnM5eFJJUXZHalNvSHVmUk5uOThoTHp1VW0yeVB1RmdQbVB3WFcyVGNn?=
 =?utf-8?B?bEVjSVU3QnA2MDFWWVkwUG9HaTQzQ0duNFRkMnVJM0J5bHNEeG55K1ZvZWJ4?=
 =?utf-8?B?QUFsVzk4OEZIR2lkNGpFU0l4bUxoWmFwa09yOWVjU0xpcFpObnV3VkN3NWJv?=
 =?utf-8?B?RVVOejZSZ1JpN1E3VFVsV3ZhM2tobmtVQWlFUjF4Vm9zcU5JS2tUeVhFZ1NL?=
 =?utf-8?B?aHZEUC96eWlrTmxqWE51Sk1aVUVKUUN5L1NNdWFDSmlPa2gzeFZFNTQzQ0xD?=
 =?utf-8?B?UEkyWWtuYXRkTUZudk1EaUxZYytGTGRGZ2ptd2pSSUllY2ljMktzakY2VjVN?=
 =?utf-8?B?TUV1d1RTN3lMWTlTZ2d0TWxiV25KT3o0OFBDaHdLUnhXQWpZdGxRKy96K2l5?=
 =?utf-8?B?eE4wd0JJazZKTzkwRmhWV3RtY29BTWdKeHE2MkdNYUdhUkpoWXpmb1B2UkZt?=
 =?utf-8?B?VmpscUt6ejhOSmNxTHV5NkJTeTQ5bGQ0VHY5bTk2WVpEM3dxbGVRcXBpYllm?=
 =?utf-8?B?a2pSbUlXSDM1bElaK1BnQVRvOFBQTE9HYXg4RWp4YlhOY2lIQVE3SHZJenpo?=
 =?utf-8?B?S29GRm9aY3RWenY5dHlXQlp0V3U0TkVYanFPOGhSSHhKZ09tZlpwWXBzOENT?=
 =?utf-8?B?L3A4dFNKR0doWUNLUXE3SnQvdmkxVjlLSnNrN0dlN2dCd3RmTE04b0xXemY4?=
 =?utf-8?B?U2VFNDdzdTVnaDNlMXRWOXpicGllZTFyS09MT0o5TDVtUkV4OCtJMWpZY3BP?=
 =?utf-8?B?ZXJWeERhUU5sZUFBQjI0SStqdU5HVXoyV01kcTk3Zk1lRVJqQk4rSDZsQVNz?=
 =?utf-8?B?L2daRDJKRVRwRnJDNDNpK1VJeWhqbllKeVJnVFNmTEUrNHBJcURXclVMeU9l?=
 =?utf-8?B?YlM1d2tOMnJXbzNxU2luTWoyNVFsbWgrZDFseVR6MXAvbnNEZWhXcVREb1o2?=
 =?utf-8?Q?ID8caCL00S7ezh77IsxauvjkeexNc6bnsp?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe421bf-e4d7-4033-d74a-08db26cfcf61
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 10:10:18.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfKJ5YZw/t09MwHxE+0/sBPPzd3Q8NUDHaIcK87ua0l7Ubsyc9S7gCm0Uft0tGsjoGeAAdLh5C5YY+U3Pe3aCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5085
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
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 10, 2023 at 10:18:32AM +0100, Roger Pau Monné wrote:
> On Fri, Mar 10, 2023 at 10:01:39AM +1100, Michael Ellerman wrote:
> > Roger Pau Monné <roger.pau@citrix.com> writes:
> > > On Mon, Dec 12, 2022 at 01:36:48PM +0100, Roger Pau Monné wrote:
> > >> On Fri, Dec 02, 2022 at 12:40:05PM +0100, Roger Pau Monné wrote:
> > >> > On Wed, Nov 30, 2022 at 05:08:06PM -0800, Stefano Stabellini wrote:
> > >> > > On Wed, 30 Nov 2022, Roger Pau Monne wrote:
> > >> > > > The hvc machinery registers both a console and a tty device based on
> > >> > > > the hv ops provided by the specific implementation.  Those two
> > >> > > > interfaces however have different locks, and there's no single locks
> > >> > > > that's shared between the tty and the console implementations, hence
> > >> > > > the driver needs to protect itself against concurrent accesses.
> > >> > > > Otherwise concurrent calls using the split interfaces are likely to
> > >> > > > corrupt the ring indexes, leaving the console unusable.
> > >> > > >
> > >> > > > Introduce a lock to xencons_info to serialize accesses to the shared
> > >> > > > ring.  This is only required when using the shared memory console,
> > >> > > > concurrent accesses to the hypercall based console implementation are
> > >> > > > not an issue.
> > >> > > >
> > >> > > > Note the conditional logic in domU_read_console() is slightly modified
> > >> > > > so the notify_daemon() call can be done outside of the locked region:
> > >> > > > it's an hypercall and there's no need for it to be done with the lock
> > >> > > > held.
> > >> > >
> > >> > > For domU_read_console: I don't mean to block this patch but we need to
> > >> > > be sure about the semantics of hv_ops.get_chars. Either it is expected
> > >> > > to be already locked, then we definitely shouldn't add another lock to
> > >> > > domU_read_console. Or it is not expected to be already locked, then we
> > >> > > should add the lock.
> > >> > >
> > >> > > My impression is that it is expected to be already locked, but I think
> > >> > > we need Greg or Jiri to confirm one way or the other.
> > >> >
> > >> > Let me move both to the 'To:' field then.
> > >> >
> > >> > My main concern is the usage of hv_ops.get_chars hook in
> > >> > hvc_poll_get_char(), as it's not obvious to me that callers of
> > >> > tty->poll_get_char hook as returned by tty_find_polling_driver() will
> > >> > always do so with the tty lock held (in fact the only user right now
> > >> > doesn't seem to hold the tty lock).
> > >> >
> > >> > > Aside from that the rest looks fine.
> > >
> > > I guess I could reluctantly remove the lock in the get_chars hook,
> > > albeit I'm not convinced at all the lock is not needed there.
> > 
> > I don't know the xen driver, but other HVC backends have a lock around
> > their private state in their get_chars() implementations.
> > 
> > See eg. hvterm_raw_get_chars().
> 
> Yes, that was one of the motivation for adding the lock also here, and
> it has already been mentioned.  The other is the usage of the hooks by
> callers of hvc_poll_get_char().

Ping?

Thanks, Roger.
