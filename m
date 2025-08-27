Return-Path: <linuxppc-dev+bounces-11388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82099B388A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 19:29:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBs3N2wBBz3bmQ;
	Thu, 28 Aug 2025 03:29:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756315776;
	cv=fail; b=FrYdru0mSX969ntmipF0DVcOsIbmr+Fh45rfmBgBFiR+7/VB7OUPKvf/NeKujzi1jH9HRaLuYzrx/VB0Wp65aXl7amzEFRZvgt4J83y/I0WzTtT9M9eagy/TsFCJqD3vk3Tdt7VKXTP1z5F0UEuzsoF8516iKHsBW1/a51Ommmw4uGn8c+ILFAEj3nEbFsTJbzZOjKAFG5byUSyKhDFderr+rPTjytGhGm01b3eBjd40yHoKZxvgWheDP/RsSshRrq3QVnDnzzUnvT+lKSKnG75ibKfzx1sehksHua4ldq5wAqQKMW6UNdIfLqouEWwSxhrsoXGtT0DG8i284c2x5A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756315776; c=relaxed/relaxed;
	bh=8IY2lIORnX3SqNsxKsNyzh7RxcJkwb5otBJkCZMUkRE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FtbWy3eL0hTdRCFgp1d67pbnVzHHLXQTlxFol04pGaBMvX/Ezpgbe6X0JD+FkQnabIP/lXd9ZIVvFm4zAAY3ZQFT+dG3vqE2EZ2ada/NXJnfe1MFcGpVUDpmCUeX8RWnTNlMeiuLRkY9jbv981aPt7FAa2GZdqCu8PM1C1fgzq2ARAhJKGxZMQsUOVAmEJJUxE1PqRm7bRCgrJzJ6vBLvpP+YOnPKTQOgRrX4pThzc2/mVgQ//ZSMi9CN7P0EiS9DmNusKom4Xr/SL0kMs9pPGIdJP09BcRBvlgocTBfshUmNYpB07Wdx2P++w6YvWDSxA0wlyBFyHiciEDhqTfMBw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LwU4lV+0; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LwU4lV+0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Thu, 28 Aug 2025 03:29:34 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBs3L5jM3z3blg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 03:29:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756315775; x=1787851775;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6quuPsSDu8evbF/p04exeRxz9FyzdZ3GIqRKHb+uftw=;
  b=LwU4lV+0+4zlL3u210r3aF5GubHb8HqVGHA0wVzG+QDmoTxBoROH+vFb
   VHqPosMnS97/WOjQ4yYRVoMVTaeq4MfFkR8RgXfxQ4MfxkyRvYlJPCBht
   wdavIA00JIoXFPwFsADK2W1xnyj6DU0B0gM8SUv7112XgdOG2IjIt1Dyj
   bHf4D+CHt0CeYBBGFqJcB6Q520LF4xyuGwTPvYZt/Tv3XOblkQXxWan+Z
   CUtTUtQc171Z/19i3dBE9VbdLcBwcpe+vbsAXsebYxmmPPoDNVVx28lAw
   aSZZWz86rgruEw4uyCtTZ+ZNd/kl2KWk2FRgz7gNMocj3RwvgUmn/xVPT
   A==;
