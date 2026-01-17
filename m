Return-Path: <linuxppc-dev+bounces-15932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A484FD38C53
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jan 2026 05:42:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtPGk19f4z2xqG;
	Sat, 17 Jan 2026 15:42:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768624974;
	cv=pass; b=muGl+UL6LcWcXwM0bybD7KuhtktuxnY6xdktIVBSNc1Gjmb/gqQXZeHwym6VRCDLqZo+6e2ZMrFpYoNBPXUFc9huZP5fUf2W15rrkNM0a2hPXqdXmXTfGFTIOwPc56jvI2AWJLw+xec9N1FQezjAC/luxAglWVmwuix3hFpYfgwSKBPMLzHF32u+YCARvilv7USpEL1D5Xq9uvVWA9h117GEzY6Ye4cXTeZelh+FeDoq6o0R5+mKHa5meOwdt0HUtKGGtPQBwdcNempZqP302OSWIT8yAv7he4y4gzgb/4ye/nAvyK+O39ehGXbD+dNcEAZT30jZm9btrfH6oTQ4cA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768624974; c=relaxed/relaxed;
	bh=p11bdnKAtg2UIAYPWTHgaWKN6eGhLchfBVxS+kqULM0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DHbsY/cZFEoT8Cg4d+ZZoW/UUpw+NyRgnvgCfg3/c9Tj4W/OeCAEvHij7ZEAT/yVG9oTAJwHf5JMiYvmmVv8QkeUf52tIaEQa3nAHcx+U4WE8iGd6AnoiALIdXGwWVFOvKFMRKBJUkJRqZk0nfSsI1gcpb92OUZLil9dCnCqLEhoyxsOX4EIkXo3drUQu7Q+QJDjQdN3aTR573zewV8ZsqN8QHrOOgKSZ6YAn8Olzu71moaSpopbbX2quQ/Is+g0tVlbuFdfkvWw4CoEcU6KBFCYiDkw7XGNHOzouCvzGGvKEyb5uPMpMyEL6MvRNMdpSfXyDAr7sBE0dBK+ltmi7w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KdIpzshu; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KdIpzshu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtPGh50qKz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 15:42:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9h+fL038i93OZcf5uQlH5cBDfIymHunVz5vDsRYBssv7SL2m820AMhiK22Yi2gitQwj1witTaZ9ffFcVq3yO26MXMrVomMSgtL4AXeqtWXcfiFzooJK9JVOIHFHmnK0EwEekEEDABnbengYhOsEaxptu86SlWnlT84yUCPdsefsXTFElH7chkh2CD5R2bMCjEoMuApomM0dI9DianLbiQfDwHdN7tji9O4kCo5+3VWVsh28tFtNe/Mzy4ad1udgIIvx4zo+UXSy4aF+L3xlrb107wzso+1pLF1AKEQu1OoWfa33bpKDC1Kd35U6evQotGgsqDaCmF35ajkZ0QR7VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p11bdnKAtg2UIAYPWTHgaWKN6eGhLchfBVxS+kqULM0=;
 b=CZTEmDOdSJfozmMGPvFasmYEu8IUoo/y0GHwUk9411riwVw8n/Bv60v/vDUWCEPi3C8TuXLFeGMv0P9EIR21kkNGViQFEBS28MHC1wpBgqN2jvTGSmUJ8P8puUwKN/lxLZxAGyFTwTmeNsztidTx2p7PAACZrEpFgnFif+HSuanDbs/1Ty/LR8ASW/r0Ylxob6178vvzgKDhndHAbwGOCEB0vKdWdhgPEF/49JVhf8hlTC22wMBVWWS3/lXEL6/cDGWGb5ntSFINdgffOZfmPwMgRlQnyDtG6vC62uG4erSoOhAN+ttUhskll3BkrWoyP7HmLpXa+fm3/I/sEpVEYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p11bdnKAtg2UIAYPWTHgaWKN6eGhLchfBVxS+kqULM0=;
 b=KdIpzshuj4Fb5qnex+HyAYJKMneVe0wWVsnXUWGve0DGkq3/mGWucGwxMh+r5EGf/NVmcdxIWkjuXGQyjewhF/C0lQM542CeTXcjQV7vMfK9/QDS7c+8Z9Kj+AT+XGO0PLqIMbZG6bwTKGRV36hlGLSFBqFKRa9K6lZMZJZU17QfcNvDyH6Uqpgo1k5e4vGIbRlL77Sgq2YtE56topdfTdb0cwkcJIPGreoxnRue4q1lwsdnDSZAToOdnW2mnXKl06cBZEqCR9JFyJZizW3P7fp6p/5Y4d6JvY5Bj030TllQnIEeQeXa+cqOZb3DMYwmLUIbb8zghuWpxTnJkt1EwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Sat, 17 Jan
 2026 04:42:25 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9499.005; Sat, 17 Jan 2026
 04:42:25 +0000
