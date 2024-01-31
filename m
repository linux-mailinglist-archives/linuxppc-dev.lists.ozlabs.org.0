Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3AB844AC8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 23:11:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=tehB01M4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQGTs13Yxz3c56
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 09:11:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=tehB01M4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQGSy43Hkz307y
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 09:10:57 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240131221046euoutp02a569f1c949d88ca027aefdc47c5e008b~vjh7bSIwK2031720317euoutp025
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 22:10:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240131221046euoutp02a569f1c949d88ca027aefdc47c5e008b~vjh7bSIwK2031720317euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1706739047;
	bh=xw9bFaD6gvHKRBgFZNWh1F+5+rSksSy9A8PcP7zEdkA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=tehB01M4+g4Lrwcx3WtQCyZOnhrp0OAf0dSJ8EWNi9LSiJy1ZMf8ZR6Zdevmdbnbb
	 G0JvyemnvwYeYNIXy23c3BhctypDEjbPFvvjhFB4GDr3Q4l41N7PVRN5VU9JvZg2tH
	 tXMcVlOJwvNGluKjZ0Rn3hOI/ZEd4yhcdWD+SKLE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240131221046eucas1p10ad24cc6fd163a129e2e99d88de7e5b4~vjh7BxA381145811458eucas1p1E;
	Wed, 31 Jan 2024 22:10:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 1B.BE.09814.665CAB56; Wed, 31
	Jan 2024 22:10:46 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240131221045eucas1p25121869f8c1d945ea470fc3576fda1cc~vjh5_Ko3q2047520475eucas1p2x;
	Wed, 31 Jan 2024 22:10:45 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240131221045eusmtrp20f10545a103d1a52f8e3a5bd91e5005e~vjh59nBwy2952229522eusmtrp2v;
	Wed, 31 Jan 2024 22:10:45 +0000 (GMT)
X-AuditID: cbfec7f4-711ff70000002656-d3-65bac5668c91
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id EA.AC.10702.565CAB56; Wed, 31
	Jan 2024 22:10:45 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240131221044eusmtip1cab9fe7ad9b45c7529c0c3acfd9d1ffe~vjh5I5kTT0928909289eusmtip1M;
	Wed, 31 Jan 2024 22:10:44 +0000 (GMT)
