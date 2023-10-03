Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A447E7B7129
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 20:38:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bceKXPZS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0RRj3NvWz3vl4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 05:38:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bceKXPZS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0QJG6JT4z3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 04:47:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696355247; x=1727891247;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1Hn07ucpFN9q+LredMm5VKeI0LBVJsUVgRzVQSPwiwU=;
  b=bceKXPZSLeOdvF7LcOse0CXuGyRYxff7utYJpFFg8bIt2UbICgu3ILWo
   TELNkKvRCiNLxhfr/dRkAgxSc+socL2hY14Ie4jTvt4vF+DVUepvsSp0n
   R7Fc7YIMWIdPvc04ZypETt9r+7CpJRdroBHZs84U2RUmkM+ob6J1RHBNg
   dfOfBNQ+alsjaiiwUY3miFvOPm5ZDP2qnMhnS1zHJLpeJy9Wu0StD96m/
   IoiHJ1c2fe78g5es6LUPwvBfQ6qdLvYmVGhYT+3o9Z9z2qkmGSDWCqHsw
   HmyKsEcxExqR9YEzXWjsUSduIaX7SxeYlamUncVLk6q2RlGuVoJKOglfV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="362303900"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="362303900"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 10:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="786174521"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="786174521"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Oct 2023 10:47:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 10:47:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 10:47:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 10:47:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 10:47:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvULl4Krj2yPdYiCB+bXES+m1YkNiohBE2sd2voauJ8i3p+CUsuP566vVrXd0A618YgJsJdw5+9FSr5ZzgdFOwbujsCEa+1k0avGcD04cVC2lv1k1uQzo5FXSNm/9bBYTLXTSQtfsV1OCHVrz7Kj2bPMDJCNNoP6z8FGEao7s4DRWeNz5460vaquiQcVo7k2LWhvLXahXJdUYGb4NAcspisOKwGytz4wZUFDAM1mXjlGgIyVtvx7nJdYMby+rycpo9PcVb4YAjet3enlAfRN0PBS14ThW+Ml8VU5rZEvc5uZif4nvJiVdygwaFrP4y48kOVMXMkKobyuGn2pQAvTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T09m1s1Ljak7a4wwFg5lDA69mRx4SsxeqyzRcZUU77s=;
 b=WEzfFGkfJ4WKQ7J+x7iypgoN42qy8rUXzg+gPFbVm1dUTVuI+fokrki1II+AY+SY0+gMR5AcaAAJewcf0saMqfB+lTjql/lsT1dB65dRNU0LbmscqM+e0izTP5D1rQ5GnqsFhgmRWX3yd7ADuF3jUuMyCI8mZ0m2NHeTTnyj/drsgzs83ODvaXVtuqzqbu9NCwEm2Luu0Hp2yq6q9l6nzvhqvxUbSCla2savf1MQ8bc+Dv0tqlVR/qQpyaUksyYflc3LI2yHTUx64pe6vVkpE40sFLtqe92XYYVEWxu4EDZcWQ8rN31XPX+OY3CYy2FH9qxGWP3owI9S+X035bjL7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by CH3PR11MB7322.namprd11.prod.outlook.com (2603:10b6:610:14a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 3 Oct
 2023 17:47:10 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::5e34:ee45:c5e8:59d0]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::5e34:ee45:c5e8:59d0%7]) with mapi id 15.20.6838.028; Tue, 3 Oct 2023
 17:47:10 +0000
Message-ID: <cdada842-2a7e-5f1d-eea3-3d99b637c26b@intel.com>
Date: Tue, 3 Oct 2023 10:47:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] syscalls: Cleanup references to sys_lookup_dcookie()
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, <linux-api@vger.kernel.org>,
	<linux-arch@vger.kernel.org>
References: <20230628230935.1196180-1-sohil.mehta@intel.com>
 <20230710185124.3848462-1-sohil.mehta@intel.com>
 <5748f659-4063-0e18-c5d4-941a863d0d93@intel.com>
