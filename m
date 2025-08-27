Return-Path: <linuxppc-dev+bounces-11389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB74DB388A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 19:29:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBs3d47Zbz3blv;
	Thu, 28 Aug 2025 03:29:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756315789;
	cv=fail; b=Uj+7+MGZgE5jmdpSDhCapEJNPoVo9/uepHpuxoVlzkczzggKBzA07+tNvmg86i713sMGT4lE9IplETWEWFTJ8MTjaVxDBiZ903Ly8eOso2Jsy49b+jPSfaqJ2dMfXCfFSA/xE2fEBr4Xx7Wu6vQZPP/EFoIW/SLQPTiqF19JejINvvaf2XgWvjPBTpYDzhixi0NU2ghq1HdJX3+jpuGFIiRoh17veYJ2q5bVSKsTXrorkfyIMk+tmxJDcY2MKOn/EopZXNtbmeP+tP9AIHUH7HzzVpgIweQ2aSqvLFhZjIEveaX6uPruLv8sHtBZomL6WHNQdg3Y5ddd0ygaEPjIzA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756315789; c=relaxed/relaxed;
	bh=JEJ7PfHZxqUDLEKORvLo3+3vkZ9EH3IBaFxl3OBJy6I=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xy+4dfzalILcUh+4LZDrWQBs9xCv7RdVIA19ismttAz0qx7LESHR7PbjsA3rahLqIQl1y4dN9i4Rk8EgXmfn7fw1xtx7UAFWt15E81T/k0UWLmghmf4vpLYDUj/2xMbCOiooCM0D1TpWSNJoaz8RirFYL7H8rKDfbOiuCVSVEw2I3b51thgAz/B2qoxNkXuKqqR6uaysEQn2vKqQT8TFZgg3SwCl/PcfaoVZnWdRpNRLSJylw41EP+w2LCa3mGwWSnlyC7rpkctf1mQDyM0laF7YoTmUSa2twxOFq17Bs7444RLZiAjSlDvRJmRy55QtEmSgL8cpPycCWLcc8Z7JqQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=czucoJAS; dkim-atps=neutral; spf=pass (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=czucoJAS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 61 seconds by postgrey-1.37 at boromir; Thu, 28 Aug 2025 03:29:48 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBs3c19G6z30Ff
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 03:29:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756315789; x=1787851789;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AT6hEY22y/3IjzJnxidX/A7t2l6I46tujTcrpOls0Cs=;
  b=czucoJAS1p1AYEezqkoeZBCDoZdVB9ZdornpvFaBScSeU8RHabBIhM1S
   BPLVNDH7ZpAHSVjVjr4EIwJpK86Kzyq2Ctc5BGCKYJGz7pSUrlCDrTSMH
   RTZEJuJiZiOPnnJiwaSQpc8H3h5jHGGoTTWKAX8pDBfIYcj/1ntu9BHmU
   ZE3s6nAS5WdlEy6knsT48rTpRBcJx6+0i0TTOMRzXz/jprTD4EeL3rQhP
   sIN/uY59+0cImi1eah2WmgtOLREV+UB8jUStJ9/qJOuSqCy2mhMMdSH+M
   u+L3EAZg9qi1XNHGXEsVF6xB/yegf6aV0Qj2RO9DvZ+u3mtdwz6gHXPP7
   g==;
X-CSE-ConnectionGUID: cJsHabEHQGGG22vrQf6qkA==
X-CSE-MsgGUID: a6G2YmceRuecQqSPVKeBNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58516830"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58516830"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:29:46 -0700
X-CSE-ConnectionGUID: wUtC//8TSjqShO4kwgEkUw==
X-CSE-MsgGUID: yELkBNizTxCBphgD3yOYJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170720401"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:29:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:29:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 10:29:45 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:29:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goFGtCX22gdpj5tOcM3CRhH7koa1SO2j/h8JgzW/I7TKQrqUP66uvKFmH4XqizACuUZz+SOrbiMtoMnLPpZcLfrf5KG180mNrr7HImTkpTyBq4nqCo14edCUdYDrQOUyp30rgz8eh59PtKciXHJzkseSf7RlBpm4G/ry+kxTHSwkVkTivTJaJWVhmMUnc+N03eLdyz5ssINxiMoCSzsRExmgA0ZOq4hEEBFtEEGZCt34DZ/dPooZIIunipw1uZZVb0qs4oDow2qgeKnjH/Is22e6OCPwE1zCuW+4h0y5/0lf6m+gYDUdmPjv69vhzX5Da7HvoVTp7kepqgGhZ30G7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEJ7PfHZxqUDLEKORvLo3+3vkZ9EH3IBaFxl3OBJy6I=;
 b=xR0MQygoEhUAvDSd4HDi1BaHK0MAr59edYoFaa0/uvmyWfADYqs2qYguc3c91S4Vul/YfeZVxsGlzwcrjLZgRoBkWKQLKHw46dfCiiHKht98bNr7bxrhjwqvoSylbn5iU5d3Rg28SgwJ8cHkTaAMCDt6qpqMxBAaE1r3VtVkh8KaYfHNyE8YIqvFAm7mdFj97JfLDXgCWzZTvCyL3o1wgY88Dx5sNWsy4NL6VxKho/l1VbHtOjud789TD/KFYVfh+3H5o0HhPmMlhdell5FElRnUZFLquRIN9e7uHRp89EAOx8ku64xpm3o+rxz1+q+7JdqnyVYRRJoG0tDdR5ekgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM3PPF529E923C8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 17:29:42 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 17:29:42 +0000
Message-ID: <d47939a7-2db6-40ac-97da-95b8c37bb0af@intel.com>
Date: Wed, 27 Aug 2025 20:29:37 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] tools/perf: Process the DTL entries in queue and
 deliver samples
