Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 834BAD8CA5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 11:37:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tRz529vnzDqYp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 20:37:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tRx02d4nzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 20:35:31 +1100 (AEDT)
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1iKfiF-0001cC-KN; Wed, 16 Oct 2019 11:35:23 +0200
Date: Wed, 16 Oct 2019 11:35:23 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 03/34] powerpc: Use CONFIG_PREEMPTION
Message-ID: <20191016093523.tukmwtouugecbll4@linutronix.de>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-4-bigeasy@linutronix.de>
 <156db456-af80-1f5e-6234-2e78283569b6@c-s.fr>
 <87d0ext4q3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87d0ext4q3.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-10-16 20:33:08 [+1100], Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> > Le 15/10/2019 =C3=A0 21:17, Sebastian Andrzej Siewior a =C3=A9crit=C2=
=A0:
> >> From: Thomas Gleixner <tglx@linutronix.de>
> >>=20
> >> CONFIG_PREEMPTION is selected by CONFIG_PREEMPT and by CONFIG_PREEMPT_=
RT.
> >> Both PREEMPT and PREEMPT_RT require the same functionality which today
> >> depends on CONFIG_PREEMPT.
> >>=20
> >> Switch the entry code over to use CONFIG_PREEMPTION. Add PREEMPT_RT
> >> output in __die().
> >
> > powerpc doesn't select ARCH_SUPPORTS_RT, so this change is useless as=
=20
> > CONFIG_PREEMPT_RT cannot be selected.
>=20
> Yeah I don't think there's any point adding the "_RT" to the __die()
> output until/if we ever start supporting PREEMPT_RT.

so jut the PREEMPT -> PREEMPTION  bits then?

> cheers

Sebastian
