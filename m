Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CB388BEF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 11:10:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MpBtdRS4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3ltT5Zwrz3vhT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 21:10:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MpBtdRS4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2416::700; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3lsl4hjbz3vcS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 21:10:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVc7sjFI0FL1RtDYLY1cx4el2yLb1RPeBc4x0zTQmSteP86RGBCeq1G0I4AAhJV9V6w5vJp/cSKZkfYtj7rbtIIVC5lAlzVqx0FagKCIcZ1JqI1FyN3jvDtxNjix8rdEHiSkeY4jNNx7dP61gOajDU5/wkRt/GRPYXOUWH0HHzZIBXkfHS/QjvrbPzvAq4OP5vYP+9nXtpSuDWSXreuuxLd0ZN01hVJST1bbJmNsSKm6K9JmnWiDVPAQuC6mIhgnWZHvDQodXrNMO7HMo76FYjIkB7b/ADtshckz0Rb70QZf4D9p0ZtfCuVpoKE9vatN3tfmSjugP10+Ee8w/gVFjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCf4hr82y10XXNRQQG+KZ+WM/HJy/G7XeVQPVVidFP0=;
 b=AVb1Y6iCJ/OcktJlCwkaZoEpnqb7Ibaz5hLwYeXmcvAIWsgI/VwweIHAKRoETBpE+q+tmgOqfNvRUNd8QD4U5euoj0O9bYpBSAPZtkmIJ1QFIEolqiDPL9Ono2RlYzONzcyQy03ZWT9LhQdCi2sYrPwNOqHomTs/7O6dwq5UTVh7kLI3EJhc8AeVZ1oS8RX+BzSLkIy8nU45uMZXPBx3oVNILaQ9n4Zn8f+Do6AlcEky6rpLyiqxboZWApupseJOc6gfVWSBUVuxg3RC3zf9Vm0i1Vsk2cwVfGQauwUmtWYXsfRvkXYHWsoz9hEHCMziz3cTcftm8ZdBKJGWXcF5gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCf4hr82y10XXNRQQG+KZ+WM/HJy/G7XeVQPVVidFP0=;
 b=MpBtdRS4E2urxNJEbhypDe5G9Uma9JytWw5opAW2XdAL7a4WpK3OQxQTjYbgqyW6oyZ8lr618gmn1OO2inlX4lManL74c8rXLh1N6zs+8rTswc/GXSH45g/aAaTL+cwaLicQuheI7JmUd+Mdj9eKvzyZUms8PXwdIp09s7YaEfQ=
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 by IA1PR12MB8555.namprd12.prod.outlook.com (2603:10b6:208:44f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 10:09:42 +0000
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c2c5:a349:ed66:b28]) by SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c2c5:a349:ed66:b28%7]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 10:09:42 +0000
Message-ID: <cde77596-d82c-463a-beeb-b6097c7c54d6@amd.com>
Date: Tue, 26 Mar 2024 15:39:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing Xfeatures
 information to x86 core files
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>
References: <20240314112359.50713-1-vigbalas@amd.com>
 <20240314112359.50713-2-vigbalas@amd.com> <87o7bg31jd.fsf@mail.lhotse>