To: Athira Rajeev <atrajeev@linux.ibm.com>, <acme@kernel.org>,
	<jolsa@kernel.org>, <maddy@linux.ibm.com>, <irogers@google.com>,
	<namhyung@kernel.org>
CC: <linux-perf-users@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<aboorvad@linux.ibm.com>, <sshegde@linux.ibm.com>, <kjain@linux.ibm.com>,
	<hbathini@linux.vnet.ibm.com>, <Aditya.Bodkhe1@ibm.com>,
	<venkat88@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <20250815083407.27953-12-atrajeev@linux.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250815083407.27953-12-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0269.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::34) To IA1PR11MB7198.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM3PPF529E923C8:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d775ee7-82b7-4a25-4446-08dde58f4ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QndPWURjSzhNcDkwWDNsOGhuQnlpSXBtbW9icEdML3ZSOFRNMXUxY0VIR25o?=
 =?utf-8?B?L2RvZjhTYndGa0l5ZFJ0OGVsMk1pLzVpQWJwZEthaTVHMVhoZThpU2JXSDZV?=
 =?utf-8?B?U1RZcjdlUGlQUXFxcDV0OTFpUWFKNW5VUXpjMmlpd3p4MHNyVC9GNitxS0Yr?=
 =?utf-8?B?RTB4azJRc0ZaaW9Na3BnVC96K0tUZTMyWDJhZGNwcnUvMy8vVzlhMmVMKzZQ?=
 =?utf-8?B?QU1HMzJXWG1obVlqRDV4SW5RVjY1ZlFKTVNWY3hEVVBLVUZwVnJoZG5pamJH?=
 =?utf-8?B?YnQyTnVaZlFtWlhQVE05VXBweWkzREdQNGhPdjE3bWRwNFQ5cTNIaUxrblcv?=
 =?utf-8?B?aUdtRC9BTlNxRjFYcTRXY1RHYXhjV1VRSzFhajlOMGUvYVZtenNRajkwQkU4?=
 =?utf-8?B?bUkvaThPVkFING0xZ1VJNm9qU2xlaG9GaWFCaHJTdjB3cnBsVy9VZmZqTkd0?=
 =?utf-8?B?M1M4Ykphc3pNR3lvT1JuVnl6WVJEK1NzWkxvcDZoWTRGTVFtaUJDSWhWQzZk?=
 =?utf-8?B?UU1pK1ZxWXRubmM3Y01GY0VCL08zRUJIQ05DTkhTTDRrb09LUUNBMnVrRTNu?=
 =?utf-8?B?eEtUMnZuM1dsTVEyYjhCTksvekM1dXVCWTE3eHk3QWZBZlJ5OXhwNm8rVysy?=
 =?utf-8?B?bkJ2SGdTYVJYb0V6elVySFVGcnhRUjMzZGVCWFd5dWpKL2NVOEFPbWV3UFYz?=
 =?utf-8?B?WUJzeWlaMStHWThtUlAxVTErWGZJTndLdGxTM2hPL1pLaEdiNGZCL3Mza0Vp?=
 =?utf-8?B?bjk3YmtPZS9aNVVrWWo1UDBPZHN3VzBwY2IvZGRBcHVrNWpaSG1kdnFxeHMx?=
 =?utf-8?B?WlRjM2hZT0xpY3FLTlFJTk1VNFF5WllMeFhINkk5MEhZSTdKZVJ1djVRakRR?=
 =?utf-8?B?VFZISnBWVWhWdkViQ0xubjNXT3V1aGFBcVBzTEZGVC9rT0VzQVJHSjZFU2hO?=
 =?utf-8?B?aVFSMHFHcVFFNXhmL01PWlV2UEFVN1hKTlZJL1BYUk1vZlpFc2N6M1ptVW9U?=
 =?utf-8?B?TGtXa0lHejdVcjlYN3FGZTlONWhibjkvUWdpUFoxMmt1T2M4SGlCekEyZlJh?=
 =?utf-8?B?b1dvUXh6S1laRE9XakFUMzZWOFB3L0h4SHpRUlFtNFJrQSt0akkzdDBRNyt4?=
 =?utf-8?B?YnluWWIwNUtnODlGbE5ESzE2bFE4WEFFbzMxdjUrT3FJOU1CN0Iyb2pmWHpj?=
 =?utf-8?B?VmdJNmVWeVNFVmRMQXY0ZlNUZmtHWlk1UVdVcG1tWjZISU5Vd2ttUk5lUTZW?=
 =?utf-8?B?SnVEeklFSWszM0dzc3pqNVVCN2NwcU1mTENucWhLU1lka0lKN05jQmZnMlUw?=
 =?utf-8?B?Yy92Z2ROL3Z2dnpUaS9SNS91cHJtSjRQYnRGMmVya0RyTFN1ZFFlWVdiR0Q3?=
 =?utf-8?B?aFVGQlFWcnQ3RzJHa0RWcXZ0NHhjTFlBOWlyMEsvaTZoK2k1d2luUERoWlBy?=
 =?utf-8?B?Uys3RmlrZDhLSU5UVmZzKzMyTVIxMFRWU1ZYWUh1cmxod25MSG8wSGt1eEs0?=
 =?utf-8?B?QlQ5cy9uaU0zK3d0eDZmd0liRVZOOXlveUZVbTBCclE2VmhMd0k0V2VFSCs3?=
 =?utf-8?B?NEZ4U1BWaGtkaVhNL281VW1LYjQ1LzdYdm8zcXd1ejA5dG9BUHpXcVNSQ0RD?=
 =?utf-8?B?OW90SGRFbHBITEJXN1hQOEpyVTVtbkVVNXU1aEFoNXFWUnRTTUFxS25uL20r?=
 =?utf-8?B?aEJSTkhpK3l5WVlrempEVEtWVTM3UStMZWExWUdOaUxTbDFaSDhRYmRxeUsv?=
 =?utf-8?B?WDA3MUsxMWU1dG96b0RPYjN1dUowbjQ1MEpVM3lyOVpQZ1UvakY0R0tUaUFz?=
 =?utf-8?B?VFVqWmI2STFFTkdyNXJPUUM3K3VwdG5UdVZjRUM4Q2tSMnpCSXJNUUM0Vyt2?=
 =?utf-8?B?TlJBbTNVSmpFQ2s5U2E4cE5nVklud1ZGb1dhT1UzY3R0QUpNcVhKYkZyZU9X?=
 =?utf-8?Q?l/XRspGKC7A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjZtZ0cwbGtjTitUMUc2eEdsUlM0RXlzanU1a1BDSWZGeU5iaUFvKzNYNWFF?=
 =?utf-8?B?Y2I3SEk0TUlKOEE5bkxqSGNsL1ZYOWNBN09mclBiUGM3a2EwM0hKelBGdjk0?=
 =?utf-8?B?TzkxeW5UNm1zS1hJN0RJL21LZFBsRE96NDFiUHROd1o1eDBZbHZBMHA2NWdp?=
 =?utf-8?B?aDF3N1VqVnB5dHIyZ2hQV3B5ZXhjUUlhWktibVF3Uk1ndVQzOVUweEdLQXlk?=
 =?utf-8?B?Rnk2L2tFZDQ2NGxLSXh3Zm1TZ2dmMWF1dEQrYzg0ZEtBT3kzOFRqT2R4dTBV?=
 =?utf-8?B?UEp0c0xTdTMzR0NoU1AwRk5NTWovbjUzMXJtOXJpVmJuZ2wrMzdDaTlDTTZ3?=
 =?utf-8?B?aHBOc3NhNmRjUnNMakZEdW56MTl5dnBhdk43SnVvYkhhNFJDVktWbGFiMGwy?=
 =?utf-8?B?R1lOTlgzeEE0WW5tLzR3aEtjV1VrQU5DMnlDUmFQVWsxalc4WWtadVBkaXY0?=
 =?utf-8?B?SFdpdjU5dDd0V2tOcGNRZ1FpbnlKdU12TWtuOGhzck1hOFM0dlNpNjlRWG90?=
 =?utf-8?B?ejNtUldCRzZrWTNONXJsSUxuZllydkxPbFZRRFhNNS85bDZZNHRReWRETW1G?=
 =?utf-8?B?UW1vT0pqYU9QRVNMME9CSkNvcUVHWEwvV0JsRDNRZHNybFJNT0R4bzVUSmoy?=
 =?utf-8?B?dEdwcy8rT0lhcnQzMU10bHVyT3FWVEJVbU9zYm1mWkJURVlid3FOczFqcDJS?=
 =?utf-8?B?dFFHdng4eHh0RDQ5bGcxMExkT0JHYjNid2ZERldlYnh4aDVHYW1paWcxNksx?=
 =?utf-8?B?WnprZE5vZ2ZhZTBWR1hUVk9PMm8wWDFROXg4bWY1R20vUUVlc1ZzUWlCWHhq?=
 =?utf-8?B?WmF1aGhqM1ROdkJvQ3diVFU4VXlqTzlRdFNnWDJ4VFZGakYrdmJOODh2ZFUx?=
 =?utf-8?B?ZFZacjlnQXpnWXF3YWFuNzNmR2ZSRUFaYVdKMFEzamEzUEpKc0Z1bDEwY0Ry?=
 =?utf-8?B?WThIREZSZWFNU2lLTVh2N0lBQTZvaDBNOTlLNDF0UjJ4THB0NUxndnVoQU9Q?=
 =?utf-8?B?Q1V1a1MyazByOTFGdFhnOThZYTdjUVhHTXFYck8zN3VqcXJuUVpaUGZ6aUxw?=
 =?utf-8?B?UFZmYWFRRGtqaTZBcHIydU00dVFtcC9rRTltWnkwNC9waTJFRC9RdytoL2ht?=
 =?utf-8?B?TWhpZzVtdCtBOUxWRWJJQmJFdUFVeEhuV2p0V2JvQ09Panh2d2NJSUNsQUNM?=
 =?utf-8?B?NTN4cUlpTXJYY3RPQUxFcE1oL1hDa3grdXZWaWF4eXJrZXFDb2F1Q2doMkVW?=
 =?utf-8?B?K0xJUDNHbzlIa0QyZWh5ZnJkVmZLRWtiQXJlWDlpdVRCWlhTNkNGVUczT0FS?=
 =?utf-8?B?YTFWdHFZK2phTkhZTUMySGQzSXpUdE8yTUx1TERkQ3VKdW5yemRjajMzaDR6?=
 =?utf-8?B?bXZlUXVSUWZGRUE2eDhqL3prR0tGbGJyY3hrN3Bod3BWOVVENnJMUEE0cGpx?=
 =?utf-8?B?UHNxVTMvVUN0eEI1R0p2OFp4U3pkYlF1aW0zelNzMlpkU0F2UmxJMnRRZmJv?=
 =?utf-8?B?amkyQ2dPMUl5ZVU3cTd6K1BxSUdsdlRLS21XbUdPNmxWeGxSVVRTSXE0R1Bs?=
 =?utf-8?B?T2l5SXdhcm9lWkdTRXVma2F2STRDUGwvSU5XODVNQkV3SVJQWFZ4eHlzTTFS?=
 =?utf-8?B?ODdHOXRvMVU2LzdpWi83aHU0NHlXeWY3YjNFL0hZSVZZLzQvY3F6WThGMEhq?=
 =?utf-8?B?bEI4bkJUSjVOQ2puZFkrVVAvYWRkNEd5VWZibFR6SG1Ob0tOQjI4Yk9wRjFq?=
 =?utf-8?B?RHpWZytGSnB2TXVMS3p4RXNrUndZUkhuUlFYMWNsMlF2NDNOWGNaSGo5MGFE?=
 =?utf-8?B?NjV5NTJyVFBNaDNGc3YzVWduQjBYdENwcmdnRVBwNW16K3hZQ25WS3M3OGl1?=
 =?utf-8?B?UHZ3YzZsdHNTRGt5RVZEWlVVaTlOZmxRMDV6Rkg0eTkxVm00TDlMT1FnVy9i?=
 =?utf-8?B?TTIxaW9hNFJKQjI3b0dDZlpEczJxTmJlYjdzSkdDOGNCUDc3ZnZaeG5uVnJH?=
 =?utf-8?B?aXIyNkQ0TkpCZ05PUklYQkZvamNIZEpTTjkrS3g4eGN5dmNGUWVwVWoySm9k?=
 =?utf-8?B?eDBqUjB4djVKVUpuUnRLeGZsSlVJT3NMV2p2NFFHL01hYmg1cW9jTjRnbVd2?=
 =?utf-8?B?RFIySnFxYlg1TGhRVnphWDV1SkRBOUQ0Mzdyam51UEpPWUN3ZUNMOWdTa3FM?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d775ee7-82b7-4a25-4446-08dde58f4ec8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:29:42.3430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDoIxY2dq5AcRu8uPJeaqeA+MVgP/IqIaREOt7X5ZReKUJN/xIY4Y9IonCnJE86vIM0/VU8405EKQHj1rH33Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF529E923C8
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/08/2025 11:34, Athira Rajeev wrote:
> Create samples from DTL entries for displaying in perf report
> and perf script. When the different PERF_RECORD_XX records are
> processed from perf session, powerpc_vpadtl_process_event() will
> be invoked. For each of the PERF_RECORD_XX record, compare the timestamp
> of perf record with timestamp of top element in the auxtrace heap.
> Process the auxtrace queue if the timestamp of element from heap is
> lower than timestamp from entry in perf record.
> 
> Sometimes it could happen that one buffer is only partially
> processed. if the timestamp of occurrence of another event is more
> than currently processed element in the queue, it will move on
> to next perf record. So keep track of position of buffer to
> continue processing next time. Update the timestamp of the
> auxtrace heap with the timestamp of last processed entry from
> the auxtrace buffer.
> 
> Generate perf sample for each entry in the dispatch trace log.
> Fill in the sample details:
> - sample ip is picked from srr0 field of dtl_entry
> - sample cpu is picked from processor_id of dtl_entry
> - sample id is from sample_id of powerpc_vpadtl
> - cpumode is set to PERF_RECORD_MISC_KERNEL
> - Additionally save the details in raw_data of sample. This
> is to print the relevant fields in perf_sample__fprintf_synth()
> when called from builtin-script
> 
> The sample is processed by calling perf_session__deliver_synth_event()
> so that it gets included in perf report.
> 
> Sample Output:
> 
>   ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>   [ perf record: Woken up 1 times to write data ]
>   [ perf record: Captured and wrote 0.300 MB perf.data ]
> 
>   ./perf report
> 
>   # Samples: 321  of event 'vpa-dtl'
>   # Event count (approx.): 321
>   #
>   # Children      Self  Command  Shared Object      Symbol
>   # ........  ........  .......  .................  ..............................
>   #
>      100.00%   100.00%  swapper  [kernel.kallsyms]  [k] plpar_hcall_norets_notrace
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
>  tools/perf/util/powerpc-vpadtl.c | 181 +++++++++++++++++++++++++++++++
>  1 file changed, 181 insertions(+)
> 
> diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
> index 299927901c9d..370c566f9ac2 100644
> --- a/tools/perf/util/powerpc-vpadtl.c
> +++ b/tools/perf/util/powerpc-vpadtl.c
> @@ -160,6 +160,43 @@ static void powerpc_vpadtl_dump_event(struct powerpc_vpadtl *vpa, unsigned char
>  	powerpc_vpadtl_dump(vpa, buf, len);
>  }
>  
> +/*
> + * Generate perf sample for each entry in the dispatch trace log.
> + *   - sample ip is picked from srr0 field of dtl_entry
> + *   - sample cpu is picked from logical cpu.
> + *   - sample id is from sample_id of powerpc_vpadtl
> + *   - cpumode is set to PERF_RECORD_MISC_KERNEL

Above 4 lines of comments are a bit redundant.

> + *   - Additionally save the details in raw_data of sample. This
> + *   is to print the relevant fields in perf_sample__fprintf_synth()
> + *   when called from builtin-script
> + */
> +static int powerpc_vpadtl_sample(struct dtl_entry *record, struct powerpc_vpadtl *vpa, u64 save, int cpu)
> +{
> +	struct perf_sample sample;
> +	union perf_event event;
> +
> +	sample.ip = be64_to_cpu(record->srr0);
> +	sample.period = 1;
> +	sample.cpu = cpu;
> +	sample.id = vpa->sample_id;
> +	sample.callchain = NULL;
> +	sample.branch_stack = NULL;
> +	memset(&event, 0, sizeof(event));
> +	sample.cpumode = PERF_RECORD_MISC_KERNEL;
> +	sample.time = save;
> +	sample.raw_data = record;
> +	sample.raw_size = sizeof(record);
> +	event.sample.header.type = PERF_RECORD_SAMPLE;
> +	event.sample.header.misc = sample.cpumode;
> +	event.sample.header.size = sizeof(struct perf_event_header);
> +	if (perf_session__deliver_synth_event(vpa->session, &event,
> +				&sample)) {

There is some inconsistency with line wrapping

> +		pr_debug("Failed to create sample for dtl entry\n");
> +		return -1;
> +	}
> +	return 0;
> +}
> +
>  static int powerpc_vpadtl_get_buffer(struct powerpc_vpadtl_queue *vpaq)
>  {
>  	struct auxtrace_buffer *buffer = vpaq->buffer;
> @@ -233,6 +270,148 @@ static int powerpc_vpadtl_decode(struct powerpc_vpadtl_queue *vpaq)
>  	return 1;
>  }
>  
> +static int powerpc_vpadtl_decode_all(struct powerpc_vpadtl_queue *vpaq)
> +{
> +	int ret;
> +	unsigned char *buf;
> +
> +	if (!vpaq->buf_len || (vpaq->pkt_len == vpaq->size)) {

Unnecessary parentheses around 'vpaq->pkt_len == vpaq->size'

> +		ret = powerpc_vpadtl_get_buffer(vpaq);
> +		if (ret <= 0)
> +			return ret;
> +	}
> +
> +	if (vpaq->buffer) {
> +		buf = vpaq->buffer->data;
> +		buf += vpaq->pkt_len;
> +		vpaq->dtl = (struct dtl_entry *)buf;
> +		if ((long long)be64_to_cpu(vpaq->dtl->timebase) <= 0) {
> +			if (vpaq->pkt_len != dtl_entry_size && vpaq->buf_len) {
> +				vpaq->pkt_len += dtl_entry_size;
> +				vpaq->buf_len -= dtl_entry_size;
> +			}
> +			return -1;
> +		}
> +		vpaq->pkt_len += dtl_entry_size;
> +		vpaq->buf_len -= dtl_entry_size;
> +	} else
> +		return 0;

braces {} should be used on all arms of this statement

> +
> +
> +	return 1;
> +}
> +
> +static int powerpc_vpadtl_run_decoder(struct powerpc_vpadtl_queue *vpaq, u64 *timestamp)
> +{
> +	struct powerpc_vpadtl *vpa = vpaq->vpa;
> +	struct dtl_entry *record;
> +	int ret;
> +	double result, div;
> +	double boot_freq = vpaq->tb_freq;
> +	unsigned long long boot_tb = vpaq->boot_tb;
> +	unsigned long long diff;
> +	unsigned long long save;
> +
> +	while (1) {
> +		ret = powerpc_vpadtl_decode_all(vpaq);
> +		if (!ret) {
> +			pr_debug("All data in the queue has been processed.\n");
> +			return 1;
> +		}
> +
> +		/*
> +		 * Error is detected when decoding VPA PMU trace. Continue to
> +		 * the next trace data and find out more dtl entries.
> +		 */
> +		if (ret < 0)
> +			continue;
> +
> +		record = vpaq->dtl;
> +
> +		diff = be64_to_cpu(record->timebase) - boot_tb;
> +		div = diff / boot_freq;
> +		result = div;
> +		result = result * 1000000000;
> +		save = result;

It would be nicer for the time calculation to be in a separate function.
Also 'save' is an odd choice of variable name for a timestamp.

> +
> +		/* Update timestamp for the last record */
> +		if (save > vpaq->timestamp)
> +			vpaq->timestamp = save;
> +
> +		/*
> +		 * If the timestamp of the queue is later than timestamp of the
> +		 * coming perf event, bail out so can allow the perf event to
> +		 * be processed ahead.
> +		 */
> +		if (vpaq->timestamp >= *timestamp) {
> +			*timestamp = vpaq->timestamp;
> +			vpaq->pkt_len -= dtl_entry_size;
> +			vpaq->buf_len += dtl_entry_size;
> +			return 0;
> +		}
> +
> +		ret = powerpc_vpadtl_sample(record, vpa, save, vpaq->cpu);
> +		if (ret)
> +			continue;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * For each of the PERF_RECORD_XX record, compare the timestamp
> + * of perf record with timestamp of top element in the auxtrace heap.
> + * Process the auxtrace queue if the timestamp of element from heap is
> + * lower than timestamp from entry in perf record.
> + *
> + * Update the timestamp of the auxtrace heap with the timestamp
> + * of last processed entry from the auxtrace buffer.
> + */
> +static int powerpc_vpadtl_process_queues(struct powerpc_vpadtl *vpa, u64 timestamp)
> +{
> +	unsigned int queue_nr;
> +	u64 ts;
> +	int ret;
> +
> +	while (1) {
> +		struct auxtrace_queue *queue;
> +		struct powerpc_vpadtl_queue *vpaq;
> +
> +		if (!vpa->heap.heap_cnt)
> +			return 0;
> +
> +		if (vpa->heap.heap_array[0].ordinal >= timestamp)
> +			return 0;
> +
> +		queue_nr = vpa->heap.heap_array[0].queue_nr;
> +		queue = &vpa->queues.queue_array[queue_nr];
> +		vpaq = queue->priv;
> +
> +		auxtrace_heap__pop(&vpa->heap);
> +
> +		if (vpa->heap.heap_cnt) {
> +			ts = vpa->heap.heap_array[0].ordinal + 1;
> +			if (ts > timestamp)
> +				ts = timestamp;
> +		} else
> +			ts = timestamp;

braces {} should be used on all arms of this statement

> +
> +		ret = powerpc_vpadtl_run_decoder(vpaq, &ts);
> +		if (ret < 0) {
> +			auxtrace_heap__add(&vpa->heap, queue_nr, ts);
> +			return ret;
> +		}
> +
> +		if (!ret) {
> +			ret = auxtrace_heap__add(&vpa->heap, queue_nr, ts);
> +			if (ret < 0)
> +				return ret;
> +		} else {
> +			vpaq->on_heap = false;
> +		}
> +	}
> +	return 0;
> +}
> +
>  static struct powerpc_vpadtl_queue *powerpc_vpadtl__alloc_queue(struct powerpc_vpadtl *vpa,
>  						unsigned int queue_nr)
>  {
> @@ -368,6 +547,8 @@ static int powerpc_vpadtl_process_event(struct perf_session *session __maybe_unu
>  		err = powerpc_vpadtl__update_queues(vpa);
>  		if (err)
>  			return err;
> +
> +		err = powerpc_vpadtl_process_queues(vpa, sample->time);
>  	}
>  
>  	return err;


