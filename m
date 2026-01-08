Return-Path: <linuxppc-dev+bounces-15397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D9FD00897
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 02:10:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmmzb1dRkz2yG3;
	Thu, 08 Jan 2026 12:10:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.208.44 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767834619;
	cv=pass; b=W12kXstS8vebx2u3L+7iJjDuEZx2qlz22rr7vNxPw2rSL/u4ci88BJhwJd2eWyW9GuCQfXR4jglQtF471EZPO3qjXuAwNURLQMoulPDNYGgh9NzVb0MOy0CcWHAwQ3fyE0z0BjxocAoftfpDwEHEe/1T2PRso7vUKR9349P5j+/SzJqjGQFR3uSxkfyzVThn+RoEsq5DPawbx2SmTerY7OeYt2xKoLJVsDOdj7TfQoch2OrtovXEclbvC1q0ksOZzerNL0Uy6jLtC+WlZ1tPBV1ShwqgwCSc3F9GfcIYdc9FUJh+OVh7R+luca50wxxkNwEmb6C673bympLQ7KM+uA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767834619; c=relaxed/relaxed;
	bh=b8LFewVV7i/oJbZRngWh9UGQVxNTXM0PSzau6ZN5HO8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wv6TrUmQiVI9ZFclgKH+CFmbqVoJvoQNODvADsa04pjmTIvcbYDnEIygvPpmHZ4ASieI6UEBPHfWw0GAuDCUxeWvVYf874/FtNpV1LlCWQnWJ8b8EH47N87VGwrn2+9JiCuQxCep+xmd992D/DGgEWDGl1Ax6y8cUUHeLUNNEGjt9BKIE+eHmI7fJbRzX5zdlNuyZ7Mj5JZN9FPNApL5yGvabjW3N6hJLKblxbyY75z3ao2qPtvufgwYK43pPq3bH5VeQKimTjJfyoz3SUuZg+A2cEcr7rKkIhi2OLJ2dNY+ZbFEk876o1KisyHfFwF0YhESCtTo08JlEVll2eenGA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ydec20e3; dkim-atps=neutral; spf=pass (client-ip=40.107.208.44; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ydec20e3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.208.44; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011044.outbound.protection.outlook.com [40.107.208.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmmzZ0JX4z2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 12:10:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmPli3QDt001WN6CjNEiFMwXlVvSEvYkrJQxrLqcCIMQvoCsCxEn1OkGJ+Jlj7hjWPaOQJku06W9LZt4UarpuVLILrkv2i6+6/l+j1Di5L1RyRDyHdCLQTqB2g8BNCuPDrGjqBppjn/kaUr+jeoVWDYfBRIgykIrw+vV+Oyr2jkp7EFJrMdClGmpiRQQGlpn4rn3EO1ewLYIod+MEjxSko7YorsKPlQpnAbb8sR6X2u2WcIo+Cuw6Dw+6mKw99zPqeXjz1mI+nqCOiiXg+TBMGKq3Gy5Y8bDYz51mvDvhZX/T+wad4zxkK8hc6snf5Jv4cOmAoOD0/VYqZb/7BOJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8LFewVV7i/oJbZRngWh9UGQVxNTXM0PSzau6ZN5HO8=;
 b=X5xsbWUersykDSMCE6Pscda7XnVAnnf8HIDUDUdJ3/5PPG91jKJuPC83oHmsR7KJbWn/+4oa/lNkfI5fYv4sHhAoR+VjLGFrRgl+0lNNsYUAddCipmZPi7oTvfZKdv1f/wm1FPbQRyZiNrSqzqQkWso7lZt8wzAuPyNy2kYfhzF8wyMYkNveR+Sd/tXjod2wqQkvccleTjOlHm1zL8gih+XoClm8lxc+ARYTz4JxvAYbw/bD1cnL1MuHHmWBgsTBvke4BQULA3wuRey9A6aAHEQOLXVck6hdnLkJK9nRbADA4x0e3x9WWB2piYQg2wXHFJQ/HEG+bTTWD5rE+0DeaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8LFewVV7i/oJbZRngWh9UGQVxNTXM0PSzau6ZN5HO8=;
 b=Ydec20e380xS9GCjDRbrRS4/ZXAJqeWLLy3ONrQtO3WuQBHHOZK4HtD3Ls2zcmjFNxj1XDIi1/A1rCZlwAG3HJXu79b4t6o4VRQhduW4/ekU9s6Y/1bE2h2YrxJa+GIaA+kA6BOIyzNetKDebjWdb3/PwshLHFC6QqTg32L7nyeoC1nJL2jjMHFXlOZ7QhDjkPJewSQn62SfkC5jT6bVZK6r9AzvfSgza7Z5xniWlJgA2mNE0fBp93eRKy6DiG4E4lH8diYLlAA0vAsYkS74g19821udP7nZNrTydanYG6PaVivoTDnqnmIawej6Bxoh8H7WJiNtStuBIhoznT6zWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8415.namprd12.prod.outlook.com (2603:10b6:8:fc::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Thu, 8 Jan 2026 01:09:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 01:09:37 +0000
Message-ID: <71fade9d-be8f-40d1-b580-4fac89a16cc7@nvidia.com>
Date: Wed, 7 Jan 2026 17:08:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
To: Andrew Morton <akpm@linux-foundation.org>,
 Jordan Niethe <jniethe@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107120608.5ccd2cc7e4227d2e80028bd9@linux-foundation.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260107120608.5ccd2cc7e4227d2e80028bd9@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0083.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
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
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af2ffcf-7733-4eb9-187b-08de4e529765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGxpandZbzJJalQyeGJmaGdIZlU0eU82cXNhazlCYkJuYnM0bjVRWlVSd1c5?=
 =?utf-8?B?UW9xRm9raEE0WUNvQlk0d252c3BDSWNMN1IxcEdBdWVtUmY5clVYRUw4YlZy?=
 =?utf-8?B?SkNheEd1cGZvRGV1aitXaCtpRFpBcldBT0hGLzBaTWRveGY2bXpjUS9vUTIv?=
 =?utf-8?B?ZTBkSm5JU2p2bG95b1dIeE1JRWQzVXRraW5MbEkrUmV3TmFHZjdHOHlZNjE3?=
 =?utf-8?B?YWIzS3JxcnVWZG1aRmRXYkhMWWFsMUVOL1A2azFnM281cVU0QS9UNzhLODVv?=
 =?utf-8?B?VVRBQWZpdkZIeTNrVFZCa0VyWUJldjhDQytvL2srNXFTWGdxb1k2bFNqODNH?=
 =?utf-8?B?TkVjdlo0UXFXUFRNNnA1Q21IVmtaaVk4ZS8rL3FKU0k0NDBSQ2dxUWFxTllQ?=
 =?utf-8?B?U1BDK2xaeUJyK2JHNC9XQjJhRWhJSnpzR1RrOUJYa1U3cWVJc0w3RVB6aGNr?=
 =?utf-8?B?eXFMVHRuS3JkOTlkVlJURE8wcG5oTmo4ODlYS0xIblVjZnZCczN0RzNKNnJ1?=
 =?utf-8?B?ZGJWclZTYUZIT0pPQW5UZW4wZTljN0hlVTUwd01naEJJUG1aS3RFbzF3V0R1?=
 =?utf-8?B?NEkzWk8vRVhpWUhxMVhrcmhrNE9pWm5wMWxoWUxsSC9MVVo4djRlK1dWTE9E?=
 =?utf-8?B?dmVzSGgwUStnakt1azRkRDVsRXZibzc1WlRiU0ZyYlhhdlgyY3FzQVIreXRK?=
 =?utf-8?B?M3l4S2Vla2x2NFVrU1p4M2xobHd3d25UME1uWjc3clBjRnczYmc4TWxFckQz?=
 =?utf-8?B?cnlDOW9hUUxyUEFEK3oyTUxSYTRmWDNhM0dNeTNZZFlzS1A3Mno2cHRqZHEy?=
 =?utf-8?B?c004RFI1Sk9tU2p5YWQ0UmNuZ2NWdklWRjhNalp4K0V5YTlFNVo2MmxDYVkw?=
 =?utf-8?B?R3hwNG9qamRzaXJBZjBnUDYwa0MxQ3RlK0NJS2dORW5FdDJvRjUyT2lGRXhm?=
 =?utf-8?B?RVpwM29aQUUycVdoZTJXdWZqRlc5UkE1anh5R09BRDNPN2l4UDVrVkhwb3dv?=
 =?utf-8?B?Z3hpK1NVNVdrck82RVpUZXBDSHhBQjlCQWVZVnhhemJ4RGRPd3RZdnl5Q2l1?=
 =?utf-8?B?QVAvTEo1aEFPWlZIaVY4cXVrT1VIdTdvUG9nb0lkWmVidDBtdmVJbUtUVUI0?=
 =?utf-8?B?RDErTWVON2VrSjZJN3NrWlhiOStPalQ4azAyd2RBa2VBdFVad2tpYTJ3bUlQ?=
 =?utf-8?B?d2p0Rm5WdS9OcUZNMU5vRWZITWxId00zM2NnNkIzQTY3dkcyZmUwNjQ3eTZD?=
 =?utf-8?B?Q3pLNEg1MFZuSklPcERmR3gxcElNcWtKbWROZnIyQ3RpNDZnR1JqL24wMzl4?=
 =?utf-8?B?MzFYVEVOZ0NGQmY1VStWUXV1V0JOOEh4OUdyNnM0Zk50T2Q2RGxiQmxEUjFw?=
 =?utf-8?B?VWl0eXI3eUpoVDh5OXlHbFc2TDdRRFNOS1NLeFhnRFBmZnFmUDhjR1VMYzRR?=
 =?utf-8?B?VGZEWGhnUENPUDNQbFAwb2NkWkg1blp3T1FORDJ6U0JlSkcrTWJ6YWdzYjls?=
 =?utf-8?B?NHBoaTFyL2s0K0g0ZWJJaGJQZVlJMk5qakNQOXhIbDZLRENRTk1JZmtncTdG?=
 =?utf-8?B?TFNwZktnUEh1SnJVUUFLZldDRS90QzFFYklEdmZ1cGk2eXZaTU5RTjZxWndH?=
 =?utf-8?B?QjREZFduNXpMTVBtSDhQb05uaFNhbER6UzNBQk1xZzA1YnBLam5IRk9rL3RV?=
 =?utf-8?B?ZlhsMmVjd2kwQkpMRzJXeER3b05wb1BOdWV3S1U3NFcwMjgvQ3oxYThiWUpw?=
 =?utf-8?B?U01ucFdFMC80TFYxWVlMazRnaVAweVloWHJ1R1lucEU5L3c2c050UFFpcWpw?=
 =?utf-8?B?VlBtcFJ5ZHh6ckpycGJ2ZUVlUUtJNVpFMytDRTAvRUp6dml0R1YyakJMNTN3?=
 =?utf-8?B?QkFkMGwrcFhUSUdQcEZGdXMwT2JldDJCeGQ3ZEh2Sjd6SHBuUHhCalRSUzVk?=
 =?utf-8?Q?5AeP4eBmvRhbSKQLfDb+yOJGXGDxzqmD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWxEbDl1SCt3eXRSUkZ1cTJXNW9NaXZ3VGJxZ29scTBNZkY4bWFxZThseWhL?=
 =?utf-8?B?cW9VcGZZSlRndDRlcnNJcmdKL0FQOHlTbnBIRjMvdFpYenduOHhDbEl5eVNo?=
 =?utf-8?B?SkRzeE9LRzRuU3pCZWpLbDJkeUM0WWlKd1ZXbytmU2k5Nm5QRzl2WXprZnpy?=
 =?utf-8?B?NGJPZjFiWHRQS2ZvSWFaNndlSG9hZXRkWlhzWXhzRFc4SmFsS0pvVEs4V0lL?=
 =?utf-8?B?am42b3JvRDIwaGVZSlNHMXlqOWhMZkFRZVN5OVpWUWhZckJCbStmUWJUNnkx?=
 =?utf-8?B?dDk1ekh6YWw1Q2xWWUZuV1dscU9iM0FGVmQ3KzBZbzAyN3NwVEs3aHh2Zjk4?=
 =?utf-8?B?Wi9GQUdlT1BEWUhtaEZROFlLbEJ0dFJFcmhrNEdjajlabjdRU1puOVorOS80?=
 =?utf-8?B?SG1mMDh0Nm1idkVTRFVYTndTZjd5cWpub01aMUJBNTV2MHdhU1NyNSsxdXRW?=
 =?utf-8?B?dmR4VXROUzhHTmtReTk0SDNKZDU0aGt3djBSbDNzUlpESzY0UE1sUWtWbDhz?=
 =?utf-8?B?QmZmb3BFUkE4cE1MejlxNFR0ejIxS3RwTVVDWk9BRWdZOFBpc3hSd0xlMWN2?=
 =?utf-8?B?VEwyeE9PTlpHdVN0bVFxQVBHbU1EKytTN3A1bk1Kb2xDZWNXTmVNcHlTV3pV?=
 =?utf-8?B?dnEvNGNMNU5nTjJMVy9ibGRrb3JqRWVSTHQ1REJHQlNPMzFlMGVhblE0Ky9N?=
 =?utf-8?B?MHFzRzFBM2EvZFgzbjBEdytUbDRIZnRKR0F0WVgreHJNeXoxRDFTM3I0LzNq?=
 =?utf-8?B?NDJJK29uMkZzeEZvbnY5RGZFa3l3aHluS25BSk5EM3VhejVYbGorK3dIY3BY?=
 =?utf-8?B?VTRlYTlzWVlxbXF2VE1zWW5LZmdLZUpBSU1wSWhDT1RBY1FuMzdzb0tlcmNB?=
 =?utf-8?B?czBOQlRtQWIrdnkyUTlkZmhYYU44dEtkM2RqRUtQY1J3YWo3b2ROUHFiQ1Zu?=
 =?utf-8?B?ZitUejA5dFBOYmVqenlNMWJXSlZvZG9lVkRsQnJRYlo0V1d5T2dHcUJQZXBB?=
 =?utf-8?B?RGVma2NVMWxZVTVpQmpYQms2UjBSaC9EbGtKdkE2aFdIUjRMdFBRVXZUSVMx?=
 =?utf-8?B?NzJQTnR6a2J1VStOcDZrOGc0TlpQb2tRTVdHYnlXcCs5cldUTEduSXdmWmRi?=
 =?utf-8?B?bE84S0UzalZsVTBFdXdpTjlIUFAyellWYVBvaE1EY0dUK21BMGZaRlE4NjV0?=
 =?utf-8?B?Zi91Vk05eHMxZmRyeElBKzNHcXpoTHJ5RmxqaHpEdUVXcGtrSlVxa3VwUkdZ?=
 =?utf-8?B?QmIxcWVnbWVveHdpQTFsUnFjTHhrZERpMTh0dTRTODBMRFhLRGk3UHM2OUov?=
 =?utf-8?B?ZFFycGxjbjdDVDRnbTJSQnlxcVlZMVliL1gyN0YvM2I5MThNR01vQ3lOdmtL?=
 =?utf-8?B?K2J5eHVyY3RCUnlyMnVDK2lzMGEwT2xxbDBUR21CT2hsdmFnV3paQmQrMVdi?=
 =?utf-8?B?Ym9oV3EvL0FGOVkzSW1RLzUvaVlPdlRGOGo5cUsrcFdHdUQ4TXAwbzlHWi9F?=
 =?utf-8?B?WG13VUtNdTU3RElUZ0R3enZSUGZtZ1lZOHNzS2lNUkxWWlhNcnl2K2ZMdVNH?=
 =?utf-8?B?bDhVZzJoSjcyVUMzRU1GcmVqNWphaytsMDZ5U0swUUhTeG83S2I0cUlqZVRU?=
 =?utf-8?B?NGdvUHNUUUN6eVhrb0ViN1lYWFczUGltM0tUMkg0SDFyTU5IL3EzN1luR25P?=
 =?utf-8?B?NGo2Qi9mZE80L3prQ200cXI5SFJqeklIZnJodnNlcjY1NWFXTzk5NEdxM0Y1?=
 =?utf-8?B?S1dtV1VkZjJNbHM2WTF1ZmloNHlWTGp1RzF0RVlETHk3bzQvdzFQQ0EzbE5U?=
 =?utf-8?B?SGRoVENiU2w0emNYS0ZseHcwQXd4NE9CYzRpOFp5Q2UvWkhsTlhsWVdMeHNM?=
 =?utf-8?B?L3FpYjJOMkc2dFVRb0l6V1RxMVZpeXlpSXUyNU1NWnhiYzdYQ01KK2MzWXdu?=
 =?utf-8?B?MngrUDcwLzlTZDdWemh5RGcyRmhjTzg2dHMvMjZ5QlNiR0IxMVpYcVN5Y3Vn?=
 =?utf-8?B?WHI0aFl5bzF6TWY4RDlNYXh5N1FudjJ0MDhqd0Y0ZS9lQlNrMUVjNit4VVVn?=
 =?utf-8?B?RkVNbW9WM0dnVFdmME0yNTRRaEtIbzdwZjZmSEpOU01uam9PL1VBNWJubkxM?=
 =?utf-8?B?SXV1bUw4U3BjazFjbGVSUGY0UFgxSzNEYjd0bW9PSWNZQU02ZTJuemRuN09U?=
 =?utf-8?B?bVVBc2JFNXZRZjQ4UDhCNEVUcnU1ekdPUTFaSzNzNDM0VnBKSno4aWl4eTFU?=
 =?utf-8?B?VGpieVY3anZwZHQybDI1dS9INi9mSkFKSDVkT0JRcVM2eU93djBEaFFMWlRo?=
 =?utf-8?B?WUFBcld4cUxzUVc4UUJZQXE1VmR4VWEveWI3WE5WQThUZXdKV1hTZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af2ffcf-7733-4eb9-187b-08de4e529765
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 01:09:36.9401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPVx1xPpapOFZ8uq7ObXfyQuX53J6hPSlSjb09aTH9bP8wzZNy6cKdhtzK6zrywmkd94hJ+ytLl6JdR+y2WVbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8415
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/7/26 12:06 PM, Andrew Morton wrote:
> On Wed,  7 Jan 2026 20:18:12 +1100 Jordan Niethe <jniethe@nvidia.com> wrote:
...
> Can you better help us understand the seriousness of these problems? 
> How much are our users really hurting from this?
> 

A lot! We have been involved in escalations from various customers
who have attempted to enable, say, KASLR and HMM at the same time.
And they ran out of phys address space, forcing them into an awkward
ugly choice of one or the other, often.

This is a huge pain point and a barrier to HMM adoption.

thanks,
-- 
John Hubbard


