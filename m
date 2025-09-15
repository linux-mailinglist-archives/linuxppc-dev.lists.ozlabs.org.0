Return-Path: <linuxppc-dev+bounces-12233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C60DB57FF0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 17:08:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQT1S4D7zz3dWJ;
	Tue, 16 Sep 2025 01:08:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757948892;
	cv=fail; b=jHxn8xU/uduu6lKs3eq4DJUE72yfWk8Tks2d/i7Nypv+t736/LPnZ9W9T1rjjYRwgDj+W8QJcLgcjuiiGVmC8VOstTlZ/xNJZEGBby9Rtg8gjkIdtN0fVsoCtsoLbDZNgCHwuCOe3ep486sZIAoLkgLMD0waEBf42NexRQRYJGdq3LZFhRjXC8ssCXXJbQ6UZR4bpOEoxyrA3/P092Wg72gvLvny+ob/IKhpdSjZapx4g+mUfMO4zJnkt+ijWYgg7OrVSxS6uSz4IbdxrvLe6xF1lIvTk52wa4TmEkh8c6po4NsW+cmkV2cEOKrxx/1779ikxkTbqUSGvRgFQ+nm4A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757948892; c=relaxed/relaxed;
	bh=jOSyjk0WZ/AkbBPONf9wVDpCQcaIcL1Ltj3U3Lk44TQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LxO5r0iGkJYydRiTW+AoQp8ExQxYSm2Ar/I14oZO+37lXnWAXX3VzXrgbJqhV0CbG/V7hctd3Q0Irg6C8XKWcg5JfBiYWolRsVK6Rq9foav3PO1+Glvi5UaO6E7gZSo6hqZVgilu9Sp7as83Ea+ir1sP0ypdVrhFLY4jhFQ2iv2QzJFOg/5rb1nTwZTUshPOa6d3XsqlkSlAvKFAjAv8GMRf5i7sC/efmzBU8bahmNLaaG3SMa11o3brLzJtyobGAl9yQD6M0Z8z7WC++N+D4C7BqiYwf0PTyqqjCgdAJQ2bQFthzVkDkuAfkF+rMVUSxQWtRsqraaqOE6U2dP7xZg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VnE5LSb3; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VnE5LSb3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQT1Q11ZQz3dSW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 01:08:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757948891; x=1789484891;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d8dcnpvicytr2bpKdCNA1RIwDAK7VGr9SSmdaWiGKk8=;
  b=VnE5LSb3PXp4wSdF40dyPpWAOX6nMt+XUVS5o1sHEDmRdb6k7lvGDcxS
   XIRY8hwTLPmJLsUM5H5IiHdwqEujFRKglTKRNzUoqFcxUs8OPMDxsmYzD
   3B+iZXq1HdjsmbJPkGz78roWx1eac4OerOuxgsfTkbAvXaKJbCDu2p2UU
   1u3xNrhLiNUfqJhaZ7cZMnFW3v/a6HMmIEejyqTVi6V53lXIbBUXHHBb4
   Lga7AclnFWgou1Psan8h4XZobx/wl+o3mJZ5y1m/9p/tcq/GVhv3BaPfD
   0tu+ymcfvCUz5Dzc8BH9ssnWndwrygdeFhXJLN7Kk2FoH4JpBZuTmNA44
   Q==;
