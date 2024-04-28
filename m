Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCADF8B496E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2024 05:32:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hW/1OqO0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VRsTJ3zTmz3cWp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2024 13:32:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hW/1OqO0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VRsSW3xLQz3cP7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2024 13:31:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714275083; x=1745811083;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kMyK5sv6avcEf02xAlCYPWHBVS0HYHke6bA64X6mZGA=;
  b=hW/1OqO0dc1rdxrMuC/Ix5ggScDNv39xdH1ypB//YaDiQ3/cx+9kkHlj
   jM4lSduVFym8tlIXcNfKw2LmEcWREpDMqiQWTOmZk1TTa46C/jnP1MtFB
   MZHW0UUrdToSp3ow+cg2MA6iU1aFHfgj3cx/XY/c8SfKfpZTmdAwHdesk
   vEf4CutJn4xk8kXSodpGD16RasLHogaQIinr8tZJv78nW0xFs03d5uS2G
   TsNArhlDjhviAyLMNcz31qcmHJ46hAFLnVY6tQ6sa64JTGzZE/3WdgTje
   9JViuhoghD+U5sl0gDc4kQoFORE+GaV6SaqZC7QjRbtA8WFdN1aay0XDI
   Q==;
X-CSE-ConnectionGUID: S4DfTG+1QfqSWpnptA+3Eg==
X-CSE-MsgGUID: jIvQt7F+SXOllRPX3ZtfDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27487376"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="27487376"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 20:31:16 -0700
X-CSE-ConnectionGUID: lomKDB+rTeaca8SFV8DPnQ==
X-CSE-MsgGUID: tuRsf4knRVqF+cSTI/G11w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25855339"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Apr 2024 20:31:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 27 Apr 2024 20:31:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 27 Apr 2024 20:31:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 27 Apr 2024 20:31:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNWdkJpTG/AfUNP0xiVJnPyopapbVXOqe+3oOEKG45+dlaLCh1RopOMl0lvNI84tIT52ZgaqnRkd1c2JzjXyr/IFSHeknrMKOZlFGgHEgNgR0Mqir8EY5ctwMFAzZnAQMhDJDgHWNpx/0+CdKuLDEiOs5lNpIgJw4N6dODZMtm2x7Qg8sRHWECnIcOY6wrwOZYJNQvB2Hz/QU5BeragHihLknz3ZNhm7E5bj7s3rx40j5ohT/vJsqZVp6w9MkGNWvLA2ttb855kU7hUermtH0vzXcqG9gJDGDuIAVx24iYNBqIliZNNw32K3/fh5fnBzyZT7LfgpEn31753UAAOsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMyK5sv6avcEf02xAlCYPWHBVS0HYHke6bA64X6mZGA=;
 b=bGYalZmh2ZLnTKC2rSM4Y7HHPy+kEjgpCgr/mCkZii1FUku5BCvfjU+yq5rToNC5cku80Sry1p+FDfXaH+lubpdd8GM3JTjQKQyPo2t7o/riWW08TqrHe1DbNgLEss5KUn4E+oohrWBU7gy1qqAkimViNXzJ1Z3a//TWSNc3C4xCTKnyJH4QFN+vI7CSbMVUisRaLQFadvdCDqzSMMkgmSl+B6YZbPnPLbkMDh27J8OwcGLUL+Y6JLwVPNTTMVJAdhpZ8z4nMRUqxnqIwcqer5gXap8MMyUC3awFTIQwCj2WyG5p7UWhsCLEqhilkpvECKlV7/+4hDwIgItGVlvFlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32; Sun, 28 Apr
 2024 03:31:11 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::e4a3:76ce:879:9129]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::e4a3:76ce:879:9129%7]) with mapi id 15.20.7519.031; Sun, 28 Apr 2024
 03:31:11 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Subject: RE: [PATCH v3 1/3] PCI/AER: Store UNCOR_STATUS bits that might be
 ANFE in aer_err_info
Thread-Topic: [PATCH v3 1/3] PCI/AER: Store UNCOR_STATUS bits that might be
 ANFE in aer_err_info
Thread-Index: AQHakI7e85jyDjVvVkqdnwboxKPALbF0f7+AgACn2ICABaA4AIACRenw
Date: Sun, 28 Apr 2024 03:31:11 +0000
Message-ID: <SJ0PR11MB6744C3EAA6E9D738EA0D3BAC92142@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20240417061407.1491361-1-zhenzhong.duan@intel.com>
	<20240417061407.1491361-2-zhenzhong.duan@intel.com>
	<20240422171629.00005675@Huawei.com>
	<SJ0PR11MB6744EC971D1BE6F3119EEA9992112@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <20240426171158.000024d4@Huawei.com>
