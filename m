Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D9B791F05
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 23:33:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=fOmFJ8+u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rfhhn3TlSz3c2H
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 07:33:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=fOmFJ8+u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.171; helo=mout-p-201.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rfhgt4zLbz2yjD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 07:32:55 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Rfhgg6XPsz9snt;
	Mon,  4 Sep 2023 23:32:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1693863167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UM53ACux6NKc41kZzx4X8OpygN0004owqQaiuc9Z9o=;
	b=fOmFJ8+uFvR8qc8I/KGyqfWOple9quBwSkxucy/JXQM8VyLDQeCIPgBuKcIXH5ZFmk/irY
	zm476i2vPMMNWLTRMcIGohNAmxMIVdlPpshYMgvfR0DoEgNEFySw1JFjdBFrV2gCRe0C+K
	/OsgCiVHjyH7NwP+5Jz0iiXJAhCnDkgVUXTiT2le6Q/dBuGg/r2cZ1mkvfqR6p5IFRobwI
	1z38xUAc3+CQg7P51wa4QTxEnN5argTnTCd9qEx9aCo7ldHggno4iNyBPrh2ZEmqCrq09Z
	bO5zg72E51tyIOjd4Pv5KoZlcKEc5Q/gwrJCz52HVZa33v3hgzltuWmgFyFDig==
Date: Mon, 4 Sep 2023 23:32:44 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Message-ID: <20230904233244.3d7c90d9@yea>
In-Reply-To: <c0891617-43b9-5b56-2c51-69eec81e3b48@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
	<f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
	<20230813213855.794b3c8f@yea>
	<57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
	<20230814192748.56525c82@yea>
	<6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
	<20230815220156.5c234b52@yea>
	<0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
	<20230817203202.2b4c273c@yea>
	<87y1i9clf2.fsf@mail.lhotse>
	<20230818111641.7f680ce7@yea>
	<fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
	<20230818182316.79303545@yea>
	<5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
	<20230824020015.78733931@yea>
	<87jztkvfid.fsf@mail.lhotse>
	<20230828011758.3b7b9daf@yea>
	<1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
	<20230901004417.631dc019@yea>
	<b9671cd2-9cad-c5d9-dd94-8b39f67e29b4@csgroup.eu>
	<20230903230635.5751b620@yea>
	<438d8790-8a55-2f36-4ef0-2fddcb39edae@csgroup.eu>
	<c0891617-43b9-5b56-2c51-69eec81e3b48@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e87a40e6606b3222ece
X-MBO-RS-META: jy6f8bhmuujg4boq4xoeamxr3eq7swft
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

On Mon, 4 Sep 2023 14:55:17 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> > Ok, so lets come back to normal situation. Can you add back kasan_init() 
> > and kasan_late_init(), while keeping the btext changes and Michael's patch.
> > 
> > Then see what result you get with CONFIG_KASAN but without 
> > CONFIG_KASAN_VMALLOC
> > 
> > It would help narrow the problem area because kasan_init() does several 
> > things based on CONFIG_KASAN_VMALLOC.

I can't unselect KASAN_VMALLOC, it is forced on. Can only be unselected on PPC_BOOK3S_64 it seems.

 Symbol: KASAN_VMALLOC [=y]
 Type  : bool
 Defined at lib/Kconfig.kasan:179
   Prompt: Check accesses to vmalloc allocations
   Depends on: KASAN [=y] && HAVE_ARCH_KASAN_VMALLOC [=y]
   Location:
     -> Kernel hacking
       -> Memory Debugging
         -> KASAN: dynamic memory safety error detector (KASAN [=y])
           -> Check accesses to vmalloc allocations (KASAN_VMALLOC [=y])
 Selected by [y]:
   - PPC [=y] && KASAN [=y] && MODULES [=y]
 Selected by [n]:
   - PPC_BOOK3S_64 [=n] && <choice> && KASAN [=y]   && <choice> && KASAN [=y]

> Another thing that could be interesting to test is to remove (or comment 
> out) the following line in arch/powerpc/mm/kasan/Makefile :
> 
>    obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s_32.o
> 
> That way, the weak version of kasan_init_region() will be used instead 
> of the one in book3s_32.c

When I comment out this line the kernel boots fine! Even with btext_unmap() stuff back to default and using 2 CPUs again.

Regards,
Erhard
