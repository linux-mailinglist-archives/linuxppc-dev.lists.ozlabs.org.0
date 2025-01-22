Return-Path: <linuxppc-dev+bounces-5485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18DCA1993C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2025 20:40:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdZDn02glz2ykn;
	Thu, 23 Jan 2025 06:40:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737574840;
	cv=fail; b=ddyY0ExvGrKkkj2hsSTQcGsx6Lf+0Uq4bhWgY1SO6g4g380X6crbvmXS8OnS13EimRtaKNROzPbypZ4fg9bnd0lKQ3gL0eibJuJRU8HDIdGDWAqkKfJKphf2yrA9DHPF9NG0CKahr0P+Op1Ezvz2s2Vx4ZIdjiBvAPsLPi47cWy4i/naiUF8aSuPvppOrSdqJb9jkME3s265H547DViHJrj9ds9dROYngnOumJ2LM0D9W1W9u4WN1ggn3KzBpSE6hFBhBGJzFC/hQBW6BFRqrNgAA9tBMXecnFJVFP6E53Vsopv9Sk93u4W2QsXuuo2B7UNZ5E40WIwx4ioIlyBMSg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737574840; c=relaxed/relaxed;
	bh=kc7c+9fyfV0vQIzIWcZ8yEPoBDllsCWdY42LRC6d03E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=URqtquX9MkCbJb5h0OLx1OcVF3MJG8HXbhYPFEVV9Tm8YDRZL8hGP+MwgSeyMetpmcHrJPDZkiU0G8Ph7fvx+8tVkna32r7ZvvkWcKOkgb7grnTgJ4WN5+1eyGxX0p1iI7TTw4DknBUsPtbbFWNiQlwM14wSRbNRqtqa/Juw2REiEs0YF1D8QwxlIJzTL5jqFlqDHupcE0sfX+aSPacx3UcqmU7RbxuJKxRuE7pbdz981iKa7jn2YEOEdX70dQXcMAamCPXc5PKJTjp+0ux68hP9LwbBcH/AamFJFzuwmWjCDRdaxuyC/zvXWRrkpoDrUJ5ouWjB5opEgISkpV14Ow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YRQxM0JV; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=jacob.e.keller@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YRQxM0JV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=jacob.e.keller@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Thu, 23 Jan 2025 06:40:38 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdZDk1Kszz2xk1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 06:40:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737574838; x=1769110838;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=v7w6ITFSzNYC+00n5GNVYPAUhkC4jUbQBLrechS45k8=;
  b=YRQxM0JV/5xHX1UUqK+ic/f5j47f0EomtDhUgAxY7ByDeW0GVpofy6GG
   ViYVBSL0FyGbrCx5weavtF0QZ10ZOJMBuOtTD0U4QNG1HvEsKMqB0escB
   7AOD28PT7Er2BjcxWxCwpHGmpN7hDHntmaFvVG5OlrKjeGJKD+t89Hyx5
   7CnpzbpPr5GOq30SbEkSBYC2ELVRr1Sd7X9h6Jiwg3jOT6wh8CCOqoh4n
   Cftlk1fnOJsfue5NskrNKX6V7AkNBm7Ct4Ya892bNsHebM1bx9vI/0ffD
   oei3gAeG8Y/LkJfI6tq2TVWi8FyUFuvnHpZxrPfiL12EkNxHqZdZFu6DR
   w==;
