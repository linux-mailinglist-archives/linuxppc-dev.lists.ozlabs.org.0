Return-Path: <linuxppc-dev+bounces-15481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABF9D0C7C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 23:48:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnxlH66P5z2yDk;
	Sat, 10 Jan 2026 09:48:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.209.30 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767998923;
	cv=pass; b=RQPK4ieCNSvgu8gZDQ90APUa02RPCY40DOh5J8eD/4es+DJT4j7hmjo1B/lhHYBYmm5BhF6dAas1Tq2NjJ5Bjqp2hos9fN7Mir3wpC2k9kz08UMpgL3mW7rtufoOvH2kr16pxm4AKlPBJOsHW7ulP2Ke43VI+5gankDJMUzgVg4lZtJucocS1AjTpBcnD9kvpuKwsIg0K42onv2yJ2xxXGtAFzFRgUDXXtKSQGSf11Tgf09JNmAULQG6nGJoq+bHrEw0BP0MvR5B7ymSCxmQbVZCuYmd+oB0TWOhZOlcIw73rI7g0Vgzr9p1nOlZvd+pp+EfCVVx9ji3Ds1Hsf5+qg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767998923; c=relaxed/relaxed;
	bh=U2dpLTO2TXbY91owej+oO41CSyVsP/IrqRXFPniHF30=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dPKJygV0V4hAo0Xm1b4u2f/QpdyRC+JqXRizw5rzk40XpdeRfKBq0n6TpEgXO+3M6JucNDOff5w+4fSor667fheb2PvDA2d8SvzxkYpDQNA/jGg8WAXPTIx1tHbIYSN5H33CjOdnQk3a2Y+Rs8C2b73/gXUEe61UAwtOTGjZ0w5IZcSoHSpO9hfvhT+gE0Lq3Z7cUCGeBtvzwDY1ww/A7sOez5LiiIFZ97SBD2OoapFH4gaAdZotQPkt3MnVCLlh78J8Il1+ySHGhEMRapZmi9ESrnmcbcirNq4/9hbZ2ZXJkuw/Iy4HVIAunuGsMKHFeOr8AE6htLux4ri+WJiccg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C3DMbxyN; dkim-atps=neutral; spf=pass (client-ip=40.107.209.30; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C3DMbxyN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.209.30; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnxlG1nL3z2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 09:48:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vl+WQaH6cqNPrqa0tsRz/oxf6mMteAl9sDj2oDL51q84xc9NmeqLONlfxi2/nalf6giigas+aCZJ2nvQC4jEpJ7d37usGqzaKhNzHA650yMayDhTCF6NAZsNDruCBPfklM8aIecN/Ya+8J/aExo0DIzsrGps3RDvZLt/I8/GGMYyrRKxGHHXZMD2NgsedVu5KQloHC8jdEdXp2nrIBEOsoIr2IYpRiUDd1pSpV6KkcwMx5n7jURElD4x39vqr2BjxMWxu7lUPBk+yw9CF/aOq7kqsY+sWj+Y1CXh3p3Qf6qGkmGwl5hXpp7c/F3jxc2reA1vD1/5yZQWxUGRzwbirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2dpLTO2TXbY91owej+oO41CSyVsP/IrqRXFPniHF30=;
 b=kQi5OdY04dNgpq2GCHnrVshC6KJbZT10Rbh2bf1qIjrjUk00Xp9drOUxca7sYC0Ga5zYnXeBVONvrLXdx+tePc3cr9bMXxrQ24HU3xNikNjlYk3dJlWiQMa565EbuiBhBWKHhs24gGwcCwwsw5aixWQC745uHK/NWGSzvZBQLOHseBK48/kUrUXW3Ut8AkL8LxAF/VqxPUt60TR2nU/LT7NEQ6cYGJn2bLMbbmedukIMkemh+1OGTMvYah4vOOJE5ShUUv+3etdgz14/te5G+/1lgKjxoDAr8bm9oDxjWrRREebSWIrvv+ZCWML6Pe0nhOqqZc2/EWimM9h465BTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2dpLTO2TXbY91owej+oO41CSyVsP/IrqRXFPniHF30=;
 b=C3DMbxyN1f44rfYXzJlzby3XaUjnn56sJ7H6v5pQauNjjwr0A7vpLyVWmY8s8/J3Miu+Qc3z6VBooNfWBWpunq4oSWsYjkZNQDJ+tnfTcoMBF4tVIuFoJEj1xr+jUNdyWmu4wHNy16DEFS5Tf+eZv4AdYStphsl6xj606XRjg5Q5jyJhLa1xsTkEN6qgE0dlg3puocd1k8EZQhJQrFcIlxXZsyms66d8acwJ2vJZfOmrUxmro8IvlVQWHnoS96/Qayd2QQwcqJ3xnZc+nSLH3xcm2GBLdp+WigEP68WuVvg9lUlDqT+XtRRZYcTEVa2bxBCqMRitk7VeQeYv4H8eWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB7627.namprd12.prod.outlook.com (2603:10b6:208:437::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 22:47:59 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9478.004; Fri, 9 Jan 2026
 22:47:58 +0000
Message-ID: <85cebb34-5034-4c2c-bd8b-d636224e39ee@nvidia.com>
Date: Sat, 10 Jan 2026 09:47:50 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] mm/migrate_device: Introduce
 migrate_pfn_from_page() helper
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-2-jniethe@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260107091823.68974-2-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0148.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::33) To PH8PR12MB7277.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 874b8789-9e68-4f5e-5bb0-08de4fd12303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2tyRURsd3F6UEJkZ21sVzZnZUxhZjk2ZnZyQ3NYNTArU1I5NlF4NXFzVXRn?=
 =?utf-8?B?REE4TkJsS3VTQW9yVlJwdEQrNXo5RVRwVW0rYVdJUlRJVW5RakdyRGJ5VVBE?=
 =?utf-8?B?d0xzbVdpc0gzdGZQS3AwSmV4MDBwNnBHcGZNVVVUWUFmdm5CL0VORDR2a3o4?=
 =?utf-8?B?UWx5QzJsSXF1dE9zbktWNlM2Vm5tWjRGdjlxSEhtbk9HUXpPdFNEN2RydENr?=
 =?utf-8?B?bnNuRndmTjNwWDhGcktzcHZQRFprTEJ4emJjb2M3L3BMSHpXVTR2YkFPcnZ0?=
 =?utf-8?B?WkhRZVBFeTlkK3o4c2phdEdhVWZucHM1UWJBSmNaWHY3WHU4NlVjQTVJQzRm?=
 =?utf-8?B?MVFBRnd0NTVIQkFYWTcvNXB5dStWbkY5ekRWd3I5YzFPcXVrSTB6YTN5RlVp?=
 =?utf-8?B?T3pOeXgzZ2Y0NWJPMjZmaCsyTzlVRlRjcm1YZzI4eU9XaVptVUdvNWlCcUlR?=
 =?utf-8?B?dmdyOUhBU1ZDUEw3eitmaENpN3lvWk5qVWhmRnh2TEUrZ2s1ekllK0ViSE0z?=
 =?utf-8?B?cVNGYUFrenZlQ29JMCtJMWVxMzEwN2o3ZERQRGRkZjN0V2ZaM1pXeW1udGxn?=
 =?utf-8?B?cTFhbVFHQWQyaktCWkhmMUZud2lHRTFVczFVSUJHMDVtT3FKZGdKYUxMVDdU?=
 =?utf-8?B?K0NraUs4SXd1UTE1a0VrVDlwUGpqS0VseHpYdkZKelZKNnh4MmRicC9pcE1Y?=
 =?utf-8?B?MzhjTUtRNm8vSDkwRjZEUml3MDFLNWdaLzN1dHVoaGQ1UXRjVXErVThUcUc5?=
 =?utf-8?B?OEFVNmQzTDRHMit3ZTh6V29XWHBWYkRHYTEwNkdqSVBSc2xsYmhMbGVuVUFi?=
 =?utf-8?B?OFM4b2RkeGFGeUhhcmtHbzh5bGE5RTM0TjhUTUJQdmpmU3l1TEpXcG5qb25V?=
 =?utf-8?B?eWZhYnh3eXFNRXI4MzJTb04zWHBQWCtvSTVHKzRhRktNR3VhVi8zTWZwVHZp?=
 =?utf-8?B?cDY5U0ptaS9Vcmw0eUhlelkxOHJDS21ZYXBhWVdrNmkvZW9tMFJYUXZMMFcz?=
 =?utf-8?B?WE92R1RlWWQ2VVRhd2pWRVBPTVRlK01lM1l0bXpXanMxV0pZVXUyejNUNUtz?=
 =?utf-8?B?OSt2cTk2R251eUhod3RHYWZCbnJxdk1adUh0Vk55Zmg2clhUZHdod3NxZXMw?=
 =?utf-8?B?M1lzOHVjdmMvSWxxdVhsR1dGS2NlZWRoOHpIL3djUy9mYmRpOXQ2RlhGS1RL?=
 =?utf-8?B?aFlkZ2U5bmpkMHdjSFJ5TVl0VHlOWjNuZ3d6Zkd3WnNIdk1Sa1JnSTdNcncz?=
 =?utf-8?B?L0s2emNYVGRHVThiL25NT1BuSXZlSGMvS3c5bWprY3poM2hJN252Tm9KeDRz?=
 =?utf-8?B?dWVtY1pUM3hFSFNGVVo2b2dwRE9rRm1sL2RUMzZkV1IxQzhXL0MyQ2ptc2Za?=
 =?utf-8?B?a3k4cUhlMjFmd3FZMnI5Z2diODlFZ2NWVmd5YW11Q1V3VUpFQ2ZKNDVvM2tE?=
 =?utf-8?B?U25LbklyazhMWXVrZGNrZFpZaVJZVWQycGRKK21DUzVqR3ZWdTBxRDBZZEhU?=
 =?utf-8?B?MlQ4T3M2YVFxUnphbGZIUTZua3NGVk1kL1pLTC9wRVZtQm1xR2dsWkhrZFhJ?=
 =?utf-8?B?NTV6QUxQZk16ZGkvVWdjYUFzSTgzcXJ6ZzNzN1BTQy9OeDAzTDlIMVVyMVJv?=
 =?utf-8?B?d2VKc0w2a1JsYitGZzRaNmNHRko1OWkvSEd3cy9FWTlZK1Avd0paMG81d20r?=
 =?utf-8?B?L0F3NzYxYlltRE5iVCtJREdDeUx6SHBacHFIQldyOXhPd1UwY0hOc2FyVU5k?=
 =?utf-8?B?K3BVYkpjempMSHowTjRvVVplVUFTZlJTczZMNEJ4VlQzYnluKzA3TFh1ekNF?=
 =?utf-8?B?RVJFWGVNWDNkK1JBMFg5cFphMnh6TC9OOU4wdjc5elUxR0FHUWtRaE9lZVNC?=
 =?utf-8?B?a0xzbENpN3pPWldFRnR0M1FNRDh4T1d2U2h0ekxBR1pBODBVMFduMDN0MXhr?=
 =?utf-8?Q?uCPZo2Haq21Qz30/9yyXqcEIMNL07Jo+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2FRa290dXlHaWtVVHFiQjI1cG0wd09XaGIxeE9ZbC93UlFRZ08zdUN0Mnk0?=
 =?utf-8?B?dVIwM2NHRzhJYXVwQm5SclM3Q2JFaG1sRWtNZWt6aXQ1T2xuNGNJU3kvVHJO?=
 =?utf-8?B?NGVKT2xlWTN1NEg5ckE1eU81eExtVWVFQUJFS05IQTlGRTVwRHQ2TytrR3ZN?=
 =?utf-8?B?bGNKZytZRWNWMVRMd2dQcjZHaWlGTVFkaXMxYXMvWGtEcDhrMmxHV2M3TGRZ?=
 =?utf-8?B?c200SU9uczlBTGU1a2JRMXNSRWNWQjZNVCtPTWkwengyRTl1S3h2OEU4SGo2?=
 =?utf-8?B?WFY2TFlmQnFtLzQ1SlFWRVl6UVRmOGo5ZldqTnUwKzVOQ2ZJMTFrT2tLUktI?=
 =?utf-8?B?SXlWNnhjSE93amRxckhGajluVFlpU3d6SG9XSS8ra014OHI1TDRLbnFJYWwr?=
 =?utf-8?B?UDE0L3RobFFjbTlZM2FNWlVaQXlyNDQ0MXZJN3pCeU5Ba2NxQjVYcWFZVDNP?=
 =?utf-8?B?U3JScEZ0V1BzTzdDSjByRXZuNyt6TEpXdmRXc2VHa3FaRkVDdDdTaU5ISkNr?=
 =?utf-8?B?T1lpNDVJc3ozd2hhWHBnc0gyWk5HaGNGVm93RHcwTkxzcVFOek1jRUl3ancx?=
 =?utf-8?B?N2p0WW1nSlBiSXlPdHZ3Mzc1Z0NCODMyVkY5UzhvZjMxcDBKNGw0V0RCTVF5?=
 =?utf-8?B?MHVJd0pSTUNUbFM2a2g5bk9ac0tGbXRMRUViN1k0bFV5QWh1UkF6ckZHY1dC?=
 =?utf-8?B?WXFTQUwzYkZGTlZNRVZQSGhwTDVxbVhCN2dNZXJhKzc0dFRwYU1qcEplYzYr?=
 =?utf-8?B?b1NVc0JrdmJwU05lTldRckVMQStyd1p6ZUdOWklSbU5jU2tmaVBseDBkMFo0?=
 =?utf-8?B?RmJZMndFdkdVR0VFUlk5QXBiV3VRNDlvODRYa2gyVkk1RWVNSzZtVGxmazR0?=
 =?utf-8?B?YndlLzFiKzNaRmRNSGhCc2xWa0RvZkYwS1h0Mmh3ZW82MlpxNGRHZmtmV3Zo?=
 =?utf-8?B?bDczSW81Q0NxWXc5ZzV1dkdJWGc5S1pvTG5EUXZyOTVTWnNEQ1JHVS8wNldq?=
 =?utf-8?B?c2dHOXRSaDQ4MTRrWFNhRENMcStacHFIb0w4Qm5vYU1RSGovcDREeUNCREtS?=
 =?utf-8?B?L016a1J4bGdiOEtJSjI0anB5RS8rWTNwOGx4cmR0UUVyVnJZUzVHK1BjS3p6?=
 =?utf-8?B?RUlzWHI0WDVvUXlBWDBIZ3FINHlVYTlrM0hwN1NPQjlMSSthb211TUZ2dXJj?=
 =?utf-8?B?Tk1ZblBzeDhBVk9RUk9hajZ2Z0tkR3BydXVDcUVhSnM3Uk0zMXUzUmZkU1dK?=
 =?utf-8?B?eEppM0ZBSGxxamYvNXBkRFJseU9zZlNlZkxCOWlqV01mVTdMVm96ci9WdUhP?=
 =?utf-8?B?Z0Y1NlQwckVQbVJ0VnVNTWJ0R2FzdjBCd0pRUWpUc0E2ZkdBbkYrVDdOa2dR?=
 =?utf-8?B?NVg5TDVHUnl1QldaUkI1eUlrTGtFZy9zdXdraUwxcFVvMUhzRWtiWlFvekdj?=
 =?utf-8?B?Z1FjL1VManllQ1NCRVc1aUUzZEZydUI1RXRvZUJ0ejdvMmpZdzNIVjBwanRY?=
 =?utf-8?B?Mzc0U1IzZjVyK252TmlVQ0k4OTc5U0N5aVhpdFhOT0VzbGU5ak5vY2ZRYUpo?=
 =?utf-8?B?ekxZOEZLdzdNS2c4cDV3aDhvWUxTc3hKK2U4bUdIeGZnd0c1M3FaUmhIWlNY?=
 =?utf-8?B?dERPSDJJdEJVUktDN2JhUzAvT0ZhbXhjKzhBMllENFpRT2JNbmVGaFZsQzRJ?=
 =?utf-8?B?Nm83cVFsRkI2MFJDNVI2Tm1iT3V5N2ZNMEtsdDR4aGw3QzBHSThEcTBLMmVG?=
 =?utf-8?B?UzY3Qm51V2FhVnZWbTB0cURmaU5iZWV6bVZoeDdmSUkxQzFtTmlLZFVpamFM?=
 =?utf-8?B?NXZ6azM0SUZQRTZPaUtCZXE0N01JN1o0Uk4xc3ZiWERaMmNVd2pDQ0NJNkdu?=
 =?utf-8?B?Qy9wdEw0TEswRkI0TEVqc1VGRFhmaFRwSStMZ00zV2dPZFdPNjVPSUJ4N20r?=
 =?utf-8?B?Nmwzd2pIaDFhM1pZQXhHU1dwT1I5TlQ3bW9MUnRlbEZWLzY2VjNScExnRkpP?=
 =?utf-8?B?dVNFUjBwN3hLV3BNczNFQnRRWm9QalFHb253VlVLSnlmRFBGOW4waGpUZE1V?=
 =?utf-8?B?SXVtQ0FlRjE4MGRXNDIveFh0Zlh5SnN3VGl1Rmw3bnY5K3V2K3d2SVV1TWtt?=
 =?utf-8?B?UHBrbzQrdzB4M0dnWERkQTY5eVVkNWVDeUwwcHVaT05KRjRLb29ZY2NRT1dt?=
 =?utf-8?B?R1FqWTE0bWUwZmlLNHhJMGNPMm5uT0d0K1pBTkI5MStFTXlDeUZuSWkvZWsr?=
 =?utf-8?B?bEh2ZjE3dFRxNFNWUElQTmhrTm54cTVGTllTWFp3QlNCaUJFTGo5TzZaU3BW?=
 =?utf-8?B?V2hVUE5HeDc1TDRHWEwwOEZHVGQ1d3FOSU1ydGg3UXVDNTZDK2VHV1o4VUJL?=
 =?utf-8?Q?1nWVoaD1FZ5TTrhJwyuZWfi3olI1ecXpo3okxNVAJ3/qm?=
