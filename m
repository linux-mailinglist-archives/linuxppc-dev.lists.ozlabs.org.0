Return-Path: <linuxppc-dev+bounces-16405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJFqBeHNe2l4IgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 22:15:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3430AB4881
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 22:15:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Bk24JVfz2xKh;
	Fri, 30 Jan 2026 08:15:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769704592;
	cv=pass; b=js5jLWeuLvMIAzXawPdZJ0y7PuVa6u9RT7wOQLhrX7L1e4xhl71oBsauB2fzQ90JRFAtf05MlM9slhO9CDCcK/GZZ05+xFjXc53jb+lDssTf211OB2o/vQbCLxFEF6l8OYmHNnks7IamyJgQHCaLFU7DZlD96a9A6J/PIXquIYGWah+2VXQerNWYOUQcZ8qBpoyDj/FAmJIG963/KJRSECZffzuErGgcBnm2uh0bjJCyxwkdQkiJFiBwRXN//oiiAwM5eOROgxoZomSrAgXSpI0YGlM71aM9E6vgmKKH4bySCL+G/9a9Gvqmrml/EMni77MY4yVrzCZ8WOBJnD0jdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769704592; c=relaxed/relaxed;
	bh=coBj1np7qE4p/u1Bhd85W+J3ULugDoAaDLZ8kM39B4g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nrq/II3aN+HYZGw3bIZFP4RUlYps3PsAUDY1nQ7am/hIyMC5BC3i1Oe6Lb6OxwMMPy2OvTmOf7QdS2E+SkQaAi1jRltMFdB5+FE4nPhWB+DzbzFOrsTCGB/gxR4bjy6swNJLt/Y+tSySBXz98ltbQB+GhRCDuVZK/mf8hWFVv+W4CL7OE985XdEArg8MPgS2tOWyMBt9adieG5DF/N2XtXIUTpJ6HIfGisZIy6tmrPYfn2kgVtlOZhUroh8KX0NTR050bzpvFDOKgoLzOj/jTeBG9C3T6xKuUxM21+leOOrCKUTyVUTjJ3kY6hpXBNPPDM3RwkVVGquxqfBkR5FLHA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=eG/5KUmm; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=EpY/ufLx; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=haakon.bugge@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=eG/5KUmm;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=EpY/ufLx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=haakon.bugge@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f24Xb0GQ4z2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 03:36:29 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TDgOVX449018;
	Thu, 29 Jan 2026 16:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=coBj1np7qE4p/u1Bhd85W+J3ULugDoAaDLZ8kM39B4g=; b=
	eG/5KUmmtu0dvaxiWT0akusKQwusP5MDzWpGESOqHXSFEKxOxS4IDUqLgwt4BW18
	wp8NCMqr0DJ7hxY4wrfMlVKo1D/hhbaJKOUG9TlNpBwg6l1qPOS3pLedvJ504it7
	KIm1FRULGbgMS8xdaQpNwluBNvlLDenm1YHc/NhTAab0Vo2zY3UanpNDy0hWtqUv
	Dxgo3uxARt38O+n5+4c4fc+wt62hknNAYXPWoEoO+XwyxcP6HtEWDd1YWBs0qv8o
	N6yTqWrthsS2VVWuWIgmc9fESGPOYNRUAv7IslcN5l6nz1TPVJvdzp2d5uSb4F+w
	yKn+/2Ks6grDhu7Zip5K5A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bxx09m9q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jan 2026 16:36:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60TGAVYQ001716;
	Thu, 29 Jan 2026 16:36:15 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhh41t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jan 2026 16:36:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ri442k1eMQF8Cg4X0gIpXZ2xBjnZQGBXZyI5qHTd6JCTUduQPDcbke70Pn9uz1a9vczK09PeZt7PHwTAXZk3LRhbgGeoFYSzQi9RFYv0nCrPdVSUXw/ajX5SdMW3gMEpi98n59U9X8Gs7H/4oOiU1eQ+LPP1Ny+snxmsz8/4EqbPP1NIIi4+C1VVSQ6oA1Dzi3awIdsoukrA1wBx+ErUZzm/FKRZuvmvGBaz1PFZ43wAjEx7FC1AGEZ1jRgds0Nt1zeLkGZHlxSK947sihcOiEzEaymdALDe63Cq3Z1CuUxXuZQ0LjIPoaDu9Le65sVuv549xVIbLv1AUOj6f1cC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coBj1np7qE4p/u1Bhd85W+J3ULugDoAaDLZ8kM39B4g=;
 b=BBlfyez/c+GL++Cc6inarB/tgH4zY4ZCJTH48WJsXPQUzDdW9ni2ebPYCc2VWCmeMZpFJkCF4BU7qN0WXDDttP60G9iWP4jvlvcbo2AR1WN5U881mdNzL4AoARIyKfYzwn7KrL77x7ZKebb0WF1EQIVyhJDJ4IzKZYSlL0B0TgELLS3T1HwkRwowiz3jbDR7vxOwTnk+ecMx2U1El9orgX27vzXr6R3k5rrPdoA6g749AXVTdNQ6ukF+qg5btVuJfi2K4fqUj0Uaz77HNtNG8oF4Bq6vH3bQ/CO2hEvWI9gHbAnkVsNdu1DsiFh99CQqwIiWx6CEWvxEZCUc9VuYUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coBj1np7qE4p/u1Bhd85W+J3ULugDoAaDLZ8kM39B4g=;
 b=EpY/ufLxwihBw2pBAojjgnzIk/W7q0KB6JL8RD0VHim/tFa/kkEGmCWB1R9dnGLFYkqSEaL/tD4nB1iuNJdwy8/dYZFATAmy9L5s8nWRtt+5QJyp7LeOcgYeLTF8/eNAvGdaV+n02ViJ9y/UbFE0QeDkzL8nFxUoTiy6WGUVWgQ=