X-CSE-ConnectionGUID: J+E2M6aYRU+2GWEoHroL4g==
X-CSE-MsgGUID: I0kbiptIRBec6tG4VIAFDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58642754"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58642754"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:28:02 -0700
X-CSE-ConnectionGUID: AB4jStmjRtm+UjJ+Y73C6Q==
X-CSE-MsgGUID: J5kg8lUvSPiLELFCOED93w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="169825962"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:28:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:28:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 10:28:00 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.58)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:27:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nktzmjG6jXEhNUxmw6FmZPMdCxFYvrYTq83bbNO4L3sDjcxc1I4nSFe8taUeuJ048qAaHuXlkpHfIcEH0dlws5wmlNtLs2ypF/kUCskp74gXdKmZmKhCOpR2/oTCQPsuguZKHZ+/Nvo7i0QJP/NwEYC0dWiesvO9qQZTtV2lM9OKiIMRQv9OPK2tsS8ThHqllhEvFaqxkcbSxx8f69jFs7O/fzf6L5WlKQwTYLSpeAKqukI5pk99L5fKl3X/or2yrTWJi993G2kx8XWu4J0bH6Qr7IKK8AFMZrCuqQ+hWJq0hYL5tEv8+gZS7ze+8LrhJ1VsXB4CBvFUBnyUSOHXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IY2lIORnX3SqNsxKsNyzh7RxcJkwb5otBJkCZMUkRE=;
 b=cs+Ph/teVT1oToW2xr8oWAUjAZG+WeR5VNFe8n0Zxu6lUqFtov0BgBhxI/kCc4S6YC6awn/60VpnR2I8qnRNGVPfrwCwO6sPPlDhLbD6UdTi6nMJAk94FJp08/YNLe8fhjyopiWreQEDCLrbtPusCkFT1YqkgzsU3UwpknI11WvCuZwst4PjuypW3lq1bQEhDLbt5ifmn1iwARRviAOpkhr9Ac9S6Y6Xwlv5335O7/k2USV3gsJBCy3V/MqSPDsWHVVd9z7zImZikSW69U4XlaVS0uSvgqKOe+JourskkV9Go+d1ariK14LOkRJcf3QrIxLAkuF/kz67pCA3KITe8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM3PPF529E923C8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 17:27:57 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 17:27:57 +0000
Message-ID: <fae72739-8df2-463d-8d1f-e3ae1e36f781@intel.com>
Date: Wed, 27 Aug 2025 20:27:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] tools/perf: Add basic CONFIG_AUXTRACE support for
 VPA pmu on powerpc
To: Athira Rajeev <atrajeev@linux.ibm.com>, <acme@kernel.org>,
	<jolsa@kernel.org>, <maddy@linux.ibm.com>, <irogers@google.com>,
	<namhyung@kernel.org>
