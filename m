Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 578FF88CFD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 22:15:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=22v+cIq7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V42dz0ldVz3cPm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 08:15:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=22v+cIq7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e88::72c; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3lf14ZV0z3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 20:59:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wd9HWkGv25FlHx4iU5VsnYpq0YehiyqO4W9mOkJiIgOa27Ywdb0f3ZP2StH+ZYbr88N40zf+EwP42a2pLEIU5QKGSLZ9K1+cmwHdSzQ7j7rAH8+Y+/qj/Pl4fZ4RexdL3IKYIZ42enGJCvvzyil29E8NyH11qZ7HDYajABi8Wq6z11t8sxDNX6ncvgVJ+nkOmOInFdQaU2ZYiSoQYEBS3FKVnAPJ9PB07gNRTFW1xRujCPaDp8E4jQFXCD5RbQOgBZT/vizWJpKO6di/1DYTRmaJl0dAUCY+rHYr6Y28YL47KjLh5qN6QaXP3I21MCCXLId596x0FpsHd4lmUBPT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tR01Q869QWhv2sxVq6NhyDhx2q4aHlNyy0Wa0FZ7dTM=;
 b=bsZ9+bnomHaUhpKpxO8owReazsQtbu1hI1mMqT+UNvnFizJ7yJKgw2oL4ddzCoNxlJ4nVtQSs3o2JxyFitaykF2eAoVH/+wwuclAhF/1FOBa/NBHNiFhjgnup5oYAZW1YIu0F+O141Cp1OHNFc2RCFX0uDL2qDLgvKWGwed39NJ593OOwMp0PgX/hDm2ZLV/DI/UKZvUuguCY77GLVYeq0LXaGUQtS4C/0KxxDJNu/DELHd8HP5Ihyt2/WTTBBpD8O6tIwnj+wQODHjD62MNB2nlRMUvpD684mXOwbcib2XIBZSfQboBJUZe9akc2kgnGzXHUe73lBdJCCRWOoyHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tR01Q869QWhv2sxVq6NhyDhx2q4aHlNyy0Wa0FZ7dTM=;
 b=22v+cIq7aB/QHfLSO9U7uxKt1LhOHkSfRu0S/xzl7OMfZ7AE5elG3e0Z/5pxj4y5/92vAdS3OxUEQpTqF1gXBq7oYaomfcSgurhKXVTDGN/4evb8exOtOlIdQiGd1cjb3em6roCdyqSCf+OW/+7Ro6GS9kVyR6GZxCi0L8UYODM=
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 by SJ0PR12MB5611.namprd12.prod.outlook.com (2603:10b6:a03:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 09:59:27 +0000
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c2c5:a349:ed66:b28]) by SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c2c5:a349:ed66:b28%7]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 09:59:27 +0000
Content-Type: multipart/alternative;
 boundary="------------ZD84mwGO1vFg4iJmEJsFMFZN"
Message-ID: <1b030dfa-e42f-4e45-8af6-e35bf4f1c393@amd.com>
Date: Tue, 26 Mar 2024 15:29:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing Xfeatures
 information to x86 core files
To: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>
References: <20240314112359.50713-1-vigbalas@amd.com>
 <20240314112359.50713-2-vigbalas@amd.com>
 <dd54d6de-0bcc-4b2e-a420-b1a429b06246@intel.com>
 <20240314160824.GDZfMg-J1VOyjxIMiV@fat_crate.local>
 <6ce6aa20-25d2-4784-823f-2a18f592e002@intel.com>
 <20240314162954.GAZfMmAnYQoRjRbRzc@fat_crate.local>
 <24f71d52-0891-4cfc-8dec-9f13ed618eee@intel.com>
