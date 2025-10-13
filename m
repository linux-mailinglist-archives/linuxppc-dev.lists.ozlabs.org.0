Return-Path: <linuxppc-dev+bounces-12799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2095BD4489
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 17:33:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clhG83SZKz30P3;
	Tue, 14 Oct 2025 02:33:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760369632;
	cv=fail; b=F29C3sM1Wv4Q+uOc171dwyzWHtDOgTcoshPSrep+RCHTNNWjK5/uyWiNoLKAMzAQwkTXtHa09Kd1HE5rvGNRd7cV6mFxwsfLXNcUBuhs3iI6d5l+hiI03uaQAIQcsvIcc0y6i+Ap24te53P1if2qIEGmrx0ZOQWC9DQwI/q3IFJdGzHaL5rXRTV/s/QK2x6SraFmVVc67pMpSa5SDhhv/3yhlD8IxdBetlBk40aDmJFnzvOePCL3xTqtB0qeLj+EQAeAPlKiKywVQAoBbbE4OCkAJ9094eEy06JWSXO5IQjfW9zVjpm6dDB1lxQi8f4GkazI6miSx+EYIaMGUtXpXg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760369632; c=relaxed/relaxed;
	bh=bsD4RwPNWkHMoWWRF8FxTmsh37GyWqXh9sQ5BLDlZ3s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T1/GftXZ5kwweHFsfqJSDnsdNnV/VdXv6UVfbzuJjNxDmiubmBxDntHUHbtFQOnhpHmU9A2NAn5rJeL6Xn9+bRaY4TI1MigtZxHCQz7OOtNp7vIZoer7c+C/l/O7gH2mRVYrqpX7bowAmZorhr6Jr8G+lTBdKT0zabGoA9xIMrq1cFyzWjpfUuxlaSx0AM7qIboNme6jLVOW2WDNfHo6IKS9O4l5U/ywwCF7ju9HRxx+YS9grgdwClgY7O8JkV34pSiZR5C3oSP2rcUZdp2gOmlIZlo5YaZY2Dgcx1LfVFzxZhniz3Pyqcnpy92GRrxIz5afQuAdMBgdWLfzLDYumw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ygu59sOB; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=aleksander.lobakin@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ygu59sOB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=aleksander.lobakin@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 14 Oct 2025 02:33:49 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clhG55mZ3z302l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 02:33:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760369630; x=1791905630;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3GuucUsEcLDopz7jG6WnOV+eFmtz2XFmDCzHmi0nexw=;
  b=Ygu59sOBQ8ZyOvg2oxtGRyLCu+iLfuK7Am4HjMRqKKhu+lXnh3KRgQOk
   Qo+HZIg6HtEOdiVQIYnOTZXJ/DDnVI4p8gaN8/Wav1E/H7K6KMQTT+CL4
   YQeR3U35HIUY0mv4ZUQN/EgSOz9R4o7wCs2+lF7FvOZPLHnq8Wn6av8oh
   lkX3wE+jAjVqnanH6x9nyG4Fsxf9Lxjw0PwMEK6KkOoms1bYVBN2/NiuH
   baN5+ZFNyM5TgDlcc8LtRlMLE1CHUtEJ5C98PyMbRkcv6a+3/x0xvCxrH
   omOu6aIeiWwdghd1nXDONtr3h/JnHzcZvZqnoQTpHBqvJqopDuQXumGHN
   w==;