Message-ID: <677c703b-4ece-4cfb-8f9a-a2c17eae869a@samsung.com>
Date: Wed, 31 Jan 2024 23:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro()
 at all time
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Chen-Yu Tsai
	<wenst@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <27eb37bb-f4eb-4cfb-ba3f-2317856f7b4b@csgroup.eu>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDKsWRmVeSWpSXmKPExsWy7djPc7ppR3elGlzulrT4O+kYu8X7ZT2M
	FncmPWe32PT4GqvF5V1z2CwaZn9ntfj9/R+rxY0JTxkttjQcYrP4+eIGi8WMtsusDtwea+at
	YfT4/WsSo8fshossHl9vnmPyWPSygcVj56y77B6bVnWyeWxeUu9xfsZCRo/Pm+QCuKK4bFJS
	czLLUov07RK4Mi5eWcpUcL+oouHUGrYGxndJXYycHBICJhIHn85k72Lk4hASWMEocbJpKjOE
	84VRYtbuqywQzmdGib/ze9hhWtZs388IkVjOKPF21y6o/o+MEv0vl4BV8QrYSWzs2wtkc3Cw
	CKhKzP5aDBEWlDg58wkLiC0qIC9x/9YMsHJhgQiJNZOuMYPYzALiEreezGcCmSkisIpRouXH
	IrBtzAKvmCS29p4Dq2ITMJToetvFBmJzAi27vrmBFaJbXqJ562ywJyQEFnNKrPv6kgXibheJ
	ZdtPMEPYwhKvjm+B+kdG4v9OiHUSAu2MEgt+34dyJjBKNDy/xQhRZS1x59wvNpB/mAU0Jdbv
	0ocIO0qsftzDAhKWEOCTuPFWEOIIPolJ26YzQ4R5JTrahCCq1SRmHV8Ht/bghUvMExiVZiEF
	zCykAJiF5J1ZCHsXMLKsYhRPLS3OTU8tNspLLdcrTswtLs1L10vOz93ECExwp/8d/7KDcfmr
	j3qHGJk4GA8xSnAwK4nwrpTbmSrEm5JYWZValB9fVJqTWnyIUZqDRUmcVzVFPlVIID2xJDU7
	NbUgtQgmy8TBKdXAVDvnWlzGRutnnHKxTw9K1av5yi4VKPP17vWRvvJJWcBzD6faZ74sSetk
	vQt/1nN6rru195LRycRLv5NM965dtOVt06/9X1ddnvNxj2xHznO1AC/5T25Bfcf7/24OMElQ
	cJp8P3nHjQMeSxv5+pOO3V/k0DC/Vmjq6wsJUpvEbLSliteoKXcd/rGwaKpoZP35hPAXf3N3
	5nK3Tv8xYaJ2v5Bbr+Hry/2mDKY/62fmSe5Nf7hHpHH3U+XrPXzRXw24JBY1XptxtfG0+ovi
	XT+S7H6vuLd9UdmvTmMP0f2XYqQ+GF4O1r69dE1n0iPReqa7VtzBF/jOZc7pYKs4lzLRdqZR
	osi0yP0phrKZO+YdVWIpzkg01GIuKk4EANOnCHzfAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRmVeSWpSXmKPExsVy+t/xu7qpR3elGrz7LWjxd9Ixdov3y3oY
	Le5Mes5usenxNVaLy7vmsFk0zP7OavH7+z9WixsTnjJabGk4xGbx88UNFosZbZdZHbg91sxb
	w+jx+9ckRo/ZDRdZPL7ePMfksehlA4vHzll32T02repk89i8pN7j/IyFjB6fN8kFcEXp2RTl
	l5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZVy8spSp4H5R
	RcOpNWwNjO+Suhg5OSQETCTWbN/P2MXIxSEksJRR4sGnvUwQCRmJk9MaWCFsYYk/17rYIIre
	M0p0bTvOBpLgFbCT2Ni3l72LkYODRUBVYvbXYoiwoMTJmU9YQGxRAXmJ+7dmgJUIC0RIrNkt
	BRJmFhCXuPVkPhPISBGBVYwSV5ZfAZvPLPCKSaLj2W9miGX9LBKL1/wBu4hNwFCi620X2GJO
	oMXXN0NcxyxgJtG1tYsRwpaXaN46m3kCo9AsJIfMQrJxFpKWWUhaFjCyrGIUSS0tzk3PLTbS
	K07MLS7NS9dLzs/dxAiM523Hfm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeFfK7UwV4k1JrKxKLcqP
	LyrNSS0+xGgKDIyJzFKiyfnAhJJXEm9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliSmp2aWpBa
	BNPHxMEp1cBULvzwdr9NVUdvxIPMB9PW17+IeNYbWzLtaZpQ+93q5uxDBzq9cmIydVicfgTc
	nXfl79XDVitKthy7ZpV6YrNd3d0LH/c46rxd6HVnwQ1Hzmu7Iz+J8YiUCF/zeG/7WHhq2wz7
	bsUfn9K4LouHOPIuWXCfO1tzdoBebP9u11gl3ch/v43WXlr1dOaK7nqhJzM78xWUBPufcR4W
	zV6S9WPDTZONOrV3wrpcc/b5Bz5Qe/rH8/DujVUafPd2RU5nX3A6I9tWc/lepyteh6dXdRmt
	yKgONFqcGi/asqvR0vdrp4ZWokCLQfQD+aOS8pI6Tc5Jl+/vuLF/cdrSNlMGCed++QlKq2bf
	Tm9dU8C6/48SS3FGoqEWc1FxIgB5+7XQcAMAAA==
