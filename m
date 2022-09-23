Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B275E71E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 04:27:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYbf41W4Hz3cLZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 12:27:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dWveVMxT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.236.41; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dWveVMxT;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYbdK3hcSz30R7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 12:26:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFdqiE6PHs79ugL7ornt5gjLoO56fF4sk4FLRj/Hbm6E6rr6HmH88s4CtK2sWTWLxamY3je0FTsKh4aYvHMM10ZeQ7rmx/4oCO/fF0WFzoj7DEzCsxZ2BchQVxPpRpqu5QM1wwRlbbAlcri4I7xk/phZnsAAmRhrMLl02UYmrdQmU5S3YpCmx0dCVF46RdXv0GMqFa1RUys1Qsj1RTPt0z8xXjpVsidG8osAOOEi7WVAevIQe86Y7V5700emLcVKkQlAqAVlCIc2ltpZQU9z6XLkL0tlCNdfbQy+HcxTHCs7Rf4ihYSBi+CY8B8YYcvulghYgR4+mwt/voRwc6lXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyHqesF14Vn1JIGBHIIcL08pCMYPQc+5AK+sj/oXYnU=;
 b=AYRK7T157RsuqdwC/FcAfxxzBLJ/PrThGkkp+ObijQrsVo5nr+1rwC5kty83u9HRfChsO9nqiw0FCwebe+wp4Hjovv9cVzGuSEt8l5U9RAxV7jcUaFvZtbSP8BcFtA6havNFQVAqIa9681KuWSkxNxjkOey38LxecgjMf29Zj2e0saHEwLK/FF6DH8dfuxWJ7gxu3zID0wEBGHddpq4SD07z+8/QC40bWQrpRp2svc9lv1u4UkZhntMx/+bvOOasK8WmwWTu/zLf3DhrOitkr0eDzi6q5yt1l1jMdSEnCSBwIFTsDlt5A1SRyZfK2r47rwcGYCQs6A/gPNMe3925Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyHqesF14Vn1JIGBHIIcL08pCMYPQc+5AK+sj/oXYnU=;
 b=dWveVMxT1RQ+HXd3GwQA4t9MKd7H2t7e0+iBt0NcH9+4EUGubU2gjTQ2i8ukQg34fzSd4gpDlZQHmgXlgLyW200PkVxWi3liAbKPW/lPjZlxQVD3i9+HhQI7kDPFFQyxoSgRZnHEkKUsMDWFxxJuFZx+u//zZ3C9WGeXG6ykBx/csCg7cKg0M0DpjS3qGYcCzT0ENKt1QjR+IxQbPav420NpgjmaAxWeqcZJ0Joid6bqEkP5ySuoJD6hRX1hLdKLdc66m4jsLzGmCq1VKvvuX/R+FCcBxOlBA5MEpz3+KMk7lDplHejugIbISmEBJEvDPq1Gkbq1N2UUxv/W7Oj+Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by SA1PR12MB7150.namprd12.prod.outlook.com (2603:10b6:806:2b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Fri, 23 Sep
 2022 02:26:39 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::6405:bafc:2fd6:2d55]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::6405:bafc:2fd6:2d55%7]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 02:26:39 +0000
