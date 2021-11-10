Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF2644C56D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 17:52:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hq9rk5sMcz2ywb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 03:52:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=prevas.dk header.i=@prevas.dk header.a=rsa-sha256 header.s=selector1 header.b=QpHY+LsA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=prevas.dk (client-ip=2a01:111:f400:fe0e::715;
 helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.dk header.i=@prevas.dk header.a=rsa-sha256
 header.s=selector1 header.b=QpHY+LsA; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0715.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::715])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq9qv1lR4z2xsV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 03:52:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGeL3YBFbfMxAHmUett0ApHN1+pbekuVEP3QbLpmAF2urStaw6eCvD0ZiwLucMG/lqvCmKNd1H4Arik9oEzU2d6IYFsEOSIyM8dk60gJM+3fO3DVPHWIXcnkRJ1wQQZrGTdpBEkF2N5expsPgNRq+NKUWuvQVjD2403+5+qI9kFIJXA3tvtHapUkzIIRpfDqVioKtBh5KAHOsinoISs+/nhh3I340CU8kuOyLXiyP4waZPZA1pK/LWf9uR4Qg0ZJgRQ+kE8c7yIIlUgS/qyyUHddCAzs8Ze8R9Dvqc721wbl/BXJukccru6qZfy2+gK44R0oMroBEpTiQqDuAz9moQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQxJ57It5SKXsbgdjGZYFq7FEaCkuL56c3GWVt+/Yhw=;
 b=j0lfGZ4bN1aWxxxVySJkFCz6NRvYP3aupgMqa2/YX/ofyeIoCn+/LDs5SlU25CFFP6lcDWuFfqzQdc+YT2w18Lt7jnLoSMnH/qyhMF79UJfRPumWdCF4cj0DmsYy4h8LQH2azbEwFEyLLdOudNpDFMw5Qsu0YY0HH6u5hOxT34jdJpZqovSB85QQ54DG1EPlWGRxAMrF35w0wHSPUT1NwvBzD+NkzqBOVYYyMTEQqjHbWBvJeg4EF6hX2fxeJTLYIyrmTnSbqUC2fpoSIRnWmYhyiUibS3St215X8pS1H37yon7eYU6Fb/hU7O5cTS6Kl840pzNkOEagOiPDERaMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQxJ57It5SKXsbgdjGZYFq7FEaCkuL56c3GWVt+/Yhw=;
 b=QpHY+LsAFXus14qNpL8O5dSCohSKZn4y2jsRbLJ7B0fxFrO4WDhXgCvlwgIhSLyIVxRkgPfsoMIEIdniB9QDJ6aBxcXi3ezPPhjwTqtN1oEiNaqr5UIRcp88/q5DJIRJYcB4xWUp3J2iXxPtumbBhz3lCRSW+POtnaE+BVqCkmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from PR3PR10MB4239.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:96::6)
 by PA4PR10MB4336.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:100::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 16:51:44 +0000
