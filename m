Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F8F84AC3D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 03:35:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KYLAvt2p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTS5F34dvz3c5f
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 13:34:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KYLAvt2p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=jesse.brandeburg@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTS4Q3wmGz2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 13:34:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707186855; x=1738722855;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wRtk5hT49Mg/nQTRDVPt7i/1FgiC0I+CT7JKe9IIFn8=;
  b=KYLAvt2pxkRR8HDgauI88FU/yYAiQd4Wrgz+3OpsgMBbx+Ptn4oz+S2I
   134w9auu4/mxDw6zj/Sd6NpNM1Jq91z1VpApG/IgyUFxWJvAEA6bYghbZ
   vo//PYCf0f66vJ4SMY4SvRLdKMf38iPiPvI/KI1O7fJBFL/KRwQ2gZJXH
   kQESURnbwqdfLYCtW0og3pRtAC/UOmgvQLXftLVtMmjhXvqKvK7ZrZR65
   yWa/NLH5AwdQT0V5nKlQzpW/kzTLslkg+R2DvgePBpm/FOuUkGV0Pph9X
   zUASe+8H4utc9LSmXmtKCaAFRWtFmNB7ZMtmM1qXVi00tBqc1ajbqRCVB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26095170"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="26095170"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 18:34:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5641490"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2024 18:34:07 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 18:34:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 18:34:06 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 18:34:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 18:34:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKA9vdCgc5Q7fnKkA1/EqdnNuFlzVW2pN7sZJT/kpevAH19LvSAH+FV4QK20tETfnBThDFiIsldtMutvFNAy94M0wPt45EOPgCVJi1YMcKF9FG3DEOA7iWYxgdyixbxHIoHPYiRTTeigFQ3bKmE4Dl78Sv5MFo4Dcwxx22LGsdJPpZCl5B8r9RY4UBxp1nJRBXQCZErhql8Ws/jFrp0yfEK2Mhnnsx3eOVAzMRmPYkMHVYSIoIzHBE/pA4aGqcDa1HJtu5vQNtriOUvA5ZhRa5yxuFqAluT9Z9gK66QjL7ouH41KU9YXy+tyvHP7HflXRHa/lkrGIgG8ymnHMWCryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBe7D2Hrvsf0gpEdOzzhZJwAVA1iqeXESpDoWOBMbG0=;
 b=CnXi0LIDOzDT7JxBeVmz2xn1xQrOCUYbnhZ1FMd63m6UZjE5NxSlHYdkjZVc/w479Q6s+ByTdTwidTn1sTcvIWPGWr1Lb/yMsdBHBGQTxOwz0mjr/y+dztGs0ocxMYPA7RGBl3NwznspXoTC2uPiQLUj+QN3UCu0f6oIy1AgwQp9O5iDaETVrQ434i+EmQlbq/LXrTH8TAGTc2OhMMTtEJXwTi7UEiMIMngO01WcBlAxH1ullr03Qd0ZrHnZ66aJ3WysefazAmNG+DOLBwNLN3WjMYTMzsdS0aJG1l5Jz1r/AoQR/yCPEuenqGwcw6Pxevn0BVWdAYbi6ZKsGlNfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4921.namprd11.prod.outlook.com (2603:10b6:806:115::14)
 by DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 02:34:04 +0000
Received: from SA2PR11MB4921.namprd11.prod.outlook.com
 ([fe80::2003:777c:8772:8262]) by SA2PR11MB4921.namprd11.prod.outlook.com
 ([fe80::2003:777c:8772:8262%3]) with mapi id 15.20.7249.032; Tue, 6 Feb 2024
 02:34:04 +0000
Message-ID: <87a18564-df0b-4006-b08d-800c45b028c4@intel.com>
Date: Mon, 5 Feb 2024 18:33:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: Build regressions/improvements in v6.8-rc1
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, <linux-kernel@vger.kernel.org>
References: <CAHk-=wiB4iHTtfZKiy5pC24uOjun4fbj4kSX0=ZnGsOXadMf6g@mail.gmail.com>
 <20240123111235.3097079-1-geert@linux-m68k.org>
 <d03e90ca-8485-4d1b-5ec1-c3398e0e8da@linux-m68k.org>
From: Jesse Brandeburg <jesse.brandeburg@intel.com>
Autocrypt: addr=jesse.brandeburg@intel.com; keydata=
 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
 /fnLfll98Nhx
