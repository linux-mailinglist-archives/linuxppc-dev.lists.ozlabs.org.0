Return-Path: <linuxppc-dev+bounces-11390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F083B388A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 19:29:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBs3h5FD9z3cYJ;
	Thu, 28 Aug 2025 03:29:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756315792;
	cv=fail; b=c0IZZbDssulO4hAWvxhVMWGLhh0DPTsnlVvKJi9f4yudOvGJc7bJiAesuajqGxTxrV2gw0AF5pxmLIfrw+MnzRTcc9ODKT9i0z5JapNHMpGSoR9m2JanGIlWmr+A5j1LXcoaItvVM2PEtZQwXZyKoy7XCygdLqBmN8GDZ6kHFNzuOsUnSSPBTmC7z6nJrqTgkGfQPlBHsuWxT/hqnR++ZvND+/W4PkCXRo9h4mLTVzn9/BL7kdLvPsUBVAyDGou/btMlXoPB1SLmf4QvxJbTi2vhJIvPYPrC0l1aVXHAaxubPdUVLIk0Ow9Z/wXcXAjAdXysYOmVOXcqKwKxNVBtkA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756315792; c=relaxed/relaxed;
	bh=DM+dgi/b2/29pqWZ1StKncqj5uUGaV+66mOEzsVZH9U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fM5NvLy25p3404eJ7hlMkeL4dMjBdvk8PWl9SNAqFBZTQvyJIyyL6MFAAR2e2ZURo/pSeEwVSuQ70YL6O6RGmir8Nur61juj+LguKA4HbTivGIrnzychNAgw7iheItPAJJAVuS9bfIq6mEe3Ml/9sUUPc1zKvlX60j9sOzpAGnvYInOInI2UwcS0Ds83mOweKH5tSuS6nCNaFdrW7gxjES7RqOcmkuEZJOFRR/kNkO5VBogum1wZvslBE/V2va6XbIPKnoErOVUPbbn8p17bgwth+IUDGp4dRMNt2xGW1XeohYy7wyt/uOIU+4ulNFf46IYL79/y9igbdmm8DKRrfg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fmgoLrLp; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fmgoLrLp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBs3g0SHJz30Ff
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 03:29:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756315791; x=1787851791;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p3bkKaXnjlUizH7pooRLvxQ3gN8184K2fVhoeVS9MF0=;
  b=fmgoLrLphKbCcRb4WQ3h42Cd4WyFN6pPIS8eF/71RhOoPfB+gNRv5wes
   MXkIAZUfSdcWLo0OMqj55y8ziivozzINebL5Op+ZVEeVhRtWwRLXQxu0J
   xxMBzStT6h0L7tOqzQ2k5LNi5+BkYTgt11FH2wybkzu8114WwBwK9mEhA
   BHoJ+PJLjfWhNvbkd3nWteGG6kLsCQuvvQalUXA60SMcVBGiU1ou9BZu5
   jQLziLQER3/f89gx/TJUL0A9B4zElWXshX3Myg8mCBuBRoHhvsmWzvyO3
   ZLSzxWWOOU4ixrgr0SWztGFaL1/htHiudKHmhSnhfdtIxUsGNsyOj2HNc
   g==;
