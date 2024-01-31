Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 772158442DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 16:18:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Xsu0+3xu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ5Jr2mgcz3cLk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 02:18:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Xsu0+3xu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ5J10SMrz30YR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 02:17:33 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240131151721euoutp02aa3d63dcbc4b6f1c2b57cf515d66048c~vd49xJ96Z2788527885euoutp02i
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 15:17:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240131151721euoutp02aa3d63dcbc4b6f1c2b57cf515d66048c~vd49xJ96Z2788527885euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1706714241;
	bh=vyZV6sJ+C4Ph/Q7b2FdAoMgA3iIBfoctDx1VoKpawe0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Xsu0+3xu7JFe65DllV2fQG+FheZxjvglMQila5Xju0CoIZqx0wuI/+f9g+s0QJ0B5
	 95ddurlMroQunCY3k0QgJ/gHmVr1+Be8c+y7vQoE7cvysUQSNj1t3nTvj/zjmiziJO
	 wWg+4io4Y/TCE1tmUQ5uU3fZ3Qotuc9xdYfgVBy8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240131151721eucas1p244ec5c2fa138b032dd0a4eca093b601c~vd49ekSzQ0568505685eucas1p2d;
	Wed, 31 Jan 2024 15:17:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 8B.D9.09552.1846AB56; Wed, 31
	Jan 2024 15:17:21 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240131151720eucas1p1f168cb17a8e5b5b7792d2b570d13e1ca~vd48-k3mq1073110731eucas1p1f;
	Wed, 31 Jan 2024 15:17:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240131151720eusmtrp125e019057189bda9bfa0d717fa4f2635~vd48_8FXr2218422184eusmtrp1C;
	Wed, 31 Jan 2024 15:17:20 +0000 (GMT)
X-AuditID: cbfec7f5-83dff70000002550-3a-65ba6481bb82
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 8D.7E.09146.0846AB56; Wed, 31
	Jan 2024 15:17:20 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240131151720eusmtip1bea35847920a57cbd0e168925f4283eb~vd48SIPHd2088220882eusmtip1d;
	Wed, 31 Jan 2024 15:17:20 +0000 (GMT)