CC: <linux-perf-users@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<aboorvad@linux.ibm.com>, <sshegde@linux.ibm.com>, <kjain@linux.ibm.com>,
	<hbathini@linux.vnet.ibm.com>, <Aditya.Bodkhe1@ibm.com>,
	<venkat88@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <20250815083407.27953-8-atrajeev@linux.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250815083407.27953-8-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0046.eurprd06.prod.outlook.com
 (2603:10a6:10:120::20) To IA1PR11MB7198.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: d479d3fd-5bd0-4fb0-1a18-08dde58f1000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTNlSUV1OTFldk5NOHROUHUrSURLS0Rqb0lDaDRVUHlmRzhhTUc5ZFBzNWtD?=
 =?utf-8?B?RXNYd29hVCtyeGpqS0hWNGZqMUh5bmphdWpzaDdOZURiNnlLUzlXdDA5QnNK?=
 =?utf-8?B?TEZiaGxCUi9HWThYNm00VkdkaTROcmN4M0VZS0Exc1BYbytWZkw2YUFTSnBq?=
 =?utf-8?B?dXBKSk5WU1FFSHJ1VWk5dFNrOGM4YXNDaThKRlRuM3dHUlBkT1c1Z3lSRWlX?=
 =?utf-8?B?MllKYm0wMG85MlU3ZWhPenF6VXRURTVNVmpMSnRCU1FiOUtLc2x0V2ZObWVx?=
 =?utf-8?B?VEpuN2JxdUxRQU1FblJUNEg3MlpreVlTMHdoNldMdFNQemRabnlsTXBTT1U2?=
 =?utf-8?B?Y1pOUFMzeFhXSVVjSHJhbkV3cmFkckx6Um1XUFlpNzlTMkJwY3lpUFJEd1Fp?=
 =?utf-8?B?SmVMam8wN0JMYWRsM2x0cE1UQlc1VUlDbHB0ekRtdjdwQmZ0TCtLdkxlNnNC?=
 =?utf-8?B?WHl3a2ZGZlpscHZqTktYeHdZNUdSQVBMa0UxK2dqb3ZETzY3b3ppdVZJaytu?=
 =?utf-8?B?T3VrNytUZ2J0UVozZmFVU3hsS0Z1NklBS1ExN3R0S05jajJ6emtNTDNxOFY4?=
 =?utf-8?B?NHlGR1NnTDg0bEpZTWdqK0dxelk4NkV0M21ySWRERHdjbm1RTnROUzY4L1Ur?=
 =?utf-8?B?V1VSZUxMeDBWampjSURCRHJ3K0tLeFVrOGxZWTVaaXBnbFRwWUFpVTN3b0o3?=
 =?utf-8?B?SXliVCt6MEUwSVdnTWlyNnlzYmh2cS82OFpoYzJGbUFPZU1yekdkaGhHYVhU?=
 =?utf-8?B?OURaamM3QmViVkhHUEk5eWpwK21DNjl0MkRvcDB0YzRvQXhpSG05QkdEL0U3?=
 =?utf-8?B?ME0xb2tzcS9VMzFXNXM0Y3Z2ZGY1Wlo2a1RONjVlWTRDNVlWdzR4Y3hKZFB2?=
 =?utf-8?B?bjNNdlhEbmltOHhLamk0YWlYWk5JUmNXUCtLRmVqODhWam1CYWFvWkx5dHR4?=
 =?utf-8?B?SHg3b0R5NHhVc2lkaGREV2xjWlcrSHNTUnNUTG1zaGptV1F1cDFOcWU0MDlU?=
 =?utf-8?B?VC9Bd0phVlBOK1hlSnRWRWxUenlGMXBtUHVCSGI0OUl0ak5aUlNRbm5Rcjgv?=
 =?utf-8?B?NjQ4SGx0S29hY2Q1RHIzZnlSUE1DSnNCS1VQU0NQckphWi8wT2h6NnJYNzNm?=
 =?utf-8?B?WERSY3BnMnNCUnBGeXhuVVRRWGY3YzIybUU5K2dnem5qN3ViNGhkSTNFSER1?=
 =?utf-8?B?SWdnazlVeUppbUtvYWhSMnpIMm9vMFp0cWNZSHNKRm5Rc2FWM2IrNTNZNTlI?=
 =?utf-8?B?M0oxZ2VSOWNkTnFsWDJDSFFmcWdQc3J3czJsellJTWIvemVGV0NTOUpySWFC?=
 =?utf-8?B?cTZTUlFlMVFWZ3dZRUpJeHVsUjdZWEIzRzZGTFh5WjZkWHV4dEszRFdqem50?=
 =?utf-8?B?bUZOS2xaTWRPUU1CdWhuaEF3dVNJUlNDRk5TU1ZlZE4vSUlhNmlPZ1FnLzYy?=
 =?utf-8?B?Y0tPTlpsYlkrWkdNM2x3N0NmbzMyKzlHK3lGSFhhVWpJVGp2TjNTdVdXUjNw?=
 =?utf-8?B?TERFNGY2V0lYY2l3T3J3UW9IbVMzNlRsYTYzbnBRTUh3L3NiRUIwKytpWEsy?=
 =?utf-8?B?c0c3YUh6RmlqcTZ2UE5nWXZRSTZ0c1Q1bXdZdEdxUThqL1FCY2F2SDRJZGNs?=
 =?utf-8?B?Uzk1cVpWVGhqaXJhaVRwMzlWNE1oZFh5aCtBQ3o3UGE0b1VJNlYyWnZITXVR?=
 =?utf-8?B?M0pWOHhQZFd3ekYvdWhlZ2JsTk90c250ZjdQZE1iUTlWaEVQYllkdjIrdFNM?=
 =?utf-8?B?VlN1SXdUUHZ2NU13NjI5RGVHbFVwTDhENGJDYmNudzlNeGlNZVJpU0J3NHdp?=
 =?utf-8?B?bmZtZlZSY2RPdnNQdzQ1YXVVcU1TSDJ2RnZhOEUzLzZ3dlBKMm9FTVFkOVo2?=
 =?utf-8?B?d0YvRUlUZTdWOHFia2lJQzhHYlI5Z1B0TjRyK1JwL2hoMTNTdU1TL1pYMGZN?=
 =?utf-8?Q?00IVudF39gE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3kvU2VrOUJyMmtsUmxaRmpsckNHM3RuaDRRdkUvNUhlR0xtRW9DWGtOM00w?=
 =?utf-8?B?Y3plR3Z1c1lxZTRQL2NLWFhmTXN6YUZaaGs3eWNTeGh6WkhRUXhYTDM3Titz?=
 =?utf-8?B?eVNQMW1ycXNIWWtQMW1SVFBRNmJ4RlhMWGpaY3lYZDdWMmhtd1JpMnBGRWNI?=
 =?utf-8?B?em9xUzAzQ0VhRzd4UWVrZUliNCtQVnd1QjVxZDFYbHdmNzBOOGJObmZpUEFi?=
 =?utf-8?B?YU55ODVRYXV3dzdUT2psV1E5WHBBcUhDSGQ0K3RRVndJSXE0WUVlejNYRVFK?=
 =?utf-8?B?NDA4b1VxV2tFWjdUMmhka1RQL0lQbUFucTFlT0lvQnBlNlVjYW9TTGhQQ2lk?=
 =?utf-8?B?U2lQUEp0Y09jeVZGYXlUTHlwa3V2YzB4MTlkQ080ZjVTU1pDYnN2WTVrZElz?=
 =?utf-8?B?b3NoamtNZzBoNXIwVGFSVEVLUERRSUhRT1A3K2tnS1Y3UCtqNlA2ODF3TVhW?=
 =?utf-8?B?ME53UVE1bmo2QlpQRFdnYXVPMEQ5TUd2aFlGem1qcFFYNXhZTVdMVWZyWkQz?=
 =?utf-8?B?LzhENzNCVmJzaFJkYkRRVzMySXB5aEx6UUU2T2ZhZzZSUlg2WGlNc2dad1pZ?=
 =?utf-8?B?UDZzV3FhTldDUFlLMlhyS2RNLzhqdytjTGxONm83TXIrdndQSEQ1MmpIUWJD?=
 =?utf-8?B?cWx3dmVJZEZDbDE0Wmd1VG9xRHFWQ0ZmNFoxZXEvSVJlMlJkYnZpQVRVYkRu?=
 =?utf-8?B?cTF2UFdMY1lueGpEUlBVWWZRYWM0Z0E2S1pIYUNPUkpLSEN0QThoL0lFNGVu?=
 =?utf-8?B?UlFhdmdGTG53MEpzRGo2RnFqaTJBRysycVFhNHV3Qi9qRVRFQzdpVEhmbS9n?=
 =?utf-8?B?Y3BpSHQzM0NLMFl5MWpJYjl5czlscDZOSDg3cFVEWXRGOXNsVmFRWSt4SDdO?=
 =?utf-8?B?V0wxNHQ5bmJCQmNVTDR5dmFQNFMzWGhhY2JFNVI1ZGRiQjNPb011SGVkak5k?=
 =?utf-8?B?aHBTSWlINThVM0U5Ny9SWXNQdE1RSlM3WHA1b1lUSWN2MzRVekdkaTcrRVQz?=
 =?utf-8?B?VGVONThmam1lQ2NmaE5hWDJ2Q1Y3akE2eUpFcmJYRHA4WThrSysrQ2x0T0R2?=
 =?utf-8?B?bUdQZDhXZmhvK1ZuOGtvMy83ejZ2eGhyaUYrWXhXYkcwTWN3M2tGd3B4cWdI?=
 =?utf-8?B?bS9jTW45VS9zUmNWb1h4WXBnNDRaZCt2ZzVMWmhiT1JoaHloc3BkTHV2NFZm?=
 =?utf-8?B?VVFqdGp3bjhpUXpEYUxvQ3IxWGQycTh0ZFN2MUhmYzNKdklqVnNYQ1ViZjl1?=
 =?utf-8?B?aWRaUEREajBGcHBNZ3krRVk2OXR2d2M2R3YzTE16eUMrUU1zSnUwcjJrTnRs?=
 =?utf-8?B?MXVjVFM0djJZR1FaTmg2NVJScWRTUWlFVW5DRTNwUjh3K0pqOXVwZFZQQTkr?=
 =?utf-8?B?N1lSYkJrZSt3TzVHYkcrSVNaL2FDYXlSREdISnBnbW05RDNFWnlUZ1g0N09P?=
 =?utf-8?B?c2l3cEg2WU1icWVZTi81R0x4ZHpMam5pSmlPL3Q5N1RTb1hwRU1lVm9mWGN1?=
 =?utf-8?B?NER3RkpLbklXNWFjcHkzOFVCT0JOZGY1QWpuTnVwTUJrdVAxdU1vaGNGY3ln?=
 =?utf-8?B?S3l6d1hsNHc1NXBhWUJDWVhxUzhUd0JPbEM5VVdVR3NKV2JEZlNTTE9PYWJn?=
 =?utf-8?B?TXVDMm1SLzVLYjRQdDYwdjVXdDdpam1BVkhNUnFvUlhVRHlobWVaSGJWa2dm?=
 =?utf-8?B?d3RmZDhwekRlK0MzT2dOem9BUFlKR20xWkJnUzJQWjByNmY0VnNydGsvZXQx?=
 =?utf-8?B?R3kzaEVWK3gyalZBbUtMOUZYUWQwdTlUM1JhZXpnVVV0VGhsb2t5TkdFa3lM?=
 =?utf-8?B?OG1QRjlOT0tlZVpOKzRiYnlZcDRvZ1g0NlAvUUYxMXZ5WFY5M053OHUyc05R?=
 =?utf-8?B?RWhDS1R6QUNqcXNzVjl6WUJUOHFSS09PVDhXSEptRUZPR3NVbklOemx6SlZv?=
 =?utf-8?B?L1V2ak9xT3Z2VERaZWFBRUUyaUx4ZThtOTZyeDF1a1pTVGU3WDgzRjNCWmJI?=
 =?utf-8?B?K3pEdXNNMllMWGlJcnJtaENqamxSb1M3cG9LclROWXdqV2VXSWwvazZtK1Vp?=
 =?utf-8?B?N29MYjVBVnNuSWNjNEkyVkxrN25xbTIweWxlOWNtZVFzYlhEY0hTY1N1bW9r?=
 =?utf-8?B?MmtGdWF1aE9OczdIbkU5QWczaDJOZUIxems4eEdsVmtRaFVnb2JEN2RxZU1a?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d479d3fd-5bd0-4fb0-1a18-08dde58f1000
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:27:57.1315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4q7OpDP6E+1y8vQM3ym6mHrRP9dDx3rSvuzAS04PrmKOqY3fOkFbGd+XzUhxUwMehjKn6l8VZkv6ygWgLfcwLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF529E923C8
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/08/2025 11:34, Athira Rajeev wrote:
> The powerpc PMU collecting Dispatch Trace Log (DTL) entries makes use of
> AUX support in perf infrastructure. The PMU driver has the functionality
> to collect trace entries in the aux buffer. On the tools side, this data
> is made available as PERF_RECORD_AUXTRACE records. This record is
> generated by "perf record" command. To enable the creation of
> PERF_RECORD_AUXTRACE, add functions to initialize auxtrace records ie
> "auxtrace_record__init()". Fill in fields for other callbacks like
> info_priv_size, info_fill, free, recording options etc. Define
> auxtrace_type as PERF_AUXTRACE_VPA_PMU. Add header file to define vpa
> dtl pmu specific details.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
>  tools/perf/arch/powerpc/util/Build      |   1 +
>  tools/perf/arch/powerpc/util/auxtrace.c | 122 ++++++++++++++++++++++++
>  tools/perf/util/auxtrace.c              |   2 +
>  tools/perf/util/auxtrace.h              |   1 +
>  tools/perf/util/powerpc-vpadtl.h        |  26 +++++
>  5 files changed, 152 insertions(+)
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
> index 000000000000..ec8ec601fd08
> --- /dev/null
> +++ b/tools/perf/arch/powerpc/util/auxtrace.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * VPA support
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/bitops.h>
> +#include <linux/log2.h>
> +#include <time.h>
> +
> +#include "../../util/cpumap.h"
> +#include "../../util/evsel.h"
> +#include "../../util/evlist.h"
> +#include "../../util/session.h"
> +#include "../../util/util.h"
> +#include "../../util/pmu.h"
> +#include "../../util/debug.h"
> +#include "../../util/auxtrace.h"
> +#include "../../util/powerpc-vpadtl.h"

