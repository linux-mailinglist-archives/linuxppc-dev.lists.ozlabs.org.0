Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C35607B7121
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 20:37:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S42YtOLA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0RQB4tPGz3vqx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 05:37:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S42YtOLA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 04 Oct 2023 04:19:54 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0PhV21gxz3bwL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 04:19:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696353595; x=1727889595;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TV4tT2V17d7qWSr3I0MvZaUDlAEecGq65son8QtJwkQ=;
  b=S42YtOLAYke9FtHssZjl9s3eHzuy8a/folkXosh3hLWurjQ/bQXxM0yN
   U8Xk4OcO3lgSHp31F8fqZLeZArl8X3mXjkSEhyEVvt5/tK69wYSB86GCX
   cl7MnTLzr72dp9yKDOjCjrd6A2YX78sRcetApWqc0HTjef0jvn3w7MIqv
   0NPDqizkTf/NZpwDMFik1RhdvkH3Cr+RAmZFsWmsnNIREJDHoquzylgGp
   HMeJ/Y/U+nA7XtL3u5fsCgARCFvF3UzC8hGo3igfu4eTPWmnSVp1CR+66
   nsUE8jy3PENTdPvv4Jx+NM4GNK7XF/7PpzmvYqX7iNA3kGo7InhxO/to1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="4497587"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="4497587"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 10:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894577911"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="894577911"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Oct 2023 10:17:16 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 10:18:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 10:18:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 10:18:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElTv4hC33Op8SY6d5uJnIHHTnfx2Of/ijwKAIq3rHQ0q/S7JgoJqQIpAnAGoZLg7TkxcbRVxn2aUQy7Wxl9kRA7TC56UiM7nKdBy0ZAPYYPAhbEdY3x/g8NWGL+AC3RHhATIHjaQw2zwkUnByE5BgZznBoUgeL8qeqJrDKr1quj1lX2UTnCx5sc7E50LzLZUIfRaq4KF5wNXgwM+rWZTYOlogxQOr31iqYqg0XnrMdJtcOyNKCxhpOKa1GuJtxjk6mKaYmwr1D3S5CmESBUCY16yWfb1I9W/nkuLJjopSbyG4dZ2CI01MT29ROCO1Y3HZdN5mrlYON7LHEMg5icQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+Lg5vJhRl04YigVbhQ9FbGTryCygmyMQS/JBnGV7ts=;
 b=PvM7ETTiqgzl81WVMt8zdpkHPd6ySYQgwhttLtGJKlHFnGO/kLXDFEJHsngBnms8CbSn5qf5IpGkuZePGWtxRienJBHv+LI2o29BJDROpInhPOKcgPrRMXrwX9B3w0f86gYeGnuRASw3cz/qr3SDit/IExiz6ul0D7vNOPG1gfALLzERn9MkVkZUtgL6/MNiVR/OjVMW7Bb6BdJCGIgXBAxu6rKJCDSOaVy6Kfiqtgf+O1o2WLQf/oCGGSoF1k7aIoMWwXmzH0qDJGB7ygK5obtL37+s+PyQE49kJBSiXGgrfM4hKQZrWVGOtHqQa0MT0xvKVVq4SaUIihRx5ZHwpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by MW5PR11MB5881.namprd11.prod.outlook.com (2603:10b6:303:19d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Tue, 3 Oct
 2023 17:18:36 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::5e34:ee45:c5e8:59d0]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::5e34:ee45:c5e8:59d0%7]) with mapi id 15.20.6838.028; Tue, 3 Oct 2023
 17:18:36 +0000
Message-ID: <622b95d8-f8ad-5bd4-0145-d6aed2e3c07d@intel.com>
Date: Tue, 3 Oct 2023 10:18:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, <linux-api@vger.kernel.org>, Linux-Arch
	<linux-arch@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
	"Ingo Molnar" <mingo@redhat.com>