In-Reply-To: <20240426171158.000024d4@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|IA1PR11MB6099:EE_
x-ms-office365-filtering-correlation-id: 3275d431-7147-42c9-7509-08dc6733a682
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|7416005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?QVlOVGM4WVA5Q0JoSzNZVUtIYldQNktScmlTNUJTOW5pYlNTeUVtdklYQzEr?=
 =?utf-8?B?eXd1dllOMHpTL3lBYVdmZ0pVMGVDc0tiN3BKa1JTNEhVUjlDYXNUb1pjMDlH?=
 =?utf-8?B?RnlQZE9yS2hZQ3czY2NDZTkyL216ZVN1YTZabzl3YzU4TkkvSFgweUlNUmRZ?=
 =?utf-8?B?dm5GNVd2bjF4aGNqUlp1dERuTThKM3E0OEhVZDRiYWtLc3FMQjN3SmlQUXNx?=
 =?utf-8?B?SjhQaFJEdmxjbWhWOVg4V2VaVHZPM0svcFVVclVubnBoZW13SmJXcGJyUzFD?=
 =?utf-8?B?Z056TE9FUmZIYmhTdEZWREFSRFoxeVVuVVAwMTNjSm9DU2JVdDR4L29PaHBH?=
 =?utf-8?B?VTZuVkVMMkxheklteGd1Q1NZV1NycVN4REF3YnZGL0tyRXlYRUdLVk9NY3Bn?=
 =?utf-8?B?UU0rM3lGby9oMGFUaG5HblBHSy9qMW9sUU5tOUdRR3ZyTDI1Z0xJbGVPU0s2?=
 =?utf-8?B?b2pQTlNYdnZLTjV1RGtpRWRBQnpDVDNRTVRLSXpoYmt5RnlmRHdZMWZXWVFR?=
 =?utf-8?B?SFh4Z1puK1BiLzR6THhpVHloVmVGbVlhRHh5VG9Pb2psaFFrY00ybU13NkdP?=
 =?utf-8?B?NGJnbERyaktoZ2ViekdjbTdEODV3TGJsRGtrOUdHUDNNdVNtMXdXQ2lTRmJ3?=
 =?utf-8?B?TUZyTE4xMUt0SUdtWlkwaDY2Q0MxeHdadXhHT09Xam1na2hMZ2plM2czYkxT?=
 =?utf-8?B?cFdrSFEvTTRPYkFTQnR6bHR5dHN0TDFiREdyTVZuU1l2WVowLzZqRk9NRlhU?=
 =?utf-8?B?akh1Y29LRmpXZ3dJQW04endyYWNrb2M0K2Nkb28xOWVHYTVMcFBzeVBMRE80?=
 =?utf-8?B?bDZERm1yNWxSU3k0eFFDQkllYmhJR2VGVzlZaDdmWVdVNnBFM3gvRTB5a3E0?=
 =?utf-8?B?bE15UEw3WmhNZUxiQTNaN2UralM1T1BuQ3FpKzVZRmo2RUIyYytQay96MFk2?=
 =?utf-8?B?cnRVcFJoWitxeVEzbGtzWks1VTIyanJoL0hFellzamVpWXBlRFk4NzZ4MlFS?=
 =?utf-8?B?RWQrak5BSStDSk9pSFltV3MxOVlMSWE1ZEZTV25WWHRDY1FPZTdZNWVtTDVW?=
 =?utf-8?B?bnBKTk9Ob1lKQXdWckJmcGNGREtINUxYZVZqWkx0OCtMcnhiL29MUldVTjFU?=
 =?utf-8?B?cURkang2bm11SThuU2xtSEtPc2RYL05iWlpLRkhVbjFVWWszY0hYZFlyQjQ5?=
 =?utf-8?B?UkNsZ3czQ0ROZVZUeVYzRkRleHVZWDZQeU5tMHA5RjQ5ODJCZ2JJcFNMWkxR?=
 =?utf-8?B?LzlvY0hNdUpqNFc2cEcyWFhwc0FwYTYxcnpjRXo4c2xkQjQ1SCtjVUFLbGNL?=
 =?utf-8?B?d2kwdURIUXB6R2d2VktwZTZGem0xZ1l6MzlYa3FZcE93QzZad2NHSzA3eGVu?=
 =?utf-8?B?MVYxM1FQMHZ1VE5CK2ZQRmNCeFNMWll2R2VucERIOG5FVktjeXpGUG9NVEMx?=
 =?utf-8?B?L2cyaTNCaEVxS3E5bWppTjFHaG1CSUFvK0hJa3d6OVlqcis4ckhDRWd5TXVm?=
 =?utf-8?B?dCtTZm83MlE3ZUxCQllKK3BvUjg5SytUWWRKRVppaC9qNlZmTndYZCtUMG1V?=
 =?utf-8?B?dFczQmpXeGN6SGQ4OXpWVTRsVWVIb0tQU00vMXEzbmExMCt2WEZHMU5oaG1F?=
 =?utf-8?B?enFMdHZPR2dSYzZOaEpvd3VXSUl6bnlNMFNveDZaR1ViTnpiMTM4NkZ6dnU1?=
 =?utf-8?B?TU93UmxHdXJ4YlBDQWdta0RyY09NdXRXVGhhRTZORjlvQlo5VXoyb3RSWjRZ?=
 =?utf-8?B?ZlphM0VUUzM1NXV4SWxPU01ISW9WcW11azVyRVZCN0cvYjN0dXhTT3FzNWpN?=
 =?utf-8?B?UWpReURseXp0Q2dVQ1RPUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6744.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGdpZmppVFJseVJZaE5MYVRjWXlSVTNtTUc0M0xwUHAyc3pYa3JzU2ZwaWRV?=
 =?utf-8?B?cDFQcjV6SnRYblNqbk96aFQ3ZzdzK0RWR01IZ0tFSVZMU1dSK3JLTFovbHpW?=
 =?utf-8?B?dXFZZ0RFMVc0S3pBV0dHSzlCQWJoUXNZKzdiOCswUlBRUzB2eVhIdktsa2Zy?=
 =?utf-8?B?T2swR1AyUFcyUUlwTVRaOUlqY0QyTTQxeHJEejBGMzR1RmN4dDZWN0hTZUdt?=
 =?utf-8?B?b1c4bUEySkpXMy9WTVFJcFlWZ1Z6anZNSVdITnJTSE4zVFlvMS9CQWFCN1ht?=
 =?utf-8?B?TVRCYVZha2dJeS9BYzlDYU00emllTE9hWitNcHgvSmRtVWRIS3ZyalNsMXFE?=
 =?utf-8?B?TlU5L2d3eS9MTXZUSjVmbmJ3OWgvaVlNODF5MWZiejY0dytrLzU2VkpCcGsv?=
 =?utf-8?B?YWFBRkxiN1UrbDBucWxlYnp3UTBTaEZWbkdTVnJ3djBRaWVOVXdjTTlML1JP?=
 =?utf-8?B?VVVkemV4NTdVTUFEMHhnY0ZJSklIbW8vSGM5Tm1SdEk1a3FZQmxrM2kySE12?=
 =?utf-8?B?ZE9qUVdtcVp3QVpaRi9JbDN6alJmUGNzbVZXY1h3bXNKNHRLM3dNRTRUeS9p?=
 =?utf-8?B?bVJpMlVaQlRoS1Z6d1U4ZnBGTVdqMWVYdEQwSWdGOTFEVnN3WGdBTWRvR3Vn?=
 =?utf-8?B?dWxveFlqSkc3VWZnUSsxOTlocUk0RjlYQXpmZHloYkpVdlFjellMVDY2ZFNy?=
 =?utf-8?B?THJVNE5xcmM4aW1USEF5QkNKSUcvMXVNNGZUVkhHMzRJYmR4cGhiM09qVjBS?=
 =?utf-8?B?aWloOGcrU0puWDN0V1ViTGhYWThiV3g4RGZNUUdtaUk4dzVMOGQ0di9ETWo2?=
 =?utf-8?B?VjNPeno4bXRoV1lvN3hrTDJ5amVzcDZBdEswaUl0dmlLNFlCa2Q5MmNyTW1B?=
 =?utf-8?B?dGRXT1pQWU9hTmpQeVdSWmtLSUhBSXVQT0U3MDZOOVRMRyt4ejdlc2psdEZn?=
 =?utf-8?B?Z0VGbmVBd0tLUWplSUo4VjdSQmFZRk9mQm1DTlVmSWdFQWRKWERzRkVTR3RI?=
 =?utf-8?B?RFU5VTRPOTRIL21mZjRBN3hxeE15NTkrYllpVnNqcmk4cnl3ajBzdGI2cUw2?=
 =?utf-8?B?ZmRncWp1UERnWEptZmc4YzBDV0lKWDZTRE5SSmQySzNDbEl3QTEwZ09zMGsy?=
 =?utf-8?B?U0E1eDZRVE9aMTQyZUg5K1VqU2tKYzBkeUJHYkc2cnBncWhWbHhRY3BtTnll?=
 =?utf-8?B?RStkYXNIVXNTbnBvV29pZHdiTnphWHEreVBqeU05Q01QL09sV3N4NXd2UGI0?=
 =?utf-8?B?TGtvZEp1YnpaQmlHL29WN1ZrMnlVNTFOYjU3QjQwOUxaK0RCYXYzVkMrSzNE?=
 =?utf-8?B?eDVxV0U2cDlXODF4YWFTdTI5eklKUHgrd0ZkNUxDeG9pU1JkM29aRHp5T2xF?=
 =?utf-8?B?NUM1WTl2ZGFhNW9NcEpiMWEzM25QVU9JRFhXaVNzTG4zOTRxVXVUcWs3aW9O?=
 =?utf-8?B?bWhUNVh1NFN2NG90dmFCc2hxZmZEQ0tSZnViU1RzNFd4VlBmNEdmazZLQVZE?=
 =?utf-8?B?Q3I0Q3YwYUt3ZmpQbFZEbFBDaXRIYlpwWUZTSFF5citRbWg4WDJWaUhZYURN?=
 =?utf-8?B?WmR6emlCNG5xSFJxTlozTVdxQ1czajZnek5uTlNPVmNsS2F1dW1nOGVkTTUz?=
 =?utf-8?B?blQ2VHFyWDR5aEQ2bGJSTXFUU0dLOURIWUZrQmxsUDkxcjJ1VnAxSzFWMldt?=
 =?utf-8?B?UEhJanVSRVlrLzZzYXV2RFArRmFjM3Y4SUZTS3FYWWhvK0tFbEF0ZENZTFo0?=
 =?utf-8?B?dzd3MlFHUkF6eEFlcFhyZXVycEFmVC9Dc1ZPRVhkcWFCQ0lWVFlOS3Z3Vnkv?=
 =?utf-8?B?RVdXUzdsMy9lMGhTQlFyVnc0THk5WEExV0owd2VuQ2w1STk1YVViNkluQWFi?=
 =?utf-8?B?M2xBWmlYUlNSTk5qeFZ3dGtjdk5vMXB4NTEvTy9aTjI4TnpZSUxLQU9aalNH?=
 =?utf-8?B?TWlEVGVNZDVmSFNiNHdGcFk3Q04zaU9FSUNURXNaZnBqSkIwQWZ3NjBJM0Ri?=
 =?utf-8?B?R1E3SlMzdm9sQ0lMMzQ5K2c3eGxQTXRGckNRRFpMQWtYVnFOSHZLMmxPTkV1?=
 =?utf-8?B?UXdTSFpKUS92Q25GNUxKT3h3QzFCSSs3WTN3allCQWFESXIvcGZFeW5LTjJN?=
 =?utf-8?Q?SpoqaPkUoXFZDdjb+NaaT8+3+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3275d431-7147-42c9-7509-08dc6733a682
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2024 03:31:11.3815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7wU0De0ZTvXJ3GuI7WEy1yV4tIyPNPZ3Z/qY/ivT/Y88MuSFAapcMMkCHB+CIfh2Gxizng88iUj2vD4NcvGEz9hlCWstxB8y+bvxwwjxXZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
X-OriginatorOrg: intel.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "linmiaohe@huawei.com" <linmiaohe@huawei.com>, "Schofield,
 Alison" <alison.schofield@intel.com>, "rafael@kernel.org" <rafael@kernel.org>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Tsaur, Erwin" <erwin.tsaur@intel.com>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oohall@gmail.com" <oohall@gmail.com>, "Weiny, Ira" <ira.weiny@intel.com>, "dave@stgolabs.net" <dave@stgolabs.net>, "Jiang, Dave" <dave.jiang@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Smita.KoralahalliChannabasappa@amd.com" <Smita.KoralahalliChannabasappa@amd.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "helgaas@kernel.org" <helgaas@kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "Peng, Chao P" <chao.p.peng@intel.com>, "rrichter@amd.com" <rrichter@amd.com>, "Wang, Yudong" <yudong.wang@intel.com>, "bp@alien8.de" <bp@alien8.de>, "qingshun.wang@linux.intel.com" <qingshun.wang@linux.intel.
 com>, "bhelgaas@google.com" <bhelgaas@google.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, "Wanyan, Feiting" <feiting.wanyan@intel.com>, "Preble, Adam C" <adam.c.preble@intel.com>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "lukas@wunner.de" <lukas@wunner.de>, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "shiju.jose@huawei.com" <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgSm9uYXRoYW4sDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEpvbmF0