From: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
In-Reply-To: <87o7bg31jd.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::25) To SJ1PR12MB6124.namprd12.prod.outlook.com
 (2603:10b6:a03:459::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6124:EE_|IA1PR12MB8555:EE_
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1muRq2AowOZqSNppVfzFfWbwYxAzlwmSi8uhM4J3DNy/i99JKl4LnbctHC5OjgjGY8nfs70/0EN2YjnhPiMwGP543vuqNnZnG13FSf3oZF+XvL37q/lnssEU71n3JaDjD3Zl3iMsDJ9e/0PD2DP5jYg4ii/tWwotl4jTX71/PRDuOuEqAIe1QNvAVOw39CyHNCZ0ZaUsNpIZD5LOsiN6/Xx45ePP1kIdXsWx0KA5iCzPUZe1znK9yFwvnxSLLMsKWcF9pcle5UCZ0GNXYlL2efkCmPr9RzV+I8aqLIImbPyZ7zY9b3pMECOWRzTQi0NohWU1ZSJmgKK0ayTcHhwAy7XZYjjQlmnIq0ZoVG9u+orgEZ6zo2x3Jq9mESgdmAyJW74Wl6wZEIJgzjo63+BE5b+80hT/aS7GtYaZi6WUS2Lsbm4BSFXnmZ021vDCznfW50uDDO91C2+fHdpAdZVRziCEx7s5DBosTa2XHXaZRxR0MlB1blYrzxUzOunZISD4gJohgohxYOVBDvB67Kd5t456vjWCO08bha8WrndUAviKjpI3WcHyE+Bm5LsQ9X9n3k49jpJlCZO3n4S+K53CNk7B6RXtYpf0c212EOXH/taVu7P++Zz+/+s8Xa7jgAWU2mCBJ/5+FqUrt7+oDFSgyOi7WU46IVbVTarAbaUH+ec=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6124.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?alpXbU5YR0VmOVBacTkyZGgzMXBOMkgwdHgvL0RyenQxZVFVY3BJVDV6YVdZ?=
 =?utf-8?B?NXFFM1lxeDlVbWxnVkJNRTJvOTM2Nms2TmRTUEpNaHJVZFdkRmgyV0NLenpR?=
 =?utf-8?B?Sy9ndGVnNUxkYzdGcXFzKzIrK1REN2F2TFdQdm40RWxkM0lVQkNsWEtyRmZu?=
 =?utf-8?B?dVQ3YTBlMmJUbFpXSTlRMVVOdm9OUXJhSU1Bb2FEc2x4WmM5cWh0T01KbGZN?=
 =?utf-8?B?cXMzZS93cUE5TXh4R2d5RUZoNWxRdDBRSC9aSW9TQzZBODJWazVxUVVFaVdT?=
 =?utf-8?B?NDFRZitZbFRlL3c2eTJxaitqdmgvN25KR28rdWVYMmZ1cXF6ZDZ5UU1sWjk1?=
 =?utf-8?B?bm1iODlQTEt2MEhlZFdBbS9mVU1GdFdqSDdzenpFb0xyODlFSDlvK2ppODJp?=
 =?utf-8?B?KzNaSEkrcnIwcUNoUzJpaGhxenpQQjZGUit6U0xNQmp1ZUdKbTc4bUc3clNP?=
 =?utf-8?B?N21yczlBM1dJTnByd0JKUjhNZzkwaTB2NjFITjlXNDhFZnByM2ZXb3N3bGVF?=
 =?utf-8?B?RTdVVkl4ejJHYVNUOXhzNzNYUTlBUE04a0h2S0Jsa2ZSSkwvVmpqcnpUYmho?=
 =?utf-8?B?WmpSOFdzTHhhMkJXOHlLZSt3OWJrME5YTzRPMnVrQ3hEM09tU2pTaldXWGRt?=
 =?utf-8?B?aXc1VDdtMi9ZV3h0cUtlOW9JN09Qck5NZWxhSVBHaXFQdVptR1VweGtRelU2?=
 =?utf-8?B?VjhLMHpTMS9kdjM2d2dsM2R4aHdPRlhCdU5NTHB1WmJrSmlValdIQzFKWU5h?=
 =?utf-8?B?TWhhWmhGc2dQVVpnQUdYdS9VTFdycmRsRnZuaUdiNG10ZFhXZ0ZDTmhiUU9O?=
 =?utf-8?B?ZUFhYzBVWnRrUlBkN1lCWXh5eTd2VjNmaFdRM1h3NjljODdBRjJ6ak9SR1J6?=
 =?utf-8?B?NE5wUXEzS3QvRjJSb3ZaYXErRm1Xc3J5RUVrd2lQemlOZmhhdUNKSGNsTDQv?=
 =?utf-8?B?eElrYnBVUTFmUzhZVEpBNEVGZmpHdnFucjVLNVdNU0plQlhmb2xXSXVpUjFq?=
 =?utf-8?B?L2UxSzBVbUdLaEw5VTMwelhONzJaNGdzaVovdHlYNGh2K0w3WVAzOTEySDhE?=
 =?utf-8?B?eHBCaFl5cUt0dnlWeHRCQ1BjTURGc2hSZlFORzV6dEtGTmVtcVlkYnc3R0Jr?=
 =?utf-8?B?b1owelhRYmIvb05MU1JXUjhWWWJkQkl2bEFYVlIvY3E3NnB5NlBPZ2dFKzcv?=
 =?utf-8?B?WEFNY0Z2V0RqYVBYSTJHbU5CSTBJL3REUWRPRGM1ZTdqUVdYekpmVWM0eVhL?=
 =?utf-8?B?Rm8zWDBGYVM5RTNqdG1DMXBSOUczUUtHQWw3WElWRjFhNGx5a1ZjWkQzVExj?=
 =?utf-8?B?ZFoxbHgzVEI2dDUrUzFiM04wZEt6cTlIUkJYbWJSbFI1QkxNTmtSaXJueXZL?=
 =?utf-8?B?NHZvSzdHSjR1aGVXK09XdG1UZ3pwYXY2WThnSUNhRU5xOVpZTjhDVitQaU5Y?=
 =?utf-8?B?ejdMSmpSS0pkV2ZnZWdoMGhydklOSEVOOEhDUTRWMkhOQ0REMG11YmFXQ0Zw?=
 =?utf-8?B?RUpHMFRBRHJCSWZTQTZtVGxpVDgva3A0MUtSR21iOXdVNkNsMEJPWlkxb2pZ?=
 =?utf-8?B?Z05yY0gxUmZabzRwZTFJVEQrTGsvSmkwMHlBa21JUnUvZjVSdVB1Y29HL0Vh?=
 =?utf-8?B?b1VvQnJKRjlhVzAzclpOOU5Ca2tHQUpWSDRnVS9XUldlSi9BYktzT09DVngz?=
 =?utf-8?B?RG9Pd0FOVS9JQmZOdnhDYzRnK0ltZEdRaFB0ZFcreDRJbEdINm9ESjJwUzFM?=
 =?utf-8?B?UFFrd0dIaTVlTWZENW9FV3hVZ2RHeSt0Rnd1R2ZHSWYyV3hQMm5nYUc3V3pK?=
 =?utf-8?B?cm9FVjI4aG9HbmI4NmlxM0hDV1BkQ0lwYnFOaDM2Ry9GU3J6MUY1SFd4ZWND?=
 =?utf-8?B?bE9xTi9NMkJoYTU3ZGJ4ZWduSGtJSXI5K01NdVd4UlB1OTI0Sm1HNzJSRnFq?=
 =?utf-8?B?djlCbENrbWE5R211M3VZOThWT0piVWErdGZxTkJHek8weHFRRFI3K0pkWXRR?=
 =?utf-8?B?SG5JUnpwaEpaaGdBNWJRNEhOcTVBVTFJZE1EY1dUMXFkZG5hdUR3TWZUc3lq?=
 =?utf-8?B?cEJLRGIrRmorN2YxMHVLUU43NEpKWXIzeG00WHcwRVJkNUVkVEJOSmU4eDBO?=
 =?utf-8?Q?6N42NMkKkokFqNZDcrM3d0B7K?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4e1f83-5a34-4d09-5e98-08dc4d7cda5c
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 10:09:41.7783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgcOFimiY7BWkZVdSyMj4F0/RRnDJh+Y5k66wXC4WbW1RcyeuHau93EAWiy6N+c+pEjqZy4+lvkFch4ywX3y1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8555
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
Cc: "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "matz@suse.de" <matz@suse.de>, "keescook@chromium.org" <keescook@chromium.org>, "jhb@FreeBSD.org" <jhb@FreeBSD.org>, "binutils@sourceware.org" <binutils@sourceware.org>, "x86@kernel.org" <x86@kernel.org>, "Petkov, Borislav" <Borislav.Petkov@amd.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "George, Jini Susan" <JiniSusan.George@amd.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> IMHO you should split the changes to replace ARCH_HAVE_EXTRA_ELF_NOTES
> with CONFIG_ARCH_HAVE_EXTRA_ELF_NOTES into a lead-up patch.
>
> cheers
Thanks for the input and i will take care in next version.

regards,
vigneshbalu.