Received: from PR3PR10MB4239.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ac23:766f:c440:5d3a]) by PR3PR10MB4239.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ac23:766f:c440:5d3a%6]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 16:51:44 +0000
Subject: Re: [PATCH/RFC] of: Shrink struct of_device_id
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
References: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <ddcfa4b9-f7f4-04f5-89f2-b04c284e1945@prevas.dk>
Date: Wed, 10 Nov 2021 17:51:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0050.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::27) To PR3PR10MB4239.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:96::6)
MIME-Version: 1.0
Received: from [192.168.1.149] (80.208.69.72) by
 AM6PR0502CA0050.eurprd05.prod.outlook.com (2603:10a6:20b:56::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 10 Nov 2021 16:51:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 423e78d4-ac44-49f8-f17e-08d9a46a605a
X-MS-TrafficTypeDiagnostic: PA4PR10MB4336:
X-Microsoft-Antispam-PRVS: <PA4PR10MB4336011584412DDBAD910AAE93939@PA4PR10MB4336.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZ9zYLsna5HgdhVTMVFkY7dWBDMPdy2Gi9dr5Uzx/NzjDhGV7xKvvrRhOP5mmS86Gjo3ZvZiqjTsPv9v+B3VmjI7OEGEUBq5Y+Wl0JyNsjRCILs33zR2zsF426NBfzopmE7Dg6+DdEi9nk2odIkBMUY0jZKlgTN7YRNgySBsjzkwUUNWdDwPeCiMA++XvQOUVnsarjtvJpveikJvf3oMm3tIaBTWIWszEBRyiOyhXg2o1zfY93jI9LAL3XANgM1E2ymhIDx/Y5c2Ckywd6Al/ZufdINLvDiJc+k4Co0cXOt+wWEtVKa71fQRImbotfgkDiQOfBvSxm0n+7DlskH8zNiXqaY5RY7A0Vk7qs+yAs4rhvDTjA8s1oY7erHFSIWWTyu/sfHrxHfxujDD7rW+C5F1CFDT3Zs6JXqXcB0RsrCgGQBjdi3ZqjYo2/Kj2kBGJHcfLXIeDiULaldt64/4zYVTVI/286SGVCQu019UTGRKOWxmsq06Bl8IUWYoVIS2cshRjrK+CxN4iafVUeWAaiQBDR4Jt6BqB0y+CufgjTEqu/22vEZPqEPOGdfssxtP6g/Vpo/UTzgwU0zVoLowaLyiAEKr1vYB9nFOiGMBYwiPNvETgyDZAwYUkQqzodnXX2aGwHKoDmGUM55b86ldJaN25vsr4vifuY2hpmxzq8TOyc/Q8lbaEHi01mvMk7X7xK8+t06aH5LZKcq0V4t7mPKwtZWto/6vh/0n6gOOVTK5unpc2svTJ7HUd3ZsFnpVzAQxqbs29zOSxAs1CKBv/yKWmndJtie0eFxvPApU3beAz2FcLvkoB/sV6/eVpQpBTMashK9q1MtA3jL5jysNDObfcCyee20Stzam0JPAr0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PR3PR10MB4239.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(8676002)(7416002)(38100700002)(66556008)(8936002)(966005)(26005)(6486002)(110136005)(2906002)(186003)(316002)(16576012)(8976002)(4326008)(5660300002)(956004)(86362001)(44832011)(2616005)(36756003)(31686004)(83380400001)(52116002)(66946007)(38350700002)(66476007)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?Kv/o7w7c5nvCkxqOs8ma/Lx1UOUEqRIexIURDTnbM4+Vp5tuTDcSS13x?=
 =?Windows-1252?Q?DLA+jXIRzn0JJV73qc+T8B1rTgY7T/J39M7MMlHcqZlByVgbboriEouZ?=
 =?Windows-1252?Q?24JMB2MfAt4ezSQ5uKsO55/+yevChJG4wASoAIauMEK8Uia1AfZugSQo?=
 =?Windows-1252?Q?6nCJSDv3N/BcwJG2oJB0WVWjqeK9Sj+5BXdyMstzOKKxjQQskt0INtTj?=
 =?Windows-1252?Q?Sbk6QvrKna1sA3DrDA7j1XuIS0HRhjp89H51Jxy6AHvbcEzfc6mRdBlj?=
 =?Windows-1252?Q?7NGK3LTnRoJtK3VtYzKLg1v0wQU5LYg7/CgvoAAKOARvHabUR2u8Fio/?=
 =?Windows-1252?Q?aZqVY6J4EdKndz7p0Zlv/PHYWWjTjZy/ZN/9qc3qSn9Dz1e1Nvyx+dt2?=
 =?Windows-1252?Q?XnFKxH9WcOfjQjGeB6I0QM1YlYS+Nk8wxhP7xxyMe4u+5F0R6FqBWU75?=
 =?Windows-1252?Q?oLwNUCxWtvc2TXmv+fAEoPaN3rPfo1b/fUlGxeiX5CSOTwYywYpCqJUo?=
 =?Windows-1252?Q?g3V/zfBVgYjT5X5meE1x+fGM2xHmmj/7oJ3Z4JK2Z3rFRSnk23mLhwIB?=
 =?Windows-1252?Q?QhH4TMUTw5pvU4wiarVVEHgJxMRlGJ9bVSJGtjphwLCNO7McUK/qTMSy?=
 =?Windows-1252?Q?I7AF2UtvcpXax1x744W1k7n1WKzH2bm+OaSNsqO6FlS/FN/RvEGK6coj?=
 =?Windows-1252?Q?Ljh9rayAyeK2rVDgD/abpOAs50WhNW0I6Pg72z+aTkRqjCx811KPj54c?=
 =?Windows-1252?Q?uM96imMbStwzx8/ra1bGdFLC9GZSp0ncXwIamDVxwRIl06lCVQy/KwBN?=
 =?Windows-1252?Q?hiZdrVHCB15IT4ScHy4UztNz4YU+FtR+geNwY3foA5y5QdO+Sk8nJWiK?=
 =?Windows-1252?Q?MO3cqx4iQ5jW+3txs1PCC26ccceVTSg3Dl/eWFFNsRxjhiu/GKNDX9MI?=
 =?Windows-1252?Q?wqrdSl2XnGpp73D/G+8mel2reYM7hoQOKEN0/Ay6V5S0D8Mc2bYYcOT+?=
 =?Windows-1252?Q?HRwedlPGQLeZut5/7SayLshUhy9CR1LD1BTDAjToqf9lNxBZy5aa/gGf?=
 =?Windows-1252?Q?1VmmakQ7mK0zcQjoLc054EKVXVH2lhnSwh87jwl1oFOfKKUZszePjPgO?=
 =?Windows-1252?Q?QbHTpSZzqiWQYQuwSp7G6xdEls8mgZRxxh8eRM8FN48o70802+q5U2TT?=
 =?Windows-1252?Q?BBaMnx8pRRkDgDke3vnnwwpkOtwka7BWkcF8J3lg0+kLHXGMBvUdHiDq?=
 =?Windows-1252?Q?yayuzN8u6RDlnUEIGOh0Mc6sTQ5sCnMG6T0eQHDeENqHwY46WC+AteWc?=
 =?Windows-1252?Q?oBqoOm9U88EwJPylf9u3xtCAqZrm3/C5jUToZzSBAFH/j2q7Acd8Of0y?=
 =?Windows-1252?Q?Aczpz/uOvCYYgJb/VH26GsB/JG+6aHXU2A23O/VpgZlH3jFjwuaBmY9I?=
 =?Windows-1252?Q?OlY/wefbaJnVS+MTtkBudLpLaSLM03GCVnEtToHLkmT4jzasi2fQc1OH?=
 =?Windows-1252?Q?W9Nu4uIiRFmymjKR/0MOadMTC9e52q/JfZW6ASe5gB/4pdNI8Oszu/NU?=
 =?Windows-1252?Q?eJBYGR9KgFw224b3hy0+g2n+N19YIaYNN0FfjTKN3NuTS558BwOiqIIg?=
 =?Windows-1252?Q?dMO2e2kVEzoOv6SsJpI0ETWFrlYTkwlu6h1b84Kfczub5CQwKExZdsp3?=
 =?Windows-1252?Q?uvqsqG0t0SWIxfuwjQ548VyYMWph2uJ8wTpkbXOje+atM7Rrm88E4akU?=
 =?Windows-1252?Q?6+jsH7M1+3482LSJ9GRvkZl7PmPvZlWF24Wea2//q+eA6Cjnt8ZyIyXO?=
 =?Windows-1252?Q?RzJ3iA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 423e78d4-ac44-49f8-f17e-08d9a46a605a
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4239.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 16:51:44.2405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYGkjPINYhhr8igrnCFE3ygqaAfeakQX0gXW68P54+ZCiIJzoD07FvQiq1fUoFlrKRPWP3u7n9tni57QcpZdtbGTqq642a/ggXdiEvahmXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB4336
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/11/2021 17.23, Geert Uytterhoeven wrote:
> Currently struct of_device_id is 196 (32-bit) or 200 (64-bit) bytes
> large.  It contains fixed-size strings for a name, a type, and a
> compatible value, but the first two are barely used.
> OF device ID tables contain multiple entries, plus an empty sentinel
> entry.
> 
> Statistics for my current kernel source tree:
>   - 4487 tables with 16836 entries (3367200 bytes)
>   - 176 names (average 6.7 max 23 chars)
>   - 66 types (average 5.1 max 21 chars)
>   - 12192 compatible values (average 18.0 max 45 chars)
> Taking into account the minimum needed size to store the strings, only
> 6.9% of the allocated space is used...
> 
> Reduce kernel size by reducing the sizes of the fixed strings by one
> half.

Tried something like this 2.5 years ago:
https://lore.kernel.org/lkml/20190425203101.9403-1-linux@rasmusvillemoes.dk/

I think that there might be some not-in-tree code that relies on the
existing layout. I considered adding a CONFIG_ knob, either for these
sizes in particular, or more generally a def_bool y "CONFIG_LEGACY"
which embedded folks that build the entire distro from source and don't
have any legacy things can turn off, and then get more sensible defaults
all around.

Including fx in the TCP stack where some CVE fix required changing some
parameter, but the kernel itself couldn't ship a sane default because
no-regressions, so userspace had to learn to set yet another sysctl
properly.

Rasmus