Message-ID: <2febff4d-26ba-4809-a124-7add25ab3d35@samsung.com>
Date: Wed, 31 Jan 2024 16:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro()
 at all time
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Chen-Yu Tsai
	<wenst@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <46627d92-976a-4126-b261-a4c6575e5a3e@csgroup.eu>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRmVeSWpSXmKPExsWy7djP87qNKbtSDV4+E7H4O+kYu8WdSc/Z
	LS7vmsNm0TD7O6vF7+//WC1uTHjKaLGl4RCbxc8XN1gsZrRdZnXg9Pj9axKjx+yGiyweX2+e
	Y/JY9LKBxWPnrLvsHptWdbJ5nJ+xkNHj8ya5AI4oLpuU1JzMstQifbsErowF7x6wFPRqVHx/
	/ZaxgXGjYhcjJ4eEgInEkhkPmboYuTiEBFYwSlz9PIcNJCEk8IVRYtseGYjEZ0aJeRPOscF0
	HH6wmgmiaDmjxMpfdhBFHxklHn5pYgRJ8ArYSfz5d5gZxGYRUJVofPmLCSIuKHFy5hMWEFtU
	QF7i/q0Z7CC2sECExJpJ18DqmQXEJW49mQ9WLyJQK3Hr0Wyw85gFtjFJ/Dr9ECzBJmAo0fW2
	C+wiTqBlB7dsYoFolpdo3jqbGeLSZk6J5klFXYwcQLaLROd7Q4iwsMSr41vYIWwZidOTe1hA
	5ksItDNKLPh9nwnCmcAo0fD8FiNElbXEnXO/2EAGMQtoSqzfpQ8RdpRY/RikGWQ+n8SNt4IQ
	J/BJTNo2nRkizCvR0SYEUa0mMev4Ori1By9cYp7AqDQLKVRmIfl+FpJnZiHsXcDIsopRPLW0
	ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwZZ3+d/zrDsYVrz7qHWJk4mA8xCjBwawkwrtSbmeq
	EG9KYmVValF+fFFpTmrxIUZpDhYlcV7VFPlUIYH0xJLU7NTUgtQimCwTB6dUA5N9tN6R9TK+
	RkHn3x/cfFTKlbuIxT19sdUmjbRXfu/sBRwiz9oabnjy1OHptLAZW59y88278vnQpALPnldd
	Xl4NXPvN/ofcf+jtlTHjwvpk76NKS4HpbrOYGueeIxmC9nqTt2pxHzyR80H/8Q6vzRnCAQW3
	6x/vab2mLnHmF9+MZxc7fkSVM7+qtIj8e/pIdw7jiduqWq1vnDLP5V13S4j9fHtL2dp8780/
	eNn57KRPP3ra2eymv6mK88fUDStENNdzK3zM/CEtmcj4Q0VSnaWrUkQtOfhkAfNZkYzDCjrf
	ykrXKsqoySQsnGNb9H2KJMO66uu9F/zCZreasl3f9+El0xmlp9f2r9O5fs1jvxJLcUaioRZz
	UXEiAIMdtTPIAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xu7oNKbtSDZ7eNrD4O+kYu8WdSc/Z
	LS7vmsNm0TD7O6vF7+//WC1uTHjKaLGl4RCbxc8XN1gsZrRdZnXg9Pj9axKjx+yGiyweX2+e
	Y/JY9LKBxWPnrLvsHptWdbJ5nJ+xkNHj8ya5AI4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0j
	E0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYwF7x6wFPRqVHx//ZaxgXGjYhcjJ4eEgInE4Qer
	mboYuTiEBJYySsx9cJEJIiEjcXJaAyuELSzx51oXG0TRe0aJU6+XsIAkeAXsJP78O8wMYrMI
	qEo0vvzFBBEXlDg58wlYjaiAvMT9WzPYuxg5OIQFIiTW7JYCCTMLiEvcejIfrFxEoFbiUtda
	Roj4NiaJZ7dyIXYtY5Zoe7gB7Ag2AUOJrrcgR3BycALtPbhlEwtEg5lE19YuqGZ5ieats5kn
	MArNQnLGLCT7ZiFpmYWkZQEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAON127OfmHYzz
	Xn3UO8TIxMF4iFGCg1lJhHel3M5UId6UxMqq1KL8+KLSnNTiQ4ymwLCYyCwlmpwPTBR5JfGG
	ZgamhiZmlgamlmbGSuK8ngUdiUIC6YklqdmpqQWpRTB9TBycUg1MctX8z5aH2KoybdVo9p0r
	G+Du2J81I+5USODBTT3ZO66azP+hz+/v27w04u7iGefeTiuZ/X7pH6l53AI6K0osLxzlyOKa
	ucrVe3ftN9Psj85eW46t3KE0nXfKt5L2nWa7arn/Xsny+LHa/nQV558ZLdb8+f3rf+3J053r
	8fR00fQJll3fP/oUNe17HFzHsMZjxj0LeXuT7AvuoWttDB89lOTZm1fPe05Nt+f/ixqDW8rl
	ew8Xa6cf+MduuefPhU+M0+yknjJ+d2W6zXrlfFX/nWKmytvrSxTYkhL47Be/K/ErFwqY8+ED
	U+WHrKBZOSddFmqzxp094++W4rP+qajinfq0X9e4BVeEf9x0x/WDEktxRqKhFnNRcSIAC6yf
	m1wDAAA=