X-CMS-MailID: 20240131221045eucas1p25121869f8c1d945ea470fc3576fda1cc
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
	<2febff4d-26ba-4809-a124-7add25ab3d35@samsung.com>
	<27eb37bb-f4eb-4cfb-ba3f-2317856f7b4b@csgroup.eu>
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
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 31.01.2024 21:07, Christophe Leroy wrote:
> Le 31/01/2024 à 16:17, Marek Szyprowski a écrit :
>> [Vous ne recevez pas souvent de courriers de m.szyprowski@samsung.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On 31.01.2024 12:58, Christophe Leroy wrote:
>>> Le 30/01/2024 à 18:48, Marek Szyprowski a écrit :
>>>> [Vous ne recevez pas souvent de courriers de m.szyprowski@samsung.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> On 30.01.2024 12:03, Christophe Leroy wrote:
>>>>> Le 30/01/2024 à 10:16, Chen-Yu Tsai a écrit :
>>>>>> [Vous ne recevez pas souvent de courriers de wenst@chromium.org. D?couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentification ]
>>>>>>
>>>>>> On Mon, Jan 29, 2024 at 12:09:50PM -0800, Luis Chamberlain wrote:
>>>>>>> On Thu, Dec 21, 2023 at 10:02:46AM +0100, Christophe Leroy wrote:
>>>>>>>> Declaring rodata_enabled and mark_rodata_ro() at all time
>>>>>>>> helps removing related #ifdefery in C files.
>>>>>>>>
>>>>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>>>>> Very nice cleanup, thanks!, applied and pushed
>>>>>>>
>>>>>>>         Luis
>>>>>> On next-20240130, which has your modules-next branch, and thus this
>>>>>> series and the other "module: Use set_memory_rox()" series applied,
>>>>>> my kernel crashes in some very weird way. Reverting your branch
>>>>>> makes the crash go away.
>>>>>>
>>>>>> I thought I'd report it right away. Maybe you folks would know what's
>>>>>> happening here? This is on arm64.
>>>>> That's strange, it seems to bug in module_bug_finalize() which is
>>>>> _before_ calls to module_enable_ro() and such.
>>>>>
>>>>> Can you try to revert the 6 patches one by one to see which one
>>>>> introduces the problem ?
>>>>>
>>>>> In reality, only patch 677bfb9db8a3 really change things. Other ones are
>>>>> more on less only cleanup.
>>>> I've also run into this issue with today's (20240130) linux-next on my
>>>> test farm. The issue is not fully reproducible, so it was a bit hard to
>>>> bisect it automatically. I've spent some time on manual testing and it
>>>> looks that reverting the following 2 commits on top of linux-next fixes
>>>> the problem:
>>>>
>>>> 65929884f868 ("modules: Remove #ifdef CONFIG_STRICT_MODULE_RWX around
>>>> rodata_enabled")
>>>> 677bfb9db8a3 ("module: Don't ignore errors from set_memory_XX()")
>>>>
>>>> This in fact means that commit 677bfb9db8a3 is responsible for this
>>>> regression, as 65929884f868 has to be reverted only because the latter
>>>> depends on it. Let me know what I can do to help debugging this issue.
>>>>
>>> Thanks for the bisect. I suspect you hit one of the errors and something
>>> goes wrong in the error path.
>>>
>>> To confirm this assumption, could you try with the following change on
>>> top of everything ?
>>
>> Yes, this is the problem. I've added printing a mod->name to the log.
>> Here is a log from kernel build from next-20240130 (sometimes it even
>> boots to shell):
>>
>> # dmesg | grep module_set_memory
>> [    8.061525] module_set_memory(6, 0000000000000000, 0) name ipv6
>> returned -22
>> [    8.067543] WARNING: CPU: 3 PID: 1 at kernel/module/strict_rwx.c:22
>> module_set_memory+0x9c/0xb8
> Would be good if you could show the backtrace too so that we know who is
> the caller. I guess what you show here is what you get on the screen ?
> The backtrace should be available throught 'dmesg'.

Here are relevant parts of the boot log:

[    8.096850] ------------[ cut here ]------------
[    8.096939] module_set_memory(6, 0000000000000000, 0) name ipv6 
returned -22
[    8.102947] WARNING: CPU: 4 PID: 1 at kernel/module/strict_rwx.c:22 
module_set_memory+0x9c/0xb8
[    8.111561] Modules linked in:
[    8.114596] CPU: 4 PID: 1 Comm: systemd Not tainted 
6.8.0-rc2-next-20240130-dirty #14429
[    8.122654] Hardware name: Khadas VIM3 (DT)
[    8.126815] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    8.133747] pc : module_set_memory+0x9c/0xb8
[    8.137994] lr : module_set_memory+0x9c/0xb8
[    8.142240] sp : ffff800083fcba80
[    8.145534] x29: ffff800083fcba80 x28: 0000000000000001 x27: 
ffff80007c024448
[    8.152640] x26: ffff800083fcbc10 x25: ffff80007c007958 x24: 
ffff80007c024450
[    8.159747] x23: ffff800083f2a090 x22: ffff80007c007940 x21: 
0000000000000006
[    8.166854] x20: 00000000ffffffea x19: ffff80007c007af0 x18: 
0000000000000030
[    8.173960] x17: 0000000000000000 x16: 0000000000005932 x15: 
ffffffffffffffff
[    8.181067] x14: ffff800082ea5658 x13: 00000000000003d5 x12: 
0000000000000147
[    8.188174] x11: 6920656d616e2029 x10: ffff800082efd658 x9 : 
00000000fffff000
[    8.195280] x8 : ffff800082ea5658 x7 : ffff800082efd658 x6 : 
0000000000000000
[    8.202387] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 
0000000000000000
[    8.209494] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
ffff0000001f0000
[    8.216601] Call trace:
[    8.219027]  module_set_memory+0x9c/0xb8
[    8.222927]  module_enable_rodata_ro+0x64/0xa0
[    8.227347]  load_module+0x1838/0x1c88
[    8.231074]  init_module_from_file+0x84/0xc0
[    8.235320]  idempotent_init_module+0x180/0x250
[    8.239827]  __arm64_sys_finit_module+0x64/0xa0
[    8.244334]  invoke_syscall+0x48/0x114
[    8.248060]  el0_svc_common.constprop.0+0x40/0xe0
[    8.252740]  do_el0_svc+0x1c/0x28
[    8.256034]  el0_svc+0x4c/0xe4
[    8.259067]  el0t_64_sync_handler+0xc0/0xc4
[    8.263227]  el0t_64_sync+0x190/0x194
[    8.266868] irq event stamp: 1304234
[    8.270421] hardirqs last  enabled at (1304233): [<ffff80008012c95c>] 
console_unlock+0x120/0x12c
[    8.279174] hardirqs last disabled at (1304234): [<ffff800081239bc0>] 
el1_dbg+0x24/0x8c
[    8.287147] softirqs last  enabled at (1301556): [<ffff800080010a60>] 
__do_softirq+0x4a0/0x4e8
[    8.295727] softirqs last disabled at (1301545): [<ffff8000800169b0>] 
____do_softirq+0x10/0x1c
[    8.304307] ---[ end trace 0000000000000000 ]---

[    8.508381] ------------[ cut here ]------------
[    8.508432] module_set_memory(6, 0000000000000000, 0) name x_tables 
returned -22
[    8.514785] WARNING: CPU: 2 PID: 1 at kernel/module/strict_rwx.c:22 
module_set_memory+0x9c/0xb8
[    8.523410] Modules linked in:
[    8.526444] CPU: 2 PID: 1 Comm: systemd Tainted: G W          
6.8.0-rc2-next-20240130-dirty #14429
[    8.535976] Hardware name: Khadas VIM3 (DT)
[    8.540137] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    8.547069] pc : module_set_memory+0x9c/0xb8
[    8.551316] lr : module_set_memory+0x9c/0xb8
[    8.555562] sp : ffff800083fcba80
[    8.558856] x29: ffff800083fcba80 x28: 0000000000000001 x27: 
ffff80007bfab1f0
[    8.565963] x26: ffff800083fcbc10 x25: ffff80007bfa5458 x24: 
ffff80007bfab1f8
[    8.573069] x23: ffff800083f2a090 x22: ffff80007bfa5440 x21: 
0000000000000006
[    8.580176] x20: 00000000ffffffea x19: ffff80007bfa55f0 x18: 
0000000000000030
[    8.587282] x17: 64656e7275746572 x16: 2073656c6261745f x15: 
7820656d616e2029
[    8.594389] x14: ffff800082ea5658 x13: 000000000000044a x12: 
000000000000016e
[    8.601496] x11: 6261745f7820656d x10: ffff800082efd658 x9 : 
00000000fffff000
[    8.608602] x8 : ffff800082ea5658 x7 : ffff800082efd658 x6 : 
0000000000000000
[    8.615709] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 
0000000000000000
[    8.622816] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
ffff0000001f0000
[    8.629923] Call trace:
[    8.632349]  module_set_memory+0x9c/0xb8
[    8.636249]  module_enable_rodata_ro+0x64/0xa0
[    8.640669]  load_module+0x1838/0x1c88
[    8.644396]  init_module_from_file+0x84/0xc0
[    8.648642]  idempotent_init_module+0x180/0x250
[    8.653149]  __arm64_sys_finit_module+0x64/0xa0
[    8.657656]  invoke_syscall+0x48/0x114
[    8.661383]  el0_svc_common.constprop.0+0x40/0xe0
[    8.666062]  do_el0_svc+0x1c/0x28
[    8.669356]  el0_svc+0x4c/0xe4
[    8.672389]  el0t_64_sync_handler+0xc0/0xc4
[    8.676549]  el0t_64_sync+0x190/0x194
[    8.680190] irq event stamp: 1304890
[    8.683742] hardirqs last  enabled at (1304889): [<ffff80008012c95c>] 
console_unlock+0x120/0x12c
[    8.692496] hardirqs last disabled at (1304890): [<ffff800081239bc0>] 
el1_dbg+0x24/0x8c
[    8.700469] softirqs last  enabled at (1304870): [<ffff800080010a60>] 
__do_softirq+0x4a0/0x4e8
[    8.709049] softirqs last disabled at (1304865): [<ffff8000800169b0>] 
____do_softirq+0x10/0x1c
[    8.717629] ---[ end trace 0000000000000000 ]---

[   10.560872] ------------[ cut here ]------------
[   10.560924] module_set_memory(6, 0000000000000000, 0) name dm_mod 
returned -22
[   10.567128] WARNING: CPU: 4 PID: 127 at kernel/module/strict_rwx.c:22 
module_set_memory+0x9c/0xb8
[   10.575902] Modules linked in:
[   10.578937] CPU: 4 PID: 127 Comm: modprobe Tainted: G W          
6.8.0-rc2-next-20240130-dirty #14429
[   10.588728] Hardware name: Khadas VIM3 (DT)
[   10.592889] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[   10.599821] pc : module_set_memory+0x9c/0xb8
[   10.604068] lr : module_set_memory+0x9c/0xb8
[   10.608314] sp : ffff800084da3a80
[   10.611608] x29: ffff800084da3a80 x28: 0000000000000001 x27: 
ffff80007bfbf22c
[   10.618714] x26: ffff800084da3c10 x25: ffff80007bfb4c58 x24: 
ffff80007bfbf234
[   10.623602] systemd[1]: Starting modprobe@efi_pstore.service - Load 
Kernel Module efi_pstore...
[   10.625820] x23: ffff800083f2a090 x22: ffff80007bfb4c40 x21: 
0000000000000006
[   10.625848] x20: 00000000ffffffea x19: ffff80007bfb4df0 x18: 
0000000000000030
[   10.648751] x17: 2d2064656e727574 x16: 657220646f6d5f6d x15: 
6420656d616e2029
[   10.648768] x14: ffff800082ea5658 x13: 000000000000051f x12: 
00000000000001b5
[   10.648782] x11: 5f6d6420656d616e x10: ffff800082efd658 x9 : 
00000000fffff000
[   10.648795] x8 : ffff800082ea5658 x7 : ffff800082efd658 x6 : 
0000000000000000
[   10.677128] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 
0000000000000000
[   10.684235] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
ffff00003d341b80
[   10.691342] Call trace:
[   10.693768]  module_set_memory+0x9c/0xb8
[   10.697668]  module_enable_rodata_ro+0x64/0xa0
[   10.702088]  load_module+0x1838/0x1c88
[   10.705815]  init_module_from_file+0x84/0xc0
[   10.710061]  idempotent_init_module+0x180/0x250
[   10.714568]  __arm64_sys_finit_module+0x64/0xa0
[   10.719075]  invoke_syscall+0x48/0x114
[   10.722801]  el0_svc_common.constprop.0+0x40/0xe0
[   10.727481]  do_el0_svc+0x1c/0x28
[   10.730774]  el0_svc+0x4c/0xe4
[   10.733808]  el0t_64_sync_handler+0xc0/0xc4
[   10.737968]  el0t_64_sync+0x190/0x194
[   10.741609] irq event stamp: 13696
[   10.744988] hardirqs last  enabled at (13695): [<ffff80008012c95c>] 
console_unlock+0x120/0x12c
[   10.753568] hardirqs last disabled at (13696): [<ffff800081239bc0>] 
el1_dbg+0x24/0x8c
[   10.761368] softirqs last  enabled at (13692): [<ffff800080010a60>] 
__do_softirq+0x4a0/0x4e8
[   10.769774] softirqs last disabled at (13683): [<ffff8000800169b0>] 
____do_softirq+0x10/0x1c
[   10.778181] ---[ end trace 0000000000000000 ]---

[   10.860938] ------------[ cut here ]------------
[   10.860989] module_set_memory(6, 0000000000000000, 0) name fuse 
returned -22
[   10.867007] WARNING: CPU: 3 PID: 130 at kernel/module/strict_rwx.c:22 
module_set_memory+0x9c/0xb8
[   10.875796] Modules linked in:
[   10.878829] CPU: 3 PID: 130 Comm: modprobe Tainted: G W          
6.8.0-rc2-next-20240130-dirty #14429
[   10.888621] Hardware name: Khadas VIM3 (DT)
[   10.892781] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[   10.899714] pc : module_set_memory+0x9c/0xb8
[   10.903960] lr : module_set_memory+0x9c/0xb8
[   10.908207] sp : ffff800084d8ba80
[   10.911500] x29: ffff800084d8ba80 x28: 0000000000000001 x27: 
ffff80007bff7148
[   10.918607] x26: ffff800084d8bc10 x25: ffff80007bfee758 x24: 
ffff80007bff7150
[   10.925714] x23: ffff800083f2a090 x22: ffff80007bfee740 x21: 
0000000000000006
[   10.932820] x20: 00000000ffffffea x19: ffff80007bfee8f0 x18: 
0000000000000030
[   10.939927] x17: 0000000000000000 x16: 0000000000000000 x15: 
ffffffffffffffff
[   10.947034] x14: ffff800082ea5658 x13: 000000000000059d x12: 
00000000000001df
[   10.954140] x11: 6620656d616e2029 x10: ffff800082efd658 x9 : 
00000000fffff000
[   10.961247] x8 : ffff800082ea5658 x7 : ffff800082efd658 x6 : 
0000000000000000
[   10.968354] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 
0000000000000000
[   10.975460] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
ffff00000268d280
[   10.982568] Call trace:
[   10.984994]  module_set_memory+0x9c/0xb8
[   10.988894]  module_enable_rodata_ro+0x64/0xa0
[   10.993314]  load_module+0x1838/0x1c88
[   10.997041]  init_module_from_file+0x84/0xc0
[   11.001287]  idempotent_init_module+0x180/0x250
[   11.005794]  __arm64_sys_finit_module+0x64/0xa0
[   11.010301]  invoke_syscall+0x48/0x114
[   11.014027]  el0_svc_common.constprop.0+0x40/0xe0
[   11.018707]  do_el0_svc+0x1c/0x28
[   11.022000]  el0_svc+0x4c/0xe4
[   11.025034]  el0t_64_sync_handler+0xc0/0xc4
[   11.029194]  el0t_64_sync+0x190/0x194
[   11.032835] irq event stamp: 13612
[   11.036214] hardirqs last  enabled at (13611): [<ffff80008012c95c>] 
console_unlock+0x120/0x12c
[   11.044794] hardirqs last disabled at (13612): [<ffff800081239bc0>] 
el1_dbg+0x24/0x8c
[   11.052594] softirqs last  enabled at (13584): [<ffff800080010a60>] 
__do_softirq+0x4a0/0x4e8
[   11.061000] softirqs last disabled at (13333): [<ffff8000800169b0>] 
____do_softirq+0x10/0x1c
[   11.069407] ---[ end trace 0000000000000000 ]---


> I guess we will now seek help from ARM64 people to understand why
> module_set_memory_something() fails with -EINVAL when loading modules.
> > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

