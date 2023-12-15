Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4D7814405
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 09:58:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ss35q5nhhz3dTJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 19:58:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss35J5FHMz3c5t
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 19:57:40 +1100 (AEDT)
X-QQ-mid: bizesmtp81t1702630218thfsx9pm
Received: from HX09040029.powercore.com.cn ( [58.34.117.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 15 Dec 2023 16:50:08 +0800 (CST)
X-QQ-SSF: 01400000000000402000000A0000000
X-QQ-FEAT: ceHWIenCpmDuhrSrhvNLjSeriLEySCYhA7RcdCsZagNjgKO6tixTcenj4mA5g
	OofENfpRkwA7602PJI3HdlCm1qKusu8tjy5JzvoTmk4ga7dLuYR7kxmQjbApLOeT6mr61Pb
	rZy6+y4YwT3R2Qym5ciyn1eTpbexZsRdxnETeU3vRJfYOBU9TEcy3R3SlHIehLf+jIlyxod
	84NUUjBMnLKYXiPivNpeUqIKIoQz7V+EuAsRZICwZ0ayQnj8gDD2JvGiG9ya8IKmOHFBLEt
	RwlCLQoKqGfeVZIvWfiCKOcKUd2k1eeHCWccpsgBmDMcPk2qZA5D+/MnBf90lI2BKXn/up0
	j8x19IH2aiEB/9OS+dGVp0uTTo29kngaJdIC46MGByG2Yymj1eWBCVKXQr9XMkVG620xjCT
	QOgfLTjgVl0=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 2766933889210276903
Date: Fri, 15 Dec 2023 16:50:08 +0800
From: Luming Yu <luming.yu@shingroup.cn>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/locking: implement this_cpu_cmpxchg local API
Message-ID: <6A256ED30D339626+ZXwTQL1lMXhQ_inW@HX09040029.powercore.com.cn>
References: <0EFBD0242622180B+20231204022303.528-1-luming.yu@shingroup.cn>
 <87jzpldl1l.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzpldl1l.fsf@mail.lhotse>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
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
Cc: ke.zhao@shingroup.cn, dawei.li@shingroup.cn, npiggin@gmail.com, linux-kernel@vger.kernel.org, luming.yu@gmail.com, shenghui.qu@shingroup.cn, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 11, 2023 at 10:40:38PM +1100, Michael Ellerman wrote:
> Hi Luming Yu,
> 
> Luming Yu <luming.yu@shingroup.cn> writes:
> > ppc appears to have already supported cmpxchg-local atomic semantics
> > that is defined by the kernel convention of the feature.
> > Add this_cpu_cmpxchg ppc local for the performance benefit of arch
> > sepcific implementation than asm-generic c verison of the locking API.
> 
> Implementing this has been suggested before but it wasn't clear that it
> was actually going to perform better than the generic version.
Thanks for the info. To me, it is a news. : -)
I will check if any web search engine could serve me well to find it out. 
> 
> On 64-bit we have interrupt soft masking, so disabling interrupts is
> relatively cheap. So the generic this_cpu_cmpxhg using irq disable just
> becomes a few loads & stores, no atomic ops required.

something like this just popped up in my first try with a p8 test kvm on
a c1000 powernv8 platform?

I'm not sure the soft lockup is relevant to the interrupt soft masking,
but I will find it out for sure. : -)

