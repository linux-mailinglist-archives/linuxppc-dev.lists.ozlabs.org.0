Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B78CD79F53B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 00:56:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YEurNPVJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmG694mG9z3dDT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 08:56:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YEurNPVJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm9b45D95z2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 05:32:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694633569; x=1726169569;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sv2ZOI4KS5k14Q/HzSB/7FUFyb2Mcwqcx+UfMAMzlQs=;
  b=YEurNPVJOFJmcG9oeryMXsMVYfCaHGq3eggoa/+VD+gQglE0dqPd5w5j
   BcELxKJ25bhZwfZ89lhmp4cm3oGHp4oV/958xcRFsN7+2eIHLG+ffa99f
   LfQZ/KdaUkuSrva7Cyuq7hOJGxuBVygh7WvCd9iJlPkq6TDXRAPWwXe/f
   6q4hIP0658ETcIcrODyfNZaJR1PdzmkbMTtOocKPxBbtT4VBzWCjyI2Ql
   gxASYECrdYajadDutU3QmoKaLjS5/Un7aAtuGGIrpmYRQqIYzk07tDRaF
   tktPlNIf17bBeabvM4zBQgQbe9mM1FlzrFOzCYeA0Pe7yTwdFi3rRrxr3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="409722036"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="409722036"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 12:32:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="887455380"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="887455380"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Sep 2023 12:32:07 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 12:32:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 12:32:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 12:32:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ys/1qAPrW1/d7RY+QTuvUXBoUUtAiXRJGupnGJ1m1tZ6N3M31Qnd89YlGJhSh1Gt6suWnmYaHepuZvXEo/iMw6/3XczWqdxhL8yOAvVC6EHzw3efD+O8TqG2QV+fiEhLGh7pWBef/9ie7+pNYLG64nSmP2w96pmzLpAKyJSAlwqJzWaSZ7IpbCWrJBL12VNCBqDHPmaW/Vang0/jnie1YYPBL0rKR2V417rO9XOmwlulFcv/NE9DHuWdcNPWhNmmLmzFLH3jezLa2d2VHJJHSuxFxlHsEDXvDFgWlEdEd7SNQo97/MdiskiH6jbkCOgfkWUo+4NP4cR4O2bvcf+oAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9m0GWY9kbjleiRQtywmPTjEIeRzkh7hrqkoxfsyBsU4=;
 b=M05rkiBmKpGnPNIUckfVUegSYF+XVWqC4Mb5qqjhkfNIBKJ76lqXw75YTqIUZWYLZoBjC4LvzTyQqnurNwcGymGfIrSHtyEPmI5gsLx4uUAzesL3bkDEZ+sthIpNKugc+nJYtKWJj7D92LqMtYf8ArH+W2960vy95EPCAw82opdadHI++jeJgCzAH/GQCZquVbGWYnrpl/hYiylIvCO3JFxvn+TbdTgEb5E7HPC0zmVPSYSzPvm0QRMrIa+6vH/2M78iwtEeBFy8ATHEZTEfhGexatq1dYXn92nEHuJFzjTKQ99B4aevcBGoercdH3wAXlKEswAmHz0r2AlTZCQwxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by DS0PR11MB8051.namprd11.prod.outlook.com (2603:10b6:8:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 19:32:34 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::5e34:ee45:c5e8:59d0]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::5e34:ee45:c5e8:59d0%7]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 19:32:34 +0000
Message-ID: <d87ba824-1216-a25a-cd78-e0213bab511a@intel.com>
Date: Wed, 13 Sep 2023 12:32:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 0/2] arch: Sync all syscall tables with 2 newly added
 system calls
Content-Language: en-US
To: <linux-kernel@vger.kernel.org>, <linux-api@vger.kernel.org>,
	<linux-arch@vger.kernel.org>
