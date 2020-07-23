Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0B22B09A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 15:37:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCD0j4p4dzDrGs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 23:37:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCCyR0M3QzDrCv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 23:35:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=lIe/aXUu; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BCCyQ54xqz8sfr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 23:35:42 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BCCyQ41H9z9sRR; Thu, 23 Jul 2020 23:35:42 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=lIe/aXUu; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BCCyQ0x4yz9sPf
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Jul 2020 23:35:41 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id m9so3024586pfh.0
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Jul 2020 06:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=cwVPi0Cn4h2WH4C8S19ASg8aJejy3Y+/nEhD+9llv+M=;
 b=lIe/aXUucMOPiz/OXbLJLoTNdmO8U6F//K4bpATeZ7Qvr1NHKFxbt/BidSit7gvdZ4
 jGbUgla6NmnrChfi+XoPbf8qsFRE6R0Xw5CmRO6x5C6GTWuHa8TRw6xIcbRAj9kMX5xC
 Opa8OYI/qeofN7ancNGl5hhstiUdnWZIkfLL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=cwVPi0Cn4h2WH4C8S19ASg8aJejy3Y+/nEhD+9llv+M=;
 b=pq7cHow8IGaZ02DZMCOzgjkpA4oGUSyTfEo2FiZCmIhYFJRArrsWtqpw1Zbd3RB06A
 gQzxALVZ66VataaT72zTmq85/yv/IVYk7JSaLBqSZsJSGNzsCdehxsBDr/lkO+sPwoCd
 cbfFtki7MEIq5lnBPaEBjCWqK5WWyyy/DaQoEPd91W07heAh4w533Dh5eMoMP5WoIjR8
 5BY1W+oDgWxdOMG/r+gnPtNyb0imu04FDRQWawd1WUuW/gb4t5e4IZH2gCjIqUCCSXb9
 bLAMoDA6IU6/yMoVYdBxit9qGwcxOW8yRXSwjTQQvZ7bKswG9uGIcmQPdI0FLI2LDXht
 ui7g==
X-Gm-Message-State: AOAM5330DhLot0QlUinR8+ewTFBu0sO7Dvw4+j1mb0rjyQQ4hWgcNL2n
 4xMNC+OAN3cnVsWtda8Mxm+F7g==
X-Google-Smtp-Source: ABdhPJwpmaoVdBtL1TggEkAp2g7fzQLYdBpNl5qWeNK/pKx/DYAV+TaVosTRobJq28Geqe135bCZpw==
X-Received: by 2002:aa7:930b:: with SMTP id 11mr4359011pfj.320.1595511340121; 
 Thu, 23 Jul 2020 06:35:40 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-8915-8b02-da60-7583.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:8915:8b02:da60:7583])
 by smtp.gmail.com with ESMTPSA id b82sm3064805pfb.215.2020.07.23.06.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 06:35:39 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH 2/5] powerpc: Allow 4096 bytes of stack expansion for the
 signal frame
In-Reply-To: <20200703141327.1732550-2-mpe@ellerman.id.au>
References: <20200703141327.1732550-1-mpe@ellerman.id.au>
 <20200703141327.1732550-2-mpe@ellerman.id.au>
Date: Thu, 23 Jul 2020 23:35:36 +1000
Message-ID: <87blk6tkuv.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, hughd@google.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Unfortunately, this patch doesn't completely solve the problem.

Trying the original reproducer, I'm still able to trigger the crash even
with this patch, although not 100% of the time. (If I turn ASLR off
outside of tmux it reliably crashes, if I turn ASLR off _inside_ of tmux
it reliably succeeds; all of this is on a serial console.)

./foo 1241000 & sleep 1; killall -USR1 foo; echo ok

If I add some debugging information, I see that I'm getting
address + 4096 = 7fffffed0fa0
gpr1 =           7fffffed1020

So address + 4096 is 0x80 bytes below the 4k window. I haven't been able
to figure out why, gdb gives me a NIP in __kernel_sigtramp_rt64 but I
don't know what to make of that.

Kind regards,
Daniel

P.S. I don't know what your policy on linking to kernel bugzilla is, but
if you want:

Link: https://bugzilla.kernel.org/show_bug.cgi?id=205183


> Reported-by: Tom Lane <tgl@sss.pgh.pa.us>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/mm/fault.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 641fc5f3d7dd..ed01329dd12b 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -274,7 +274,7 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
>  	/*
>  	 * N.B. The POWER/Open ABI allows programs to access up to
>  	 * 288 bytes below the stack pointer.
> -	 * The kernel signal delivery code writes up to about 1.5kB
> +	 * The kernel signal delivery code writes up to 4KB
>  	 * below the stack pointer (r1) before decrementing it.
>  	 * The exec code can write slightly over 640kB to the stack
>  	 * before setting the user r1.  Thus we allow the stack to
> @@ -299,7 +299,7 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
>  		 * between the last mapped region and the stack will
>  		 * expand the stack rather than segfaulting.
>  		 */
> -		if (address + 2048 >= uregs->gpr[1])
> +		if (address + 4096 >= uregs->gpr[1])
>  			return false;
>  
>  		if ((flags & FAULT_FLAG_WRITE) && (flags & FAULT_FLAG_USER) &&
> -- 
> 2.25.1
