Return-Path: <linuxppc-dev+bounces-12237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE4B57FFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 17:09:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQT2c05f8z3f6K;
	Tue, 16 Sep 2025 01:09:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757948951;
	cv=fail; b=MccSZ3I8TyOC8J8h6gMnB1PH244xF0o0cAPALm9GLwMMroOgc3cZopT2F7TBJ+j5tsBXJ2ISP3Ox6KvBM7UZB/gAbMzmuj+eGNU+UZ8TkN6UkZ7O5ooYybwD8YFI+YArA+/Ydri/0drd99z/coxxGiFwnhM8FKWCTytiHBv/oOi/sc07yr1V4L4RgGuihiSprxso6gEOUw5jZCFc8V+/o7fVQnMBy3YbclMyF6kzQP04e9IbVbVr6eVsbLESW3x0PpL8iQ6l23vCxOe7JJ+jaWt1FbDjn8xaO+c2tvPV1fullbAY2rI0VAj9F7/0J3X2YyI4lBmnuP5ytZeZCPznNg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757948951; c=relaxed/relaxed;
	bh=SxMDggMd4QuKXQDVP7YSYomQ58t2EJjQyjl9wocRqFA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DNhecZdjLk5/4+aSqAM63csGC6Y94DpEaderRiGA7hnmCX9jCqHaibWqRh3Qyw5V18rFmHUKGgj5cCJT25eOJxpsNv/TAJY1cbxgN1IeuuroDeCJBeOtX6D7VNQlUshP+5fK1bEaYA7Tf9pI0vfjYDBu1mBfQJFapa8NUv1IO+ip6mmzfKWS3FL8+l5iXPQIlvbRtGx4TayaNA+gFycpCvPfNJRkc1lLEDFhrPzjQIODRkhCNIgnzS91KnO+iAyxK64QK94PSzbgN5YB1aQVTpuJToh91uKaY6Z4izoPcSAYuK7SoZwEZZMLnU7+0OVG+B0EbYV12F3dZwmOB5UCXA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JGy0jShw; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JGy0jShw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQT2Z6jpFz3f0v
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 01:09:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757948951; x=1789484951;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GPgFwpsr0ayHyGO4wmGxjcVhhW/FSeSmIAmHE677R9Q=;
  b=JGy0jShwWbkbC0lsURdubG0+wBx18oZzpZEuEusTY1ALl6We2LCDIuth
   HqO9nc9KnCsvi5PrHkFv9dux6poPTDPtqvWWI228qtVpRPEcSqmdInlt9
   an7XYnrb2CaL6WaQnE6lPhTD6ZnHgpoXNQ9lbJOKHZ5XBgjUjGq3XsRbU
   vvOAIL1vg3RoMDeyhRXWwQJSg46ZmSRtAKj/rvJEbbVjdirlln/HDPG+z
   FLjEPL8yaJJa7jdPdhyeGjoDxx8DfgW7WMl/SzwbceK6KcaIeJRUxzcHk
   5XN2ejPpkaxdbGOK+Ax80M0MLY4DAKrQazGBt4VxJaQ16/UmakpoAkASV
   A==;
