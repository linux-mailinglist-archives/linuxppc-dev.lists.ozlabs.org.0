Return-Path: <linuxppc-dev+bounces-15404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCDDD01280
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 06:43:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmv2j2MVGz2yG7;
	Thu, 08 Jan 2026 16:43:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.201.33 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767851005;
	cv=pass; b=eVZM4JjVg3VvtEb7/AXrjT+c14lqxdNOuP8n0xF2VDc8kJuxsjgZYLo2B95ootr/aJL+xFvSp29/A1CLkdvgf1c8mDWO3dqayGfTAdn56rfLu9X5XkroBe/T17dq2AyE/oqF4/qqf2YKf2pOlpYw6RUVte8GBanyH+JDQhYTaAmpWQM98rYCTnwupQV5RG+toc784xDuxBoH5wXNqSsKX2xSRCJr3LsIw8EtxFvSlaTgiv39uKu+G/dRx+Sbl/Iuve9e9IWiOh3fK0N0Kh/Mn0XB59DMMy8CT/VD1WduPparHTCBAo6MsbrBx0/+xXsLKZKsB0BHscYZe8fiaDVeJg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767851005; c=relaxed/relaxed;
	bh=5BgXaQRTbT37sFJpp3EcZGbqn6/da8xI2e9yh9zk4a8=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I1QMMpbVZeNeVBMmigQJ3e4ThYowF8wsm4SfsgTvq7jVl9jxjB0ojhF7xK/bQpPzlbevkrq4g3J80E6HZL3qclimqwGE+vosiJKJywUiYDIiaM7XU37dJBwm7TtKe74P5FYdpsClUjAPYDtaetVI0xuvUQX+XsD3Ux/RoC3Q1xd2ucZSGsQW0YY8qZzFPhA2xPCi8AGiOutJz+VPBKUvMmBG+/C7t/va9eP7N7Q7ImpzQmqRdopzI8oe+Bx7YILRUz0hTG3vf63pyRInTgiU2lpvBCuofg7jiJDdN6FysXV14SRlsSxoo8nW2U+qwUSPoSBG8DsQVO01vYSMkv+TeA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G0kB/LYJ; dkim-atps=neutral; spf=pass (client-ip=40.107.201.33; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G0kB/LYJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.201.33; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013033.outbound.protection.outlook.com [40.107.201.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmv2g35qRz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 16:43:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsySl3XPYtgReEIVOvN0U71RBgo6I1YdKaAAGsB2zZqtTllceuF2O3+Icremxzf7Bn62Hz3J1ePUhtb0V70U3prL8v3TrTn9Ey52jbLaeeCd6QSWViobkiA7L0myn+iduUnzWjd1Po1jU9/bjKsGZcDsrMkHJK0YSa/iRAPGLKJyNOL11243SEfc7sx+yObirO7nNjrT4JrmA0LyT+ekc790Y0f/SwGEYZ18bm+N5iSz7ExuIuiYLkq3aKYn5aw5L7Rg5kAVmt2HwaqhMLdznOICHtizAP5eLNnAb4HvkiFv++kcayHdQbKKTazemYU6LpvEcXhP732t7HqX4bd4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BgXaQRTbT37sFJpp3EcZGbqn6/da8xI2e9yh9zk4a8=;
 b=qE21IRUyagmOe5MREPRZYFqJh1b4FFAmYFKCVK9s2yl8OKO4ihQZ54YwEL/tQEpR2T8dfXs5i+mTGPI5yir9LH90lQKchXVrYbHKFumuUP1FXbn4KaBX3m4h/rX3G0ihcaZSMOy3oXZSF9IG2zQAGs+EJ/KY4kiy43SvqaYi2UAxEdXK47YUKnu39psFHdeCXxaTXfmALOy7r+a4q5+QymcpGNA6qDvUPuPMvQtyNofSRRFzMHzgic6sVwS0weHFPbZecPezUu++UiQHEJKNSFhYIEH0wCKsAFGkJ3/1pNVgUnWkBVh/ne2TwyQa3EN2stIg2cO4WZNTjV0Dhk5X8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BgXaQRTbT37sFJpp3EcZGbqn6/da8xI2e9yh9zk4a8=;
 b=G0kB/LYJkWmXMB9+etHoA0OfTeiPmt5UOeIfDZaEEIMqdiP7XTDwnmsJHht/NPgMDAeTlQzcG6eNUDj41FlyhksWHvi6ACrDhPA87Ay8AyiUh5bwwA62+Nwcxip87ey/bATyPEZp/DkOKFJt+uDTPBZgQFsu4jKsLJIvFr8Tn2Ug3xhobvaYH93qT5kQg81H2f8BL4lVitsRlDAVSAEY/NkUCLlq/oEAsVg1zXS2NN+2Y14vZOb4PDLkU9tvcuxh7hF5dl2nfVXZ8+hypKJLhz2e7p8ZuF7t+T8SjtOxCLOJ8U1NbrqOiO75RT+/Y3wW/I32qUIQEidPIuRgMmg3hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:42:42 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 05:42:42 +0000
Message-ID: <6a911224-05e5-45ee-8008-e36ef35cbc7b@nvidia.com>
Date: Thu, 8 Jan 2026 16:42:34 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
From: Jordan Niethe <jniethe@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <aV6nvCw2ugAbSpFL@lstrano-desk.jf.intel.com>
 <3586d8f1-a25f-4087-a987-162ccd97c25f@nvidia.com>
Content-Language: en-US
In-Reply-To: <3586d8f1-a25f-4087-a987-162ccd97c25f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:a03:255::14) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: b581cb11-ef3c-4479-dbd5-08de4e78bdc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWtiVWxDa0ZhejRVck1vRVRIblJ1OHpKNHpWYmZTdlZ6SVZsbmQxK3QwUmc1?=
 =?utf-8?B?Y3FKMlc5ZHQwbmh2ZlE4bDRSRy9nM0VPdzJVVGk0VWozWEFVTHRhTjdTaTBD?=
 =?utf-8?B?bzlLUUR4OWY2aVVxV1lxLzN3L1pQekI4anA1Sy84ckp5TGo1V0dRTzBHRVU3?=
 =?utf-8?B?WmVHMnUzQWFsdEV4UHM4ZTdJTmE4NWxJNlExc0VxdE96elh3VHdPdEtKK2pw?=
 =?utf-8?B?dlhKT0duMHQ0V3NrdUs3Ym90M3F5REZWS3orN2s4YVdHQ0l4RmVlVDJCSHhJ?=
 =?utf-8?B?a0dlWVdIWThsT0ludzJZOWRiMSt0MG9pVkVyUWdRZ1phVTNhUnEzVy9PaG16?=
 =?utf-8?B?WjdXZ0pCRnlaV2JYQ0hRMWlqZGZ3cXJiNmhTcDBoS1QyYjVRbExsWEltNSt2?=
 =?utf-8?B?VjF4REhvYXY0ME9YcFN0OWRKTTUrcjlocFJJS3k4MmFITnFiVTJOMThtY3Q0?=
 =?utf-8?B?V0ZUTHNISmVNNkZoRmo1OGZKanQrU2NRQThWV3owekt3WDZUMEZZMHZYQzdB?=
 =?utf-8?B?SzIvU3l6Q1lGOVp4azNPaythNTNpak9veVFvSlphQ3FCUG52Q3pYS3B5MHVN?=
 =?utf-8?B?QSthUlpVQVVsdWVYNFZHMnVkOFlPMjlBVmtuUmd1dFJUaEtMbEtmTFBtL0w1?=
 =?utf-8?B?OGViK25VZEszcDFZSXpWTmZ2d2FsbXQzUGZ6Y0FOcWt3MTUvbSt4RlNiNC9J?=
 =?utf-8?B?cGRyQ0FoV3UybmpXN1YydVREOEVkdEx3ZXpSazdUd1FMNG54TG1KUE1MT0NI?=
 =?utf-8?B?SlJRRFNFcyt0WnY5WjlkZDN5QTF5ejJoYzNEYWMvdncyODRTTlBrWm11TmRv?=
 =?utf-8?B?d0lTYkE2aTNJRHR5QlhtOEZOWWlCcDdlc215WHgvN1g0bm1WWS9IVTNKeW10?=
 =?utf-8?B?Tmc3TGxGbTl1aHV2YXRiaEJqZlI0WkpUZlY4MkFsLzBRNnNNNWtyRE52ZlJa?=
 =?utf-8?B?dnpmNjl3eUFrelJUdUp5bVV0S0ZDb0RPeEV3SU82b1FzbEVPM1FDc1lmTklN?=
 =?utf-8?B?N3p6MU1NZWpieTYwcThrTzdtNmwxV0UrZUhhNnFWZzhodkNrd1A2ekJ0SzFl?=
 =?utf-8?B?TXNvLzFzaWdQaDVTKzdxTWQxR0g0L042Ri96ajZWTGxGUTZ1R0xRbjlyemEz?=
 =?utf-8?B?cUszdXM5SWFNdWJCQVF2d0E2QnlwMjg2cW1YUnlUMUt4Qnc3Y09sSVdUaDd5?=
 =?utf-8?B?RG9udG9XNkN6UWNvYXVpWmkxS1UyWTBOVFg4QTJrL01XbE1qeDNNNkIvam5m?=
 =?utf-8?B?bDlIR1FsbXFSRzFFVmFzMjdsazB0eng1M3BOWklNUXV0S0RldzRoQlJsaDhn?=
 =?utf-8?B?Z0pvdVNQY1N1ZWNhNEtOV2R2MkpvWk1WeU9VOUhIbks3SmlvcElVYVpIMkkv?=
 =?utf-8?B?T1lSY2ZzVmpCZHBDZFdTK1MxSEE2K1k4eWQrSUdJTnR1UEpod2g1Q2pHbEdV?=
 =?utf-8?B?c3cwK0tnUFVpS29RQm5aVHhBTW42bkVSVjNvTG03aXRqNExTTnVocS9QNDYr?=
 =?utf-8?B?cXVvT0M2ZVh3UzUwVlNMcDZOeGdQTzlkQ2MwMDBucDRGQm1oTU92NDR1WFNI?=
 =?utf-8?B?VmNRU2d4aTZmejlIMmd0YXdmbURtSmU3NXdJdnVxOXFKSWc0TlJic0FqZ0Ux?=
 =?utf-8?B?M2VSSXBqdE40STR6RjdxaEpMa3lYaDk5bHdyOFZjK2JuZERWb3QvTGxoWXBo?=
 =?utf-8?B?T0ZnVmxmT3A0OHpvaUljeXRGRXhISlVwK3I2ellNREhMWWt5eUJaVE9VSDZN?=
 =?utf-8?B?dy82ZFF3dHk4eVljRjJYbTVubFplWEo3WmpUNzNqQmtNa3VSNzZua09TN24x?=
 =?utf-8?B?elZCMG02cjVUcnR6ZEhwcE9wcTNVQkhiK3JNTGxrUXhsMzZscVRiQXUzcWls?=
 =?utf-8?B?TG1Fdmk3d1VaUXljVmhLVzZZZ2RWdkVBVWx3SUxuMXZZNkJGRlkvL3ZrWVpX?=
 =?utf-8?Q?GzJWLQfxLyh6hc4DvS9WKJeZZCocSoc1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3ZJMFIwNEcwZktjSVBpNms4ZzVSdFBoaVduSitTZE1IajNNN3BmNjZrS3Jw?=
 =?utf-8?B?bUNBL0tjWTB5TCtsSmZ2RTdOMjVMcnllOCtkZk5BQWlRRkdmdCtKSStEQXdp?=
 =?utf-8?B?UG1FbU9rL1UycUw5OGJlY1k3SzVVSFVUTk1oc2VvWDNsQ0lLS013MlVxRkRS?=
 =?utf-8?B?TmsySFpzNzcrZVR6U1M3Z0p1REVmUC9LeU1nT3lsa0F4aDJCNytmWFlwQVdj?=
 =?utf-8?B?VDJKckRjWWk1eEpTTFZlZSsycUV0bWx5N3QxdkVpZEhBZ3Bqczd5Q1EwRnJB?=
 =?utf-8?B?YTVhS2ZpV3NLcHFTSHVqRWpWN3hSMGx3dWo0QmR3czBid3VPU0d2RmZtVEEr?=
 =?utf-8?B?TFhSRjkzb3FrR2diV1FaKzZmZFg4ZnhnbGxjVk5ER2VVaUt1aitBN1FLODV3?=
 =?utf-8?B?UC9Oc0g2M3p3TWlpcWpmYm1SdC9Tc3hueFE3dTB0ZUJ5eThMUkxrMjJlbWVT?=
 =?utf-8?B?MHM5SDU5bFFVaEswWEZoU2ltc3lPbDBzM0U2ZGRpNmd0T0o3dFdxUlRuMWk2?=
 =?utf-8?B?VFFuN3lZeU5jby9pTnp2ZUU0bXBVUTVyaHh4TXd3RjdaVzd4Q3lpUUUvcyt3?=
 =?utf-8?B?OVEwVGg0T3BwdDNMWFdIRGFsamNCc1Q4RVlFTFZVZ0ZETjdOb2tyYjJRMHh1?=
 =?utf-8?B?RVpoMUhvMWhjNnJraUlQdVd5aHZUakk2RjJHMlVOcXk5TWpRTzgxdXNIdlRN?=
 =?utf-8?B?ZXNyd0xBTVVtNUhDNFpDNmRLUjFkdjFSUldHWGJqQmRNSDlaT3NkOEwxK0lU?=
 =?utf-8?B?TjVBeCtmeUlXS2x4WGZYOWlSeHpkZGZOeXlTT1VxbjZwOUMrNHo4ckI5QXhh?=
 =?utf-8?B?WnhMTUIxUkErU1UrcUhvWUJua3NGZzNIYjM1VTBKa0tISzNmd2VmSk8rTmdu?=
 =?utf-8?B?NmVsdC9LUUE4MlE3YkFEV1dTRlVkeFRoMUNvemFBV1EzKzJhR01waXVSeERh?=
 =?utf-8?B?WEhCNERueWFZZnd1MFJhaFo3QTZxb2NoS3ZVaitPb2ZyRzZ6VE9tZFR0b0xG?=
 =?utf-8?B?V2J0bkllNVUrcWNFZ2sxK0YvQVlocHk3YzdyK1RiK0JEaEFiRmpnLzdCSWx6?=
 =?utf-8?B?RXk1bUdyK0MzNnRCYVpZWVZCdWsvVVZQN21vWUMvQm1mL0ZTZGlIL3g3MVY5?=
 =?utf-8?B?MkRRRkl4WHR5VVd5ZVhOM3pzdkJ5V3lJMDlOZTkrbnk5VnpIK1ZDelZDOE5k?=
 =?utf-8?B?a3kxYTZoZkdrYlU2VVJlRjBXYU9LbDZ2SjdOUnE5Q3l6UWpFMWtWWTBibXBH?=
 =?utf-8?B?enVCbWxNS3U1WXZzanIvV2lQQW9IWmsrdzMzeW1RZzVQMlFETjRPUDFUNGc5?=
 =?utf-8?B?VzdtYmloREdGWnRxVUtBVlNsZm84NWk1cm1rK0IyWnF0NGlJeHJwWW15ei9U?=
 =?utf-8?B?YWZlakxINnZJSGhCTklxajkwbGZqenV4QnM2WUlTcGlRUEpRQmI3M1dlSzNP?=
 =?utf-8?B?VGxQcWlGN1h3Sko3cmEvMlh4Z0hXUk1MVXEvT3dLaHVCalNtU3BvVFUzaS9O?=
 =?utf-8?B?cUJPSkwwdGZ4VlQwcVpua2pMV3ArVVcrc3BuSFQ1TTJkYlhBdmhpQ0FZOU5U?=
 =?utf-8?B?bG1VUmlBdVptOTJTSTM3YlMwOHNvVTdtRkkzbk9KcDNDQ1JSUWswbkVodERC?=
 =?utf-8?B?ODZvMk1xQW15cGp1c3VyalUwY2x2a0VQK2xtVHVkdmxXanJBN3k3cHJBMDFj?=
 =?utf-8?B?Zi9iQldXN0tTcHZHaHdERS9iOFpEaWlXY01FYmJQZFFaV2RLV0tQZHhhaDNv?=
 =?utf-8?B?TVRPN2dKTnFxbVN0ZlRiR0RPU21HSXQ3R1dzbmhTVlIvUWtjbEJ5L3VnV1Fh?=
 =?utf-8?B?blkzUy9uOWZoU2V6NWVqNlhRZ28xTjE3T0lRQXFhL2cwRjRCa244b0ZuTk94?=
 =?utf-8?B?L09GbG4xaExWR0lYdm9EdTYyNlhaWlBQUTJ4NkVBL0tnZGlvOVhRVDZQUCt0?=
 =?utf-8?B?U04rUUxEMC9KWHA5NnB0dmdZQW9tQ2g0RUtIWTRaUmkzaDJBYVdlL0hDQUpC?=
 =?utf-8?B?TlpyK0RrV1hIUjYyNGNtTnhnak0wc3IrWjhienhZbkduYzNnbzd1ZGNiaFl4?=
 =?utf-8?B?b0crczFwMjJST2c4c2NPUTZIb0JBZjRuRVAraSsvZHZMQ1JPNkhPeW1qUE5U?=
 =?utf-8?B?MFFKMHNBbFdJdlF0YnVjUStOTGZVT0d3WGRUUXgxOGp2WVhkWXdBYnU5RG15?=
 =?utf-8?B?akpzbFF6bitLUjRDVm5YM1FuV3Q3N1QxdXdjc2ovWVk1bGkxWTVaM29XYmM1?=
 =?utf-8?B?andQRVd3cG1FYnlPSVNNUVl1dzhFcW1Vb2twMjlOTGJkeTRRTzYxeGk4aUZz?=
 =?utf-8?B?TlgzYXQydGduNWJheERRUncxc3NCeUEwendOLy9IVEc5NU1HUVZSUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b581cb11-ef3c-4479-dbd5-08de4e78bdc5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:42:42.1398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYllF8CceyBlePFml2JOti3s4uZQ7B6xL8NZmzPuc3KAy7hZe5U+8idyQvfR2OwFHJPlvB6VK9HrRcFZGryzAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 8/1/26 13:25, Jordan Niethe wrote:
> Hi,
> 
> On 8/1/26 05:36, Matthew Brost wrote:
>>
>> Thanks for the series. For some reason Intel's CI couldn't apply this
>> series to drm-tip to get results [1]. I'll manually apply this and run 
>> all
>> our SVM tests and get back you on results + review the changes here. For
>> future reference if you want to use our CI system, the series must apply
>> to drm-tip, feel free to rebase this series and just send to intel-xe
>> list if you want CI 
> 
> Thanks, I'll rebase on drm-tip and send to the intel-xe list.

For reference the rebase on drm-tip on the intel-xe list:

https://patchwork.freedesktop.org/series/159738/

Will watch the CI results.

Thanks,
Jordan.

> 
> Jordan.
> 
>>
>> I was also wondering if Nvidia could help review one our core MM patches
>> [2] which is gating enabling 2M device pages too?
>>
>> Matt
>>
>> [1] https://patchwork.freedesktop.org/series/159738/
>> [2] https://patchwork.freedesktop.org/patch/694775/?series=159119&rev=1
> 
> 


