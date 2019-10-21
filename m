Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DE5DF7D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 00:05:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xrKc2dytzDqLb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 09:05:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xrHq6K8CzDqKw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 09:03:35 +1100 (AEDT)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iMfEg-0002d0-Qs; Mon, 21 Oct 2019 23:29:06 +0200
Date: Mon, 21 Oct 2019 23:29:05 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [RFC PATCH] powerpc/32: Switch VDSO to C implementation.
In-Reply-To: <8ce3582f7f7da9ff0286ced857e5aa2e5ae6746e.1571662378.git.christophe.leroy@c-s.fr>
Message-ID: <alpine.DEB.2.21.1910212312520.2078@nanos.tec.linutronix.de>
References: <8ce3582f7f7da9ff0286ced857e5aa2e5ae6746e.1571662378.git.christophe.leroy@c-s.fr>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 luto@kernel.org, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 21 Oct 2019, Christophe Leroy wrote:

> This is a tentative to switch powerpc/32 vdso to generic C implementation.
> It will likely not work on 64 bits or even build properly at the moment.
> 
> powerpc is a bit special for VDSO as well as system calls in the
> way that it requires setting CR SO bit which cannot be done in C.
> Therefore, entry/exit and fallback needs to be performed in ASM.
> 
> To allow that, C fallbacks just return -1 and the ASM entry point
> performs the system call when the C function returns -1.
> 
> The performance is rather disappoiting. That's most likely all
> calculation in the C implementation are based on 64 bits math and
> converted to 32 bits at the very end. I guess C implementation should
> use 32 bits math like the assembly VDSO does as of today.

> gettimeofday:    vdso: 750 nsec/call
> 
> gettimeofday:    vdso: 1533 nsec/call

The only real 64bit math which can matter is the 64bit * 32bit multiply,
i.e.

static __always_inline
u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
{
        return ((cycles - last) & mask) * mult;
}

Everything else is trivial add/sub/shift, which should be roughly the same
in ASM.

Can you try to replace that with:

static __always_inline
u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
{
        u64 ret, delta = ((cycles - last) & mask);
        u32 dh, dl;

        dl = delta;
        dh = delta >> 32;

        res = mul_u32_u32(al, mul);
        if (ah)
                res += mul_u32_u32(ah, mul) << 32;

        return res;
}

That's pretty much what __do_get_tspec does in ASM.

Thanks,

	tglx