X-CSE-ConnectionGUID: FWldLiU+RU+IGpwewACiag==
X-CSE-MsgGUID: MBLLRnovS7GaujuXZHV4dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="79952836"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="79952836"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 08:32:41 -0700
X-CSE-ConnectionGUID: jI/A51MPS16PeEitG0tZEw==
X-CSE-MsgGUID: D5i9UJ1SRWOPKzQ3jP8kmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="218745822"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 08:32:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 08:32:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 08:32:40 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 08:32:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lg61hjLZAioYzsoF2A7WXpglUQRbRn3A7BI/wsIVJ0CCzE+Tio6zptgXpFBP2eqB0T4Cu5zLB3ywV/SXNbkQ/gteHTcyjC/Hi+H+Cak4o6hBpnfZ+ZlpIAdN41BSPk9HkjBASJJ1tElwwl8PLkjdH3nyWB8zWlGV2Xtu+WSUK/IA6EvVAbfxw96Moe3oLmTnrCBAXZxwiaWlZruYgWdILos702j/Enqr0TDhw4pQobsou7fB1v64vpO9dQowBBk8jW8+6m7eVMjh8Y30QToIl8IVONZ0u7wMSptFmOK5BXMGnvl09PZOV+icRUHK4PvEQN8AL2Gu+m4kBFPE+P8JsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsD4RwPNWkHMoWWRF8FxTmsh37GyWqXh9sQ5BLDlZ3s=;
 b=kVBjfJ/bo0olNmaPopcBNfdzM56ZvVrLOeQBh5UPImE4P9jux5BFIi/2gKpauCmSXbEEBGBgQ+yRWylexc7s1XoV/OToWv1JeMlr2vMSU7dBfDkEZ/KpPraR850pPQ5Pb7JFaaGeJIWD4TN1YKT19YANKZFmWmICUWXdBGZnLhEO74FPy3F3PC+h99BEaD2H+C7fNHFdE42GxKgCnQcu0PpTtHIIZZ33ZrJMX1Gia6jtvJC0Sa48T0CjA/brWlztZ3egYZRnT5Rw1cJsIQxeuSXsvPSjsvr4QlqOOTrP/scd5p108oifClGnwuenej9si3EDpAeVkdaolM4dYEMy2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA2PR11MB4971.namprd11.prod.outlook.com (2603:10b6:806:118::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 15:32:38 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 15:32:38 +0000
Message-ID: <75df59a5-56d1-4938-919d-b9e9e2f81251@intel.com>
Date: Mon, 13 Oct 2025 17:32:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next20250912] Build warnings at
 drivers/net/ethernet/intel/idpf/xdp.c:6
To: Venkat <venkat88@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>, Stephen Rothwell
	<sfr@canb.auug.org.au>, <michal.kubiak@intel.com>, <ramu.r@intel.com>,
	<anthony.l.nguyen@intel.com>, LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