[  460.217669] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
[  460.217742] Modules linked in:
[  460.217828] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W    L   N 6.7.0-rc5+ #5
[  460.217915] Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1200 0xf000005 of:SLOF,git-6b6c16 pSeries
[  460.217999] NIP:  c00000000003e0ec LR: c00000000003e414 CTR: 0000000000000000
[  460.218074] REGS: c000000004797788 TRAP: 0900   Tainted: G        W    L   N  (6.7.0-rc5+)
[  460.218151] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24042442  XER: 00000000
[  460.218342] CFAR: 0000000000000000 IRQMASK: 0
[  460.218342] GPR00: c00000000003e414 c000000004797760 c000000001583b00 c000000004797758
[  460.218342] GPR04: 0000000000000000 0000000000000004 c000000004ccf51c c00000000224e510
[  460.218342] GPR08: 4000000000000002 0000000000000049 c00000000457b280 0015000b00170038
[  460.218342] GPR12: 00340030003a0010 c000000002f40000 0000000000000008 c000000004ccf4fc
[  460.218342] GPR16: 0000000000007586 c0000000040f45c0 c000000004ddd080 c0000000040f45c0
[  460.218342] GPR20: 0000000000000008 0000000000000024 0000000000000004 c000000004ccf4fc
[  460.218342] GPR24: 000000000000003f 0000000000000001 0000000000000001 c000000004cc6e7e
[  460.218342] GPR28: fcffffffffffffff 0000000000000002 fcffffffffffffff 0000000000000003
[  460.219187] NIP [c00000000003e0ec] __replay_soft_interrupts+0x3c/0x160
[  460.219286] LR [c00000000003e414] arch_local_irq_restore+0x174/0x1a0
[  460.219365] Call Trace:
[  460.219400] [c000000004797760] [c00000000003e150] __replay_soft_interrupts+0xa0/0x160 (unreliable)
[  460.219515] [c000000004797910] [c00000000003e414] arch_local_irq_restore+0x174/0x1a0
[  460.219612] [c000000004797950] [c000000000a155c4] get_random_u32+0xb4/0x140
[  460.219699] [c0000000047979a0] [c0000000008b1ae0] get_rcw_we+0x138/0x274
[  460.219781] [c000000004797a30] [c00000000208d4bc] test_rslib_init+0x8b8/0xb70
[  460.219877] [c000000004797c40] [c00000000000fb80] do_one_initcall+0x60/0x390
[  460.219965] [c000000004797d10] [c000000002004a18] kernel_init_freeable+0x32c/0x3dc
[  460.220059] [c000000004797de0] [c0000000000102a4] kernel_init+0x34/0x1b0
[  460.220141] [c000000004797e50] [c00000000000cf14] ret_from_kernel_user_thread+0x14/0x1c
[  460.220229] --- interrupt: 0 at 0x0
[  460.220291] Code: 60000000 7c0802a6 f8010010 f821fe51 e92d0c78 f92101a8 39200000 38610028 892d0933 61290040 992d0933 48043a3d <60000000> 39200000 e9410130 f9210160
[  460.955369] Testing (23,15)_64 code...

> 
> In contrast implementing it using __cmpxchg_local() will use
> ldarx/stdcx etc. which will be more expensive.
> 
> Have you done any performance measurements?
Yes, I'm looking for resource to track the perf changes (positive or negative)
in this corner for this patch set being proposed again.

> 
> It probably is a bit fishy that we don't mask PMU interrupts vs
> this_cpu_cmpxchg() etc., but I don't think it's actually a bug given the
> few places using this_cpu_cmpxchg(). Though I could be wrong about that.
I will try to understand the concern and will try to come up with a patch update,
iff the performance number from the change could look reasonable and promising.
> 
> > diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
> > index 8e5b7d0b851c..ceab5df6e7ab 100644
> > --- a/arch/powerpc/include/asm/percpu.h
> > +++ b/arch/powerpc/include/asm/percpu.h
> > @@ -18,5 +18,22 @@
> >  #include <asm-generic/percpu.h>
> >  
> >  #include <asm/paca.h>
> > +#include <asm/cmpxchg.h>
> > +#ifdef this_cpu_cmpxchg_1
> > +#undef this_cpu_cmpxchg_1
>  
> If we need to undef then I think something has gone wrong with the
> header inclusion order, the model should be that the arch defines what
> it has and the generic code provides fallbacks if the arch didn't define
> anything.
> 
> > +#define this_cpu_cmpxchg_1(pcp, oval, nval)	__cmpxchg_local(raw_cpu_ptr(&(pcp)), oval, nval, 1)
> 
> I think this is unsafe vs preemption. The raw_cpu_ptr() can generate the
> per-cpu address, but then the task can be preempted and moved to a
> different CPU before the ldarx/stdcx do the cmpxchg.
> 
> The arm64 implementation had the same bug until they fixed it.
Thanks for the review, I will look deeper into this spot. I suppose, for per cpu api down to this level,
it is safe to assume it's safe in terms of being preemption-disabled. But, things could be mis-understood
and I can be wrong as well as linux kernel has been rapidly changing so much.:-(
> 
> > +#endif 
> > +#ifdef this_cpu_cmpxchg_2
> > +#undef this_cpu_cmpxchg_2
> > +#define this_cpu_cmpxchg_2(pcp, oval, nval)	__cmpxchg_local(raw_cpu_ptr(&(pcp)), oval, nval, 2)
> > +#endif
> > +#ifdef this_cpu_cmpxchg_4
> > +#undef this_cpu_cmpxchg_4
> > +#define this_cpu_cmpxchg_4(pcp, oval, nval)	__cmpxchg_local(raw_cpu_ptr(&(pcp)), oval, nval, 4)
> > +#endif
> > +#ifdef this_cpu_cmpxchg_8
> > +#undef this_cpu_cmpxchg_8
> > +#define this_cpu_cmpxchg_8(pcp, oval, nval)	__cmpxchg_local(raw_cpu_ptr(&(pcp)), oval, nval, 8)
> > +#endif
> >  
> >  #endif /* _ASM_POWERPC_PERCPU_H_ */
> 
> cheers
> 
best regards

