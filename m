Return-Path: <linuxppc-dev+bounces-12235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8DBB57FF6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 17:08:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQT1w0QBzz3f3g;
	Tue, 16 Sep 2025 01:08:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757948915;
	cv=fail; b=jsASyxLbE4cOK8qinS6HXyRFuMMa9j5ZG8amf659CI7U6H8zCV8r5OgDxBE8YFR93+6OBh+Tm7ewod+HR+GzI06P8jdgp80lGzH5JcP3ct4kffdgDl930a0h7dmCcYDAaLA7w0O6/twt8ax2XZ3xojIVX0GbozqPSrIWseC9VvKFQuKR8oZ4wx5/AAopaKNHVEp93N2Xdu4XsI47P6mhBmbbfMZ1gzfZOaapwQvyhVv/JA/QqWY/I6Suf1u5QSNsTpUCzBPSJKwFiRQjvpNLxNZNxaDh7HHN2MxjFj4dXEx9VucfF4rn6CA6W5TUhFRJnL3DSmjzbqe98yM6vHx/pQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757948915; c=relaxed/relaxed;
	bh=pYuP6wVwtfqgsIuu1SzLMFP4JO7rdPiGIN4NRnyIL78=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F1zR9fJwyd5o1dkTPqH64j3JHW7ndCArVvvkfYKL80j9QNumDu/KdMJ0jAL/g2vSWFqutz0QHcbEnLDLbUP6ATgerXiAX2Wk6NDv1Q6TmLJmqHAoCiZjZ6HFJ5z859o7eQp+nE/Ya53OzL0KwgR95dgKCX+wY1v3ODJZl5U6VmQrSukcimKmTWd2EIoSHHWW1dF/32M9TOlP2QSN5id8A/2ypOSpPOI6zykt8Ic+DErW8/uQvLVyU56pFA82TYFR33XeZ2nw0dW9hDrA+QqLyuyiFUXAhI6ii/H2miPK8fo97bN/RyMCDhaXLu4V3cRk/4evATiYMWet+RrZ3FhheA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WHpbzYlk; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WHpbzYlk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQT1t4VW6z3dhR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 01:08:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757948915; x=1789484915;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t2uAyBWeuL0MrEULciMl/52mSqjiYbkDfuMKA0Fukts=;
  b=WHpbzYlkopPDFRv8WmXJ9s6pFZvJyfbb+tNJXZLmRQpSIxXnOJTnnGDW
   p62NMAjl7/pILO056QHZQT1OM3f9qlkBfho1h12UAUmfphTzqbeYxsCVs
   NUdiPEl2xyDwvaJ1o8Vwt147YOLVbykzzQNjRHQcnRXGCJxAhkkTSEQ3s
   Z+ygJb2StutUUseaEM7AU/LIUKMN8aWGQ3bX62eJJsZZPndb8btZouHOn
   kYmyE71uMZLBX6juBTZFI82cWcs2+JEKBu093d/OXOJJ7AA1y5z5CV6qd
   L6OJOwCujPzaiqagah+2jkHoAmrC4Sj/N+EIL+vVUEhwRQg8+Lt3Hk3N2
   Q==;
X-CSE-ConnectionGUID: KH0qUAgeTX6FhEyfq0SxXw==
X-CSE-MsgGUID: NpB0e41OTveAwvqdfH+Vqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60280473"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="60280473"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:08:30 -0700
X-CSE-ConnectionGUID: ychZaPkcQpy5gGyn+JjDQw==
X-CSE-MsgGUID: J/6Dh8zGTbGq5FnuUBXJ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="175086286"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 08:08:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:08:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 08:08:28 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 08:08:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbIl1CO/WRke4UULCNARhtzN364bKH2JF6mLzPo+oVvNGRTKf81gEL2pClpFcmhbDlAabiGctuGtWaZDbhX/Gb6s4b0JnrFw21DHpnHJiE/TYNTrANoPT8oOhr0sXbWV7sn4/8SMPxGmkAK1vCMjn1iyb6nYGbAPsW3dplbbwtq7ATuxOo3i17HMD4WdMFvx4FWSX4T1h/Rg+MHfGa/ARCnbzKGXe7sA6S5P8AcxGkU/psG0V6iUesEp4UTZCf7Pez5YHR3B1b7F7v1WiDr3CKX0TnOTQ3Lug7gY46yd3klxuqjqns/3ndbx0XUSRYi96vMX3keCUBX4S3A1OdGO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYuP6wVwtfqgsIuu1SzLMFP4JO7rdPiGIN4NRnyIL78=;
 b=FVxERm6Y3CdMCHMIrQQLyNN5qBg+qwHWXW8aKY8qs5BGoWCHeiK8E2eihAqfuRZhRiMA0cLgWJMchqaWfGYraVFvq8hbSP2HYfaMLlto3f/k9Ec5tjlonXoUvuYBq8raoXAOlEnPnoT4z/n0ynpaTsVRgKcSc4hV67FM57Hux6+3erB2Ia583rRfKk/BL5O5jwJhSWzOlr40J5XP60z5W/LA7IjRZpTL94fx8D9iuWbyH2AIUhMuBaAwxryfG3uXTFlN5iaFb6pnwOLkr6wxqrvTXFhp7aiDkkVtq0Y2FU4QuM0uGwLrpvYqVNgbd3YL/yuvnt3x8eeX33Mq/6Q42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPF75D68BA1B.namprd11.prod.outlook.com (2603:10b6:f:fc02::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 15:08:15 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 15:08:15 +0000
Message-ID: <067b6d80-1e37-4a73-a125-7975e670e315@intel.com>
Date: Mon, 15 Sep 2025 18:08:10 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/6] tools/perf: process auxtrace events and display in
 perf report -D
