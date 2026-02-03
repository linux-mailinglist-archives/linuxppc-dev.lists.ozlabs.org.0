Return-Path: <linuxppc-dev+bounces-16546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EzhCOPagWlBLQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 12:24:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337ECD8434
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 12:24:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f51Mx00sMz30Sv;
	Tue, 03 Feb 2026 22:24:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770117852;
	cv=fail; b=D4nZFnkzInBj3Rz5KYDPtg7PKDBlcFEkOgPx5Xo6ynyrwfqzl8L6zl+WvYoSNT1xXiwvxHM8xHhN3eiW7fskoq9qaK3GoRs1AACNF753+NaGy4B3uUPhzW9m6Skk/Jba0NEw3xKpWRMOR6HtpszcXgAx3mCdGYJGO5Eg4bF0nwIaC4ESRPDsV4JjgTbrkfelpEwy5mSY2A8ouYpeal2JQyNjL4sTJOkeil666KwitQ7FfA5//BA1zxiuIb5mY9raaGse8hmSHl5+g7fJyFkIY+m64iYX1Q1KyRvoeaVTWc4MzIsdLLAcB5uu8BYWhHS4J0/jm5uA1vKdLssiB23ctA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770117852; c=relaxed/relaxed;
	bh=cZzJont8xDnOTdIvBU0DSKb+yXDL+QyT7C2o6A5dMxA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DTPJMZCt9HmAgfMaHhW9JlIpJnf8qe4UUKznDfMUWbDYoCOI43v+qZbAg68BkjEM7Kubv3k9ndGQGmHieH2mR+s6DeEBIC12485YCgFoD/OBhuq/CU9aNflKT+aFonRBCQ0lmUuzBcKQZ2xGn1GcDzf+KUZd3tt+qXSTogxXME6G6pVB6jaFOpa0jmaXBY9LNpBYK8ViY3/ouM1CwNYBnFROOkX/1rvrTzBDtXqfLAzSJTR7QvdQEFbZ+TsT3ppo29vXFPgRWYgefLrK91Ibg48wjLxTtJhl9gGa89wMHCf7AKz+FJO4UrgOQU1vYJnJZzunjIFeAcoRiDyGzH4xAQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WfTab9z3; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=przemyslaw.kitszel@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WfTab9z3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=przemyslaw.kitszel@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f51Mt4PYfz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 22:24:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770117851; x=1801653851;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N4TLCmuuopwx+PVGH6ppkwtcjGFtNVf64urhKrjuMoE=;
  b=WfTab9z37euoGwpVJUvNH/Z1ZQ8zrc6fLdi0L1+InNNgkXBN/zKNCsGC
   xdhMV6uMtiN/kbhoz+/8Gn6JG9xQf70bq6WxOXmV97K7pBQCMXzJqpiiQ
   z46fbY7AnwEmu31Q5jhkS5/p9vtyyJIM61VV8jQXVLazaZbEWaPrHhesM
   JQVAMgIMGZLOru4BObPT5CmVUDvKTrxlGqQOXj9z+AVOJU2ILwMUBZx7I
   IxuqLlEnrSVMp9uHrPMiUVBpauYhnh2wzRoBj1loAllqJur8LsJX1ps6b
   8CWzku1ukBb1HIl00mSbeatVBWZSM10ivWZ/4qs73JhFVKPBH/+yjRmQ3
   Q==;
