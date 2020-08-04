Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1275A23BA19
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 14:07:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLYQx19RYzDqWg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 22:07:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLYNN54JWzDqLd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 22:05:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=BPNz5d1y; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLYNN2SfJz9sRR;
 Tue,  4 Aug 2020 22:05:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596542708;
 bh=1MF/jt6DZ8jX8GtkU3/r7cAlonLgGWKigIbr23K62NQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BPNz5d1yd9gtXyR3PpyVOFEp/hjWUrH1ybCz6i0i9/0H+48CVdphP0lKo9OewOllz
 I1kpwSMT8r1BURXKMhYbkRMe8QmgGEAK08PjF74Q6Y6zdfE8jKBVBz0FF6SSxYenq9
 fV762p+op1kxve6pyVtio8LLTT+IZbJzgfKXiUkBB3+617LNYsPC6MCXpNQKsRlKTE
 +bmVFNfP7ajFZdgfrY+sTxH0PBvChD58B9LdX40cP5Qrge25c2bCIFGW3aUiAAxa62
 Iu19uSRlKWUXdW0DURah/NUHtU6G73hKLmDeGSyk6iwpEQfJbaAimFg8faZjYSxL2x
 9aJQFXsDcDDiQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Stanley <joel@jms.id.au>, Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH 1/6] powerpc/powernv/smp: Fix spurious DBG() warning
In-Reply-To: <CACPK8XfoZ8+SUG6cuWuEJqdTfmxePsBGFGgqyrPvmn1WyRVyjA@mail.gmail.com>
References: <20200804005410.146094-1-oohall@gmail.com>
 <20200804005410.146094-2-oohall@gmail.com>
 <CACPK8XfoZ8+SUG6cuWuEJqdTfmxePsBGFGgqyrPvmn1WyRVyjA@mail.gmail.com>
Date: Tue, 04 Aug 2020 22:05:07 +1000
Message-ID: <87a6zazkek.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> writes:
> On Tue, 4 Aug 2020 at 00:57, Oliver O'Halloran <oohall@gmail.com> wrote:
>>
>> When building with W=3D1 we get the following warning:
>>
>>  arch/powerpc/platforms/powernv/smp.c: In function =E2=80=98pnv_smp_cpu_=
kill_self=E2=80=99:
>>  arch/powerpc/platforms/powernv/smp.c:276:16: error: suggest braces arou=
nd
>>         empty body in an =E2=80=98if=E2=80=99 statement [-Werror=3Dempty=
-body]
>>    276 |      cpu, srr1);
>>        |                ^
>>  cc1: all warnings being treated as errors
>>
>> The full context is this block:
>>
>>  if (srr1 && !generic_check_cpu_restart(cpu))
>>         DBG("CPU%d Unexpected exit while offline srr1=3D%lx!\n",
>>                         cpu, srr1);
>>
>> When building with DEBUG undefined DBG() expands to nothing and GCC emits
>> the warning due to the lack of braces around an empty statement.
>>
>> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
>> ---
>> We could add the braces too. That might even be better since it's a mult=
i-line
>> if block even though it's only a single statement.
>
> Or you could put it all on one line, now that our 120 line overlords
> have taken over.

Yeah I think that one may as well be one line.

> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> Messy:
>
> $ git grep "define DBG(" arch/powerpc/ |grep -v print
> arch/powerpc/kernel/crash_dump.c:#define DBG(fmt...)
> arch/powerpc/kernel/iommu.c:#define DBG(...)
> arch/powerpc/kernel/legacy_serial.c:#define DBG(fmt...) do { } while(0)
> arch/powerpc/kernel/prom.c:#define DBG(fmt...)
..

Yeah, gross old cruft.

The vast majority of those should just be replaced with pr_devel()
and/or pr_debug().

The pnv_smp_cpu_kill_self() case is one where we probably do want to
stick with udbg_printf(), because I don't think it's kosher to call
printk() from an offline CPU.

cheers