X-MS-Exchange-AntiSpam-MessageData-1: bAMq6C7Lf8uKdw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874b8789-9e68-4f5e-5bb0-08de4fd12303
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 22:47:58.8815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhuYFlzz/vpAyuFphl8DAepADc3oua/HbUNWxfQStRGReQws5GmRvob4VleCg9IUdBMUwy24wGbT1rWZM6JYsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7627
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/7/26 19:18, Jordan Niethe wrote:
> To create a migrate from a given struct page, that page is first
> converted to its pfn, before passing the pfn to migrate_pfn().
> 
> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have a
> pfn and must be handled separately.
> 
> Prepare for this with a new helper:
> 
>     - migrate_pfn_from_page()
> 
> This helper takes a struct page as parameter instead of a pfn. This will
> allow more flexibility for handling the mpfn differently for device
> private pages.
> 
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> ---
> v2: New to series
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
>  drivers/gpu/drm/drm_pagemap.c            |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  4 ++--
>  include/linux/migrate.h                  |  5 +++++
>  lib/test_hmm.c                           | 11 ++++++-----
>  mm/migrate_device.c                      |  7 +++----
>  7 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index e5000bef90f2..67910900af7b 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>  		}
>  	}
>  
> -	*mig.dst = migrate_pfn(page_to_pfn(dpage));
> +	*mig.dst = migrate_pfn_from_page(dpage);
>  	migrate_vma_pages(&mig);
>  out_finalize:
>  	migrate_vma_finalize(&mig);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index af53e796ea1b..ca552c34ece2 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -646,7 +646,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>  		pr_debug_ratelimited("dma mapping dst to 0x%llx, pfn 0x%lx\n",
>  				     dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
>  
> -		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
> +		migrate->dst[i] = migrate_pfn_from_page(dpage);
>  		j++;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 37d7cfbbb3e8..5ddf395847ef 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -490,7 +490,7 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  			goto free_pages;
>  
>  		page = folio_page(folio, 0);
> -		mpfn[i] = migrate_pfn(page_to_pfn(page));
> +		mpfn[i] = migrate_pfn_from_page(page);
>  
>  next:
>  		if (page)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 58071652679d..a7edcdca9701 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -249,7 +249,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>  		goto done;
>  	}
>  
> -	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
> +	args.dst[0] = migrate_pfn_from_page(dpage);
>  	if (order)
>  		args.dst[0] |= MIGRATE_PFN_COMPOUND;
>  	dfolio = page_folio(dpage);
> @@ -766,7 +766,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>  		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
>  	if (src & MIGRATE_PFN_WRITE)
>  		*pfn |= NVIF_VMM_PFNMAP_V0_W;
> -	mpfn = migrate_pfn(page_to_pfn(dpage));
> +	mpfn = migrate_pfn_from_page(dpage);
>  	if (folio_order(page_folio(dpage)))
>  		mpfn |= MIGRATE_PFN_COMPOUND;
>  	return mpfn;
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 26ca00c325d9..d269ec1400be 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -140,6 +140,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
>  	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
>  }
>  
> +static inline unsigned long migrate_pfn_from_page(struct page *page)
> +{
> +	return migrate_pfn(page_to_pfn(page));
> +}
> +
>  enum migrate_vma_direction {
>  	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>  	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 8af169d3873a..7e5248404d00 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -727,7 +727,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>  				rpage = BACKING_PAGE(dpage);
>  				rpage->zone_device_data = dmirror;
>  
> -				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
> +				*dst = migrate_pfn_from_page(dpage) |
> +				       write;
>  				src_page = pfn_to_page(spfn + i);
>  
>  				if (spage)
> @@ -754,7 +755,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>  		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
>  			 page_to_pfn(spage), page_to_pfn(dpage));
>  
> -		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
> +		*dst = migrate_pfn_from_page(dpage) | write;
>  
>  		if (is_large) {
>  			int i;
> @@ -989,7 +990,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
>  
>  		if (dpage) {
>  			lock_page(dpage);
> -			*dst |= migrate_pfn(page_to_pfn(dpage));
> +			*dst |= migrate_pfn_from_page(dpage);
>  		}
>  
>  		for (i = 0; i < (1 << order); i++) {
> @@ -1000,7 +1001,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
>  			if (!dpage && order) {
>  				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
>  				lock_page(dpage);
> -				dst[i] = migrate_pfn(page_to_pfn(dpage));
> +				dst[i] = migrate_pfn_from_page(dpage);
>  				dst_page = pfn_to_page(page_to_pfn(dpage));
>  				dpage = NULL; /* For the next iteration */
>  			} else {
> @@ -1412,7 +1413,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
>  
>  		/* TODO Support splitting here */
>  		lock_page(dpage);
> -		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
> +		dst_pfns[i] = migrate_pfn_from_page(dpage);
>  		if (src_pfns[i] & MIGRATE_PFN_WRITE)
>  			dst_pfns[i] |= MIGRATE_PFN_WRITE;
>  		if (order)
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 23379663b1e1..1a2067f830da 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -207,9 +207,8 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>  			.vma = walk->vma,
>  		};
>  
> -		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
> -
> -		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
> +		migrate->src[migrate->npages] = migrate_pfn_from_page(folio_page(folio, 0))
> +						| write
>  						| MIGRATE_PFN_MIGRATE
>  						| MIGRATE_PFN_COMPOUND;
>  		migrate->dst[migrate->npages++] = 0;
> @@ -328,7 +327,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  				goto again;
>  			}
>  
> -			mpfn = migrate_pfn(page_to_pfn(page)) |
> +			mpfn = migrate_pfn_from_page(page) |
>  					MIGRATE_PFN_MIGRATE;
>  			if (softleaf_is_device_private_write(entry))
>  				mpfn |= MIGRATE_PFN_WRITE;

Makes sense

Reviewed-by: Balbir Singh <balbirs@nvidia.com>



