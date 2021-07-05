Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E1D3BC3BE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 23:41:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJfJW0kgCz3bVN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 07:41:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OPWzZU+x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.212.81; helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=nirmoy.das@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OPWzZU+x; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2081.outbound.protection.outlook.com [40.107.212.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJJhY3V4Tz2yNT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jul 2021 18:27:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUDZ9eEwPmwQvL4R5POuORQpbhmrVx+JYYZssv4ydP0rPHO2NEND/Edi0z6NS2S5fpnb4yijcWPre9vTERPpkGZF/FeBTVLS9SnkPR1oQ3dZrWhUy0/KbXwlvUrEVRGbMrMElV6oUEQ6pG0c62by6ndiItEU8dJ20mfHkQDfhl5QWTuAgOFdnTXD7n8Wgs3+gKIDGwHZRCEyY4SBgaGtp80XA+MUDm11uRKpABp9TjUL13bn0UdpjjXKP18gwKf4AfuaHYJRRYvN7akvNX2w7rzT0XqXte7vPnKSmultQv8ljWp+ESUqbTPhh2f2w52G506xT1IcEl2h4CVoTy7QdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qz0ul405wwIJETEAD/SlZxMCgc/+w8l+T919qBOqyjo=;
 b=no74D811IjLEfIuEEL67t3yNzqiurEfZxrrKVdCOeKUUPbjTaNOHF5cYSPMdg2YtDunORtxggS//WXjEcTrJ1vucfx1p1Rg5dwlvsqRGzcWEDhHfmaIR+hG9plC2Y8E5qGhyHQEF36MGEnsvacRIQHC0uMdk0BuSkUIWtLc+hwzXtDKtgfRDvjihQiLYtT7hXsnJmCxRUutvugy6CTS6vCYuj30otf0d4pHKhXQnlYq0LbvKCVpPPlD3o2kH5aPD4RAe7hpLIDAkexgMKWwJMoIF3orwBp//GtQNDFmeCNKpUW1dHYoRuN5EDFsuPGP59BddC8EIBUKrirTmSoB7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qz0ul405wwIJETEAD/SlZxMCgc/+w8l+T919qBOqyjo=;
 b=OPWzZU+xV3H6RfjBzdYREkdf+hmq+Rxf+OLeDl6uogYHNS4cEBc454Oh/rs+qJL2WyKnbqgjMjzgx0nGB3zEqDwjZgK9UFEJ99gpRrkAjSDD1sUk8lUiTZvxKfd82mO8XFQcj5+s/P6hf5t8oGi2k2b3eDdW5Yvu/veidKAq8a8=
Authentication-Results: xenosoft.de; dkim=none (message not signed)
 header.d=none;xenosoft.de; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5278.namprd12.prod.outlook.com (2603:10b6:5:39e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Mon, 5 Jul
 2021 08:27:02 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::fde0:6f07:7dfc:8097]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::fde0:6f07:7dfc:8097%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 08:27:01 +0000
Subject: Re: Xorg doesn't work anymore after the latest DRM updates
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210509224926.GA31035@embeddedor>
 <CADnq5_OWk+rXK5xrwu0YOMVC45WyQgFQBTUNkcF8oO3ucp+=XQ@mail.gmail.com>
 <ba5f2a73-58e8-6b3e-4048-bb19f238be51@embeddedor.com>
 <4e0a3130-4c20-aa8a-f32a-6c3f0d9cd6f8@xenosoft.de>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <345042b3-7b96-63d9-d4a5-f31c4441ddaf@amd.com>
Date: Mon, 5 Jul 2021 10:26:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <4e0a3130-4c20-aa8a-f32a-6c3f0d9cd6f8@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2003:c5:8f21:3100:7ccf:151e:87da:2d70]
X-ClientProxiedBy: PR0P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::34) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f21:3100:7ccf:151e:87da:2d70]
 (2003:c5:8f21:3100:7ccf:151e:87da:2d70) by
 PR0P264CA0118.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 08:26:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86fad004-2deb-48e8-0897-08d93f8ea9c2
