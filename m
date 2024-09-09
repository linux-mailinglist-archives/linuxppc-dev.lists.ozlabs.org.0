Return-Path: <linuxppc-dev+bounces-1190-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFA097207E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 19:28:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2Yh86mYyz2xHR;
	Tue, 10 Sep 2024 03:28:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725902888;
	cv=none; b=JqBZ/kofxtrw3pbvQ7yzqJU3YJFEG+YC83mk4ktFmkoAnnZf87qjzsmVUQWn26W0o/UQ2/nNgKKhEGaDtiXlCAHGFftHDb2+GihRiGQ1VyA8xdnGB5hrmicGxQ7jXber69mw7MTC3cvELPWBA67oJNAaNEaNS5mXhJg2vDmXg8b+di7svglcB3aJM4NWH+n6hvBbVOnl1EVntrQ4NtcynGAv4GlNvtpg+gN92+bLtP970ARPZ5YvvAkkhxjWqHDAmthPQZfmxsMwjPuY6rsa7eF7RSoHL81CxyExplREvMYWQK85oQk9UVLRAUN1dfPRTaJWZME3SHGELM9LXb0gsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725902888; c=relaxed/relaxed;
	bh=TokKyNRJI41lLvFvCIHxjkW+69z8BSy0aLNq+zQxdK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2BAG6VThnxGz+G95JERxg1VcSU+8NZ41GTuBBN3dNIX70hJSqRTzAds1RYgcA9mg8astqItu0pOQnQQx+gZo9KTILfIYd7wAsvITbrybkrXEMpaTv0bmaG0BG+EscjEaICI1RDco5cDy08ARSyrB2T4u6Jrtl7H5pjdevicDn1t5RdX/ye5oEIHgl+VvvFsDIrcscY7v60oZ4NMk1FUyP0/pJXxxnQhLz8u6amn1tz4RH4jus2PzblauMhI3ExdO0gquZV6KfGI9nwBKkkXzh/RhFQpHYZTdUeuG0xG5f/O2VYZ7N9j7sIt5JgX+K9LnKk1OkPv5+AJopTILZ8+hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2Yh84Gmrz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 03:28:07 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X2Yh44JjTz9sPd;
	Mon,  9 Sep 2024 19:28:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QisATpZx7e2u; Mon,  9 Sep 2024 19:28:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X2Yh43NNVz9rvV;
	Mon,  9 Sep 2024 19:28:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5EE818B770;
	Mon,  9 Sep 2024 19:28:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wkH-WeMfTZ0k; Mon,  9 Sep 2024 19:28:04 +0200 (CEST)
Received: from [192.168.232.154] (PO25124.IDSI0.si.c-s.fr [192.168.232.154])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 03C138B76C;
	Mon,  9 Sep 2024 19:28:03 +0200 (CEST)
Message-ID: <b154ab25-70f6-46cd-99db-ccfbe3e13fb7@csgroup.eu>
Date: Mon, 9 Sep 2024 19:28:03 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the powerpc tree
To: Masahiro Yamada <masahiroy@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Rob Herring (Arm)"
 <robh@kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240909200948.70087f49@canb.auug.org.au>
 <afa6f06a-8d92-4ac1-b5fe-d5b6ade3f740@csgroup.eu>
 <20240910005808.2e355995@canb.auug.org.au>
 <CAK7LNARMD=PR9x-OMN5QJHmeDdAzDM=2F47ccqdLHHGTxVq5Jg@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAK7LNARMD=PR9x-OMN5QJHmeDdAzDM=2F47ccqdLHHGTxVq5Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2024 à 18:23, Masahiro Yamada a écrit :
> On Mon, Sep 9, 2024 at 11:58 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi Christophe,
>>
>> On Mon, 9 Sep 2024 16:22:26 +0200 Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>>
>>> Le 09/09/2024 à 12:09, Stephen Rothwell a écrit :
>>>> Hi all,
>>>>
>>>> After merging the powerpc tree, today's linux-next build (powerpc
>>>> ppc44x_defconfig) failed like this:
>>>>
>>>> make[3]: *** No rule to make target 'arch/powerpc/boot/treeImage.ebony', needed by 'arch/powerpc/boot/zImage'.  Stop.
>>>> make[2]: *** [/home/sfr/next/next/arch/powerpc/Makefile:236: zImage] Error 2
>>>> make[1]: *** [/home/sfr/next/next/Makefile:224: __sub-make] Error 2
>>>> make: *** [Makefile:224: __sub-make] Error 2
>>>>
>>>> It is not obvious to me what change caused this, so I have just left
>>>> the build  broken for today.
>>>>
>>>
>>> Bisected to commit e6abfb536d16 ("kbuild: split device tree build rules into scripts/Makefile.dtbs")
>>
>> Thanks for that.
>>
>> --
>> Cheers,
>> Stephen Rothwell
> 
> 
> I squashed the following fix. Hopefully, it will be ok tomorrow.
> 
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 6385e7aa5dbb..8403eba15457 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -444,7 +444,7 @@ ifneq ($(userprogs),)
>   include $(srctree)/scripts/Makefile.userprogs
>   endif
> 
> -ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb.o %.dtbo.o,$(targets)),)
> +ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o
> %.dtbo.o,$(targets)),)
>   include $(srctree)/scripts/Makefile.dtbs
>   endif
> 

The build of ppc44x_defconfig is ok with this change
on top of next-20240909