References: <20230911180210.1060504-1-sohil.mehta@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20230911180210.1060504-1-sohil.mehta@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0084.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::25) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|DS0PR11MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: cf966e60-8b5c-4973-b5fa-08dbb4902ddc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7SnVRoMlz4UR192Ds1dL9pe7f6gMrWNHiy2e0xEeZ7MnHJUv0ska/Wa8DNk4mZfMFNEppygYnJlbWm5R/ProUjdlVg59ikG+likeA5YqbymciFDZkAhSNH73yfbuCJpMClEnOL8qXCO2fsr3ArzvwIo/uEi9w3nyv0YgiZjfZP45GKXz7Id8P2Igo7Ha7zIhQ9OwF9UkipEVb92TJzSxwcVxRcHWEw7klZ67dbIU1uM7zxwjExgJro9QG1U2qzYkFfY/775CxxAgeNYQFqRzAh/dfLvkEXFM8e6CLVPzZCAnbxX+XXj2riljaq2tn2mdnaivw35YZWjxPLrAM5azIjZUjPr5tF4MZZnU7I8wfxlJz9e44FfslSBMfpqZqs6Q/ygMGj91FdAOyCz4CBpnNbdW0sPqXN9L4tjojYIszRGLH57CFLM8hZrBjMnnaqCu8bUj81O+m1vp2TSZeYH2f9F/JoA4lh1BmjvWbPaHmJfdHHlwGPM0Nju3oxDcHrM1eQvz9WtTu2w0yt+5vU6IFA0Yqc2lW9pDz8orZkTgQJ5iaz2Esyzdvo1Y2RUzsCrSGG7McRcij8hDBnBcw7qnP1EOr+q1SyS+llfLpY2meSIsAhMYk71FDUDNVWrOojW/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199024)(1800799009)(186009)(316002)(53546011)(54906003)(6666004)(66476007)(66946007)(66556008)(44832011)(478600001)(6512007)(966005)(6486002)(6506007)(31686004)(41300700001)(8936002)(8676002)(4326008)(5660300002)(26005)(36756003)(82960400001)(38100700002)(2906002)(2616005)(7406005)(7416002)(86362001)(31696002)(7366002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVFmOWJSbFVGSFJoUVpxZW50OTZ0a09keWs2b29YWEpvU3luUlR6ZGprZHha?=
 =?utf-8?B?ejJFNzc3cm5EbWViMlc2SE43WXhVRmxKc21scmN1ZHZNRFIyMUJPMVp6QW9Q?=
 =?utf-8?B?bXQ0Z0FUZ0dNa3NCR0xSZGtZNnBJd21VeUptdmtqeXlMb3ZVNjIyRW1nRHJH?=
 =?utf-8?B?R0ZCRzhuSWZxclpsOEtpcG9oaVl5ZHJ6cERGRWQrZjhmM2lYS1NMVmJBRW94?=
 =?utf-8?B?enVmUXR2anVnN2VGTTlKNkJ3M0tqb0RSeTgxbk0vZ1lZZVdSZytWWE9tRGtQ?=
 =?utf-8?B?MVBLb2VjaFNMSWNnWlpmV3JqeGVKd2pUU09ST2gwQ05TRWpNUkNvU1NGWkdN?=
 =?utf-8?B?bVZkUzgzM002NmptUjB5K1prTkpRZjREeVpac0NmYUNJeUd4TXlmU2k2Nzdw?=
 =?utf-8?B?N25VYUcvOXMyWHZzVStTeXV2SXE1NEhDbjY5UCtYUm9QOGFBZ2NVYzZIRDFJ?=
 =?utf-8?B?OHhsOW9MdzYxYmphUldObS9kM2hncHJOODE4OXVpditWb0o0Sm82WVhVZXJ0?=
 =?utf-8?B?ZURnRXhyb1BvUk8wMnJmdzBmaHZIeE1JZG9xa2NMQWRES2grV29LSGt2Q1d4?=
 =?utf-8?B?NEVIRGt0OGZsZ0VXcUZlNExJZHMwcjN6bGxkTTJTb0lOUkFaUDRkTmttQUtk?=
 =?utf-8?B?WEV2Z3NpaVJFYTZwMmtweEJvdlEwOG9yWlY5QzFNQU0yclFSeW9KV3lYc1hk?=
 =?utf-8?B?U2NrRllaSG5KdlpWd1ZIQW9kSXpZMWZlbGdkN3FkTXRhanVYSDl6VnNQRDlG?=
 =?utf-8?B?aHg2UU94QU1STDdyTFhQdFlob0V0elFod3NDUmpzR29LYk81UTFzak1PeldY?=
 =?utf-8?B?eUZ2WDdQQjNIbW1zdUtIVTNtNC9yeTB0MURyT1lMdnAvYjR0ZmxwS0ZKaHJE?=
 =?utf-8?B?eU0xZ0xEMUIrNlpNK3JNTEVDS2FxeE56N0lMa1p5T3hvc2UzUUZmbVR1TzNX?=
 =?utf-8?B?WHJkVXhVUzk1eUNYSFNFVitQVnZOblY1WTVnejJiYm1RQWxDSStNZkVoU2RF?=
 =?utf-8?B?SlZBRkhieCs3OWtDZ0phakZva3JmOUR0dDVMMmpGRi9DdmNRK2NGZm1mdzZn?=
 =?utf-8?B?RisxMEozRGtQRjF4TmFSYXAreEFiQTF1OVh1QklBVnNLN1k1dGN5aTN6ZzZu?=
 =?utf-8?B?RnVZMjVSNUEyODNqQTdYMlNVRkRLeWZ1ZDNnV1BuekNmMHBZYUd2NHpOYk9P?=
 =?utf-8?B?OFVaS2VHanBRYmJjRVpEL2gyRk9PZDA2dXAyMmJtMmFEMkxEeGZwWHFFSEpk?=
 =?utf-8?B?YUtIUWxvcDNJekdPVU84SklIZldycDhsVUg2c3JEZ1k4WmdVeVNtN3o5ZWVQ?=
 =?utf-8?B?M0RMZTRwQkdUNUhhUnRvcVB2NzVCMXlJMml5SWxGRTRUbEhPSllJYkhBMVFC?=
 =?utf-8?B?dHZBSEUvQjAvcmdaM1E5QkRFZ09MTTYvQW9QQTgzaEVZWG1YUUJrSXZWZHJQ?=
 =?utf-8?B?Vmsvc1BiNUVybkhRTThTcmVFd05LUTVtcSt3enNuajZKK0s2STNwSkgrY2lk?=
 =?utf-8?B?VkpBYnNKZnZZN1lScndjOE1GaU1EdDNhTXB1RVlqeU9rcis0MU5WaDQzRitG?=
 =?utf-8?B?U3BPU1JuL2RnZHVWOHhtbmd5dVRoYThuakFVdUpxQUhWZ0Z6ZTVRT3QrajlQ?=
 =?utf-8?B?V1JXWEs0aFZvTFVLdHh1djRvQks3N3pOWXZoMlFtU0R4NEJmYzNuYjNxZ2c5?=
 =?utf-8?B?WW9RcjdpT0NoemszT1JMbFpYYlZVeThRRDVPb1FwVEpnckpkZ0ZLZnFMdTg5?=
 =?utf-8?B?NDB5NTdwM1JSTFVucm81d0F3SnZMMDh3ay9Yd2dJMVY0aDBJK0cvZWZBZ1p3?=
 =?utf-8?B?TW9hZTV5TEZnVllpYUIxOUI0MEJVUXp3RzdiK2cxNEZ5dW1WdEREcVB0Smoy?=
 =?utf-8?B?eVRMMDhCRkFYZ0JPZWZma3lobnE4ZDBBaHQ2MVdDYlE1ZWxKczd1NFVqSFFR?=
 =?utf-8?B?d1RUd28wRjVYRWlhZk5jbTdUcGxKUUVuLzNUdDU3SWlLTGUwQk9CVjU0bnda?=
 =?utf-8?B?RVVUQmRPUzltR0xhY2VvbHNTd0VsY1JUeDU0S2JiNGNqRXBYK1RlVkVaaUZJ?=
 =?utf-8?B?Y3RpQm9aL0ZXSlUxWGpGZytCWkNFQXoxeXJpUVpWa0lhSmYyK1dWYWFOcm1U?=
 =?utf-8?Q?FavxtYagoz9I+2Myih8qGdR0u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf966e60-8b5c-4973-b5fa-08dbb4902ddc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 19:32:34.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1POVjq9Ehxvaw3ntgM7i6dbcl0tnOWvqpnOMrJXm9HlCUjPU3g5AGNqh42Cqh5KCykfgu2poWBU8ZGE5xkNrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8051
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 14 Sep 2023 08:54:57 +1000
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
Cc: Mark
 Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will
 Deacon <will@kernel.org>, linux-s390@vger.kernel.org, "Eric W . Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Helge
 Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei
 Trofimovich <slyich@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas
 Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, Mark Brown <broonie@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Namhyung
 Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Deepak Gupta <debug@rivosinc.com>, Chris Zankel <chris@zankel.net>, Michal
 Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Randy Dunlap <rdunlap@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/11/2023 11:02 AM, Sohil Mehta wrote:
> Sohil Mehta (2):
>   tools headers UAPI: Sync fchmodat2() syscall table entries

I now see a patch by Arnaldo that does something similar:
https://lore.kernel.org/lkml/ZP8bE7aXDBu%2Fdrak@kernel.org/

Also, it states that:

"The tools/perf/check-headers.sh script, part of the tools/ build
process, points out changes in the original files.

So its important not to touch the copies in tools/ when doing changes in
the original kernel headers, that will be done later, when
check-headers.sh inform about the change to the perf tools hackers."

I was unaware of this and therefore I'll drop all the tools/ related
changes from this series.

Sohil