X-MS-TrafficTypeDiagnostic: DM4PR12MB5278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB527838AB82A71037DDBDC4D58B1C9@DM4PR12MB5278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:48;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 05/z31eNt3LqVa6p9a3UhB/7bODyF/fuMPGw79QLJyfojIZunVxcFcZabK/wkPpOnyHLKaWb3fq063m93+iXCkmIRFJu0+c2sRr3jtty5vGKDI7ttsfthUs4M+3bYjpgDpkssNPIE6PWrBeW9puiwUcpan0J/8sAhKpqrcvKSZd1CLgxpH0aI5i1ZhyH6oRZY8gr9/oWYGhS+ZLBF3/VIDv2A3igJRPcKPpUDS4u3EtVLXZokJ/98OXwkAyUFUip4laXkQ37S/OL0mEtn5000FZCRZYaUq3CH9AlC3XHoJEJ8qd2EgTwTmOCxvuqZHlXt01FfuL84JJOQgaP1ZpdeyzT7XSqmVYb688PMzohYc6+ZyRJcj9sgUFVBAX5ruIhk+0LOYqCtUsHrnlGk2QvcNd5Xnsud+7hkaVFkpBubtPBc1OPMDYmzUApHRNNNOIo5d0GECOprXJc4uNbaEq+wKzeIHRFpjK8jqy2j7lrixoVSJJDjtu5m2LoDHtyMF1Kg0Rk6KvyWojhfEvRhIlk6My5rOncohm5+0Xjl/Ed8/HHg+RQuvAMRcVpD4U/RdmVfZ134u1BBmsxb8J6HHuj9ox3qij8OD93FuAmVYWdWorPGK+4Wkh0f16qk/X25eiW9aQ1NIcIoA+C1YmkQIQRjQemJV7x0wo8llUaXqjKpaSrVRMisWATi1eiAOpEzXNxARMjkuB5NN6kdYkmizvG/4IlkVlBcdUcgGLcbmNkZsKVG9XtZkKJ7w8ZKr0uvdWbkoKEHElXJA1+N6iPYYtnlLG67WKyL0QT6UYwB4K6fadHKFwQCV/ASFeAUw2tMeg47wiEOat9FRWCxjMlwK2BsDjqGtGHN3biJoppzYRu01Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(6486002)(31696002)(16526019)(186003)(8936002)(53546011)(2616005)(83380400001)(31686004)(86362001)(36756003)(8676002)(5660300002)(478600001)(54906003)(15650500001)(45080400002)(966005)(66946007)(38100700002)(6636002)(52116002)(66556008)(66476007)(4326008)(6666004)(2906002)(110136005)(16799955002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG1CYmJqdkhUb2F4VEd3cWl3ZnRVZFdIMXZyNy82UmVYTm1Kcit4QXRvY1lO?=
 =?utf-8?B?M0JnRXU1N0Q1dnBhK0h4VWl1d3JOV0lqRUs5QTAvMW5kZzJJaW9yMldWTTZR?=
 =?utf-8?B?b0IybUYwRDdCZjBNc2F2OEZoN2ZURTJ2VlFtUHdGZ2ViNFgwTWdOd0p4RmdU?=
 =?utf-8?B?bHdVaXdzd0lCWmozdFRBN0tucXhFWVljK3F5L0NxWDZ0Z2ZwQ0xqZHR0TFAr?=
 =?utf-8?B?dWpDY3pNcjhNZWVGOXZrMytYaEpzek5iMTJrYWJJdVhMRXkzT3R3V0xLNW9G?=
 =?utf-8?B?SzZ0ZXB5cElrKy8rV3BUbFlFaXEzMVdZcGdhSldudXl0RUQ0Z3hnRERkYnEx?=
 =?utf-8?B?Q0x2b3F3L1k3U2NERDBZS0NlRTgzNFJXWVlMQ3djTUlZRExTK2lJQmdvRWZk?=
 =?utf-8?B?RnI2SWFmVldWU1RaZm00cVg5ZytzMU1jUUVQMTVpNCthaWhVR1JBOVovTXFH?=
 =?utf-8?B?SGlsWSsyQzBHWmlEV0NqZ2w2V0FMeng0R3ZEVHhkbWdEM25qRTNma3pUZHQ2?=
 =?utf-8?B?Z2o3QjRabm83QzN2bW1CaGpwWDg1WEZCeWlQV0toaEYyV0tuZUtvaDFMY0c2?=
 =?utf-8?B?Q2p4ejUxMEJRcjBSUTJNT2Q2SzQreTlBU3JPTFEzS2hJV0lZT2N6QWlCWkpI?=
 =?utf-8?B?UTVHWmI4bDFnUFNocDYwdnI0bDM4Sk9EOGR1M0Rud1B4VVZUV245WTk5eFhm?=
 =?utf-8?B?TExHUUdJNzc1MUdWc3pLODJmTC84ZmllcUJNZ0txMUg1SEJzamJOanZ1SkZM?=
 =?utf-8?B?cDQvRi9ZdWMxN0wydGdJbGcvczRoYXEzd01wRkF3TUtsQ0dJclpPTGg0TExz?=
 =?utf-8?B?dTZlVVR6azBSQjJMVHdjMWRndDRTV1gxOXFid291ajg1RnMrc2h2bnRqaVo3?=
 =?utf-8?B?VzRIekV0SDRUZjd5VFIwVnZZRTQ1Y3MzQ2lYWEpjVGRWMy9PdE0yc2Y4NTFB?=
 =?utf-8?B?eWhvWWNRM1FJQTc5djJxR2dSQkVDb28zMXVKVjJnRjRtMkNvY1RJUCsvYWJa?=
 =?utf-8?B?THE0Z3k2anhSQXBSaUhVU0gzY3ZRM0lJY2lRTCtqenRFMTdkbDE1THlIOXBk?=
 =?utf-8?B?TTNXbHNaVnZEWVFtTG5DMEEwMmlBUVJTMWw1NUpPUENUSjFOSVpPNXk5RXJr?=
 =?utf-8?B?WkJ6NHNyZWljeHoxSm5ySlZCczg2Q2V0Wnh3elk4ZHY3Q1BmY1pranlvUFA0?=
 =?utf-8?B?R21xL0JOT1RnalVuSGwxNENEU1RMRUdub0xsTEdud2VDUld1a2JxcVhpK0Vk?=
 =?utf-8?B?RUFDS1lCQmlLY0F2T1pWTWszMU14VnRhTDBlM0RWam42VlRhUUV0Z0pNWG1z?=
 =?utf-8?B?S3gvNVpZcFR1ekVMU2xuQm1JN2dNRllPdm5naWI0dXB5djBUWi9NcmRQNXFW?=
 =?utf-8?B?SXArTXlZUXZxSG4rTUtGbU9ORDZrWjhNUUtWMHZkaE16OEpVWmJRZ21LUUhh?=
 =?utf-8?B?RmRiVk9DdlVtSXpIZ2lUQUVWNWxjNmxjViswcFM0M1crd21XWCsvUGdtUUV5?=
 =?utf-8?B?VXdkbG1MeE9mSTRSS1M1eFl0WndubGRPRzMxVFFnL25RYmVvU0NYcnBrUU9w?=
 =?utf-8?B?ZEZDMmxSRmNFOTVuZmNNaXlTL0o2TXJ3UGVuWkh3OTJ3aG9ORmVoL3lSVDAv?=
 =?utf-8?B?N3RsZjMyTGJRbTlCSVhiVGFRTTQxR0l0RkpXUjdaeDNBNklFYUN3c3o0N1M3?=
 =?utf-8?B?YWFUcm5pY2RSU24wbFd2eVlWTW1ya1VEeEZhMUVzNkdTaG9LZ2ZrNTNESnBQ?=
 =?utf-8?B?eVVFVkoxRllpWDQxT24xQ3prM0dnKzU5R2NDSW9XMW92OFM4VlFnRS9JU3NY?=
 =?utf-8?B?WmZYclljS2VtZEc1WDRSeWNadDJjckNlaFppcTVoVUhuRnpZbUpaVWdlbUg2?=
 =?utf-8?Q?WCCpO45cEJh9d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fad004-2deb-48e8-0897-08d93f8ea9c2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 08:27:01.7618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hj/IEdE/yHKe2O3ZL/zfdlQ/eEcGoEBQ0jIbKYU3mxNvfeAuIcBe81/eLFv42qpiZqI8F/RIfHyK8ERwNR4kZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5278
X-Mailman-Approved-At: Tue, 06 Jul 2021 07:40:41 +1000
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christian,


This issue looks similar to the one Mikel Rychliski fixed recently  : 
https://patchwork.freedesktop.org/patch/440791. Let us know if this helps.


Regards,

Nirmoy

On 7/3/2021 9:30 AM, Christian Zigotzky wrote:
> Hi All,
>
> Xorg doesn't work anymore after the latest DRM updates. [1]
>
> Error messages:
>
> Jul 03 08:54:51 Fienix systemd[1]: Starting Light Display Manager...
> Jul 03 08:54:51 Fienix systemd[1]: Started Light Display Manager.
> Jul 03 08:54:51 Fienix kernel: BUG: Kernel NULL pointer dereference on 
> read at 0x00000010
> Jul 03 08:54:51 Fienix kernel: Faulting instruction address: 
> 0xc000000000630750
> Jul 03 08:54:51 Fienix kernel: Oops: Kernel access of bad area, sig: 
> 11 [#1]
> Jul 03 08:54:51 Fienix kernel: BE PAGE_SIZE=4K PREEMPT SMP NR_CPUS=4 
> CoreNet Generic
> Jul 03 08:54:51 Fienix kernel: Modules linked in: algif_skcipher bnep 
> tuner_simple tuner_types tea5767 tuner tda7432 tvaudio msp3400 bttv 
> tea575x tveeprom videobuf_dma_sg videobuf_core rc_core videodev mc 
> btusb btrtl btbcm btintel bluetooth ecdh_generic ecc uio_pdrv_genirq uio
> Jul 03 08:54:51 Fienix kernel: CPU: 3 PID: 4300 Comm: Xorg.wrap Not 
> tainted 5.14.0-a3_A-EON_X5000-07637-g3dbdb38e2869-dirty #1
> Jul 03 08:54:51 Fienix kernel: NIP:  c000000000630750 LR: 
> c00000000060fedc CTR: c000000000630728
> Jul 03 08:54:51 Fienix kernel: REGS: c00000008d903470 TRAP: 0300 Not 
> tainted  (5.14.0-a3_A-EON_X5000-07637-g3dbdb38e2869-dirty)
> Jul 03 08:54:51 Fienix kernel: MSR:  0000000080029002 <CE,EE,ME>  CR: 
> 20000222  XER: 20000000
> Jul 03 08:54:51 Fienix kernel: DEAR: 0000000000000010 ESR: 
> 0000000000000000 IRQMASK: 0
>                                GPR00: c00000000060fedc 
> c00000008d903710 c00000000190c400 c000000085d59c00
>                                GPR04: c00000008d9035b8 
> ffffffffffffffff c0000000870a4900 c000000085b62d00
>                                GPR08: 000000000000000f 
> 0000000000000000 c000000000630728 0000000000000003
>                                GPR12: 0000000020000222 
> c00000003fffeac0 00000000ffe51070 000000000086007c
>                                GPR16: 0000000000862820 
> 00000000ffb7ec68 0000000000000000 00000000ffffffff
>                                GPR20: 00000000c04064a0 
> 0000000000450088 00000000ffca79e4 5deadbeef0000122
>                                GPR24: 5deadbeef0000100 
> 0000000000000000 c0000000876028f0 c000000080bd4000
>                                GPR28: c000000087603c48 
> c000000085d59d78 c000000085d59c00 c000000085d59c78
> Jul 03 08:54:51 Fienix kernel: NIP [c000000000630750] 
> .radeon_ttm_bo_destroy+0x28/0xc0
> Jul 03 08:54:51 Fienix kernel: LR [c00000000060fedc] 
> .ttm_bo_put+0x2ec/0x344
> Jul 03 08:54:51 Fienix kernel: Call Trace:
> Jul 03 08:54:51 Fienix kernel: [c00000008d903710] [c00000000060fbe4] 
> .ttm_bo_cleanup_memtype_use+0x54/0x60 (unreliable)
> Jul 03 08:54:51 Fienix kernel: [c00000008d903790] [c00000000060fedc] 
> .ttm_bo_put+0x2ec/0x344
> Jul 03 08:54:51 Fienix kernel: [c00000008d903820] [c000000000630b50] 
> .radeon_bo_unref+0x28/0x3c
> Jul 03 08:54:51 Fienix kernel: [c00000008d9038a0] [c0000000006d1f6c] 
> .radeon_vm_fini+0x1b0/0x1b8
> Jul 03 08:54:51 Fienix kernel: [c00000008d903940] [c000000000618e38] 
> .radeon_driver_postclose_kms+0x128/0x178
> Jul 03 08:54:51 Fienix kernel: [c00000008d9039e0] [c0000000005deb14] 
> .drm_file_free+0x1d8/0x278
> Jul 03 08:54:51 Fienix kernel: [c00000008d903aa0] [c0000000005def00] 
> .drm_release+0x64/0xc8
> Jul 03 08:54:51 Fienix kernel: [c00000008d903b30] [c00000000017636c] 
> .__fput+0x11c/0x25c
> Jul 03 08:54:51 Fienix kernel: [c00000008d903bd0] [c00000000008b1e8] 
> .task_work_run+0xa4/0xbc
> Jul 03 08:54:51 Fienix kernel: [c00000008d903c70] [c000000000004bf4] 
> .do_notify_resume+0x144/0x2f0
> Jul 03 08:54:51 Fienix kernel: [c00000008d903d70] [c00000000000b380] 
> .syscall_exit_prepare+0x110/0x130
> Jul 03 08:54:51 Fienix kernel: [c00000008d903e10] [c000000000000688] 
> system_call_common+0x100/0x1fc
> Jul 03 08:54:51 Fienix kernel: --- interrupt: c00 at 0x3f4f58
> Jul 03 08:54:51 Fienix kernel: NIP:  00000000003f4f58 LR: 
> 00000000003f4f2c CTR: 0000000000000000
> Jul 03 08:54:51 Fienix kernel: REGS: c00000008d903e80 TRAP: 0c00 Not 
> tainted  (5.14.0-a3_A-EON_X5000-07637-g3dbdb38e2869-dirty)
> Jul 03 08:54:51 Fienix kernel: MSR:  000000000002d002 <CE,EE,PR,ME>  
> CR: 20000420  XER: 00000000
> Jul 03 08:54:51 Fienix kernel: IRQMASK: 0
>                                GPR00: 0000000000000006 
> 00000000ffca66a0 00000000f798a310 0000000000000000
>                                GPR04: 0000000000000000 
> 0000000000000000 0000000000000000 0000000000000000
>                                GPR08: 0000000000000000 
> 0000000000000000 0000000000000000 0000000000000000
>                                GPR12: 0000000000000000 
> 000000000044fff4 00000000ffe51070 000000000086007c
>                                GPR16: 0000000000862820 
> 00000000ffb7ec68 0000000000000000 00000000ffffffff
>                                GPR20: 00000000c04064a0 
> 0000000000450088 00000000ffca79e4 00000000004317ac
>                                GPR24: 00000000004317b8 
> 00000000ffca66d0 0000000000000001 00000000ffca673c
>                                GPR28: 0000000000000001 
> 0000000000000000 000000000041cff4 0000000000000003
> Jul 03 08:54:51 Fienix kernel: NIP [00000000003f4f58] 0x3f4f58
> Jul 03 08:54:51 Fienix kernel: LR [00000000003f4f2c] 0x3f4f2c
> Jul 03 08:54:51 Fienix kernel: --- interrupt: c00
> Jul 03 08:54:51 Fienix kernel: Instruction dump:
> Jul 03 08:54:51 Fienix kernel: 40c2fff4 4e800020 7c0802a6 fbc1fff0 
> f8010010 3bc3ff88 fbe1fff8 38a0ffff
> Jul 03 08:54:51 Fienix kernel: f821ff81 7c7f1b78 e9230168 7fc3f378 
> <80890010> 4bffff51 e87f0208 38631df8
> Jul 03 08:54:51 Fienix kernel: ---[ end trace ddf73d2d70058380 ]---
> Jul 03 08:54:51 Fienix kernel:
> Jul 03 08:54:51 Fienix systemd[1]: lightdm.service: Main process 
> exited, code=exited, status=1/FAILURE
> Jul 03 08:54:51 Fienix systemd[1]: lightdm.service: Failed with result 
> 'exit-code'.
> Jul 03 08:54:51 Fienix avahi-daemon[3857]: Registering new address 
> record for 2a02:8109:89c0:ebfc:d372:f06c:9247:7d54 on enP4096p4s4.*.
> Jul 03 08:54:51 Fienix systemd[1]: lightdm.service: Scheduled restart 
> job, restart counter is at 1.
> Jul 03 08:54:51 Fienix systemd[1]: Stopped Light Display Manager.
>
> ----
> Systems: A-EON AmigaOne X1000 and X5000 with Radeon HD6970 graphics 
> cards. [2] [3] [4]
>
> The biggest problem is, that I don't have time for bisecting and 
> fixing this issue.
>
> Cheers,
> Christian
>
> [1] 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fid%3De058a84bfddc42ba356a2316f2cf1141974625c9&amp;data=04%7C01%7Cnirmoy.das%40amd.com%7C768265d3eac043d86e8408d93df546b5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637608946231764861%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=HuEHizNvWrFmdqsQRErO1ie6Ora83sceTEphzovMzWI%3D&amp;reserved=0
> [2] 
> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwiki.amiga.org%2Findex.php%3Ftitle%3DX5000&amp;data=04%7C01%7Cnirmoy.das%40amd.com%7C768265d3eac043d86e8408d93df546b5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637608946231774816%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=bQ9Gm%2BVyEldUEj1hhCj4HPHlb799E3d3MRkUJl0gYzw%3D&amp;reserved=0
> [3] 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FAmigaOne_X1000&amp;data=04%7C01%7Cnirmoy.das%40amd.com%7C768265d3eac043d86e8408d93df546b5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637608946231774816%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=iDPYGp1%2B7N5DUtNX0rcDqA9MkQPjw1EfFGW%2BD2aqc3g%3D&amp;reserved=0
> [4] 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fforum.hyperion-entertainment.com%2Fviewtopic.php%3Ff%3D58%26t%3D4378&amp;data=04%7C01%7Cnirmoy.das%40amd.com%7C768265d3eac043d86e8408d93df546b5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637608946231774816%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=ti%2FY3avH3zJUjJ5852lLYUtirhzuKqqmW1zwUcp2u0A%3D&amp;reserved=0