X-CSE-ConnectionGUID: +i334oejRcO7MXq11I6e/Q==
X-CSE-MsgGUID: 9pj+5H7mQkmxhm6hEEvK0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37750643"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="37750643"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 11:39:29 -0800
X-CSE-ConnectionGUID: SiwJ/meDR/my3+o6RxzhEA==
X-CSE-MsgGUID: 4lAQtGwcSv6osOqWginixQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="107783045"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Jan 2025 11:39:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 11:39:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 11:39:28 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 11:39:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bp+JUtQ/yzl0Wx3Bo799GaUuqecpITNnWqDfpQR9+n4XKIo2jS7OndHnxAFpgFUFMxMPv+pa6ENFv3CmuCbx3nV72j8e3r7VxVVMk8nGXicXTGJejDqJy7sD2bPoo9G7VNz/KwM1RZyAwTRq6QlZcFt/1Mu9URyUhg9+fkMMNfb8XXmO2bVzt8F3I1KupUOqG9Z4lyMQia1+sTeVY0reSLXo7cr/jCVC+SiVYEmx7+IbPqfOHq0sLf4VRPe5gn2uq/Rd1+FhUO3RtPNN76toFfFXmG7NAW82Y/WmymNkegble0t6/IW3L58rUves8Cs0O7Fvwa8viyl4fb3nv6Uaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kc7c+9fyfV0vQIzIWcZ8yEPoBDllsCWdY42LRC6d03E=;
 b=S7Z2yW67dnd4eFucr+mKcYTAxlcpo+Ja5SFIQHiS3cK5/GjmUB4gqHUYHO4fGo33JS37qvQWFsglYKF5K9yeWtOQIUpYKs6qF1n6nGGH9vp1X+lVwyLuw7lWQvUZ82jdxpyQk++nqCOIaPTYj23dXQI7cryUx2v0hVd3Yhrev/FR4qOrXH4xMZu21I3ZedeiRFPPjoTA/AhrfaBreKv3v5nyhFjB9js7IXglv86kx6REs8ncKyCSUM1WXXrmKd82nsk69U9dnmMIaXINP11UPBjGb52kc8hzu9wA+jgIwRTJc5akU400Pgz6eDfdpihI+HO/OMHB/REYcrCI+i4V2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by PH7PR11MB7123.namprd11.prod.outlook.com (2603:10b6:510:20e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 19:38:59 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 19:38:59 +0000
Message-ID: <69e38457-1b84-4310-a4a7-6bae996384ba@intel.com>
Date: Wed, 22 Jan 2025 11:38:55 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.10] ibmvnic: Add tx check to prevent skb leak
To: Denis Arefev <arefev@swemel.ru>, <stable@vger.kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Nick Child <nnac123@linux.ibm.com>, Dany Madden <drt@linux.ibm.com>,
	"Lijun Pan" <ljp@linux.ibm.com>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
	"Michael Ellerman" <mpe@ellerman.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	<netdev@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20250120124611.51436-1-arefev@swemel.ru>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20250120124611.51436-1-arefev@swemel.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::38) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|PH7PR11MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 01d64065-b3fa-4375-2ec7-08dd3b1c6aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVlrS01yZGpsZ1NLZEZSNjhVUDNZNTRoRko1S0x6ZDNQS0tQZmZvaW9Pb0FD?=
 =?utf-8?B?TjlJSkF2eVFmdmZrRldoRW9BUlJ1by9TUmZITnF4aXZHOFBBaUxBODlXSkZX?=
 =?utf-8?B?Unl6REowUmJ4L3RnczVmc3JJNEdraXRqamtzY2tHTXplR3krMkV5ZUordTkr?=
 =?utf-8?B?a2d4SlBqNFJYL0swbmlpNWN1SU4xZSt4TXJ5Ukx6Z2l3emhxOE9pOTlseVRu?=
 =?utf-8?B?Rmk1Sm54djdRRXVVMjBnRGpPa3lNb0diV0t2ZmpUWllqRmplTGRWR3BMZGpP?=
 =?utf-8?B?NFU0amYzSFhMM1B0T3d4L2VEQldlSDB5MW1sLy84MVRJWVc5RUYxTzh2TEZ0?=
 =?utf-8?B?SFVmK2x3cnJNNjMzWDJkZGlIYyt4S2h1Uk9VTDdvQWFOem5VUDViQU41aEZq?=
 =?utf-8?B?am5hYlh3SE90NldGVmFEakxtWjlqcUlzUXdjZUpkbkVjN2s0RXVFSG03UGtk?=
 =?utf-8?B?VjFrSHJjQi90YVpWeHg5ZlRaWUdXNFFEVzY1MytIR3RmVFJpczJqd0RpNUR1?=
 =?utf-8?B?UlExM2trRjdOaFV4Ulc3S3NsWXBnSnV5MUk0ZHBFMVVVQm9VRnFjNmxBVFZY?=
 =?utf-8?B?Q1VIcDRMMmtEVDJleXFBU3pqa1BSajNjZVF0c0Z5WlFLaFZMMk4zaXBvOU1i?=
 =?utf-8?B?eHlsT0dSUHFzTndGUmt6c3RvOTQwOU5xQjNSaGFhT3ljQ2tINnMrcU5PcUhy?=
 =?utf-8?B?ZE84Vm55WFYwTzllRDdjWmM0K3F2UEwwQWNFeGZsV0xkT0RrczBzaE8rZjFh?=
 =?utf-8?B?dFA2Zko4YVhWa05FN0dWWFE1c3UvT3Y1ZTBuVW9vWTNpUzZrcXZJaExndGd5?=
 =?utf-8?B?VFcwdnRKYTZVVjFlaGdpWnNGME1kVlZLMUlMa0NaaXRzQnhVdmpXSWxZbjBo?=
 =?utf-8?B?VjRkR0k0Y3VsOExXQkdiNzNKSW5pK3dLYzBiQkNMNk1kQVBXUk9SSnhrak9G?=
 =?utf-8?B?RCt2eHowOWJ4R2IzWUNQMUxHSUNKcFZybzB5N1g4cG5LR3ZwZjl0SE53U05w?=
 =?utf-8?B?V3lXYkE5TFRFcWhVbmVQZFp2aVhpQWFhMENIN0crdERGaG9wVnRPTXk2bkt5?=
 =?utf-8?B?NG9nc2ZvdVYxQlFpZzFramlzcFVoNFZVK05FOUthRTBHbERvOWhIZUF3ODQ5?=
 =?utf-8?B?RCsycU5xU01zeGdUbG5OVWpvc1JHWkZrQUt1cWo5emRJcnZHYy9ZWk50OGQ1?=
 =?utf-8?B?N2hEL1dPUExlZUpqdks5VFluVGdWMUI0RW9BcDRCNzVROUZ2VHpuTkV2Y2N2?=
 =?utf-8?B?NjVpdXEwMGFtSjFVc2VVUFJFclBxcHMrVW9DZFdWbnEyMWJyMWRDVGhMNXRw?=
 =?utf-8?B?SW9URE8vTjl0dEJtV20rektkSExydjIydXR0T2V1MHIrWTN0Zk9BTFNBSXRo?=
 =?utf-8?B?blhIc013WW1JZWxDamdjeVlNY0JGazd0VmxZZGlkODFOMVNBbXJoYStWaTlo?=
 =?utf-8?B?L0h0d3R0cDZmVUdNdUVDMC9OcG42ZndUSCt3K0RVVEVEZFdvODVNdG1HbFpN?=
 =?utf-8?B?azZia2VtR3ptckJPQ2g3SmdNVXJaU21WTzkvOFY4eVAxN1FzL2hGQ0dIVXVz?=
 =?utf-8?B?SWU0MFlNVFBZNE0xWjlrRE03LzhEazBCa1BWL1E3dXJiY292bTA0ZXFKeWR5?=
 =?utf-8?B?UmRnTUdLaUdpRnY3cFllVUJKZ1ZyVUFmNUhYbFE0UnVtbUJYRm51QXM2RkdR?=
 =?utf-8?B?WHFtUnVUbVk4OTkzN3NzNkQxNXl4VS9RVGZiMmJZUFRVbXlzWlNXV2lUTUtW?=
 =?utf-8?B?cnhNQlRHalNxVzJ6a1krR0VvR0pGd2ZqZTlOQ1JKRGNlMHhGWk5kaENEL3o0?=
 =?utf-8?B?ZDVlMis5QnhPTnVDTyt1Q0R6VEJwa1dONGp2VEp6S1Fzd2xEMFlWTlJTRnp1?=
 =?utf-8?Q?Nant5Tu/T3WIj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnpBbFdXVEJiMnJGS2o2OTUvWkFjV1dzSldET2wzd0JTa3BoVkwrOXBTQ2Qy?=
 =?utf-8?B?TVJJb1Z5QWoxWVFMOC9wZE5iV2ZnUkdQSUo4QW5Gc3R6RnFhbTJxOXhENHdQ?=
 =?utf-8?B?R2lmWFprUzhzVlVFeXhWMHBOSENTc290ZnZSb3dqSE1Ga1BwLzc5WFZ1Umxr?=
 =?utf-8?B?bHhFZVdYQ21OVUVHbmhISGYvNjBCSXBpemxTbUlzampRNjdPK3d6MUgyeEdC?=
 =?utf-8?B?eW84VFhlNk1DSnVJY3kvdi9WVzdFUWt2RDBySWdyQnpZNkFXTDliaklwQko5?=
 =?utf-8?B?dlh6VDBKeUV6VWpvSk9EcjBYS1RXTUNJTm9NMWVpUVhkeVhTOTV1UHdCUXNY?=
 =?utf-8?B?cWhnd0JHVkEvZE1mUFBlRzM2OUk2Q05wQnE1S2l0cjlxQUR5ajdJVmVyemtJ?=
 =?utf-8?B?UFluY2JuN3VCQTE4ZWJtTlpOYlZ6L2lLU21oZ0wzNVhaUElMN0RQMlZIVC9L?=
 =?utf-8?B?ZlpOTC8vSkp1c25ua3REVkhGdXM1b0JWS0lVYVhoVEVaaVZVRCtXWDFpUi9h?=
 =?utf-8?B?dkFLVkpUZHJ0Vk1STHZlZXJ5cHN4bXRsYVljWVZ6UU1XV29kV3Q4MW9ENlQ3?=
 =?utf-8?B?dG5vbjVGaTNCck5udDg3emRUSGpybnZsdGxvd2dIZHExTXZ6ZVZLT255dCsr?=
 =?utf-8?B?NmZiVjdacENmVnZQeHN6QStzNDd6MDNtekk5ZHpsZ0N4eGE2ODFmNWZmMm1Q?=
 =?utf-8?B?dWRJUXNaZzVqb212NW03TVJ5bXZyMFc2WGNMRHEwcm1Qa2cyaEkxNWV5VGY4?=
 =?utf-8?B?NmZScHRQMjRlTk14UDUxbTRwUDB3YmtpZnBBUFFMR1BxdEVhak5TdHhWOGNa?=
 =?utf-8?B?M1NsbFB5aTFrV1RJWDFiVUhFeEwyNHkzTnJEVE5pSmRJV2FaYTJmaUZxVDlK?=
 =?utf-8?B?b08vTzhRaG5RTTFjYkVuWkhudXpFYStWaGsxdks3OTVhRzBkUmtVQTRZaUNp?=
 =?utf-8?B?K1JrcEQ5K0c4YkJKYTd2WGZWS1RQdDhTVFhkaW9YbHJ6cUt1akZrRU1Bdjha?=
 =?utf-8?B?WlIwRDJRVHZyRDJsd0dBMkt0enBkQmZkWEhoemV4ODFHQ2s3VW5Udkh2STFo?=
 =?utf-8?B?TkoyOVNaZ1NQUU9TWkZIck0xTHV1K3IxSU51UjhyYmQ2a3dkZlZUaUFoSkw5?=
 =?utf-8?B?T3VsMGVNWjRXbmRIaXpkZkFIVVBIOGNqM2diZTlKT1VYYVU0a281QmE1My9y?=
 =?utf-8?B?YlQyb29xeEJCVUlkVGdpWnBwckNRSlF3WmYrcnlQU0xnWWtFKyszbWFJeVFS?=
 =?utf-8?B?aUFDMkJ6QTNIbjlOejJkOHVybW96RGdWK3dYT0pzS3VDMUVwTTdRUnJ2THZK?=
 =?utf-8?B?MDRGbE85WXdLRktkVzRaKzFBS090YWs4dG5NeTllV2FlSU4vWThtS1BVZm5k?=
 =?utf-8?B?L0F6Y1EyRFhWT1p3MXg1Wm9FaHNMbm94cnVzVEZEWTd5WXBUL3hWTzRpVDYz?=
 =?utf-8?B?Vml5OGhjUFFncUpnYnB6QlR4UDZUZ2FWWVJzVm5iZUFlMllLNHU1TlgxTHZu?=
 =?utf-8?B?U0trbG9xY2lqNG9nWk15QjkvLzdNZXNidC80Rk11QktJV2hsbmM3cUlOWU1i?=
 =?utf-8?B?bGFnbFBSWVVpZHhnOHA0U210Y1J5T0NyV3lYa0JpbiszZWVXYi9WNFZPaity?=
 =?utf-8?B?NTBoRy90NU5TOS8vWXZ0RnhBaFkrcUM5TllpaDB4QTltUUpRaEp1VzlxNHIv?=
 =?utf-8?B?VFd1c3hBaVJSSmNSMmVabnkyNXJoRjBGd0dYamV0MHRzeFJQS2p1KzQ0K2xN?=
 =?utf-8?B?RGR2M0ErZWlFcmpLY002KzNXd2k2S2ljL1NCRzJEVEVENU5ZMkZudldITEZm?=
 =?utf-8?B?TlZxbXJpZmNhSjlsU29GQ1YzbGR5QlBVZU14Q25SUjFsRGkvMW8wZ2g1aFVS?=
 =?utf-8?B?WllUSEM2dmptYXcyRUJCc09UZFVkOWhxZjRCbVdSUEp0RmlVSHVwZWNBZlMr?=
 =?utf-8?B?M05uOVRlRElIQWFNdzd2QUVyb2tia3FnTVFNZWYvc3FnOTZDMFZNcTBCWmp6?=
 =?utf-8?B?OThkd3FlU2tkSkNXQ3c4dDU1emRZOElkcUc5c2pCUW9DYmFMK2MvMzlydDFm?=
 =?utf-8?B?U0U0UG04ZlU3ZnZMZko4amV4RlhzQVA0c1F2b25kRlg0bXVaK0NSZW1DMFh2?=
 =?utf-8?Q?Rr7XHgdlXPQnVlXf7vMSY2wyz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d64065-b3fa-4375-2ec7-08dd3b1c6aa2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 19:38:59.2499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okbzCztgKPC6nMF3O3xmz9Wm6FdJ/mrXxjkmtu+Gjp33Jukt11qFZH77gJ4C1EpajWau2T1+CEFy8KXuuGPf2w2cKq20Ai4/wDkhMb3J7no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7123
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 1/20/2025 4:46 AM, Denis Arefev wrote:
> From: Nick Child <nnac123@linux.ibm.com>
> 
> From: Nick Child <nnac123@linux.ibm.com>
> 
> commit 0983d288caf984de0202c66641577b739caad561 upstream.
> 
> Below is a summary of how the driver stores a reference to an skb during
> transmit:
>     tx_buff[free_map[consumer_index]]->skb = new_skb;
>     free_map[consumer_index] = IBMVNIC_INVALID_MAP;
>     consumer_index ++;
> Where variable data looks like this:
>     free_map == [4, IBMVNIC_INVALID_MAP, IBMVNIC_INVALID_MAP, 0, 3]
>                                                	consumer_index^
>     tx_buff == [skb=null, skb=<ptr>, skb=<ptr>, skb=null, skb=null]
> 
> The driver has checks to ensure that free_map[consumer_index] pointed to
> a valid index but there was no check to ensure that this index pointed
> to an unused/null skb address. So, if, by some chance, our free_map and
> tx_buff lists become out of sync then we were previously risking an
> skb memory leak. This could then cause tcp congestion control to stop
> sending packets, eventually leading to ETIMEDOUT.
> 
> Therefore, add a conditional to ensure that the skb address is null. If
> not then warn the user (because this is still a bug that should be
> patched) and free the old pointer to prevent memleak/tcp problems.
> 
> Signed-off-by: Nick Child <nnac123@linux.ibm.com>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> [Denis: minor fix to resolve merge conflict.]
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---

