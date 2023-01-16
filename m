Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C8166CFDD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 21:09:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwjm15LQYz3cGk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 07:09:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oUEJmkN2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oUEJmkN2;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nwjl23CTtz3c4c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 07:08:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=yFVciWdIzPstN0lMoVeAI5kAz1ktvsyoitwNKrcy8UI=; b=oUEJmkN2crgBTChY6Y4acT11fR
	84TFgO+yf2GwMCh4C2ZC/vRRPrDNgG5XsLlNVmBqQlTH37XKt468ACMHJMnYz+7kX+WX8WKo3jOWW
	t13/mq2wp0mlK0GHoljrIPeA/j7RCr5YtvPyV4qnHR/wXejP0cQItVUEV84SDtXIUWySwS4oLGhNS
	YxJt58MR+g0WlrDP3ZJjP/u5tCzzKbtcNvw5gRqZEYD32ucm5RL3aEjtfGQd8SsR1WXhuZT+zpo89
	HxIYEmATYpXoO4jZnTTAHHs8lngtofk6H9wnw4ISdPGzTJEmgSYkHvWkqkNRMjcjIX0ZikOKFfBy5
	Mc0yfW3w==;
Received: from [76.243.124.25] (helo=[192.168.5.123])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHVmM-0092GP-Gi; Mon, 16 Jan 2023 20:08:26 +0000
Message-ID: <a449698b-93f5-0742-77fe-5699544eab5c@infradead.org>
Date: Mon, 16 Jan 2023 12:08:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] powerpc/ps3: Change updateboltedpp panic to info
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <cover.1672767868.git.geoff@infradead.org>
 <2df879d982809c05b0dfade57942fe03dbe9e7de.1672767868.git.geoff@infradead.org>
 <25cc9a51-2311-d7d3-3451-08725e6384cd@csgroup.eu>
 <284aed88-dc26-d74a-cf7a-f5875ba058eb@infradead.org>
 <87mt6j9wcf.fsf@mpe.ellerman.id.au>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <87mt6j9wcf.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 1/15/23 16:06, Michael Ellerman wrote:
> Geoff Levand <geoff@infradead.org> writes:
>> On 1/9/23 09:41, Christophe Leroy wrote:
>>>
>>>
>>> Le 03/01/2023 à 18:51, Geoff Levand a écrit :
>>>> Commit fdacae8a84024474afff234bdd1dbe19ad597a10 (powerpc: Activate
>>>> CONFIG_STRICT_KERNEL_RWX by default) causes ps3_hpte_updateboltedpp()
>>>> to be called.  Change the panic statment in ps3_hpte_updateboltedpp()
>>>> to a pr_info statement so that bootup can continue.
>>>
>>> But if I understand correctly, it means that CONFIG_STRICT_KERNEL_RWX 
>>> won't work then.
>>>
>>> So, shouldn't we keep the panic and forbid CONFIG_STRICT_KERNEL_RWX on PS3 ?
>>
>> mmu_hash_ops.updateboltedpp returns void, so I can't return an error code to
>> indicate the feature is not supported.
> 
> We could change that in the medium term.
> 
>> I could do something like this in arch/powerpc/Kconfig:
>>
>> -       select ARCH_HAS_STRICT_KERNEL_RWX       if (PPC_BOOK3S || PPC_8xx || 40x) && !HIBERNATION
>> +       select ARCH_HAS_STRICT_KERNEL_RWX       if (PPC_BOOK3S || PPC_8xx || 40x) && !PPC_PS3 && !HIBERNATION
>>
>> But then the ppc64_defconfig would be built without STRICT_KERNEL_RWX.
> 
> Yeah that would be a pity.
> 
> We could do the above and disable PS3 in ppc64_defconfig, allowing
> ppc64_defconfig to still have STRICT_KERNEL_RWX.

I really want to keep PS3 included in ppc64_defconfig.  Not that I expect
anyone to boot a ppc64_defconfig kernel on PS3, but that is one of the
'standard' configs that is built by some automated builders, and generally by
anyone doing changes to the powerpc arch, and I want to keep getting those
build tests for PS3.

> I assume actual PS3 users would use a ps3_defconfig anyway right?

Yeah, a derivative of it.  They are most likely are using 'Jailbreak' firmware
that allows them to run Linux in the gameos partition.

> Relatedly are there any actual PS3 users left? ;)

It seems there are more users now than a few years ago.  I think they buy PS5s
to play the latest games, and use their old console to mess around with Linux.
I generally get a private inquiry every 3 or 4 weeks.  Usually asking how to
update their kernel, or how to install a modern distro.

>> What other 'clean' way is there?
> 
> If we want to have a multi-platform kernel image that can boot on PS3
> and other platforms, and have strict kernel RWX, then we need some
> runtime logic to deal with that.
> 
> I'd rather not do that though, because it adds complexity to deal with a
> pretty obscure corner case, and I suspect no one really boots a
> ppc64_defconfig on actual PS3 hardware these days.
> 
> So my preference is we disable PS3 in ppc64_defconfig, and make PS3
> incompatible with STRICT_KERNEL_RWX.

As mentioned, I'd really like to keep PS3 included in ppc64_defconfig.  My
original patch that basically just ignores the call to
mmu_hash_ops.updateboltedpp allows that, and I haven't experienced any problems
with it yet.

My preference would be to keep PS3 in ppc64_defconfig, and either apply my
original patch, or I keep that patch in my ps3-linux repo on kernel.org. Then,
if we end up adding runtime support for RWX I then fixup PS3 to use that.

-Geoff