In-Reply-To: <d03e90ca-8485-4d1b-5ec1-c3398e0e8da@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0023.namprd21.prod.outlook.com
 (2603:10b6:302:1::36) To SA2PR11MB4921.namprd11.prod.outlook.com
 (2603:10b6:806:115::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4921:EE_|DM4PR11MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: b1105164-dfb7-440f-c609-08dc26bc1537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bxw/o8VmYnNX6HJm//8BBRKatYucU8+bEYkIuUqPOv+lmjURAbJPO0Uvbx5ea9jLiJcknrqJmq2Y5EHJpzCpgVlP7GCRsLQtXAj389Fs/9k/GCaclxSWDKbfRhTuQs9fGj8Cj56SLJOA4PXXBE/xFW990/euX1VJx2jPP1BudV1AFp6Fr00XG8zlTDyAJFLatJkxkoseT7T0qXs8kjmQ2J8SC0B/IDQ1hk/fJZe0NQu4v2sLv3RwJHUOnUxh88AtGZFipXPn4tOWfL7+Fj+2oERf6YL5hjr2+pR2TtU0Cl7+Wz8laR7iXmy1P1DdgiWbDNoRBz3lHvDHo4P35FKLoMNgEYhtifSzSdP0hxojtwJO2AQQGR1YyIzuC3oxT5FEUZKX614/+0uEcB8sHfHOcz+4VQ/cCfzHB/ulul8yAJzgddyyLSS/gTK/iOWHAUEm7zHR+1oo+ZvzdMCqiUD0Fy9J2C2s+KzTXHPRv/zyOvc8CNI0mQzppP7sTjsrldA1RSnSYm4UV9F45rZeWS/TK/dXGpSxi/Tmv4sO3dOYd13nhY7GS6pbVzFE7ieWMU8OTcHVXX86YhQy1ThElt56T+joMABNNfWqm6zGcBmKP5cGuUgO3MCHNUNzWuM+ILY5d1T0n4LbRQGgWH8yApB6ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4921.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(86362001)(2616005)(41300700001)(31696002)(478600001)(966005)(6486002)(7416002)(4744005)(5660300002)(2906002)(44832011)(66556008)(316002)(66476007)(66946007)(54906003)(8676002)(4326008)(36756003)(6512007)(8936002)(26005)(6506007)(6666004)(53546011)(82960400001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlE0bHg0akpHY0NsWk1FdGIrY3pwbWRUYTg1MFBBL3dCcUMvWml5QkovTVhE?=
 =?utf-8?B?ZTJGL2JQb0xTTkxURWYvd042RjU1ck9QZk9jUUZoaXl5S1ZhTzI1dmhhbm1z?=
 =?utf-8?B?UWFDMUE1TFpvdVJUdURKcmpUNlowL1NkS0kzb3NIcTVVQnRsbHAzd0hVOFoy?=
 =?utf-8?B?ZXVpcG92QnRiMXh0cUs0MVo3ak53Mys2Vk1FcGQyS1VRUjZYeUM2dEd4Q3Vr?=
 =?utf-8?B?RDFiNFQ5ZitYQllTaUsvdHpKRkdFQ3FBek8zdmk5VjQxUENnUWwwdHMxVUhK?=
 =?utf-8?B?cExnb2ZKbXpGeStaRGUxdERSRDRIcXV6dTZGUlJub3grRk9najJ4R29tN25F?=
 =?utf-8?B?Wjl3NFZVbFZQTmx2TE5OVVlPT3RJSlNBU2J5RXpGRUcyK1RtNm51S3Y1ZnQw?=
 =?utf-8?B?OWRKczNKMUcyYndQeFZBTEk4bkNLRzhuRXlFQktaTVdma0dqVWsrTkZGbHZX?=
 =?utf-8?B?M3hGVGtkSjR2aVAvbjg1d3lJTXd0NitVQjZNMTJCdS9OWkdoMkZOK3NlRytV?=
 =?utf-8?B?VVplRkNmenJ4UnFaOHZ3cXNtU005N0VNNkZWOTVIOW9PZ08zY0l3aEZtM1Vi?=
 =?utf-8?B?cHpLMTYyd3hZTzFpbjFSZEQ0d0lOWC9LWWFDdW93YkhublNIS2J3ZWoyV1l3?=
 =?utf-8?B?WGpqdWlOUFUxTU9WeE9kTVNDYlAxcTVuOU04Y3FESEUvRTZYb3Y1RzZWem1r?=
 =?utf-8?B?MmZDNW13NFZsZ0dib1I1a2EwbUJDYmFtalIzYVdtSzRhSzNWTzZMbVZoNDdN?=
 =?utf-8?B?V05BRXQxbnpkb0hMUUcrVlBPRGlucjFFaDRrM1pXb0hRaGw3QmhJOXcvb1J2?=
 =?utf-8?B?Njc5dVZscllQdEZ6enF4bXdEcXZsZjUxVkdQc0s3UFBrdVlyakdhbkFYNEd5?=
 =?utf-8?B?YmJRb0tXQm1VdW1oUVdZK3BlaUM3NExScmJubWJGeHRUMjhBbXkwYkFleUhq?=
 =?utf-8?B?S3R2Mkp1WHdPaDNNTTdtN0k2REdYOVNDZTlHZ0dFSjlXR2JwRnVOdjMycTlC?=
 =?utf-8?B?K0RzK1lCS0dURkNGbk43ZXhRTS9IcXpKUFVVbWlxVUtXN3V0TXA5RWJrRHd6?=
 =?utf-8?B?K2VNWm1IVHJ3NFJ5U0Y2TG9URnc4Z2hlQWs2OWRjdnJXamNDVjZRbW05dzBv?=
 =?utf-8?B?UXFqNms4eEZ6N2FMQW16M2lBcjNxMy9VdWNVd2h2M0tuWGl0QWNMV1FNSHdo?=
 =?utf-8?B?eVhWVlRyMGZ4M3hIdkd3NEFQQWNFMGVXYzdKaVh3Wm90UHFGOXQzZU9wdGkr?=
 =?utf-8?B?dE9UYjYrSEF1Q2l0QmZUNjVqREZabW9rd2hFRHFJSWg2NnYrZUx1ek92MVFy?=
 =?utf-8?B?Ukx3TjlSL2VzQnlSTVFRc0hWOEFyTnZGZDlKNHNEUjc5NHlWY1ZYaGFBbEFH?=
 =?utf-8?B?VWozN2R5M1VJRGt4aE5RTmt5MHhhQllBZzJ4NlJRc2lKdFdzdHRWcjB1cTgv?=
 =?utf-8?B?OTZJVkM5ZXA2d0JURjd1WUhMOXd4RGt1U21VUkw0TXhuQkVoRlpVZHQyWVkr?=
 =?utf-8?B?TWZpekM5cU5lK2JkMlE1Rm1rRFI4aWZYSi9EQWVMc3pJaE9CaVZqWnNUaFA0?=
 =?utf-8?B?SU8rYVF3MzE3V056NllUL2xQOEhsTnFGKzM0N3pnL2oxTWMrQ05aSkp5WTh0?=
 =?utf-8?B?SWZqZ0dVM1BJRXQ2SGdIQ2c5TGRtQ0Frb2JJK1dHMEhTTDJEVCsrczg4S0po?=
 =?utf-8?B?MFRRQk5NbVUrbDJlZnpjb1EvZGdxZkNEWFY0NnNUa3Z6eGs4Ym92a3RCNzdm?=
 =?utf-8?B?WURIMEExL3dUV2FySmlUNFdXcS96SXl2UnUrenV5SzhKN0E2THBrZFZxMmo0?=
 =?utf-8?B?U1N4a1JnUmtYVzdsbm94TGRVakFwVDYzUzVIUmh4YW1kelZ4K0lUU2Zsd2FU?=
 =?utf-8?B?U21vdWZyQmNpNmZTQzNwOWFja3dXOWM1Qm9Gak0yYU16aDRUNmYzS2wvbWho?=
 =?utf-8?B?WVdlVkgxeS91YTJqNjQ4djFSM0JrOTFSS3hrZGJBYVpQRXFTY25ZaisxUWJR?=
 =?utf-8?B?RUtYWEg3VDlOZzZHa1E5dStsNXZIdy9QSnBsdHRwdUhVaXlpODBQTi9HK2RO?=
 =?utf-8?B?UU5SOVlMVXhpY3d4dVYxQ1pSOXFyMXAvSnFiYTZkUXowRHN5dkxwb3NlR1pV?=
 =?utf-8?B?SzhOdWU4VEZFd1FFeUVSN2N6L3YyZFpSOURHL0ZGK05SMllZeHNhalhZbEpl?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1105164-dfb7-440f-c609-08dc26bc1537
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4921.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 02:34:04.0831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02Ln35SGp4htuRY3IpFYwFDK6JBFaQnyuDpHmvHwW7xjzSObDDmL6e8G34ueBrB5YLR5XtaIW5aH/V1rg2c1OqX8dQ3WKidQHFH7Mm8pUeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6479
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
Cc: Chris
 Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>, linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org, netdev@vger.kernel.org, mpi3mr-linuxdrv.pdl@broadcom.com, qat-linux@intel.com, dri-devel@lists.freedesktop.org, Max Filippov <jcmvbkbc@gmail.com>, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, sparclinux@vger.kernel.org, intel-wired-lan@lists.osuosl.org, linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/23/2024 3:45 AM, Geert Uytterhoeven wrote:
> in drivers/net/ethernet/intel/ice/ice_base.c
> 
> powerpc-gcc5/ppc32_allmodconfig
> in drivers/net/ethernet/intel/ice/ice_nvm.c
> 
> aarcharm64-gcc5/arm64-allmodconfig
> powerpc-gcc5/ppc32_allmodconfig
> powerpc-gcc5/powerpc-allmodconfig
> powerpc-gcc5/ppc64le_allmodconfig
> 
> in drivers/net/ethernet/intel/ice/ice_common.c
> 
> arm64-gcc5/arm64-allmodconfig
> powerpc-gcc5/ppc32_allmodconfig
> 
> in drivers/net/ethernet/intel/i40e/i40e_dcb.c
> 
> powerpc-gcc5/powerpc-allmodconfig
> powerpc-gcc5/ppc32_allmodconfig
> powerpc-gcc5/ppc64_book3e_allmodconfig
> 
> 
> arm64-gcc5/arm64-allmodconfig
> powerpc-gcc5/powerpc-all{mod,yes}config
> powerpc-gcc5/ppc{32,64le,64_book3e}_allmodconfig
> 

Fixes for intel/i40e and intel/ice posted here:
https://lore.kernel.org/lkml/20240206022906.2194214-1-jesse.brandeburg@intel.com/



