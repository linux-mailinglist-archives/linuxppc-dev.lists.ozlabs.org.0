Return-Path: <linuxppc-dev+bounces-9435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE191ADE023
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 02:42:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMQ1W6Hn3z30Ql;
	Wed, 18 Jun 2025 10:42:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750207343;
	cv=fail; b=YiTyhLCpCQoUAUYHNEUPvmgFn7cUocrfs9tX+JRGwLSPLIIyeFWx4No+DErvv6rdW0AffagBzHCuBZTqhLtEUe4S+mfDP34FWUSwGDkZyQ8sjjoMo3F93GkvGBJs/Kej9s+fiEhTmUkpxfdnlewZiL5VzAa5eNfW/O59GyYFKEYhG4caTXK1w3aWK3j0NcfdbqyBKniYG+yCKHM+PHHriwh+Ko1BCc2DFr88dfN82AckUqb4JJ8eyqIA1gSN4Cm8grTBvKN36sU/3CYOh04alk1HjaLf5gSTNroTMLuJDeZhCUd3bfFEcQPhaaRU7SydpjSq6Ivb1ZX7UltddRdVkA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750207343; c=relaxed/relaxed;
	bh=ITlMLDT2qmcfOhrPEN5xTNXkqZURwThJIWmY4U/02a0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bT0zBv0XBTRf1JDMrsHhsavVKKgc03qOqJ3r6FxMti+t3byVlowRl3vzb6ZRlxQHEexQFveAGmbAx0yGVA1Y0TVyAUqGi72kqJQqsJPkMx7zOhgNBxbf9T88Dj/Ak2wgELOWOUWUlNyzFJPH2QMJxM6f4deTkKgiy4rbVIBiOzVrU/1Qe7OlaSFrAJAafO3vP58Gw2yADahxCzM0FkgHUUT236C8M8TDs/goliuK84bCZcjIm2qIW4M4B3ufYtzZTxEtuwGl4cAn1K1LdkQRAnTP3c9oT3NFxKHSwQuEIoP1oR23D19r/M5ZO6es1Fi7kuruYObT1WVjRVn/hlW1Cw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z9wNcuX7; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z9wNcuX7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Wed, 18 Jun 2025 10:42:21 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMQ1T3LdPz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 10:42:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750207341; x=1781743341;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/efcLpEUwNn9YvJTy7Ndqn/Yrz0viHEH4EKOaKA3dwU=;
  b=Z9wNcuX79k1rJnbjxlI5hFV3mPenKd8rpSO8ImPcD1VPCZTH7GWO4xo1
   3z1L/vf/MfQr2nE+m1fcbIY0KSmeqe1qG6kyiv+axPQlAixkY2Vhisqfh
   uV6EIndFrfNOiY7EptcGfY49nTwXs3UBD87CcXxmZtaW2e2iZXXoL2WGI
   BGdgUEy7voID1zvErFsWq+g3bIkmktqLA20RVt2kP6S1XAu/NHCEv3xdX
   XUwWhIbCUmKzpPfk/Zg+QbjLhktL7VvuLHSH+SXkklp/l3vrgsocnB4Jc
   wrGeUDqnwsr4bWU3QXguq/OeVK8Jyzoo1oPrlpW1yy65OLiPt42U9xLc0
   w==;