X-CSE-ConnectionGUID: d+PQ0fW4QP68bPNcw0l0Zw==
X-CSE-MsgGUID: UZYFf4mKQAmaWNTILsLSJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81914843"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="81914843"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:24:05 -0800
X-CSE-ConnectionGUID: ICzZezk/QZixFWJWVJT0yg==
X-CSE-MsgGUID: B10z1CXoSt2MwLjzGiVsIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209113944"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:24:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 03:24:04 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 03:24:04 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 03:24:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1+CDRJKoYwRZkjf+wdLq0gDf/4qJLVIbCQ0b/v60lWFtSdKonbIF77qMyh5xQB4kFzlBrfKw4DJyg6Jv2v9WFikVsg3iBwQc7H6X9Es+JaCSM9CZ5ashmBYopnhIWUDrgO80Bc2AUS94KakwK8jZ6Z3oO43osJKclQNRF4eeAaN+MKolBh0s/Q0OXeCQsK6JcUHJanu1oJhXdWQhwfZvWeFWaHue3ZNPCMqdjoWan8J/ZPJeclQAB51YgIL/gtyyAdcMl8JhkU2AZxbw3ytED+eyA9tl9VQJr8UcdheNNYm6kc37tcNMqsZ5+f70xwjpR0/hTuPL1PPzBNW7432yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZzJont8xDnOTdIvBU0DSKb+yXDL+QyT7C2o6A5dMxA=;
 b=Tu5mGpPLF63upG0SbL2PfE//kdw2Mu714qsaiDxPeXSh72LJwTpJaPFjoXabSDwcx9U0l7BqEmeMf3k4mAquwyJ9VF7rl4B/Rp/q/g0eSmDV/K/7FlwEYQogRzH+Q+HJRXW6Q0eC+I5VheKkHWn889xj69Y9UY1YbXXFG/zARJ6tiRBrnQ6z/2mTGq1k6z+7+M0WgSJfqk3mbNvi//cloHLmgkMNrQzTjejQhQ2577jD+yGOLRIOEXzwJ42O/qJPq269yal5+Ejmsnq8wXee2EKPQUMLch4XOeDZpnL/IQYXTgVhbELYYP/Vr+thJkeoi4+8olexsZqf20lQJWlBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8)
 by SJ2PR11MB8565.namprd11.prod.outlook.com (2603:10b6:a03:56b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 11:23:56 +0000
Received: from CH0PR11MB8086.namprd11.prod.outlook.com
 ([fe80::2769:b184:69c6:6eb0]) by CH0PR11MB8086.namprd11.prod.outlook.com
 ([fe80::2769:b184:69c6:6eb0%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 11:23:56 +0000
Message-ID: <8f9d14dc-bc48-4545-85b9-dc63dc68fa3a@intel.com>
Date: Tue, 3 Feb 2026 12:23:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: dpc: Increase pciehp waiting time for DPC recovery
To: Lukas Wunner <lukas@wunner.de>, LeoLiu-oc <LeoLiu-oc@zhaoxin.com>
CC: Bjorn Helgaas <helgaas@kernel.org>, <mahesh@linux.ibm.com>,
	<oohall@gmail.com>, <bhelgaas@google.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<CobeChen@zhaoxin.com>, <TonyWWang@zhaoxin.com>, <ErosZhang@zhaoxin.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
References: <20260123202140.GA84703@bhelgaas>
 <3af9f754-d282-485c-a3f2-49a230bfe143@zhaoxin.com>
 <aXydEn_lAbNROQKy@wunner.de>
 <1096398c-e883-4232-91f6-836fc508092d@zhaoxin.com>
 <aYBoP-B2E9fp_4YZ@wunner.de>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <aYBoP-B2E9fp_4YZ@wunner.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::10) To CH0PR11MB8086.namprd11.prod.outlook.com
 (2603:10b6:610:190::8)
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
X-MS-TrafficTypeDiagnostic: CH0PR11MB8086:EE_|SJ2PR11MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1840a0-af02-48df-8250-08de6316b7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmJyYTlQNThTYXdiN1hGa25kWVhwNzVGRHZ1VHdLeDNJTVBFMjNjRTBKOVMv?=
 =?utf-8?B?cUR2WDR1eGo3alJjWGNtTm0wS0xkSW05QmM2Ull2dm1TeHZ5SE4zRU1LSlpu?=
 =?utf-8?B?bCt6MDZ2eWM4NG5Rc1laNXFDVEJjQWhKUFZSZWdPYWhUcTBMZXFFcFpZQ2lD?=
 =?utf-8?B?SU1VOWJyNnowMHdONG5PUXZ2bkh1SkczTm9Ia1UwZCtrRmJLVDZtZitLSnZM?=
 =?utf-8?B?TXM3aEFpM3Vibk5Hd3QrNFhBZnR2MW5weXVhVHRuODkyN2k4VW5iQ2cvcUYz?=
 =?utf-8?B?aG5LNGhHcHNqWXBXUklwZHdtR2wveXQrK2xBdTJiei9pL05Vb0lubkNZNlBi?=
 =?utf-8?B?aE1aWWgzSlVCeXV5RHFQNlhVMklweW1PbE9FUjlodmxmOXB6Qmc4YzBJUmpO?=
 =?utf-8?B?NTFqZUl3cmpIaE1oMEJvSklEbWdHbk5JWkFjUlE0QTBJTTFhZVNBc21TZHdF?=
 =?utf-8?B?Z0FIVkFaVHNnajVTMVBQejl3YjRQbDJQbU5OWDBEdUdEeTZBVzNXdi9TR2dB?=
 =?utf-8?B?L1RQSkJZTThRSTZrdTl4REJGdG8xN1owYlY5NDIySFdGT0t2c04yd2IrSkUz?=
 =?utf-8?B?RksvZEd1ZUhrek5EcmFRbG5QQytOK2pYUzgxVk8rQTNjT3c5d0dpWThqQ2tC?=
 =?utf-8?B?TDZUeHp1bmNocUdaMnhyRGhJYTRDSWN4ZGN5T2hHbHBnRkp3VnYrRldpbW5j?=
 =?utf-8?B?Umg4RHdNMjFtRXFXeVU3Q3VVVmJHYjVNRm5IS1FBVXNuWDJCN0l5L3k5emJY?=
 =?utf-8?B?TVhJVTZYWWRFc1gvMStIMEV3aWsvTWFnS2czVTBjMEp1dEt4bEpzWGZwSkpO?=
 =?utf-8?B?a2QrRlYwdWxxUHBXRjlVdDZiOHRud0FUWWtDaWFoRUE3cGpxWGpobFZGYVBH?=
 =?utf-8?B?UUdsL0tOc3g5bTdzWWFBaDFpZ0N4VXMzb2JOeTRSdUoyZldVd05lWGJ3SmRt?=
 =?utf-8?B?N0hHdkdmSytJWnQva29BemtHRW9BcEIvM05zWEZheGp5cmpicmpHLzBwVkpV?=
 =?utf-8?B?dmY4em1JeW9FOHpKT3N5UDQ5SUNkWnlqemk1Rkk5SHlUcE8vb0N0dmZxQVlQ?=
 =?utf-8?B?RmNqRWQ1Y09NZ2FraERQdEN6VzZOc3c3V3BCL1NDL3ZmSG5haDNaNnYweTM5?=
 =?utf-8?B?UjhQOEIzNnVwWWhjRHlLNk5sMTVhUWZSbFVseEFKTndRWEsvb3lLZTBVbVd6?=
 =?utf-8?B?M21qeWpCbFVXYUtrcGNvTkxWT0d5VmwzVXVQNnRqQnhCR2dUNjdVV0xkQk11?=
 =?utf-8?B?TlNNaEZFNU1VY0xGcDd6eFYxRDFXSnVuVko0OUxadXhCQUpwQ08wdXhOMFY4?=
 =?utf-8?B?WFN6OFQ1UzlTTzZLNXhsS2ozK1NWaWhIZUtYTmYwekk2WVN3bjB1YmJGbnZG?=
 =?utf-8?B?aVZDcGlKRzVOY2RtRDJLUHdLZ2hMSVptT0JvZ2xIK2I3b25LRDNPRHZkRCs5?=
 =?utf-8?B?SllRYW9vbmhYb2lQUEQvZ3p0cng5S1NHMW9odXQrdFZFVGZxdFJuZjlGNWJY?=
 =?utf-8?B?ZGpNNkxuQmgvTHhMT2d1cHlETnlUZC9IaUI0dGMyTGdZVzVaU0k5aytJVWFs?=
 =?utf-8?B?VGdWYndKbk5aUHQvVkFUQzg4ZXg3MGdWOGlUaWJKY2RSWjE0Wkx5OVVqYUhD?=
 =?utf-8?B?akpkTUtvYmx4K3Vxd0J5aTM4eDNMekVRMDRpVzVtYW5uY1ZNbnp1YlFzVWJX?=
 =?utf-8?B?cExXRHIzbDk4am55aEFJWEU1TEVYU1NiZ1UydjlmOGg4YmttaG5VbnRWTW9x?=
 =?utf-8?B?dEQxU2J5ekkvenVaQ1c3YlNQL3BkaUZyb2NoaWs3Qyt3ZFFOZW1mTmk2dVE1?=
 =?utf-8?B?d3FjdGR1a2tYZkVDTE9uZHlaeFhONjBNTkFIWTZrY2tVSDh6SFZuNnVTNFRl?=
 =?utf-8?B?bWNNZnpxRmZoK3lVcFh2bkdUK1dQUGlzZEdvbHVvV2ptNFFuckVsSk5nTmJx?=
 =?utf-8?B?QTRUQlRVczYzUVdrbU8weWNLVnl4Q2pSWThyVFZuaVY4MnNWc1BjWk1KUk51?=
 =?utf-8?B?TGJlUFlNaDBjeHYrYVdkR3hBSWZ5RXNBMml3TXBuYmd3ZS9PeWRNVmhoZWRk?=
 =?utf-8?B?Y0pmemIzT1BiT00wenk1MkdMSlhuR0xiWlcvbGV1RXlMeTZOa1ZBSGpBTkpH?=
 =?utf-8?Q?5O8g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8086.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnAvVDFZZ2pTSXk0bDlOeGg0b3BpWEFSam5LU3c4N0pMODZTZjB6cUR4c1VH?=
 =?utf-8?B?cDdzKzFnbXBFOENGbk42SUkyc2YzOUNKanFURkV2TTQyZUhsRjJvUmFaN1h2?=
 =?utf-8?B?ZkpxYU8wS3l4NmFuT3B3aFFsVDc1YUd1M2c2WVBFL1U1SGsvQ2hacWF3RlBJ?=
 =?utf-8?B?YmN1UkQ5UU5QWW9MbkcxUXM2dnZLM0NLSkpWSk05Y0htUG5FU0pMUTY0Q1pa?=
 =?utf-8?B?RmNiRWlkbkhxSm0wM0ZEb1NnNE90UE5Gdk5mSmhCdmdNNCt2THlWV0VKU2RQ?=
 =?utf-8?B?NUNaNU4zblFiblFGNzRGZktPT05sL2ZtTEZUakl3RFRWdmJEWW5VNkxvanVy?=
 =?utf-8?B?a2o2M0dLSG53N3hqdmZ5WGZYZ3RIYU5CRGNtZXp3bGh2d1BCeDlSQkp5djFO?=
 =?utf-8?B?NzhOY2d0bnJwRUFyY3dLdCtJUjd3SkVya3RVTlVRUTVqYXgvSjNxNUdEa1M2?=
 =?utf-8?B?NmpWWmJWUlJKL1FGcmYvZnoraVduaFQ5My83R2JEdXB6VkJGdkZ0YW9QUHNv?=
 =?utf-8?B?azFxc0VrWFVzbWUxYWtrZkpEeGFRdWVLWWcrcTZiazk0WmZsV256dUdqaXFY?=
 =?utf-8?B?NjlvSTVtZ3d0TWVacTRmY05HV2J3bVY4elJIN0VhR3JrT3JUZXpzU0xtWjJV?=
 =?utf-8?B?SERNQ3hyS2JNR1lZYWtLaytIazE2VmdrWGFPWnNGZ0JiSnRZc2VHWHlESy9Q?=
 =?utf-8?B?a3RxY3VzRGJtWnBST2s0MHdGa1pyU010bVhBV0U4ODdXK1V1c3FveUVQamx1?=
 =?utf-8?B?dFVlUmhhZWFreHN0UE9DeDN0dHhoc3hFelU5NW5zNlpGWG5sQm5TTk54ZzQr?=
 =?utf-8?B?TjloWGNXbUt2WWVWcDZ4NCtaMGVNbTRaV2FnUHlmMUZKWjNYU1lIM2RjbjZ5?=
 =?utf-8?B?L3RtY3ZZcVZBTEVkQ0dpS1MyUmJwRlZVQnViUTMyZWVmWnFEaEkzcHFHekFn?=
 =?utf-8?B?Um9NMjZjZ29QYlZvTVd6REt3Y1dxQ0twR0hsS2FpVUJsZVJDTGcxaDgwcnc2?=
 =?utf-8?B?d3dHaEVsRTdtYm5FTDBRNUpYcEFjWmw5bW5DdkF6Rm0xNGMrU29DSTlIemc2?=
 =?utf-8?B?OEJkMXhXbys4cUcxMzB0S25FWGVSTEp5RXhYU3BoU1NWdFRJMkhvNHdwZmEw?=
 =?utf-8?B?RWdIcFdBcW81c3VyUjNiMzJab3JDSmF6eUJ5TEhac1dTc3J6ZDhkZkJXR2ww?=
 =?utf-8?B?NzBWRURWeUgwWEZJdElVR3A2OGI4NTVyQ2wvUDd1dllRTTMraHl5K29FMVVF?=
 =?utf-8?B?UW02LzlDeStXNTFOUGJZTXNvQmtuVExmcnRVNmgxMHduL3RlQkdCZ2xzOUhU?=
 =?utf-8?B?WXVuMlJjZW1wSUcxZnh1emRzNVc4V0RxSXY3WnVOZVZ6MTdORzE1ai9HNUJq?=
 =?utf-8?B?bW0yMjdBMlVLZVB2SlVLR1REcWM3cEJGRlZJbWtZdm50ano3WkZhRVY0NEVu?=
 =?utf-8?B?QkMxc1lTK21pWUJSSmZKU1dCK0pVWmtNamtHTENTMHBqbStkVFVveGZ2V25V?=
 =?utf-8?B?b1dWakpDbzBuelpCWXd6cG90cWFpS3lUeXlyZFpZNzh3UkRDRlpYTnRYeGx2?=
 =?utf-8?B?eDlyTi9FYWtnTndNZWZVZnF4R1ZIQ2UvM2FRQWE1bmNlSSs4bFhKQUh5Nk8z?=
 =?utf-8?B?TVRpeEhITk95TkM1d21TTmdWUFR4OWQwU21ZMzR0eVM5TkREaER1V3ljaHgz?=
 =?utf-8?B?bmdSdW0zbnc4WHExSHNOVkYzUUFqY3VOZENQcG1YT0hScEtLK3Zkb1pibWRP?=
 =?utf-8?B?NUV4Ym53WC9WTFB4WHhJaGpRNU1Ob2hwa0d4bWNHRkNKcmh6MWFGZjZTZHp5?=
 =?utf-8?B?dk81YjNJY2dPaktSMG1BY2JkRFJRZHBoNnlQYXJ1cDU4UlZ2ODEwcWdDb0hj?=
 =?utf-8?B?cnk5bEU1UXhkOGdCUlBkZVE2b25PMno2NVhhS1NxNHF4dDIrK0VLcHk3aFAz?=
 =?utf-8?B?ZXRUdng1RGtiOFVtSGZ5anBuUkFJVEpWUmJIcTFNRGhJT1lSRWdxWk9xUG1I?=
 =?utf-8?B?Tmhpc3hmazhqSjM4NnZUUDRXQzl4SjNrdVM3dUFtREYwZEpjY3JPOG5ZZjFs?=
 =?utf-8?B?UWV3OHdaWUQrZ2l1em9GU2hucUlteFh4a3JNcVh3NEhjN2VmVVFJUi9OdTNa?=
 =?utf-8?B?bVVJc2hoSlgydUVtSnZWQnJnbndOSU92Y05Kb0JPZnh6OFFaVkp3S3RDWlZE?=
 =?utf-8?B?MndKQlRpd25mV2djYUQ2emR4UzdjMlRPcUM1dUR5MWRSY0RwZmZzQ2NiSnBY?=
 =?utf-8?B?MVBRUDJsb0EwNlozeTF2T1RreElOR2I4STFkeG1rM0I0QmE3M2xWSTh6RDNC?=
 =?utf-8?B?WWQxM3pBRVBUNUx5cmdUR3duWnFzWW5pUnJGYTB2RU5xWHROZXBEMVpud2N0?=
 =?utf-8?Q?0NKE2COa5wFoNxrQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1840a0-af02-48df-8250-08de6316b7b0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8086.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 11:23:56.1286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ET4k5l29qJ4NiuFemPhTy7+Z4hWo8LIs2CXzC0paCZzQjtcJHIPbElZVKsETLXBnMqv2P05QpiiQaxObO3f3TK+twMZOvwq0/neqIhopno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8565
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16546-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:LeoLiu-oc@zhaoxin.com,m:helgaas@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:CobeChen@zhaoxin.com,m:TonyWWang@zhaoxin.com,m:ErosZhang@zhaoxin.com,m:anthony.l.nguyen@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[przemyslaw.kitszel@intel.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,gmail.com,google.com,lists.ozlabs.org,vger.kernel.org,zhaoxin.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[przemyslaw.kitszel@intel.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 337ECD8434
X-Rspamd-Action: no action

On 2/2/26 10:02, Lukas Wunner wrote:
> [cc += Tony, Przemek (ice driver maintainers), start of thread is here:
> https://lore.kernel.org/all/20260123104034.429060-1-LeoLiu-oc@zhaoxin.com/
> ]
> 

thank you for the report, I've asked people working on similar issue to
take a look also here

> On Mon, Feb 02, 2026 at 02:00:55PM +0800, LeoLiu-oc wrote:
>> The kernel version I am using is 6.18.6.
> [...]
>> The complete log of the kernel panic is as follows:
>>
>> [  100.304077][  T843] list_del corruption, ffff8881418b79e8->next is LIST_POISON1 (dead000000000100)
>> [  100.312989][  T843] ------------[ cut here ]------------
>> [  100.318268][  T843] kernel BUG at lib/list_debug.c:56!
>> [  100.323380][  T843] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
>> [  100.329250][  T843] CPU: 7 PID: 843 Comm: irq/27-pciehp Tainted: P    W  OE     ------- ----  6.6.0-32.7.v2505.ky11.x86_64 #1
>> [  100.340793][  T843] Source Version: 71d5b964051132b7772acd935972fca11462bbfe
>> [  100.359228][  T843] RIP: 0010:__list_del_entry_valid_or_report+0x7f/0xc0
>> [  100.365877][  T843] Code: 66 4b a6 e8 c3 43 a9 ff 0f 0b 48 89 fe 48 c7 c7 10 67 4b a6 e8 b2 43 a9 ff 0f 0b 48 89 fe 48 c7 c7 40 67 4b a6 e8 a1 43 a9 ff <0f> 0b 48 89 fe 48 89 ca 48 c7 c7 78 67 4b a6 e8 8d 43 a9 ff 0f 0b
>> [  100.385158][  T843] RSP: 0018:ffffc9000f70fc08 EFLAGS: 00010246
>> [  100.391024][  T843] RAX: 000000000000004e RBX: ffff8881418b79e8 RCX: 0000000000000000
>> [  100.398781][  T843] RDX: 0000000000000000 RSI: ffff8897df5a32c0 RDI: ffff8897df5a32c0
>> [  100.406538][  T843] RBP: ffff8881257f9608 R08: 0000000000000000 R09: 0000000000000003
>> [  100.414294][  T843] R10: ffffc9000f70fa90 R11: ffffffffa6fee508 R12: 0000000000000000
>> [  100.422050][  T843] R13: ffff8881257f9608 R14: ffff888116507c28 R15: ffff888116507c28
>> [  100.429807][  T843] FS:  0000000000000000(0000) GS:ffff8897df580000(0000) knlGS:0000000000000000
>> [  100.438511][  T843] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  100.444891][  T843] CR2: 00007f9563bac1c0 CR3: 0000000c4be26004 CR4: 0000000000570ee0
>> [  100.452647][  T843] PKRU: 55555554
>> [  100.456017][  T843] Call Trace:
>> [  100.459129][  T843]  <TASK>
>> [  100.461898][  T843]  ice_flow_rem_entry_sync.constprop.0+0x1c/0x90 [ice]
>> [  100.468663][  T843]  ice_flow_rem_entry+0x3d/0x60 [ice]
>> [  100.473925][  T843]  ice_fdir_erase_flow_from_hw.constprop.0+0x9b/0x100 [ice]
>> [  100.481078][  T843]  ice_fdir_rem_flow.constprop.0+0x32/0xb0 [ice]
>> [  100.487284][  T843]  ice_vsi_manage_fdir+0x7b/0xb0 [ice]
>> [  100.492629][  T843]  ice_deinit_features.part.0+0x46/0xc0 [ice]
>> [  100.498571][  T843]  ice_remove+0xcf/0x220 [ice]
>> [  100.503222][  T843]  pci_device_remove+0x3f/0xb0
>> [  100.507798][  T843]  device_release_driver_internal+0x19d/0x220
>> [  100.513667][  T843]  pci_stop_bus_device+0x6c/0x90
>> [  100.518417][  T843]  pci_stop_and_remove_bus_device+0x12/0x20
>> [  100.524110][  T843]  pciehp_unconfigure_device+0x9f/0x160
>> [  100.529463][  T843]  pciehp_disable_slot+0x69/0x130
>> [  100.534296][  T843]  pciehp_handle_presence_or_link_change+0xfc/0x210
>> [  100.540678][  T843]  pciehp_ist+0x204/0x230
>> [  100.544824][  T843]  ? __pfx_irq_thread_fn+0x10/0x10
>> [  100.549747][  T843]  irq_thread_fn+0x20/0x60
>> [  100.553978][  T843]  irq_thread+0xfb/0x1c0
>> [  100.558038][  T843]  ? __pfx_irq_thread_dtor+0x10/0x10
>> [  100.563130][  T843]  ? __pfx_irq_thread+0x10/0x10
>> [  100.567791][  T843]  kthread+0xe5/0x120
>> [  100.571594][  T843]  ? __pfx_kthread+0x10/0x10
>> [  100.575997][  T843]  ret_from_fork+0x17a/0x1a0
>> [  100.580403][  T843]  ? __pfx_kthread+0x10/0x10
>> [  100.584805][  T843]  ret_from_fork_asm+0x1a/0x30
>> [  100.589384][  T843]  </TASK>
>> [  100.592237][  T843] Modules linked in: zxmem(OE) einj amdgpu amdxcp
>> gpu_sched drm_exec drm_buddy nft_fib_inet nft_fib_ipv4 nft_fib_ipv6
>> nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
>> nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 zhaoxin_cputemp
>> nf_defrag_ipv4 zhaoxin_rng snd_hda_codec_hdmi radeon rfkill
>> snd_hda_intel snd_intel_dspcfg irdma i2c_algo_bit snd_intel_sdw_acpi
>> ip_set i40e drm_suballoc_helper nf_tables drm_ttm_helper pcicfg(POE)
>> snd_hda_codec ib_uverbs sunrpc ttm ib_core snd_hda_core
>> drm_display_helper snd_hwdep kvm_intel snd_pcm cec vfat fat
>> drm_kms_helper snd_timer kvm video ice snd psmouse soundcore wmi
>> acpi_cpufreq pcspkr i2c_zhaoxin sg sch_fq_codel drm fuse backlight
>> nfnetlink xfs sd_mod t10_pi sm2_zhaoxin_gmi crct10dif_pclmul
>> crc32_pclmul ahci crc32c_intel libahci r8169 ghash_clmulni_intel libata
>> sha512_ssse3 serio_raw realtek dm_mirror dm_region_hash dm_log
>> dm_multipath dm_mod i2c_dev autofs4
>> [  100.674508][  T843] ---[ end trace 0000000000000000 ]---
>> [  100.709547][  T843] RIP: 0010:__list_del_entry_valid_or_report+0x7f/0xc0
>> [  100.716197][  T843] Code: 66 4b a6 e8 c3 43 a9 ff 0f 0b 48 89 fe 48 c7 c7 10 67 4b a6 e8 b2 43 a9 ff 0f 0b 48 89 fe 48 c7 c7 40 67 4b a6 e8 a1 43 a9 ff <0f> 0b 48 89 fe 48 89 ca 48 c7 c7 78 67 4b a6 e8 8d 43 a9 ff 0f 0b
>> [  100.735491][  T843] RSP: 0018:ffffc9000f70fc08 EFLAGS: 00010246
>> [  100.741367][  T843] RAX: 000000000000004e RBX: ffff8881418b79e8 RCX: 0000000000000000
>> [  100.749137][  T843] RDX: 0000000000000000 RSI: ffff8897df5a32c0 RDI: ffff8897df5a32c0
>> [  100.756909][  T843] RBP: ffff8881257f9608 R08: 0000000000000000 R09: 0000000000000003
>> [  100.764678][  T843] R10: ffffc9000f70fa90 R11: ffffffffa6fee508 R12: 0000000000000000
>> [  100.772448][  T843] R13: ffff8881257f9608 R14: ffff888116507c28 R15: ffff888116507c28
>> [  100.780218][  T843] FS:  0000000000000000(0000) GS:ffff8897df580000(0000) knlGS:0000000000000000
>> [  100.788934][  T843] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  100.795329][  T843] CR2: 00007f9563bac1c0 CR3: 0000000c4be26004 CR4: 0000000000570ee0
>> [  100.803099][  T843] PKRU: 55555554
>> [  100.806483][  T843] Kernel panic - not syncing: Fatal exception
>> [  100.812794][  T843] Kernel Offset: disabled
>> [  100.821613][  T843] pstore: backend (erst) writing error (-28)
>> [  100.827481][  T843] ---[ end Kernel panic - not syncing: Fatal exception ]---
>>
>> The reason for this kernel panic is that the ice network card driver
>> executed the ice_pci_err_detected() for a longer time than the maximum
>> waiting time allowed by pciehp. After that, the pciehp_ist() will
>> execute the ice network card driver's ice_remove() process. This results
>> in the ice_pci_err_detected() having already deleted the list, while the
>> ice_remove() is still attempting to delete a list that no longer exists.
> 
> This is a bug in the ice driver, not in the pciehp or dpc driver.
> As such, it is not a good argument to support the extension of the
> timeout.  I'm not against extending the timeout, but the argument
> that it's necessary to avoid occurrence of a bug is not a good one.
> 
> You should first try to unbind the ice driver at runtime to see if
> there is a general problem in the unbind code path:
> 
> echo abcd:ef:gh.i > /sys/bus/pci/drivers/shpchp/unbind
> 
> Replace abcd:ef:gh.i with the domain/bus/device/function of the Ethernet
> card.  The dmesg excerpt you've provided unfortunately does not betray
> the card's address.
> 
> Then try to rebind the driver via the "bind" sysfs attribute.
> 
> If this works, the next thing to debug is whether the driver has a
> problem with surprise removal.  I'm not fully convinced that the
> crash you're seeing is caused by concurrent execution of
> ice_pci_err_detected() and ice_remove().  When pciehp unbinds the
> driver during DPC recovery, the device is likely inaccessible.
> It's possible that ice_remove() behaves differently for an
> inaccessible device and that may cause the crash instead of the
> concurrent execution of ice_pci_err_detected().
> 
> It would also be good to understand why DPC recovery of the Ethernet
> card takes this long.  Does it take a long time to come out of reset?
> Could the ice driver be changed to allow for faster recovery?
> 
> Thanks,
> 
> Lukas


