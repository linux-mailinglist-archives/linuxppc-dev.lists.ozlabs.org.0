Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD88A7612
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 23:03:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=dfSF3+v9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJxN13TV7z3vY8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 07:03:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=dfSF3+v9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=motorola.com (client-ip=148.163.148.104; helo=mx0a-00823401.pphosted.com; envelope-from=mbland@motorola.com; receiver=lists.ozlabs.org)
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJxMH0dYTz2y3b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 07:02:50 +1000 (AEST)
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GHWafL029459;
	Tue, 16 Apr 2024 21:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	DKIM202306; bh=XYN93Oow0gH6u0zsgPe8G9RMHXSvBCiW87nFw/47dUY=; b=d
	fSF3+v9n4QhTWMaBDDjdiWT5KbK0pnh2BXGkgf6i7nHmBsgWCUsWai9koTNPfDVh
	sKD6vA0684EdUK1dOuInA0sNuJzwQJro/pXbW1+slY9ftNB8XJic9eGu3mL/krB/
	eHCT1jqR9OyAnLEP0bbbNG3d4pTOmDB9jLuzNzCJfL7CKrrvB/xIC6Hps9xMIIA2
	Sm+oVpPOtYFJ4vxtEIDLbwCWHouemz7EUiH+OA0rXT2/i9+u6d9Jknf6tlcx/o3s
	EkgbO2JuMW9hNkIlae0wUaFHbdYEaCjv2QOIUr2IXtR15tuKXQYvU9EmYShM1hiD
	ZIiM8XxuR9Vv1m199LQyw==
Received: from apc01-tyz-obe.outbound.protection.outlook.com (mail-tyzapc01lp2040.outbound.protection.outlook.com [104.47.110.40])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 3xhwtrr9cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 21:01:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhOoJY3YFOnfLkunkJ1SNQwVm1rJBzg0Z0qOnxV0Q3si/AHPbp1CT25rR/ihwFu/Hfy8eovY2fNmPkbTyHBMXYZw3/I7dLDz6twAZ6aZhFY3xHZ7FVOArKac9WrP9fQdA/ETP+xbNbuErHGuFHkZcD1y3ioEg1E48gLzOEF87lGBl6zgzyehvzpL7CVIMMjuZemIqf+4iNrvWSl8MvkyamgRh/2GtGpIVKGm1M08TeWA8zTB23pexYg6iM/uoPrWEcmlev2NU1xtr+bFJkY89pNE344Cr77xfGmZQo/zNKOc9pWdRYmD4toP9HqPI78EDb+t/K0xZz2+jXhscbn8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYN93Oow0gH6u0zsgPe8G9RMHXSvBCiW87nFw/47dUY=;
 b=M8MqUJIduXOjV8Z7ELbRmyGuFFdGUwtULuz6eMNy3FWMdi1I+0ii369dCpVO8F2fKqujCKr/MewDyCDCk/ZTOOcgFLK6vBx2I1WcUB6qdCUKflLUHt/w9JTk6iS4UkwpX2A8Jaq0VL6oXBIcflJWhfqm2c9mygXRH9I9fJk0St6cr5vuy4x0UdftXvvVPAOjlFsqNSFLTYQl+ORCjLy+eOmvfSWZNH37M/LTCm6+nmgd8SO/w+vS18qP85IeeAxfU6+K+/1rMW53pQzkVZq/eJNNjfikxjyQQA7RRdebzG+obaMk+Mx+u5TTeEZ+IAka6UiCZx6gRR7xD7X14jP8rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=motorola.com; dmarc=pass action=none header.from=motorola.com;
 dkim=pass header.d=motorola.com; arc=none