To: Athira Rajeev <atrajeev@linux.ibm.com>, <acme@kernel.org>,
	<jolsa@kernel.org>, <maddy@linux.ibm.com>, <irogers@google.com>,
	<namhyung@kernel.org>, <linux-perf-users@vger.kernel.org>
CC: <linuxppc-dev@lists.ozlabs.org>, <aboorvad@linux.ibm.com>,
	<sshegde@linux.ibm.com>, <hbathini@linux.vnet.ibm.com>,
	<Aditya.Bodkhe1@ibm.com>, <venkat88@linux.ibm.com>
References: <20250915072754.99850-1-atrajeev@linux.ibm.com>
 <20250915072754.99850-3-atrajeev@linux.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250915072754.99850-3-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::20) To IA1PR11MB7198.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: e1191b91-a76d-4729-2bff-08ddf469b1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0djdUVvRkpnTGdrL1hWYWdnQ0JwZndxekhaRDhmS1ZYR3l2aS92Vmt5Z3Ru?=
 =?utf-8?B?YWpNaGdOZ3BrVFhzK2pKNHdDUC9EcHNQR2NpNGQxNlgrTXZobnpXdXhRT2NN?=
 =?utf-8?B?NXlLK1BHRG5pY0ZIWkMreFlpeG5tblFXYzNTWDFPVUFuMjlVdDBmTHJsRHJt?=
 =?utf-8?B?NksxS3k1cUdDSVA4a3JXZElIUUVsc0lEdlY1blpIV0lMYjRmYlFXbXYxRFR2?=
 =?utf-8?B?UUhTeWFMUE9rZi9YUmZCbjB2ZzlyOHcxY3ZMNGhueUVWa3orMGFCZU0vQmt2?=
 =?utf-8?B?VlFrcHZFTEIzbEFpZjd1ZHA2a3ZscTJOSXIzcXJzRUEzRlFJbk9GK0pVMmdD?=
 =?utf-8?B?S2Y4OEV5L282SWtoeWNKK3ZaZ0dwVllnZnZyMGoxdmJybG8ycitEMXdzaVJD?=
 =?utf-8?B?RU9kTmJqREJRUHpVbXFsOTQ1T0s4VTZvcDIwTTRPTFRKMDV5RWM3QzhuRTBH?=
 =?utf-8?B?bFY3Y2J2OWg3WEZ5ZHdaWTJnZ1BCcUFlMG5ZZDVVdXVXb1RVblU3NGZlREpT?=
 =?utf-8?B?cFJmOWRlMkFtMGRVQVp5SmFiRFIvOWpCMFZwODk5V2JTWkJJaGp2anZOelRM?=
 =?utf-8?B?eE82QW5hY1FpalBJb1ZRZlJ4RnNjcnVRRCtHZ1JXdTBWV2N2Y3FLc3dScXZu?=
 =?utf-8?B?ZEpDYXJZdStLenRVbWt5NFc1MHF3MGtWc0pMMFptQjc0cEIyQlN3c3ZJMnFu?=
 =?utf-8?B?TzBJd0hmdm5sRm1saVdXSDFPajJUdjBmZzJSRk5Vcm9GQVNpeWtUUDJORk1U?=
 =?utf-8?B?RFN1a0RCd2doenpkbjZXc1ZYWjdvSWpFRTZBUXg4SzRNUzFLMi9Dbm9RQ0Jn?=
 =?utf-8?B?QmdmRmpLdUp2Qi94M3dhbGozSE8xOW5zMEFxMEJJUXltWk5LZlFJdDFJUGtL?=
 =?utf-8?B?VUV3bSs5bVlFMUx5ekU0WENGZjhMcUpJelZEWDV0R2cyekVoNVcvS01MblZ5?=
 =?utf-8?B?V3BDNjJ4YkJ1UU9Kd2o0TVhBN01CWnVYZzdzK2JUWjRjNnRtb0U3cUFEK042?=
 =?utf-8?B?Q3VOUmdlekw5M2NMcEdHRDZYdVJadUFCV3BkRjZ6WTJqZGZNTmVNRjNsbngy?=
 =?utf-8?B?dUtWZVFDNTVPU3FVemdCQVcyTHF1WlpIUnFiMks4czZBNjd3bU82RDNoSEsz?=
 =?utf-8?B?aFhZSU5ZNlZzUnBkTVppUjRoOHA0TjhuakFLc3NkazNJcFg1MXBOMm1aTURt?=
 =?utf-8?B?Q0lBanpFTnNXc2J0V3k4dWJKUmZuaXU3T0xYeXVqMERZZk5SRnl6RlUwbE4y?=
 =?utf-8?B?NUtReS8rRjRiZ2VWaFU1dFV1bk9seFlPUU5tc2UvVlBQSysvNTVPMFFrclMz?=
 =?utf-8?B?ZUR1MTlGSWxTQ3gzYVdjUzk5djN2SnBKZHozZHk5YmJmRHZ2ZnlFZm1Ecm9p?=
 =?utf-8?B?SjV0Ty85NkZYdndEdWFTd212UHdjbmlNdW15czJhQXZXNllTYlZxbmJpQU1G?=
 =?utf-8?B?WGhFN25oYmdOZ3hQUldBZlc1dUMvSEV4WGdNbC9ueVI3alBocUFvdkcrM0Rn?=
 =?utf-8?B?N21taGRKNnpycDM1czRTQkJGWHlvaVZqRTA2QXJJL3I2UGtLTythNnJnUStm?=
 =?utf-8?B?Q3A1aEdtU1Z3aEVpekx2UFJRZjdYWVEvMHdMbzkwTzNMb0hqNFUyZVhqTUxr?=
 =?utf-8?B?KzhBd2tNWXJLemxVTjQ5YzJ4eEtKVGgvSm9BakRQTjhJalJnRVRtbVFGRVRV?=
 =?utf-8?B?R3oxMlR0MmlJWmpnRmlMeXl0STh2UEkwWkhqazZCWFJDbFEwZDZMQy9iVzEr?=
 =?utf-8?B?TWMyengyTDR0NENjUmMvWWZTemFHd2VqSmowMEprRzJHVDVpZEppZlMvbU84?=
 =?utf-8?B?MThIRVcwdTFXbk56UFVOWE9yMHN5L1A4TkNoOXFjcEFEanBDTEtGV1RXenlY?=
 =?utf-8?B?WTlaRGJ6eWRRL0ZCVkZhMHlrMFZFcDU5WDRKSDVFQm5abTVqZTNDRnM0aWdK?=
 =?utf-8?Q?JlHrHqYd+uc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG0zYUJlN1hVcnpoUWY4dVMxZkVqUjhMSU1uL0x6TmxrZzV6S1NNazhWeEIw?=
 =?utf-8?B?RjhrMjdpR0FGdEpHYUNkOTNRZWE2NlpObDJwYkZuaGRMRk9aYVNvY202dnZM?=
 =?utf-8?B?WWFjdFBJZ01BaFBLODNSdDQyZHo0NDg5WnUzaVlRK1VoNFdUa2FTdmFIV3Nv?=
 =?utf-8?B?eG0zVUhRdVVyWlNwc3Q2eGVuNndMYmhLOTljeVRPWlJHNFJBWU9lK0dxYXZt?=
 =?utf-8?B?RVNLaTU1UUNMalhDYVR6b1hPWUJKVmlzbWFTMWRDRithdW5kbnFVUkVNaWdG?=
 =?utf-8?B?YWc5RVFENG1zMWlPa3pwSm9ESlRIU2lnNUlUcGI2Mm5UYmV4RXJFL3ozaTU4?=
 =?utf-8?B?dmljVzJXQ0xhKzJlYTh2OTFzTldTR3NhTVNYNHlsMUVoLzNtMlBJTUdncDNE?=
 =?utf-8?B?UnBBWUtiSWZNN1pINTdjOHRLQXg3eDFJdGpmSXcyUmtqS1JyL3docHVyWVF6?=
 =?utf-8?B?MEVkQmVhS2dmMEd4aFJrTGEwcmJxR0tZRnF2SlZ3RDhvRENrT3RjLzIxek05?=
 =?utf-8?B?RC9pQlZzUnI0MVBNbzhWb2MwNHdqdVdZbGRYdHpwNktDSnNDTC80Qlkzalhu?=
 =?utf-8?B?dEpBeHVQVDF2NExvSWQvSDNOUTYrZnJVZUFnb3NESFc3bWxERy9nWEV1enZL?=
 =?utf-8?B?M1hMU0NONnlzWE9hVExUc0hkSjIzNFFXeTh2KzV2eGF6bHY0RGZ6RTVLNkdw?=
 =?utf-8?B?NFhYLzYwY3FFMlNwcUh5MUdGTnlaNHNQbHgzSHVmeVBOaTRKbCs3QlU1aTRN?=
 =?utf-8?B?YzdIcGNuTHRxbXc0TWd5cEVxRGh6UXBhbkpuSFZFRW10djFKKytpMmhyVTF6?=
 =?utf-8?B?UVdrSnJISnBuZ0Z4amFQZDJOWEhIYW45RlgwZS95MWU1Y2xHWmh3ejU3aVFE?=
 =?utf-8?B?alZaNEpQSFFia2QrYXpSNStORkQzT2ZkTzFzZkVCdndpS0NkZzlyNUZEWVV4?=
 =?utf-8?B?U1Y5WWROTElNb2k4OHFsVTJ2Y28vVFVyWjNOTW90c2pkMmZiaWpobTlucnYz?=
 =?utf-8?B?UEljd0Exb2R6YWhjNXY2Z1pUV0FRZXgxVmFGQk53c3hlMnZOaStPMFJNUkFm?=
 =?utf-8?B?T0k2aitRNnI5Unh0bU9oWXdXRWp0MUVRVTJDMWNiaUJsNjlGbDY1ZTJELzFN?=
 =?utf-8?B?VVBhTW12NDV6Rnp1UU1xTXFZNXoyT0xZdGJ6dlJ2MlFtQ0dLdWV3ekJVK0N2?=
 =?utf-8?B?YnoreUNJQUNsZEVINkVNaXNTek1YWUFDMDQ4ZE1ZcUoyNXVaYzY5eEhyZkVJ?=
 =?utf-8?B?UVFGMmZyU0ZPbWNKaXFHTTV1ZUgxTVpRdnhjQWlOVkk4YkNCODRYWEZZaHB5?=
 =?utf-8?B?VVE2THlhUWcwaW1RWUhrOUI3ZmUwM0xnQVdBMmsxUmprbyswZXRWMUx2N3JY?=
 =?utf-8?B?ZisvcUREOGtGZ0t4UWpuZkdNQXZvc0g1L0VyclBQZ2oveUg0UXppWDA2Y042?=
 =?utf-8?B?eE9qb2NvZk9lWTNveEI0ZXhHWC9vK2s2eHFoeUlsYVROSkJLNWhDMHg5MWZj?=
 =?utf-8?B?Nno5bmRPTklDT2l3WnE4T0FJTUxXZTNvbHI5cDRBaS9CMTdUZXZkRE5PSnY0?=
 =?utf-8?B?NFVFb1NNMlk5emhDbG42RUcvdjVicndJMlpleG5FRUwrbVhVS0ZYUmNMaFhG?=
 =?utf-8?B?b096SEV3d20reE5DZVFiY0JSN3JrZndqLzNZandOa0hPcEhBb1k5Ris3Q2JJ?=
 =?utf-8?B?cmhyOGtwajZVbFlLVTI3U050WWloYmEwc1pWZVBYblZacXNJWHBaVFNMUjl0?=
 =?utf-8?B?S01ZbVNndzhQZ0U5L0Rzdzd0N29nVUdoT0JoSFZXNmdEUmRPb2RzQWo2cTNm?=
 =?utf-8?B?VWh4bFFLdDRlTjBIbWw4Sy9ZQXZIdFpCNFE3SFJnYVdWR3djckdIRjdZYTkr?=
 =?utf-8?B?QVJYMUQ5Y0R0RytnSmtzL1hpc0F5eFM2TGtub3BxMTdyVk1DR3IwK2pzb2Yw?=
 =?utf-8?B?Wlo2cXJEbHhlTEd5MnpSM3BDZEMydkZWekd3YjZkWnhJdEREQWdvU3FUd1RY?=
 =?utf-8?B?aGY3clNKc0Y3Q2ZBeUd4ZmVEZ0dwdFF4TFpvZUJhUng2TE43SVNnUXgyaUNQ?=
 =?utf-8?B?MTFlQ3A4TG9ZSDZkTUhCamtyc2wrRHpBdFdhSDlTT2liM2dFQ3JSMzVEZFZN?=
 =?utf-8?B?VTMzenNWbEpGdlVVNzNobFU1NzNMaDIrdTRzS1RHeVdOQkdPdUI5NExHd0lX?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1191b91-a76d-4729-2bff-08ddf469b1dc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 15:08:15.0962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCCgBYmXoecP/B6afaMT3QkgD1slwZJZfYmAnoiogbECj6vr7SH33ZfEVweOU/WFGErY/taZQ09tc8Z78Yp3yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF75D68BA1B
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/09/2025 10:27, Athira Rajeev wrote:
> Add vpa dtl pmu auxtrace process function for "perf report -D".
> The auxtrace event processing functions are defined in file
> "util/powerpc-vpadtl.c". Data structures used includes "struct
> powerpc_vpadtl_queue", "struct powerpc_vpadtl" to store the auxtrace
> buffers in queue. Different PERF_RECORD_XXX are generated
> during recording. PERF_RECORD_AUXTRACE_INFO is processed first
> since it is of type perf_user_event_type and perf session event
> delivers perf_session__process_user_event() first. Define function
> powerpc_vpadtl_process_auxtrace_info() to handle the processing of
> PERF_RECORD_AUXTRACE_INFO records. In this function, initialize
> the aux buffer queues using auxtrace_queues__init(). Setup the
> required infrastructure for aux data processing. The data is collected
> per CPU and auxtrace_queue is created for each CPU.
> 
> Define powerpc_vpadtl_process_event() function to process
> PERF_RECORD_AUXTRACE records. In this, add the event to queue using
> auxtrace_queues__add_event() and process the buffer in
> powerpc_vpadtl_dump_event(). The first entry in the buffer with
> timebase as zero has boot timebase and frequency. Remaining data is of
> format for "struct powerpc_vpadtl_entry". Define the translation for
> dispatch_reasons and preempt_reasons, report this when dump trace is
> invoked via powerpc_vpadtl_dump()
> 
> Sample output:
> 
>    ./perf record -a -e sched:*,vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>    [ perf record: Woken up 1 times to write data ]
>    [ perf record: Captured and wrote 0.300 MB perf.data ]
> 
>    ./perf report -D
> 
>    0 0 0x39b10 [0x30]: PERF_RECORD_AUXTRACE size: 0x690  offset: 0  ref: 0  idx: 0  tid: -1  cpu: 0
>    .
>    . ... VPA DTL PMU data: size 1680 bytes, entries is 35
>    .  00000000: boot_tb: 21349649546353231, tb_freq: 512000000
>    .  00000030: dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:7064, ready_to_enqueue_time:187, waiting_to_ready_time:6611773
>    .  00000060: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:146, ready_to_enqueue_time:0, waiting_to_ready_time:15359437
>    .  00000090: dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:4868, ready_to_enqueue_time:232, waiting_to_ready_time:5100709
>    .  000000c0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:179, ready_to_enqueue_time:0, waiting_to_ready_time:30714243
>    .  000000f0: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:197, ready_to_enqueue_time:0, waiting_to_ready_time:15350648
>    .  00000120: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:213, ready_to_enqueue_time:0, waiting_to_ready_time:15353446
>    .  00000150: dispatch_reason:priv doorbell, preempt_reason:H_CEDE, enqueue_to_dispatch_time:212, ready_to_enqueue_time:0, waiting_to_ready_time:15355126
>    .  00000180: dispatch_reason:decrementer interrupt, preempt_reason:H_CEDE, enqueue_to_dispatch_time:6368, ready_to_enqueue_time:164, waiting_to_ready_time:5104665
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
> Changelog:
> Addressed review comments from Adrian
> - Renamed dtl_entry to powerpc_vpadtl_entry in util/event.h
> - Removed unused #includes in powerpc-vpadtl.c
> - Added helper session_to_vpa to get "struct powerpc_vpadtl"
> - Updated auxtrace_queues__add_event only for piped data
> - Used zfree to free "struct powerpc_vpadtl_queue"
> 
>  tools/perf/util/Build            |   1 +
>  tools/perf/util/auxtrace.c       |   3 +
>  tools/perf/util/event.h          |  16 ++
>  tools/perf/util/powerpc-vpadtl.c | 263 +++++++++++++++++++++++++++++++
>  tools/perf/util/powerpc-vpadtl.h |   7 +
>  5 files changed, 290 insertions(+)
>  create mode 100644 tools/perf/util/powerpc-vpadtl.c
> 
> diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> index 4959e7a990e4..5ead46dc98e7 100644
> --- a/tools/perf/util/Build
> +++ b/tools/perf/util/Build
> @@ -136,6 +136,7 @@ perf-util-$(CONFIG_AUXTRACE) += arm-spe-decoder/
>  perf-util-$(CONFIG_AUXTRACE) += hisi-ptt.o
>  perf-util-$(CONFIG_AUXTRACE) += hisi-ptt-decoder/
>  perf-util-$(CONFIG_AUXTRACE) += s390-cpumsf.o
> +perf-util-$(CONFIG_AUXTRACE) += powerpc-vpadtl.o
>  
>  ifdef CONFIG_LIBOPENCSD
>  perf-util-$(CONFIG_AUXTRACE) += cs-etm.o
> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
> index f294658bb948..6d10f3d61ff8 100644
> --- a/tools/perf/util/auxtrace.c
> +++ b/tools/perf/util/auxtrace.c
> @@ -55,6 +55,7 @@
>  #include "hisi-ptt.h"
>  #include "s390-cpumsf.h"
>  #include "util/mmap.h"
> +#include "powerpc-vpadtl.h"
>  
>  #include <linux/ctype.h>
>  #include "symbol/kallsyms.h"
> @@ -1394,6 +1395,8 @@ int perf_event__process_auxtrace_info(struct perf_session *session,
>  		err = hisi_ptt_process_auxtrace_info(event, session);
>  		break;
>  	case PERF_AUXTRACE_VPA_DTL:
> +		err = powerpc_vpadtl_process_auxtrace_info(event, session);
> +		break;
>  	case PERF_AUXTRACE_UNKNOWN:
>  	default:
>  		return -EINVAL;
> diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
> index e40d16d3246c..7ba208ae86fd 100644
> --- a/tools/perf/util/event.h
> +++ b/tools/perf/util/event.h
> @@ -254,6 +254,22 @@ struct perf_synth_intel_iflag_chg {
>  	u64	branch_ip; /* If via_branch */
>  };
>  
> +/*
> + * The powerpc VPA DTL entries are of below format
> + */
> +struct powerpc_vpadtl_entry {
> +	u8      dispatch_reason;
> +	u8      preempt_reason;
> +	u16     processor_id;
> +	u32     enqueue_to_dispatch_time;
> +	u32     ready_to_enqueue_time;
> +	u32     waiting_to_ready_time;
> +	u64     timebase;
> +	u64     fault_addr;
> +	u64     srr0;
> +	u64     srr1;
> +};
> +
>  static inline void *perf_synth__raw_data(void *p)
>  {
>  	return p + 4;
> diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
> new file mode 100644
> index 000000000000..2e8488a3dbd7
> --- /dev/null
> +++ b/tools/perf/util/powerpc-vpadtl.c
> @@ -0,0 +1,263 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * VPA DTL PMU support
> + */
> +
> +#include <inttypes.h>
> +#include "color.h"
> +#include "evlist.h"
> +#include "session.h"

Should really also:

#include "auxtrace.h"
#include "data.h"
#include "machine.h"

> +#include "debug.h"
> +#include "powerpc-vpadtl.h"
> +
> +/*
> + * Structure to save the auxtrace queue
> + */
> +struct powerpc_vpadtl {
> +	struct auxtrace			auxtrace;
> +	struct auxtrace_queues		queues;
> +	struct auxtrace_heap		heap;
> +	u32				auxtrace_type;
> +	struct perf_session		*session;
> +	struct machine			*machine;
> +	u32				pmu_type;
> +};
> +
> +struct boottb_freq {
> +	u64     boot_tb;
> +	u64     tb_freq;
> +	u64     timebase;
> +	u64     padded[3];
> +};
> +
> +struct powerpc_vpadtl_queue {
> +	struct powerpc_vpadtl	*vpa;
> +	unsigned int		queue_nr;
> +	struct auxtrace_buffer	*buffer;
> +	struct thread		*thread;
> +	bool			on_heap;
> +	bool			done;
> +	pid_t			pid;
> +	pid_t			tid;
> +	int			cpu;
> +};
> +
> +const char *dispatch_reasons[11] = {
> +	"external_interrupt",
> +	"firmware_internal_event",
> +	"H_PROD",
> +	"decrementer_interrupt",
> +	"system_reset",
> +	"firmware_internal_event",
> +	"conferred_cycles",
> +	"time_slice",
> +	"virtual_memory_page_fault",
> +	"expropriated_adjunct",
> +	"priv_doorbell"};
> +
> +const char *preempt_reasons[10] = {
> +	"unused",
> +	"firmware_internal_event",
> +	"H_CEDE",
> +	"H_CONFER",
> +	"time_slice",
> +	"migration_hibernation_page_fault",
> +	"virtual_memory_page_fault",
> +	"H_CONFER_ADJUNCT",
> +	"hcall_adjunct",
> +	"HDEC_adjunct"};
> +
> +#define	dtl_entry_size	sizeof(struct powerpc_vpadtl_entry)
> +
> +/*
> + * Function to dump the dispatch trace data when perf report
> + * is invoked with -D
> + */
> +static void powerpc_vpadtl_dump(struct powerpc_vpadtl *vpa __maybe_unused,
> +			 unsigned char *buf, size_t len)
> +{
> +	struct powerpc_vpadtl_entry *dtl;
> +	int pkt_len, pos = 0;
> +	const char *color = PERF_COLOR_BLUE;
> +
> +	color_fprintf(stdout, color,
> +			". ... VPA DTL PMU data: size %zu bytes, entries is %zu\n",
> +			len, len/dtl_entry_size);
> +
> +	if (len % dtl_entry_size)
> +		len = len - (len % dtl_entry_size);
> +
> +	while (len) {
> +		pkt_len = dtl_entry_size;
> +		printf(".");
> +		color_fprintf(stdout, color, "  %08x: ", pos);
> +		dtl = (struct powerpc_vpadtl_entry *)buf;
> +		if (dtl->timebase != 0) {
> +			printf("dispatch_reason:%s, preempt_reason:%s, enqueue_to_dispatch_time:%d,"
> +					"ready_to_enqueue_time:%d, waiting_to_ready_time:%d\n",
> +					dispatch_reasons[dtl->dispatch_reason], preempt_reasons[dtl->preempt_reason],\
> +					be32_to_cpu(dtl->enqueue_to_dispatch_time),\
> +					be32_to_cpu(dtl->ready_to_enqueue_time), be32_to_cpu(dtl->waiting_to_ready_time));

Better if these lines were 100 columns or less

> +		} else {
> +			struct boottb_freq *boot_tb = (struct boottb_freq *)buf;
> +
> +			printf("boot_tb: %" PRIu64 ", tb_freq: %" PRIu64 "\n", boot_tb->boot_tb, boot_tb->tb_freq);

Better if this lines was 100 columns or less


> +		}
> +
> +		pos += pkt_len;
> +		buf += pkt_len;
> +		len -= pkt_len;
> +	}
> +}
> +
> +static struct powerpc_vpadtl *session_to_vpa(struct perf_session *session)
> +{
> +	return container_of(session->auxtrace, struct powerpc_vpadtl, auxtrace);
> +}
> +
> +static void powerpc_vpadtl_dump_event(struct powerpc_vpadtl *vpa, unsigned char *buf,
> +			       size_t len)
> +{
> +	printf(".\n");
> +	powerpc_vpadtl_dump(vpa, buf, len);
> +}
> +
> +static int powerpc_vpadtl_process_event(struct perf_session *session __maybe_unused,
> +				 union perf_event *event __maybe_unused,
> +				 struct perf_sample *sample __maybe_unused,
> +				 const struct perf_tool *tool __maybe_unused)
> +{
> +	return 0;
> +}
> +
> +/*
> + * Process PERF_RECORD_AUXTRACE records
> + */
> +static int powerpc_vpadtl_process_auxtrace_event(struct perf_session *session,
> +					  union perf_event *event,
> +					  const struct perf_tool *tool __maybe_unused)
> +{
> +	struct powerpc_vpadtl *vpa = session_to_vpa(session);
> +	struct auxtrace_buffer *buffer;
> +	int fd = perf_data__fd(session->data);
> +	off_t data_offset;
> +	int err;
> +
> +	if (!dump_trace)
> +		return 0;
> +
> +	if (perf_data__is_pipe(session->data)) {
> +		data_offset = 0;
> +	} else {
> +		data_offset = lseek(fd, 0, SEEK_CUR);
> +		if (data_offset == -1)
> +			return -errno;
> +	}
> +
> +	err = auxtrace_queues__add_event(&vpa->queues, session, event,
> +			data_offset, &buffer);
> +
> +	if (err)
> +		return err;
> +
> +	/* Dump here now we have copied a piped trace out of the pipe */
> +	if (auxtrace_buffer__get_data(buffer, fd)) {
> +		powerpc_vpadtl_dump_event(vpa, buffer->data, buffer->size);
> +		auxtrace_buffer__put_data(buffer);
> +	}
> +
> +	return 0;
> +}
> +
> +static int powerpc_vpadtl_flush(struct perf_session *session __maybe_unused,
> +			 const struct perf_tool *tool __maybe_unused)
> +{
> +	return 0;
> +}
> +
> +static void powerpc_vpadtl_free_events(struct perf_session *session)
> +{
> +	struct powerpc_vpadtl *vpa = session_to_vpa(session);
> +	struct auxtrace_queues *queues = &vpa->queues;
> +	struct powerpc_vpadtl_queue *vpaq;
> +
> +	unsigned int i;
> +
> +	for (i = 0; i < queues->nr_queues; i++) {

Modern style allows int decl. inside for() e.g.

	for (int i = 0; i < queues->nr_queues; i++) {

> +		vpaq = queues->queue_array[i].priv;
> +		if (vpaq)
> +			zfree(&vpaq);

free() can handle NULL, so vpaq not needed, just

		zfree(&queues->queue_array[i].priv);

> +	}
> +
> +	auxtrace_queues__free(queues);
> +}
> +
> +static void powerpc_vpadtl_free(struct perf_session *session)
> +{
> +	struct powerpc_vpadtl *vpa = session_to_vpa(session);
> +
> +	auxtrace_heap__free(&vpa->heap);
> +	powerpc_vpadtl_free_events(session);
> +	session->auxtrace = NULL;
> +	free(vpa);
> +}
> +
> +static const char * const powerpc_vpadtl_info_fmts[] = {
> +	[POWERPC_VPADTL_TYPE]		= "  PMU Type           %"PRId64"\n",
> +};
> +
> +static void powerpc_vpadtl_print_info(__u64 *arr)
> +{
> +	if (!dump_trace)
> +		return;
> +
> +	fprintf(stdout, powerpc_vpadtl_info_fmts[POWERPC_VPADTL_TYPE], arr[POWERPC_VPADTL_TYPE]);
> +}
> +
> +/*
> + * Process the PERF_RECORD_AUXTRACE_INFO records and setup
> + * the infrastructure to process auxtrace events. PERF_RECORD_AUXTRACE_INFO
> + * is processed first since it is of type perf_user_event_type.
> + * Initialise the aux buffer queues using auxtrace_queues__init().
> + * auxtrace_queue is created for each CPU.
> + */
> +int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
> +				  struct perf_session *session)
> +{
> +	struct perf_record_auxtrace_info *auxtrace_info = &event->auxtrace_info;
> +	size_t min_sz = sizeof(u64) * POWERPC_VPADTL_TYPE;
> +	struct powerpc_vpadtl *vpa;
> +	int err;
> +
> +	if (auxtrace_info->header.size < sizeof(struct perf_record_auxtrace_info) +
> +					min_sz)
> +		return -EINVAL;
> +
> +	vpa = zalloc(sizeof(struct powerpc_vpadtl));
> +	if (!vpa)
> +		return -ENOMEM;
> +
> +	err = auxtrace_queues__init(&vpa->queues);
> +	if (err)
> +		goto err_free;
> +
> +	vpa->session = session;
> +	vpa->machine = &session->machines.host; /* No kvm support */
> +	vpa->auxtrace_type = auxtrace_info->type;
> +	vpa->pmu_type = auxtrace_info->priv[POWERPC_VPADTL_TYPE];
> +
> +	vpa->auxtrace.process_event = powerpc_vpadtl_process_event;
> +	vpa->auxtrace.process_auxtrace_event = powerpc_vpadtl_process_auxtrace_event;
> +	vpa->auxtrace.flush_events = powerpc_vpadtl_flush;
> +	vpa->auxtrace.free_events = powerpc_vpadtl_free_events;
> +	vpa->auxtrace.free = powerpc_vpadtl_free;
> +	session->auxtrace = &vpa->auxtrace;
> +
> +	powerpc_vpadtl_print_info(&auxtrace_info->priv[0]);
> +
> +	return 0;
> +
> +err_free:
> +	free(vpa);
> +	return err;
> +}
> diff --git a/tools/perf/util/powerpc-vpadtl.h b/tools/perf/util/powerpc-vpadtl.h
> index 50a7aa24acbe..aa76f5beac2c 100644
> --- a/tools/perf/util/powerpc-vpadtl.h
> +++ b/tools/perf/util/powerpc-vpadtl.h
> @@ -15,4 +15,11 @@ enum {
>  
>  #define VPADTL_AUXTRACE_PRIV_SIZE (VPADTL_AUXTRACE_PRIV_MAX * sizeof(u64))
>  
> +union perf_event;
> +struct perf_session;
> +struct perf_pmu;
> +
> +int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
> +				  struct perf_session *session);
> +
>  #endif