Received: from CY8PR10MB6826.namprd10.prod.outlook.com (2603:10b6:930:9d::13)
 by SA2PR10MB4539.namprd10.prod.outlook.com (2603:10b6:806:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:36:10 +0000
Received: from CY8PR10MB6826.namprd10.prod.outlook.com
 ([fe80::f9d3:19ef:4ce8:4d63]) by CY8PR10MB6826.namprd10.prod.outlook.com
 ([fe80::f9d3:19ef:4ce8:4d63%2]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 16:36:10 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Schnelle
	<schnelle@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver
 O'Halloran <oohall@gmail.com>,
        Greg Kroah-Hartman <gregkh@suse.de>,
        Kenji
 Kaneshige <kaneshige.kenji@jp.fujitsu.com>,
        Alex Williamson
	<alex@shazbot.org>,
        Johannes Thumshirn <morbidrsa@gmail.com>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 2/2] PCI/ACPI: Confine program_hpx_type2 to the AER
 bits
Thread-Topic: [PATCH v3 2/2] PCI/ACPI: Confine program_hpx_type2 to the AER
 bits
Thread-Index: AQHci6Bzoxg7BPJ1h02CdG3Ul0x5+LVmoDYAgAE9BoCAAYY1gA==
Date: Thu, 29 Jan 2026 16:36:10 +0000
Message-ID: <E8CB259F-49BB-47FB-8D41-591DD302F168@oracle.com>
References: <20260127222442.GA379147@bhelgaas>
 <5B14DFEB-18F2-46C0-8DD1-166A3BC275B4@oracle.com>
In-Reply-To: <5B14DFEB-18F2-46C0-8DD1-166A3BC275B4@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR10MB6826:EE_|SA2PR10MB4539:EE_
x-ms-office365-filtering-correlation-id: ca8fd4d9-52c0-4717-d49e-08de5f54828e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z3RKYW9yZWxEenJjdTJzUVJBSlk2WnFxdm00NGpnMjRzYUVid1dkcVFwYUtD?=
 =?utf-8?B?RE5JbVJQU1MwSXo0N2dIRzRDM2wrRHlyN2VUcm02K0dJN3dnaDQ1cHZWb2pm?=
 =?utf-8?B?UGY3L3NSZlRKTFBJeUZ4eWdVL2xSYi9xRHMzTjdzbU9FV0hiL3NnM3NYWWFp?=
 =?utf-8?B?b3JCV2RTS3RBNjBaUUxxRk9pTFV3Q3RtbE0zQm1vQkJLWlREK2N3c3Nqazdn?=
 =?utf-8?B?SXJZSjh6RXJLdlM0NGhGZjdQTTNBcUxDZkJvMk4rZG5QUWtpU1hQa1Q1dnoy?=
 =?utf-8?B?YVRIMFd1MnlLQlNEY1pQZWxvVXJhaGJyTTlVaTR3eTJ1eGQvanpnRXo3UEl5?=
 =?utf-8?B?bS8wdXBSbEF1QWY0ZmVxM3ltWGxiZU1tdHFDc0M1eGR5Mi9HbnZZVzcxc0p4?=
 =?utf-8?B?eEk1ZUlhak4xQW40OFFKNDBUejlqa0JRNFNhUlNpQU5WcG5IVnRuSFY3NXFi?=
 =?utf-8?B?MzlVd0lzdXJHdE5Jdi9hMUFYZTJXUkJaWDNCdGZTdE92a2wyMTZnbElqMkN5?=
 =?utf-8?B?ckdnVW90RHlOZzVLZkUrNkR2cXhwdldCSU4yWGR0S3Y1SXpiYysxZmdEZlpo?=
 =?utf-8?B?UytoQmJuUElLN1cyL3EwaVdocTltcEUxOVBVSGVEVDJPdDhza3N0K0RJellj?=
 =?utf-8?B?cHNoSy92Qm1MeFNMNUo3ZDc3cjZJckVwYUZGNHp1ckpqRHJmQllielVtUmpY?=
 =?utf-8?B?RzMwTHFtRHNhMG1zbm01SWhGSjlpSi9WelliNUx2aGdVL2Q5RTNsR25CT1lC?=
 =?utf-8?B?YUVld0Eza2Q3ODJVUFhYR21kWkd6SXh0cjFTb0VQZGV3a2RIblI5dlYycEE2?=
 =?utf-8?B?alRzOXJCd01PUUJydDdZSU5JZUZHMFp0bHA3WWNaa0UvK1daQ01MbXR2bitv?=
 =?utf-8?B?RmlXN1VSNzlGZXhZY083MkxVdkxOQUNtYVVCZ0xQeXdYbURsWmtLMzdYNWxX?=
 =?utf-8?B?Q3gvb0hjNkNJTVVKelF0MHdaaVNKQ1RpYjFEcC9wdVZIZ1BaRUF6Rklpc0kv?=
 =?utf-8?B?cHhmQmJTRVJQUXBWcmhmUDRUdGx2eDlnOHI5VjhxbkZ2Q2ZwdVYzL245QStD?=
 =?utf-8?B?RWNOVWx0eWR3Y2xvWGZQcS9SRGVQR2hPUjNHaExmWXZSejdhdjNOcjA5MGxk?=
 =?utf-8?B?dkZUOU9EaFVzMVEzUDhXbEVSd1NCZWdQU0wxUmpEclNPeW0xckF5Nys0MmtU?=
 =?utf-8?B?am0ybkhKUklGdHNkbGl1SE5VSkNvaG5hZWI5dUVhejB6a2psNEZhS3N3ZkJw?=
 =?utf-8?B?M0k1ZzhJWml2aFJ3Vkdxc2Y0VXRtMjdDWnRRaVQwWUM3bFRPdExySkoyeWdB?=
 =?utf-8?B?bHB4aTBKZllDdDF1VHkxaE16cElQd1BVWUZNTGZHNzFPWUc3VG5UeTYrMXlj?=
 =?utf-8?B?SzRJL09EMW1vTlF0WkxNNThrMDBURWtUNitwcjFrUWpzcGQ5b2xrWFIxeXVQ?=
 =?utf-8?B?bWVOUTg0N1JQYkg5NUxRemZ5K3JJUCtxQmhxcFJmVEFYM0I1ZWN1ZzQwVDhz?=
 =?utf-8?B?QVJWOTJSWUh3OUx5c3VVVURORTlzUVdRN01zbHdlQ09YWmpSZFZEZncyRnJG?=
 =?utf-8?B?QmtJRHRVOUZVSjF6UWl3Z2psV1NEdUI5dEVqbUQyazRYTXl6SHZBcGxqVXJF?=
 =?utf-8?B?a1k2ZXlJeWlQNldUM2l5bkpWZG15cjNNQlRxZVArRE5QeWI2eEQxMzcwYllR?=
 =?utf-8?B?bldSMER4UWxLZXp4MXdRWDVUQWNTY1Q3Wm5FWWtSQWNZdE4vUTlEUkU0Ri9k?=
 =?utf-8?B?YmFlVHZRTWpPeFZNdmhXMGlvMm9nd0tOdERYeDl2Wkd0Q0htS09QMzJwRlJp?=
 =?utf-8?B?alhNUU9PZnBUT3VhYVJIOEpTNGMydE83VHZxRVVPditTLzBkaVhRbmRyeHo3?=
 =?utf-8?B?K0UvakYvU25ia1lNRUR0MFhlcndZeWdOSXBQMkFOeGRyUTYxNTZxbE9YNlI2?=
 =?utf-8?B?d0ZpQ0lqdEl1UGtFYlZqRjF0Ny9yMDYvL21KamttY285SE84Z1VZQUdSaGtJ?=
 =?utf-8?B?S3FwMjAwcHJNdkxMVU9tc3NhR1pnTFh0UkdCUWYvUWxXYjJudWtpcy9oK0xl?=
 =?utf-8?B?ZzhLbVd2MTlxV1pZOUk5eDRwNHU3ZVphQVRUOTRBZGNJWXNDNkFtVU82QWIx?=
 =?utf-8?B?OWorZzlFUlE3dU5aWUwzOHJaSW96Mlk1ODIvbUFBbE9OSVRta1d4cXh4ejhF?=
 =?utf-8?Q?7j7PsjcThe7FQO36FsQMqDA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6826.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OFFpcktNS0o1MWpGOC9zL1lMdjJQRWZhOWVwYmZUNW9VNmdvT2RTZittVGww?=
 =?utf-8?B?cTJrMTZhSHV1NXBieHBzclQyUEg3d29jaDNsYU1tRW9ESkFoOWV4SjIrQjF3?=
 =?utf-8?B?WFU4dUJEbHpYYzZ2OTczbFpEdS9mTmxzZy9rWG1reEhDblkwZnR1Qjdhejkv?=
 =?utf-8?B?eWZaMU1qMU94UGxsUEx6Z1diNXVNM1NCMFY4UlV4cVNJUlZnNVZOdm1RTURx?=
 =?utf-8?B?MFcrREVHZ1l0K09WYjJWNGFiSEVTQzlRQjJzZjBUWmovcjl0UnhaQlo0bHg1?=
 =?utf-8?B?OXVXTG5MS1dENDBwRFZyZW94VmJ3aUFZeEtjdHlxNXljaFYwb2RnSFpWRDQ5?=
 =?utf-8?B?aEEwamN1QmxiZlM2dVB6VCtZTWw3QmQ0L1lIZjgzOHdHOFFhM2d0QWF0cC9O?=
 =?utf-8?B?Z2dTWXIydVAvQ1NSa0dNSHpFSUpheUcwcW1JODc4YUt1dEtZUDNlVWdZRzFN?=
 =?utf-8?B?U2d3LzJhZ3NIMVlKQ25Ka1FsN2tJYVBTdEo4RUs1SDdhUG9JYlRJSEhYc2dS?=
 =?utf-8?B?NGlaWWtsM3FqRi8vUmM2TUFyclo3ZXhLZmlPV3FmYmJOMkhocVlta1dGRi9q?=
 =?utf-8?B?VHR0MU4xYVFXM1BYUnlqZ3d6VnczTE9aWSs3ejBBaEgzTHc0U09pN0M1M2hH?=
 =?utf-8?B?TlBlZ3VZc3hwSWRaR3k0WG1BTlJvSmUvenpXMzNrZlZnV2MyRU9NN1FaTm15?=
 =?utf-8?B?QUhzcWhLRnUvcFZ6TWUxV2pxQmtPd1hqZ1haS3U1T1pPYi9ZUVVvODMveWdV?=
 =?utf-8?B?ajdvQ1RQa0VPTEdFQzlDa0hZU2hValdHWEdtVjVJK2IxSEc1Y3Y3TVJVTjNS?=
 =?utf-8?B?NHl3NXZNL0luMHlsTEREZlFIRDg1VzlGRzF3MDdkRFZIVjJUZTNERDAzM2FM?=
 =?utf-8?B?VCtTVFYyY05zMlMrcC9iSWRJbitzNEthazduaEtoaHF4T0tkdkFaL2hxZjRx?=
 =?utf-8?B?SG9PNmwzYitnb0pLM0hmVHp0K3hFNUNVVy9YOE01S29JVXJ4N3JCdkNBRVFq?=
 =?utf-8?B?WWxWYUltLzJFTlE4YVdqalJKUXAxdUFSNHc2ZkFRUXdmM1lnVEJhd3Fha0p6?=
 =?utf-8?B?YVhzdGJMd2J3WVRRcW53NkpNeHhGMjEzTndYZzlLV240UzJ3ajhidWNKSHlI?=
 =?utf-8?B?OXBCZVZiUjFCd0p5aXI5eWxjaGxXcGdLVHd6REVzSy8xTFFNWlpRMGc4WGxs?=
 =?utf-8?B?QjdRVnY5ZkxsZlN2OHRGaHdCMXZxK0xURURueTNVNjdoQ05sNm5uaCtOdnNX?=
 =?utf-8?B?QTVTbWRtbkl1YWMvY0dMK0ZrNnRRU2RCZjZyS0VPTkdBVXh0U0Y1SXZuVTBn?=
 =?utf-8?B?MVg3a2htYzRJRVhsV1pBZGJhVjFBa29lMFRDTlRLT1p0bWpWeXRhdGNScFNM?=
 =?utf-8?B?cURwTnl2Zk40d3NuVCtRenIrS1ZzMkp5V0U2T09rbnVXMVZtQURQNDcxNC9r?=
 =?utf-8?B?K3hyeEJlL1p2ZDJCOVVZRUhEUjB2NjRTZTB1TllSZHZkWFFKakJhMWdJZXA0?=
 =?utf-8?B?V3pYMmcxODFoSk1RU0c0Tzd4STdTUEpnQzkwRE9qRi9rK3BuekNvTFNKbHZs?=
 =?utf-8?B?MVJGa0MyUldUSDNFaS9ZWVJsVkhjY0x3VUJza2svdTY5L2l1OTgzWmJjcDFJ?=
 =?utf-8?B?bWVlUVRTWVl4YjJYc21WSW9pOHp5ZkF6NGdhSC96ejRrcGtiL1hqaE9vVHJ5?=
 =?utf-8?B?ZWV0aW50R1AzY0s0NTJHVUNDSlo4a1djajNyMHV4dU9WWTNVbnRmVlRLWDIv?=
 =?utf-8?B?NEI2VGhQdVlCVFZ4MG4zWi96S1R1V1dTdVZob25Yb0FlOE42VHdFVWdXRWJL?=
 =?utf-8?B?Tm5Pb250enZIaUhhT01LUXE0d0RXVEQzWEo4RUsxazU1ajk4UHNWZFA4VFVu?=
 =?utf-8?B?cEhzNXFVeUJ2M2c5eWpObDdVTlc2RkpBNGcxK2pTRllXQ3ptYVdkVlJMZENj?=
 =?utf-8?B?dGNTRUdONEI3VEMrZFMxbWNwMHZqeXF3MGdOSFU0UlgzTGZYbGtxdHhtaDAr?=
 =?utf-8?B?OExtL0JHTVpRbDIzS1UxeWRmaW9LaCtRMXVwL1dESVBxM3BPZDNJc091MXh1?=
 =?utf-8?B?Qk1ma3ZBT3JaUTlsSFlyNmlxZTJ1cnF5QXJQamZuQ0FFQjFzZ3dVZnN4TG9a?=
 =?utf-8?B?NnljWDU2YkdJemFPMTVOLzJzQklINTZyN0ZQUFdyVnRhVVpEZTFDYVNCMzVJ?=
 =?utf-8?B?cDhYb1VDV1J2aXd0S3kvWUVjSWZjMHRrMmlyekMxbS9PZ0hzTk5jcVpHQ29v?=
 =?utf-8?B?WFQ4Um0yVWt5QjA5ZCtnRFhiNktyL0Q0NmoyOVJzUnhhR3N0K1hUYUFHalpI?=
 =?utf-8?B?VE1IdkFZNGxoNmd1SVlIUTdVYkRsdm5BajBPaFlwVkFNd3MvOWphcjhReWNE?=
 =?utf-8?Q?rxONe+lQF9rWUyDE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FDF0931E236C148A8DC1B95D980D95D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
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
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aUNQRROxo4nP5ICL9XXiZ0RzoOvDrHlCbnlm3TUE7o9juwwilpp97TgWYRvP0LJGT+e1OlK/WfU3+kgp/lfKku10r9dzGEkPpsWZYY2SzXxW4YqJlwYQmUllTxVJnPSBnmuTXbuMTZZQqe3qqJf0DiYCAPqsOsdup1CYwo6RPc8AzHYVeNmwu3/UhC1XvBhZr8Wy0Oi0uB/Jx1xhnc9LEsbnZFhhW/XlbZGFCk0fNYWb2t9masJnmhzu6O1l4K99SZc8Ty6UKxndTZq7mPcrhHCpBosqsJd8Px9Ljuzw/PzzxJwbRmblUdQ5St4+w5JFECXbD8bgd1xctz9jzkLTm4Jo02adl5TvusY5GYvVYOsBChS9Q+GiO6+byk5c+ON4ChzEa+vBU/oJlHve2dClyd+QDACC55BFjshRShPPvcru13dxewvVI2RFW9ZpuRk30+pKFG2FYEgCG00zreQD5tZrFmFwubcnBoeMZd/2U2hPDmxwpRz+xEejFxFfFmJIknhALMP6GcBrJEx7z55Hyt9eFuzqZR64fg0lSh93kL22+htkk1+CL3/PyaigBpPrEcJa+xcTDupB7LRYFmhTWyFovYWsaC/tWg5gyXJFlB8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6826.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8fd4d9-52c0-4717-d49e-08de5f54828e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 16:36:10.4469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e6I72tVG1DOq/3TJybTCerujtLMNilOX9NDVSEbhdwLmfE7bZr0qPj49AgeBMwMDwSYYi5nEiv/VGRmWHOHRIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4539
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601290115
X-Proofpoint-ORIG-GUID: Oaig0m9XNg-JxgQ5uUq7f2iy2tzDhLuK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExNiBTYWx0ZWRfX2lsNb1J+QGc0
 Qpy7miSjLsZ/GGpXNoDQs4Ce5GRGJzaub8e0hNyQHV7EwmlBjcgW3nc15K/lJA2ksfnq0erFnJ5
 nUCXvYMulyEXIm42/ZI9pmHJthXBet7lUMVoJ63pbZ7/OC0Bbccpf/htrqAW/2+M7tksr8xIP1R
 cXHcMtYrvU8umq1BxwCzo8wnm2Lz7IWtg/T2YVs4n9ahXiJX40yoVWrqS/rRA+5aJ1cOgd0u0Di
 Jer54xc8z8RZaCy6hwYWBKfrJ/FXmHsq7EHjW/1JXfyAk5B6yi9vrX6lQa5NjKL7BDRXdmpxhR0
 51j4EbZ9QpmwGUI0JnE/vHwpkdGPOMKy/DX2OxX1g0UKhpBovb01S6kXNyyYEnhnTWZDxP4wtyb
 NF5OjVygDkYygWKeDN8EKoY9teTKhPI11MnMMkmluZsgF0OHnBdvvLP+gA+B9hfLjJiXIrHPSWk
 kYmKlG6DsllgLXT+KVPI8v6zUGI02favF988efpY=
X-Authority-Analysis: v=2.4 cv=Qe5rf8bv c=1 sm=1 tr=0 ts=697b8c7f b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Wl_u4ra9nSrZaNrLTc0A:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13644
X-Proofpoint-GUID: Oaig0m9XNg-JxgQ5uUq7f2iy2tzDhLuK
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.11 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.20)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-16405-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:bhelgaas@google.com,m:schnelle@linux.ibm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:gregkh@suse.de,m:kaneshige.kenji@jp.fujitsu.com,m:alex@shazbot.org,m:morbidrsa@gmail.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[haakon.bugge@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[google.com,linux.ibm.com,kernel.org,gmail.com,suse.de,jp.fujitsu.com,shazbot.org,vger.kernel.org,lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.onmicrosoft.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haakon.bugge@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3430AB4881
X-Rspamd-Action: no action

Pj4+IFRoYW5rcyBmb3IgdGhlIHdvcmQtc21pdGhpbmcgYW5kIGltcHJvdmVkIGFjY3VyYWN5IQ0K
Pj4+IA0KPj4+ICsJLyogTG9nIGlmIF9IUFggYXR0ZW1wdHMgdG8gbW9kaWZ5IFBDSWUgTGluayBD
b250cm9sIHJlZ2lzdGVyICovDQo+Pj4gCWlmIChwY2llX2NhcF9oYXNfbG5rY3RsKGRldikpIHsN
Cj4+PiAtDQo+Pj4gLQkJLyoNCj4+PiAtCQkgKiBJZiB0aGUgUm9vdCBQb3J0IHN1cHBvcnRzIFJl
YWQgQ29tcGxldGlvbiBCb3VuZGFyeSBvZg0KPj4+IC0JCSAqIDEyOCwgc2V0IFJDQiB0byAxMjgu
ICBPdGhlcndpc2UsIGNsZWFyIGl0Lg0KPj4+IC0JCSAqLw0KPj4+IC0JCWhweC0+cGNpX2V4cF9s
bmtjdGxfYW5kIHw9IFBDSV9FWFBfTE5LQ1RMX1JDQjsNCj4+PiAtCQlocHgtPnBjaV9leHBfbG5r
Y3RsX29yICY9IH5QQ0lfRVhQX0xOS0NUTF9SQ0I7DQo+Pj4gLQkJaWYgKHBjaWVfcm9vdF9yY2Jf
c2V0KGRldikpDQo+Pj4gLQkJCWhweC0+cGNpX2V4cF9sbmtjdGxfb3IgfD0gUENJX0VYUF9MTktD
VExfUkNCOw0KPj4+IC0NCj4+PiAtCQlwY2llX2NhcGFiaWxpdHlfY2xlYXJfYW5kX3NldF93b3Jk
KGRldiwgUENJX0VYUF9MTktDVEwsDQo+Pj4gLQkJCX5ocHgtPnBjaV9leHBfbG5rY3RsX2FuZCwg
aHB4LT5wY2lfZXhwX2xua2N0bF9vcik7DQo+Pj4gDQo+IFRoaXMgd2FzIHdoYXQgY29uZnVzZWQg
bWUgYSBsb3QsIHRoZSBiaXQtd2lzZSBOT1QgYWJvdmUuIFRoYXQgbXVzdCBiZSB3cm9uZywgYXMg
cGNpZV9jYXBhYmlsaXR5X2NsZWFyX2FuZF9zZXRfd29yZCgpIGludmVydHMgdGhlICJjbGVhciIg
YXJndW1lbnQuDQoNCkhhdmUgdG8gY29ycmVjdCBteXNlbGYgaGVyZS4gQUNQSSBzdGF0ZXM6DQoN
CldoZW4gY29uZmlndXJpbmcgYSBnaXZlbiByZWdpc3RlciwgT1NQTSB1c2VzIHRoZSBmb2xsb3dp
bmcgYWxnb3JpdGhtOg0KMS4gUmVhZCB0aGUgcmVnaXN0ZXLigJlzIGN1cnJlbnQgdmFsdWUsIHdo
aWNoIGNvbnRhaW5zIHRoZSByZWdpc3RlcuKAmXMgZGVmYXVsdCB2YWx1ZS4NCjIuIFBlcmZvcm0g
YSBiaXQtd2lzZSBBTkQgb3BlcmF0aW9uIHdpdGggdGhlIOKAnEFORCBtYXNr4oCdIGZyb20gdGhl
IHRhYmxlIGJlbG93Lg0KW10NCg0KQmVjYXVzZSBwY2llX2NhcGFiaWxpdHlfY2xlYXJfYW5kX3Nl
dF93b3JkKCkgaW52ZXJ0cyB0aGUgImNsZWFyIiBhcmd1bWVudCwgdGhlIGFib3ZlIGJpdHdpc2Ug
Tk9UIGlzIG9mIGNvdXJzZSBjb3JyZWN0LiBUd28gYml0d2lzZSBOT1RzIGlzIGEgbm8tb3AgYW5k
IHdlIGZvbGxvdyB0aGUgQUNQSSBvdXRsaW5lZCBhbGdvcml0aG0uDQoNCg0KU29ycnkgZm9yIHRo
ZSBub2lzZSwgSMOla29uDQoNCg==