X-CSE-ConnectionGUID: KchJLq/wQ4aFOSua77qhtg==
X-CSE-MsgGUID: iRNQx3DGTmSsPjkgKbajGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="71304408"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="71304408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:08:05 -0700
X-CSE-ConnectionGUID: GMwBQ60QTq6FQ3ArktI/4A==
X-CSE-MsgGUID: KmqO0+ZHSiy1XuG0i/HfQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="179034570"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:08:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:08:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 08:08:04 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:08:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9H6jXaYkjlZci0zEJQWsosEjWCzrW8m5J1FB7ynerSawGD2VsUhxa0b6IXYuie4NAVFolSs0IVxfyZ8Ly+Y4LpdeATPTwUGTnVlGRwG2nqxOIV9T0bdOwIDN79mppr5c+6zfj7GLKKuMeWhsm1qekpUmSAVu7PP1YJ72XJaX5AcKJDGBe3fCHrU/9L6EnI5LpAVo5/GUxaHqVrLYHNbtF9BKO19z3JUxZ4cd/l5JKXaweq6liQDGL9gmgagvvrW/TExLcDxI7117DdJqYOg2NGcKTw9+2YORlCXmD3CX1EUiz5+fDI3EsViv9Y++mr+LaDrorNhMQfCQ3hyL+NcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOSyjk0WZ/AkbBPONf9wVDpCQcaIcL1Ltj3U3Lk44TQ=;
 b=GOn1mswtg/yLvV1puEw8+aG5ZWvGTSvcMQTf1WAwLyES64VUQWkM6aeZC3n5ekYFIv0XMXffnPo9ne3Xly9jRDdQ/ySEdxAOHEeY0a8KzY9YWFSrCjt9xApirfqSx0VvXCH1MhRJkg8eziC3pXY2t45rctoYeX/GlvorYiY0+P74ssAZeI9SENt4bwV5fY/hmSCWlTwxlsF+IOYq5CGF0Ho9vC1tJyS+PsCcTV4RVLtc4mACjWH8i+2IPvJrto5UjRMEnGRaQrq+bV0SYEtkTDtHgbRFROu9ag8I+Jx8l7kHLvel+/YC5cdcFj+MveNIdcYmn5VAfTuQsM7LIhAzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPF75D68BA1B.namprd11.prod.outlook.com (2603:10b6:f:fc02::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 15:08:01 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 15:08:01 +0000
Message-ID: <bd19b37e-6dfb-495a-bc05-47a347962515@intel.com>
Date: Mon, 15 Sep 2025 18:07:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/6] tools/perf: Add basic CONFIG_AUXTRACE support for
 VPA pmu on powerpc
To: Athira Rajeev <atrajeev@linux.ibm.com>, <acme@kernel.org>,
	<jolsa@kernel.org>, <maddy@linux.ibm.com>, <irogers@google.com>,
	<namhyung@kernel.org>, <linux-perf-users@vger.kernel.org>
CC: <linuxppc-dev@lists.ozlabs.org>, <aboorvad@linux.ibm.com>,
	<sshegde@linux.ibm.com>, <hbathini@linux.vnet.ibm.com>,
	<Aditya.Bodkhe1@ibm.com>, <venkat88@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
 <20250915072754.99850-2-atrajeev@linux.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250915072754.99850-2-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::17) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPF75D68BA1B:EE_