Message-ID: <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
Date: Sat, 17 Jan 2026 15:42:16 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
To: Matthew Brost <matthew.brost@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Zi Yan <ziy@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky
 <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-mm@kvack.org, linux-cxl@vger.kernel.org
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <20260116174947.GA1134434@nvidia.com>
 <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
 <aWqgHTZ5hjlRvlKU@lstrano-desk.jf.intel.com>
 <20260117005114.GC1134360@nvidia.com>
 <aWsIT8A2dLciFvhj@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <aWsIT8A2dLciFvhj@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::30) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DM3PR12MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: 017e0419-6f90-4a07-cefe-08de5582cff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDFyZnYrRndzRTg3YnRPYmhQZVE5VHo1Q3ppMzduQlhRczlSdmZRd3FXS3B4?=
 =?utf-8?B?T25KWjhFOERxNStSdDY5bDI2bEtacmRuSDlqc2dZSWwzTEM4SGRoQk1qWWZM?=
 =?utf-8?B?Um5EUDlocG4ya3V2M3ZPSWtMU0NzWERueG9rcElWdTEwSENPOEJsYjcvWlFB?=
 =?utf-8?B?bmxxRTFpcjJ1TTRlSTRRSVFWUzkxK2N5TW1qTXFVdHZ3WXhFY0l1UVlBdy90?=
 =?utf-8?B?dTBpeitKbDhXNkdzajlxRGo3UURHeVZ2NU1WdVhkdE52L0xZSVNnWG5UMmlj?=
 =?utf-8?B?L3h3V3BSWlN6R0s5OWlUdWFOZWQ5NENFTWpUaTY2b2Q3Qy9ocytlU2pzVXV0?=
 =?utf-8?B?RWpnWmpTL3FCUXBTMUZFdXZZQTRBVzVuazhEUkp5a2pIbjMxa3BCN0s4a2hr?=
 =?utf-8?B?R1JwQ08yV2VveTBtWXpkM3JCRUtxQmU0M0ZjYzdTcC9hZ3l2elB5UFRVdXZT?=
 =?utf-8?B?S2MyZjErazJBMmthdnc2VHkyS3FpbStuWUxKM1hmK1R6WVI0ZmIwUmNCdDZx?=
 =?utf-8?B?aE5yQXNBUi9DcjNMQzJVOEZBa0M0VHV0dFd3eWxsZnkxS3kxa1FOUEpTRGlw?=
 =?utf-8?B?ZFMyMFFTK1BNRFhhNHoxWENMTlRKV29kcndETzd0VDlCMUwrZjNpUVVma2w0?=
 =?utf-8?B?SmFrSUc2a3FsYy9Hc2paUFc1YmNvdFpyWGZhSHFGSTBUNFg0UUJ5VU9KS0RG?=
 =?utf-8?B?Uy9aa2xZN2duUGN5eXNxYThWMW5ucGEvekNSditTdUxTZEwyYmloYmxITUNH?=
 =?utf-8?B?eWVZOVNlTnphTVJZaXFUVktORWNMa2FWeXA2RnQvczl3RXJ0S1ZVbGRoU3c3?=
 =?utf-8?B?MnBPLzBpUzZrQW0ySk9kV2VrVzFHQVRIZi9mMElJUW4rL3RPd05QWGtFUjI1?=
 =?utf-8?B?UFRFTTh6Q3hjZFgxbTdJQTlWQlJnSzVpVWhhcXhCU2FkZUlubXVocGJOeUEy?=
 =?utf-8?B?eGhMdG1NQU43TTd4U3ZINys1alNRYkxKS3hKRjZwZnROSnREbXoxYloweFlD?=
 =?utf-8?B?dUtSR1BwV0ZydVN3WEJDMWRlVWVEMVNKMmxwNHV3TDBwbEtUbU00ZTI3bXhQ?=
 =?utf-8?B?endYWGoxcnZPR1ZtV3dlYnZyVFBEYzBXbjZ5bE9IbEUwbjFaVUlBK0VzcGtF?=
 =?utf-8?B?S2VydWl5bEJWM1RERlpVTVZTSDhIbHNod01RMElXV2JhNDBzYVhmZGxCYzhF?=
 =?utf-8?B?emZ4TXRDWE52N01ZLytiZ2V4N0lXR0JPczhSbk01ZldqUkNyM2Q4eERLL3J1?=
 =?utf-8?B?YVAwZitpMjV3bTZyUS92bzQyMGRpMENFZjhaUWNrMndHWFl0QUMraW9zdDVo?=
 =?utf-8?B?MEF5dlpiMk1JRkQ5KzRSblRpb21nc2hPU3kwS0tCa0JWVy85ZUs3N0p4c0Zn?=
 =?utf-8?B?N3V4dmw3dXpUYWIxUHhIWjAycUo1TGpEU25MVS9RejdtWTVwVU4yRXF6NzZl?=
 =?utf-8?B?dWtTcFpJcnNJSjhQVVZEUzRCeFdZQkM3cEZ4em15RzZxUHpPRlltM0VieUgy?=
 =?utf-8?B?MXBUbjVIb21IZnV1Z08wMVZEMXQ4L1FNSnliczBTY3pPMjZrSHVqV0VJM2xa?=
 =?utf-8?B?UDQyaHpuR0V5V0c5WXZVQ1ZUY3BIVE1qUkpITGppbjNvaGdzdk5vMXU4SUdZ?=
 =?utf-8?B?WHRoWlBLa09nckpRQmRwSkQycHp4T0lyNmVjdVNVNkdtajlGUVRhcDIxK0xC?=
 =?utf-8?B?RENKcEFmYlNMTXU2NEYycUVkOTdEUHJUQ09XMDVBMkZWREVYR3FSOWgrMmgw?=
 =?utf-8?B?ZXlEcXNrN2tzT3ZVTU9heFJDVnBCcjJlUVoxaUhnNDYrOU90Um1jdXZDNXV4?=
 =?utf-8?B?K1NTQWZjUWZkS3FzdExMZnVPYnFRZnZ5Q3Iya1hFOEkvUEhoLy9zajROaEV6?=
 =?utf-8?B?Qys0aW5hbFozSjRqaEg4UDlpQk5RTXBOQnVlU2VtbTZhcGNGUlJmSEtoenJD?=
 =?utf-8?B?K2dRT0VuOHJzbmswcUljMEZmOTl6aG82UGpOcklJSldoc0ZIdVN4MUFvWHc2?=
 =?utf-8?B?QTd1SjNQNUhPNXpEVVk4eXVvM3BNdVdzbU9ZTGdzZllVR2E1Mm84YWFBWkox?=
 =?utf-8?B?ZnphdUxDVUNvVmNLUi9aVElDK2RERVlsZ0NkLzMvS0hzRS83MlhueitleU12?=
 =?utf-8?Q?WhAw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU1sMEpwUkFhQVh2a2FKenY4Qmt4Tk91bE92U0V3ZkhMRklGbzdOKzUvZURN?=
 =?utf-8?B?N29GN1dFWmpET2VVeVRNcHQvUFFQL3ZTY2VaNVVnRmF0Sm9vU1VncHgvYjhP?=
 =?utf-8?B?cXVRdHVlUzBla1Ayb1JndUFLSEJrc2xZd2hrTmhCZmdhWkNmUGV4ZC8zL0o2?=
 =?utf-8?B?Ujh3ZFZyLzNFSTlYbVV1K0pvSUlTaE1OOVE1TGN3ZEJORXdON1lvWmVKTVl4?=
 =?utf-8?B?NHVFaUxiYlFKTG5KTTd3Sk1BMDQrQUFnblAwUDhRYVg0Q0VKWjBXRWxWaDVn?=
 =?utf-8?B?bHdjb1JaRmFiYXhkWTZtUmtGMzZqUHdENFo2bkQrSldkWGp3NSt5aE42TmJp?=
 =?utf-8?B?R0U5VXhlZStMNnF1Um4xUG9iVzBSSHVzWWE0cmExWnFVdS9XeVlRTFcwK2dk?=
 =?utf-8?B?TDVGRlkvK2QyME50Vy9OZmVCRzZ6QnNPcmtOUlRqS0Q5TnZIakg1SFY3ZEt6?=
 =?utf-8?B?NlFuRkZsK0FhSjJNT1dadTlXWTVuakI3am45dzNwK0IxaG1GV1FLY3pRL004?=
 =?utf-8?B?dFZ3QjdBeTZ2dkZ2TWIyYkZyM200WHIvYm9zWUZRSVhTMUZsUzNDalNhN0lO?=
 =?utf-8?B?UWQ3ZHhRaFdackt4dzJraEErTHh2SG05NFZDUVpPdWdCM2x3cXU3ek5adXBJ?=
 =?utf-8?B?cmNwZDNIQWNWS2hLV3Qxd2gyck8ycFNTRFh3Wk5QaUIvVXNQbFBGTlNaeEI2?=
 =?utf-8?B?ZmNjUE5jTi9qaUVENzJCbEd5YUpoenlha1I5K2FlQnlIK1VSSnBnT29VKzFy?=
 =?utf-8?B?Z2lGOG9hZ3NRQ3ZYWnRJR0czYjVjUUhyOTFHWlhBTUx5Z3o5WVJDY1hKOCt5?=
 =?utf-8?B?Z0NCUkZBNlQreGhMS2tTc25JUm5qYzl0UGNqQWhvRWlVN253MS9qWmxhaE0w?=
 =?utf-8?B?Z01xblBVVUFPVkpLV0M1R2dpaUVlcjE1YlhtSVNUYTVwYTY1K1ZiaERTbFor?=
 =?utf-8?B?R1RYM0NrV2dXUWUwb1F1d29yNGRCNXpyV1JFdVRaQ1dkVldXa1dLcUNsRWtQ?=
 =?utf-8?B?WVlkN210bklqdjZrWEU0bXRnbUo1bVlnVTFaZlBXQnNOSkNaZEJrV2pPTktz?=
 =?utf-8?B?dnRuenBNUUkrVk16THM3aEpGMm9XeVVLNlRTSVI4ZWMrYkxvSmgwTnZ2WC9m?=
 =?utf-8?B?eG9RZGV4VlJDeFJobitpZ3ViSUV5aHQzbnpXekJtSFJjVFQrTWhNSmxwZFM4?=
 =?utf-8?B?cjJHQUdVb0cyWTc4QmJPWlp0WDdxZEJyRmtTeVdWMVh5VWxxL0Y3V1p1aVJS?=
 =?utf-8?B?MnJaY1NHbzZXelptSWExUGMxNzl6NzJ2OGFESW5jVjJtUTBjVXowQW1uZjFJ?=
 =?utf-8?B?MEt3SGN6YkFzcmpRUmlPRjNzRjFBKzJQY243MzBlOWphZWNaSHZYRlVtRm5N?=
 =?utf-8?B?TTBkejJxcnhLa21FQTI2eW9yWWZxbFZKS2ExYjJocGpQUExVRDYwRUp4cUNq?=
 =?utf-8?B?K1p6eFFsUUtsZnNSSnYwcVpJd0x5VUdvMlVnVmhHa0htaG1KVHhmbTJKNThP?=
 =?utf-8?B?UmlvY0FMYktoSDVvUWd0MDBXU2dEdVBBaW90bHROeUk4WFBlR0hJNnpjVlRY?=
 =?utf-8?B?KzMzUWQzbmdjNHphdUhZRmVTRjM1eUJqcUtxeVdRSGw5cm4rQWtxMC95MTJq?=
 =?utf-8?B?cFRaMXFLeWh4YzU5bHVmOW1JVHFSZ3dIVlc5SkhraWFmWTVYQW44NndGd1dj?=
 =?utf-8?B?YlplcjVwT0hCb1loQ3JNdmhRaTZFTHBoV0xNWTBBWTBxTUJtZlRXQUNMODJC?=
 =?utf-8?B?bjBoVVRkTC80a0VETHI0Y1pBWkFhMWU5SVZscUhJUUxHSnI1ZDRLTUFGWWZN?=
 =?utf-8?B?MFpEVHZqRFNrUW9xdWxHTk1lVDQ4Tlk0WWRIOTZCV0g2dkRZZnB4Z3JvNVkw?=
 =?utf-8?B?VXkxdnM3V3RiTkJkZWh1bHFtZ3JaVWI0S1YvQ3A2T2gxcys1ZFlhbExSaTI0?=
 =?utf-8?B?RTVLOTlSM241aGJpbFhQdk5EbVZPSVlGdkk5QzZGYW5IV0V5VTlaOXo3K3V4?=
 =?utf-8?B?NitFWFdleTFHWXZUVkUrNjU2MDR5K2VzUXBoUkV4cVZHR1FnV0dIOGt1MEQy?=
 =?utf-8?B?cXlBWVE5NUxVZWd2YjhvSUw5R1p5NTd1NVN5eUdOaHhYRVYwcGhWQnNudDl5?=
 =?utf-8?B?YTUrNy9zaVNOSXlkMm9JRG95SUpwYXFVUEc4cE92VXlHN1RDd1dickQ5LzBM?=
 =?utf-8?B?YWZuRFNxZmRGbjBvdGtrUWgzblpTdVpFQWdCZFdVVU1DVnMxTEFNZUgxK3hL?=
 =?utf-8?B?d0FnZHIydTNNZElHeXJqaDQ0VlZRZVpzTG0rSW52TTNvM2RvRjhwME00ZlIv?=
 =?utf-8?B?eThxdkpVRVVsU29GYm01WW54b2Nrc2U0cUVReDdTYVM0M2NjVlhvc1FmTlpW?=
 =?utf-8?Q?K5p/dzCyBFVIMdEDCQUB0INJKCFe6Bbsl18WOlFIRIhao?=
