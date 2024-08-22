Return-Path: <linuxppc-dev+bounces-395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B7A95BCF1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 19:18:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqVKq5kKkz2yjN;
	Fri, 23 Aug 2024 03:18:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f400:7e1a::62c" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724347135;
	cv=pass; b=EJi6TaxK9QoPie84jV3zVnxFGZtri7h81aIMlI15MYr+2mRpZsZTHLg1IZkpG3rZtrJz+nJg15gzwuNfiTChDWmI4JJ4HypuSXufNMLbWZrnZnISBem9Dmh96Ao0YzRVPVI+ysK54CWBenZlWqDlCfxSxf03KRIrV2itS0IiuxDoT2E2U/c+sXSeKy9G8cU5IPHzK7N0Qk8ppoaOM31BfW3lPa+m0GA36wSOLLO8GkVO6A2wQxKJkPW2bZT7b6XjGwDYAKWUu8kJCvuTHVaWJdYP19z1WwhQK+VEMO0nCQ35IMw/s971Jvn/am+kS/TU0HF5bneWDYtktLmS/+BN4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724347135; c=relaxed/relaxed;
	bh=QJ8aqtWrBdn/Us+Rojh+TPVyY4tgaBnrbx37GsqbLj4=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityhea
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=JYdKzDCU; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f400:7e1a::62c; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=JYdKzDCU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f400:7e1a::62c; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqVKq1jPHz2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 03:18:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLSwcJ853/NzX4Bwmso3UH7AR4R2sWHm0rF5y2aRi37ufzmPLjgG6mrVet7kSc3lh/erWZeSuPfC3gtFDHw/RUx4j6mfVqgmFHQptZe6L29PpQj76gJhCTH4kf/oSnZiyiF9k+d16utTYEUxkOT2msKmn3id4r5iVrP/kDGgCYzCKzja17mMik/1X+yHQIDN2DL+Xb72VFl8MA74eNOYTJOsAlzKZqZUeqNnUq4LLsEYzkNjEV6L/4w6C8SQlPsluWgRacvhLgGQJyUaaaj/P1j0WfyXZMtJDMY4FPmrp5OThdrhisPDiRT4jv+VnZEHNrK5mw4iXqpDcK4WjPj49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ8aqtWrBdn/Us+Rojh+TPVyY4tgaBnrbx37GsqbLj4=;
 b=mryeKWbKGST55TKzWSBEC52gcqZ/MLIus93W3FuM8ybvY95l1dg5MCqC7gTNlCopq2SXKcTM+9Ope55uhdcBUBSeRZ/1aRSXSborEy20Hm+fFzPwA1XUWJcLcYn0S9+QmxL0GkXcZyYGjzzkLljn3AwXAiKc7gmu3fTMgii71EwgtDqr22m2vi2RPDsxCCf/jH7UCiFeOiXEZkmDQcv8EsQLg6Swt7h8Q669FbOraBdtJpu09jE07bGAYr1i9+Fu1dLXetvRq+8OX2UrGvGZlqWvmWdgPxpbTPYJ44+yFbc+sahusBR9w0kh5bwEwHcwG289E9kheAvV7oXJMq/aHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ8aqtWrBdn/Us+Rojh+TPVyY4tgaBnrbx37GsqbLj4=;
 b=JYdKzDCUyfKLH+07IxQroXG2B1e0kcgrFSPzMmMkzb82aFeY6ClCnenoBgRXPvUqgbFZM0YcVzrao9Ag+o4lbPMF0Ck4B32nkDQS1/Lk00cpCX3ECMCXtEFyGvkCzXt6AliyP6KYczH3e0mZQkk6L4ds95opfFAcfY4RTg701+W2XcVrDQmSEJedm7K8JmU4szET9GVYXv0BQ3ycPT6auhShcGakUQJWU5fUlQ0OwgFek9GMzE8uiLB6hRbV/8hV5xu4rN4rg4tlal8e+gXBwZhF0Qfn4T1bMMzzK6EXDVYcRKW/noeZVF0kcWvASDXXV3CKw3t+AuGrq26o1NfbRg==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by DB9PR07MB7753.eurprd07.prod.outlook.com (2603:10a6:10:26e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 17:18:36 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 17:18:36 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Erhard Furtner <erhard_f@mailbox.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: Kernel build failure with MEM_ALLOC_PROFILING=y set (Talos II,
 v6.10-rc5)
Thread-Topic: Kernel build failure with MEM_ALLOC_PROFILING=y set (Talos II,
 v6.10-rc5)
Thread-Index: AQHayii4aIjm/gQ1/ECnkXdcbm9ZMbIAX2kAgDN66YA=
Date: Thu, 22 Aug 2024 17:18:36 +0000
Message-ID: <b5ae7797-7676-4abf-82be-e2ce4d9238a1@cs-soprasteria.com>
References: <20240629153128.4660755c@yea> <20240721010926.60efacc3@yea>
In-Reply-To: <20240721010926.60efacc3@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|DB9PR07MB7753:EE_
x-ms-office365-filtering-correlation-id: fcd30012-1f2f-43b2-3daf-08dcc2ce750a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RnhrV0RJcUtjdkVJUDJZaGhkb1dCQTcxUkFUanRoeDErLzlCU0M5MFdzY0gv?=
 =?utf-8?B?a1hDdUVjbktDU2Z6MkpUZHhEWWJIbFk2bWJaWC9KY3p4bkc3N3hmNXpJUzF0?=
 =?utf-8?B?eGVzY2crV3VSOEVFcERFbVpGekFLaEdObHlrOC9Tc29yN29Ldzh1SE9nbUNm?=
 =?utf-8?B?bzlzVlk5bVpta1lnbnpzYytLZHZSQVd6N3RWT1VyeGZEdnlRN3NMN1NSR1Iy?=
 =?utf-8?B?UTU5dEEyeVRBbG1TYUtYbCtWbFlvckVzemFzTjBDbStTWXJNYVZmcGdGZUVC?=
 =?utf-8?B?dW9nR0RyaS9LNCtibU5mSytFTkE3QWplZHIyYm9vd1lTWWFYTFp2cThOSzhT?=
 =?utf-8?B?c093aTV3WjlvdnUxaTVxM1hjeStvcExkc3l3NSt6VmVCTUpmNUNJeE1MVkY4?=
 =?utf-8?B?VkZvUW50anJzRkNZMlZOTnEzRnowNDJmMElSeTJFRTRJaVFRUGFkVDRSUkNq?=
 =?utf-8?B?MGhWbXNEN0lqU1loUmZhQmhpZUQvVUNjMkllREFrbnl1MDJpam1mcTcrTHZ1?=
 =?utf-8?B?eEJvbXlzRkRsaWxDVTJXTG14WmZrb0xMUDkvZTlneWxTU2t6VXduMEJVU2hn?=
 =?utf-8?B?Tjk3WkJhZWNSSHhPTnlJOHU2cTlYQ2NWRjhOMTMrVkd5Sk1kWk1zY0dDRmM4?=
 =?utf-8?B?dGxOcE1SRzJOekxvSS9Ha2c2c09HaHlRN3pXaEdsWDZjakljT3V3V3lVVHND?=
 =?utf-8?B?ZVc0Mk15VGR2T3FuMm0rQVVUaURhQW5HOXdqRHhnVUpIQjZOV1pQUEdRWEZO?=
 =?utf-8?B?VzlpKzdLZ1czNVQvcVpaTkg4T3RTQmNqY2tpcWJQOVNGSGtmZ3RZL2hFanZp?=
 =?utf-8?B?R3VKb0ZaLytaZDBFdC8xSmlvTU1RZ1dkWjA3NVBJYlNYcGVjTiszSG1HRHRY?=
 =?utf-8?B?SmFYU3JkODBZVWo1M2lqQnRDTnM0dVprM2IvbmhmSDM3TzBKQUZoS3dUL2d3?=
 =?utf-8?B?UG5Ec2pJaVFqT1dJSVJZQkFrT2dYU2VVMk9IMzNxVzFBYU5WQVgxOGZMQkVX?=
 =?utf-8?B?bmQwcEtVWGc3QitTaU1xQ2lYbkN6WUtEQ2ZEaWs4V0Y3MFN1VmtNYjIzQUp2?=
 =?utf-8?B?SDAvYzNNWFg0VWcrc2M2MWI5Sm93aDFIbEd4SzFoOFM4QldTYWJxQUNTNkxQ?=
 =?utf-8?B?RUliVC9qejdGTnY0RmR2eHdWQmdYRUpheVpIeDdvQ01MTjQxRy9KTXVFTGl1?=
 =?utf-8?B?UU1vdUMzSGhFbU1JUng1d2xTRGc0S3lVYTlucEFvUldxTlQrM2gxZDYzRlUv?=
 =?utf-8?B?OHE1eEwxTXZsQzhCV2ZaUTNieW54THdiSm1ZZ2JjOGordEN3NXo3N092cW5M?=
 =?utf-8?B?N2pjMVRCYXhRVlYwWCtWL1FtbFlHc2d1ZkVqcHZHeGkyN1JwMkx2dURyaTFI?=
 =?utf-8?B?NXdLdmdWN29GVTJqcEFUTEVBT0Y2Wk5RY0MrdHEwOU5UVDZuRVhYMU9NN3Z2?=
 =?utf-8?B?cmcxYVcxL0s1MmlyTmhjNUlIZjNKQlFiWTd2ckxROXFqaUR4dXJwZzhQNVd1?=
 =?utf-8?B?Tm9hMTY3SXJ5YUQ5K3dsTzN3UXMvYVNpWGJ3SHg4M1VPcG1GazNmaVZDeFRw?=
 =?utf-8?B?NFBCblNiQ1lZYXpUTnZGcnJGV2FMcWR0UEZlQzYxT2hZZHYrZWE4ZEx3ZnZx?=
 =?utf-8?B?RmFPcGFTMmtXRVB2SkI5a0lVS29Ya1lyVEUzVDhyTm1aaDMwTjlnY0t4NUpz?=
 =?utf-8?B?bHJadk42VTdXcVdwdmNkN0Y1ZWhRVWUwSTg0VC9tbC9yazFiUVpIK3BaZ0tx?=
 =?utf-8?B?d0JNdHBrcmtjalRObHdldEZlUGFya1E4MGNRZk9KdzVrK0hNNytkZXNEcnhy?=
 =?utf-8?B?emJuKy9XVEdXMzBjMmJsUy96K3U3em0vRUU3VzRGZXVIS2RQQUxYQXEzWEdl?=
 =?utf-8?B?bklKZ3BtR053TFNnUWdvVFBocWxFREluaCthSjUxdmNTTUE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TytkcGFIODU0dlFuOFNkQjBVNExDWjJhUGxrTllQQnA4UXRCS1NsM0F0dXg0?=
 =?utf-8?B?cEJIMEMwR3JWWk8yMGhCdWZ3MFE1eUpMQm5wV01TeG5NenE5cWE2WlhUa3Bn?=
 =?utf-8?B?M1dOa0FhY0h5eHQvdnluVlhKdVRXUXFVeGNhNDVJL21NbXV1bUV0QUNHNlVi?=
 =?utf-8?B?Z3pqYmFQaERtVkQ1L3cyVWg1QUUxTUgvdDA1dFJhOUlxTTVIQklieHdrTTFJ?=
 =?utf-8?B?SWdhOTZLaERtVVFNM1F6WWtSVllWQWJ5RDE3a2pnSGJBL25VdUpGb3ZEZmVM?=
 =?utf-8?B?cUl4OUc3cmhkT0hnWHpLdWNXbE1WZFhjZEwxUGNTNVN5SmUzWXU2UmRpUXZI?=
 =?utf-8?B?Y0d2aVJpY1BicHNaQXF2OWgyL1hHYWdnSENlc2hHWGNZMXZZWTNHaEpuUG1Z?=
 =?utf-8?B?VTJaRlc1Y1p5VmY2NjVWTnR2eERveGlidnh2dnZvOXhzVEllUlFiY3l0MUNC?=
 =?utf-8?B?bkhGQkErNHlCUHZhTE1CQlk0M3daRW9DMWdKU1FEY0lHeGgwOUhOYjc0L3JY?=
 =?utf-8?B?WkFldW5Eb1hxSnpkTmFvcE1UYzJ6WDFLb011VzY3bmp5M1krcForeGZITlds?=
 =?utf-8?B?eitWZy9ZelFiNWdXazB3NHZ1Vnp0eWVtU1ZQWDFYc2ZPdi94ZWU3WWFJRTJ1?=
 =?utf-8?B?OFFtUE9TVDJwemlwRmd4N3JzSy9VZTdoVXdBM3BIU0grUEpmY1hNMVVOQjEy?=
 =?utf-8?B?MmhWYnZiRUpQa0VXc21HT0ZzV2ZFUXlsMjJTajRqQXBBVll4dGhhMXpWbi9j?=
 =?utf-8?B?b3hkd2tOTW1XaTVFY2NERE1GREttbEsxYlJ4VUg1cDNNK0lqRlRCSEJuNXN5?=
 =?utf-8?B?K2dEandTQ05aZlhjemtlYnRZMGNLeS94UjNEaW9kSjJaTW9vWThaUGo4ZlRP?=
 =?utf-8?B?bDFhdnFJZGxxRzJYd1VEYXlXRWpuNTI0RTB5ZWxqUnQ4RmFoUnA5RDlhSEdm?=
 =?utf-8?B?UndzcEp1dFE4OXBXdmRWemdFdjdyQkgwNTlRNllMSndxRkpNSmRYcWNQVHA5?=
 =?utf-8?B?TzRrSVdObGs5L01DTyttT1BHSjFXRnFqaE9nK1R6MGVCVThTamNhejk4SnFx?=
 =?utf-8?B?djlJSkVCa2paWmFub2JMamZWS0lnNVVoM29aSVZYZFB4cGlXdzJmTW9DN1dw?=
 =?utf-8?B?NldCS1BCTDlXNnNLTzNVb2dDR2pYckI2d2pBODBReVB2NnE3SGpvcWhRYWo0?=
 =?utf-8?B?MFN5R0IzSEMySjhhbzJRSWgzcjdBTVFleHFvVktQOHplWjRUTHpDL2FYWk9O?=
 =?utf-8?B?NDlCdDdwQ0NmY0FLQVBFdnhJM2FhbTFoc3pKVVVLY2JzV3JDbTVTTERmUFkv?=
 =?utf-8?B?TjdadkpKcEQ2dEJYaWREaWMrckx3OUFsT1g3d1pWVHluS012VW03YXRwTCtz?=
 =?utf-8?B?L0IzcEdvUTlKVDlQeUVZOTh0Qkw4YjJBaGJ3NDR1TEg5aDcyb3NqelJrNkRU?=
 =?utf-8?B?VXY0bkJvWXVncExQNEdnVGpobjg3YjlnU1F5blgwdUxBL2lTcXNtSW56RHpT?=
 =?utf-8?B?VzFHT3VKTi9wYnc0L2QrbmxCNFNYYzM3TTVlVERiU2UwUmhYV0lPZUV0S09E?=
 =?utf-8?B?WTBOTFdBRUZiRzJsWDBRNUR0bUlScTdhOVpjVkZvUDY2VVIwSFozdDdzbDN3?=
 =?utf-8?B?ZHgyK1NOR1ppdWErSHNGcW5zUTJJZm5vdkhER1VVaURJZ2gxODkwS3QvUzJO?=
 =?utf-8?B?anlNd2ZUUlRJeGJLRkdONnlROGx4d3QzWlBDWlFYMUl1cWdYUEVLRFhKTDV1?=
 =?utf-8?B?QlRhL0xSbExrTlpOMW1SditIZ1VBWWNCZnpZeHhIbWFZaFhBWk56emVzVGkr?=
 =?utf-8?B?em1iRFNjZ3pIQW16VlFFTWgrM3FiblVyb1pKeUhMbkdXU2hBSFlXejgxdVJM?=
 =?utf-8?B?UERCQkJneFlldDZuV3V6U0lPazJWbmU2a3FOTTBrTHJRSzY1YlhMKytuc1RN?=
 =?utf-8?B?b3ZJNU1CNDNDSytXYVhuSzcxWVNUdjkwa1RnRjB4NmQ2QjU3aC9jV3RiOXBo?=
 =?utf-8?B?YTUvOVhDU1ZHcU5IbHpUUmhQNzVFeTlLdVhyTjJub3FuSnY0MmlqUEFSSGVU?=
 =?utf-8?B?b3lDeGFiQmJJQjAzbm1wVGdNcEhhVjRML1VxT3puV0ZXMEt2aGg4d0ZUQUJW?=
 =?utf-8?B?SGFCVG9KR1JzS25iVzNNM0lsL2c3Tit6ZkZGa0lDVTZPTzFyQklhL3B6TXBo?=
 =?utf-8?B?R2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17228D849E30A94091B957640EBDACB7@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd30012-1f2f-43b2-3daf-08dcc2ce750a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 17:18:36.1964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3RoZUChJ0TLkXI1k7po43lfWNXh8t+NG8kwVp4AlOs1seg7b/qkIWv777Ik4Vj+VIZbfrFw77gtudfc00l0Q0IxnMH707fpnUsxetXQHtQX1CUXA/rsxAbT3vDGe3rZ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7753
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 93.17.236.2
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: DB9PR07MB7753.eurprd07.prod.outlook.com

DQoNCkxlIDIxLzA3LzIwMjQgw6AgMDE6MDksIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIGVyaGFyZF9mQG1h
aWxib3gub3JnLiBEP2NvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50ID8gaHR0cHM6
Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IE9uIFNhdCwg
MjkgSnVuIDIwMjQgMTU6MzE6MjggKzAyMDANCj4gRXJoYXJkIEZ1cnRuZXIgPGVyaGFyZF9mQG1h
aWxib3gub3JnPiB3cm90ZToNCj4gDQo+PiBJIGdldCBhIGJ1aWxkIGZhaWx1cmUgb24gdjYuMTAt
cmM1IG9uIG15IFRhbG9zIElJIHdoZW4gTUVNX0FMTE9DX1BST0ZJTElORz15IGlzIGVuYWJsZWQ6
DQo+Pg0KPj4gWy4uLl0NCj4+ICAgIExEIFtNXSAgZnMveGZzL3hmcy5vDQo+PiAgICBMRCBbTV0g
IGZzL2JjYWNoZWZzL2JjYWNoZWZzLm8NCj4+ICAgIEFSICAgICAgYnVpbHQtaW4uYQ0KPj4gICAg
QVIgICAgICB2bWxpbnV4LmENCj4+ICAgIExEICAgICAgdm1saW51eC5vDQo+PiAgICBPQkpDT1BZ
IG1vZHVsZXMuYnVpbHRpbi5tb2RpbmZvDQo+PiAgICBHRU4gICAgIG1vZHVsZXMuYnVpbHRpbg0K
Pj4gICAgR0VOICAgICAudm1saW51eC5vYmpzDQo+PiAgICBNT0RQT1NUIE1vZHVsZS5zeW12ZXJz
DQo+PiBFUlJPUjogbW9kcG9zdDogInBhZ2VfZXh0X2dldCIgW2FyY2gvcG93ZXJwYy9rdm0va3Zt
LWh2LmtvXSB1bmRlZmluZWQhDQo+PiBFUlJPUjogbW9kcG9zdDogIm1lbV9hbGxvY19wcm9maWxp
bmdfa2V5IiBbYXJjaC9wb3dlcnBjL2t2bS9rdm0taHYua29dIHVuZGVmaW5lZCENCj4+IEVSUk9S
OiBtb2Rwb3N0OiAicGFnZV9leHRfcHV0IiBbYXJjaC9wb3dlcnBjL2t2bS9rdm0taHYua29dIHVu
ZGVmaW5lZCENCj4+IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5tb2Rwb3N0OjE0NTog
TW9kdWxlLnN5bXZlcnNdIEZlaGxlciAxDQo+PiBtYWtlWzFdOiAqKiogWy91c3Ivc3JjL2xpbnV4
LXN0YWJsZS9NYWtlZmlsZToxODg2OiBtb2Rwb3N0XSBGZWhsZXIgMg0KPj4gbWFrZTogKioqIFtN
YWtlZmlsZToyNDA6IF9fc3ViLW1ha2VdIEZlaGxlciAyDQo+Pg0KPj4gU2FtZSAuY29uZmlnIGJ1
aWxkcyBmaW5lIHdpdGhvdXQgTUVNX0FMTE9DX1BST0ZJTElORyBzZXQuIEtlcm5lbCAuY29uZmln
IGF0dGFjaGVkLg0KPiANCj4gQnVpbGQgcHJvYmxlbSBzdGlsbCB0aGVyZSBvbiBub3cgcmVsZWFz
ZWQgdjYuMTAgd2l0aCBNRU1fQUxMT0NfUFJPRklMSU5HPXkuDQo+IA0KPiBDYW4ndCBiaXNlY3Qg
YXMgYnVpbGQgd2l0aCBNRU1fQUxMT0NfUFJPRklMSU5HIGZhaWxzIHNpbmNlIGl0J3MgaW50cm9k
dWN0aW9uIGluIHY2LjEwLXJjMS4NCj4gDQoNCkkgZ3Vlc3MgdGhvc2UgdGhyZWUgZnVuY3Rpb25z
IGFyZSBtaXNzaW5nIEVYUE9SVF9TWU1CT0xfR1BMKCkgdGFnZ2luZy4NCg0KQ2hyaXN0b3BoZQ0K

