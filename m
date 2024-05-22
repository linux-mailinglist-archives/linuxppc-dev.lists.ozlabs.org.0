Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0EF8CC1FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 15:21:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Xf1w9Lzv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VksFq3zy5z78rY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 23:14:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Xf1w9Lzv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:240a::600; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VksF44ZkDz3vZX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 23:13:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MH4+h5Mvkb0KX0V20DmWA3bFj0CW9Swuxx6V6tSCr9VW7TurGQJ/NqPzdDSLfEJONHLnz7WD7JlrhVxQ1ZBxyYoLZ9rTgUll3fztlW05CKA7RaoUq/ilgAn4aDuOr0qIzJFD5cwXWimIU6aRbNinyuoMxp29APw8vjyIpskwHxR7rXyR8I0yg38f/SkTsMUu9gdxTfkfe5GgKvJLgoTgOS+rPllve/Z8Oh2SM2oNEWr+vRhl13T8JtEQrMxGdljm9z+vcHtdJPRpnfDYOYAIeeiB+JWIbOYjv5pGNAkUX/wEyv0l0BWqqjEnwAaJgqWQJDmy0j3fN1lmadVJaadAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=126vmUXEHnr6d3eZPbJF1N47h9bf2Gg/6iKrDl6p4gk=;
 b=k10Oxnx5lolhXIYKBtHbvmyNHWMb43k9Su1Im5tG+8Icx9Nlftg5aqvxf4SJ7gVEex4kTWb6mE2giNRy3niIVB/Z0AYNBS7Ud6m/DlVXwoMxcUMSwnC8iCfRY8aEH2iAEjk5nH5Yj+A0KTZ1HdGex4XBGz0TF3wuSdDmJnbOq7R1BzqxUTyVgfkJtvG+cegd06S0gyta+SEOJLCj02OpdswS/jSw1eqdKqd9i+gpssbIfH5GhtEhVosSVACiRfW7uX0puhntxh1ZHpHPOmBY99wlptsKJOeHNCve6g/roZ8Qd7kY967NKWdk9IHGwThLvcaBzmooR/fmG8vr3yuM9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=126vmUXEHnr6d3eZPbJF1N47h9bf2Gg/6iKrDl6p4gk=;
 b=Xf1w9LzvTK5Ddu2GywbtGiQ0f2qMdQlj2CQUsHj2+LJ9iO2FLT4IDVzKrUuDmH7HzwtNptZLrvunEgZDRkNfv6D8EqrodiD+d7/SBOcJamb2DXcFspfa9TWh6drvKXrtJkg2eRVP9+u59rn9n++Qt1bB9in2JpbqETUAYH/7SWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 by PH0PR12MB7011.namprd12.prod.outlook.com (2603:10b6:510:21c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.38; Wed, 22 May
 2024 13:13:06 +0000
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c15b:b99d:8d9e:fb25]) by SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c15b:b99d:8d9e:fb25%6]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 13:13:06 +0000
Message-ID: <4a090901-9705-40aa-ac3d-d67c52660f22@amd.com>
Date: Wed, 22 May 2024 18:42:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>,
 "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>
