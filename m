Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C61E5EB9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 20:50:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470qmY6kv4zDqq7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Oct 2019 05:50:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 470qkf59nGzDqpC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2019 05:48:42 +1100 (AEDT)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iOR6y-0000Kt-Pk; Sat, 26 Oct 2019 20:48:28 +0200
Date: Sat, 26 Oct 2019 20:48:27 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [RFC PATCH] powerpc/32: Switch VDSO to C implementation.
In-Reply-To: <439bce37-9c2c-2afe-9c9e-2f500472f9f8@c-s.fr>
Message-ID: <alpine.DEB.2.21.1910262026340.10190@nanos.tec.linutronix.de>
References: <8ce3582f7f7da9ff0286ced857e5aa2e5ae6746e.1571662378.git.christophe.leroy@c-s.fr>
 <alpine.DEB.2.21.1910212312520.2078@nanos.tec.linutronix.de>
 <f4486e86-3c0c-0eec-1639-0e5956cdb8f1@c-s.fr>
 <95bd2367-8edc-29db-faa3-7729661e05f2@c-s.fr>
 <alpine.DEB.2.21.1910261751140.10190@nanos.tec.linutronix.de>
 <439bce37-9c2c-2afe-9c9e-2f500472f9f8@c-s.fr>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2102536042-1572115708=:10190"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2102536042-1572115708=:10190
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 26 Oct 2019, Christophe Leroy wrote:
> Le 26/10/2019 à 17:53, Thomas Gleixner a écrit :
> > > > > > gettimeofday:    vdso: 750 nsec/call
> > > > > > 
> > > > > > gettimeofday:    vdso: 1533 nsec/call
> > > > 
> > > > Small improvement (3%) with the proposed change:
> > > > 
> > > > gettimeofday:    vdso: 1485 nsec/call
> > > 
> > > By inlining do_hres() I get the following:
> > > 
> > > gettimeofday:    vdso: 1072 nsec/call
> > 
> > What's the effect for clock_gettime()?
> > 
> > gettimeofday() is suboptimal vs. the PPC ASM variant due to an extra
> > division, but clock_gettime() should be 1:1 comparable.
> > 
> 
> Original PPC asm:
> clock-gettime-realtime:    vdso: 928 nsec/call
> 
> My original RFC:
> clock-gettime-realtime:    vdso: 1570 nsec/call
> 
> With your suggested vdso_calc_delta():
> clock-gettime-realtime:    vdso: 1512 nsec/call
> 
> With your vdso_calc_delta() and inlined do_hres():
> clock-gettime-realtime:    vdso: 1302 nsec/call

That does not make any sense at all.

gettimeofday() is basically the same as clock_gettime(REALTIME) and does
an extra division. So I would expect it to be slower. 

Let's look at the code:

__cvdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
{
        const struct vdso_data *vd = __arch_get_vdso_data();

        if (likely(tv != NULL)) {
		struct __kernel_timespec ts;

                if (do_hres(&vd[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
                        return gettimeofday_fallback(tv, tz);

                tv->tv_sec = ts.tv_sec;
                tv->tv_usec = (u32)ts.tv_nsec / NSEC_PER_USEC;

IIRC PPC did some magic math tricks to avoid that. Could you just for the
fun of it replace this division with

       (u32)ts.tv_nsec >> 10;

That's obviously incorrect, but it would tell us how heavy the division
is. If that brings us close we might do something special for
gettimeofday().

OTOH, last time I checked clock_gettime() was by far more used than
gettimeofday() but that obviously depends on the use cases.

        }
	...
}

and

__cvdso_clock_gettime_common(clockid_t clock, struct __kernel_timespec *ts)
{
        const struct vdso_data *vd = __arch_get_vdso_data();
        u32 msk;

	/* Check for negative values or invalid clocks */
        if (unlikely((u32) clock >= MAX_CLOCKS))
                return -1;

        /*
         * Convert the clockid to a bitmask and use it to check which
         * clocks are handled in the VDSO directly.
         */
        msk = 1U << clock;
        if (likely(msk & VDSO_HRES)) {
		return do_hres(&vd[CS_HRES_COARSE], clock, ts);

So this is the extra code which is executed for clock_gettime(REAL) which
is pure logic and certainly not as heavyweight as the division in the
gettimeofday() code path.

}

static __maybe_unused int
__cvdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
{
        int ret = __cvdso_clock_gettime_common(clock, ts);

	if (unlikely(ret))
                return clock_gettime_fallback(clock, ts);
        return 0;
}

One thing which might be worth to try as well is to mark all functions in
that file as inline. The speedup by the do_hres() inlining was impressive
on PPC.

Thanks,

	tglx

--8323329-2102536042-1572115708=:10190--