X-CSE-ConnectionGUID: ttHkN0f/Tu6vXbMHbEPTpQ==
X-CSE-MsgGUID: SqErfJmRQOyVNOdvPJ1orw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60280577"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="60280577"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:09:09 -0700
X-CSE-ConnectionGUID: YB0lLqG8TXajEVEZhOTfug==
X-CSE-MsgGUID: wUuxMgvrSPmi1eFBcuvxKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="175086363"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:09:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:09:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 08:09:08 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:09:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1AkHFuq8pP7bj6CjVCtgyTP3wBAQrbJAfcBJ4BKtGtjly5bUazWYO57kCpH+ro4LsN7h9D/3aKIa9MquaVFd60a3sFKvR1bDKCKatUpt0tT0WxGKsclnTb+ZyUwDNWxjGNKBPcDnlNeVkLrGh8x18wlx42zNw8Ryk6s5+q6XDPlbbGmrUKm9RhFF9gpkHzEvGSv/1i+EtNZe4GfBfXltijBnlwTRPMFjHcZ/2fjU07TcJIFrxnV+nln6gTROoeSVHsnV2PYX8sAI/WM+u9fidEY9QgzCsY+E1zki4S/I+lpIKQHLuiAnf+8WeRx7hG5RBMTI4xyAjgCDKiBR6VU1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxMDggMd4QuKXQDVP7YSYomQ58t2EJjQyjl9wocRqFA=;
 b=tDVErBrVB6L+jATvjgxw5JOOXjjwYIreWenaSe4Z/nMBtFTBacFFNw1yYmGt7vxlhL++kWIkLTo+kQ0nSu7tV0GuCbiIjx8g9HBmdDYwRvwAqylnmdiyx8Zyzdzdj8a0+jwGgc82rUvK6dFeJqE4CTqFZz8gZhHQ2duLT+2UEPRhkW5F+mAIRH7g34E0iDXDrqofk5YB9ShGGwLQ4EkhFIfW2IbbEahZH+Ulmshzen9VZSWEN5id5GUR1sqPWAMRpVr4TDXskZD9UQ5m2ewGblB/pCZqKcfD7y7Dm/Z97D3Ubgyhbc7HgQnuIWYWIf7mrkchI7bopL4GCP2WVsvA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS0PR11MB7285.namprd11.prod.outlook.com (2603:10b6:8:13d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 15:09:06 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 15:09:05 +0000
Message-ID: <744d4dcd-c8dd-4335-8e3a-a81adda36b57@intel.com>
Date: Mon, 15 Sep 2025 18:09:00 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 6/6] tools/perf: Enable perf script to present the DTL
 entries
To: Athira Rajeev <atrajeev@linux.ibm.com>, <acme@kernel.org>,
	<jolsa@kernel.org>, <maddy@linux.ibm.com>, <irogers@google.com>,
	<namhyung@kernel.org>, <linux-perf-users@vger.kernel.org>