X-CSE-ConnectionGUID: clFUJDQMSaSeMT0448Gwdg==
X-CSE-MsgGUID: bg/UxsoWRS+bQXH3QKXzvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58496169"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58496169"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:28:44 -0700
X-CSE-ConnectionGUID: JUBcm+u2RXimCMIbaFtKig==
X-CSE-MsgGUID: YpUD8yuDRPGhEgpXmTMoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170270340"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:28:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:28:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 10:28:42 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.57)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjBtB/zdyhlph5uiX+PdbHtTnSDJux9L2pRYn1+XyVN71unB2fO4mMoam+kcE9lIos2ssSlPQf0WHZz+g00Mo93fkGF3Zz+5HNiY/yQdRHAyf7TqCB8vvl2/F9smAAyxXzyv4heAGq4BqEE4gNk7lHGP07OH2/HjakLEmZlM0DIdIkiJkF3pxk5IjX81eZwWYaERKRYsUnKyZCh72mcuYyWXoyMdY4KGdkjIx5HjvJIRzPdYpc5ULKUd/0eULmBmdmhleOzXIB4irVRxwaXogGGlbKvToUuYefhnCOc7AJQALDc/UpA48Xwi9lzZZxmZR55Nkq53GLYcTFTMDp1M3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DM+dgi/b2/29pqWZ1StKncqj5uUGaV+66mOEzsVZH9U=;
 b=VNTYOVFybqLPNuFxUJc2WRQgny9HI+ST0G5ccnkX44f7zC6Xl0EC3EUXFWDKLlk+7oulOChW6OTKYRVROi2HiVc/eMQyc6hc5qii5tZpVwkV85MxtH8dtPoFselQgGVuUOztzoQqL3gy4iDwxCKRwzlMnxHKvmzwB4qV0jvTDudILuBE5pS5Vc0qHYHAa0fRC0OibkmcdyZLKp80wSsd44jeNvgWzxm6CcKd+0o6p4DLCkeWwhVM3mHop1mC/kg6oBbP7h5HJ3bZNplwdcjIziFj/ZH55mcL+HdPytJ5ucxBdR4gxoJ6yiqJX7AE5HK4eV9uLpx8WC9h3575KtwJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CY8PR11MB7339.namprd11.prod.outlook.com (2603:10b6:930:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 17:28:39 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 17:28:39 +0000
Message-ID: <e598c888-0635-4de8-814b-5bf38d0fec9a@intel.com>
Date: Wed, 27 Aug 2025 20:28:34 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] tools/perf: process auxtrace events and display in
 perf report -D
To: Athira Rajeev <atrajeev@linux.ibm.com>, <acme@kernel.org>,
	<jolsa@kernel.org>, <maddy@linux.ibm.com>, <irogers@google.com>,
	<namhyung@kernel.org>