X-MS-Exchange-AntiSpam-MessageData-1: 74MBLEH22TBZDA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017e0419-6f90-4a07-cefe-08de5582cff7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 04:42:25.7536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qb1+AaJGPYUDke62oRGXRFettCizKxaKMR0TV4cpinaDWQrMNOwsi7bMUL7cAgOtKZhSJmyImZ/tXlHx76w0AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/17/26 14:55, Matthew Brost wrote:
> On Fri, Jan 16, 2026 at 08:51:14PM -0400, Jason Gunthorpe wrote:
>> On Fri, Jan 16, 2026 at 12:31:25PM -0800, Matthew Brost wrote:
>>>> I suppose we could be getting say an order-9 folio that was previously used
>>>> as two order-8 folios? And each of them had their _nr_pages in their head
>>>
>>> Yes, this is a good example. At this point we have idea what previous
>>> allocation(s) order(s) were - we could have multiple places in the loop
>>> where _nr_pages is populated, thus we have to clear this everywhere. 
>>
>> Why? The fact you have to use such a crazy expression to even access
>> _nr_pages strongly says nothing will read it as _nr_pages.
>>
>> Explain each thing:
>>
>> 		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
>>
>> OK, the tail page flags need to be set right, and prep_compound_page()
>> called later depends on them being zero.
>>
>> 		((struct folio *)(new_page - 1))->_nr_pages = 0;
>>
>> Can't see a reason, nothing reads _nr_pages from a random tail
>> page. _nr_pages is the last 8 bytes of struct page so it overlaps
>> memcg_data, which is also not supposed to be read from a tail page?
>>
>> 		new_folio->mapping = NULL;
>>
>> Pointless, prep_compound_page() -> prep_compound_tail() -> p->mapping = TAIL_MAPPING;
>>
>> 		new_folio->pgmap = pgmap;	/* Also clear compound head */
>>
>> Pointless, compound_head is set in prep_compound_tail(): set_compound_head(p, head);
>>
>> 		new_folio->share = 0;   /* fsdax only, unused for device private */
>>
>> Not sure, certainly share isn't read from a tail page..
>>
>>>>> Why can't this use the normal helpers, like memmap_init_compound()?
>>>>>
>>>>>  struct folio *new_folio = page
>>>>>
>>>>>  /* First 4 tail pages are part of struct folio */
>>>>>  for (i = 4; i < (1UL << order); i++) {
>>>>>      prep_compound_tail(..)
>>>>>  }
>>>>>
>>>>>  prep_comound_head(page, order)
>>>>>  new_folio->_nr_pages = 0
>>>>>
>>>>> ??
>>>
>>> I've beat this to death with Alistair, normal helpers do not work here.
>>
>> What do you mean? It already calls prep_compound_page()! The issue
>> seems to be that prep_compound_page() makes assumptions about what
>> values are in flags already?
>>
>> So how about move that page flags mask logic into
>> prep_compound_tail()? I think that would help Vlastimil's
>> concern. That function is already touching most of the cache line so
>> an extra word shouldn't make a performance difference.
>>
>>> An order zero allocation could have _nr_pages set in its page,
>>> new_folio->_nr_pages is page + 1 memory.
>>
>> An order zero allocation does not have _nr_pages because it is in page
>> +1 memory that doesn't exist.
>>
>> An order zero allocation might have memcg_data in the same slot, does
>> it need zeroing? If so why not add that to prep_compound_head() ?
>>
>> Also, prep_compound_head() handles order 0 too:
>>
>> 	if (IS_ENABLED(CONFIG_64BIT) || order > 1) {
>> 		atomic_set(&folio->_pincount, 0);
>> 		atomic_set(&folio->_entire_mapcount, -1);
>> 	}
>> 	if (order > 1)
>> 		INIT_LIST_HEAD(&folio->_deferred_list);
>>
>> So some of the problem here looks to be not calling it:
>>
>> 	if (order)
>> 		prep_compound_page(page, order);
>>
>> So, remove that if ? Also shouldn't it be moved above the
>> set_page_count/lock_page ?
>>
> 
> I'm not addressing each comment, some might be valid, others are not.
> 
> Ok, can I rework this in a follow-up - I will commit to that? Anything
> we touch here is extremely sensitive to failures - Intel is the primary
> test vector for any modification to device pages for what I can tell.
> 
> The fact is that large device pages do not really work without this
> patch, or prior revs. I’ve spent a lot of time getting large device
> pages stable — both here and in the initial series, commiting to help in
> follow on series touch SVM related things.
> 

Matthew, I feel your frustration and appreciate your help.
For the current state of 6.19, your changes work for me, I added a
Reviewed-by to the patch. It affects a small number of drivers and makes
them work for zone device folios. I am happy to maintain the changes
sent out as a part of zone_device_page_init()

We can rework the details in a follow up series, there are many ideas
and ways of doing this (Jason, Alistair, Zi have good ideas as well).

> I’m going to miss my merge window with this (RB’d) patch blocked for
> large device pages. Expect my commitment to helping other vendors to
> drop if this happens. I’ll maybe just say: that doesn’t work in my CI,
> try again.
> 
> Or perhaps we just revert large device pages in 6.19 if we can't get a
> consensus here as we shouldn't ship a non-functional kernel.
> 
> Matt
> 
>> Jason