Message-ID: <3dcbcc7b-9ca0-1465-5a73-075a1c151331@nvidia.com>
Date: Thu, 22 Sep 2022 19:26:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 1/3] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-2-david@redhat.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20220920122302.99195-2-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0099.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::40) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|SA1PR12MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 117b6684-7bc4-4995-bc53-08da9d0b0b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	y7a+MvlgMSwavf/pZ7AIXhajp2yMpjxLLDIe46R7aulH1bT3nICwXzMvnv7wT9LcS0iVTmtkeahTsEMSMZ9OBR1WXLdkcDol5pDPKUxH2sMl6J2BSfY/dU0vaqzqnHM8NLybmBkCV8PhvOcS7Iu2c23jjNQZScJZFhbmoq9Iw9oVlIdJyfVuuiyGoAegAPJe8zF1UQpWiMe/4YaBaFkttO/s9AUxjRZkg/F3TUFy1GcnijR4wxHZevEirPQ4JYoBa5JzH1IH3nXeEKRVDk5lyW9i8sYLJMHNEa7SAf1RRUSp6apf7TxSmEzJtykyzNdz3dFMiUjCxIIS7XU3DQDXrMsH2kydqSft8sN87wmi74ZeBErnyOe0TRgo3wsWohOvLxqKZjAc4YCmjYAW6orGaDH4vKtGNtD5fmf57JyF/J6OWQyIs2P3DSXiOISxeUCP/iHvwtQ5uowxAncWHl3eLJOaJHAA1cPqzR9BwKmdE3jqE1Mk/G1cowxwVK8xGvfWSZrOB9tWKGUHRq6A7KgRWlVkXk2pUcBLqjCqvR5cozB3q1hiIsyPCpwk6YS3E7MPQToRkH/ItxtOcFqleIXL/9VS3iKYBEr9Ladle/6WJXumEfeerthnr0I6eFb/q1feposEf9DTlIQR5c3Ecgg32nTL6XhCxSPd/w8GF/kiuIGcU8ECh7q/NnyGHVsbYf96DmKa7jGJUwgnG66WlibNSau1U/E7xXyIWkbrGFcZHBt+oT0fWu7AOSUtVj8XFOnZCpc8yITPEvatUdpfFWxkWOqMBf1++aE+rkc4OEpt7axZUv+SwYXZUzQFF0tGtR/3adblNjnw1/qPbn3Z1jCf/5Ol+a6Ymw0h4dSungdw11y2rJ7UD9/CX38cTF6wmNsb
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199015)(41300700001)(2616005)(7416002)(316002)(6486002)(38100700002)(83380400001)(66946007)(66476007)(6666004)(478600001)(53546011)(2906002)(966005)(66556008)(26005)(186003)(5660300002)(8936002)(6506007)(6512007)(54906003)(4326008)(8676002)(31686004)(66899012)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?OVBSeWVYVUMwd25Qc2JmZHc5UkZxZkU2ejZtcmI4aDNkRndHT3dTSTlIL1g4?=
 =?utf-8?B?RHA3WTRyb0R5cWExQm9XYk00WFBrNEc3YUxUeVgwcTAvMUl3R052bTYycmk2?=
 =?utf-8?B?bXo1WWsraEVlSU02dkNwMCtiV0MzeWpLeXFqbjZFbHVHVktiNlEyc0tUQUlR?=
 =?utf-8?B?NWIwY1BpTUYxNzlWNG93c0pBU2FMN2RLb3V6N1ZlTjhxUHgxL2dleDJmNXND?=
 =?utf-8?B?dU5NYm1nQ2t4alhyL1pBcElzdExMQ1JQa0dxY3AxV2Y4V1NDRU12VzI0QWVh?=
 =?utf-8?B?Q3NIWWNYTkVqQU40Smg5S3F5YUN2L29NQW53WGpQQjZNMTlSMlppb0hOcjYx?=
 =?utf-8?B?QXpmay9ReXZkK0ZuTzVkSUNENjRXVXdvMzRUS2Z6ejZSZlV2bzVYYjk4bzU0?=
 =?utf-8?B?d1A0c1IwL3pBU3Y0NTdMeW1MMk5GUVBOS1lnWFlOS0Q5ZHhtMVNneS9BTzJ4?=
 =?utf-8?B?K2d2ODhqUkY4Q0k3QlFIVFJqVSthcXNsNldhbW91TzhCZHNROXUzd1VCeHNM?=
 =?utf-8?B?ejltdmhEVHh1bjBlbGQyeGtwMGF6dEoybzl6cjFKSDdNUEtHOXJvTzcwa0da?=
 =?utf-8?B?L1BzZFRicnRzeEJ3TEhsOTNCSGZTUElwNkc5a2xoTDdIVlFMUVJnamdIWTlO?=
 =?utf-8?B?SzVtczQ3K1FydXBSUTJ6Z0l2T0Q5TVMraDhreld3ZXQ3NFVIRUNvM21raHZQ?=
 =?utf-8?B?WSttYWFaQk1ycnFoazhRWk5LOFhUZ2hoUXZoa20raC9kdWdPbG1ZRmduTDJk?=
 =?utf-8?B?dkFCOHRtbzQ1aW1XVXZIdGR4TUJXN0NYOE5hU3prUmJZcFEvckhTa1BXWExm?=
 =?utf-8?B?anllalpTVThtSTdjaTB1aHgyeTNoM3BxSE9lSTJFOGdhSTlxSnIwcktMeklR?=
 =?utf-8?B?bEI0dWR6NUloYTc3dW9yN0x2a0RlWmJlMjBYeE9sa2VDTlNKejExZ0tkRHo2?=
 =?utf-8?B?REd2WTVjanByMURoZjZXUEcwRDNFSlozdVRRV21uVXVFZERwZlRISzJKRk5B?=
 =?utf-8?B?SGhZRk5nZ3RsZkR4bTlsNDVrdFo5Zlg4U2RQVldCTnl1VDZMSk5XVldlUzFy?=
 =?utf-8?B?U3lncWMwaTI2YmdscGdYRTFoSGlOVm5yUzgyUm9kSWtsYUhsd3pkTEg2NGox?=
 =?utf-8?B?dkgrNWs1UDZuU0RlaDhDT2s5dE9MQjc2azcyMmRsQmJMY09PdjBJYUNNNkF4?=
 =?utf-8?B?aktHa3g0cGRjclhKU0l6L0d5RkZXZjR5VENhTzAzcXcvUVNWTE5uZzVYbUFN?=
 =?utf-8?B?amlFTHhOUE5HL3R5dVlKZDFpdENxcXhIOGZQczQrN1Z0VlovVmlOaWlwVm52?=
 =?utf-8?B?MElFbDNmU1ZDVHZlQzZBL2xqLzhiRUkxS0RRMmIxK2ZKU1p4T0ord0xSNVRr?=
 =?utf-8?B?MlJ1Ly9xVXZvRVpZZ1cwV29sM01sLzVGMFRYS1hkYkVXVzQ3dmd0c1g3RXVY?=
 =?utf-8?B?ZUloK3RtaWdDNk9sTUZtUGppcmJ4UmVyT3BSVkJxMWoreXMyVWRZSUFYcm5P?=
 =?utf-8?B?ODY1Q1VlVGgyRUcwbi9EYUo1Y3hEanN2eHFnVXRIbnhORG1ZOWxTVGhxZVpS?=
 =?utf-8?B?SjVVdlJFLzhjaFI3WG1RMnQ3Ukt6WWlUdVZyL2xoYVI3V2tqbUpFenB0TmRk?=
 =?utf-8?B?WlNsLzBMN0JFd1N2bndkaVZxMW8xdzZlSUVwUjBNQmZGbmt3SHNSSkxGUU1Z?=
 =?utf-8?B?cFlEQ1JOQ20wc2pGR1dIVlFjSngyVjZLY0JKZmxDK2VBWmF6TXJmVzByaFpt?=
 =?utf-8?B?OU1qM2xCYWs5aHF0NWIraWJJU1lmeWRwblBPTFk3a3drbytqanF3YnZXQ0J4?=
 =?utf-8?B?OE9WdVByMWlMejJIdzFkcjNmdlFJYkRoQzlLMUtuQVVvb1JoaFNIOG90dVNm?=
 =?utf-8?B?em04UGVZYVUyVGZ5U0wrSWE1QWN0b0NoNGU0RGExSWJSVmRBTStYODNMbmVG?=
 =?utf-8?B?eGxhM0ZxOGhJSmo4UnR5YXYwY1JBUC9hT2lPQTlTRU5PcFg2akZFRCthUyty?=
 =?utf-8?B?V3FnSnJ6dmRUL3MzTllhVStBV2RqdmFpa3lKazg5Zis0ckhFRVU3cGVHcm1V?=
 =?utf-8?B?dWlkQnhGb0JSTk1yMlkyTzdacTR5UU9nOTZ4SEsreGJRNnU2cmttQ3BZVlQv?=
 =?utf-8?Q?OD2zgg65doXn/NPvoAfVrIEhq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117b6684-7bc4-4995-bc53-08da9d0b0b71
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 02:26:39.1518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdO4MdgzIgjzWWjxpOd6n1kCkFXX0doxtHDRWtg8JPRwoy9RDnNMETxpJFClX8ED6/vLO2xXPk3titgD7gDJZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7150
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Nicholas Piggin <npiggin@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/20/22 05:23, David Hildenbrand wrote:
> [1] https://lkml.kernel.org/r/CAHk-=wiEAH+ojSpAgx_Ep=NKPWHU8AdO3V56BXcCsU97oYJ1EA@mail.gmail.com
> [2] https://lore.kernel.org/r/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com
> [2] https://lkml.kernel.org/r/CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com