X-CMS-MailID: 20240131151720eucas1p1f168cb17a8e5b5b7792d2b570d13e1ca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd
References: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
	<ZbgGDlgrLhB8tcGI@bombadil.infradead.org>
	<20240130091626.GA3684878@google.com>
	<9e298fa7-a953-462a-96a4-56a1b4316a17@csgroup.eu>
	<CGME20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd@eucas1p1.samsung.com>
	<30ddedc9-0829-4a99-9cb1-39190937981c@samsung.com>
	<46627d92-976a-4126-b261-a4c6575e5a3e@csgroup.eu>
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
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 31.01.2024 12:58, Christophe Leroy wrote:
> Le 30/01/2024 à 18:48, Marek Szyprowski a écrit :
>> [Vous ne recevez pas souvent de courriers de m.szyprowski@samsung.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On 30.01.2024 12:03, Christophe Leroy wrote:
>>> Le 30/01/2024 à 10:16, Chen-Yu Tsai a écrit :
>>>> [Vous ne recevez pas souvent de courriers de wenst@chromium.org. D?couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> On Mon, Jan 29, 2024 at 12:09:50PM -0800, Luis Chamberlain wrote:
>>>>> On Thu, Dec 21, 2023 at 10:02:46AM +0100, Christophe Leroy wrote:
>>>>>> Declaring rodata_enabled and mark_rodata_ro() at all time
>>>>>> helps removing related #ifdefery in C files.
>>>>>>
>>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>>> Very nice cleanup, thanks!, applied and pushed
>>>>>
>>>>>       Luis
>>>> On next-20240130, which has your modules-next branch, and thus this
>>>> series and the other "module: Use set_memory_rox()" series applied,
>>>> my kernel crashes in some very weird way. Reverting your branch
>>>> makes the crash go away.
>>>>
>>>> I thought I'd report it right away. Maybe you folks would know what's
>>>> happening here? This is on arm64.
>>> That's strange, it seems to bug in module_bug_finalize() which is
>>> _before_ calls to module_enable_ro() and such.
>>>
>>> Can you try to revert the 6 patches one by one to see which one
>>> introduces the problem ?
>>>
>>> In reality, only patch 677bfb9db8a3 really change things. Other ones are
>>> more on less only cleanup.
>> I've also run into this issue with today's (20240130) linux-next on my
>> test farm. The issue is not fully reproducible, so it was a bit hard to
>> bisect it automatically. I've spent some time on manual testing and it
>> looks that reverting the following 2 commits on top of linux-next fixes
>> the problem:
>>
>> 65929884f868 ("modules: Remove #ifdef CONFIG_STRICT_MODULE_RWX around
>> rodata_enabled")
>> 677bfb9db8a3 ("module: Don't ignore errors from set_memory_XX()")
>>
>> This in fact means that commit 677bfb9db8a3 is responsible for this
>> regression, as 65929884f868 has to be reverted only because the latter
>> depends on it. Let me know what I can do to help debugging this issue.
>>
> Thanks for the bisect. I suspect you hit one of the errors and something
> goes wrong in the error path.
>
> To confirm this assumption, could you try with the following change on
> top of everything ?


Yes, this is the problem. I've added printing a mod->name to the log. 
Here is a log from kernel build from next-20240130 (sometimes it even 
boots to shell):

# dmesg | grep module_set_memory
[    8.061525] module_set_memory(6, 0000000000000000, 0) name ipv6 
returned -22
[    8.067543] WARNING: CPU: 3 PID: 1 at kernel/module/strict_rwx.c:22 
module_set_memory+0x9c/0xb8
[    8.097821] pc : module_set_memory+0x9c/0xb8
[    8.102068] lr : module_set_memory+0x9c/0xb8
[    8.183101]  module_set_memory+0x9c/0xb8
[    8.472862] module_set_memory(6, 0000000000000000, 0) name x_tables 
returned -22
[    8.479215] WARNING: CPU: 2 PID: 1 at kernel/module/strict_rwx.c:22 
module_set_memory+0x9c/0xb8
[    8.510978] pc : module_set_memory+0x9c/0xb8
[    8.515225] lr : module_set_memory+0x9c/0xb8
[    8.596259]  module_set_memory+0x9c/0xb8
[   10.529879] module_set_memory(6, 0000000000000000, 0) name dm_mod 
returned -22
[   10.536087] WARNING: CPU: 3 PID: 127 at kernel/module/strict_rwx.c:22 
module_set_memory+0x9c/0xb8
[   10.568254] pc : module_set_memory+0x9c/0xb8
[   10.572501] lr : module_set_memory+0x9c/0xb8
[   10.653535]  module_set_memory+0x9c/0xb8
[   10.853177] module_set_memory(6, 0000000000000000, 0) name fuse 
returned -22
[   10.859196] WARNING: CPU: 5 PID: 130 at kernel/module/strict_rwx.c:22 
module_set_memory+0x9c/0xb8
[   10.891382] pc : module_set_memory+0x9c/0xb8
[   10.895629] lr : module_set_memory+0x9c/0xb8
[   10.976663]  module_set_memory+0x9c/0xb8



> diff --git a/kernel/module/strict_rwx.c b/kernel/module/strict_rwx.c
> index a14df9655dbe..fdf8484154dd 100644
> --- a/kernel/module/strict_rwx.c
> +++ b/kernel/module/strict_rwx.c
> @@ -15,9 +15,12 @@ static int module_set_memory(const struct module
> *mod, enum mod_mem_type type,
>    			      int (*set_memory)(unsigned long start, int num_pages))
>    {
>    	const struct module_memory *mod_mem = &mod->mem[type];
> +	int err;
>
>    	set_vm_flush_reset_perms(mod_mem->base);
> -	return set_memory((unsigned long)mod_mem->base, mod_mem->size >>
> PAGE_SHIFT);
> +	err = set_memory((unsigned long)mod_mem->base, mod_mem->size >>
> PAGE_SHIFT);
> +	WARN(err, "module_set_memory(%d, %px, %x) returned %d\n", type,
> mod_mem->base, mod_mem->size, err);
> +	return err;
>    }
>
>    /*
>
>
> Thanks for your help
> Christophe

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