Received: from SEZPR03MB6786.apcprd03.prod.outlook.com (2603:1096:101:66::5)
 by SEYPR03MB8377.apcprd03.prod.outlook.com (2603:1096:101:20b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 21:01:51 +0000
Received: from SEZPR03MB6786.apcprd03.prod.outlook.com
 ([fe80::2071:df9c:5f50:a9a6]) by SEZPR03MB6786.apcprd03.prod.outlook.com
 ([fe80::2071:df9c:5f50:a9a6%4]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 21:01:51 +0000
From: Maxwell Bland <mbland@motorola.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 5/5] ptdump: add state parameter for non-leaf callback
Thread-Topic: [PATCH 5/5] ptdump: add state parameter for non-leaf callback
Thread-Index: AQHakEFN2x+RUiCDSkSLW5+qEs+AEg==
Date: Tue, 16 Apr 2024 21:01:51 +0000
Message-ID:  <SEZPR03MB678616F040A28418A3C84587B4082@SEZPR03MB6786.apcprd03.prod.outlook.com>
References: <20240416122254.868007168-1-mbland@motorola.com>
	<20240416122254.868007168-6-mbland@motorola.com>
 <20240416131120.a801ff03a6d0bbec0e9151c8@linux-foundation.org>
In-Reply-To: <20240416131120.a801ff03a6d0bbec0e9151c8@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB6786:EE_|SEYPR03MB8377:EE_
x-ms-office365-filtering-correlation-id: 7e162c6e-cb19-48af-dfd9-08dc5e58705c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  =?utf-8?B?Kzh0dVZjKzZUQVUyWFA2dEwwcm84WlMrOEVXWTlzejBqSXdpVi90Uy9vSUhX?=
 =?utf-8?B?SHNKNC9FcUZHMXhkeHNqRGZGSTAyMTVjVElIa3krNTZ5WVZsSFk1NlRaNlcy?=
 =?utf-8?B?YnVVZDIrZkQ1bERwL0hhbG5wciszZDNLbGVRcjFvblV0MXdsUVE2YnkwNnlC?=
 =?utf-8?B?VDZ6QW1rT3pXeEdqQUgzSHllcU1MQmswcjVYVGVuN0ZmdmhBZTFQZXZGMmtz?=
 =?utf-8?B?NFpZYmkyZllFR1lXUGdNR0h0dmtPTWliWjY2TDhKUHQ2Wi9VT2lEZFFEcmNS?=
 =?utf-8?B?aWgzcWRINlhUNkhCV21xRWhMaG12ZlRrMURkVnNzQ3N1WFN3cnJIamJaS2xm?=
 =?utf-8?B?WnVmMmdseGFyd3FRY3lsYVExckhpbkQyM0dmaFVUNG5YS0lXdU5kOXNEUGw2?=
 =?utf-8?B?VEdOdlBHQUtEemEyU1FUTjlsRFV5bHJ6cC8wcmxjVm1GWE1aUk9DSFhxVU9i?=
 =?utf-8?B?TUg4TUpvM2Z6K25HRXRBbitQRHNnb0QrSHJTU0JKdHRBcTE4aFdUanNHV09k?=
 =?utf-8?B?TllJdVdJUmdWZmJ5YklHeHNMVzdNMGIvSWdXQThQeU51b3ZYaFJmTmFJYUw3?=
 =?utf-8?B?QTJIYytBUmlFcW81aUJ1UmdFYWZCd0RINzE1bmdVS3JCL0FBR2NhcExKWGV3?=
 =?utf-8?B?Sm13NVZUQlZIQitaU2FyT2w4OCtCYWUwMXJMR0tCZ3E3ODI2d25qSHhtU0JV?=
 =?utf-8?B?VTFYbEhuWkkrU0N0ZFZNVTRwVCsxS0toV2Z2N2hzSWxuYmZ2R1h2bFF5TW1x?=
 =?utf-8?B?a3RiNkt2SHo3L1ZBdVBjQi92ejN0SEtSSC9XSVpvWFROa28wMDV2aW1BbTZQ?=
 =?utf-8?B?R2Q1ejMzdXNXSk9HK05MOEErMnMrY2dsMVNxQ0czVmQyZmtUcForVlhqZjFF?=
 =?utf-8?B?NXZwMTNJQzdMMnFOWlFORUR6ZWcrVW5CTWc5NU5yVDF0Zy82bENGcWEwZXRE?=
 =?utf-8?B?d0pwZmhVM0FHdU0zNWNPa1FsR3pTMFhiNmxVc1F6blBEVTZRYWEvdlkxQ0Q3?=
 =?utf-8?B?L3pGMHo0SjI1bEdNZ0VZOGpEQnhKTDVlQWJ0dkhFMnZ1QnlhVTh5djhGVWRl?=
 =?utf-8?B?djRDR2diekRVV1kyTWt5K0FlUFZMRWxCTTZjcThHQjl5TUtaUVRkWUJzSmxW?=
 =?utf-8?B?SWRocXVHSmhJbXkxTlN5VlJZcER5RmN3bCswbzhxNzRIb3FJVFJiZEZKTm0r?=
 =?utf-8?B?andaUjR4RU51NmhsVUJPNFEvejVrY0FHazBIalhqajhQM0dFbXVOQTdRU1Bx?=
 =?utf-8?B?K0FseUxnZzRQdkljZGkzTXFVcGdLSkxwWnZPaXF5d25tR3VKZTBJemtFLy9X?=
 =?utf-8?B?bXZLU1h5OUJOSmVnR1hsTk90SHpMYTlhYktGU29Wam1WejZoQjlUTnpwRURy?=
 =?utf-8?B?N2ZwTXlqQ2FCei9TTHMxQlA2cTZNMWJSM3UyNWtXOXJ5UjEycHllaHYzZ1Vo?=
 =?utf-8?B?bXBXZEdSTytpcVc5RnFjaFZEWGI2ZFlXN0MzSUEybFJtM3h2ejFUL0NDTHls?=
 =?utf-8?B?VjFLVmJHSk5CTlZSV2J5TkxVYjhzcGNiQk4vWkF0eDBnZGppRFJSSjJnUUk1?=
 =?utf-8?B?SCt2V0UvMkovRHV5OHB3dW5PVmVxK29MVWVORmFoZE14K3ZHWGttcEtPc3or?=
 =?utf-8?B?dElFV2J2anNFU2xBN3M3TTlCSisrR290aG1iTWg4eXF2RUJyMzJVZ2pYQThD?=
 =?utf-8?B?UWlFVU50TUFxQkdHcUFLVllSSHFCemEzeUZtcGc5UmQrV3FoSkNDaUttM0M4?=
 =?utf-8?B?cDRER3MxV0IyZ3E4VjBObU1yWVBuN3FldDdPTjNpdkM0MjhnOFJwTHRnNjI4?=
 =?utf-8?B?US9QMXJGekgvRjFjRWdyZz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB6786.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Q0lIVmp3eVdTSzV6RmlFOU5rWkRsMmlRTkdZVWNqckpMMWFtZnIyNkU0RkFm?=
 =?utf-8?B?VkFJL0lla09QKy9BWHpaaVIwc2M4MXRJZTR1L2VJQ0hUUXBOSSsvekRuKzcx?=
 =?utf-8?B?UVh5Mjg4YlFvd1NvSVRLRjhUTFhXUFFmN3k3SmRuN05QYWdadlluVXovQUdv?=
 =?utf-8?B?Um9qeUhhclpXc0syQWlPSWdZQmJTUVpZZVB6czBWUVJTQnBleElZN0RiaHF3?=
 =?utf-8?B?cWRBNkNiSlZFMDZsSjhLQVlwV3h2cFY4UnVWRUh1Q3JjeldJK2VDakNUbmZm?=
 =?utf-8?B?VnlRVWcxNlhNM2FSei8wckZGY3l6bklaNWN2YVRuQmxvdDRzMlI1QXphODda?=
 =?utf-8?B?eU5EbzI2UWtxaFZ5MGxWcHNGODNmTk83VnlFT2RWRGZLQ3BTdUNvSkdJUi95?=
 =?utf-8?B?aTgrOEFvbVVoNlNoOElTOHBiQ0IvZkUxSTc2bkFUM3VXSDhKYThySVZaWjlp?=
 =?utf-8?B?NWllejVVeVZLRWtHcW11dTh3NjBuV28zOTdKa3hrZFUzbC9RbXhYOU0yYTZo?=
 =?utf-8?B?K2RGV3YwaERyamxrSXg0ZXQzWEMrdnVXVVY4QjltLytZMlpPb3k0UmhuOEdX?=
 =?utf-8?B?WHE2VktINElZOGhGaU9JZnhldUVxRzA4Qk1Vc3NUa2RqVEFNUjFLRkkvaktZ?=
 =?utf-8?B?WGQrZ0I1NDlaOXJWOG1iZ0JILzM3M1hXWFNBZnc0dEdlSktKNDl1d24xSUVx?=
 =?utf-8?B?R0xjNUFmYU90MzFWWW1YdnFxNm5BaFdPNVVhZW52dUttbmNIYlp0SUhJVEx0?=
 =?utf-8?B?WW1zRDNnTkE4RTBFTWxlTW9leWxvMkFENWRVK3RnSjV4WGFBeG9aalk5aDFv?=
 =?utf-8?B?Zm1vamk4RVc0S0hYZWlYSU1DY0lRamEzMkpHUkI3MHE1ZlcveW5Ga2ZVRnVi?=
 =?utf-8?B?dTVuWjR6U1JKR0s5THVBSjRYQjNOT2RKbkdwMkRhT1VueWdVSkR4c3h0WlZT?=
 =?utf-8?B?ZGVhS01jdXVNNU01VmpZWmpkNVhLRnVIZzRQWmhNMXd5MCtiMWVYdjVmTkEw?=
 =?utf-8?B?QTdaaE9jQzh3OVFTOUw4bEZ5Q2RzVnFJczhIOGZiN0NGWnZpZW9vUGwrNi9m?=
 =?utf-8?B?bDIra1hFc013TmlRMUxFWjNad3BLams3TUt2aFVYeTNYZVRmbGFFOWtNTFkr?=
 =?utf-8?B?c2ZWNnNmMGpIclVWQ3FtUHJZZ1k4K3pPcnNzSU1iMlBDajZJY0FKaVRZZVVm?=
 =?utf-8?B?MVZpS0w0RUdFcE1aa1UyOHh1RGdEcFBFaEhoaUkySndSWnJtS0x3ZHlBamhl?=
 =?utf-8?B?NTFYRTIwcW1aQVBmYllRc1c0RHdjKzJ5bTdQa1hHRGhkYm4vOWp6VGI4S04y?=
 =?utf-8?B?bVIzN3cvUlJWdmI1cTA5ZktORWx3VzNaREd1UXkwc21DNVZ1RnRBQVZQdTk5?=
 =?utf-8?B?WDg3TUoxbDRFNkRnemJ4OGlDL29xL3U0MTRmL3JvcEQzcnpQMU9XVFNrWUZL?=
 =?utf-8?B?RXp5MXU0TUdFVHpHS0hzOVYvS2Y5MEZ6Y0I5SjVyUTU1N0h1ZmFrSWdtek9I?=
 =?utf-8?B?dGJEMUhLamRkWVBVTE9ZSU9vRWliR3Z4WWJlZkMxMGsvMEp3VWV5anFHeURO?=
 =?utf-8?B?dis5dCtyZlZHUkNZYVhGMHBZUXJ6QWNoajZzTEg3YWM2OEtuazg0Rkdxc2g5?=
 =?utf-8?B?UXRsZXFoZGFQSXN2ZktUNEhucVhBd2h5Z0g2aFdpeVJLSkRYYzdJbWQ5a2cv?=
 =?utf-8?B?S2lGb0R1cmJ0MW9PaXAzd2xOZVRlcGNtRFU0VmZWK0xyMGl4Ump0NjhtTEZC?=
 =?utf-8?B?REpRU0hiaWFHWDN4RFBoYSs0UW90ODJPTmVSSmtoQmdZTVdTbXhYMmo4c2lV?=
 =?utf-8?B?RE1KdG9BSHd2cUQyNDhXVW1TcG9vNjBURmpFTGp6azFiOWxSdEFqR1RiZW1p?=
 =?utf-8?B?SnFJWlliM1BVdExHRWtMNThYQlg1OG43dktUK21aUWFuREZRd1dsSGhvSWlC?=
 =?utf-8?B?am9sd25HMlZVRFhxOHA5WFBNRURZeVQ3WkR4N0NvcjRQa2UzQ3JDK3ZQVmJk?=
 =?utf-8?B?OCt5ODhNZUVvWWhJbnFmUmR3Ky80cDZMb3dMdnA4a0xSejYvcGpiS3czdDh0?=
 =?utf-8?B?YVpISE5kY2NmWEMwdFh4U2ZjZXRWME9nK0JTYjY1Tnh0VDJaS2QvRjk2Vzdp?=
 =?utf-8?Q?nfeo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: motorola.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB6786.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e162c6e-cb19-48af-dfd9-08dc5e58705c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 21:01:51.4413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xh6ZiXz9DtPWuOJmHAsFNC7xUAeB9BOsrtgGDIwjAM53EwhTesOrf0XVhf+QTCwlfYN9Zuca7Y4kyaZR0+z1VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8377
X-Proofpoint-ORIG-GUID: gDXHRaJ_lOFbY2hFLGi_X043in2_BJFd
X-Proofpoint-GUID: gDXHRaJ_lOFbY2hFLGi_X043in2_BJFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_18,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160135
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Yu Chien Peter Lin <peterlin@andestech.com>, "x86@kernel.org" <x86@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@si
 five.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Song Shuai <suagrfillet@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBPbiBUdWVzZGF5LCBBcHJpbCAxNiwgMjAyNCAzOjExIFBNLCBBbmRyZXcgTW9ydG9uIHdyb3Rl
Og0KPiBPbiBNb24sIDE1IEFwciAyMDI0IDE0OjUxOjMyIC0wNTAwIE1heHdlbGwgQmxhbmQgPG1i
bGFuZEBtb3Rvcm9sYS5jb20+DQo+IHdyb3RlOg0KPg0KPiA+ICBhcmNoL2FybTY0L21tL3B0ZHVt
cC5jICAgICAgICAgIHwgIDYgKysrKy0tDQo+ID4gIGFyY2gvcG93ZXJwYy9tbS9wdGR1bXAvcHRk
dW1wLmMgfCAgMiArKw0KPiA+ICBhcmNoL3Jpc2N2L21tL3B0ZHVtcC5jICAgICAgICAgIHwgIDYg
KysrKy0tDQo+ID4gIGFyY2gvczM5MC9tbS9kdW1wX3BhZ2V0YWJsZXMuYyAgfCAgNiArKysrLS0N
Cj4gPiAgYXJjaC94ODYvbW0vZHVtcF9wYWdldGFibGVzLmMgICB8ICAzICsrLQ0KPiA+ICBpbmNs
dWRlL2xpbnV4L3B0ZHVtcC5oICAgICAgICAgIHwgIDEgKw0KPiA+ICBtbS9wdGR1bXAuYyAgICAg
ICAgICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKysrKw0KPiA+ICA3IGZpbGVzIGNoYW5nZWQs
IDMwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9tbS9wdGR1bXAuYyBiL2FyY2gvYXJtNjQvbW0vcHRkdW1wLmMNCj4gPiBpbmRl
eCA3OTYyMzFhNGZkNjMuLjFhNmY0YTM1MTNlNSAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0
L21tL3B0ZHVtcC5jDQo+ID4gKysrIGIvYXJjaC9hcm02NC9tbS9wdGR1bXAuYw0KPiA+IEBAIC0y
OTksNyArMjk5LDggQEAgdm9pZCBwdGR1bXBfd2FsayhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHN0cnVj
dCBwdGR1bXBfaW5mbw0KPiAqaW5mbykNCj4gPiAgICAgICAgICAgICAgICAgICAgIC5yYW5nZSA9
IChzdHJ1Y3QgcHRkdW1wX3JhbmdlW10pew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB7aW5mby0+YmFzZV9hZGRyLCBlbmR9LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB7MCwgMH0NCj4gPiAtICAgICAgICAgICAgICAgICAgIH0NCj4gPiArICAgICAgICAgICAgICAg
ICAgIH0sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAubm90ZV9ub25fbGVhZiA9IGZhbHNlDQo+
ID4gICAgICAgICAgICAgfQ0KPg0KPiBJdCB3b3VsZCBiZSBhY2NlcHRhYmxlIHRvIG9taXQgYWxs
IG9mIHRoZXNlIGFuZCByZWx5IHVwb24gdGhlIHJ1bnRpbWUNCj4gemVyb2luZyB3aGljaCB0aGUg
Y29tcGlsZXIgd2lsbCBlbWl0Lg0KDQpBaCwgdGhhbmsgeW91IGZvciB0aGUgcG9pbnRlciB0byBD
OTkgNi43LjguMjEuIEkgaGFkIGFsd2F5cyBmaWd1cmVkIHNpbmNlDQpzdHJ1Y3RzIGFyZSBzdGFj
ayBhbGxvY2F0ZWQgdGhleSBhcmUgcG90ZW50aWFsbHkgbm9uLWluaXRpYWxpemVkIQ0KDQo+IERv
Y3VtZW50YXRpb24vYXJjaC9hcm02NC9wdGR1bXAucnN0IG1pZ2h0IG5lZWQgdXBkYXRpbmcuDQo+
DQo+IFBsZWFzZSBpbmNsdWRlIHNhbXBsZSBvdXRwdXQgaW4gdGhlIGNoYW5nZWxvZyBzbyB3ZSBj
YW4gYmV0dGVyDQo+IHVuZGVyc3RhbmQgdGhlIHVzZXIncyB2aWV3IG9mIHRoaXMgY2hhbmdlLg0K
DQpUaGFua3MsIEkgd2lsbCBkbyBib3RoIGluIHRoZSBuZXh0IGZldyBkYXlzIGV2ZXJ5dGhpbmcg
cGVybWl0dGluZyEgUmlnaHQgbm93DQp0aGlzIHBhdGNoIHJlc3VsdHMgaW4gbm8gY2hhbmdlIHVu
dGlsIG5vdGVfbm9uX2xlYWYgPSB0cnVlIGlzIGFkb3B0ZWQgZm9yIGVhY2gNCmFyY2guDQoNCk15
IHBsYW46IEkgd2lsbCBwb2xpc2ggdGhlbiBpbmNsdWRlIG91dHB1dCBvZiBteSBwZXJzb25hbCBm
aXhlcyBmb3IgYXJtNjQuDQpTcGVjaWZpY2FsbHksIHByaW50aW5nIGV4cGFuZGVkIFBNRCBmbGFn
cyBhbmQgdGFiIGluZGVudGluZyB0aGUgbGF5b3V0DQphY2NvcmRpbmcgdG8gZWFjaCBsZXZlbC4N
Cg0KSG9wZWZ1bGx5IGp1c3QgYWRkaW5nIGFybTY0IHN1cHBvcnQgZm9yIG5vdyBpcyBPSywgdW5s
ZXNzIG1heWJlIHdlIHdhbnQgdG8NCmRlZmF1bHQgdGhpcyB0byB0cnVlIG9uIGFsbCBhcmNoZXM/
IElNTyBkZWZhdWx0IHRydWUgd291bGQgYmUgc3dlZXQsIGJ1dCBJDQp3YXNuJ3Qgc3VyZSBldmVy
eW9uZSB3b3VsZCBhZ3JlZS4NCg0KQlJzLA0KTWF4d2VsbCBCbGFuZA0K