X-CSE-ConnectionGUID: MlzQqsdnT8Km06SrtbCFdQ==
X-CSE-MsgGUID: qh0zE/7QTwaDwlvPVmJVkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52497860"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52497860"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 17:41:14 -0700
X-CSE-ConnectionGUID: zmWhPpBbSX2L6J7mHt2lyw==
X-CSE-MsgGUID: QeECR4oKRQiXtEngppUdEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="153931754"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 17:41:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 17:41:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 17:41:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.56)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 17:41:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jn089f9/XXzMbFACl+frzvXVQbY/8ipBvtdIC5i3/A0MeEK8MVglxC6VlZyuCkKhNBqSMDL5U2ngkzw/Zk0g/NHtgM1tA9t+oFbHK/Ghs03KLum5KjqLQbjPIOI6et/LrOodYOMhzcdXcRSt7bCI3QKfG+4zi7GhyUrqUBAN/loUSIk7qtcj7cV0RB3y2rlu6M+REqCX/ewL+4YcK3c5jKPOPP4i4ED9KiGPa2f3gmf3rgdkod83NkTeMrjmL9R1lkNs9E09Rzny0tBaqhnEa5duSXSyARVykGe7x1FbCKI6mZgz8l5jCKOqF4ooJpg4tQnQLk1XhtdL2GQtJWGAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITlMLDT2qmcfOhrPEN5xTNXkqZURwThJIWmY4U/02a0=;
 b=vDFnh/3yCZabZPBl/q4ndStqbSv6qerCOPDGyJSsI1Nwhaol8NqB3wwm9mHVTdEDoF/c5aYnXa9x6Th1DLz5UfPuzLK331sK/kFEZn6lmOn3EteBA/horZoMydGMR7ZsbnQbUKAzOazV4db5WOU9NcICDERw/xJer7Z8N105kBwcxS31TFQyLcewCKq/QO05QaT4Lr8x5fY78D9o/+ZQZ2IYesImXD4v0mCQpzI0KyS/I1MdKUxe2xJ9SeGK9XSc6GCk18tqbiRtJvZxfIiWAhm0gUp2Iuu9Xxo1GuONk2p8+fRNMy2kOQu8XOzwIN/TDDARdrl5LsECYNGGGWriAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 00:41:11 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 00:41:10 +0000
Message-ID: <983d7906-6510-4867-978f-4f937b29224b@intel.com>
Date: Tue, 17 Jun 2025 17:41:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] lib/crypto/x86: move arch/x86/lib/crypto/ to
 lib/crypto/x86/