It would be better to only add #includes when they are needed

> +#include "../../util/record.h"
> +#include <internal/lib.h> // page_size
> +
> +#define KiB(x) ((x) * 1024)
> +
> +static int
> +powerpc_vpadtl_parse_snapshot_options(struct auxtrace_record *itr __maybe_unused,
> +				struct record_opts *opts __maybe_unused,
> +				const char *str __maybe_unused)
> +{
> +	return 0;
> +}
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
> +	return 0;

	return VPADTL_AUXTRACE_PRIV_SIZE;
> +}
> +
> +static int
> +powerpc_vpadtl_info_fill(struct auxtrace_record *itr __maybe_unused,
> +		struct perf_session *session __maybe_unused,
> +		struct perf_record_auxtrace_info *auxtrace_info __maybe_unused,

auxtrace_info is not __maybe_unused

> +		size_t priv_size __maybe_unused)
> +{
> +	auxtrace_info->type = PERF_AUXTRACE_VPA_PMU;
> +
> +	return 0;
> +}
> +
> +static u64 powerpc_vpadtl_reference(struct auxtrace_record *itr __maybe_unused)
> +{
> +	return 0;
> +}
> +
> +static void powerpc_vpadtl_free(struct auxtrace_record *itr)
> +{
> +	free(itr);
> +}
> +
> +struct auxtrace_record *auxtrace_record__init(struct evlist *evlist __maybe_unused,

evlist is not __maybe_unused

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
> +		if (!strcmp(pmu_name, "vpa_dtl")) {

pmu_name is leaked but strstarts() could be used instead
of above

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
> +	aux->parse_snapshot_options = powerpc_vpadtl_parse_snapshot_options;

Doesn't look like snapshot mode is supported, so
powerpc_vpadtl_parse_snapshot_options() is not needed

> +	aux->recording_options = powerpc_vpadtl_recording_options;
> +	aux->info_priv_size = powerpc_vpadtl_info_priv_size;
> +	aux->info_fill = powerpc_vpadtl_info_fill;
> +	aux->free = powerpc_vpadtl_free;
> +	aux->reference = powerpc_vpadtl_reference;

reference is optional.  powerpc_vpadtl_reference() stub is not needed

> +	return aux;
> +}
> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
> index ebd32f1b8f12..f587d386c5ef 100644
> --- a/tools/perf/util/auxtrace.c
> +++ b/tools/perf/util/auxtrace.c
> @@ -55,6 +55,7 @@
>  #include "hisi-ptt.h"
>  #include "s390-cpumsf.h"
>  #include "util/mmap.h"
> +#include "powerpc-vpadtl.h"

Isn't needed yet

>  
>  #include <linux/ctype.h>
>  #include "symbol/kallsyms.h"
> @@ -1393,6 +1394,7 @@ int perf_event__process_auxtrace_info(struct perf_session *session,
>  	case PERF_AUXTRACE_HISI_PTT:
>  		err = hisi_ptt_process_auxtrace_info(event, session);
>  		break;
> +	case PERF_AUXTRACE_VPA_PMU:
>  	case PERF_AUXTRACE_UNKNOWN:
>  	default:
>  		return -EINVAL;
> diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
> index f001cbb68f8e..1f9ef473af77 100644
> --- a/tools/perf/util/auxtrace.h
> +++ b/tools/perf/util/auxtrace.h
> @@ -50,6 +50,7 @@ enum auxtrace_type {
>  	PERF_AUXTRACE_ARM_SPE,
>  	PERF_AUXTRACE_S390_CPUMSF,
>  	PERF_AUXTRACE_HISI_PTT,
> +	PERF_AUXTRACE_VPA_PMU,

Everything else is called some variation of vpa dtl, so
PERF_AUXTRACE_VPA_DTL would seem a more consistent name

>  };
>  
>  enum itrace_period_type {
> diff --git a/tools/perf/util/powerpc-vpadtl.h b/tools/perf/util/powerpc-vpadtl.h
> new file mode 100644
> index 000000000000..625172adaba5
> --- /dev/null
> +++ b/tools/perf/util/powerpc-vpadtl.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * VPA DTL PMU Support
> + */
> +
> +#ifndef INCLUDE__PERF_POWERPC_VPADTL_H__
> +#define INCLUDE__PERF_POWERPC_VPADTL_H__
> +
> +#define POWERPC_VPADTL_NAME "powerpc_vpadtl_"
> +
> +enum {
> +	POWERPC_VPADTL_TYPE,
> +	VPADTL_PER_CPU_MMAPS,

VPADTL_PER_CPU_MMAPS is never used

> +	VPADTL_AUXTRACE_PRIV_MAX,
> +};
> +
> +#define VPADTL_AUXTRACE_PRIV_SIZE (VPADTL_AUXTRACE_PRIV_MAX * sizeof(u64))
> +
> +union perf_event;
> +struct perf_session;
> +struct perf_pmu;
> +
> +int powerpc_vpadtl_process_auxtrace_info(union perf_event *event,
> +				  struct perf_session *session);

None of these definitions are used in this patch, although probably
VPADTL_AUXTRACE_PRIV_SIZE should be.
It would be better to add definitions only when they are needed.

> +
> +#endif