References: <20230914185804.2000497-1-sohil.mehta@intel.com>
 <487836fc-7c9f-2662-66a4-fa5e3829cf6b@intel.com>
 <231994b0-ca11-4347-8d93-ce66fdbe3d25@app.fastmail.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <231994b0-ca11-4347-8d93-ce66fdbe3d25@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0063.namprd08.prod.outlook.com
 (2603:10b6:a03:117::40) To BL0PR11MB3313.namprd11.prod.outlook.com
 (2603:10b6:208:60::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|MW5PR11MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 529268fb-ca70-459e-dbff-08dbc434c5bd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cBzB1oBGG76jD4SpKZM44J78I5suCcUw5Hchs6R9dvvr24IxdjLbpSELlNbPKzJ/Tte3qaAFa6tdy6IV6oeqFTrzZrVFarabXLhDyE/OupP0PsFdiIlpaFCjLQRkxsM/3maM0u8oEWdAoq6iQ7ufX3dx981l1LqiuMEXwL0mj6kXADBGlLSt+9Gd8pCtw8d0ND/3vuxDFJxVcweMGpHSPP8yhXdeQuAo0SwrT2QL60jxVcrpKL9V29JySYO0XuFxhRrJfZjE4/Wrvb4937VYD7nMqu9cAPoMlvItfUN0vnqltZ6Eha6uLXMeJAVqaD7W5z/no1L1IpuiU4f/ZXAG3TDruLIL/UiMzmLMpBczwNLz6QKOF27Xq4QYrM0BuJRoNNIdHYkgDaMEWTw+vexXdwu3NKzyBfQYS/2dJWGFOffjiBhiElok1Tg92ylzOq9Y6aR4MgLgde9ufu6VNsbAMBmk8Sb0f5ACprk0ibXA4r1vIlZCzKkqHuCQdGZXlkpWdFqTyFfd+C51475Ph6k+Oy3iyU1KboOUrPvJAumdYXGbPw6+KzjPY4JTQv7bpxp86mpKXvZb3MFIFN2547NbOKJcb51JGNn74EHXcSYapHkW3q3qTbIdR0nPWSCubxahP+Py7vEkLT/pH4KZKuuKlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(4326008)(8676002)(66476007)(8936002)(44832011)(66946007)(66556008)(5660300002)(110136005)(54906003)(41300700001)(38100700002)(316002)(6506007)(82960400001)(7416002)(4744005)(6666004)(2906002)(53546011)(2616005)(26005)(6512007)(6486002)(7366002)(478600001)(7406005)(86362001)(36756003)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU5ZVTZ2NFIzcXloaHRLcXhqL0FOaW5Ea0tKTWtXdDZrWE1ZcXdrMWdzRmJZ?=
 =?utf-8?B?WWtsSDdZSUE0a2FFVlVGYkY4WkZZdW5aRnY0dUxzNW1GTGFtYTUxUHRmYW83?=
 =?utf-8?B?ckVNK1FvM3h2TUxhYitQUnpNaWhhSmdCUlNmYStoWXN3TlRmQm5kUzZZekdh?=
 =?utf-8?B?Z1RTeDlmdEFjZWRQVjBjZ1ZQcGtUV3B4aGpocUhQMmpwUkg5amhkaEhSUm5Q?=
 =?utf-8?B?anFuRzFSZHlNTnFLdVpwcS9SeG01QnErbmE0blBQVjZDNVBWV2lFVnU0L3pk?=
 =?utf-8?B?YXE2bnQ3T0MrMEpUa1RacGs1bC9TSHlkdllyaWxodnVZc0twbmZaTHpxUGk2?=
 =?utf-8?B?eTZMZGRraTFpMGpZZTNzaEdUZ1V2WlRQQXlkVlo0UEI1MEVQZ0VIazFSclNZ?=
 =?utf-8?B?dEErNHdQd2NjNnkvdDV1THhWeFAwdXhUaWZhNElJNDg5ZzBmWFRmdEhsOHFZ?=
 =?utf-8?B?SFN2bTUwUUg1QW15VVJrbFNCekQ4NjVLS2t1bkVVNmw5T3R6aGxRUWFSWTR4?=
 =?utf-8?B?eXljZERmbEVjNkxxdFd6Y0Fka2xxVFpaR1QxRzFIRUFCNS92Q3FrckRFYTJD?=
 =?utf-8?B?ZXV5eGZ6SXlvQWZyNHJ5NWp4KzJnU3hERUJBSlJOQW93K3RmTFAzNEQwWURP?=
 =?utf-8?B?V3BwaWxOcjJiN1FhSlRUUjlyL284aDVQc3M0K3VIUnZqRi9aTzJNVXdkbjBt?=
 =?utf-8?B?am4wMlVsRGF0MVRJVEtVS1dqWWp1TnRXL1REMkduV1pORHh6ZXQ2NTBKZWk2?=
 =?utf-8?B?WmxCYitDWEVIc1BsWFpiai9BRHY4elMyMEIyWjVCQlJhYzRuZkZoOUlNZHlE?=
 =?utf-8?B?ZVhMSEtWU0x4ZXNsTDJJMGViL0FsVEViSzFIMTNyVXI5WDFIaWFKemhtQ0Yv?=
 =?utf-8?B?NXNnR01qWnZFNTljOG5PbzIxdVVuQXdVV0VSK0ZBeXRIZW5RVWZodE9ONERQ?=
 =?utf-8?B?OUhBYVQ1MytYZnNlN05zZXlxL0pCbzVYSlZvcCtpU29zVXBsOFozV01qbFp5?=
 =?utf-8?B?MjRiR3poVWxuWVVzeHZDRC8rN29zYW16M2VwOUZMSm9uVlFOK2d2WUw0UDFa?=
 =?utf-8?B?T0lMaEo2N05FMS8xRzlwTVNOM1lDYmc4M1JwaTBlVzR1ZVVkRnpRZkIzYlVs?=
 =?utf-8?B?VU5FQ2dLVWt0UUNHTlBmbVYyZDY3anJ4K2lrU0s0TEIvMTNzcmt6ekxIUEds?=
 =?utf-8?B?aXVaR01UNDY3Y1h6Mk5PdVk4L2hxN0VpSzhibHg2V2p6Ymc4WGUrNmxJNWkz?=
 =?utf-8?B?OWpoQlNEMmxiOG9EaWtTR0NVdDFKc0U4RGhucTRwV0k4aVVYbnUwSVRxdDBD?=
 =?utf-8?B?eTdKSUpiRysvM05GREJpVGo4dldGMCtVcUs5Y3YrUVE2TzU5NUVrWENTSXFu?=
 =?utf-8?B?WnJIZTlib2Q1NGdrbDZTZS9ibWgwYTVyTmovQ1g3R1Nid2kvazZJL2VDV09n?=
 =?utf-8?B?ZHcwclhNSnFnMjJ0QlJtMjdiNVVHMFhzdWthZVZaUy9IaFpPVXpMUWhyeG5r?=
 =?utf-8?B?NVFtckhEN2phWW5UM1ZZa0doZHUxQnJLWG4yNm9HWFAraWgxNytzalNnTy9Z?=
 =?utf-8?B?Mk1vN2pkenU1MGRZLzN4aTI2ZEd5L29xOFM0WU1Cby9yc3lVWHZva2NmQmps?=
 =?utf-8?B?eXdHeE5kV3pyMkdIZ0loK1ZNK0FHQ0VPdDJpbndvNXlNOE5hN1NEVmdCZ0lv?=
 =?utf-8?B?eHY2Uk52MEVpc2JJbTJHOVMvZVJzTk9PYXFVd2N6M3lFWENBZ0xkczd2OE5y?=
 =?utf-8?B?U3lkUEp5Uk1DbWJCSmFQRk0raHhHTGdORE9pN3NlK2pmWWJ6U0x4Q0xra083?=
 =?utf-8?B?bXBHZXg1TUZkS0o2Tnk4Qkd1Z1pwdDgwbzBONE9lTUc2TjV6aUNxRXBmMUFa?=
 =?utf-8?B?TXpuQmF5V3Y3QW92dy9Nb042TEtZS0tWT3R0aWY3V09zdWVucFBUUTZTTEN5?=
 =?utf-8?B?dEVsMlMvL2w1bE9ELzBqR1N2Yk4xNHRHK0J2ZHVyNEZTODNOTml3eE5YSld0?=
 =?utf-8?B?MTRFTk9VMFVRekh0NlI4TkVpTGwwTDhmckw4TVFuVElzbEtVK01jSEQ2dThq?=
 =?utf-8?B?YXpnaGk2dkdkdXBYcWltRVJBOVAvc2RUdzc5NzkrUnBrbzVtaE9URVJpUXpz?=
 =?utf-8?Q?95/79KBaE/pDDA5SEH/27W8TH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 529268fb-ca70-459e-dbff-08dbc434c5bd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3313.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 17:18:36.2175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: taVq7aiy+E/+aSodbq/4rI0f0H8z1si2jTWBMWpeD6JKJdE6PJfVFA6izhh0kD6JBh7dXsZbt8Hzz3yuFcYl+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5881
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H.
 Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will
 Deacon <will@kernel.org>, linux-s390@vger.kernel.org, "Eric W.
 Biederman" <ebiederm@xmission.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Helge
 Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei Trofimovich <slyich@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas
 Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Mark Brown <broonie@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo
 Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Deepak Gupta <debug@rivosinc.com>, Chris Zankel <chris@zankel.net>, Michal
 Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Randy Dunlap <rdunlap@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/3/2023 9:54 AM, Arnd Bergmann wrote:
> On Tue, Oct 3, 2023, at 18:35, Sohil Mehta wrote:
>>
>> Gentle ping...
>>
>> Are there any additional comments? It applies cleanly on 6.6-rc4.
>>
>> Or does it seem ready to be merged? It has the following
>> acknowledgements until now:
>>
>> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>>
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 

Thanks Arnd.

> If you like, I can pick this up for 6.7 through the asm-generic
> tree. If you think this should be part of 6.6, I would suggest
> to merge it through the tree that originally contained the
> syscall code.
> 

Dave, Ingo, would you prefer to take this patch through 6.6 or defer it
until 6.7?

It's not necessarily a fix but it does help finish up the shstk syscall
added with 6.6. Also, it might help reduce some merge conflicts later if
newer syscalls are being added during the 6.7 window.

Sohil