X-MS-Office365-Filtering-Correlation-Id: 3585e82f-4f21-4c98-0859-08ddf469a950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUlSVjZKcFBpdGg2Zk1zZWxITnFpUXZ6ZmRBYnhzMzB4NXRmM2tES05meEor?=
 =?utf-8?B?NlBBbmVTMUlpY3paU0ZPZStLMVByT0QvVFAvY2JmM0hHR3Q0ZGpuVnU5RThQ?=
 =?utf-8?B?cUhmbUJHN2c5bDd5UXVUUDZrekJ4Lzh4bVd3eEdOMDFFcTg0UEN2U25laENa?=
 =?utf-8?B?dUdtdnM5L21USFkxYnkyVyttZFJ2aWVuRERpU2ZKYmcveWlWem5YRGVYZyta?=
 =?utf-8?B?VWtFTjB4VFRrVE02Um5jOWJrTUVRS3NDbU05WjRGVnZ4dU1ydUN6M1JjclRE?=
 =?utf-8?B?UzdhdFpSQ0t0WFFLVEN4dSt2OXIrRVpUYXdrd2FTQm5vQk9JZUxKVkhsUnpY?=
 =?utf-8?B?YjdyUEwvazd1TE1abFkrMXZvVVpjT21QbUFBM0U5cnJOM0ZXSHlNOUl2OEYy?=
 =?utf-8?B?UWszSjZ6ZVJCSVRBZDNNZVNhQmE5RUJNbko5UjVObkNzVUJzaGZzRVZGUVRp?=
 =?utf-8?B?R2xVSXNyQ2E3VlNRc3NBeEJUeDFCN293WUpDcEljL3Q1SWFOOUpiRGU0QlRa?=
 =?utf-8?B?emw0azIzYU9ETGE5QTJHU09xUU5DNEhOZ2FHQk8yUWhkODdmSm1WWXVsVDNZ?=
 =?utf-8?B?QkRLVVlpY202Rmo1V2lIdDE4aUYycys1aG9wNnVrZmx2d28zcWJXc1RaUXZs?=
 =?utf-8?B?NXpHQmZSd2tDZzRxREEybXp6NjV0TDZvb04rMTAvZ25CT2t3aTV4S3FHRmNT?=
 =?utf-8?B?TWFIUkhUVjhtRzRja3lrb2NzbjNlMGkvMEdaT3FHYXFYWVp4L28rZmlkckNO?=
 =?utf-8?B?OVpOYm4xNXpvdWdtSGRZU3Y2RFdxTnhRVGVUMTNIdU0zd2VCaVd1SmY3eDNv?=
 =?utf-8?B?Zm9pWEE4NU8ySkNSblFHN0ZDRG0vd2JlVEpDZFozb1MvYStqUU9JZ294U1dl?=
 =?utf-8?B?dmNqM2oxUmlVdzZXMTNKNm9Od3UrbzZHaVFtZVRadHNjZTE0dWR0S1NDMFBk?=
 =?utf-8?B?aUczc2FEa3lpSnR5bE9oSGJqOFZIdzRWVmZNbDFXdW1pVThwa3BxYUxENlNo?=
 =?utf-8?B?T054dlkzd3Y3ZFdIMU9UYVduUjVVQXpoMk9xTDlzQ2dxT0VMdXphbzhtSy9v?=
 =?utf-8?B?dVRNK1JEOTR2YS95TTVwQ0tTQ0g3c28wVS81SkR1MzVSbUpFb2t1RDVBSXhE?=
 =?utf-8?B?aXUxLzlrODd1NXczUllrZHRWYXA0QjYzRS9rd2hNV1NLeFhLLzY2ZndKaE9P?=
 =?utf-8?B?YXJIODFDckEya21ydDFEZjRiSU50K3pTWEY5VnBNR1k5N3FxWnRlZUxKeDV5?=
 =?utf-8?B?UHpFa3MyN0Q3dmdqSDdTSEQ2Tmwzb25mcWxUM3BMV2hpdTJYMVVtYTAwU25z?=
 =?utf-8?B?R2x4TERNN2FsR3VNampjT2N6bkxPWFp5WGhvc1kxUHRWUzFaV0p4cFJTLzNn?=
 =?utf-8?B?alhOT3ZiT01ZaHZDKzFXOGR1YUNVTEgwYnVFN2wzdVE3UnZSaU14YzRTc1RK?=
 =?utf-8?B?WXJlclVNZjJXcGIrb0puUWUrSS90Wi8vZGRSMzE5cUFsM2xPSW84WjNlc2RF?=
 =?utf-8?B?TEVTMkZaY2tWSmlPaU83Y1B1aWgwNEdoSGF4akZmNjhaanhnbysrb3VPNnBW?=
 =?utf-8?B?bHRVRng5WTI0VDA4ZjlOZitjSFpIenorUGUxQTRqbjlsZTRnUytxb1Y4YXpO?=
 =?utf-8?B?ZEN0amtLQ3Z4L0tWQWlVMDFKdzIwUkdrYzFsd0hNdjVWd0o2elJEYU1XV1ZY?=
 =?utf-8?B?Y1p5UkhCZ3RTamhTbUU3WkhpWkVxRjU0R3kxMXgwUXVCVEM5WWhUZTYwWXVo?=
 =?utf-8?B?WGpPQ3U1SVErUkdFemZka0MrU0xWUWtZak83YTM2ZFFleW1ndGJJSXE0Z2lK?=
 =?utf-8?B?Zkd4QStLQldVM1NlQmd6U0pZNGg5czQ0MFFSVnJUKzV1aitqR1V4N3lNbzds?=
 =?utf-8?B?UFpUQ2pia1pIV0RDTmovdkxsNEVhMHh6akRNOVJicnVtRlRpYThMSUFUSlQv?=
 =?utf-8?Q?6bFedkKXQiA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vy9wNHg5MU83MXdmVGlQaFFXMXFJMTVaZ2dNdVdFaEM3aCtxUzZqcnhNYzJS?=
 =?utf-8?B?dEFmUklrb2UxNWNFUGdkc1NndWFlOWc1VDVXVzRnRU54NkFWZzFhZmVkNTJ3?=
 =?utf-8?B?WngwS0RiQUZFZ3JBY2c2OHAwaCt2RU00RHc3SXRjdUcxZ2JMSjRpREsxNUho?=
 =?utf-8?B?UzFxOU1MWHRGYlpzb2M2ekZZOTZ2VXlsQ1EzVWVQSkk3V2hmMC9jcGZnYjhQ?=
 =?utf-8?B?aE9ZWE9hQjRGQW14R0lqbUwwZmJ3Sk9kQ05zMHVVaTEzZnVBVEdRRjBDeG5l?=
 =?utf-8?B?WkgyczRJTmQ5RW1PeEhEVTUvMHFKc1FMZ2QrWGM4b2dmTFdwT09yOVd1N0E1?=
 =?utf-8?B?NERBc3VPY0paUWNhY1dtc0ZBay84SmpFWlJvTUxISWJXeWozRjBYT1dSVGhF?=
 =?utf-8?B?UkdwYzVkNldRT3dhajAyRFZEOVkrdEsyY1FUUUg3SEJHdTF2RHZnTVc0dUxj?=
 =?utf-8?B?UC80Qm0xUkxzdXEyaHdPRVN2ajA3cExqRHBmK3Y4aW9TSE9GSGh2UXFNT25O?=
 =?utf-8?B?L0pHaGRWNU5hK1JaSXpDNjdtVGVMaTJsWUgwdS9mcE5FeUNGb0U5Ti84eUov?=
 =?utf-8?B?ME55U1NueGxPY3hsdHZlSGhIMmhYSUMvbXR2UWRwSU5RY1NRQ0k4dTNxQWNI?=
 =?utf-8?B?Z00zLyt5a1FhVTBHRzdUNDNkVlY3Ujcwcm8wQW9UbkZ1WFdFVHJSM2dNdSt1?=
 =?utf-8?B?QTdwNWZKVEE3a2QvbHk0MWhCRXhGemUzNC9tcDJyaDJWa0tteEtIUFZJa0lR?=
 =?utf-8?B?ZzNvODZBc3Y2SkNtNGdzaEk5ZjZoMVBveHBYY29HanJPTkRYb0Z3T3JDRlRB?=
 =?utf-8?B?aFU1dDVXVDQydnc0LzhJLzJJdmRyY2pISEl5UmhGc3BPTUpsUUVwbFJEWWQz?=
 =?utf-8?B?cmtob2M5TUhIVXg0MURzamt6QnNBa3FTUDJkSGh0R1FaQVFFZVZXblFIeGVo?=
 =?utf-8?B?b1ZNSzdWWGFTTThRQXNzbzBhWHhSa1JEc09jc1N0c2lPUFR5blRvWTMraFQy?=
 =?utf-8?B?Qm45Sk92MG10R3BPQzdaRmVzcnljWitNN2RITDRLN2lVK3BSVW1kc3YvN2FM?=
 =?utf-8?B?eWJ1WXd6dUZNYzlYdW1qNmYwcUdjNnJGR1hOZ0c2eEhUUWRINWJrV2pUTkNU?=
 =?utf-8?B?QkdNN3VxYVVCWk1pc2dUUStIVzFWRENRMG1acXMyV2c1SG1CRCtYdmtUMUxP?=
 =?utf-8?B?NXprekRPTmJoK2JzVnd1TVBMclRsdkNMN2gxdzgzZ05XR0pPYTZXcTZEOUp3?=
 =?utf-8?B?N2hjNnNWVm5Qa1hIdGFpY3U1VVIvZFozYjczM0FCWXJCOWZ0N2Q5NWgvMXFW?=
 =?utf-8?B?TVluL2t1UkFwcW4yUndCRk5GSmZhUWFMR0IrY2N3U3U0MTF2NThEa3NOQUdy?=
 =?utf-8?B?ZVdxQUs1NCtHVGZYK1RIN09OYmZZckttaDgrdy9TMnFob2xUSEczcXZ6Vnl5?=
 =?utf-8?B?L2haNWtsaUNJMCtpOHYvSGt4RlpqU3A0Qk91V0J2NFEwS0VMdzBEVzJSajl0?=
 =?utf-8?B?Ky9pQy8zeGtTS0Q5SFIzNUNQN3NKK2Zockx1YTFDeDE2UUorWGZNWDJrUTU5?=
 =?utf-8?B?WjlGZnNReWVtSU8vQzJKMmZka1dpYWlWanZYTVpPRnZoakx6eFRibVhyUWZx?=
 =?utf-8?B?dkJTczhRMnJ1TTNvZlpTeVZuenQ3R255ZGw4RTMxaXdrc0VRVXVvOFVUS0Rw?=
 =?utf-8?B?R1lvU05XZG9mUVMyZmExaDlqalN4ekp3djROc012NlZSSm1iRllxbk1VaGRv?=
 =?utf-8?B?WGlMU0FWMVkzRnF4eGlML3F2Yk10WXgvWmE2d1FHaFp5T0o4eDVnQkRUdWVF?=
 =?utf-8?B?THpiZXN3RTU3SXVHVGVNVmFzbmp3aHRNd2s4VmRHbWxRRkpNKzg3TGJ0b1FR?=
 =?utf-8?B?ODNOOUFPcUtlV1RERklwWUlrcERSaEg0RU9FZzRtZkNTbkRXci9NWWcvN2lF?=
 =?utf-8?B?Z3BjcytNd3dvSEl5SHI4aU55b0VVT2Y1V2NLTFVjRVFFMHpyS1YzeFBmb244?=
 =?utf-8?B?NzNoaHdGTnB1em1Mc2YxcHVPN2gxTHR2Ylg2emt1WUhKcDRWTG1BbWt2aW5U?=
 =?utf-8?B?cVNvTXA4T2ZFb3RoM0RDRlkyRlBFMi9yUzl2TDhqS2wvZ3c3L3hrS3JQak1N?=
 =?utf-8?B?OWwxbkJ1eDBLQVlDTE1sdWdHMXZsZ3hTQUo1Ry95UEhweS8xNVdFckw0V2dS?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3585e82f-4f21-4c98-0859-08ddf469a950
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 15:08:00.9512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHVdqJkLL3NgVLGRFEwpn/l7XVivbEIq02hbXoWkEjAn5bdknKkRPaI7RoUneYxhpCM5PU6s5ucwhaGlpCjkLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF75D68BA1B
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/09/2025 10:27, Athira Rajeev wrote:
> The powerpc PMU collecting Dispatch Trace Log (DTL) entries makes use of
> AUX support in perf infrastructure. The PMU driver has the functionality
> to collect trace entries in the aux buffer. On the tools side, this data
> is made available as PERF_RECORD_AUXTRACE records. This record is
> generated by "perf record" command. To enable the creation of
> PERF_RECORD_AUXTRACE, add functions to initialize auxtrace records ie
> "auxtrace_record__init()". Fill in fields for other callbacks like
> info_priv_size, info_fill, free, recording options etc. Define
> auxtrace_type as PERF_AUXTRACE_VPA_DTL. Add header file to define vpa
> dtl pmu specific details.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
> Changelog:
> Addressed review comments from Adrian:
> - Return VPADTL_AUXTRACE_PRIV_SIZE in powerpc_vpadtl_info_priv_size
> - Remove unused powerpc_vpadtl_parse_snapshot_options
> - Some of the function parameters had "__maybe_unused", corrected it.
> - Used PERF_AUXTRACE_VPA_DTL instead of PERF_AUXTRACE_VPA_PMU
> - Moved powerpc_vpadtl_process_auxtrace_info to next patch
> 
>  tools/perf/arch/powerpc/util/Build      |   1 +
>  tools/perf/arch/powerpc/util/auxtrace.c | 114 ++++++++++++++++++++++++
>  tools/perf/util/auxtrace.c              |   1 +
>  tools/perf/util/auxtrace.h              |   1 +
>  tools/perf/util/powerpc-vpadtl.h        |  18 ++++
>  5 files changed, 135 insertions(+)
>  create mode 100644 tools/perf/arch/powerpc/util/auxtrace.c
>  create mode 100644 tools/perf/util/powerpc-vpadtl.h
> 
> diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
> index fdd6a77a3432..a5b0babd307e 100644
> --- a/tools/perf/arch/powerpc/util/Build
> +++ b/tools/perf/arch/powerpc/util/Build
> @@ -10,3 +10,4 @@ perf-util-$(CONFIG_LIBDW) += skip-callchain-idx.o
>  
>  perf-util-$(CONFIG_LIBUNWIND) += unwind-libunwind.o
>  perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
> +perf-util-$(CONFIG_AUXTRACE) += auxtrace.o
> diff --git a/tools/perf/arch/powerpc/util/auxtrace.c b/tools/perf/arch/powerpc/util/auxtrace.c
> new file mode 100644
> index 000000000000..803c582c0c6f
> --- /dev/null
> +++ b/tools/perf/arch/powerpc/util/auxtrace.c
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * VPA support
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/bitops.h>
> +#include <linux/log2.h>

