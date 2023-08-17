Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B882780183
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 01:14:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VTIw7qbl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRgn43BrZz3c8L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 09:14:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VTIw7qbl;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRgm738NTz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 09:13:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692314006;
	bh=YbjEnDRfM+qEeTdbHd5iPg7BimqSQ5CzCBhJWhy8Rj8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VTIw7qbl1HFnenpBUjUXU9vNC6TNB6ni6isW2OpmXqPgPtTUv+Nu5EhIEI2uI+l7O
	 pdcmT9e7wx+6T63eVULeBmajs7giN+oIL8QvVIE7BZ8XmlWv/5nX1o48EleYooeUig
	 ZuN6RaQJ/d7jlj37o082Nb8ZaZ6qJH9pWGZwneJVlra0gz5qCcG+fP2qtkSMgeX5qN
	 JnGJcFyduRpdoXgEBl7wWQ0qNtTtZEB6Lnma5NQBpLhgyM0/ZaEbVx06q4w4HkjGUr
	 p6WjbM44ahBt6BCsrNBMude0HDb3mZCRVFAIUF19QPsplgesOsLexlIcwfEFc3Eonq
	 61DNxKay421VA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRgm56s8dz4wb0;
	Fri, 18 Aug 2023 09:13:25 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Erhard Furtner <erhard_f@mailbox.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
In-Reply-To: <20230817203202.2b4c273c@yea>
References: <20230811014845.1bf6771d@yea>
 <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
 <20230813213855.794b3c8f@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
 <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
 <20230817203202.2b4c273c@yea>
Date: Fri, 18 Aug 2023 09:13:21 +1000
Message-ID: <87y1i9clf2.fsf@mail.lhotse>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Erhard Furtner <erhard_f@mailbox.org> writes:
> On Wed, 16 Aug 2023 15:56:26 +0000
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>
>> Not sure this is the reason of the crash. Just that it disables bootx 
>> console here and doesn't re-enable any console before the crash.
>> 
>> Could you move the call to btext_unmap() after the call to 
>> memblock_set_current_limit(lowmem_end_addr); at the end of function 
>> MMU_init()
>> 
>> And redo the test, still with my patch applied for the additional pr_infos.
>
> I moved btext_unmap() as you suggested and the order of functions displayed changed accordingly. Now the freeze happens later but still after the 1st call to btext_unmap():
>
> [    0.000000] printk: bootconsole [udbg0] enabled
> [    0.000000] Total memory = 2048MB; using 4096kB for hash table
> [    0.000000] mapin_ram:125
> [    0.000000] mmu_mapin_ram:169 0 30000000 1400000 2000000
> [    0.000000] __mmu_mapin_ram:146 0 1400000
> [    0.000000] __mmu_mapin_ram:155 1400000
> [    0.000000] __mmu_mapin_ram:146 1400000 30000000
> [    0.000000] __mmu_mapin_ram:155 20000000
> [    0.000000] __mapin_ram_chunk:107 20000000 30000000
> [    0.000000] __mapin_ram_chunk:117
> [    0.000000] mapin_ram:134
> [    0.000000] kasan_mmu_init:129
> [    0.000000] kasan_mmu_init:132 0
> [    0.000000] kasan_mmu_init:137
> [    0.000000] setup_kuap:23
> [    0.000000] setup_kuap:25
> [    0.000000] setup_kuap:30
> [    0.000000] setup_kuap:35
> [    0.000000] Activating Kernel Userspace Access Protection
> [    0.000000] setup_kuap:40
> [    0.000000] Activating Kernel Userspace Execution Prevention
> [    0.000000] btext_unmap:129

Try just removing the call to btext_unmap() entirely and see how far it goes?

cheers
