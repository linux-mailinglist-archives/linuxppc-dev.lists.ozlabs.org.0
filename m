Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C58C1EA0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 09:04:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d1Z7pyrE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbKcw0WVwz3cYx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 17:04:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d1Z7pyrE;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbKc935QQz30VT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 17:03:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715324626;
	bh=Wwz7PGF/2JLHmkgwfEtn4Lag7AXqlkDZb7B4D9iEdQI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=d1Z7pyrEGBrs6L0dz6cxVggbbbxS4Owx0CmDlA2znN4HgBBG3unC7rP44d4u5muzJ
	 sW6V4HKKp5OuQRS5dDqKiVPOAJJdFBRzJjXVfKWS3xawstBOT548LbQUjb0K9AUi3m
	 TIPnWU/d63yWYygXxoAoPG5Eu0nYq0rJy2yqmDx61YaPDYITg0L9haUpysurM+9Jis
	 mNZz4QMY4q9wj8LBHjY47tQGLA2B4LSyqC0YLLcgDY6kyAZtOH/+cv9gtLPWhh7W3D
	 /t0FWdL/FzbE3P03a5nRQSfQjoSC9TGSahFl4bvIlbbzVPdT15a51DEFnQfpQp5AB6
	 yHZ62XQb2poTw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VbKc13n7cz4wcC;
	Fri, 10 May 2024 17:03:45 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH v2 1/2] powerpc/io: Avoid clang null pointer arithmetic
 warnings
In-Reply-To: <CA+G9fYvo4--rSTHC1Vxdbbe62O6FhL_P2XdcF2Q7ZRku8HjpGg@mail.gmail.com>
References: <20240503075619.394467-1-mpe@ellerman.id.au>
 <CA+G9fYvo4--rSTHC1Vxdbbe62O6FhL_P2XdcF2Q7ZRku8HjpGg@mail.gmail.com>
Date: Fri, 10 May 2024 17:03:45 +1000
Message-ID: <87fruqm9m6.fsf@mail.lhotse>
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
Cc: nathan@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naresh Kamboju <naresh.kamboju@linaro.org> writes:
> On Fri, 3 May 2024 at 13:26, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> With -Wextra clang warns about pointer arithmetic using a null pointer.
>> When building with CONFIG_PCI=n, that triggers a warning in the IO
>> accessors, eg:
>>
>>   In file included from linux/arch/powerpc/include/asm/io.h:672:
>>   linux/arch/powerpc/include/asm/io-defs.h:23:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>>      23 | DEF_PCI_AC_RET(inb, u8, (unsigned long port), (port), pio, port)
>>         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   ...
>>   linux/arch/powerpc/include/asm/io.h:591:53: note: expanded from macro '__do_inb'
>>     591 | #define __do_inb(port)          readb((PCI_IO_ADDR)_IO_BASE + port);
>>         |                                       ~~~~~~~~~~~~~~~~~~~~~ ^
>>
>> That is because when CONFIG_PCI=n, _IO_BASE is defined as 0.
>>
>> Although _IO_BASE is defined as plain 0, the cast (PCI_IO_ADDR) converts
>> it to void * before the addition with port happens.
>>
>> Instead the addition can be done first, and then the cast. The resulting
>> value will be the same, but avoids the warning, and also avoids void
>> pointer arithmetic which is apparently non-standard.
>>
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>> Closes: https://lore.kernel.org/all/CA+G9fYtEh8zmq8k8wE-8RZwW-Qr927RLTn+KqGnq1F=ptaaNsA@mail.gmail.com
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

Thanks.

cheers
