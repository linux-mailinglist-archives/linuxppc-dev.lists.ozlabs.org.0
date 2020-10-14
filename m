Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6180128D755
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 02:14:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9tG53Ns3zDqTJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 11:14:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9tDS5ZZqzDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 11:13:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nS9Y29JA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9tDS1d3yz9sVS;
 Wed, 14 Oct 2020 11:13:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602634408;
 bh=kWr8uHYNyFOfUWg35FUMahaQ83JjMGcRXGempu9ybD0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nS9Y29JAUsw49i0j0VMBbrzXc3gOqyL1ZeUmGeO5zhOjwIByt6IodOdoXGlbKqs2G
 scFUqq6SMzlbhsiWYpTNgOgYn820EgQY0HllZDzowDwnAqDrmdkQ0r+8C9xU1pFyx9
 HvbXe2cChgNGNBUzqQ1lPlFeFFkX1enc4rJm9Hqq6r0y0QpwFSqBiq2j5o9gV/ZEuM
 NE79wWEmndltYlJpzHNiZls7BKRoepoyXcc9Cb9VptwfoAyZM4xM8QqqDImcnTJ8QZ
 iIqHh73wQCqdWsJ+MeUKagjqQubrihj1LazMNftkDEfNa3CyIEtWwuK1t5Js7fIgBC
 CZzy+b7yHQi5Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH 1/2] powerpc: Fix user data corruption with P9N DD2.1 VSX
 CI load workaround emulation
In-Reply-To: <20201013043741.743413-1-mikey@neuling.org>
References: <20201013043741.743413-1-mikey@neuling.org>
Date: Wed, 14 Oct 2020 11:13:24 +1100
Message-ID: <87pn5lzmu3.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Neuling <mikey@neuling.org> writes:
> __get_user_atomic_128_aligned() stores to kaddr using stvx which is a
> VMX store instruction, hence kaddr must be 16 byte aligned otherwise
> the store won't occur as expected.
>
> Unfortunately when we call __get_user_atomic_128_aligned() in
> p9_hmi_special_emu(), the buffer we pass as kaddr (ie. vbuf) isn't
> guaranteed to be 16B aligned. This means that the write to vbuf in
> __get_user_atomic_128_aligned() has the bottom bits of the address
> truncated. This results in other local variables being
> overwritten. Also vbuf will not contain the correct data which results
> in the userspace emulation being wrong and hence user data corruption.
>
> In the past we've been mostly lucky as vbuf has ended up aligned but
> this is fragile and isn't always true. CONFIG_STACKPROTECTOR in
> particular can change the stack arrangement enough that our luck runs
> out.

Actually I'm yet to find a kernel with CONFIG_STACKPROTECTOR=n that is
vulnerable to the bug.

Turning on STACKPROTECTOR changes the order GCC allocates locals on the
stack, from bottom-up to top-down. That in conjunction with the 8 byte
stack canary means we end up with 8 bytes of space below the locals,
which misaligns vbuf.

But obviously other things can change the stack layout too, so no
guarantees that CONFIG_STACKPROTECTOR=n makes it safe.

cheers