References: <22ac36cb-1ba5-429b-85e0-4e3f2da1f87f@linux.ibm.com>
 <440ef1ad-6690-48e9-be02-1ccd69f6623e@intel.com>
 <3BDEECFD-5267-4453-B45B-07D3A1545D75@linux.ibm.com>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <3BDEECFD-5267-4453-B45B-07D3A1545D75@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0005.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::15) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|SA2PR11MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: 800c8ffb-d764-48c5-20f0-08de0a6dbd6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDdpT1lEcFhDeFJROVo2UXA2dUJHZFkvNFdYOElKTGMxNGxIVFcxeENUUnpE?=
 =?utf-8?B?eSs1Q2FDTThMTHJnbTJ4ZFZwMVhVcndOMmU1RVZsTUxLejUwa3Vmb3BUaFha?=
 =?utf-8?B?eWg2eGZRenV3NkkrbUIzUitseFBIZTUvc0luOWhMYTFTTlMxMHNlUis3OW0v?=
 =?utf-8?B?dWdDcms1aHo5TTJlc3orbnJ3ZnBYN0IyRkJhbnluaTJkc3NobFBkVUFUUE1R?=
 =?utf-8?B?SmlHL2RzWnY3K3dpWDJLVDBKYVMyWVhhZjA4VTd0Uzk4UlpBdHprdys5NDZE?=
 =?utf-8?B?d0lOZVNkTFc1NHVkZS9NVGZDQWtmNlh4eU1ITWtqNHBuWVhuY3ZvM0tUSkd1?=
 =?utf-8?B?QStPbE9YZmJoUGloSkRDY0VDMVF6bjQ5M0luT0FYd0oyclF6UkZrWThvaVZk?=
 =?utf-8?B?c2N6N1FZalZRRDdzTDF6T05JdDVweFBPMUp0OWN6Wm80Tld2RVFVUjNQVE9i?=
 =?utf-8?B?TFZnZlhBZzlXeWJydnBHdFRGV3VzS2prWUM3RGc4aTkzUGJCd081SUtjWjVt?=
 =?utf-8?B?c0lNalhSUGw2OTNTZjI1ZmwrbU5MRUF4UWVnQ1BiSkNMd1N1UUhBVGhKTmRn?=
 =?utf-8?B?V2VrUXdLMnplR3NWUUtPcDJJRSt4TUFYR0hZbVh1T0p3Rkd3RThJdzAxaFJr?=
 =?utf-8?B?Ti9ZNkQzODhmb0hGb0w5WWJvSldBQ2orSmdiUFhqeThHV2VsNW1pTXBNNGFn?=
 =?utf-8?B?NjEzQ096RGF3eHREeUFXeGRqcERlZnRHUnhTR2o3MHA4RjJIellUYlgzTVd1?=
 =?utf-8?B?RW5RRVVoekwwTzBGSmlydThHYnpxMmduemc2bUJtR01BZCtUMHZPeHdKS205?=
 =?utf-8?B?dnZ1aTF0bE1mMVF6V2VKcnFiWkVsakhCdTZzb0NUenF4MGJUbnpKbmFaVkFB?=
 =?utf-8?B?NW5wYXdMOEJWWjdKanBReGJrZ25PR3NXSHN6aCtIREM5ZVBpdHRQaW9xM2Y5?=
 =?utf-8?B?UXJnQWgxMm9EV1EzZjdkTC9RRUpTa3FQTnRxRnRMaS9KQVFOQUFzOFhURWo2?=
 =?utf-8?B?VksrTEpJRE5zeFo0UllUNjFGSUpCRlpKeFAxWVd3MEVYUDVGTENReklCeHB0?=
 =?utf-8?B?dUlDdmJFK3ZDN0lyWjBtVHJObDNqbldncmVxT0dyREdHcVEyUHpDaXdIZHdn?=
 =?utf-8?B?aDNnY3piN0grWG1Sd0xtdjRGVC9abWhXaFJycFBiSHk1cVFVV3BQZm1sK1M3?=
 =?utf-8?B?cVNmUGkyanB2eWMvMFF6bGh4ZGdhQTJUYzFaWis5M1FIb3llVmNxUnBhbStE?=
 =?utf-8?B?SXNlN1BaallzWHVsNTRRaWdURFFDNGR6MEpVc0FPY3EreGFCKzB1bGRqcWFi?=
 =?utf-8?B?MXBlQlp4ME80N2l2Yi8wSER5VWptUEhqMi9QWTZvOWxvU3pVaGVsbGs5N2l0?=
 =?utf-8?B?UFZjSGtFRzl6cW5vWjdzZEFWdG95bFFUSk5ZYXUzUHdxaW84Y3ZFU3JsdTRx?=
 =?utf-8?B?RnZ4cThUWUF5Vys3SzRZK2c2Ym5Xc2lUWkExVGFvTElkd2FKNVdjSGczSFhQ?=
 =?utf-8?B?cEx5QWgvbFcrOFhMZXB0ZTNvdWpKSEJrNjQxWmFrcXJNVEZ3cEg3Tmx2ajZV?=
 =?utf-8?B?QWFXenQwM2FKWkdzUzE3RTJSbFFKNDJkMDVjTk1yWlJvSTNtbjRmTytLMzdo?=
 =?utf-8?B?TXEyZWdSVzBZUUVTeFlBRkFzTW54dUtmOUZDcVJOQk5kbEQwZG9LVk5CMkU2?=
 =?utf-8?B?ZndoL2MwQXZLRU9PYjE1Q1pWTDJhTzlsSS91Rlg0N0x2MVB0c2drUGQ2VVJW?=
 =?utf-8?B?UERPTyt5dzhoWFBFV2V1V1dyTGNMWUxzRjdjdlFWczBSa1pRTmxNWjBnMUVK?=
 =?utf-8?B?enNPbDFETm9zYTQ3eUJqT3ZsOWdYcjhTK1ZlR1dNbTNkdWRESFA4U0ZXQzVj?=
 =?utf-8?B?Z002U1hUSFQzZmI4ZVhBMkg4NGpWQnJxVEhad2lrR3VsMGtXbjB0Nm02RVlw?=
 =?utf-8?Q?rgghqGlnoWimEiHygPZsuMcd9c1eUtBf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NThYTEVVT1d6L05zOXkyT2x6VU5RdEw3Z2Jxb1RwQ0VDLytJQmpXcVM4UzNv?=
 =?utf-8?B?RnI5a2U3RDBlcFRsbzQ5UHE0K3R0R2l4YTZWdDFkZzNjdTdPNk13czlpSHU5?=
 =?utf-8?B?QzY4QTZ3WDN0anBxeEZsOFVZVUdhaFp1azNQY2s1elJ1bW8zWSt4RTZDOU9u?=
 =?utf-8?B?UU9NaXRxeTdzZEpJbjR2RHR2VXBtQVlpbE5QL1h3bDZIQWRDZnB3QnhVei9O?=
 =?utf-8?B?V2h6MG1zNGJLSmRIQTZod2ZrYzB4SExUclZNa1ZaWklQVXNpdXZ1clIySXJF?=
 =?utf-8?B?akd4RGpIai9EKzBFZVhlTEJ1ck9GcnZLYjYxbldIajNVVmRuak1jcTQ4dXhV?=
 =?utf-8?B?anBoNlpHcUV1dktvWWRYTTRGYVFwWEZoMXlObm5tbDNodEtFa0VZYWJ6RSs4?=
 =?utf-8?B?eVdHazI0aGx3emZnclh1aDRPMk05LzlLR0p1VWhlc1VOOGtZb2x6TFdyS0lr?=
 =?utf-8?B?QkF1VUZ2cXpEaWNTU0htUVJFVjFIdHo1VDhNZFFxRHlVTTRDcFNoTGtVa0NH?=
 =?utf-8?B?RU45V0F0K3JQUE1mREhhMWRxNmdpbUN0Zm9MMHlycVVjZitQdGlDZ2VNM3hz?=
 =?utf-8?B?a3BUb3l2YUl6dmg0REttWEtFT213cmZpSVBncDJJb3ZvdW9MS21zWHViSVlG?=
 =?utf-8?B?QkdTczFWQmlCVnRmL0RCcWs2Mzk0SVI5ZlUxeURoQlNjQnBDN0NhVEV1dks5?=
 =?utf-8?B?L2NudUwyck95QTE5L3hjKzR1c1l4d2x3dFM2QnVGOTh4c2JOeWRBSWIxZEJt?=
 =?utf-8?B?R0NPN3ExL1NyYXUvVEJ4Uy8rMkk1Yko2b3BaVDNibjgxTFc5RjVxUC9ma05y?=
 =?utf-8?B?bHQrNmZTdXBIeG55N252ejNraUkwQUZ4NFk1SUFBRy9ZYk9icXJJZkN4TStR?=
 =?utf-8?B?RWNEOG5NY3VuWTNDdEdNVkc0VUpPaHJWY044STBPR0o2MXpKQVRPQm82RzYw?=
 =?utf-8?B?cFBiZlY5d0d0M0FLZDFQRkR3SEk5MzhWT1JSQU05RzhrYlFQSFpqOFBwSjdS?=
 =?utf-8?B?c2RhTFZqQTd3dVJCeVlZamt0UmEyYlpUR3cwcit6aERKdVE5Q0FYVUhwbGFN?=
 =?utf-8?B?UHpjVEN0UXk4ZU9LRVNqbVJBbzNEd0pzTVByV1FtRS9UTStUMTl4NDVGeXly?=
 =?utf-8?B?aXRPYVRHZVRJZDc0Q1lQOG5xajFBMUVHQ3pnYWVDMWxOMHhuOFB4UjkzOEg2?=
 =?utf-8?B?ckdMT3lQRWpqNUV4RExsYlJLVHhmL2QxT2RXM3MwZ0llbUE0MG1MWmlpNnpi?=
 =?utf-8?B?blpzWUdGOFRSUmtNQWtnajMrSWo2UXFrN0NHTm1jc3R4dGlzUk9DTi9GbFAz?=
 =?utf-8?B?YUdWaGVkb3FTNnBtaVE4NDA3RFBpT1ZqSW8zQ2RlOVYzZlQ2Q3dmTVdjME01?=
 =?utf-8?B?dGhHVkd0RG9PbjNOMnQ4R1JOMDJVY1AvaFRRaERndlNBNzA2LzJKczVIaW40?=
 =?utf-8?B?RGdpS1V0NVB0MmRxQnZUSnNaZGtScEF2WEphN0tibTMzYy91OHpvRkdQci9x?=
 =?utf-8?B?OENFanQwTjZXcE1nSEh4MjFmd2tTYVRndnVIbWY5aWovMlBudXNBUmNHUURO?=
 =?utf-8?B?WUhvT21zdjRPdXNLV3NqOWdKSGlLZ3NXanljT1FoZDBtUW5WSFNabGt4czA1?=
 =?utf-8?B?S3NlU0pSa3gzc1QrMGFvTGNJVnlka3BiRVFkdjN0NkxwY3I2ZGNTNnRzdW1N?=
 =?utf-8?B?b0VWSjYrOGpzUU51UndRaFdCcnM0YWowcGJ3Si9OeGZEM1B4RHY1TngwYVJQ?=
 =?utf-8?B?bGdxUFhneDV5QmFIQTlJYmluODV4c0tENWx2TXo4TVpxazc2L04wR3B2cU0y?=
 =?utf-8?B?aUcySFJTSW8waHAwQ2FzeHM1dVBnSTJpTEF3ZkNkeG5tMVZTRTV5TXFHMnRZ?=
 =?utf-8?B?SFpvZmdJK3plMUZlWkJsY3BwMXVxVkg5YzR2dnAxVnRsMVFKK1lRYzZFZ1lC?=
 =?utf-8?B?bk95TU1CUHMrUVFOb3l2YWpqS3UxaFpld1pHS0g3NlVZRHhSNzF4REZ1bGt3?=
 =?utf-8?B?Q1dvMDFOeS9SQS9KUk4vSUJ2eGl2N2VvYVNSUm9xcFRVNzM4bDgyQmdvR01E?=
 =?utf-8?B?RmZHVnp4MHJ0bW5tb05va3p1Wm5GRnU3ZjhDcUtHZ0VQM25YSnNHSVdVeExH?=
 =?utf-8?B?SGRCL0IrekxZTVM5WFlYcjNtWGRreG9kcFVVK1p2azFSTmJWT0VWV0c2djN2?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 800c8ffb-d764-48c5-20f0-08de0a6dbd6a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 15:32:38.2359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFYYLEup3H3lMXlKIH4dIgrvnjkqUrhKh9aMM37mJlkjxSMCQja0dStxH07a+tZ1O07+FPt6jiDVw12yeQ/0cKPJDkPx5/rE/hHaBGLvgVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4971
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Venkat <venkat88@linux.ibm.com>
Date: Mon, 13 Oct 2025 09:27:14 +0530