In-Reply-To: <5748f659-4063-0e18-c5d4-941a863d0d93@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0103.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::44) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|CH3PR11MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ee9783-bd52-4130-edc4-08dbc438c4b6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v9bmFcVYl3MtctP8wwFzNkjVr5yxcUTHm40lOVTDzjHiQ5oXAeFpgk/VyT2pCs/LgGy3+xoBvX+nCd7yX6UETbtAUu3Mk1WlKWRuh+Ei9DU7flV0mGe0FEtHwLRm3dRPK4sXtIAT+jWQ4vA/lqBGFY6Euve55AUr6nsRz3jcKvGCVqXUvxIF2xJTgPOTWdoPiLqPpVzX7ZsdDnhT1/1ferOpcwikV5TLvw61UJcYOBbTNuKbtu+gjJq3LbVQ1WHHUQDhg4xEAR+pyBvsK/Epg0B9LwOlPkd7GiG+yLIvCsfgyJveEhef2bSRQX9J8O4dLYe1JZwmT8Qf8J6kQuw0ZPF2//q95vvMLMR/i+oXlpalUKHP8VVW09ya6exopgxbbxOOLMsSPMJm41Lo4rWLBbewoJ2sb+tvGRZhd2o/rqvjKe5XaaCCp0RSVApXMix+Pp0yc5h4cDSICiOujFpF/TT4RbTy5oZfLsxYZqer808eWNadIo+lZj+gWkCtgcgTdzqWPC1o6wiy2FXKcSb75O0gFHgPe1AIuRA71u4rYaWBhRsZyHDWBeEknNuJbzjjymwbvzBTFcs43uH1ah4sGnDSyBKvJH80gqsG7tlGTnjnsn6MsjToiEOwGmY8EZUuW1VkfV7X1JVwZG717kFnXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(376002)(366004)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(31686004)(53546011)(6666004)(478600001)(6486002)(6506007)(31696002)(38100700002)(82960400001)(2906002)(86362001)(2616005)(83380400001)(6512007)(26005)(7366002)(316002)(7416002)(66476007)(5660300002)(36756003)(7406005)(66556008)(66946007)(41300700001)(4326008)(8936002)(44832011)(54906003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d21PekhucnducFlyazJySlNUb0w3SUM0T2l5a2RMSXVHUkEwZkdGUDhmS1o2?=
 =?utf-8?B?blNhbVlmVkI5bG5oazNEamxtQWVRQWovazd6cTlTa3JoYkdIMmdUbFNxUEZ4?=
 =?utf-8?B?UVU4MkdGc3NONDNxaW5oMElrbXo1QzhUU1VmdEY5bVF0ZXdyVngxenU2MXNY?=
 =?utf-8?B?Wm8wUEtmNVFzVlpBTUhQU3B2Q052K3JCWmhuZ25DZE1FRUNyUzFYL2lpUThB?=
 =?utf-8?B?dTcxTUVQa3VvSCtYZGRLL1FNK2pyRTBPYUlSbkM4bDlWWGpMM1hXQTU3LzBi?=
 =?utf-8?B?WDNoa0RoK1VyQVYvd1lJemVJNlBDeU5TU0FyUStYN04vRDBKdldQczBTRlNR?=
 =?utf-8?B?Sm1wTjB2QW10Y2dOc2xzOUdZMGtuRU1abHpOU0hKclQzMnZTUSthbitIZ3Ur?=
 =?utf-8?B?SW84ai82SUpjZmQ0b3orcjBvOG90MkliWm9SVlZHRmxoZkR2QzRTR25hTkFK?=
 =?utf-8?B?cHBDUzdBMEtxMjdMVTZNdndnWlNnSFVOT0UwZXcyMHdObmk0UCtkb2RJQkVR?=
 =?utf-8?B?cWtkaWZtZTBPS2xscEE1N1hwWDRXOFVEa2ZlS2sxOFp6S3k3VlIzZVVRcUdh?=
 =?utf-8?B?TS9nUm8vM055Z20zaVhFUVZkbDBFMGc5bE02OS9DQ0tIMCtSeEVYVFRtYWpm?=
 =?utf-8?B?Q2VVQzRSclVhcVhBNk8ycVQ1djF4YWpPUUo4dGRTclhtbnRxUDYyM21mTFVO?=
 =?utf-8?B?Wm94U2VFTkx3WUpHYUU3Yzh3a0J2ejdnUU5BV2hCNkY2WEhBS2s4YXk3eVJ4?=
 =?utf-8?B?MDg4M0dIbkRDSkxabVo5T0FWdTNIOHdnN2hOTkxYSmVPTGRENnFOQ0NjNUsz?=
 =?utf-8?B?UGI3R2tDTHVPUWRVR1JsMGNqYit6Y3ZiN0JtdmJpdkdwZVpJVkFwR0dwOW44?=
 =?utf-8?B?TGhaankyOXBXMHo0eTc1cmN1djdwdW5CckY4Wjk1RXdsNTdlNmhzM3lSeDN4?=
 =?utf-8?B?L3EzcHFZdmQ3TkoxYWZodjlidis3U3VPVGppK2V0cmM4Vmc5ZVJDUkVwM1g3?=
 =?utf-8?B?NlR4L01ZZlFBRUZlanBMVGpRSWxSSXVKbzBzd0R1V25QektRbENYZU03dlBB?=
 =?utf-8?B?L0lpSGxQTmt4bHdSUXNZdHpEVzF5L3N2ZE9QNEhEQ1BTbk5DdURVK2xsNVhs?=
 =?utf-8?B?N1I0Q1dVeEcyd1JuL1hJUDZ4Ymh4NVM0c2tsU1hxMFBlRXZ1SEpsVVFkeHk0?=
 =?utf-8?B?UkFrdUVOM3RuSVFmdVo3ano2cnVJMnRwRHZnV0xyS0QyYVJRZ2tPdUFUVE9k?=
 =?utf-8?B?bERCUHhnYWlKcE5pY1JzbmhBY2Ywd3BOMm1JMW9BT20reFZKMGNtWmpodXQx?=
 =?utf-8?B?SFpKVHRNZ3hrN05pbkRJNk1MWEh0V2FqaE8yZWIzY3d1aCtyZnlEalBxRVgy?=
 =?utf-8?B?TFY3SGV3a0JRLzJldWZjcGRYMWxZUFZDOTZtbGxPRUlTdmdrVDhMR2FuUkh5?=
 =?utf-8?B?UjNyVncrQy82RXU0akh5VXNaKzYzYzRibG5mMk80a2tHSEw2TGduMk96d2lP?=
 =?utf-8?B?cTNkTHRnaHJwRlcvQzEwTTl5SUg1MHpDZkswd3lxTlRPRUxMaC9xdjRFYjZU?=
 =?utf-8?B?N1Bkd1RSV3JWYkNPVXBjWExDalhRSHRORlBnVTBTVzdTcmNxaDNzdnJtd0dw?=
 =?utf-8?B?US9TR1VKazFpVzBPd0tXRk02MmV0S1MwbDdRRFltbisvaEpZQWpPYTZFMkEz?=
 =?utf-8?B?OVNSUFpUWWZqL1FPSDRVR1BNVVVEVk5kanBkazNBOG9ibW52dXAyejB1L2h4?=
 =?utf-8?B?WDNrRC9GRmN3aEdWREZXSGg4OE4wd092eUNPcG0wMm5yWWhxajkvRGwvdjRR?=
 =?utf-8?B?N251MW9rOVp1RDhKcHpweXQrWFBiY0FDeE5oWGZqcVZpYTRVQjFzMGZ2Rng3?=
 =?utf-8?B?eURzKytoYXp1WmErSWNyZnIvR0pFUjFubHhVKzZYM0pjUllDUjZuQ0J1blB3?=
 =?utf-8?B?Ull6NUNzQnlEZnYrTHpwOTVuRUd6ejlHdmVFcXVGVkpjRW5Jb0dtenZzdUtz?=
 =?utf-8?B?b1JyK1ZTc3VPUGFzLzdqdXV5VTNMcytCOW9sS1VuNDRFTG4rU0xCS1k5anNn?=
 =?utf-8?B?RHk0UWlWMU1KSDlOT1ZYaEN1UTZhZ1VzL0NBL1M4TmU5RzBMOTBNb0VuOXhG?=
 =?utf-8?Q?1lTdVEFsU781YiPv4i6YOA1Yv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ee9783-bd52-4130-edc4-08dbc438c4b6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 17:47:10.5945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DE5IPwMeUTYtQGkpfgmHp5qksL0yuDvCN+6IiG/BRavauDyZdAFLmLD85rSy1NwESMTpNANMhdGAYJ4G6dQ4ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7322
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 04 Oct 2023 05:32:24 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will
 Deacon <will@kernel.org>, linux-s390@vger.kernel.org, "Eric W . Biederman" <ebiederm@xmission.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Helge
 Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei
 Trofimovich <slyich@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas
 Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Namhyung
 Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal
 Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Randy Dunlap <rdunlap@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd, is this a good candidate for 6.7? Though old, the patch applies
cleanly on 6.6-rc4. I can re-send this one if you would prefer that.

On 8/3/2023 2:44 PM, Sohil Mehta wrote:
> On 7/10/2023 11:51 AM, Sohil Mehta wrote:
>> commit 'be65de6b03aa ("fs: Remove dcookies support")' removed the
>> syscall definition for lookup_dcookie.  However, syscall tables still
>> point to the old sys_lookup_dcookie() definition. Update syscall tables
>> of all architectures to directly point to sys_ni_syscall() instead.
>>
>> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>> Acked-by: Namhyung Kim <namhyung@kernel.org> # for perf
> 
> The patch has received a couple of additional Acks.
> 

Namely,

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

> Does this seem like a valuable cleanup? If so, should it go through the
> asm-generic tree?
> 

The main motivation here is to make readers aware upfront (via the
syscall table itself) that no implementation exists for lookup_dcookie
instead of them searching for one and realizing the same. The syscall
tables do something similar for _sysctl().

Please let me know if this change seems unnecessary. I can drop the
annoying pings in that case.

Thanks,
Sohil