Are bitops.h and log2.h needed?

> +#include <linux/string.h>
> +#include <time.h>
> +
> +#include "../../util/cpumap.h"

Is cpumap.h needed?

> +#include "../../util/evsel.h"
> +#include "../../util/evlist.h"
> +#include "../../util/session.h"
> +#include "../../util/util.h"
> +#include "../../util/pmu.h"

Is pmu.h needed?

> +#include "../../util/debug.h"
> +#include "../../util/auxtrace.h"
> +#include "../../util/powerpc-vpadtl.h"
> +#include "../../util/record.h"
> +#include <internal/lib.h> // page_size
> +
> +#define KiB(x) ((x) * 1024)
> +
> +static int
> +powerpc_vpadtl_recording_options(struct auxtrace_record *ar __maybe_unused,
> +			struct evlist *evlist __maybe_unused,
> +			struct record_opts *opts)
> +{
> +	opts->full_auxtrace = true;
> +
> +	/*
> +	 * Set auxtrace_mmap_pages to minimum
> +	 * two pages
> +	 */
> +	if (!opts->auxtrace_mmap_pages) {
> +		opts->auxtrace_mmap_pages = KiB(128) / page_size;
> +		if (opts->mmap_pages == UINT_MAX)
> +			opts->mmap_pages = KiB(256) / page_size;
> +	}
> +
> +	return 0;
> +}
> +
> +static size_t powerpc_vpadtl_info_priv_size(struct auxtrace_record *itr __maybe_unused,
> +					struct evlist *evlist __maybe_unused)
> +{
> +	return VPADTL_AUXTRACE_PRIV_SIZE;
> +}
> +
> +static int
> +powerpc_vpadtl_info_fill(struct auxtrace_record *itr __maybe_unused,
> +		struct perf_session *session __maybe_unused,
> +		struct perf_record_auxtrace_info *auxtrace_info,
> +		size_t priv_size __maybe_unused)
> +{
> +	auxtrace_info->type = PERF_AUXTRACE_VPA_DTL;
> +
> +	return 0;
> +}
> +
> +static void powerpc_vpadtl_free(struct auxtrace_record *itr)
> +{
> +	free(itr);
> +}
> +
> +static u64 powerpc_vpadtl_reference(struct auxtrace_record *itr __maybe_unused)
> +{
> +	return 0;
> +}
> +
> +struct auxtrace_record *auxtrace_record__init(struct evlist *evlist,
> +						int *err)
> +{
> +	struct auxtrace_record *aux;
> +	struct evsel *pos;
> +	char *pmu_name;
> +	int found = 0;
> +
> +	evlist__for_each_entry(evlist, pos) {
> +		pmu_name = strdup(pos->name);
> +		pmu_name = strtok(pmu_name, "/");
> +		if (strstarts(pmu_name, "vpa_dtl")) {

pmu_name is leaked, but maybe it is not needed at all e.g.

		if (strstarts(pos->name, "vpa_dtl")) {

> +			found = 1;
> +			pos->needs_auxtrace_mmap = true;
> +			break;
> +		}
> +	}
> +
> +	if (!found)
> +		return NULL;
> +
> +	/*
> +	 * To obtain the auxtrace buffer file descriptor, the auxtrace event
> +	 * must come first.
> +	 */
> +	evlist__to_front(pos->evlist, pos);
> +
> +	aux = zalloc(sizeof(*aux));
> +	if (aux == NULL) {
> +		pr_debug("aux record is NULL\n");
> +		*err = -ENOMEM;
> +		return NULL;
> +	}
> +
> +	aux->recording_options = powerpc_vpadtl_recording_options;
> +	aux->info_priv_size = powerpc_vpadtl_info_priv_size;
> +	aux->info_fill = powerpc_vpadtl_info_fill;
> +	aux->free = powerpc_vpadtl_free;
> +	aux->reference = powerpc_vpadtl_reference;
> +	return aux;
> +}
> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
> index ebd32f1b8f12..f294658bb948 100644
> --- a/tools/perf/util/auxtrace.c
> +++ b/tools/perf/util/auxtrace.c
> @@ -1393,6 +1393,7 @@ int perf_event__process_auxtrace_info(struct perf_session *session,
>  	case PERF_AUXTRACE_HISI_PTT:
>  		err = hisi_ptt_process_auxtrace_info(event, session);
>  		break;
> +	case PERF_AUXTRACE_VPA_DTL:
>  	case PERF_AUXTRACE_UNKNOWN:
>  	default:
>  		return -EINVAL;
> diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
> index f001cbb68f8e..e0a5b39fed12 100644
> --- a/tools/perf/util/auxtrace.h
> +++ b/tools/perf/util/auxtrace.h
> @@ -50,6 +50,7 @@ enum auxtrace_type {
>  	PERF_AUXTRACE_ARM_SPE,
>  	PERF_AUXTRACE_S390_CPUMSF,
>  	PERF_AUXTRACE_HISI_PTT,
> +	PERF_AUXTRACE_VPA_DTL,
>  };
>  
>  enum itrace_period_type {
> diff --git a/tools/perf/util/powerpc-vpadtl.h b/tools/perf/util/powerpc-vpadtl.h
> new file mode 100644
> index 000000000000..50a7aa24acbe
> --- /dev/null
> +++ b/tools/perf/util/powerpc-vpadtl.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * VPA DTL PMU Support
> + */
> +
> +#ifndef INCLUDE__PERF_POWERPC_VPADTL_H__
> +#define INCLUDE__PERF_POWERPC_VPADTL_H__
> +
> +#define POWERPC_VPADTL_NAME "powerpc_vpadtl_"

Never used

> +
> +enum {
> +	POWERPC_VPADTL_TYPE,
> +	VPADTL_AUXTRACE_PRIV_MAX,
> +};
> +
> +#define VPADTL_AUXTRACE_PRIV_SIZE (VPADTL_AUXTRACE_PRIV_MAX * sizeof(u64))
> +
> +#endif


