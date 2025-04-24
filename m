Return-Path: <linuxppc-dev+bounces-7968-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCDAA9B67B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 20:38:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zk4VL0t3Jz3byT;
	Fri, 25 Apr 2025 04:38:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745519898;
	cv=none; b=grIiYDEk8Cr+KB7rremIzGOoO9vOYd6YAvWLq/eS9s0eN/pWHYl86bOv/Zu9sDmgGDtwozOyCIOZimqO5X1/7UGEO5LtemPA28h71u6zrvWkPoGHJAukTxfmEkY8pV4kKZtNyNA8+LwxFgtakzr4JTfJ9JGxRDFIbs5pwJn6oTJe/S6rNmHwvLVw/mZx3+C6G8vMzZm9oYJTwwwOyDXoBd9+DEJmEGw4DPZS1sj4FAzAZwKJD29xDfhl6Jp7SsAc3Y6Qm6MKVtGt0crJ1owBX0O4FKfNOvNLd9fYTfgfK4JRmVu0Gn7r8TREDPq0sBz8WuMShfg0RofmjrRlg9JEQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745519898; c=relaxed/relaxed;
	bh=4M5zx9ouUAG+r9bw1dUE0AO5CXj+NR6UunbImKwlF5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkbC9GLlnmLdizGaJ4n8/xmU4LflkGsoH0R2oPyVt6RVK6JvEgnGZZU1sK4s3VpJPHk36Es0TZ9C45Di5fqKrYOODoV5TLvWc1jgQgsUcsdAjkGqTphG7+2CEFkFZFF58MkzUcLXt5Y2U9xa+LFZMNO/c5AeOm5WLXmbh+nozAYNRO71YJ9Uthsx6GMIzmFtWVh9aBgnRV3IAeNky6TMNSnDTqDIBqPnnpAfZA9cmBpQczsrik38F2FmX3T2XgolQn7V+oO9wJJOfHh0mGVhSGBFxVs4Fmp4t/1diIDHD74/O2IOICHSObXaD3CN4uFRHoUWqtgrn1DOM6vMFxssxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zYJFuCxb; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fhLL9E/v; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zYJFuCxb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fhLL9E/v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 14149 seconds by postgrey-1.37 at boromir; Fri, 25 Apr 2025 04:38:17 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zk4VK1yH0z3byP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 04:38:17 +1000 (AEST)
Date: Thu, 24 Apr 2025 20:38:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745519892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4M5zx9ouUAG+r9bw1dUE0AO5CXj+NR6UunbImKwlF5s=;
	b=zYJFuCxbxeTcaDuqb4dIQrjuI9azMAaKnwSPPF4c9D+lFOCiKEN3ASs9ZSes8Aw7+KntYD
	EC41x1j5TPJIZxIxyIIiS7HHqT6p2pnzFWBRL0rvfAwWHb/PwSlU3TWGTO9FQE40m4tVJI
	n8bEZlx3Wzmb/f9fFEUX5tOmlVrePlDM/mLIsjDeaztoY7YwCvt836cPwM4jDgYV1p7waS
	RmpvIXTk0/QlE2F1fRhHkAmdm7lvaYULa+APDjHkq1fNNdnZm1xSJ/ZT138Er9HTKeDx7z
	VbyFzAPPj0dWdbD+G9tLzK6NJ5I6Lv98a2Oihr5sJKQiDWlhi9zEmhIVOEEXxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745519892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4M5zx9ouUAG+r9bw1dUE0AO5CXj+NR6UunbImKwlF5s=;
	b=fhLL9E/v4wtVCytpxlE9X1iPCCtM7ki7HsY72WaRZBO90WZQT6wttVoN0s4mwxz5CVHYiA
	kEVR83i9ft3NhTAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, gautam@linux.ibm.com,
	vaibhav@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc: kvm: use generic transfer to guest mode work