s/2/3/

...
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index 03eb53fd029a..e05899cbfd49 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -1186,6 +1186,67 @@ expression used.  For instance:
>  	#endif /* CONFIG_SOMETHING */
>  
>  
> +22) Do not crash the kernel
> +---------------------------
> +
> +In general, it is not the kernel developer's decision to crash the kernel.

What do you think of this alternate wording:

In general, the decision to crash the kernel belongs to the user, rather
than to the kernel developer.


> +
> +Avoid panic()
> +=============
> +
> +panic() should be used with care and primarily only during system boot.
> +panic() is, for example, acceptable when running out of memory during boot and
> +not being able to continue.
> +
> +Use WARN() rather than BUG()
> +============================
> +
> +Do not add new code that uses any of the BUG() variants, such as BUG(),
> +BUG_ON(), or VM_BUG_ON(). Instead, use a WARN*() variant, preferably
> +WARN_ON_ONCE(), and possibly with recovery code. Recovery code is not
> +required if there is no reasonable way to at least partially recover.
> +
> +"I'm too lazy to do error handling" is not an excuse for using BUG(). Major
> +internal corruptions with no way of continuing may still use BUG(), but need
> +good justification.
> +
> +Use WARN_ON_ONCE() rather than WARN() or WARN_ON()
> +**************************************************
> +
> +WARN_ON_ONCE() is generally preferred over WARN() or WARN_ON(), because it
> +is common for a given warning condition, if it occurs at all, to occur
> +multiple times. This can fill up and wrap the kernel log, and can even slow
> +the system enough that the excessive logging turns into its own, additional
> +problem.
> +
> +Do not WARN lightly
> +*******************
> +
> +WARN*() is intended for unexpected, this-should-never-happen situations.
> +WARN*() macros are not to be used for anything that is expected to happen
> +during normal operation. These are not pre- or post-condition asserts, for
> +example. Again: WARN*() must not be used for a condition that is expected
> +to trigger easily, for example, by user space actions. pr_warn_once() is a
> +possible alternative, if you need to notify the user of a problem.
> +
> +Do not worry about panic_on_warn users
> +**************************************
> +
> +A few more words about panic_on_warn: Remember that ``panic_on_warn`` is an
> +available kernel option, and that many users set this option. This is why
> +there is a "Do not WARN lightly" writeup, above. However, the existence of
> +panic_on_warn users is not a valid reason to avoid the judicious use
> +WARN*(). That is because, whoever enables panic_on_warn has explicitly
> +asked the kernel to crash if a WARN*() fires, and such users must be
> +prepared to deal with the consequences of a system that is somewhat more
> +likely to crash.
> +
> +Use BUILD_BUG_ON() for compile-time assertions
> +**********************************************
> +
> +The use of BUILD_BUG_ON() is acceptable and encouraged, because it is a
> +compile-time assertion that has no effect at runtime.
> +
>  Appendix I) References
>  ----------------------
>  

I like the wording, it feels familiar somehow! :)

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,

-- 
John Hubbard
NVIDIA