Content-Language: en-US
From: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
In-Reply-To: <24f71d52-0891-4cfc-8dec-9f13ed618eee@intel.com>
X-ClientProxiedBy: PN3PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::21) To SJ1PR12MB6124.namprd12.prod.outlook.com
 (2603:10b6:a03:459::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6124:EE_|SJ0PR12MB5611:EE_
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RfVAie3KJetoUtiIBCVuHwXDzWRIqB3yNHhJzOdrXrYzYwIhBnLygMcjIJdZJaOBXPhUWRNKPEFlUr1YFYCUSHyoDaiPvuSEWwrICugdn3oI/gZdmRsKDVpIcN0gY/D18FJIhVJrNMdB0c4O9MUYxt6eLCZxrhu3XSWssGphqKON6Dm3VXDvgHtvmF3PLjV7s9boJS76DcMzAHNG2H3n+pomKm4cj9sFBE9E/VMwED6E7kKPKOdPyaSyFUHMlkiM6+j0WrON3RQTSAe4COHr0YPqbBV3C0ni6rt9ms/hd+wu/UiF6q0pO6vOL7gumxqqwmDuIyJNLwJkHHAhpA8Pc4YFreeTY397+16oN+C81MSdnE7JeIvUR7C5iFJXzI7ttCkbAVwztmoVKrdnsogpWMCCoZcUxWfoSIUfwUPy3S6GLvVyJdOzULnqNlO08ZkPWClNhC3zasFgktjgp/DdAbXJk4hgURnmiESncR/rN0tgBIaPMAb/GJfTwRpKmsRXbjS8pejXx6TI+Lp9lzbddXl8fL6WdeY9ObyIcH5yfj7dC0BwlW3pGfsD49j8JXIJn1eroCLwP0tLUNErqrABk86Yp+r/Jp9ZZJ8KI1icnHxwnYyU9izBVXANm+IrYGNhFZYTypYWyGGPTdXOEtpy9VOlzZGp6WS41oP/rOTJm64=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6124.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Ymt2LzlFVG4vZDlOQkNsU2hDT0txcXU0OGZNT3hIWnVsK3VOY2VXc2w3Zlgz?=
 =?utf-8?B?QnRtVUNOa0x2VmppdUp1VDVVNi9PNnp4cUF0YW90NjIvaW41Z1lQbXZlZ25D?=
 =?utf-8?B?R2J2T1RBNGl3TDg3endZZjgyR0krVEdXNGpIdkhSQWdlaHBzYmZpZDdkYkhN?=
 =?utf-8?B?aENnN3dlRmdCbkNmSkxNVnV3KzVZMTVRSGNjckpjVXNxZGZzOVFDTm5VblJX?=
 =?utf-8?B?YmliSlhNZU5tQWhXZVFmUTFYdVRqN0pJRm5ZbDZTNmFaTExXZEh1M20xKy9F?=
 =?utf-8?B?NUhrdFBNRzhrdzlBUGd2eEg2dHlyS1RlZXFSSXNrcXIyRFlHa045cnZlUGlO?=
 =?utf-8?B?NXlmQ3ZFRmNOTUpQNS9kMUNlNVpMak5wek15bHB1ajQvSU5UYWZJRVNiOHo4?=
 =?utf-8?B?UDE0bEVkeWlsZDlWaGtwTFU1dWFVdFpEa0ozQ2xmb3liTkFPd0RueC9xOWQ0?=
 =?utf-8?B?STdBZG53RTBMcndMeWV4QU9aNHl4c0Z1a2hNV0RPTGdPcUkwdjQ3MkxESWZ0?=
 =?utf-8?B?VXlUNTdCeHNPZWM3bTZNTHZsM1UrWk1YL1dHc2tBalJvbmxWT0VWOTJSWXRQ?=
 =?utf-8?B?K0d3SW5zekR3YkFxVDJEODRjaU9KNkk3dUhMS0Q2Z2owazNhZnBld3hsb2VP?=
 =?utf-8?B?Z1laTWdJYng3Zks4N3d2V0kxcEdRZlROUFRTWmRGdEFIKzRhbll2UVZRdmwz?=
 =?utf-8?B?UUx6NVJQSjUzUStELzR3N2RIUk5lUElWQlAydFg5WVdYSms0eTBNTzZRNHND?=
 =?utf-8?B?MEtRY0R2VTk3RXZXcWlhRkVNOTZOS2ZPRUhZZWs0WWFrZmNmRFI4Z1JpN3lq?=
 =?utf-8?B?UVNua01IM09Md0JlMUtteHBWMk5ERFJUa2ViaFprTmp4WTljNG9FVnRidVBa?=
 =?utf-8?B?ZWRQMHpmY0krSVRYOU9BNHYvQnY5TEFmSXdCWVJ5ME1NTjBXS3FjTFV1a0ZC?=
 =?utf-8?B?Q2llTTJNWXE4K3dmNTBGVm9SYitQNkdvT09QNXRZZnR5bjRSbHRHSThnUWY4?=
 =?utf-8?B?Y3ZvVitlM29KSHdaeWREajhaUUpWcHJYR2hWeTBKYkFsTnZJMWlrRS81OEQ1?=
 =?utf-8?B?enJ3ck5JOGRNRVYxdkYwZ21RYU5HMXIyellpSU5kbHhMTmVmZ3dBMmxCUHZB?=
 =?utf-8?B?d3JQS2NYRzdWUy9iMFZrZm9TQU1jZTdtUmJXQVB1SHNQb09xVVFVZEEvSCt1?=
 =?utf-8?B?N0pQYnNqRFUxL2tJSFRIa0x6TTY0L09ZWThwdU5KZDhMbkloWVptK1Y1ODJD?=
 =?utf-8?B?RExsMjZTS0hwYXZ5S0tISElmY0RzOGFCVlNXVWMrbXd1MEFWYXRONTh3Ujcw?=
 =?utf-8?B?RU9lcTN0YlF6dnRvN0czNUExNnpHTFNrbHQyWEVGZVhUSVVCTFVvcXlCZEMw?=
 =?utf-8?B?aHRJLzlEWU1nU01tRVM2VWx6ZkhqdHhSMGUrM1FGL0JoWHlLM3A2c3dpYUYr?=
 =?utf-8?B?THNSb3NyMHBGcHoyL3pZYmYwc2FvWnZwajBrcVE1cGxlWHlOd1lPcHpUSktq?=
 =?utf-8?B?djJ2REhBWnl5V1RKd283NUZaMDRSS1dlUmh0UXJYeURjazBueGt4VVF1TXRw?=
 =?utf-8?B?TndRN1RXVjdnUytQUlZKNGN2bTgzZ1UrZG51VWVXVUF2OUJxN0o1Sk9ucWEy?=
 =?utf-8?B?SjR4Y0Zwd0pDUXRPakpQeGdGa0tOUU5BSENSNUlmMHBycVN1dUwwblpmMjNn?=
 =?utf-8?B?am5QOUo4bnRzcVpNSWZZU2VNa3lWQlR5S0IxaEFSS2J2NG1PTkp5VlZaU2ZD?=
 =?utf-8?B?ZCs5bnlHK0RqUHZRVmJ3V29jQTR4SUp3NkJHWmVtZUpJVnp2UDJGSmlDbTJS?=
 =?utf-8?B?dHE4TXl3dk40TnByNU9KR3IxaGpOZlZOcXdsVE9ZVFBDeExMVCt2c2pjdVlI?=
 =?utf-8?B?dkZqeU5OVlpIQXZycDJBck1Eak5ZUjdYTklYSzBmaGlJRWc1TU14dDFtclBW?=
 =?utf-8?B?ZllnNlBNOTZ6NzVySEhIZTFUWVpxbHpWR3RpQ1doaDN2NUFLMzlCWjJwenU5?=
 =?utf-8?B?Zm0xMk1ka0dmWjNoQWRZQm81RWVsRkp0K1g5cDBuaUdYWE5jUG5lR2xNcWNq?=
 =?utf-8?B?RnJGQjFzVmMvWVVsY3ppcVVhYU0zdzdtQ2tJSHMwWWRzdHBLYTNjODdzUFE3?=
 =?utf-8?Q?FQjDIC8X9sbwk+3MNNjpLSgEH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e081a1f1-8c68-41b7-875e-08dc4d7b6beb
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 09:59:27.0129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qyZ92WKYQmFEahytUz3WJNKxJPn9uNNQwrCnG90QR07R0QfqP0/h9LretfBTbpILNVfkMYSUf+bfrn0GVYz5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5611
X-Mailman-Approved-At: Wed, 27 Mar 2024 08:15:14 +1100
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
Cc: "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "matz@suse.de" <matz@suse.de>, "George, Jini Susan" <JiniSusan.George@amd.com>, "keescook@chromium.org" <keescook@chromium.org>, "jhb@freebsd.org" <jhb@freebsd.org>, "binutils@sourceware.org" <binutils@sourceware.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--------------ZD84mwGO1vFg4iJmEJsFMFZN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/14/2024 10:09 PM, Dave Hansen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On 3/14/24 09:29, Borislav Petkov wrote:
>>> That argument breaks down a bit on the flags though:
>>>
>>>       xc.xfeat_flags = xstate_flags[i];
>>>
>>> Because it comes _directly_ from CPUID with zero filtering:
>>>
>>>       cpuid_count(XSTATE_CPUID, i, &eax, &ebx, &ecx, &edx);
>>>       ...
>>>       xstate_flags[i] = ecx;
>>>
>>> So this layout is quite dependent on what's in x86's CPUID.
>> Yeah, no, this should not be copying CPUID flags - those flags should be
>> *translated* to independently defined flags which describe those
>> buffers.
> Ditto for:
>
>          xc.xfeat_type = i;
>
> Right now, that's bound to CPUID and XSAVE.  "feat_type==10" can only
> ever be PKRU and that's derived from the XSAVE architecture.
>
> If you want this to be extensible to things outside of the XSAVE
> architecture, it needs to be something actually extensible and not
> entangled with XSAVE.
>
> In other words "xc.xfeat_type" can enumerate XSAVE state components
> being in the dump, but it should not be limited to XSAVE.  Just as an
> example:
>
> enum feat_type {
>          FEATURE_XSAVE_PKRU,
>          FEATURE_XSAVE__YMM,
>          FEATURE_XSAVE_BNDREGS,
>          FEATURE_XSAVE_BNDCSR,
>          ...
>          RANDOM_STATE_NOT_XSAVE
> };
>
> See how feat_type==1 is PKRU and *NOT* feat_type==10?  That opens the
> door to RANDOM_STATE_NOT_XSAVE or anything else you want.  This would be
> _actually_ extensible.


Thanks for the review.
I will add new enum, instead of using "enum xfeature".
Currently we are retaining the flags field. The value will be set to 
zero at this point, and the field will be reserved for future use.
GDB / LLDB would not require this field at this point. Do let us know if 
this is not OK.

-thanks,
vigneshbalu.

--------------ZD84mwGO1vFg4iJmEJsFMFZN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/14/2024 10:09 PM, Dave Hansen
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:24f71d52-0891-4cfc-8dec-9f13ed618eee@intel.com">
      <pre class="moz-quote-pre" wrap="">Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.


On 3/14/24 09:29, Borislav Petkov wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">That argument breaks down a bit on the flags though:

     xc.xfeat_flags = xstate_flags[i];

Because it comes _directly_ from CPUID with zero filtering:

     cpuid_count(XSTATE_CPUID, i, &amp;eax, &amp;ebx, &amp;ecx, &amp;edx);
     ...
     xstate_flags[i] = ecx;

So this layout is quite dependent on what's in x86's CPUID.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Yeah, no, this should not be copying CPUID flags - those flags should be
*translated* to independently defined flags which describe those
buffers.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ditto for:

        xc.xfeat_type = i;

Right now, that's bound to CPUID and XSAVE.  &quot;feat_type==10&quot; can only
ever be PKRU and that's derived from the XSAVE architecture.

If you want this to be extensible to things outside of the XSAVE
architecture, it needs to be something actually extensible and not
entangled with XSAVE.

In other words &quot;xc.xfeat_type&quot; can enumerate XSAVE state components
being in the dump, but it should not be limited to XSAVE.  Just as an
example:

enum feat_type {
        FEATURE_XSAVE_PKRU,
        FEATURE_XSAVE__YMM,
        FEATURE_XSAVE_BNDREGS,
        FEATURE_XSAVE_BNDCSR,
        ...
        RANDOM_STATE_NOT_XSAVE
};

See how feat_type==1 is PKRU and *NOT* feat_type==10?  That opens the
door to RANDOM_STATE_NOT_XSAVE or anything else you want.  This would be
_actually_ extensible.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks for the review.<br>
      <span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">I will add new enum, instead of using &quot;enum
          xfeature&quot;. <br>
        </span></span><span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">Currently we are retaining the flags field. The
          value will be set to zero at this point, and the field will be
          reserved for future use.<br>
          GDB / LLDB would not require this field at this point. Do let
          us know if this is not OK. <br>
          <br>
          -thanks,<br>
          vigneshbalu.<br>
        </span></span></p>
    <blockquote type="cite" cite="mid:24f71d52-0891-4cfc-8dec-9f13ed618eee@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------ZD84mwGO1vFg4iJmEJsFMFZN--
