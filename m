Return-Path: <linuxppc-dev+bounces-1798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB41992FB1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 16:44:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMhkF6WGyz2yK9;
	Tue,  8 Oct 2024 01:44:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::616" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728310175;
	cv=pass; b=e/jBJHKuph76TxYkJ8/we6MZq8R7EtmYPk0oe993EWMZGECfL8UpVVHGdviNF2lWyq6JB7zzQXrVzpuBnWhsmPLS6oYBvMnSTjdb1ADinrY/uy8JNBUoDzYQrMWDSd52RXXX1uhADhgT9IC/FmF5GOrE11Z6wxVFs/Rme0Enh72f89Zn/JmAfR7Ct/jYtPAVl5/yJte7iCJzA18AP7t6TPVQY7lLdOXmbvL/w3m1E6fKX0rypBsEncrZQxImM27ggM7xJ02FN9jOuJ0UKRl/arz/7NEbV+TrKpPPUk4KAamWURWT0rGsENNcnF1jijXubo4fvtAIYjnBVo3phXwIdA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728310175; c=relaxed/relaxed;
	bh=AaCIde7XJqgRpNKQ8GJrhQ+jFXm866WM6dZr86z9rKQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FJShO6gsPPNXiV0jj57s0syXKXiujw3/EBs22ul55QumgR+8I39SQbaZ04UUPQOwZWjnK59Ift5PJOe13OZhQ3Ar4FcVkoPNFvfx3vGfUBkb9inE5wxb+VJq/TRynqj9qq74CsCf3ZpcxGp6x5wI+ZUcrC9uERfQWMWeKYvcThC9glsEVCM2H+WszeIIN/kCH++QLbxpyd9JtqdOaQBcDgr28VJCMKHXw+qicDySDJPX7OBi/02xyZUb63e8nO3sgfRwtzYSG3DLZRznGeXYAGJr+FBvBIP9A7l86lanL8lXE/EucCy2jCzBtQhjlg8P+93zDmEIJVmYRQN55AQtAQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ABa/GTh4; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::616; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=christian.koenig@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ABa/GTh4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:200a::616; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=christian.koenig@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20616.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMgy559WHz2yMv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 01:09:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYbeHuVsUDWBbPqFcoOdFFi36jSdD+adZF0Is8fqM+SDXUoIaZe+YqUaxf/hTLWkLhZVhKR5zM6O4i2M3Q76omUlbNxam9ZnDuQ8FIcSTbwkHOhpGGI1TmH1Nf/biQBM29I3A9dLcCBB4ejTkSXyWmOiw+B3pg0e8L3FwLQbukUUJMkc8qv7rzJ89GN4VV/Wwlm6yMLWN9tFyyQrqlnZwg1Radp2oGAs3Z1zutOxTyoByyoJtbj5SOSq/2JZaa2qimiJfb/64BEkqmIr0ip4oK78TVtSHVPfy3VdA3zexO34onzgdNKO2BTsMX3OX/GPtgn9siffRHYiv9JkmUBMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaCIde7XJqgRpNKQ8GJrhQ+jFXm866WM6dZr86z9rKQ=;
 b=DufIwdkBoIh941CT9hlcnr9fxxDWJVMucw0DwNiyWPKf7kS+aWxMc5d0U5hR76Dm48ugacg90fSuRhZlYEhECn9tRJ7+SxtZ5whf0fFk6+rv1+cKVK5X4OUiPm7ON3cR+IXK8+YpY6TMXHUhoWuO81gxMYk7tWfGWsVhjs3ISXsqmA8PeGw9DQHzd+iyVMKp0NOV/lSCNFlLQBEqQR8Ul7CLV0yPF/pecIfCQI8InqBjfOEP48KTJfJhkEP1YzO9jTIgUcrJ54w9KwgmAJSTIJIpce89So9YKc+9pdswTky5yLoB5oDZuNbG2n97EITaaXKj3jNmkjPPRUqXIDbLkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaCIde7XJqgRpNKQ8GJrhQ+jFXm866WM6dZr86z9rKQ=;
 b=ABa/GTh4dTzFCzF+OqxFKjcWl9gXGs/E177w1lU9o8CchEf4UFN0JQn2wfOACgeGs6tm6luHYzauSdimFec5VUdPY2zi7Vz0PIHwAOHWIkKVnB/hG8bdowDMXOOsoLOZzOoyvNYNNNdV4nh6je0FUqcNoMs+RNg1+owhxJWxr+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8272.namprd12.prod.outlook.com (2603:10b6:8:fc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.23; Mon, 7 Oct 2024 14:09:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 14:09:08 +0000
Message-ID: <5115d57a-8a94-4f9c-8898-a403d720aac7@amd.com>
Date: Mon, 7 Oct 2024 16:08:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: add late_register for connector
To: Hoi Pok Wu <wuhoipok@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson"
 <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 hypexed@yahoo.com.au, Christian Zigotzky <info@xenosoft.de>,
 Darren Stevens <darren@stevens-zone.net>
References: <20241003060650.18454-1-wuhoipok@gmail.com>
 <d2704a2b-ceb2-4919-81d3-f6ff58a734fe@xenosoft.de>
 <c868e394-b1ad-4f30-b27b-c779e3458c42@csgroup.eu>
 <CANyH0kDWaS8mavzuUeH4CPHBN9kBQ3hcCGjWA8U0UU2_y=5Gnw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CANyH0kDWaS8mavzuUeH4CPHBN9kBQ3hcCGjWA8U0UU2_y=5Gnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: d786b211-155d-479c-6edc-08dce6d99c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nm42Q0t3bjlOeHZrR1oyRytXTE00b0tTZ2J2dTNmeERxOHZEaGxabnZob1pv?=
 =?utf-8?B?bitJakFMWVBSOXpGM0N2S3c1RkluVjF4V3ZnZmgreEwyaFlZK1ZaMU13cUN2?=
 =?utf-8?B?TVFlTXJkRmw1UUU2V3N6OGFGZ1RDWjJGMmJ2ZytsbUcyRjIzbXlNRmd1MzJJ?=
 =?utf-8?B?TzNTZGtwYkZnRUJhOElEOTkza1BGR0ZqNThDUGhpb05YNzJJZmpGN1o3TGFO?=
 =?utf-8?B?ZWZaQW51TTB3L2dBSnNsR1V6dUNKQmhBeDBHcW5jRWp4M2RrYjFtaTJWV21F?=
 =?utf-8?B?RlpqVFY0MFJscGV3UFYwQVZOZ1A5MVU3clMzajNuOFV4T2pWSC93aGQwb3N3?=
 =?utf-8?B?NEdKY2lvZUZiSlV6VGJTNDI4MUpveVNWcGM4ekQ1K1lMcUgvNzdQV2ZzZG1l?=
 =?utf-8?B?bXo5OEEzdis1N1RQaEsvRVVXb0VJT1lFRU9XWG5sRENvZUlGUWRtSC91NFZw?=
 =?utf-8?B?d1N2OVk4aVFDcUhla3FJekhwMVh2cXkzTnh4Mm5QQm9WU3h3QVRFTmZnS0ZB?=
 =?utf-8?B?S2wxb3c5VXU3dVU1TTl4c0RNRnRsSVlVdERyTk5xVHU3VnB3YXlpb2w5T3N2?=
 =?utf-8?B?OWZ3RE9NZyszcjQ4WUFqNmowdG52UnVwK3dTL2ZUVjVJaGxPeUtBQjB2Zm55?=
 =?utf-8?B?OE9reE1Fa2c5Q1FKOTNTMkVkMzlTS09WMlF5NmVQU3hOam1NZ0hRcWdwWWZF?=
 =?utf-8?B?bDhSdEk1QUltL0g0VE5OcWpoSExBeG15N3ZNL0FSRGNueGNxWnNKQnBlbytY?=
 =?utf-8?B?SnlJa3pkN2syOXM5Z0JrWTZQV2Jqb3pNeXVGUU81UHpsdVhNZVhxZHlJWXJn?=
 =?utf-8?B?RkhYUUhyd3RweitPY01Wd1Z2Uzc3dXEzWTlVY3g5MDBDaGlvdGdDR0VLVGRV?=
 =?utf-8?B?VTROd0FwMUt6K2tVNUhYck1Fd2hQaFgxSzUwczR0N3F2blZDWm1JSUxGUGQ2?=
 =?utf-8?B?TFMzMlpBS3R3WWJaVWJERWRqSVhHcnZ6MmlvV05CbDQzcWl5dFgzOWxXc1Zt?=
 =?utf-8?B?dUpyWHFLaS92MkxKbmRFbStaTWd4aUVkTTdSS2lPS1ZIWjFYcjJBM2g2Zy81?=
 =?utf-8?B?ZFJDNS9WaFFPK1BqNXhBRzIxNVFaUE01c2hSbXRqZStNa2kwK1IrbnZNRXNi?=
 =?utf-8?B?WFZMZ2szYUtna0R6RklsS2p1enA2WTMwR1ZpR25UNVRIRmw5R1N2V0RFZWty?=
 =?utf-8?B?c3BQU2MxYTlOMHZtZDQ1ZUVKcC96THhoWWh2NTFCZVNqNlJvSWM1bWFXRXJX?=
 =?utf-8?B?ZHYvRDdVblJDc1NScGRmd0MzR3dSTndPajBhUG1uTWFEZ3RHUnU5bmxFb2xj?=
 =?utf-8?B?WFlRdUpBTUtuMEkyUHBzOXdncVdnVkdLZUQ4ajFFQklnNUg0K0pZcDBvZGIw?=
 =?utf-8?B?Y1lid3A3Y3djZFFGbEtkKysyUUI0L0tUalgvaXBBNTFnb1RoV0p4QVFJTXlI?=
 =?utf-8?B?azZReG1JZ1NBY08rOG5oTi9TQWhxMWZZenl2WWZKdVpRY1hMWHRLVGdRRzE0?=
 =?utf-8?B?QktZMUZESnZJM09meHRpZ3ZZbklpQmxBNlN0STJta2J6OW9La050OG1BMndy?=
 =?utf-8?B?QjZBdU5MYktPTXFHbkUvRVN2QStodjgwckpQK2ZjUXlJSk5JL2lienRuTFYx?=
 =?utf-8?B?VWhVV1RLV0plRTNGa1VlVU9hVnJHa2Fzem5MVmRzYXFkdnM4N3kxbFNCd1BC?=
 =?utf-8?B?NWhQMTd6ZTg2VlQ1UkxSV2lHWUhaZnZaY29qWFMrd0IzbnNkUGN0TFVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THpZdEhmQlptWnZZSWc5MUpmYlUxR2ZBZmtramVTRks2NHo5ZUQvU2dpb2tV?=
 =?utf-8?B?T3l2UGkxWjRBT2FsY1ZIN01oWk9JWktLczRNVlJBZklQVW1OSEdUOWNOR3g3?=
 =?utf-8?B?OFNiZGhxdEVqL2h5dTU3RzJIUkt2cFY0ZVhqekFpOGpSSE1rcndYT3dFenB6?=
 =?utf-8?B?ajhXQ3pBa04xeHVsWFFTcEVpUSs3WUZoT0trdVlBUnJFekV1UWNacmNTWDdD?=
 =?utf-8?B?M2hvaWpZaWd3bVNsVjBOSUQ2VW5kUmVGMWQzMG4wdzR1b2N2MGd1VTBzTWtq?=
 =?utf-8?B?WkFDWmlmaHJoRkJrMkllVTh5dFA0K0JaQ3JlWk10MUtTVDNiYk5YbkRqZWVv?=
 =?utf-8?B?ZHF5WG9Za1NJVjNYdmJUdU8yUzQ5NTRNNWw3WWg2QmRNM3RpalpBelJsZ0x3?=
 =?utf-8?B?d1ArTE1yMXJTRXhaeWFYTUxVK25LOHN3MGhwU0tzZGoxY2xOR211amtOeC9I?=
 =?utf-8?B?cXFSSzJqT05CN1QrTnNJbE5jWnFidlJjaTJMK3NJdm1NdnVDVlB1clNhVE9n?=
 =?utf-8?B?MUlNL0hTSGlWanhCaDA5UDZiYTYxZldtT0xHWFNkakc2YlpLbmxVQ25vNUtl?=
 =?utf-8?B?RFM2bkJhZjFaVnllRitTTXkyQVEwNFl1cGsvN0FlNVNJdzIvUUNxc2JnWXpI?=
 =?utf-8?B?cFo0NkdGQnJrb3JnOVFoSmlXY1UwaFYvNHdtbHU2bG04dnIzQ1dscVZQazBn?=
 =?utf-8?B?S1RGSUxZb2JlcmFNK1l3OEh6cENYUmZWdlJoZmxVQUlMUDR2TkpMd0RkSThz?=
 =?utf-8?B?M0d4RUxrMU1qU0d3M3c2RkxXR2hzWDh6WlNSTXRXeWZoNEFhdUpveVVERjJB?=
 =?utf-8?B?U085ZnJ0RUlmYTBsRXl2Z1dTV0ZJY1M1WHBQcmZYSGdLcG9JVDFuY1pnWUNC?=
 =?utf-8?B?Z0h1Vkc5cDZtWFo1RWFsU0QxYS92dEVXQWtnWkNCV1haYjdqcTFqcVdxQ1VJ?=
 =?utf-8?B?OHNPUUVoUnFNVmxyaVJOU3poSld0bUcwRFJFcFVOWXZtc1VCdWFjRzhGQ3BN?=
 =?utf-8?B?Q1djNlFmS2IwSmVINEttamJYWDY5OXBCZDUzUlNZc2F0RmNtSHphRWcwcEpN?=
 =?utf-8?B?dzZndFhXbXZHbnB2Q0l3cmRCTVpOTmVyNThqRkJvc0ordVNVSkhNeldDcWtY?=
 =?utf-8?B?VTB4RDVRYnYxNU1qL0FPY1Q4K2tLNXpFOWc0azdEaEtXSVVia0trSlZ1VWts?=
 =?utf-8?B?dGtwTW9BTGd6U09vdnNmcUZkdWJiYXBJTE9zWFIrZ0gwUVV6UWwxQU9Pc0d3?=
 =?utf-8?B?djU5TDhzcW5JdktGY1JTdGN2OGs5Z1BUcFJIbUFLWHVrRnFCaDJvRFRuYkpS?=
 =?utf-8?B?T080Mi81WThwc0xxNzJnRmxrRFBVU3hnL2tuU0FGQzM0eVg2dHl0aW9VTFQw?=
 =?utf-8?B?OVd2UVJqYytXQUhIRkNvM1RxcGl0RktLdWlpWHMwV1VPZFVKQnMxbjl3cE45?=
 =?utf-8?B?aFlUUTJaTUxYZXdVM2VYS29GaDhETU80MTFCY1lDTkNac0llUjVWZU5DWnVT?=
 =?utf-8?B?MHE4U3QwVUhrcnlhN3V4cnplM2cyclVvUkJKeXdOaGkyMm1qbUl3WDY2WjFz?=
 =?utf-8?B?cE5JQ3hheStFTmsxRnlKMmJFcVYwbDlDQ2JUNmpYalVjZ0tLZW94SGxpb2xZ?=
 =?utf-8?B?TkE1eTBOZEt5VWZxWGo1SHJOTCt3UzVpREwyV3pPMzAyaXY5UE52RWd6VFhN?=
 =?utf-8?B?bGhlVTB3YXNKZ0pSbFd0RTgwV1JCaVZZdWpPSHZLbnhFUXFOM21wckFmRjJY?=
 =?utf-8?B?WWg1elFTb1ozeEFRM2JOY1k0NVI5UHdvQk1lbFhUWFdhR2J5czZYUkozU3Rt?=
 =?utf-8?B?YUlZZmQ3R2REdVZidkpoclZhYWl2a0ppWTl3Uk1iUXJqK1JZYVZrVDJqMGVW?=
 =?utf-8?B?QU9rcUZJaHdJa2hnL2dlZkEveWdmcnU2NkNNRWhLZTQ5TVJERkRTYkJvOTUv?=
 =?utf-8?B?SmRRY0RYMFVaeW5OcU9PdS9pMUIzdFMxTk11ZTdHcUU2bzhQbER4eGZGSVFW?=
 =?utf-8?B?Z3Y1NkRaNHRic3RJcEw0ZTA3SkxzcW1oVFhqZzJRaFpmUVFVMG03MzZEZ0gw?=
 =?utf-8?B?T1RDZjQ5RzFXOUkrSm05c3Foa1A2d2hMM1J6Z2ExUVNUQVh3bW5ZL0hWUy9n?=
 =?utf-8?Q?cjm9ioCpF5xrVfaGJCGcgMwRO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d786b211-155d-479c-6edc-08dce6d99c08
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 14:09:08.1298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIrkqEDJQ/hlrbI34CKy5U6cpzzd9eM+M3WhHqDyRnLUk5BtPLUVuJnmaScVFXWM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8272
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

That's the issue I was working on, give me 10 minutes to send out the fix.

Regards,
Christian.

Am 07.10.24 um 06:49 schrieb Hoi Pok Wu:
> Thank you. I am looking at the problem now.
>
> On Mon, Oct 7, 2024 at 1:37 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>> Le 06/10/2024 à 18:56, Christian Zigotzky a écrit :
>>> On 03 October 2024 at 08:06 am, Wu Hoi Pok wrote:
>>>> This is a fix patch not tested yet,
>>>> for a bug I introduce in previous rework of radeon driver.
>>>> The bug is a null dereference in 'aux.dev', which is the
>>>> 'device' not registered, resulting in kernel panic. By having
>>>> 'late_register', the connector should be registered after
>>>> 'drm_dev_register' automatically.
>>>>
>>>> Please help testing thank you.
>>> Hello Wu Hoi Pok,
>>>
>>> Thanks a lot for your patch. Unfortunately there is a new issue after
>>> patching the RC1. Could you please fix the following issue?
>>>
>>> Thanks,
>>> Christian
>>>
>>> ---
>>>
>>> Linux fienix 6.12.0-rc1-2-powerpc64-smp #1 SMP Fri Oct  4 08:55:45 CEST
>>> 2024 ppc64 GNU/Linux
>>>
>>> [   29.167145] systemd[1]: Sent message type=signal sender=n/a
>>> destination=n/a
>>> path=/org/freedesktop/systemd1/unit/NetworkManager_2eservice
>>> interface=org.freedesktop.DBus.Properties member=PropertiesChanged
>>> cookie=103 reply_cookie=0 signature=sa{sv}as error-name=n/a
>>> error-message=n/a
>>> [   29.542140] systemd-journald[1301]: Successfully sent stream file
>>> descriptor to service manager.
>>> [   29.561863] BUG: Kernel NULL pointer dereference on read at 0x00000000
>>> [   29.567156] Faulting instruction address: 0xc000000000c973c0
>>> [   29.571574] cpu 0x1: Vector: 300 (Data Access) at [c000000006f97640]
>>> [   29.576637]     pc: c000000000c973c0: .drm_gem_object_free+0x20/0x70
>>> [   29.581708]     lr: c000000000d28dd8: .radeon_bo_unref+0x58/0x90
>>> [   29.586428]     sp: c000000006f978e0
>>> [   29.588695]    msr: 9000000000009032
>>> [   29.590962]    dar: 0
>>> [   29.591925]  dsisr: 40000000
>>> [   29.593496]   current = 0xc0000000085b1f00
>>> [   29.596286]   paca    = 0xc00000003ffff680     irqmask: 0x03
>>> irq_happened: 0x01
>>> [   29.602119]     pid   = 1524, comm = Xorg.wrap
>>> [   29.605257] Linux version 6.12.0-rc1-2-powerpc64-smp
>>> (geeko@buildhost) (powerpc64-suse-linux-gcc (SUSE Linux) 7.5.0, GNU ld
>>> (GNU Binutils; devel:gcc / SLE-15) 2.43.1.20240828-150300.536) #1 SMP
>>> Fri Oct  4 08:55:45 CEST 2024
>>> [   29.623892] enter ? for help
>>> [   29.625487] [c000000006f97960] c000000000d28dd8
>>> .radeon_bo_unref+0x58/0x90
>>> [   29.631083] [c000000006f979e0] c000000000e287b0
>>> .radeon_vm_fini+0x260/0x330
>>> [   29.636765] [c000000006f97aa0] c000000000d07c94
>>> .radeon_driver_postclose_kms+0x1a4/0x1f0
>>> [   29.643579] [c000000006f97b30] c000000000c9374c
>>> .drm_file_free+0x28c/0x300
>>> [   29.649174] [c000000006f97be0] c000000000c93900 .drm_release+0x90/0x170
>>> [   29.654508] [c000000006f97c70] c000000000304790 .__fput+0x120/0x3b0
>>> [   29.659495] [c000000006f97d10] c0000000002fe0fc .__se_sys_close+0x4c/0xc0
>>> [   29.665004] [c000000006f97d90] c000000000025bac
>>> .system_call_exception+0x22c/0x260
>>> [   29.671295] [c000000006f97e10] c00000000000b554
>>> system_call_common+0xf4/0x258
>>> [   29.677164] --- Exception: c00 (System Call) at 00000000006b2b48
>>> [   29.681876] SP (fff4b3d0) is in userspace
>>> [   29.684577] 1:mon>  <no input ...>
>>> [   31.666727] Oops: Kernel access of bad area, sig: 11 [#1]
>>> [   31.670829] BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 A-EON Amigaone X1000
>>> [   31.676144] Modules linked in: snd_hda_codec_idt
>>> snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg
>>> snd_hda_codec snd_hda_core dm_mod
>>> [   31.688703] CPU: 1 UID: 0 PID: 1524 Comm: Xorg.wrap Not tainted
>>> 6.12.0-rc1-2-powerpc64-smp #1
>>> [   31.695932] Hardware name: pasemi,nemo PA6T 0x900102 A-EON Amigaone X1000
>>> [   31.701417] NIP:  c000000000c973c0 LR: c000000000d28dd8 CTR:
>>> c000000000d07af0
>>> [   31.707250] REGS: c000000006f97640 TRAP: 0300   Not tainted
>>> (6.12.0-rc1-2-powerpc64-smp)
>>> [   31.714128] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI> CR:
>>> 28002222  XER: 20000000
>>> [   31.720773] DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0
>>>                  GPR00: c000000000d28dd8 c000000006f978e0
>>> c00000000207a800 c0000000085f5468
>>>                  GPR04: 0000000000000b9b 0000000000000b9a
>>> 0000000179779000 c0000000086a4b00
>>>                  GPR08: 0000000000000000 0000000000000000
>>> 0000000000000001 0000000000000000
>>>                  GPR12: 0000000048002202 c00000003ffff680
>>> 0000000000000000 0000000000000000
>>>                  GPR16: 00000000006e3318 0000000000000001
>>> 00000000006e289c 0000000000000063
>>>                  GPR20: 00000000c04064a0 00000000007f0088
>>> 00000000fff4c734 00000000007d165c
>>>                  GPR24: 00000000007d1668 c000000024b6a220
>>> c000000003588000 c000000024b6a200
>>>                  GPR28: c000000003b3cc00 c000000024b6a248
>>> c000000002d48820 c0000000085f5468
>>> [   31.778903] NIP [c000000000c973c0] .drm_gem_object_free+0x20/0x70
>>> [   31.783701] LR [c000000000d28dd8] .radeon_bo_unref+0x58/0x90
>>> [   31.788062] Call Trace:
>>> [   31.789199] [c000000006f978e0] [c000000006f97990] 0xc000000006f97990
>>> (unreliable)
>>> [   31.795388] [c000000006f97960] [c000000000d28dd8]
>>> .radeon_bo_unref+0x58/0x90
>>> [   31.801142] [c000000006f979e0] [c000000000e287b0]
>>> .radeon_vm_fini+0x260/0x330
>>> [   31.806982] [c000000006f97aa0] [c000000000d07c94]
>>> .radeon_driver_postclose_kms+0x1a4/0x1f0
>>> [   31.813954] [c000000006f97b30] [c000000000c9374c]
>>> .drm_file_free+0x28c/0x300
>>> [   31.819707] [c000000006f97be0] [c000000000c93900] .drm_release+0x90/0x170
>>> [   31.825197] [c000000006f97c70] [c000000000304790] .__fput+0x120/0x3b0
>>> [   31.830342] [c000000006f97d10] [c0000000002fe0fc]
>>> .__se_sys_close+0x4c/0xc0
>>> [   31.836010] [c000000006f97d90] [c000000000025bac]
>>> .system_call_exception+0x22c/0x260
>>> [   31.842460] [c000000006f97e10] [c00000000000b554]
>>> system_call_common+0xf4/0x258
>>> [   31.848476] --- interrupt: c00 at 0x6b2b48
>>> [   31.851267] NIP:  00000000006b2b48 LR: 00000000006b2b20 CTR:
>>> 0000000000000000
>>> [   31.857101] REGS: c000000006f97e80 TRAP: 0c00   Not tainted
>>> (6.12.0-rc1-2-powerpc64-smp)
>>> [   31.863978] MSR:  100000000200f032 <HV,VEC,EE,PR,FP,ME,IR,DR,RI>  CR:
>>> 28002400  XER: 00000000
>>> [   31.871235] IRQMASK: 0
>>>                  GPR00: 0000000000000006 00000000fff4b3d0
>>> 00000000f7b7f3a0 0000000000000003
>>>                  GPR04: 0000000000000000 0000000000000000
>>> 0000000000000000 0000000000000000
>>>                  GPR08: 0000000000000000 0000000000000000
>>> 0000000000000000 0000000000000000
>>>                  GPR12: 0000000000000000 00000000007efff4
>>> 0000000000000000 0000000000000000
>>>                  GPR16: 00000000006e3318 0000000000000001
>>> 00000000006e289c 0000000000000063
>>>                  GPR20: 00000000c04064a0 00000000007f0088
>>> 00000000fff4c734 00000000007d165c
>>>                  GPR24: 00000000007d1668 00000000fff4b400
>>> 0000000000000001 0000000000000001
>>>                  GPR28: 00000000fff4b46c 0000000000000000
>>> 00000000007bfff4 0000000000000003
>>> [   31.926053] NIP [00000000006b2b48] 0x6b2b48
>>> [   31.928930] LR [00000000006b2b20] 0x6b2b20
>>> [   31.931720] --- interrupt: c00
>>> [   31.933466] Code: ebe1fff8 7c0803a6 4e800020 60000000 7c0802a6
>>> fbe1fff8 7c7f1b78 f8010010 f821ff81 60000000 60000000 e93f0140
>>> <e9290000> 7d2a0074 794ad182 0b0a0000
>>> [   31.946913] ---[ end trace 0000000000000000 ]---
>>>
>>>
>> That's a NULL pointer dereference in drm_gem_object_free().
>>
>> Trying to read obj->funcs->free while obj->funcs is NULL.
>>
>> Christophe