CC: <linux-perf-users@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<aboorvad@linux.ibm.com>, <sshegde@linux.ibm.com>, <kjain@linux.ibm.com>,
	<hbathini@linux.vnet.ibm.com>, <Aditya.Bodkhe1@ibm.com>,
	<venkat88@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
 <20250815083407.27953-9-atrajeev@linux.ibm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20250815083407.27953-9-atrajeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0065.eurprd06.prod.outlook.com
 (2603:10a6:10:120::39) To IA1PR11MB7198.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CY8PR11MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f72260-c375-4bb9-1f1d-08dde58f293f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0t4T3A0Y2xIcnA3eUdNZ254eDJhU3NFUmk3YnBVQWN1OEdwSURaUUZzL2dM?=
 =?utf-8?B?dlRBWVgwVm5xRTJDUUZtZzUyQ2RPZlRwTkhGV0ZYMkFJZ0p1MzJqaXJqeWRV?=
 =?utf-8?B?Q3B2cUJtR0V1VmZqZVozR0RFUUtKMVo1SGZYS0s3ZGpzRVNNUCtBK0FjTDAx?=
 =?utf-8?B?eEloVSs3bndHVDNvZzJ6amY1d3JDdDBvTml1VktnMmx1SWY0WDZabUxPbEtl?=
 =?utf-8?B?eTdQbGFBbnFIR084ZnVvSDJGbU96MW5YcGNVbTFxTG8wOFBDUUQrQzBvSWRt?=
 =?utf-8?B?SXUyb0RicDRRL2wrb3J2Z09xMkhoeVR3bGVQTGU0ZENqWDBLT3JKZU1kLzdZ?=
 =?utf-8?B?V3gzczZ6QXFYUDdldE1YTHFTUHRVVWFQMHJTcVJIZmI2MUgyVDFQaGRJbk1P?=
 =?utf-8?B?OG1XS0t3ZVhOVktQM1RBWG1wTEptdW5BT2pTcW5RajlQZkFFVWFkaVRiRm1Q?=
 =?utf-8?B?YmZ1TXdzS1B0RlhLN3BLeFlwWkpvOTQ0akorU1drZXB2YUZGRDdXTW8vOUpv?=
 =?utf-8?B?Q2MvSDVoZ2dsN0ZMMDV0MUIwRDJkbVVGM1RUV0FGRFhZcENHM3ZLN0ExMGJE?=
 =?utf-8?B?M1RueWMxaCt6QUFZUGRWcGs2MDJVL25pdWNCN2svdjQyR1RCTG53dDlRQkYy?=
 =?utf-8?B?amFKclBOT0lXeHZ5Vy8yQ3A2L0NPMjJ4QWU1cGlhUDN2NkJpU1ZyN0NPd2o0?=
 =?utf-8?B?M0hINlFlZGdWSDVQYk13TmEvTzJFT2tYZGx6bUhkNHZxakVtRXBzWUhqNHM4?=
 =?utf-8?B?eW51Y1B3OVVxUDBFRm1MVTJPVkFzOXA4c1lFbEszTzlDNTFxYTdzZ2Z4SnIz?=
 =?utf-8?B?bU1VMk5kS1RET2lhSHRtQk1NWEJOZG1XUWpOSVJ5SjBaTGpMWTJnSU1XVERV?=
 =?utf-8?B?WjZEYVQwdnY2Y1BycThvN1dhNkc2VkNSVjZTYjR6L1JjWHZrQzhMVkRMS1Vp?=
 =?utf-8?B?M05MRHAyRTJxRCszTXU4cWQzVnlwbE9ENlFZRHBuRmtlWGM4ZXdyU1E3OUxG?=
 =?utf-8?B?TnVIKytZYmJvak9nTkdoeEV4amIrTDd6d3VkcktVeEI3OVNCUGlBUmNZNkRt?=
 =?utf-8?B?QU9lbTJPUzdoUGtjRTc1emJheXhGcmhTZ0Z6S084UlFkNXdsZW1sNVhVaXd6?=
 =?utf-8?B?U3RuKzZERTlaQ2V0T3E4eGp5eVk1djFlcjlhUEJOUFU3RDRoRThRZUhxS3kw?=
 =?utf-8?B?M1dqNFRISjlSZkR1SnkyMkwrdnppVzJxSnkvRSttWXNudFJCREdORERPUDBt?=
 =?utf-8?B?RGF0aHowNmtaYkFzQWxpeG5GZ20ydHhQVUt5V3hIQmovdm9YczhZcHZ3cVJM?=
 =?utf-8?B?eU9meHpkM2loTGFlbm5LWVNURld0RGhndXV4YmkyM1BETHVkaDhtb2s5ZTFj?=
 =?utf-8?B?QWRKcUx5Mmc2OTgzS21pWVJLNkhQWGhyQ0JqL09TVHVoRWxqSHByVmhYeXp0?=
 =?utf-8?B?OUp2OWNCSHp0UmJwVXQxcmxodUgrTGkxYWJPQWRRVk44d05pN0UxaHlSaWhT?=
 =?utf-8?B?bS83VmtaRFdOVytvV0dVamsxV0NCRFFTUU00MWUzdkZaRUdrR251VlJoUklK?=
 =?utf-8?B?NjJSbnNkeVFPU09tVDJYcTg3d3l3b0tjVXhVblJDV3ZWYUMyMUxmWXVMSFFR?=
 =?utf-8?B?N2xjMWdja2dzcHc2dkpFZm1PczdBa2t3SU5NcjVkbEJ3MmVpQTJnNWs4eWk1?=
 =?utf-8?B?YUEwelpqb1ZRU0RLYUdMTk0rS3BwVEZNMXZrUXF5dDFoc1N2Q2NRY1YyVmZy?=
 =?utf-8?B?VDR4WTVkTlNCUkhjNDdQUzlnZGxBRE40TjVzL2NjT0RxSXkyaWZJUFV6UjFQ?=
 =?utf-8?B?OVVGcFRSb1ZEalZtYTdOVGlWRTc5TWo2UEU1dkZaemRaZm9RajlxV3hvazNi?=
 =?utf-8?B?dk5GSzJWbXhMa1BBKzBDeHNyWGluNTZSMHU2VUMvZk5TUXNLN01MS05xK1pC?=
 =?utf-8?Q?PlAeDvQH4kU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE14OFU3bWljeVVXR2YwRjJ0VGlxK1dkdXZSenBySE9hNkQwUW5oYjlPdllZ?=
 =?utf-8?B?RmptaGNhQXE1dkhtWW9IM0hnVUNSOUl3dEtMdS9QclA5MnlYMjNLUjRiREFK?=
 =?utf-8?B?aFhmY3VrdUlIZzlnNUkyN3JCcytGenZtR2RYZGFMVnlGWTVOVW9BZ0xaYTU1?=
 =?utf-8?B?cGFoTDN2enNuckZ3KzExUFBLRDBrWFBVclhmM2pwWm9lZUFJbUtIZTY5VkV6?=
 =?utf-8?B?elZGY1BzZ1pOOFo3VFFmclN1UFZxTXlReWRhWjdlN0VNVXFITURVL20wUit2?=
 =?utf-8?B?b1UxblQ4SzdYcXU5c3hJeFVvUVFNaDFaUmtRcXR0ZkU2ZFRPVmJxVGdxa0xw?=
 =?utf-8?B?TGNpZzJpOHE1T3JzYUthclhxMWlpQ2pTbGtlWitaV1luc3BGMVJDV2pxUlFk?=
 =?utf-8?B?UTIxYlVNUlplMHpRZjI0TE05cXZNZmxHdEllOGlmMHdvU2VabWFVa1l6a2lT?=
 =?utf-8?B?OGUvQkZseXpNSkdQUnVFeGNiTVYvVllBQ3BxallyeXpSZ09Ibm43YnE4VTRv?=
 =?utf-8?B?MUhiMFMvdm5VcHVzQUVvTWRoaDhxTXRMaVpQdGdYa2I2UnRQdDVDWkd4bmRi?=
 =?utf-8?B?WVpHQzdqeWxzUjdNSVJBMWtIMElxdW95ZXRZWGJBYlMwajNraXJJWkNISzZM?=
 =?utf-8?B?VWVieXkraEk3K1h4VU1CeWQyYllWSkY4SVFtK1EwZnZoaWgxK0RRbXpkQTVN?=
 =?utf-8?B?MnpEM1J3U0hQUVczVlVLUzZtQVlXYWphWVRqMUg1N2dVaFM4dkx0ZHJTcUdP?=
 =?utf-8?B?VzYwc2s4c1ZSUjEwZ2JUVldVRStBd1Z0WXFwVkRWVEpiZmFGUlNTYmNvQlZX?=
 =?utf-8?B?aUE3Mk1ad2tIeStxTkNnSncwb04wQzkvb2dZWjh5clFlejhaY3NaeHZtQkNi?=
 =?utf-8?B?M1BjemdrMVBQaVN6RklKdCtwaFpKT1N2OXNReS9rSC82b1Rxem1RQ1JWdE5o?=
 =?utf-8?B?V1dFWG1LNnlyYlplSXJnM0d0cUVRSXVFYTZzdnFOQU1VZEgyRk5zK3FETzNM?=
 =?utf-8?B?UlM4bTBLT0pvLzB3YmdqR2RMU1BSQ1hhY2VWbUVkZlpFaTAxZVI0SjAzc2lV?=
 =?utf-8?B?WjZDenJmMlRIOXNXUm50ME9SYUpYT0FNZ3ZFZ1NzYnYrS1JJZlBOSzRvaXh6?=
 =?utf-8?B?OWZPVXA2UnFjNDNPUHBLbklxTDFKVFkzaFR2bm15QkZ3SHcwZEo1MnJLRlAy?=
 =?utf-8?B?bGNqUU1CeCtsYXQ2Y01hRGZ5OCtLQWFyNGRncWVFTkhhaUt3aGRkRlBFdTlL?=
 =?utf-8?B?R3F2WHVsYzRML3pwekkyZVZVNWNNMW1zV3NCSHdPdlh4VjJvbHgra28rMFhI?=
 =?utf-8?B?TGFkK1lWbllUQndzc01iNWVtTjkwNi9RclY3eDJ4Yk9DaUpjb0IybVNMU0ll?=
 =?utf-8?B?OHoyai9wMXNCYTZhNk1FZ0ZpY0RMTVhQWExrSmFFallHcHo4dlMyL0R1ZjZ2?=
 =?utf-8?B?SHU3ejdJZVBMb2NwNC85dXNjQ0psZXFRbmo2SnlVN09DdW9HQ1pSYXMzSHU1?=
 =?utf-8?B?cXI1NVA0N1ZiOWdvTVMrRzlMcXU0OGhybUhhaitYZDIraEwzWGl0TTh3STl3?=
 =?utf-8?B?SWREUk82TUdPeVRpSHFtQ0FYd0RpL08vUFhqNitJc3E4RFhFMGVwekRkeUla?=
 =?utf-8?B?K250SmY1SlB0RnlIRFhLaUVNa0FudlNUYmxmWTFEMVM2ZXcvekM5RnVhKzRN?=
 =?utf-8?B?RnVvQXpWNmR2SmNXMU53U0JpSFU1YUYwdGlDU01FcW5XdnA2ejRRRzd4akZi?=
 =?utf-8?B?SmF6ZFpSK0VKc3V6aC96bVRFWmNlWUd5dkNXTWV2NmtyQjkwM3hXdUE5V28r?=
 =?utf-8?B?U0htTlJDTncwTGx2NGhpaHNuNHdMa1p2ZFd4UWs1OEoyTFEyU3VOT0FMUC9u?=
 =?utf-8?B?NjkzMDlQT015OVkyYnZ2cUJnQ0ZVL3hVYkJzSEFJRTBQd0hyT3A3dmRMR1JC?=
 =?utf-8?B?V3Nnb0VuZG9IeERVWDdZNlRuZ0RtN2pmTGRYZGxObUtrK3F1VnFjV1pmWURs?=
 =?utf-8?B?bFhLODVFTFd5bjViRnJBT2tPR2ZaNmlXSUEzbmUyR0NSeDh5RWttelpMUkkr?=
 =?utf-8?B?QWVhOXBYN25uY1F0endSMTFrbWh0UUtFNnNGRjlQaWJKMGRWVzlqdm9HYVQr?=
 =?utf-8?B?aFRTMmFBQzJNL0c0eDNpblU3RHpPbTFOV2xqQWFqb2NDN0JsSEdXQTA5TWFw?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f72260-c375-4bb9-1f1d-08dde58f293f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:28:39.3596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWo5qWEpqszFlTvRs8px9GYCzzb95pmaY3WVjfAPvAPLSX6x+DszJ2l7yb+VO5Q9KozpFAanbBf9ZlkNTAFHdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7339
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/08/2025 11:34, Athira Rajeev wrote:
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
> format for "struct dtl_entry". Define the translation for
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
>  tools/perf/util/Build            |   1 +
>  tools/perf/util/auxtrace.c       |   2 +
>  tools/perf/util/powerpc-vpadtl.c | 299 +++++++++++++++++++++++++++++++
>  3 files changed, 302 insertions(+)
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
> index f587d386c5ef..bd1404f26bb7 100644
> --- a/tools/perf/util/auxtrace.c
> +++ b/tools/perf/util/auxtrace.c
> @@ -1395,6 +1395,8 @@ int perf_event__process_auxtrace_info(struct perf_session *session,
>  		err = hisi_ptt_process_auxtrace_info(event, session);
>  		break;
>  	case PERF_AUXTRACE_VPA_PMU:
> +		err = powerpc_vpadtl_process_auxtrace_info(event, session);
> +		break;
>  	case PERF_AUXTRACE_UNKNOWN:
>  	default:
>  		return -EINVAL;
> diff --git a/tools/perf/util/powerpc-vpadtl.c b/tools/perf/util/powerpc-vpadtl.c
> new file mode 100644
> index 000000000000..ea7b59c45f4a
> --- /dev/null
> +++ b/tools/perf/util/powerpc-vpadtl.c
> @@ -0,0 +1,299 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * VPA DTL PMU support
> + */
> +
> +#include <endian.h>
> +#include <errno.h>
> +#include <byteswap.h>
> +#include <inttypes.h>
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/bitops.h>
> +#include <linux/log2.h>
> +#include <elf.h>
> +#include <limits.h>
> +
> +#include "cpumap.h"
> +#include "color.h"
> +#include "evsel.h"
> +#include "evlist.h"
> +#include "machine.h"
> +#include "session.h"
> +#include "util.h"
> +#include "thread.h"
> +#include "debug.h"
> +#include "auxtrace.h"
> +#include "powerpc-vpadtl.h"
> +#include "map.h"
> +#include "symbol_conf.h"
> +#include "symbol.h"

Are all these #includes really needed

> +
> +/*
> + * The DTL entries are of below format
> + */
> +struct dtl_entry {
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

struct dtl_entry is moved in a later patch.
Maybe call it vpadtl_entry or powerpc_vpadtl_entry and
put it in perf/util/event.h since it is eventually needed
in perf/builtin-script.c

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
> +#define	dtl_entry_size	48

sizeof(struct dtl_entry) ?

> +
> +/*
> + * Function to dump the dispatch trace data when perf report
> + * is invoked with -D
> + */
> +static void powerpc_vpadtl_dump(struct powerpc_vpadtl *vpa __maybe_unused,
> +			 unsigned char *buf, size_t len)
> +{
> +	struct dtl_entry *dtl;
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
> +		pkt_len = 48;

dtl_entry_size ?

> +		printf(".");
> +		color_fprintf(stdout, color, "  %08x: ", pos);
> +		dtl = (struct dtl_entry *)buf;
> +		if (dtl->timebase != 0) {
> +			printf("dispatch_reason:%s, preempt_reason:%s, enqueue_to_dispatch_time:%d, ready_to_enqueue_time:%d, waiting_to_ready_time:%d\n",
> +					dispatch_reasons[dtl->dispatch_reason], preempt_reasons[dtl->preempt_reason], be32_to_cpu(dtl->enqueue_to_dispatch_time),
> +					be32_to_cpu(dtl->ready_to_enqueue_time), be32_to_cpu(dtl->waiting_to_ready_time));

Lines are getting a bit long

> +		} else {
> +			struct boottb_freq *boot_tb = (struct boottb_freq *)buf;
> +
> +			printf("boot_tb: %" PRIu64 ", tb_freq: %" PRIu64 "\n", boot_tb->boot_tb, boot_tb->tb_freq);
> +		}
> +
> +		pos += pkt_len;
> +		buf += pkt_len;
> +		len -= pkt_len;
> +	}
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
> +	struct powerpc_vpadtl *vpa = container_of(session->auxtrace, struct powerpc_vpadtl,
> +					     auxtrace);

Might be worth adding a helper like

static struct powerpc_vpadtl *session_to_vpa(struct perf_session *session)
{
	return container_of(session->auxtrace, struct powerpc_vpadtl, auxtrace);
}

> +	struct auxtrace_buffer *buffer;
> +	off_t data_offset;
> +	int fd = perf_data__fd(session->data);
> +	int err;
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
> +					 data_offset, &buffer);

auxtrace_queues__add_event() is only needed here if there is no
auxtrace index, however an auxtrace index is always written for
new perf.data files.  The index gets processed and data queued
by auxtrace_queues__process_index() which is added in patch 11.

Piped data, on the other hand, has no index and needs to be
handled here.

So:

	if (perf_data__is_pipe(session->data)) {
		err = auxtrace_queues__add_event(&vpa->queues, session, event, 0, &buffer);
		if (err)
			return err;
	}


> +	if (err)
> +		return err;
> +
> +	/* Dump here now we have copied a piped trace out of the pipe */
> +	if (dump_trace) {
> +		if (auxtrace_buffer__get_data(buffer, fd)) {
> +			powerpc_vpadtl_dump_event(vpa, buffer->data,
> +					     buffer->size);

Unnecessary line wrap

> +			auxtrace_buffer__put_data(buffer);
> +		}
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
> +static void powerpc_vpadtl_free_queue(void *priv)
> +{
> +	struct powerpc_vpadtl_queue *vpaq = priv;
> +
> +	if (!vpaq)
> +		return;
> +
> +	free(vpaq);
> +}
> +
> +static void powerpc_vpadtl_free_events(struct perf_session *session)
> +{
> +	struct powerpc_vpadtl *vpa = container_of(session->auxtrace, struct powerpc_vpadtl,
> +					     auxtrace);
> +	struct auxtrace_queues *queues = &vpa->queues;
> +	unsigned int i;
> +
> +	for (i = 0; i < queues->nr_queues; i++) {
> +		powerpc_vpadtl_free_queue(queues->queue_array[i].priv);

This is the same as free(queues->queue_array[i].priv)

> +		queues->queue_array[i].priv = NULL;

Could all be reduced to zfree(queues->queue_array[i].priv)

> +	}
> +	auxtrace_queues__free(queues);
> +}
> +
> +static void powerpc_vpadtl_free(struct perf_session *session)
> +{
> +	struct powerpc_vpadtl *vpa = container_of(session->auxtrace, struct powerpc_vpadtl,
> +					     auxtrace);
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