aGFuIENhbWVyb24gPEpvbmF0aGFuLkNhbWVyb25ASHVhd2VpLmNvbT4NCj5TdWJqZWN0OiBSZTog
W1BBVENIIHYzIDEvM10gUENJL0FFUjogU3RvcmUgVU5DT1JfU1RBVFVTIGJpdHMgdGhhdCBtaWdo
dA0KPmJlIEFORkUgaW4gYWVyX2Vycl9pbmZvDQo+DQo+T24gVHVlLCAyMyBBcHIgMjAyNCAwMjoy
NTowNSArMDAwMA0KPiJEdWFuLCBaaGVuemhvbmciIDx6aGVuemhvbmcuZHVhbkBpbnRlbC5jb20+
IHdyb3RlOg0KPg0KPj4gPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiA+RnJvbTogSm9u
YXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBIdWF3ZWkuY29tPg0KPj4gPlN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjMgMS8zXSBQQ0kvQUVSOiBTdG9yZSBVTkNPUl9TVEFUVVMgYml0cyB0aGF0
DQo+bWlnaHQNCj4+ID5iZSBBTkZFIGluIGFlcl9lcnJfaW5mbw0KPj4gPg0KPj4gPk9uIFdlZCwg
MTcgQXByIDIwMjQgMTQ6MTQ6MDUgKzA4MDANCj4+ID5aaGVuemhvbmcgRHVhbiA8emhlbnpob25n
LmR1YW5AaW50ZWwuY29tPiB3cm90ZToNCj4+ID4NCj4+ID4+IEluIHNvbWUgY2FzZXMgdGhlIGRl
dGVjdG9yIG9mIGEgTm9uLUZhdGFsIEVycm9yKE5GRSkgaXMgbm90IHRoZSBtb3N0DQo+PiA+PiBh
cHByb3ByaWF0ZSBhZ2VudCB0byBkZXRlcm1pbmUgdGhlIHR5cGUgb2YgdGhlIGVycm9yLiBGb3Ig
ZXhhbXBsZSwNCj4+ID4+IHdoZW4gc29mdHdhcmUgcGVyZm9ybXMgYSBjb25maWd1cmF0aW9uIHJl
YWQgZnJvbSBhIG5vbi1leGlzdGVudA0KPj4gPj4gZGV2aWNlIG9yIEZ1bmN0aW9uLCBjb21wbGV0
ZXIgd2lsbCBzZW5kIGFuIEVSUl9OT05GQVRBTCBNZXNzYWdlLg0KPj4gPj4gT24gc29tZSBwbGF0
Zm9ybXMsIEVSUl9OT05GQVRBTCByZXN1bHRzIGluIGEgU3lzdGVtIEVycm9yLCB3aGljaA0KPj4g
Pj4gYnJlYWtzIG5vcm1hbCBzb2Z0d2FyZSBwcm9iaW5nLg0KPj4gPj4NCj4+ID4+IEFkdmlzb3J5
IE5vbi1GYXRhbCBFcnJvcihBTkZFKSBpcyBhIHNwZWNpYWwgY2FzZSB0aGF0IGNhbiBiZSB1c2Vk
DQo+PiA+PiBpbiBhYm92ZSBzY2VuYXJpby4gSXQgaXMgcHJlZG9taW5hbnRseSBkZXRlcm1pbmVk
IGJ5IHRoZSByb2xlIG9mIHRoZQ0KPj4gPj4gZGV0ZWN0aW5nIGFnZW50IChSZXF1ZXN0ZXIsIENv
bXBsZXRlciwgb3IgUmVjZWl2ZXIpIGFuZCB0aGUgc3BlY2lmaWMNCj4+ID4+IGVycm9yLiBJbiBz
dWNoIGNhc2VzLCBhbiBhZ2VudCB3aXRoIEFFUiBzaWduYWxzIHRoZSBORkUgKGlmIGVuYWJsZWQp
DQo+PiA+PiBieSBzZW5kaW5nIGFuIEVSUl9DT1IgTWVzc2FnZSBhcyBhbiBhZHZpc29yeSB0byBz
b2Z0d2FyZSwgaW5zdGVhZCBvZg0KPj4gPj4gc2VuZGluZyBFUlJfTk9ORkFUQUwuDQo+PiA+Pg0K
Pj4gPj4gV2hlbiBwcm9jZXNzaW5nIGFuIEFORkUsIGlkZWFsbHkgYm90aCBjb3JyZWN0YWJsZSBl
cnJvcihDRSkgc3RhdHVzIGFuZA0KPj4gPj4gdW5jb3JyZWN0YWJsZSBlcnJvcihVRSkgc3RhdHVz
IHNob3VsZCBiZSBjbGVhcmVkLiBIb3dldmVyLCB0aGVyZSBpcyBubw0KPj4gPj4gd2F5IHRvIGZ1
bGx5IGlkZW50aWZ5IHRoZSBVRSBhc3NvY2lhdGVkIHdpdGggQU5GRS4gRXZlbiB3b3JzZSwgYSBG
YXRhbA0KPj4gPj4gRXJyb3IoRkUpIG9yIE5vbi1GYXRhbCBFcnJvcihORkUpIG1heSBzZXQgdGhl
IHNhbWUgVUUgc3RhdHVzIGJpdCBhcw0KPj4gPj4gQU5GRS4gVHJlYXRpbmcgYW4gQU5GRSBhcyBO
RkUgd2lsbCByZXByb2R1Y2UgYWJvdmUgbWVudGlvbmVkIGlzc3VlLA0KPj4gPj4gaS5lLiwgYnJl
YWtpbmcgc29mdHdvcmUgcHJvYmluZzsgdHJlYXRpbmcgTkZFIGFzIEFORkUgd2lsbCBtYWtlIHVz
DQo+PiA+PiBpZ25vcmluZyBzb21lIFVFcyB3aGljaCBuZWVkIGFjdGl2ZSByZWNvdmVyIG9wZXJh
dGlvbi4gVG8gYXZvaWQNCj5jbGVhcmluZw0KPj4gPj4gVUVzIHRoYXQgYXJlIG5vdCBBTkZFIGJ5
IGFjY2lkZW50LCB0aGUgbW9zdCBjb25zZXJ2YXRpdmUgcm91dGUgaXMgdGFrZW4NCj4+ID4+IGhl
cmU6IElmIGFueSBvZiB0aGUgRkUvTkZFIERldGVjdGVkIGJpdHMgaXMgc2V0IGluIERldmljZSBT
dGF0dXMsIGRvIG5vdA0KPj4gPj4gdG91Y2ggVUUgc3RhdHVzLCB0aGV5IHNob3VsZCBiZSBjbGVh
cmVkIGxhdGVyIGJ5IHRoZSBVRSBoYW5kbGVyLg0KPk90aGVyd2lzZSwNCj4+ID4+IGEgc3BlY2lm
aWMgc2V0IG9mIFVFcyB0aGF0IG1heSBiZSByYWlzZWQgYXMgQU5GRSBhY2NvcmRpbmcgdG8gdGhl
IFBDSWUNCj4+ID4+IHNwZWNpZmljYXRpb24gd2lsbCBiZSBjbGVhcmVkIGlmIHRoZWlyIGNvcnJl
c3BvbmRpbmcgc2V2ZXJpdHkgaXMgTm9uLUZhdGFsLg0KPj4gPj4NCj4+ID4+IFRvIGFjaGlldmUg
YWJvdmUgcHVycG9zZSwgc3RvcmUgVU5DT1JfU1RBVFVTIGJpdHMgdGhhdCBtaWdodCBiZQ0KPkFO
RkUNCj4+ID4+IGluIGFlcl9lcnJfaW5mby5hbmZlX3N0YXR1cy4gU28gdGhhdCB0aG9zZSBiaXRz
IGNvdWxkIGJlIHByaW50ZWQgYW5kDQo+PiA+PiBwcm9jZXNzZWQgbGF0ZXIuDQo+PiA+Pg0KPj4g
Pj4gVGVzdGVkLWJ5OiBZdWRvbmcgV2FuZyA8eXVkb25nLndhbmdAaW50ZWwuY29tPg0KPj4gPj4g
Q28tZGV2ZWxvcGVkLWJ5OiAiV2FuZywgUWluZ3NodW4iIDxxaW5nc2h1bi53YW5nQGxpbnV4Lmlu
dGVsLmNvbT4NCj4+ID4+IFNpZ25lZC1vZmYtYnk6ICJXYW5nLCBRaW5nc2h1biIgPHFpbmdzaHVu
LndhbmdAbGludXguaW50ZWwuY29tPg0KPj4gPj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1
YW4gPHpoZW56aG9uZy5kdWFuQGludGVsLmNvbT4NCj4+ID4+IC0tLQ0KPj4gPj4gIGRyaXZlcnMv
cGNpL3BjaS5oICAgICAgfCAgMSArDQo+PiA+PiAgZHJpdmVycy9wY2kvcGNpZS9hZXIuYyB8IDQ1
DQo+PiA+KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiA+PiAg
MiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspDQo+PiA+Pg0KPj4gPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGNpL3BjaS5oIGIvZHJpdmVycy9wY2kvcGNpLmgNCj4+ID4+IGluZGV4IDE3
ZmVkMTg0Njg0Ny4uM2Y5ZWI4MDdmOWZkIDEwMDY0NA0KPj4gPj4gLS0tIGEvZHJpdmVycy9wY2kv
cGNpLmgNCj4+ID4+ICsrKyBiL2RyaXZlcnMvcGNpL3BjaS5oDQo+PiA+PiBAQCAtNDEyLDYgKzQx
Miw3IEBAIHN0cnVjdCBhZXJfZXJyX2luZm8gew0KPj4gPj4NCj4+ID4+ICAJdW5zaWduZWQgaW50
IHN0YXR1czsJCS8qIENPUi9VTkNPUiBFcnJvciBTdGF0dXMgKi8NCj4+ID4+ICAJdW5zaWduZWQg
aW50IG1hc2s7CQkvKiBDT1IvVU5DT1IgRXJyb3IgTWFzayAqLw0KPj4gPj4gKwl1bnNpZ25lZCBp
bnQgYW5mZV9zdGF0dXM7CS8qIFVOQ09SIEVycm9yIFN0YXR1cyBmb3IgQU5GRSAqLw0KPj4gPj4g
IAlzdHJ1Y3QgcGNpZV90bHBfbG9nIHRscDsJLyogVExQIEhlYWRlciAqLw0KPj4gPj4gIH07DQo+
PiA+Pg0KPj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3BjaWUvYWVyLmMgYi9kcml2ZXJz
L3BjaS9wY2llL2Flci5jDQo+PiA+PiBpbmRleCBhYzYyOTNjMjQ5NzYuLjI3MzY0YWI0YjE0OCAx
MDA2NDQNCj4+ID4+IC0tLSBhL2RyaXZlcnMvcGNpL3BjaWUvYWVyLmMNCj4+ID4+ICsrKyBiL2Ry
aXZlcnMvcGNpL3BjaWUvYWVyLmMNCj4+ID4+IEBAIC0xMDcsNiArMTA3LDEyIEBAIHN0cnVjdCBh
ZXJfc3RhdHMgew0KPj4gPj4gIAkJCQkJUENJX0VSUl9ST09UX01VTFRJX0NPUl9SQ1YgfA0KPj4g
PglcDQo+PiA+PiAgCQkJCQlQQ0lfRVJSX1JPT1RfTVVMVElfVU5DT1JfUkNWKQ0KPj4gPj4NCj4+
ID4+ICsjZGVmaW5lIEFFUl9FUlJfQU5GRV9VTkNfTUFTSw0KPj4gPgkoUENJX0VSUl9VTkNfUE9J
U09OX1RMUCB8CVwNCj4+ID4+ICsJCQkJCVBDSV9FUlJfVU5DX0NPTVBfVElNRSB8DQo+PiA+CVwN
Cj4+ID4+ICsJCQkJCVBDSV9FUlJfVU5DX0NPTVBfQUJPUlQgfA0KPj4gPglcDQo+PiA+PiArCQkJ
CQlQQ0lfRVJSX1VOQ19VTlhfQ09NUCB8DQo+PiA+CVwNCj4+ID4+ICsJCQkJCVBDSV9FUlJfVU5D
X1VOU1VQKQ0KPj4gPj4gKw0KPj4gPj4gIHN0YXRpYyBpbnQgcGNpZV9hZXJfZGlzYWJsZTsNCj4+
ID4+ICBzdGF0aWMgcGNpX2Vyc19yZXN1bHRfdCBhZXJfcm9vdF9yZXNldChzdHJ1Y3QgcGNpX2Rl
diAqZGV2KTsNCj4+ID4+DQo+PiA+PiBAQCAtMTE5Niw2ICsxMjAyLDQxIEBAIHZvaWQgYWVyX3Jl
Y292ZXJfcXVldWUoaW50IGRvbWFpbiwNCj51bnNpZ25lZA0KPj4gPmludCBidXMsIHVuc2lnbmVk
IGludCBkZXZmbiwNCj4+ID4+ICBFWFBPUlRfU1lNQk9MX0dQTChhZXJfcmVjb3Zlcl9xdWV1ZSk7
DQo+PiA+PiAgI2VuZGlmDQo+PiA+Pg0KPj4gPj4gK3N0YXRpYyB2b2lkIGFuZmVfZ2V0X3VjX3N0
YXR1cyhzdHJ1Y3QgcGNpX2RldiAqZGV2LCBzdHJ1Y3QNCj5hZXJfZXJyX2luZm8NCj4+ID4qaW5m
bykNCj4+ID4+ICt7DQo+PiA+PiArCXUzMiB1bmNvcl9tYXNrLCB1bmNvcl9zdGF0dXM7DQo+PiA+
PiArCXUxNiBkZXZpY2Vfc3RhdHVzOw0KPj4gPj4gKwlpbnQgYWVyID0gZGV2LT5hZXJfY2FwOw0K
Pj4gPj4gKw0KPj4gPj4gKwlpZiAocGNpZV9jYXBhYmlsaXR5X3JlYWRfd29yZChkZXYsIFBDSV9F
WFBfREVWU1RBLA0KPj4gPiZkZXZpY2Vfc3RhdHVzKSkNCj4+ID4+ICsJCXJldHVybjsNCj4+ID4+
ICsJLyoNCj4+ID4+ICsJICogVGFrZSB0aGUgbW9zdCBjb25zZXJ2YXRpdmUgcm91dGUgaGVyZS4g
SWYgdGhlcmUgYXJlDQo+PiA+PiArCSAqIE5vbi1GYXRhbC9GYXRhbCBlcnJvcnMgZGV0ZWN0ZWQs
IGRvIG5vdCBhc3N1bWUgYW55DQo+PiA+PiArCSAqIGJpdCBpbiB1bmNvcl9zdGF0dXMgaXMgc2V0
IGJ5IEFORkUuDQo+PiA+PiArCSAqLw0KPj4gPj4gKwlpZiAoZGV2aWNlX3N0YXR1cyAmIChQQ0lf
RVhQX0RFVlNUQV9ORkVEIHwgUENJX0VYUF9ERVZTVEFfRkVEKSkNCj4+ID4+ICsJCXJldHVybjsN
Cj4+ID4+ICsNCj4+ID4NCj4+ID5JcyB0aGVyZSBub3QgYSByYWNlIGhlcmU/ICBJZiB3ZSBoYXBw
ZW4gdG8gZ2V0IGVpdGhlciBhbiBORkVEIG9yIEZFRA0KPj4gPmJldHdlZW4gdGhlIHJlYWQgb2Yg
ZGV2aWNlX3N0YXR1cyBhYm92ZSBhbmQgaGVyZSB3ZSBtaWdodCBwaWNrIHVwIGENCj5zdGF0dXMN
Cj4+ID50aGF0IGNvcnJlc3BvbmRzIHRvIHRoYXQgKGFuZCBoZW5jZSBjbGVhciBzb21ldGhpbmcg
d2Ugc2hvdWxkIG5vdCkuDQo+Pg0KPj4gSW4gdGhpcyBzY2VuYXJpbywgaW5mby0+YW5mZV9zdGF0
dXMgaXMgMC4NCj4NCj5PSy4gSW4gdGhhdCBjYXNlIHdoYXQgaXMgdGhlIHBvaW50IG9mIHRoZSBj
aGVjayBhYm92ZT8NCj5JZiB0aGUgY29kZSBpcyBzYWZlIHRvIHJhY2VzLCBpdCdzIHNhZmUgdG8g
Z28gYWhlYWQgd2l0aG91dCB0aGF0IGNoZWNrDQo+b24gd2hhdCBtaWdodCByYWNlLg0KDQpHb29k
IHF1ZXN0aW9uLg0KQWZ0ZXIgZnVydGhlciBkaWdnaW5nIGludG8gdGhlIHNwZWMsIEkganVzdCBm
b3VuZCBJIG1pc3VuZGVyc3Rvb2QgaXQuDQpBbiBVTkNVUiBlcnJvciByYWlzZWQgYXMgQU5GRSBj
YW4gYmUgcmFpc2VkIGFzIE5GRSBpbiBkaWZmZXJlbnQgY2FzZXMsDQpzbyBpbmZvLT5hbmZlX3N0
YXR1cyBjYW4gYmUgbm9uemVybyBoZXJlIGFuZCB0aGUgcmFjZSB5b3UgbWVudGlvbmVkDQpkb2Vz
IGV4aXN0LCB0aGUgY2hlY2sgb24gUENJX0VYUF9ERVZTVEFfRkVEIGlzIGFsc28gdW5uZWNlc3Nh
cnkuDQpTb3JyeSBmb3IgdGhlIG1pc2xlYWRpbmcuIEkgcGxhbiB0byBoYXZlIGJlbG93IGNoYW5n
ZSB0byBmaXggdGhlIHJhY2U6DQoNCiAgICAgICB1bnNpZ25lZCBpbnQgYW5mZV9zdGF0dXM7DQog
ICAgICAgYW5mZV9zdGF0dXMgPSB1bmNvcl9zdGF0dXMgJiB+dW5jb3JfbWFzayAmIH5pbmZvLT5z
ZXZlcml0eSAmDQogICAgICAgICAgICAgICAgICAgICAgICAgICBBRVJfRVJSX0FORkVfVU5DX01B
U0s7DQoNCiAgICAgICBpZiAocGNpZV9jYXBhYmlsaXR5X3JlYWRfd29yZChkZXYsIFBDSV9FWFBf
REVWU1RBLCAmZGV2aWNlX3N0YXR1cykpDQogICAgICAgICAgICAgICByZXR1cm47DQogICAgICAg
LyoNCiAgICAgICAgKiBUYWtlIHRoZSBtb3N0IGNvbnNlcnZhdGl2ZSByb3V0ZSBoZXJlLiBJZiB0
aGVyZSBhcmUNCiAgICAgICAgKiBOb24tRmF0YWwgZXJyb3JzIGRldGVjdGVkLCBkbyBub3QgYXNz
dW1lIGFueQ0KICAgICAgICAqIGJpdCBpbiB1bmNvcl9zdGF0dXMgaXMgc2V0IGJ5IEFORkUuDQog
ICAgICAgICovDQogICAgICAgaWYgKGRldmljZV9zdGF0dXMgJiBQQ0lfRVhQX0RFVlNUQV9ORkVE
KQ0KICAgICAgICAgICAgICAgcmV0dXJuOw0KICAgICAgICBpbmZvLT5hbmZlX3N0YXR1cyA9IGFu
ZmVfc3RhdHVzOw0KDQpXaXRoIHRoaXMgY2hhbmdlLCB0aGVyZSBpcyBzdGlsbCBhIHNtYWxsIHdp
bmRvdyBiZXR3ZWVuIHJlYWRpbmcgdW5jb3Jfc3RhdHVzDQphbmQgZGV2aWNlX3N0YXR1cyB0byBs
ZWFrIEFORkUsIGJ1dCB0aGF0J3MgdGhlIGJlc3Qgd2UgY2FuIGRvIGFuZCBiZXR0ZXINCnRoYW4g
Y2xlYXJpbmcgTkZFLiBMZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBiZXR0ZXIgaWRlYfCfmIoNCg0K
VGhhbmtzDQpaaGVuemhvbmcNCg0KPg0KPj4NCj4+ID4NCj4+ID5PciBhbSBJIG1pc3NpbmcgdGhh
dCByYWNlIGJlaW5nIGNsb3NlIHNvbWV3aGVyZT8NCj4+DQo+PiBUaGUgYml0cyBsZWFkaW5nIHRv
IE5GRUQgb3IgRkVEIGlzIG1hc2tlZCBvdXQgd2hlbiBhc3NpZ25pbmcgaW5mby0NCj4+YW5mZV9z
dGF0dXMuDQo+PiBCaXRzIGZvciBGRUQgaXMgbWFza2VkIG91dCBieSB+aW5mby0+c2V2ZXJpdHks
DQo+PiBiaXQgZm9yIE5GRUQgaXMgbWFza2VkIG91dCBieSBBRVJfRVJSX0FORkVfVU5DX01BU0su
DQo+Pg0KPj4gU28gd2UgbmV2ZXIgY2xlYXIgc3RhdHVzIGJpdHMgZm9yIE5GRUQgb3IgRkVEIGlu
IEFORkUgaGFuZGxlci4NCj4+DQo+PiBTZWUgYmVsb3cgYXNzaWdubWVudCBvZiBpbmZvLT5hbmZl
X3N0YXR1cy4NCj4+DQo+PiBUaGFua3MNCj4+IFpoZW56aG9uZw0KPj4NCj4+ID4NCj4+ID4+ICsJ
cGNpX3JlYWRfY29uZmlnX2R3b3JkKGRldiwgYWVyICsgUENJX0VSUl9VTkNPUl9TVEFUVVMsDQo+
PiA+JnVuY29yX3N0YXR1cyk7DQo+PiA+PiArCXBjaV9yZWFkX2NvbmZpZ19kd29yZChkZXYsIGFl
ciArIFBDSV9FUlJfVU5DT1JfTUFTSywNCj4+ID4mdW5jb3JfbWFzayk7DQo+PiA+PiArCS8qDQo+
PiA+PiArCSAqIEFjY29yZGluZyB0byBQQ0llIEJhc2UgU3BlY2lmaWNhdGlvbiBSZXZpc2lvbiA2
LjEsDQo+PiA+PiArCSAqIFNlY3Rpb24gNi4yLjMuMi40LCBpZiBhbiBVTkNPUiBlcnJvciBpcyBy
YWlzZWQgYXMNCj4+ID4+ICsJICogQWR2aXNvcnkgTm9uLUZhdGFsIGVycm9yLCBpdCB3aWxsIG1h
dGNoIHRoZSBmb2xsb3dpbmcNCj4+ID4+ICsJICogY29uZGl0aW9uczoNCj4+ID4+ICsJICoJYS4g
VGhlIHNldmVyaXR5IG9mIHRoZSBlcnJvciBpcyBOb24tRmF0YWwuDQo+PiA+PiArCSAqCWIuIFRo
ZSBlcnJvciBpcyBvbmUgb2YgdGhlIGZvbGxvd2luZzoNCj4+ID4+ICsJICoJCTEuIFBvaXNvbmVk
IFRMUCAgICAgICAgICAgKFNlY3Rpb24gNi4yLjMuMi40LjMpDQo+PiA+PiArCSAqCQkyLiBDb21w
bGV0aW9uIFRpbWVvdXQgICAgIChTZWN0aW9uIDYuMi4zLjIuNC40KQ0KPj4gPj4gKwkgKgkJMy4g
Q29tcGxldGVyIEFib3J0ICAgICAgICAoU2VjdGlvbiA2LjIuMy4yLjQuMSkNCj4+ID4+ICsJICoJ
CTQuIFVuZXhwZWN0ZWQgQ29tcGxldGlvbiAgKFNlY3Rpb24gNi4yLjMuMi40LjUpDQo+PiA+PiAr
CSAqCQk1LiBVbnN1cHBvcnRlZCBSZXF1ZXN0ICAgIChTZWN0aW9uIDYuMi4zLjIuNC4xKQ0KPj4g
Pj4gKwkgKi8NCj4+ID4+ICsJaW5mby0+YW5mZV9zdGF0dXMgPSB1bmNvcl9zdGF0dXMgJiB+dW5j
b3JfbWFzayAmIH5pbmZvLT5zZXZlcml0eQ0KPj4gPiYNCj4+ID4+ICsJCQkgICAgQUVSX0VSUl9B
TkZFX1VOQ19NQVNLOw0KPj4gPj4gK30NCj4+ID4+ICsNCj4+ID4+ICAvKioNCj4+ID4+ICAgKiBh
ZXJfZ2V0X2RldmljZV9lcnJvcl9pbmZvIC0gcmVhZCBlcnJvciBzdGF0dXMgZnJvbSBkZXYgYW5k
IHN0b3JlIGl0DQo+dG8NCj4+ID5pbmZvDQo+PiA+PiAgICogQGRldjogcG9pbnRlciB0byB0aGUg
ZGV2aWNlIGV4cGVjdGVkIHRvIGhhdmUgYSBlcnJvciByZWNvcmQNCj4+ID4+IEBAIC0xMjEzLDYg
KzEyNTQsNyBAQCBpbnQgYWVyX2dldF9kZXZpY2VfZXJyb3JfaW5mbyhzdHJ1Y3QgcGNpX2Rldg0K
Pj4gPipkZXYsIHN0cnVjdCBhZXJfZXJyX2luZm8gKmluZm8pDQo+PiA+Pg0KPj4gPj4gIAkvKiBN
dXN0IHJlc2V0IGluIHRoaXMgZnVuY3Rpb24gKi8NCj4+ID4+ICAJaW5mby0+c3RhdHVzID0gMDsN
Cj4+ID4+ICsJaW5mby0+YW5mZV9zdGF0dXMgPSAwOw0KPj4gPj4gIAlpbmZvLT50bHBfaGVhZGVy
X3ZhbGlkID0gMDsNCj4+ID4+DQo+PiA+PiAgCS8qIFRoZSBkZXZpY2UgbWlnaHQgbm90IHN1cHBv
cnQgQUVSICovDQo+PiA+PiBAQCAtMTIyNiw2ICsxMjY4LDkgQEAgaW50IGFlcl9nZXRfZGV2aWNl
X2Vycm9yX2luZm8oc3RydWN0IHBjaV9kZXYNCj4+ID4qZGV2LCBzdHJ1Y3QgYWVyX2Vycl9pbmZv
ICppbmZvKQ0KPj4gPj4gIAkJCSZpbmZvLT5tYXNrKTsNCj4+ID4+ICAJCWlmICghKGluZm8tPnN0
YXR1cyAmIH5pbmZvLT5tYXNrKSkNCj4+ID4+ICAJCQlyZXR1cm4gMDsNCj4+ID4+ICsNCj4+ID4+
ICsJCWlmIChpbmZvLT5zdGF0dXMgJiBQQ0lfRVJSX0NPUl9BRFZfTkZBVCkNCj4+ID4+ICsJCQlh
bmZlX2dldF91Y19zdGF0dXMoZGV2LCBpbmZvKTsNCj4+ID4+ICAJfSBlbHNlIGlmICh0eXBlID09
IFBDSV9FWFBfVFlQRV9ST09UX1BPUlQgfHwNCj4+ID4+ICAJCSAgIHR5cGUgPT0gUENJX0VYUF9U
WVBFX1JDX0VDIHx8DQo+PiA+PiAgCQkgICB0eXBlID09IFBDSV9FWFBfVFlQRV9ET1dOU1RSRUFN
IHx8DQo+Pg0KPj4NCg0K