Message-ID: <20250424183811.7_MLThpt@linutronix.de>
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
 <20250421102837.78515-2-sshegde@linux.ibm.com>
 <20250424144215._ooDjDz9@linutronix.de>
 <365ba747-9311-45ab-b798-80ba4e578796@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <365ba747-9311-45ab-b798-80ba4e578796@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-04-24 21:27:59 [+0530], Shrikanth Hegde wrote:
> > > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_h=
v.c
> > > index 19f4d298d..123539642 100644
> > > --- a/arch/powerpc/kvm/book3s_hv.c
> > > +++ b/arch/powerpc/kvm/book3s_hv.c
> > > @@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu=
, u64 time_limit,
> > >   	}
> > >   	if (need_resched())
> > > -		cond_resched();
> > > +		schedule();
> >=20
>=20
>=20
> > This looks unrelated and odd. I don't why but this should be a
> > cond_resched() so it can be optimized away on PREEMPT kernels.
>=20
> This is needed, otherwise KVM on powerVM setup gets stuck on preempt=3Dfu=
ll/lazy.

But this makes no sense. On preempt=3Dfull the cond_resched() gets patched
out while schedule() doesn't. Okay, this explains the stuck.

On preempt=3Dfull need_resched() should not return true because the
preemption happens right away. Unless you are in a preempt-disabled
or interrupt disabled section. But any of the conditions can't be true
because in both cases you can't invoke schedule(). So you must have had
a wake up on the local CPU which sets need-resched but the schedule()
was delayed for some reason. Once that need-resched bit is observed by
a remote CPU then it won't send an interrupt for a scheduling request
because it should happen any time soon=E2=80=A6 This should be fixed.

If you replace the above with preempt_disable(); preempt_enable() then it
should also work=E2=80=A6

=E2=80=A6
> > > --- a/arch/powerpc/kvm/powerpc.c
> > > +++ b/arch/powerpc/kvm/powerpc.c
> > > @@ -34,6 +34,7 @@
> > >   #endif
> > >   #include <asm/ultravisor.h>
> > >   #include <asm/setup.h>
> > > +#include <linux/entry-kvm.h>
> > >   #include "timing.h"
> > >   #include "../mm/mmu_decl.h"
> > > @@ -80,24 +81,17 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
> > >   {
> > >   	int r;
> > > +	/* use generic framework to handle need resched and signals */
> > > +	if (__xfer_to_guest_mode_work_pending()) {
> > > +		r =3D xfer_to_guest_mode_handle_work(vcpu);
> >=20
> > there is nothing special you do checking and handling the work. Couldn't
> > you invoke xfer_to_guest_mode_handle_work() unconditionally?
> >=20
>=20
> I followed what was in arch/x86/kvm/x86.c. Since xfer_to_guest_mode_handl=
e_work does the same check
> it makes sense to call it without checks too.

Yeah but I guess x86 did some other updates, too.

> Will update in v2.
>=20
=E2=80=A6
> > > -
> > > -		if (signal_pending(current)) {
> > > -			kvmppc_account_exit(vcpu, SIGNAL_EXITS);
> > > -			vcpu->run->exit_reason =3D KVM_EXIT_INTR;
> > > -			r =3D -EINTR;
> > > -			break;
> >=20
> > I don't how this works but couldn't SIGNAL_EXITS vanish now that it
> > isn't updated anymore? The stat itself moves in kvm_handle_signal_exit()
> > to a different counter so it is not lost. The reader just needs to look
> > somewhere else for it.
>=20
> ok. thanks for pointing out.
>=20
> AFAIU it is updating the stats mostly. But below could keep the stats hap=
py.
> I will update that in v2.
>=20
>         if (__xfer_to_guest_mode_work_pending()) {
>                 r =3D xfer_to_guest_mode_handle_work(vcpu);
> +               /* generic framework doesn't update ppc specific stats*/
> +               if (r =3D=3D -EINTR)
> +                       kvmppc_account_exit(vcpu, SIGNAL_EXITS);
>                 if (r)
>                         return r;

Either that or you rip it out entirely but that is not my call.

Sebastian

