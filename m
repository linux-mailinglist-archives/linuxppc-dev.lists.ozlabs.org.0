Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C079A729063
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 08:51:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcsF54JHGz3fbY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 16:51:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=yangtiezhu@loongson.cn; receiver=<UNKNOWN>)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcsDY0mMNz3f02
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 16:51:05 +1000 (AEST)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxRunVy4JkcPAAAA--.1016S3;
	Fri, 09 Jun 2023 14:51:01 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxZuTSy4Jk8QsKAA--.30794S3;
	Fri, 09 Jun 2023 14:51:00 +0800 (CST)
Subject: Re: [RFC PATCH] asm-generic: Unify uapi bitsperlong.h
To: Arnd Bergmann <arnd@arndb.de>
References: <1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn>
 <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
 <76d3be65-91df-7969-5303-38231a7df926@loongson.cn>
 <a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <ca4c4968-411d-4e2c-543e-ffb62413ddef@loongson.cn>
Date: Fri, 9 Jun 2023 14:50:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8AxZuTSy4Jk8QsKAA--.30794S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr1UWFy8Kr1kJFy7Kr47KFX_yoW5JFyrpF
	4UGF1j9r4kAr1fAFn2yw4jqa4Fyws7KF1aq3s0gryxJFs0gFyrtry29w4agFWqvr18Jr4j
	93yUXFy5uay0yFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOiSdUUU
	UU=
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, llvm@lists.linux.dev, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongson-kernel@lists.loongnix.cn
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/08/2023 08:56 PM, Arnd Bergmann wrote:
> On Thu, Jun 8, 2023, at 09:04, Tiezhu Yang wrote:
>> On 05/09/2023 05:37 PM, Arnd Bergmann wrote:
>>> On Tue, May 9, 2023, at 09:05, Tiezhu Yang wrote:
>>>
>>> I think we are completely safe on the architectures that were
>>> added since the linux-3.x days (arm64, riscv, csky, openrisc,
>>> loongarch, nios2, and hexagon), but for the older ones there
>>> is a regression risk. Especially on targets that are not that
>>> actively maintained (sparc, alpha, ia64, sh, ...) there is
>>> a good chance that users are stuck on ancient toolchains.
>>> It's probably also a safe assumption that anyone with an older
>>> libc version won't be using the latest kernel headers, so
>>> I think we can still do this across architectures if both
>>> glibc and musl already require a compiler that is new enough,
>>> or alternatively if we know that the kernel headers require
>>> a new compiler for other reasons and nobody has complained.
>>>
>>> For glibc, it looks the minimum compiler version was raised
>>> from gcc-5 to gcc-8 four years ago, so we should be fine.
>>>
>>> In musl, the documentation states that at least gcc-3.4 or
>>> clang-3.2 are required, which probably predate the
>>> __SIZEOF_LONG__ macro. On the other hand, musl was only
>>> released in 2011, and building musl itself explicitly
>>> does not require kernel uapi headers, so this may not
>>> be too critical.
>>>
>>> There is also uClibc, but I could not find any minimum
>>> supported compiler version for that. Most commonly, this
>>> one is used for cross-build environments, so it's also
>>> less likely to have libc/gcc/headers being wildly out of
>>> sync. Not sure.
>>>
>>>       Arnd
>>>
>>> [1] https://sourceware.org/pipermail/libc-alpha/2019-January/101010.html
>>>
>>
>> Thanks Arnd for the detailed reply.
>> Any more comments? What should I do in the next step?
>
> I think the summary is "it's probably fine", but I don't know
> for sure, and it may not be worth the benefit.

Thank you, it is very clear now.

> Maybe you can prepare a v2 that only does this for the newer
> architectures I mentioned above, with and an explanation and
> link to my above reply in the file comments?

Only arm64, riscv and loongarch belong to the newer architectures
which are related with this change, I am not sure it is necessary
to "unify" uapi bitsperlong.h for them.

Anyway, let me try, I will send a new version, maybe this is going
to progress in the right direction.

Thanks,
Tiezhu

