Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3AA68C94A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 23:23:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9gkb3hyXz3dvh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 09:23:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ku27bb49;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ku27bb49;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9gjd2myDz3bTM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 09:22:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C4454B81630;
	Mon,  6 Feb 2023 22:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D76C433D2;
	Mon,  6 Feb 2023 22:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675722127;
	bh=g8nY4KWQRGHZ+UEBU3IfsGHHp9POeugLWf+ks7MhlYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ku27bb49TXnifj4vDKUwLt//IhS+AuKgNZHjSBzmgIygXsWngoTvqzjsyI4aaPcuH
	 Ne/GMb6QblTp2Jv681blYtCgjkXaPsQUgkrsec8L+xRVWuKD28hd8t9BRChWBzJwZK
	 gFEWXSU7jaZZgPnPMEvOqqaXTfNHVDYUbsIUYWKlmuEb7nAEqsRD53T6hGhLZYqx/u
	 DQUcYnhTaFCk/Smt9vORx+U2SLIPq7vHqyxTh+SxZ9//C/gkazIzBXyvCtcwtDa+nk
	 Ec2/QPURQbIa9r42wgKqNXQHC6PZxrciIKrlgpzWDw6z2c/ntsIbU896+w3wVQ78cR
	 a9GpVI+CKZooA==
Date: Mon, 6 Feb 2023 14:22:02 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 12/22] powerpc/cpu: Mark start_secondary_resume()
 __noreturn
Message-ID: <20230206222202.zreg3pyhynhvyggy@treble>
References: <cover.1675461757.git.jpoimboe@kernel.org>
 <b5d065218265e79daa23f82bb84efc6a7ea120fc.1675461757.git.jpoimboe@kernel.org>
 <87v8kfdp7l.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87v8kfdp7l.fsf@mpe.ellerman.id.au>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-kern
 el@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 06, 2023 at 10:10:22PM +1100, Michael Ellerman wrote:
> Josh Poimboeuf <jpoimboe@kernel.org> writes:
> > start_secondary_resume() doesn't return.  Annotate it as such.  By
> > extension this also makes arch_cpu_idle_dead() noreturn.
> 
> Can we also mark arch_cpu_idle_dead() (the C function) __noreturn ?
> 
> Seems like it would be good documentation, even if it's not required
> once the generic prototype is __noreturn.

Yeah, agreed.  Maybe I'll do that (for all the implementations) with
patch 22.

> But not a show-stopper.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Thanks!

-- 
Josh
