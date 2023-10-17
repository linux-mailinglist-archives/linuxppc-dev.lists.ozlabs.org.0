Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9E17CB95D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 05:41:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PjOEdiXp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8ft13vH8z3cdV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 14:41:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PjOEdiXp;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8fs5657dz3bgs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 14:40:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697514056;
	bh=jJ6YCaQKtlze5+uM/u6aOVJZXzf5N/fj9GaVE7lnjI4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PjOEdiXpRQQg90wq6ANGI5OfAL2gLzsgI/JXJx91na+B8B1eBhkIHdlvDht51iFwq
	 xviyT494yXZedc2h/9J7MYqDmsj0I8qu3Yf282ByUAYdFL6m43/BKUPaCu0RKAqvJF
	 R1oRuDLUR/MtwCr4GSpzu2ep3Z2Fd2+GQO7vHlUTPXWeGCNDtYPi43S/WocuqkreZB
	 PiPGmBlkzR1Brs1jnUC4YmqvonF3rGQKnivQse/dmRInZ0ejcOtXAYoCT1JO4yO5O/
	 tyY+HsBa2t8bmi6SHLSb2Z2qygfv1Xv6a8xa+TGdgB+5Rusl1JYP5hjIjXuJDin87H
	 1koCjOJeBVF8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S8fs460fhz4xF9;
	Tue, 17 Oct 2023 14:40:56 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG:
 Unable to handle kernel data access at 0xfeffbb62ffec65fe)
In-Reply-To: <20231012164903.0ee6c1e1@yea>
References: <20230929132750.3cd98452@yea> <87lec8qd8b.fsf@mail.lhotse>
 <20231012164903.0ee6c1e1@yea>
Date: Tue, 17 Oct 2023 14:40:49 +1100
Message-ID: <875y35zzjy.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, willy@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Erhard Furtner <erhard_f@mailbox.org> writes:
> On Thu, 12 Oct 2023 22:41:56 +1100
> Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>> Can you checkout the exact commit that crash is from and do:
>> 
>>  $ make arch/powerpc/mm/book3s64/hash_utils.lst
>> 
>> And paste/attach the content of that file.
>> 
>> cheers
>
> Ok, attached the output from:
>
> git checkout 9fee28baa601f4dbf869b1373183b312d2d5ef3d
> make vmlinux -j16
> make arch/powerpc/mm/book3s64/hash_utils.lst
>
> Commit 9fee28baa601f4dbf869b1373183b312d2d5ef3d is the 1st bad commit of my bisect.

Thanks.

I think I've reproduced the crash on my Quad G5 by using your config
with some things tweaked, but I don't get any output on the screen :/

Do you mind booting the commit above and taking a photo of the oops and
attach it here. The oops you transcribed didn't entirely make sense,
probably due to a typo here or there, so a photo would be best.

cheers