CC: <linuxppc-dev@lists.ozlabs.org>, <aboorvad@linux.ibm.com>,
	<sshegde@linux.ibm.com>, <hbathini@linux.vnet.ibm.com>,
	<Aditya.Bodkhe1@ibm.com>, <venkat88@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
 <20250915072754.99850-7-atrajeev@linux.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250915072754.99850-7-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To IA1PR11MB7198.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS0PR11MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b66e00-adbf-4bbd-690c-08ddf469d01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXN5ckJEeTBsZXBvWSszMzJTWS9rekJGK1ZkOVZhL0pYbjlueWJQZk1yMVZh?=
 =?utf-8?B?aHhiOXhyeDNxeGg4WVJHM1FhOG9qeXdyWW00ejhpdG1uRnhyeVIrM0ppM1ow?=
 =?utf-8?B?bmZ3ejUrc2t0Yk85dXZad1RsZWpVQUUxNmQzRFZscU1nalJSaTd1MlNrOUFt?=
 =?utf-8?B?QmFNdGJnd3J5cVNYQk9zVDlhT2tsYy82ckhBZGdsREs5bjBLVnhiZXZGY1pQ?=
 =?utf-8?B?Vjd2MnZ2L2kzNW9xd3Iyak1hdmp4a3BINCtVY0Rydk1EM3FlRzkzTlV6azVs?=
 =?utf-8?B?VVVlcTRsMFo5V08rZHVIblFud2w4bGpNOE1LUDllZ0pqcEx2MFlHQWJhVTBT?=
 =?utf-8?B?aUJieWhJNzJYYXNTZm5xQUVob3d6S3E2Tnl3N3lPN3I2YjdLWGdPWWMvRDd0?=
 =?utf-8?B?c29pK2loQ0NzcjFQOVpRMXZqYms1QlBOa0dnNTBGRVArbDJScExBejc0TEsr?=
 =?utf-8?B?WkU1QTlBaEg3d09QWTY2Vy9BT0RUN1pMampCVlJFWVhPelkzOWpTcnh0TlNj?=
 =?utf-8?B?WGxXN2tlUFJyNVArSDd3YlNINkJQRHlEZVJqcUhtOHE5ZkxFS0J6ZEFJRlMx?=
 =?utf-8?B?a1FuYklwQ2NzYmRrYUR2SzhaVmJwemg3bTVZdHE2c2tDeDZyY1lyZ3ZkRktQ?=
 =?utf-8?B?OVE5Uis0R3YzWDhzcnNvalpwQ3d5a2RqeEd5aC9vNm9aL0VIVlUrVnBlckxp?=
 =?utf-8?B?djlVTGxVc0tZOTF2QWpWSC9GUG16ajVWaXNXODBjbnMvdXdkQkd0d3BxUXRj?=
 =?utf-8?B?NG9jQ0xUYWR5dFJEVGVNM0RiMEE4S0RncnpOdW04WmxTVHNadGdDSmVKVktq?=
 =?utf-8?B?UXlWa01uQ1JhWHY0d0t5MkJoc21jNy9UWmNWTTBlZHZaQ0ZRZVZoREdjSDZH?=
 =?utf-8?B?VXNjK0ZTZEtLK3R1aDRBK0lxQzBSVDJHbFJ4Zm1xWjRRc3hlbDRFV0t1NnJZ?=
 =?utf-8?B?TXV2Y012UG1nczd6NE5JQjJudkdoZTA2ejVmKzNoNWdLSEhoTWF5S2t2Z3Jn?=
 =?utf-8?B?OVAzalhvcmwrS3JWNDhjNUxPS2I5UGFrMzlMRFM3OExlSlVDc0JrL3NlR0U0?=
 =?utf-8?B?SjM5MTQ0OWFMMnVPelVQbFhMQ05vTnJyRDREZy9qd09Valh3czhGUkFFTzhO?=
 =?utf-8?B?S21uQ1RQYXlmWFk4SG1SaVJad1E5MVVYclR1aFk1TGRjNkpKZDFsNUQ1Y0FI?=
 =?utf-8?B?Tk1GMVRiQjM3YlBPMHZETmVmdjRmSFliMnd1RUVIdnlpdzAxODJKVy9FZmhw?=
 =?utf-8?B?ekUwbkhtSmljRUxUYytGajRqYXBuQzVmWUpoS2RNRWI4enBQZVkvbmlLNStU?=
 =?utf-8?B?NENmS2lRSDVIRy8rV2M3TkhiZ3U0NEltSS96TTVFcTBSMklyNm45SFRnVzZm?=
 =?utf-8?B?TGw1bVNKUm1SWUhGcDkyQXNzVnQvOHBaaVRvRnZmVTlRN3ppUENpVTBOaE4r?=
 =?utf-8?B?ellqVUVsWXUycUhqRFRTQ3EvenNiTzVUQm9QR2J6SmdoSVpaZTBHSWtBZEpR?=
 =?utf-8?B?QzZDdEplRnY0Y2g1T05GQjNJSGlTZS9KQnVEaURqVHlWQks1djBNODJlUFRk?=
 =?utf-8?B?aFdlQnJoVnFzbXlnS1dnVjU4RkxNUU0wUmcvVUxEdWM1MXhFMzRJdS83MG4v?=
 =?utf-8?B?anh4MVZuRkpESzRhTDNNVHhmcXZWTGdDVHJQWGpVek9GcVdZelFtR09WdElh?=
 =?utf-8?B?MWJsUDBTeEVPOFpkNHVKVHJNU09RbXd2c1V5U2Fvb0ZQVUtja1NEcmtXWktE?=
 =?utf-8?B?bzU2TjRiZlE4Tm1ZVmF3b3VGRGZWczBjalFEMnlKVlpWMXpoaWhlK3FDU0N1?=
 =?utf-8?B?YXB4eC83WWRVdlpScUVzNndNU215VnJHKzQ3YkR6RE4rek9PamJUNXJ2TGhM?=
 =?utf-8?B?dnhlQkpqejRBVEhxaVVydkdkZjRXS3ZQZmVRc3B4bDBLb3krMDg1N0ZrYnV2?=
 =?utf-8?Q?C7sUOt8ysRA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzJkYzV6RGpYRS9Uc2ZHdFo3OWZhMWhZK0pwbmExNEZEZmxkdEN6TWZBTXhh?=
 =?utf-8?B?Qk1BUEVlK290Qk5qVjUzSWVQRitzSVdnUisxdE5VK3JWOWlMeXRSNEFpUTJv?=
 =?utf-8?B?aU1hbjdEZjJjcitGMERBR3p1MHduS0xVdFR1Q2NKa09wT0FkNi81M1dKbDRF?=
 =?utf-8?B?dVNvZm0xRmZnV1dxbFo3UERrTVM4Q0RxRmc5TkhVL1hGeWVTNS9qNnJVYkp5?=
 =?utf-8?B?NkRNZWJWcW5vWjZxQU1aQXBGTWxoUUpnc0tpaW5SWXdUclVuczVWSldnbkdT?=
 =?utf-8?B?a0RKVUthUnIwSjk4RWRsejJKQzl5SDNJNTJhR1JzenIybEg1WFpCeXRnMlhr?=
 =?utf-8?B?TGVRK3dWbFVGSUxHTE9GWXp2dmc2bHdWeHdxa2lZQ0N6TVBCRXpOYmw3MU93?=
 =?utf-8?B?cmoyZ1FRaDNHd3AraW8rd3NmaUgxL0ZkMDVGOUd1QXROOHJ6NUh4dEVHSVVu?=
 =?utf-8?B?T0F5bnBmcE1RTU1tbmlkaEVqaUhrcGd6NlJDbnZrRkExOVBEQ2hSN3lFamdp?=
 =?utf-8?B?Rjh2SVJMRXVOcWlyOXh3QU02UXVRV29ZeDZNbm5OTE1FSkRjZmxGczRmVDh4?=
 =?utf-8?B?bVNvQkJKcHZGd0tYTGdSem1aSmxsUisyMGI2bVVCaHBwR0o1K3JqU3Y5MHI3?=
 =?utf-8?B?SXBlTFF5UnAzeTZBQTVnUTBoTE9HVDhMeFMvbXlWYVBHc2RzTUQxVWxVWFYr?=
 =?utf-8?B?My9LcUFRNUxCRzQrS1o0eVI0Zmt0YzVqTWR2ZkRsdVhNUDVLckF3UEhZR1g3?=
 =?utf-8?B?VUZrV0NXVzBsdHZZSTl3ZFhBOXM3Zjl6OEJBRDl4U3JQd0NoV0dabWFaME9C?=
 =?utf-8?B?elBsY0ZoM0krOG42SzcybkNpd2hUS1l6dVl2T3VpSXlTZURod0RaeHpTU05l?=
 =?utf-8?B?Y3M2Uzltak03VUllNE5QVm40eUxRUzcrdVErSTRxRllGTStnMDlVLytBQVov?=
 =?utf-8?B?NEhxOVdnQXlDOXYzTVRaMTR4UFNRSlJVVjFMMzNOVnNqR1NMeXg2dVd4clE2?=
 =?utf-8?B?SHNRUEI3NGpOZUk3OUVacnRCa0FaV245RVJXdkxhZ3FuUUFKTXhZRm5Vdm00?=
 =?utf-8?B?L2R3aTBzWFd2ZGZENW1qQUZZbngwQ01jWUdxVVRCNWhLRkxDaTFVNnFtWGY1?=
 =?utf-8?B?a25ZVEtiU1ZJTFU4Mmw2SU5ZNjZGU091bFE0SGpINTBYdXpwMjlHVzNBTGRy?=
 =?utf-8?B?bk4rNmkySGJuT1NiWTZMVXBaYmR5Qjl2dFcvdjNzL2FGbGNJdXlTZU1WUXJi?=
 =?utf-8?B?U2h6Wm5zalVMUTcxakhKSGxIUHVUZUEvY3FJQWhTK2dZeG45d0p2NndRZWVL?=
 =?utf-8?B?MlVNem5yQithT0tCelVQcFJxNmRKdWpBYnFjMjFESmE2OEExWnB3S2RNSEdY?=
 =?utf-8?B?d083VnBLNkk1dmpPOE1nVExCdElDd256TWV1aHpoeDQ1RXVkdzB4SGFtdEZV?=
 =?utf-8?B?K20yL0N0OVpYUzByNzhzbmF5WVdJc2hkS1FnSlZ4Y1YzT1dIcmk5MnVwTERW?=
 =?utf-8?B?d1FJRUhjc3lqNm5MbCtsbDhvazRObHgyaXFaRGJXTXZRTGF2dVcxTlNJZmRM?=
 =?utf-8?B?UU0xc05mVjZ5UHJjK2VZdFVsSk5Fei9ZQ0gwOXU2QkhVRFVXYVhTQ095T2lq?=
 =?utf-8?B?MlR5bFlRQ1loTVB1YkxqSUl2WGtPamI3Z1htUzJad2drVXlsNThhTHhwU21n?=
 =?utf-8?B?eXVTbVJqQnJzTjhqNm1WVkdEaUhxb1NIWlNrWVBTSWhXMXFHeVU0V0ZLOGZ0?=
 =?utf-8?B?UUJBS01ZTXQ0Q2lJODRuclRMaDlvNDR5dzBFMVp2Wklmc3ZIaVRWYjBJZnlQ?=
 =?utf-8?B?eG9sMjhHc0VkbE1TejBmT3F6bnFiMEdkREZ1YTdrVGVEMDFJSjY4ZDZiV013?=
 =?utf-8?B?ZHFZM2ZYdjZheVQyNG1EbEh1MDN4SHZ0b3NKMU5ma284S0k1Y2V6UEJoZ3Bu?=
 =?utf-8?B?Smd3T0IyMlJPWC9xUnk1dElkTVdIYXNVZUtFYVhzRSszdjBycHVITjFMNHZP?=
 =?utf-8?B?YUxDRkgyOE9kaUtPOUhPSVBadmlwNTRyMGwzSjQvUWJNN0FDQXZDaWNCNms1?=
 =?utf-8?B?blRpc0ZJVEFDOWNaNmJGNEpXb28zWEp0WVBFYStxaktka2hsMXhSb3BWajdp?=
 =?utf-8?B?dzVQWU85NmI1cnRtaU1kODdHa0RNYVdxTHpITVlJYnR0VHhOTUc2TFBxMzdX?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b66e00-adbf-4bbd-690c-08ddf469d01b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 15:09:05.8138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sjy2iOuZ0KT8L7nTgMkbrAF35dQ5WXx8MbNNVI8x/q+22EfkIjIxldgPwIR0mbRABHeLdYYvMSmF33EecOMhKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7285
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/09/2025 10:27, Athira Rajeev wrote:
> The process_event() function in "builtin-script.c" invokes
> perf_sample__fprintf_synth() for displaying PERF_TYPE_SYNTH
> type events.
> 
>    if (attr->type == PERF_TYPE_SYNTH && PRINT_FIELD(SYNTH))
>    	perf_sample__fprintf_synth(sample, evsel, fp);
> 
> perf_sample__fprintf_synth() process the sample depending on the value
> in evsel->core.attr.config. Introduce perf_sample__fprintf_synth_vpadtl()
> and invoke this for PERF_SYNTH_POWERPC_VPA_DTL
> 
> Sample output:
> 
>    ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>    [ perf record: Woken up 1 times to write data ]
>    [ perf record: Captured and wrote 0.300 MB perf.data ]
> 
>    ./perf script
>             perf   13322 [002]   233.835807:                     sched:sched_switch: perf:13322 [120] R ==> migration/2:27 [0]
>      migration/2      27 [002]   233.835811:               sched:sched_migrate_task: comm=perf pid=13322 prio=120 orig_cpu=2 dest_cpu=3
>      migration/2      27 [002]   233.835818:               sched:sched_stat_runtime: comm=migration/2 pid=27 runtime=9214 [ns]
>      migration/2      27 [002]   233.835819:                     sched:sched_switch: migration/2:27 [0] S ==> swapper/2:0 [120]
>          swapper       0 [002]   233.835822:                                vpa-dtl: timebase: 338954486062657 dispatch_reason:decrementer_interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:435,			ready_to_enqueue_time:0, waiting_to_ready_time:34775058, processor_id: 202 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
>          swapper       0 [001]   233.835886:                                vpa-dtl: timebase: 338954486095398 dispatch_reason:priv_doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:542,			ready_to_enqueue_time:0, waiting_to_ready_time:1245360, processor_id: 201 c0000000000f8094 plpar_hcall_norets_notrace+0x18 ([kernel.kallsyms])
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
> Changelog:
> Addressed review comments from Adrian
> - Removed default callback and used perf_sample__fprintf_synth_vpadtl
> - fix build failure when using NO_AUXTRACE=1 by
>   adding code around HAVE_AUXTRACE_SUPPORT
> 
>  tools/perf/builtin-script.c | 27 +++++++++++++++++++++++++++
>  tools/perf/util/event.h     |  3 +++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> index d9fbdcf72f25..8a03fdbfce5e 100644
> --- a/tools/perf/builtin-script.c
> +++ b/tools/perf/builtin-script.c
> @@ -43,6 +43,7 @@
>  #include <linux/stringify.h>
>  #include <linux/time64.h>
>  #include <linux/zalloc.h>
> +#include <linux/unaligned.h>
>  #include <sys/utsname.h>
>  #include "asm/bug.h"
>  #include "util/mem-events.h"
> @@ -2003,6 +2004,30 @@ static int perf_sample__fprintf_synth_iflag_chg(struct perf_sample *sample, FILE
>  	return len + perf_sample__fprintf_pt_spacing(len, fp);
>  }
>  
> +#ifdef HAVE_AUXTRACE_SUPPORT
> +static int perf_sample__fprintf_synth_vpadtl(struct perf_sample *data, FILE *fp)
> +{
> +	struct powerpc_vpadtl_entry *dtl = (struct powerpc_vpadtl_entry *)data->raw_data;
> +
> +	fprintf(fp, "timebase: %" PRIu64 " dispatch_reason:%s, preempt_reason:%s,\n"
> +			"enqueue_to_dispatch_time:%d, ready_to_enqueue_time:%d, waiting_to_ready_time:%d, processor_id: %d",\

Unnecessary line continuation, also line length exceeds 100 columns

> +			get_unaligned_be64(&dtl->timebase),
> +			dispatch_reasons[dtl->dispatch_reason],
> +			preempt_reasons[dtl->preempt_reason],
> +			be32_to_cpu(dtl->enqueue_to_dispatch_time),
> +			be32_to_cpu(dtl->ready_to_enqueue_time),
> +			be32_to_cpu(dtl->waiting_to_ready_time),
> +			be16_to_cpu(dtl->processor_id));
> +
> +	return 1;

Other __fprintf_*() are returning the number of char printed.

> +}
> +#else
> +static int perf_sample__fprintf_synth_vpadtl(struct perf_sample *data __maybe_unused, FILE *fp __maybe_unused)
> +{
> +	return 0;
> +}
> +#endif
> +
>  static int perf_sample__fprintf_synth(struct perf_sample *sample,
>  				      struct evsel *evsel, FILE *fp)
>  {
> @@ -2025,6 +2050,8 @@ static int perf_sample__fprintf_synth(struct perf_sample *sample,
>  		return perf_sample__fprintf_synth_evt(sample, fp);
>  	case PERF_SYNTH_INTEL_IFLAG_CHG:
>  		return perf_sample__fprintf_synth_iflag_chg(sample, fp);
> +	case PERF_SYNTH_POWERPC_VPA_DTL:
> +		return perf_sample__fprintf_synth_vpadtl(sample, fp);
>  	default:
>  		break;
>  	}
> diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
> index 7e0e58979e9c..64c63b59d617 100644
> --- a/tools/perf/util/event.h
> +++ b/tools/perf/util/event.h
> @@ -271,6 +271,9 @@ struct powerpc_vpadtl_entry {
>  	u64     srr1;
>  };
>  
> +extern const char *dispatch_reasons[11];
> +extern const char *preempt_reasons[10];
> +
>  static inline void *perf_synth__raw_data(void *p)
>  {
>  	return p + 4;