To: Eric Biggers <ebiggers@kernel.org>, <linux-crypto@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <x86@kernel.org>
References: <20250617222726.365148-1-ebiggers@kernel.org>
 <20250617222726.365148-9-ebiggers@kernel.org>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20250617222726.365148-9-ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:303:8c::16) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
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
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: 78216ba6-72af-4873-6132-08ddae00d22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUlKanFOQnV3ZFVvYmNrS3NvSjlZTjZNc3pPTWVXTVhMczVDc3c0cXp3dVRM?=
 =?utf-8?B?SnFMQ21lR0RTOUdTTWJzU2pVMkw5ZWd3NHpCSXlJWTlFVVZDWEFUZHlZNHZ0?=
 =?utf-8?B?T0xHWnE5bGl2YSt1cmxxZ2Q3MnlVQ3d2SlZIZ2FSb0NvT21tT0FEd3h4alAx?=
 =?utf-8?B?VDJVL3FLdjRWc25OM0Nmb3RKc1NwTVlvUTVVVUxULy8zWFR6TUM0Z0o5MVBZ?=
 =?utf-8?B?Y1duQUdCV05ES1daQkk1citZZUMvRENXMDJsRGp6VlppZUJieGttbWFXQVdt?=
 =?utf-8?B?dHU5YlZBQzRYdTJMNXNlVEZSNCs0WEVWMURPRTU0YVl6djRJZFNLbTJBMWxm?=
 =?utf-8?B?K09DWWxwN3Y4Zng0emQxaEN3K2tSRS84dnRxNHhRN3JvdU5uR3FCUmo0V1VX?=
 =?utf-8?B?YmgxZVp1WFJ5SlJjSGVOTUI3TFN5aXlobzB5SjFKbnJJZnd2Uk13ODZXSmFw?=
 =?utf-8?B?VXRKckRUcFkwaWFua0xNNWN5R3ZQVXNMQVBaeVYvLytNM1Bza1NHRWdUQXVa?=
 =?utf-8?B?MldqR1Jnd1h5bXpJZGxpbHRTWDJYRCtPMkYzay9xY2lYd0tSZ3h4elhwLzcz?=
 =?utf-8?B?aDRQTzFrNjdSb2ZCVmdCdFlHcFJmNStXVGQ0TG13cEgrVlJ2T1hOeEJuSEVH?=
 =?utf-8?B?a0lCQnRUQTJLbU9MWVdRTWxPMTNRNnBGZE51bko0RnZtemtGT3ZaZkxWc3ZF?=
 =?utf-8?B?R1NmeE9kNk1jRHZ4clVvVVgvcnlFRHZpV2xOeFZsZW1md0lQYjhnWVlPWCtp?=
 =?utf-8?B?Q21lcSs3YkJEajB0UGE0Q2VlaXM1UkxoaGJqN3YzYWZtQmV3NWJ1ZnV3TTNZ?=
 =?utf-8?B?TExQTkJRRGJiVkZHMjN2MG1jdXp3blA1OTR1ejRGYy9qVkkyUGpub1BVN01m?=
 =?utf-8?B?YW9LWjF1MS85QjZMK0JEclVwKzFveG9hWmExTEdoM2F4eGtOZElybEliWUps?=
 =?utf-8?B?dlBCUVU0TTdBcDN3VDlZSnU4RzRQZ3FiZkN4eXRHOXRGcy9qNGU1aVNyT0Fv?=
 =?utf-8?B?bVRKN2k1MDBDbVM0cHlGanlJOUU3eEoyN2RnT0ZFbnJWU0kwNFZVTndnQXk3?=
 =?utf-8?B?aE0vU3o2K0N5bUlhYzhUNllDOFkyalA4STg4T2JnMmhFeHlQRFQ4U3RNYmQr?=
 =?utf-8?B?dnFzdU4wTjdsS25nVWNKSE81a0V6dWYyNW5IZGVKOXA0SjA4L2pFMHpndlZT?=
 =?utf-8?B?V0lIS29PTDF6aVBWQ3BrMG1ybW56Y2JFMHNtQjZsd3h6YmUwZUtTT0lsZ0pF?=
 =?utf-8?B?WXJaWVd1cHo5ZGZibmxCS0V4VzlYRUhpZnU2UjBtS0tKdEpRM1VWVS9rRE1J?=
 =?utf-8?B?TmdQV0hnOGlBWC9HcHlDeFFxZUduVTFaQVpnTzUzSFBSZVdCQUc2dGNYcjl0?=
 =?utf-8?B?eG9uWUJjV1YraGVCY0d4OXYrSlZCaDBsa1pkdDBSRW5qMUJ3ajE0RVNDSzRp?=
 =?utf-8?B?V2kvYjk4KzdSQVhlaDdwWGk5MHdobG9tSisydGpmMXIrZWJtc256Ym1lOThH?=
 =?utf-8?B?QVhOMmx6ZGJ3ODZaa3Z5Mm9ZWnZwWHAxT2Ftbkd3ZWRLeUFXVER5eVRwemZr?=
 =?utf-8?B?ZExYUDZNTGtpYmlQSzlQVlcvK2l2RWtzLzJ5V0tuVU1ZQnJxbUxUNnNjdWhZ?=
 =?utf-8?B?OWxhYUJKS20wZjNMeVNzYzYxSG9CT2dqMndjWVU2OWd1TUhjSEtBTm9pTS94?=
 =?utf-8?B?ZXk3cjkwcHVRSk45SDlSc2FFZ2V2VlBzQjZyeDQ2RTFwNlYvSzYvRnlsdW4z?=
 =?utf-8?B?dWxFWVpVbkVkdmJpN3NNelBUTG5WOTJ4SUg2TWZBSlovRGFEenh1Z0NYTWRv?=
 =?utf-8?B?VXgxUnR4b05MMjJoM3d3eHVydUNtUTZkbzNCbDMrUWMvNWZNL3owRXJZbVNL?=
 =?utf-8?Q?iGklohh9a5GZm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0lOV1lLM1NJY2ppbHhRcTVTNU1KbW40WlhsQXZoS1NaY0paQXkwb0s2Wk12?=
 =?utf-8?B?MFVidSt6cDNySU9nRmt5WkluYXVrcjhiOW9CeStwVWdzYzBGK09EVUhFbjRa?=
 =?utf-8?B?UXBwT1dMbmhueHVWYkExRS9EWTN4VGpTVE4yTi9NNDFPQS9yVXAxbDhNcXUx?=
 =?utf-8?B?cnFFRjBEOXRWVkVIWEpURUErdmQrRDlEUDVsMk9vRi9YaEphdkNNWDRrejB6?=
 =?utf-8?B?cGp2N2tvUVpjdGVKd1JtRXVHYlhUU0VOVWFNa05qOTdXenE0cEZKQTFOMXlG?=
 =?utf-8?B?ZHp3SDZWMjlNeTZsZVgxQUlvVVg4QUMyNWxOc3o1M0wzbHg0QitwZHNVWjQ1?=
 =?utf-8?B?bGVDUTlWU3FlQ2lYSktHNnBFL0VibE15NUQ1blFOUGZIOEJLNGhJY3M0RlRs?=
 =?utf-8?B?YjAxL1JGNDZNZndsNGFtQzVSTkJjbU44N1FsdExYVEx1QnllYTZycmhVcy9x?=
 =?utf-8?B?UExNWDBSU25XTFlScGRydFhma21EcndWQWxveTZkV3BoeE0wTXlrcGdXOGV5?=
 =?utf-8?B?SjB5R2RVVnUxdVh1SWdZVnBndWlTSVUzZWpWbmFtb2FTRTZUdm4wNDNwdVVL?=
 =?utf-8?B?aUl0WnlSc2xLYTRTMXJHdWoycThkQVBwN3pBeG9zZUJXOUQwaU11STBSYzZs?=
 =?utf-8?B?MjRVYTNOMVVveDBFTGpKcWJ4U0V6SlVTUFgvdUJTOEtYM0JGZGc2eCtBNFVX?=
 =?utf-8?B?RHpPTFVlTGhyUEltZWpuS0ZMRGRXY0piUXNZR3pWaHI2ZlF0UUJFcXZoUmJl?=
 =?utf-8?B?YjF3VHE0a3FnYlU1NlFxQVBLRG9OWjB1bndadWFESjl5OTNWSXQxSkYzM0VX?=
 =?utf-8?B?bzhKeDBzWW5iNVpOYVVVUHVpeGFPcUFSQkJSTWhiem1PeXZFTUhWUXVQaElm?=
 =?utf-8?B?bURtMGNVK3Z3aDdMMXRRMzhOUDY4UHpmRlhHZC9pSEJ0VHZGamVQaWVUWFZP?=
 =?utf-8?B?enhOaWF1N3BMYlQ5NUdURUNMYnozVjUvOUZhdVo3V29JdUdPTlRISXNsYXVU?=
 =?utf-8?B?aWZId2ppQnNZQUxKRTBHYnZUMnU5NC9DTUQreXYwTktXWGZlUHhIcTUxVzdV?=
 =?utf-8?B?anl5RGpFaWdCZXc5Q214TCswSnlwNEVkb3hxSjJpa1pSMzJOS29QMVRtR21P?=
 =?utf-8?B?eGVJSWplWmRUMW5XWTg3WktCbkJGYkdpbVB2MnJVRkV6ZTVRSE1nWTF1RW1F?=
 =?utf-8?B?ZjF3TEpiQlM5OEhldTJMQzBZNWZBekpkclh2SVBxWjBHeFVORUVSbWp6VmhE?=
 =?utf-8?B?TGk2WVVnS0pxaUNXTmh1UThlUWZ0UUlvTjNCZ1dQNmpnbjZLaTZzbUEzUHVq?=
 =?utf-8?B?OGxDQytuREoyaTZMcDhXbC81VlJSUXlNdmxrSjdsUE9yaHBJbUk4ajFEVjIy?=
 =?utf-8?B?TGc3VWU3bDA0ZExNakNWSmNTSTZQZ1hmdUh3K0h4aVZGejRSM3dFd1dYWFRW?=
 =?utf-8?B?S0Rzd0orMG14NHE2SnU0YUFSc0RhVVE0ZG5wMkVZYXYvMkYxdFpRM0dnUGpT?=
 =?utf-8?B?MlRYcXEydmpueGxuNzNhbTVkZFg0TkU3QW5sZ2pyN2VDeFFSWTRRckJoZGFQ?=
 =?utf-8?B?YVJ4YTBGSlJJMmNhbC9wbXJ1blFUWE92WHFNOVBzQXVQMmNLR08xMEVLRUM5?=
 =?utf-8?B?Z1o0cEpJMHlqdVhvV3lEc2c0ZW1QS1VoTlI0b3ZPNUUvSE5oT0RGVDk2QldF?=
 =?utf-8?B?eUkxUXRESkR6MWJHTkE1bWxiK2hyY0NHVXI3Q1BaVTNTN1pLbCsxQ2R1elhW?=
 =?utf-8?B?V0JTZW5YQzBTSXh3WlRETERTSUt2aU9ocUt1L1JGMmtqOWxkUjdjMTJqN0hx?=
 =?utf-8?B?Y2k2RFk4TDh3WGhuSUZkam9RMHNzQVpNRkRNb3pReG1yZXB6SFhvd0tYb1d6?=
 =?utf-8?B?TXRNaTl5Wk1pRjFpZmFEY3ZLYjVSM0FYYnZScndGMWtMa2Y5ZFg2RnpSaGNy?=
 =?utf-8?B?bG9lTTBaeEQ4SU1jdFVRQ1JObzEvdEhDalMxQVRzYzMzN1hYMWd4MnJzTHdL?=
 =?utf-8?B?UDFyMXFocEZzNXBCT0tPa1RHVnFIY0IxQkpWKzNqU3A4Mjg5cURJUm5qdm1W?=
 =?utf-8?B?KzZUU3FwQzlNVm9sbGhrczBTcTdlVDExVUt1NFlDNzUzbE1hSzE3Q0pxUEVZ?=
 =?utf-8?Q?DLZjz//pwpFItfRRQHjYqWc5C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78216ba6-72af-4873-6132-08ddae00d22c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 00:41:10.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDx9ps3bCcv1ABgBQgx9jy5JZjF9nZ4rBGcPF1E5dNx+BoRft+WZKdP4MMQJNROWVmsOW/LnSd+1UphCLpu4xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 6/17/2025 3:27 PM, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Move the contents of arch/x86/lib/crypto/ into lib/crypto/x86/.
> 
> The new code organization makes a lot more sense for how this code
> actually works and is developed.  In particular, it makes it possible to
> build each algorithm as a single module, with better inlining and dead
> code elimination.  For a more detailed explanation, see the patchset
> which did this for the CRC library code:
> https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> Also see the patchset which did this for SHA-512:
> https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
> 
> This is just a preparatory commit, which does the move to get the files
> into their new location but keeps them building the same way as before.
> Later commits will make the actual improvements to the way the
> arch-optimized code is integrated for each algorithm.
> 
> arch/x86/lib/crypto/.gitignore is intentionally kept for now.  See
> https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
> I'll remove it later after some time has passed.
> 

After this change, arch/x86/lib/ has a lone empty directory crypto with
the .gitignore file.

Instead, would it be cleaner to get rid of the crypto directory
altogether and update the .gitignore of the parent?

As per the link above, commit 2df0c02dab82 ("x86 boot build: make git
ignore stale 'tools' directory") says this:

"So when removing directories that had special .gitignore patterns, make
sure to add a new gitignore entry in the parent directory for the no
longer existing subdirectory."

With that change,

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>


> Signed-off-by: Eric Biggers <ebiggers@google.com>