I thought the process asked to have the stable tag, i.e.

Cc: <stable@vger.kernel.org> # 5.10.x

Anyways, this looks good to me, and seems like a good candidate for
backporting.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

Thanks,
Jake

> Backport fix for CVE-2024-41066
> Link: https://nvd.nist.gov/vuln/detail/CVE-2024-41066
> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index 84da6ccaf339..439796975cbf 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -1625,6 +1625,18 @@ static netdev_tx_t ibmvnic_xmit(struct sk_buff *skb, struct net_device *netdev)
>  	    (tx_pool->consumer_index + 1) % tx_pool->num_buffers;
>  
>  	tx_buff = &tx_pool->tx_buff[index];
> +
> +	/* Sanity checks on our free map to make sure it points to an index
> +	 * that is not being occupied by another skb. If skb memory is
> +	 * not freed then we see congestion control kick in and halt tx.
> +	 */
> +	if (unlikely(tx_buff->skb)) {
> +		dev_warn_ratelimited(dev, "TX free map points to untracked skb (%s %d idx=%d)\n",
> +				     skb_is_gso(skb) ? "tso_pool" : "tx_pool",
> +				     queue_num, bufidx);
> +		dev_kfree_skb_any(tx_buff->skb);
> +	}
> +
>  	tx_buff->skb = skb;
>  	tx_buff->data_dma[0] = data_dma_addr;
>  	tx_buff->data_len[0] = skb->len;


