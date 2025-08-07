Return-Path: <linuxppc-dev+bounces-10736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0C4B1D9E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 16:21:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byTqP3N27z3cSH;
	Fri,  8 Aug 2025 00:21:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754576481;
	cv=pass; b=oiZ5TeVHmCFqpDISsn3NwGcHHuTZNfPK0i3oI5/UceguvjIF1wafuYxapTHuUictkQkevk/P1QORHk2/S8nJ6JzBMY0TIfQJipRlpYZyWWTtFGXoJWBMnLNki0wlXxwiergv+gfzVAWwLhVmyMq9sDNiUHiIpStjwyujsGtQsc8E3Xqt5WZ8a2++kaZdm69tIX84gWlhNVbKG/0rqKT4Ox8WLOzAGWqSasKOH8EQmSLF89j2rXZwq1Q140opWg4w1fGJd4dbWfgSkk6lJm3cW+LelCywkcqE48YeOBPpjZgIrhkhf5YhiE4glXhI3rGcY73YDzYA1C/0zOq1xwZuHA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754576481; c=relaxed/relaxed;
	bh=XcywLlqyMqv8v3RgUP5kdPtf550NTp3mmdRJxy56Wwk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kP11lXtNMlIJRtxdMNVXyOo3YWWHLJWKHHJwWdS8mJ98iw9lsGufv2jT5+c9sf8iBCZdEXZsUPO0BeFCP8T/8xvqQ//XDGrpRXiCoZ43vum9Yjd1dGzKVJb338Dj/4uKjNQhZQ5jthJT7urmAQSgW0pCapLzRj9+PGsHhxhzjEpMofmAqSd8sJU77UA8yJ4e0ocmvZmQThis+s8InbBuDsepX/WAZn/9jOXmvyde3iVWG1QfFYKw1W5CwX4bmacVcaZsbJFZnlC8Wz15k44vu/9V1QBctkOcDb/MkVY3o1nQbbE4ZQp+YJpib71Cb5kt7j7/V+GSC5mwLEUYt+c+jQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=p8g/yirn; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::610; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=mario.limonciello@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=p8g/yirn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2416::610; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=mario.limonciello@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byTqM3pDCz3cSC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 00:21:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syq6pgBrzgtQqxv2qJFJDGh0cqb+L/O88Rudh73un0R1YcvzKVzc/xjQDQI9Q9NIKU15e4qVNZcFEDlMsye6D8SG4Dasljk/b6pMCeJQCT0cJe0wBqh1B7jV7nuFNjHoDVkgxVfy6t6/D6Y+yResadEGicjdOY+gk6V+dU++R/ndQUGshgXXn4g+qUjAuwY/nNt/7XfSDVjLaMuUVCqITjnZDlY9El7gHWWe27AL1oFThyJoXC6vJT26taUhd7NO808Hmj0dojMRJ+UydqAow1glqaWFQgPqM8idOVxQbk/8PeymgVrj/Zf65C7JuEJ/1WIAS0A7cVresWc0YQMWAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcywLlqyMqv8v3RgUP5kdPtf550NTp3mmdRJxy56Wwk=;
 b=y/WILii6BogkEVl9J2UQ3vn3/gue0YXb+rPP5ZqHxF7AmqFDKD8QQLDQqx1peLcvcYr9Trz+3/FUxBdYJ7KnNoMmROx3+ZgDfTMnx1Iv8YTg45FtmZT2Ab6wyOMRLmSgi70R/TTxDS7LQ1qfNVqe/Z57q2QoqBHctC6uFXBKotCXL1eOPm6QJvQj09/8naz5QHdBExSrsp3jXirnKQhNEQJGLnwyVxK0Iri23We2fXNWOIgx73DIMjTzsEFu61gv4ZzMRQJAxCJtEiGOJvghYSRtJRHBunH2T3BXtMpbwBVacDaQq8OBEaxoQSY1/CEPnIxEpCfhakprR71I+89Q3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcywLlqyMqv8v3RgUP5kdPtf550NTp3mmdRJxy56Wwk=;
 b=p8g/yirn/Z422DrhJyOyhAPYO5V3mgo4/LkzqPBBu9QuJXkjwNLEnCJkoGkBUYK4gGy9CCFkkZLHAP+YaRk7JcW94dNOIBsr4DXtkV1kx0Itr/ALTnonYlIEPl0Rx59acYNLwJ6vgBVKpacb3AYC1mKvRXCo015ZNJWXo08MQZw=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN6PR12MB8471.namprd12.prod.outlook.com (2603:10b6:208:473::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 14:20:59 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 14:20:59 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, mad skateman
	<madskateman@gmail.com>
CC: Alex Deucher <alexdeucher@gmail.com>, "ville.syrjala@linux.intel.com"
	<ville.syrjala@linux.intel.com>, Jeff Johnson <quic_jjohnson@quicinc.com>,
	Darren Stevens <darren@stevens-zone.net>, "hypexed@yahoo.com.au"
	<hypexed@yahoo.com.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Christian Zigotzky <info@xenosoft.de>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
	<ckoenig.leichtzumerken@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Wu
 Hoi Pok <wuhoipok@gmail.com>, "amd-gfx@lists.freedesktop.org"
	<amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, R.T.Dickinson <rtd2@xtra.co.nz>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "benato.denis96@gmail.com"
	<benato.denis96@gmail.com>, "Yijun_Shen@Dell.com" <Yijun_Shen@Dell.com>,
	"Perry, David" <David.Perry@amd.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
Subject: Re: radeon_fbdev_river_fbdev: failed to initialize framebuffer and
 setup emulation
Thread-Topic: radeon_fbdev_river_fbdev: failed to initialize framebuffer and
 setup emulation
Thread-Index: AQHcB6VKnns1WejusEqBcJ7u80qvALRXPbIA
Date: Thu, 7 Aug 2025 14:20:58 +0000
Message-ID: <69bac1ee-4fea-4225-b222-d7f274a8ea3c@amd.com>
References:
 <CAHkrCmHKSR+3gCjs7E=Qnini_CCEa+wjx9gWNPMjSWWFOScQtw@mail.gmail.com>
 <DA680712-472D-46BE-A2DF-9E923A4E6EE1@xenosoft.de>
In-Reply-To: <DA680712-472D-46BE-A2DF-9E923A4E6EE1@xenosoft.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|MN6PR12MB8471:EE_
x-ms-office365-filtering-correlation-id: 0d466c0c-d37a-4fd8-880d-08ddd5bda167
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U1NkN2ZWWCtucFEvTzJxUlMyYmM5aFVNS21FNnRxVm5qS3NVK0J3TlR6Z0Q4?=
 =?utf-8?B?OWZKczkvdFVkRXRYZnlJWVBseTJPeFJrQldOK0pXWmVvdnNzRGVlL0lFdndY?=
 =?utf-8?B?T3NlQ0wxQU5DakJUKy9NQlpaRnZZTlJZa0tmNllKYkd0dEV1RThMd0Z1V0lt?=
 =?utf-8?B?a2trankySWE2Z0VOZENqSUxsTmhMb0x4RlRXUjk0NGNocGdVUjh2aXMwNU93?=
 =?utf-8?B?SEx1eEd2VE00Yk8zT2tIWUN5SllmRm1yQUtOWW1mb2Y5YThua1R0cFJTQnVY?=
 =?utf-8?B?TWhEYlE0S21jbkpFazdoYnVFVUxuVVZBdXhCdFRxS3hOanhBNXZBR3pUN0hK?=
 =?utf-8?B?b1pzWWg4MExWV2ZEbnhTaUlIbURLMjR1VDR5cnBWOGgxOHRaTVIwdGhtTWpH?=
 =?utf-8?B?UVJQQ3VSeFRnMHNrcGVPRHkwQTYzZURydkRxMlZGWkZWZGc3c1ExTHV3K0p3?=
 =?utf-8?B?UENzRG1oNExwTTR6WnpRb1o2elc2ZHo2cjhObE84dmZNQnBJM1hHVEN0SS9F?=
 =?utf-8?B?TU41YXBKb3FISVZGMDhJTDE5T3pyYytIRlBVdHI0eEJURHBmUTJIOHcwZzl0?=
 =?utf-8?B?aExxV2RGVnVQVXY3MG5MWDJrUnFrM1pVUEd0T2hSY0JlZ3FBYkdrNTlxT3I4?=
 =?utf-8?B?YVd0WGdVQ2plb2tmLzVJYTFYTFlydS9ST01IUVNhZnErZmJ2aFJtY1dJUGtZ?=
 =?utf-8?B?QzRTTjVPaVhFWlFKTFhoODg2T3IvdjNHdTV1bUFFaU9ybEQvNDNXUzBxODZv?=
 =?utf-8?B?WVNCY29MUFFlSnZUTUZ1aUZ0NEs1NTV5SlNlNFozNlhTeWhHeU9jRmU4WVVx?=
 =?utf-8?B?NnR2MXpYTFE0dzY2Mm1HVXowcStZODkxQ2lieUZobDA4bnEyWis0eFpuZE1M?=
 =?utf-8?B?a0picXh0TERyMWduY1IxdTFVenFMRlFmQzIzR1VLN1lMbjlOQlJKQTZJeFNP?=
 =?utf-8?B?c1JSQzZNYnQ0VXhJZURGMzhaR2l1d3BJN0RMNzBsbllnVDVQMzczR1FZOGNG?=
 =?utf-8?B?VksvL05HeG9QNGtmaUU1bDFmSE5XLzQzVDN1Y3h2eVNFcFliYUVTemNpcWF5?=
 =?utf-8?B?b1pCcmJ3YjRkTkZ5azZxQnFWOFprNHplT1lYVFhzN253cmw3bWJhQzFEUnk3?=
 =?utf-8?B?OFI1RWhlNFdEaTV4RkNNRFNvYXFOcVJBUDlwZ0l3TzZEaFRwejg5VjlyeTFF?=
 =?utf-8?B?eVZNZHdLYytPQkg5RzFBcVYvejJTKzBiNU0zNXFJYjZpL2wrUS9kbzByc0pT?=
 =?utf-8?B?VXFHZi9weklUR3YwYUZmVWJZUGx1ZC9Zb3hqNHMxd3lrTVhWY3BZVzEvN0h2?=
 =?utf-8?B?VmdLSTF0d1Q0OU9ZaGI5Y09ualQ1RnVRQVFqQmFXU1ZMNWM0L09CQXFVMlBS?=
 =?utf-8?B?UTF2QUc0ZitMUWs3WjVNNElzdFRVZk02RGdDY2hVci9TNVBHaVVQQSt5d3lj?=
 =?utf-8?B?MGhHZVh2VlNOTWkwNnF6ajUxaHBsUmFMT1IzVVdjYlZkUFN4YTZYR25SU3Qx?=
 =?utf-8?B?d3hDa3hEMkM3cDAwamNsUTdLTEVkazZUMXZqcWpxY0xucXBIM09OMkRsVlZH?=
 =?utf-8?B?dWllOCtnVEo3T0xRcUtIaVl2OW4vVTRWNVljcDVFdzdDdlJpSlZhYnlHN0VI?=
 =?utf-8?B?N1FwQ2lOZnN1b2w0em9oQ1UwME5FSkRWTUtaa05EMDgyTEhqbWkxeCs0M2hu?=
 =?utf-8?B?NzdUdmtkaHlPR2FkVFd2VTZRRjhUZGtPV2VtUktSY1d2UUFkdGRDODB5d1Bp?=
 =?utf-8?B?aUtPVFExRFZ3SDZTeVF5VzJRWXVGNmc2VG4wYmdnUGN2SGpOZ1pENmFuRkRz?=
 =?utf-8?B?TnNwVGgxekNRcWdpT0pYaG5QUDJXY2cxaGsyVFdaanBrYWJuWWo2QURjWG41?=
 =?utf-8?B?TXUvV0REMDhDWnFra292L29HZjVnYXpiemZkRitKS0VUVHdhNDgveUNkdHo1?=
 =?utf-8?Q?+jTCJjPWNk8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFRMNzhKTElrc2xqakVycmMzY1h2TWlXb1o1emJ4VWEwZVBZd2tzaEM2RUJT?=
 =?utf-8?B?QXJyVWFHRmdDRDRWYnJSamlBWExhTkRXVEVrZE5WdjY4eGloQUJmL1JLZWJN?=
 =?utf-8?B?TzFwSEtLK3pzenc3VWVQNWV4N3lTTWNucEdxRXhZUU1sZXg2dHI5dzQ4Z29N?=
 =?utf-8?B?VnFvT3RaNzNpUWtYK1RwQUlvVEY2eTBwSnp0enlvSWNYSDUxeXdvOUdXY3ht?=
 =?utf-8?B?RnlLUjRTWVFQMHgzR0VGZ1dhWTF1ajB3N3ZYL1hWN3FGc0FITXNhN0xoUWZy?=
 =?utf-8?B?MVY2YkdIeHFNVmUxRWRYNFcyeDRyYVBGSEhSTVg4STZSS3U4MWFwNzFWbjlv?=
 =?utf-8?B?QVlUNTczRlJlQzFDeXRCTVVmQmZYNExNSExGUWkvMXM4Z1RPNlN2NkZkL1JI?=
 =?utf-8?B?eHFlQWVxVDBGUDBMdlVJaFlSNUtxOVEwZjNwYmlvRXJZdE54TW4yTnMxZ2RJ?=
 =?utf-8?B?OFpKNmFyM2t6MWl0MkJvS0pvNHVWTG8xYm1LcnlxZG52QURQbXVrRDdIQVNP?=
 =?utf-8?B?TGF0Sjd1Sll4SkZSZVNJajc4eTc0R2Q4MFRnNG1NbDI3ektjQlNIZjllUUh0?=
 =?utf-8?B?ZDRoNmM4RDdldVhJMmQxR3FrRWIzMi9uTklkb2NSaXVOelE1dStrZU9RTmNw?=
 =?utf-8?B?anZySFB4bWlzWUcvUkYwMTdYOVZPVklkUFY2aEVUaUNuMnh3bUVQQWxWZGth?=
 =?utf-8?B?YklMQnNwTWg5MzByWFNtYmZmRm4wOTlVYkFNTVBoOHgyZUN6WTg1ckRNdXUr?=
 =?utf-8?B?VEhBOTI4Y2oyT21UbE5VbTRpZXhsbDdwTDh0VXI4bHJQWjlzZjVhTjk1aVFh?=
 =?utf-8?B?ZEM5ZmVtT3dEcWVPcmpVK3d4V2pBbjc5NUE5bGp6SWxGQkR2cnE5emoxWTFn?=
 =?utf-8?B?OVRHR1hCclo3bk5yZDM2em5xejBYSXVPM0ZqZGxsaUNISWpxMmFKeGRqSnl5?=
 =?utf-8?B?U0lwSk96UTRxQ3hMdTI3S1IrV0N5WExZUDFoVjRJQTRhNlQ3T1RZRkpvczEz?=
 =?utf-8?B?OFArNm1oT3BFQmRQZmFoK0RkQWRCWGNVSmhUZ1MwckRobVNEOHBhZTQvVzVm?=
 =?utf-8?B?OGhrWkN5VWVHbm40SytmRW1RZUoxdlQ3dmpFTWdZY0xPN3BXbXB5RXVCVWZX?=
 =?utf-8?B?RW9WZ3pBYUYyZWhpS0N0WnN0NnMxQmtPSUlCV3llY1dkWnR1UVR3ZEhHREdB?=
 =?utf-8?B?eWdqUm1wS1hvcHBHYjB6R2NQM3dLalY3ejVyWmhBTmxLLy9zd3FJM21Jc1JM?=
 =?utf-8?B?OCtTSWdNbXVJaTYyUlpKSXYzU0xOQWRSM1BLSEFER01VNnNiUjNiR1RUS0Z0?=
 =?utf-8?B?ajNyalNVc0lNcnRvRlBFd3ZGZFVweXZVbEppbzdHeW95U0JNaU5RcDJqK0JW?=
 =?utf-8?B?THJtM3dOWWJraDkyTXJmVDZzcC9hUDdmODZzQ2duekxIeHVBKzhUYXBUK0JT?=
 =?utf-8?B?T2g3d1pJRDB1MC9naEViUVBoNjN5MHpwd0ZxbE5wV1F2TDRtTDNhTlk5ZDJm?=
 =?utf-8?B?N1RQMlFUamRXcFo2cDU1THB2blZLTDIzSjFnMW14emdSQzFvMXZ5U2N5QW1r?=
 =?utf-8?B?b1doQkErMDdxaDdRY3lPb1RNbnErd29qUXJsbUM4R0dvZ3hxa3VXaFltWXZm?=
 =?utf-8?B?d2FoWDlHTVpndm94eVJuMXIwOEFlVHcxMFJCMUU3YTdsMUdmZUl5dXVQWXhX?=
 =?utf-8?B?MjExSUlQWkZ3cW5ZVmUwYmorRGFkUG9sLysxRmd1UjF0alRLZS9tMmV2cXFI?=
 =?utf-8?B?MmUvTTF0dk5rNDBST3pHcFYxL1NLZjhCYjc2ZURYYS9SeFRjVDYvNVBjRk1K?=
 =?utf-8?B?TW5Kb0xKUzBYdUxObTNsVmhxUFJpUklHdTlQdzR4Z1kxL0NiTEkvazM2QnBu?=
 =?utf-8?B?ZWluQy9zcm5mS1ZCNi9iSkcxVm42ekFGbE0vQWlEM2tIL292Z0NKcWpwVEZx?=
 =?utf-8?B?Zlc4eHFhRmhLN2t0V3FxTWZkRy93WGIzalF4MzZWZjkxSHpmOGlsbDlLVytW?=
 =?utf-8?B?NG9MTlg5Zmp0bE1jQWRGbFh0dlh2dlZzMWNySGd2ZXJsVmo0OXdCMUJZaEp6?=
 =?utf-8?B?SzgyeUxNbUNwNER1aHVPRXQzeEVpaTZRSjRiR0RyNU9qMzBaUS95TXdGWnZ3?=
 =?utf-8?Q?gs10=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE2AEE61C21D0440A52D13BBF4B3C10F@namprd12.prod.outlook.com>
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
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d466c0c-d37a-4fd8-880d-08ddd5bda167
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 14:20:58.9424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TuwbAKsGJGMi3WonpUD0vP5lf/gAaD4I2qAje9PGevIPLvo0+s1Rrhd34p367mkVj+EHKJTqh48OLRQMcXfo2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8471
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gOC83LzI1IDk6MTAgQU0sIENocmlzdGlhbiBaaWdvdHpreSB3cm90ZToNCj4gSSBiaXNlY3Rl
ZCB0b2RheS4NCj4gDQo+IGdpdCBjbG9uZSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL2tlcm5lbCBhDQo+IA0KPiBnaXQgYmlzZWN0IHN0YXJ0DQo+IA0KPiBnaXQgYmlzZWN0IGdv
b2QgMmYyOWI1YzIzMTAxMWI5NDAwN2QyYzhhNmQ3OTM5OTJmMjI3NWRiMQ0KPiAoR29vZDogdmlk
ZW86IHNjcmVlbl9pbmZvOiBSZWxvY2F0ZSBmcmFtZWJ1ZmZlcnMgYmVoaW5kIFBDSSBicmlkZ2Vz
KQ0KPiANCj4gZ2l0IGJpc2VjdCBiYWQgZjYyNDA4ZWZjODY2OWI4MjU0MTI5NWE0NjExNDk0Yzhj
OGM1MjY4NA0KPiAoQmFkOiBkcm0veGUvdmY6IERpc2FibGUgQ1NDIHN1cHBvcnQgb24gVkYpDQo+
IA0KPiA0ZDRjMTBmNzYzZDc4MDhmYmFkZTI4ZDgzZDIzNzQxMTYwM2JjYTA1IGlzIHRoZSBmaXJz
dCBiYWQgY29tbWl0DQo+IGNvbW1pdCA0ZDRjMTBmNzYzZDc4MDhmYmFkZTI4ZDgzZDIzNzQxMTYw
M2JjYTA1DQo+IEF1dGhvcjogTWFyaW8gTGltb25jaWVsbG8gPG1hcmlvLmxpbW9uY2llbGxvQGFt
ZC5jb20+DQo+IERhdGU6IMKgIFdlZCBBcHIgMjMgMjM6MzE6MzIgMjAyNSAtMDUwMA0KPiANCj4g
IMKgIMKgIFBDSTogRXhwbGljaXRseSBwdXQgZGV2aWNlcyBpbnRvIEQwIHdoZW4gaW5pdGlhbGl6
aW5nDQo+IA0KPiAgwqAgwqAgQU1EIEJJT1MgdGVhbSBoYXMgcm9vdCBjYXVzZWQgYW4gaXNzdWUg
dGhhdCBOVk1lIHN0b3JhZ2UgZmFpbGVkIHRvIGNvbWUNCj4gIMKgIMKgIGJhY2sgZnJvbSBzdXNw
ZW5kIHRvIGEgbGFjayBvZiBhIGNhbGwgdG8gX1JFRyB3aGVuIE5WTWUgZGV2aWNlIHdhcyANCj4g
cHJvYmVkLg0KPiANCj4gIMKgIMKgIDExMmE3ZjljOGVkYmYgKCJQQ0kvQUNQSTogQ2FsbCBfUkVH
IHdoZW4gdHJhbnNpdGlvbmluZyBELXN0YXRlcyIpIGFkZGVkDQo+ICDCoCDCoCBzdXBwb3J0IGZv
ciBjYWxsaW5nIF9SRUcgd2hlbiB0cmFuc2l0aW9uaW5nIEQtc3RhdGVzLCBidXQgdGhpcyBvbmx5
IA0KPiB3b3Jrcw0KPiAgwqAgwqAgaWYgdGhlIGRldmljZSBhY3R1YWxseSAidHJhbnNpdGlvbnMi
IEQtc3RhdGVzLg0KPiANCj4gIMKgIMKgIDk2NzU3N2IwNjI0MTcgKCJQQ0kvUE06IEtlZXAgcnVu
dGltZSBQTSBlbmFibGVkIGZvciB1bmJvdW5kIFBDSSANCj4gZGV2aWNlcyIpDQo+ICDCoCDCoCBh
ZGRlZCBzdXBwb3J0IGZvciBydW50aW1lIFBNIG9uIFBDSSBkZXZpY2VzLCBidXQgbmV2ZXIgYWN0
dWFsbHkNCj4gIMKgIMKgICdleHBsaWNpdGx5JyBzZXRzIHRoZSBkZXZpY2UgdG8gRDAuDQo+IA0K
PiAgwqAgwqAgVG8gbWFrZSBzdXJlIHRoYXQgZGV2aWNlcyBhcmUgaW4gRDAgYW5kIHRoYXQgcGxh
dGZvcm0gbWV0aG9kcyBzdWNoIGFzDQo+ICDCoCDCoCBfUkVHIGFyZSBjYWxsZWQsIGV4cGxpY2l0
bHkgc2V0IGFsbCBkZXZpY2VzIGludG8gRDAgZHVyaW5nIA0KPiBpbml0aWFsaXphdGlvbi4NCj4g
DQo+ICDCoCDCoCBGaXhlczogOTY3NTc3YjA2MjQxNyAoIlBDSS9QTTogS2VlcCBydW50aW1lIFBN
IGVuYWJsZWQgZm9yIHVuYm91bmQgDQo+IFBDSSBkZXZpY2VzIikNCj4gIMKgIMKgIFNpZ25lZC1v
ZmYtYnk6IE1hcmlvIExpbW9uY2llbGxvIDxtYXJpby5saW1vbmNpZWxsb0BhbWQuY29tPg0KPiAg
wqAgwqAgU2lnbmVkLW9mZi1ieTogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4N
Cj4gIMKgIMKgIFRlc3RlZC1ieTogRGVuaXMgQmVuYXRvIDxiZW5hdG8uZGVuaXM5NkBnbWFpbC5j
b20+DQo+ICDCoCDCoCBUZXN0ZWQtQnk6IFlpanVuIFNoZW4gPFlpanVuX1NoZW5ARGVsbC5jb20+
DQo+ICDCoCDCoCBUZXN0ZWQtQnk6IERhdmlkIFBlcnJ5IDxkYXZpZC5wZXJyeUBhbWQuY29tPg0K
PiAgwqAgwqAgUmV2aWV3ZWQtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWxAa2VybmVsLm9y
Zz4NCj4gIMKgIMKgIExpbms6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI1MDQyNDA0MzIz
Mi4xODQ4MTA3LTEtIA0KPiBzdXBlcm0xQGtlcm5lbC5vcmcNCj4gDQo+ICDCoGRyaXZlcnMvcGNp
L3BjaS1kcml2ZXIuYyB8IMKgNiAtLS0tLS0NCj4gIMKgZHJpdmVycy9wY2kvcGNpLmMgwqAgwqAg
wqAgwqB8IDEzICsrKysrKysrKystLS0NCj4gIMKgZHJpdmVycy9wY2kvcGNpLmggwqAgwqAgwqAg
wqB8IMKgMSArDQo+ICDCoDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkNCj4gDQo+IEkgYmlzZWN0ZWQgd2l0aCBhIEFUaSBSYWRlb24gNzAwMCAvIFZFICgt
ZGV2aWNlIGF0aS12Z2EsbW9kZWw9cnYxMDApIDotKQ0KPiANCj4+IE9uIDA0IEF1Z3VzdCAyMDI1
IGF0IDA2OjI2IHBtLCBtYWQgc2thdGVtYW4gPG1hZHNrYXRlbWFuQGdtYWlsLmNvbT4gd3JvdGU6
DQo+Pg0KPj4g77u/DQo+PiBJIGFtIHVzaW5nIHRoZSBSNTgwIGNoaXAgd2hpY2ggaXMgdGhlIFJh
ZGVvbiBYMTk1MCBYVC4NCj4+DQo+PiBUaGUgYm9hcmQgaSBhbSB1c2luZyBpcyBhIFQxMDQyIFBv
d2VyUEMgYmFzZWQgb25lIHdpdGggZTU1MDAgY29yZS4NCj4+DQo+PiBJIGFsc28gbG9zdCB0aGUg
YWJpbGl0eSB0byBzdGFydCBYb3JnIGFuZCB0aGVyZWZvcmUganVzdCBhIGJsYW5rIHNjcmVlbi4N
Cj4+DQo+PiBEYXZlDQo+Pg0KPj4NCj4+DQo+Pg0KPj4NCj4+IE9wIG1hIDQgYXVnIDIwMjUsIDE4
OjA0IHNjaHJlZWYgQ2hyaXN0aWFuIFppZ290emt5IA0KPj4gPGNoemlnb3R6a3lAeGVub3NvZnQu
ZGUgPG1haWx0bzpjaHppZ290emt5QHhlbm9zb2Z0LmRlPj46DQo+Pg0KPj4NCj4+ICAgICBPbiAw
NCBBdWd1c3QgMjAyNSBhdCAwNDo0MiBwbSwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPj4gICAgID4g
T24gU3VuLCBBdWcgMywgMjAyNSBhdCAxMToyOOKAr0FNIENocmlzdGlhbiBaaWdvdHpreQ0KPj4g
ICAgID4gPGNoemlnb3R6a3lAeGVub3NvZnQuZGUgPG1haWx0bzpjaHppZ290emt5QHhlbm9zb2Z0
LmRlPj4gd3JvdGU6DQo+PiAgICAgPj4NCj4+ICAgICA+PiBIZWxsbywNCj4+ICAgICA+Pg0KPj4g
ICAgID4+IEkgaGF2ZSB0aGUgc2FtZSBpc3N1ZSBvbiBhbm90aGVyIG1hY2hpbmUgZWl0aGVyLiBC
bGFuayBzY3JlZW4NCj4+ICAgICBkdXJpbmcgdGhlDQo+PiAgICAgPj4gYm9vdC4gVGhlIFJhZGVv
biBncmFwaGljcyBmcmFtZWJ1ZmZlciBkZXZpY2UgZG9lc24ndCB3b3JrIGFueW1vcmUuDQo+PiAg
ICAgPj4NCj4+ICAgICA+PiBIZXJlIGlzIHRoZSBtb2RpZmVkIGNvZGUgZnJvbSB0aGUgRFJNIHVw
ZGF0ZXMgKGRybS0NCj4+ICAgICBuZXh0LTIwMjUtMDctMzApOg0KPj4gICAgID4+DQo+PiAgICAg
Pj4gLQ0KPj4gICAgID4+IGh0dHBzOi8vd2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90b3J2YWxkcy8NCj4+ICAgICBsaW51eC5naXQvZGlmZi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9mYmRldi5jPw0KPj4gICAgIGlkPTI2MGY2ZjRmZGE5M2M4NDg1Yzgw
Mzc4NjVjOTQxYjQyYjljYmE1ZDIgPGh0dHBzOi8vDQo+PiAgICAgd2ViLmdpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvDQo+PiAgICAgZGlm
Zi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mYmRldi5jPw0KPj4gICAgIGlkPTI2MGY2
ZjRmZGE5M2M4NDg1YzgwMzc4NjVjOTQxYjQyYjljYmE1ZDI+DQo+PiAgICAgPj4gLQ0KPj4gICAg
ID4+IGh0dHBzOi8vd2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy8NCj4+ICAgICBsaW51eC5naXQvZGlmZi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9kcnYuYz8NCj4+ICAgICBpZD0yNjBmNmY0ZmRhOTNjODQ4NWM4MDM3ODY1Yzk0MWI0MmI5
Y2JhNWQyIDxodHRwczovLw0KPj4gICAgIHdlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0Lw0KPj4gICAgIGRpZmYvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmM/DQo+PiAgICAgaWQ9MjYwZjZmNGZkYTkzYzg0ODVjODAz
Nzg2NWM5NDFiNDJiOWNiYTVkMj4NCj4+ICAgICA+DQo+PiAgICAgPiBUaGlzIGNoYW5nZSBqdXN0
IGJ1bXBzIHRoZSBkcml2ZXIgdmVyc2lvbiBpdCBzaG91bGRuJ3QgYWZmZWN0DQo+PiAgICAgdGhl
IGZiZGV2Lg0KPj4gICAgID4NCj4+ICAgICA+PiAtDQo+PiAgICAgPj4gaHR0cHM6Ly93ZWIuZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzLw0KPj4gICAgIGxp
bnV4LmdpdC9kaWZmL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYz8NCj4+
ICAgICBpZD0yNjBmNmY0ZmRhOTNjODQ4NWM4MDM3ODY1Yzk0MWI0MmI5Y2JhNWQyIDxodHRwczov
Lw0KPj4gICAgIHdlYi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0Lw0KPj4gICAgIGRpZmYvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZGlzcGxheS5jPw0KPj4gICAgIGlkPTI2MGY2ZjRmZGE5M2M4NDg1YzgwMzc4NjVjOTQxYjQy
YjljYmE1ZDI+DQo+PiAgICAgPj4gLQ0KPj4gICAgID4+IGh0dHBzOi8vd2ViLmdpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy8NCj4+ICAgICBsaW51eC5naXQv
ZGlmZi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5jPw0KPj4gICAgIGlkPTI2
MGY2ZjRmZGE5M2M4NDg1YzgwMzc4NjVjOTQxYjQyYjljYmE1ZDIgPGh0dHBzOi8vDQo+PiAgICAg
d2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51
eC5naXQvDQo+PiAgICAgZGlmZi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5j
Pw0KPj4gICAgIGlkPTI2MGY2ZjRmZGE5M2M4NDg1YzgwMzc4NjVjOTQxYjQyYjljYmE1ZDI+DQo+
PiAgICAgPg0KPj4gICAgID4gVGhpcyBvbmx5IGFmZmVjdHMgYWNjZWxlcmF0aW9uLCBpdCBzaG91
bGQgbm90IGFmZmVjdCBmYmRldi4NCj4+ICAgICA+DQo+PiAgICAgPiBXaGF0IGNoaXAgYXJlIHlv
dSB1c2luZz/CoCBDYW4geW91IGF0dGFjaCB5b3VyIGZ1bGwgZG1lc2cNCj4+ICAgICBvdXRwdXQ/
wqAgQ2FuDQo+PiAgICAgPiB5b3UgYmlzZWN0P8KgIFRoaXMgY3VsdHJpdCBjb3VsZCBiZSBhIGNv
cmUgZHJtIGNoYW5nZS4NCj4+ICAgICA+DQo+PiAgICAgPiBBbGV4DQo+PiAgICAgPg0KPj4gICAg
ID4+DQo+PiAgICAgPj4gRG8geW91IGhhdmUgYSBwYXRjaCBmb3IgcmV2ZXJ0aW5nIHRoZXNlIG1v
ZGlmaWNhdGlvbnM/IEkgd291bGQNCj4+ICAgICBsaWtlIHRvDQo+PiAgICAgPj4gcmV2ZXJ0IHRo
ZXNlIG1vZGlmaWNhdGlvbnMgZm9yIHRlc3RpbmcuDQo+PiAgICAgPj4NCj4+ICAgICA+PiBUaGFu
a3MgaW4gYWR2YW5jZSwNCj4+ICAgICA+PiBDaHJpc3RpYW4NCj4+ICAgICA+Pg0KPj4gICAgID4+
IE9uIDAzIEF1Z3VzdCAyMDI1IGF0IDE6MzUgcG0sIENocmlzdGlhbiBaaWdvdHpreSB3cm90ZToN
Cj4+ICAgICA+Pj4gSGVsbG8sDQo+PiAgICAgPj4+DQo+PiAgICAgPj4+IFhvcmcgZG9lc24ndCB3
b3JrIGFmdGVyIHRoZSBEUk0gdXBkYXRlcyBkcm0tbmV4dC0yMDI1LTA3LTMwLg0KPj4gICAgID4+
Pg0KPj4gICAgID4+PiBFcnJvciBtZXNzYWdlczoNCj4+ICAgICA+Pj4NCj4+ICAgICA+Pj4gW2Ry
Oi5yYWRlb25fZmJkZXZfcml2ZXJfZmJkZXZfcHJvZV0gKkVSUk9SKiBmYWlsZWQgdG8gaW5pdGlh
bGl6ZQ0KPj4gICAgID4+PiBmcmFtZWJ1ZmZlciAtMjINCj4+ICAgICA+Pj4gcmFkZW9uIDAwMDA6
MDE6MC4wOiBbZHJtXSAqRVJSTyogZmJkZXY6IEZhaWxlZHRvIHNldHVwDQo+PiAgICAgZW11bGF0
b24gKHJldD0tMjIpDQo+PiAgICAgPj4+IGJyZCBtb2R1bGUgbG9hZGVkbQ0KPj4gICAgID4+PiBs
b3A6IG1vZHVsZSBsb2FkZA0KPj4gICAgID4+PiBtcHQzc3MgdmVyc2lvbiA1Mi4xMC4wMC4wMCBs
b2FkZWQNCj4+ICAgICA+Pj4gbnZlIG52bWUwOiBwY2kgZnVjdGlvbiAwMDAyOjA0OjAuMA0KPj4g
ICAgID4+PiBmc2wtc2F0YSBmZmUyMDAwMC5zYXRhOiBTYXRhRlNMIFBsYXRmb3JtL0NTIERyaXZl
ciBpbml0DQo+PiAgICAgPj4+IHNjcyBob3N0MDogc2F0YV9mcw0KPj4gICAgID4+PiB0YTE6IFNB
VEEgbWF4IERNQS8xMzMgaXJxIDY4IHBtLXBvbCAwDQo+PiAgICAgPj4+IDsyMTszOW1mc2wtc2F0
IGZmZTIyMTAwMC5zYXRhIFNhdGEgRlNMIFBsYXRmcm0vQ1NCIERyaXZlciBpaXQNCj4+ICAgICA+
Pj4gYXRhMTogU2lnbmF0dWUgVXBkYXRlIGRldGVjdGQgQCAwIG1zZWNzDQo+PiAgICAgPj4+IHNj
c2lob3N0MTogc2F0YV9mc2xbMG0NCj4+ICAgICA+Pj4gdGEyOiBTQVRBIG1heCBVTUEvMTMzIGly
cSA2OSBsbS1wb2wgMA0KPj4gICAgID4+PiBudm1lIG52bTA6IDQvMC8wIGRlZmF1bC9yZWFkL3Bv
bGwgcXVldXMNCj4+ICAgICA+Pj4gbnZtZTBuMTogcDEgcCBwMyBwNCBwNSBwNiBwN1swbQ0KPj4g
ICAgID4+PiBkcm06LnJhZGVvbl9mYmR2X2RyaXZlcl9mYmRldl9yb2JlXSAqRVJST1IqIGZpbGVk
IHRvIGluaXRpYWx6ZQ0KPj4gICAgID4+PiBmcmFtZWJ1ZmZlciAyMg0KPj4gICAgID4+PiBmc2xf
ZHBhYV9tYWMgZmU0ZTYwMDAuZXRoZXJudDogb2ZfZ2V0X21hY19hZHJlc3MoL3NvY0BmZmUwMDAw
MC8NCj4+ICAgICA+Pj4gZm1hbkA0MDAwMC9ldGhlcm5ldEBlNjAwMCBmYWlsZWQNCj4+ICAgICA+
Pj4gcmFkZW9uIDAwMDowMTowMC4wOiBbZHJdICpFUlJPUiogZmJkZXYgRmFpbGVkIHRvIHNldHUN
Cj4+ICAgICBlbXVsYXRpb24gKHJldC0yMikNCj4+ICAgICA+Pj4gZnNsX2RwYWFfbWEgZmZlNGU2
MDAwLmV0aGVuZXQ6IEZNYW4gTUVNQUNbMG0NCj4+ICAgICA+Pj4gc2xfZHBhYV9tYWMgZmZlZTYw
MDAuZXRoZXJuZXQ6VXNpbmcgcmFuZG9tIE1BIGFkZHJlc3M6IDBlDQo+PiAgICAgPj4+DQo+PiAg
ICAgPj4+IENvdWxkIHlvdSBwbGVhc2UgY2hlY2sgdGhlIGxhdGVzdCBEUk0gdXBkYXRlcz8NCj4+
ICAgICA+Pj4NCj4+ICAgICA+Pj4gVGhhbmtzLA0KPj4gICAgID4+PiBDaHJpc3RpYW4NCj4+ICAg
ICA+Pj4NCj4+ICAgICA+Pg0KPj4NCj4+ICAgICBIZWxsbyBBbGV4LA0KPj4NCj4+ICAgICBUaGFu
a3MgZm9yIHlvdXIgYW5zd2VyLg0KPj4NCj4+ICAgICBJIHVzZSBhIEJBUlRTIGNoaXAgKFJhZGVv
biBIRDY4NzApLiBJIHdvdWxkIGxpa2UgdG8gYmlzZWN0IGJ1dCBJDQo+PiAgICAgZG9uJ3QNCj4+
ICAgICBoYXZlIHRpbWUgZm9yIGl0IGN1cnJlbnRseS4gU29ycnkNCj4+DQo+PiAgICAgVGhlcmUg
YXJlIHNvbWUgb3RoZXIgdXNlciByZXBvcnRzOg0KPj4NCj4+ICAgICAtIGh0dHBzOi8vZm9ydW0u
aHlwZXJpb24tZW50ZXJ0YWlubWVudC5jb20vdmlld3RvcGljLnBocD8NCj4+ICAgICBwPTYwNjA2
I3A2MDYwNiA8aHR0cHM6Ly9mb3J1bS5oeXBlcmlvbi1lbnRlcnRhaW5tZW50LmNvbS8NCj4+ICAg
ICB2aWV3dG9waWMucGhwP3A9NjA2MDYjcDYwNjA2Pg0KPj4gICAgIC0gaHR0cHM6Ly9mb3J1bS5o
eXBlcmlvbi1lbnRlcnRhaW5tZW50LmNvbS92aWV3dG9waWMucGhwPw0KPj4gICAgIHA9NjA1OTUj
cDYwNTk1IDxodHRwczovL2ZvcnVtLmh5cGVyaW9uLWVudGVydGFpbm1lbnQuY29tLw0KPj4gICAg
IHZpZXd0b3BpYy5waHA/cD02MDU5NSNwNjA1OTU+DQo+Pg0KPj4gICAgIFRoZXkgdXNlIG90aGVy
IFJhZGVvbiBncmFwaGljcyBjaGlwcy4NCj4+DQo+PiAgICAgQnVnIHJlcG9ydDogaHR0cHM6Ly9n
aXRodWIuY29tL2Noemlnb3R6a3kva2VybmVscy9pc3N1ZXMvMTUNCj4+ICAgICA8aHR0cHM6Ly9n
aXRodWIuY29tL2Noemlnb3R6a3kva2VybmVscy9pc3N1ZXMvMTU+DQo+Pg0KPj4gICAgIFdoYXQg
ZG8geW91IHRoaW5rIGFib3V0IHRoZSBmb2xsb3dpbmcgY29tbWl0Pw0KPj4NCj4+ICAgICBMaW5r
Og0KPj4gICAgIGh0dHBzOi8vd2ViLmdpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy8NCj4+ICAgICBsaW51eC5naXQvY29tbWl0Lz9pZD0wZTdkNTg3NGZiNmI4
MGM0NGJlM2NmYmNmMWNmMzU2ZTgxZDkxMjMyDQo+PiAgICAgPGh0dHBzOi8vd2ViLmdpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy8NCj4+ICAgICBsaW51eC5n
aXQvY29tbWl0Lz9pZD0wZTdkNTg3NGZiNmI4MGM0NGJlM2NmYmNmMWNmMzU2ZTgxZDkxMjMyPg0K
Pj4NCj4+ICAgICBASHlwZXgNCj4+ICAgICBDb3VsZCB5b3UgcGxlYXNlIGF0dGFjaCB5b3VyIGZ1
bGwgZG1lc2cgb3V0cHV0Pw0KPj4NCj4+ICAgICBUaGFua3MsDQo+PiAgICAgQ2hyaXN0aWFuDQo+
Pg0KDQpEb2VzIGFwcGx5aW5nIA0KaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Nv
bW1pdC85MDdhN2EyZTViZjQwYzZhMzU5YjJmNmNjNTNkNmZkY2EwNDAwOWUwIA0KaGVscD8NCg==