References: <87wmo4o3r4.ffs@tglx>
From: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
In-Reply-To: <87wmo4o3r4.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0137.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::17) To SJ1PR12MB6124.namprd12.prod.outlook.com
 (2603:10b6:a03:459::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6124:EE_|PH0PR12MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a7ecb2-75c7-46f6-e9b0-08dc7a60eb37
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015|7416005;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?RlQ5Ym1xS3NTU2RWS3VKZkt6V2JQYWpxR2IxY08rZm4vUW5WcWpiRm8rdnlo?=
 =?utf-8?B?OEt2Ti9FT1NhLzRvcWUzWmxHRU5PVTZnZFlwZXRvazVQUG51Tk8yU2FrNk9I?=
 =?utf-8?B?bWl0VlpUOXd6NVBWdTZTMkhuSk12cVlhTHRjUWFtbVFBVmlCa1VONnRQbUpW?=
 =?utf-8?B?Z0ErcU1CRFR4SmZScGlKdkdRdlZGc09JVWkvUTlsRFFzcSswNGFJSW9Ka3hE?=
 =?utf-8?B?RmEwME9LTWxGVUpBY0pwRFlLbEpHc3ludzdVQ2wwS0tQY0hoV3B3WjNzTVVv?=
 =?utf-8?B?bUVzMFNLaGxwelkyZXZwMkJtYytMLzRJTFRFd0NKUVQwUFBqVmxuVXV2ZXY3?=
 =?utf-8?B?Vi9HRGM4T1dpc2N2RUFvb2hJSFNnZ2tCWXlZeDhDNWoyRU5ENFN6czZlMjZa?=
 =?utf-8?B?S1RWL0pXdTlXQ2FieU13eU1rb0tyYVA3Y0JvRWluZ0h2RmxtMlZWS2lYdjF6?=
 =?utf-8?B?MHhBM211Tlh3ZVloOGxkaytxaTZWbkRpY0hseW5pUUk4MUxTTStnQ3BGL1F0?=
 =?utf-8?B?M1lvMmo4c2Z4Ym5mUGFscC92YWUvRU1JUlpuakdPa1JXdVQ0RjczRWJ6cXB6?=
 =?utf-8?B?ckxNMG9xRGVQSmkyOWNEVFZCRUwxTUU1Z1QwVHMreHZDb1VPeEVuVklrK2Zk?=
 =?utf-8?B?djVzWU9DdXh0NWNsSE5SSExsTHM1ZlY5WUxPdWI4cndScEYrdHlqcVREYjFm?=
 =?utf-8?B?bklLL2tzY2JkNDVCb3ZNWDE2ZTNhbXV0aXp6dFJBY1F0RjhOSUZkQVZjbkR4?=
 =?utf-8?B?YSsyRGk5L3dhNy9LbUVKUGc4YUNrMWdUSEhqK1Q5MlkxVFJUd2pwaWFCZUtU?=
 =?utf-8?B?d0Q3azRhWHpVaG1OUlYrRHJnSGdSVmNpWWFxaURnR09sZk1lODR6djZlaWFj?=
 =?utf-8?B?YW43b1dFV2E4djJ4V1RNTjBWNTZxMml0VU5Wc1daamJUdjF1ZzQ2TXBMbHdU?=
 =?utf-8?B?LzVpV3JzU3BjcXNQd2g0VUdodDdBU2ZORUkwZmxUcmlnTHJ1SzVLNzZ5SGZr?=
 =?utf-8?B?SzQxUzdWdTRzZG5WSGpiMWRIbnFSbGFHbzdpY09ONStTNSs1TXkzK3oxTG4y?=
 =?utf-8?B?cmUvd2VudzVId1ZSbElic3pHbnFGVk8zSVJnd0doUlJvZnh3SjNOZllrY0dj?=
 =?utf-8?B?VGI1U0VoYXBzL3R0V1I5aXNpQlRmSWJEVXAzNGY5eEx3VnFRUDhTdlljb2wr?=
 =?utf-8?B?eEFCS2Q1WkE3bEFoQTVXSWZrNjd5VVh4Zk01SEI5Sm5sNDJrdDBrTms2WVYv?=
 =?utf-8?B?SUxuR1owS3VVOE1BREUzYkJtakd2VnZPalhicXdKNzF2QUpmUmt1WVdtTE5X?=
 =?utf-8?B?UjlWTTNqbzVobGVHK2Z6QmkyeVNRT0lEU2RzZm00S0pxNm11NHYzTzFGV21h?=
 =?utf-8?B?dWhZL0licHM1bVJ2b1l2enZ4UE5lenR3MnBuT0FteDhtMUNDR2VpQ3pPNFRJ?=
 =?utf-8?B?RGVrZVd5Qkd0cVFQeGZpUVlMR1FCYzcrejNUNEljVkwxSTVSTmpVdkNNVm5Z?=
 =?utf-8?B?TG9Vc0JFd2d2TEJYTGtXam1TcnppeVhHUXZFTWxhNjg1d25KRFh0ZEZyRk13?=
 =?utf-8?B?VEsrNHF6QitEMUJaRURpcUI5RWFWNEhOd29JV1NoYVFabTJsYy9sZE1oTXc3?=
 =?utf-8?Q?jsJPM2298J+9XNkN3/4BY92Zl4Yr+pA9ubuP+TZsDNdg=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6124.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(7416005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?RllPTjN0V0gvc1diYVRpL1hTdjE5akRKSSt6ZW5MdUtCNTdKdzNYeGQzNCtl?=
 =?utf-8?B?N1VEOWIzOVl1SDB2ckY0R3llS2xlbGNEa2R2L0xNb3REb1JnaUFyNVZiVWlQ?=
 =?utf-8?B?d3AvZ1ZvMG0xVVlvYmNMNkhlQlRMOXU2M0tIMVIwaUFuRThQZHY0Z1d6NnpO?=
 =?utf-8?B?WThGTVRtaXhGSjZXTWptT3psV1o4OXNHaVQ4M1Z0dHY5ZnZzWGZTb21YSW5z?=
 =?utf-8?B?S0VMWU1ZVm1UWjE2MjZWRGtWZG91dXZtaVlkVXl2VFZaL016ZzhGbHYwNnRU?=
 =?utf-8?B?bGM3VTFWU29HYWhaQXU5Mjd0Y1NCYmN3d284OHFJeXJDcW1kTVpYVForaDZH?=
 =?utf-8?B?Ri9pWno5aSt0cm1mcWlpQ2k0UDMvN3UyTGlpTTJzanh3WnpWcUJ4Mkl4dmRS?=
 =?utf-8?B?T2F2RWVkeGREeHhyRFhaYjhNQ1lpRi9YcStMMGdHOTRQUnRKcG1xNldmTXpS?=
 =?utf-8?B?dVNxSGwxVlF5Szh4OUJWcnhGREM2cUZtaWhKRUVnR2pJVjdHS3dmYmc2RUlu?=
 =?utf-8?B?TWc3WkdwUml1MlkyMkR4R3N2NHBVeGJxelZHbmVkclhuOHNoK2pxRnFjZ0Rz?=
 =?utf-8?B?dTc1ek5VZkhVR0c5QnZMYVQrZm9aMitnQkhzWHZsM2JVMmNDRys2UjBwZHBN?=
 =?utf-8?B?WEUrKzZ2YmdNVGxTcklGcVhKd2h6eDdSREg4TVRPSnlyRDc1MllYck8zYnpK?=
 =?utf-8?B?c1hkbXI3UHF6Tjd1KzUrYm55bGNrcjRYY0sxRUVRNnFnaUdtcXNRdG1xM1RW?=
 =?utf-8?B?RTRHZjMxWjd2aSt5cHk5N3Z2dmt2M2Z5a1hEc1dKRW1ZbjliYUNRNUpzQitS?=
 =?utf-8?B?VUFFR3ZxajBzY3JJd2FIQ1loZUVPZ3NTVGRCR1Rvb2NSK1VIMGJZSU5waFYz?=
 =?utf-8?B?MXFQOFhZczBDZ21HOXVmaVVKTVo5WGtvb2NnaG9BVEY1ektwT0RpNklhNTlJ?=
 =?utf-8?B?RkJCclh1QWsxeEJyU21ZeDhqMFk1TTZiT0Y3RFFzYy81MmxERnRtcmZoSEJx?=
 =?utf-8?B?eDdtekFZaGpKcGtqelk1OUFvWTllMW9IWk9qalMzaDMyeWdWNTJCbHhvTzA3?=
 =?utf-8?B?OXZyYVRNaTBMY0xkSHBYQlp2ek9oZ0htNG5PUDlUVDVaUnAyYW9TR3pHdHlJ?=
 =?utf-8?B?QlZMUmp4aE5YSXVPYndLenRSNUJSY1d2ZXYvWEYrOGhyWWEwdDBGUEhuNXRP?=
 =?utf-8?B?TXJydkhMRUV5bmdmVFQ5bG0xT1ZpRWtMa1NObDk4aXQzWUp2RDNIdnlxNGx5?=
 =?utf-8?B?eEI2RS9wWXh4MmtlRkpQRW8yeEt6WEV4MDk2MExVWW44TzFpL05aL2Q3VHVr?=
 =?utf-8?B?QmdKRThrZXdLN2dCMnlLMkNBSXQzMFVnZ0JsUGRBK3BsWm9mQVRwcEpvZllK?=
 =?utf-8?B?Nk1NbmtVTzN0Zm4vbnBHSGIzTGVSUDI0WE9Sc0pUaHBvQnlSalAyVjNqcXJK?=
 =?utf-8?B?L1NpYTdZaFJZbFlnV0srQ3F0SGlHMEwwd3VLMEFnQ1JMb1dCNU5zbmdEanE4?=
 =?utf-8?B?NVpJMW5ZdlZEbmdWMUZmSHlYV1JXSklCVFM1cXRLMy9BeDRNMUFZQmxXbUl5?=
 =?utf-8?B?bDVQNkRzb3NwUmo1K3AwSzVFNzc4SzV0SGFVY0psU2JBOERvYjBSKzVOaDlo?=
 =?utf-8?B?WktibElxczkvUEltOFFUUjZiVGRxZzVld0Y0K1lqWlRsYTk3cnJmRzRkUGlh?=
 =?utf-8?B?YjFtd0NEc3lHZ1d0K01hOFZjbXRJeHRYSUt6OThXR0MyTkJDeTdFNWdvQkdO?=
 =?utf-8?B?VzBjNHowck1tOXhXZHk3Z1lUUjdTK0RERVBsRmZKOTNwV2UraDFuazIrZW8r?=
 =?utf-8?B?OTlNMmRydjFNTnh1dTMzSGk4ang3K3lDZVZYWUszTStMeVcxME1LditqUUJR?=
 =?utf-8?B?R0dNc0FLYmh0Z09BZ0NtdGxKNWJnSWtuQVhyTXErK2VlU3JjL09ERTN4c3Za?=
 =?utf-8?B?WTNQNkpGaXNFVWpkc2lDYUpRa3VvWStVZGVEREhrTjRURDhTWnRqbUFqekI0?=
 =?utf-8?B?bm9uQVVIVDdsTlNFTEVPZFEzdnUwa2V2SmZjOFhMYjFzUXF2VngrN0I5VEJE?=
 =?utf-8?B?dk5nd3lOeDFRb21IZ1RwWW9Mbmc1V0xhY0g0R0t5QUZuMFkwa090ajNBUGZI?=
 =?utf-8?Q?6ezgMczFJs47ofQTsMT6FJHsJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a7ecb2-75c7-46f6-e9b0-08dc7a60eb37
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 13:13:06.3932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHLmuNIms05OKwKvU4kzy3LDb+VfhM96ajCvghw/mUPQCP0feguVQsI+x6/woe4DJaAfOl0Hu9afkNri6ClgfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7011
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
Cc: "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "matz@suse.de" <matz@suse.de>, "keescook@chromium.org" <keescook@chromium.org>, "jhb@FreeBSD.org" <jhb@FreeBSD.org>, "x86@kernel.org" <x86@kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "Petkov, Borislav" <Borislav.Petkov@amd.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "George, Jini Susan" <JiniSusan.George@amd.com>, "binutils@sourceware.org" <binutils@sourceware.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 5/8/2024 6:32 PM, Thomas Gleixner wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Tue, May 07 2024 at 15:23, Vignesh Balasubramanian wrote:
>> +struct xfeat_component {
>> +     u32 xfeat_type;
>> +     u32 xfeat_sz;
>> +     u32 xfeat_off;
>> +     u32 xfeat_flags;
>> +} __packed;
> Why repeating xfeat_ for all member names?
>
>      u32       type;
>      u32       size;
>      u32       offset;
>      u32       flags;
>
> is sufficient and obvious, no?
>
>> +enum custom_feature {
>> +     FEATURE_XSAVE_FP = 0,
>> +     FEATURE_XSAVE_SSE = 1,
>> +     FEATURE_XSAVE_YMM = 2,
>> +     FEATURE_XSAVE_BNDREGS = 3,
>> +     FEATURE_XSAVE_BNDCSR = 4,
>> +     FEATURE_XSAVE_OPMASK = 5,
>> +     FEATURE_XSAVE_ZMM_Hi256 = 6,
>> +     FEATURE_XSAVE_Hi16_ZMM = 7,
>> +     FEATURE_XSAVE_PT = 8,
>> +     FEATURE_XSAVE_PKRU = 9,
>> +     FEATURE_XSAVE_PASID = 10,
>> +     FEATURE_XSAVE_CET_USER = 11,
>> +     FEATURE_XSAVE_CET_SHADOW_STACK = 12,
>> +     FEATURE_XSAVE_HDC = 13,
>> +     FEATURE_XSAVE_UINTR = 14,
>> +     FEATURE_XSAVE_LBR = 15,
>> +     FEATURE_XSAVE_HWP = 16,
>> +     FEATURE_XSAVE_XTILE_CFG = 17,
>> +     FEATURE_XSAVE_XTILE_DATA = 18,
>> +     FEATURE_MAX,
>> +     FEATURE_XSAVE_EXTENDED_START = FEATURE_XSAVE_YMM,
>> +     FEATURE_XSAVE_EXTENDED_END = FEATURE_XSAVE_XTILE_DATA,
>> +};
> Why can't this use the existing 'enum xfeature' which is providing
> exactly the same information already?
First version of patch was similar to what you mentioned here and other 
review comments to use existing kernel definitions.
https://lore.kernel.org/linux-mm/20240314112359.50713-1-vigbalas@amd.com/T/

As per the review comment 
https://lore.kernel.org/linux-mm/20240314162954.GAZfMmAnYQoRjRbRzc@fat_crate.local/ 
, modified the patch to be a independent of kernel internal definitions.
Though this enum and below function  "get_sub_leaf" are not useful now,  
it will be required when we extend for a new/different features.

Please let  us know your suggestions.

I will fix all other review comments in my next version.

>> +#ifdef CONFIG_COREDUMP
>> +static int get_sub_leaf(int custom_xfeat)
>> +{
>> +     switch (custom_xfeat) {
>> +     case FEATURE_XSAVE_YMM:                 return XFEATURE_YMM;
>> +     case FEATURE_XSAVE_BNDREGS:             return XFEATURE_BNDREGS;
>> +     case FEATURE_XSAVE_BNDCSR:              return XFEATURE_BNDCSR;
>> +     case FEATURE_XSAVE_OPMASK:              return XFEATURE_OPMASK;
>> +     case FEATURE_XSAVE_ZMM_Hi256:           return XFEATURE_ZMM_Hi256;
>> +     case FEATURE_XSAVE_Hi16_ZMM:            return XFEATURE_Hi16_ZMM;
>> +     case FEATURE_XSAVE_PT:                  return XFEATURE_PT_UNIMPLEMENTED_SO_FAR;
>> +     case FEATURE_XSAVE_PKRU:                return XFEATURE_PKRU;
>> +     case FEATURE_XSAVE_PASID:               return XFEATURE_PASID;
>> +     case FEATURE_XSAVE_CET_USER:            return XFEATURE_CET_USER;
>> +     case FEATURE_XSAVE_CET_SHADOW_STACK:    return XFEATURE_CET_KERNEL_UNUSED;
>> +     case FEATURE_XSAVE_HDC:                 return XFEATURE_RSRVD_COMP_13;
>> +     case FEATURE_XSAVE_UINTR:               return XFEATURE_RSRVD_COMP_14;
>> +     case FEATURE_XSAVE_LBR:                 return XFEATURE_LBR;
>> +     case FEATURE_XSAVE_HWP:                 return XFEATURE_RSRVD_COMP_16;
>> +     case FEATURE_XSAVE_XTILE_CFG:           return XFEATURE_XTILE_CFG;
>> +     case FEATURE_XSAVE_XTILE_DATA:          return XFEATURE_XTILE_DATA;
>> +     default:
>> +             pr_warn_ratelimited("Not a valid XSAVE Feature.");
>> +             return 0;
>> +     }
>> +}
> This function then maps the identical enums one to one. The only actual
> "functionality" is the default case and that's completely pointless.
thanks,
vigneshbalu.