> 
> 
>> On 12 Sep 2025, at 7:00 PM, Alexander Lobakin <aleksander.lobakin@intel.com> wrote:
>>
>> From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>> Date: Fri, 12 Sep 2025 18:39:33 +0530
>>
>>> Greetings!!!
>>>
>>>
>>> IBM CI has reported a build warning on IBM Power Server, on linux-
>>> next20250912 kernel.
>>>
>>>
>>> gcc version 11.5.0 20240719 (Red Hat 11.5.0-2) (GCC)
>>>
>>> GNU ld version 2.35.2-54.el9
>>>
>>>
>>> Attached is the .config file.
>>>
>>>
>>> Warnings:
>>>
>>> In file included from drivers/net/ethernet/intel/idpf/xdp.c:6:
>>> drivers/net/ethernet/intel/idpf/xdp.h: In function ‘idpf_xdp_tx_xmit’:
>>> drivers/net/ethernet/intel/idpf/xdp.h:28:20: note: the ABI of passing
>>> aggregates with 16-byte alignment has changed in GCC 5

BTW wait, "note"? It's not even a warning?

>>>   28 | static inline void idpf_xdp_tx_xmit(struct libeth_xdp_tx_desc
>>> desc, u32 i,
>>>      |                    ^~~~~~~~~~~~~~~~
>>
>> Yes, I do pass 16-byte variables/structures directly.
>>
>> I would say this warning makes no sense, due to the following reasons:
>>
>> 1. IIRC the minimum required GCC version for building the latest kernel
>>   is way above 5.
>> 2. This warning should appear only with `-Wabi`, which the upstream
>>   kernel never sets.
> 
> Now, this warning is seen on upstream kernel also. 

Then how to reproduce it? I've never seen a single report from the
upstream CI bots which would point out to such warning.

Could RH enable some additional output by default in their GCC?

> 
> Not sure if this is something we need to fix it or suppress the warning?

There's nothing to fix nor suppress.

> 
> Regards,
> Venkat.
> 
>> 3. Kernel is a self-contained project, this function is not uAPI, so we
>>   shouldn't care in general about backward ABI compatibility for purely
>>   in-kernel stuff.
>>
>> We have plenty of functions, mostly generic, which either passes or
>> returns >= 16-byte objects, but I see this warning for the first time.
>> Despite that my repo is attached to the open Intel CI bots infra which
>> does daily builds on a good bunch of different architectures and
>> toolchains (inc. GCC 8+).
Thanks,
Olek

