Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2022D7594B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 13:56:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fc5drKTf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Z6N0V7Zz30g7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 21:56:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fc5drKTf;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Z5R3mLVz2ykV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 21:55:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1689767738;
	bh=cH2/nzVcXEEHjVV40m2k9jPCJ614RcL25Duhv634PGw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Fc5drKTf7dgjP2S8xnSmZmYb6Ow3YvMz4iFLngt/IYHl9ErC5RiBRV09v2oNpQB1E
	 t/+stHPHA9OAWnn457+dDLZlEfZ8/yz8HEgWcLpdrFASgLsypkJ/Vf3t3LvzxCi1wj
	 3Cxe+V/iSsVumiXIB7k0y5ulZLLB6YDHFLkRMI9z+lxz2/RgLVa+PVkSK69nPNVCvl
	 ArjyEEXsSb/XTkS9SELs9/Ge4y1hsaqsDmltqxWh4onpLKzEugz5bF20s4lgdtSfGJ
	 +BserTOUifRmKLhqrG1LgTiHlBIGSeMLKlJc1+V5qGt5kv+GMCgoKcd87aYG61NE4Z
	 TID90ajrGC1vg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R5Z5Q3Tzzz4wb0;
	Wed, 19 Jul 2023 21:55:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Ogness <john.ogness@linutronix.de>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/build: vdso linker warning for orphan sections
In-Reply-To: <87o7k9l2oj.fsf@jogness.linutronix.de>
References: <20230609051002.3342-1-npiggin@gmail.com>
 <871qh6wcgb.fsf@jogness.linutronix.de> <871qh5jrz2.fsf@mail.lhotse>
 <87o7k9l2oj.fsf@jogness.linutronix.de>
Date: Wed, 19 Jul 2023 21:55:34 +1000
Message-ID: <87ttu0i095.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

John Ogness <john.ogness@linutronix.de> writes:
> On 2023-07-18, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>> ld: warning: discarding dynamic section .rela.opd
>>>
>>> and bisects to:
>>>
>>> 8ad57add77d3 ("powerpc/build: vdso linker warning for orphan sections")
>>
>> Can you test with a newer compiler/binutils?
>
> Testing the Debian release cross compilers/binutils:
>
> Debian 10 / gcc 8.3.0  / ld 2.31.1: generates the warning
>
> Debian 11 / gcc 10.2.1 / ld 2.35.2: generates the warning
>
> Debian 12 / gcc 12.2.0 / ld 2.40:   does _not_ generate the warning
>
> I suppose moving to the newer toolchain is the workaround. Although it
> is a bit unusual to require such a modern toolchain in order to build a
> kernel without warnings.

I didn't mean that you should move to a new toolchain to avoid the
warning, I was just curious why you're the only person to see it.

I regularly test with a gcc 5.5.0 / ld 2.29 toolchain and gcc 13.1.1 /
ld 2.39, and I haven't seen the warning. I tried a bunch of others and
can't reproduce it.

Can you confirm that this makes the warning go away?

cheers


diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
index bda6c8cdd459..286e1597c548 100644
--- a/arch/powerpc/kernel/vdso/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
@@ -85,7 +85,7 @@ SECTIONS
 		*(.branch_lt)
 		*(.data .data.* .gnu.linkonce.d.* .sdata*)
 		*(.bss .sbss .dynbss .dynsbss)
-		*(.opd)
+		*(.opd .rela.opd)
 		*(.glink .iplt .plt .rela*)
 	}
 }
