Return-Path: <linuxppc-dev+bounces-3133-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0BC9C694C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 07:32:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpD322rwsz2yRF;
	Wed, 13 Nov 2024 17:31:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731479518;
	cv=none; b=iWd2mZJ+W0APepCSpxmYgAnjfsGVhi72hXRgVzsgbH82zhv99zSko0xrEgX2pi3PwWJMexkfSFdp4aBA+vKbAYnwoRgs5LAIQN7RrDFCbEqQYrca2aAqRn1nGazaNTjevycyMb8mS9uZvCO7UgDtUgrhzXtKtyTBYcgWMiP8qiycajIMRbk5Id1Et+8Fnm+Q/LsV6yycBl75vfYi/BFVE1uk4Hu4p/6uO5/jlBbUdl5N0ZFTixpIXGbPGzH6OXOyo6iSjoOupYxEeFGCXSEmrAaqULvw6ZYSH/c5k1xskcyJprMOmO+H0nCjBc1P4KiYnEVSgBHYjR+Wb5U8aNigiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731479518; c=relaxed/relaxed;
	bh=LqZhmAG1L077yh5N5u/H+QRagaLDjkn8sqSvH2ojehk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g+DWWhIM+uQX9y9X1g4d42DErmcmmUMUmfO22SKMSpzbHL53b3sKhvCZzEZrazygckRrjWACtTAeSIKhmWVO89+AbovHkl8kLkg5qYgWom4ssvOuXXHfzN05bCm/s1wI1cn3qwjYURM/StJWM9vGNO2wFgdZLbWWBf40x2j2no+pcKzMVv53fQtNEy5zIWx2chtclsDgWg964Xr+yPFPh3ZQjUgijjG3kO6oK1qT8E/aP8ZOc86NylhMdOjFr6dYBLm62xiUycxFnzpT/lpArYzh+hjuSq6eBrYLCvCqIRLLtx4RdPunAFl/oGMCs0K89lG5NjvCCkHzDOvJBZrpEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lf5+YECR; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wxF+elyi; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lf5+YECR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wxF+elyi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpD304Mj2z2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 17:31:56 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731479507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LqZhmAG1L077yh5N5u/H+QRagaLDjkn8sqSvH2ojehk=;
	b=lf5+YECRGgtEoM+xnRNgzLn0YzhbuOn5DArNAEuXuWuhciWKTtcYvIVnQLWneKUbkHnaKQ
	Ab/WHZ+TVXbgBIBgsq3UhPWJ+BjlvfHC+t0vpwVHdzAJlc3+Sn0ohVU8zcLx7B/V0rTG+n
	sq4FjAfggzDp0oKxOZx1bY3icXyK0C4yx0spdepdpOq85klzlqJrxlt3cw3sm6BRRhOy3Y
	xhsflm90GJSAMt1U+RJ3ijvrI71zJxUWg+TOU9DDtwlT4O8aGKU3lanSM3ed4bMA9XE2s5
	iWVlt6w4TgNVch0iHDIecSdWjZ3099dl1g2KF1OOE6JxqKKg+n83NZ0O+0VVDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731479507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LqZhmAG1L077yh5N5u/H+QRagaLDjkn8sqSvH2ojehk=;
	b=wxF+elyirMFbITdWGSKVOXYlQlv+QcvHIvUYgpeAnldZjg6/z3+i03gb0sBYjhhuQWmNbv
	223s2y2YLXU4ueCA==
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: Re: [PATCH v2 6/8] powerpc/entry: factout irqentry-state
In-Reply-To: <972B4AF8B9EDF3C0+20241111031934.1579-12-luming.yu@shingroup.cn>
References: <20241111031934.1579-2-luming.yu@shingroup.cn>
 <972B4AF8B9EDF3C0+20241111031934.1579-12-luming.yu@shingroup.cn>
Date: Wed, 13 Nov 2024 07:32:02 +0100
Message-ID: <87a5e3myot.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 11 2024 at 11:19, Luming Yu wrote:

factout?

> To have lowlevel paca.h include high level entry-common.h cause
> include file dependency mess.

That's not a technical explanation which explains which problem this
patch is trying to solve.

> Split irqentry-state.h to have the irqentry_state.h can be included in
> low level paca.h

That's not what the patch actually does. It does two things:

    1) Split the generic header file

    2) Change the PowerPC code.

That's not how it works. See Documentation/process ...

> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index d95ab85f96ba..6521171469f2 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -352,30 +352,6 @@ void irqentry_enter_from_user_mode(struct pt_regs *regs);
>   */
>  void irqentry_exit_to_user_mode(struct pt_regs *regs);
>  
> -#ifndef irqentry_state
> -/**
> - * struct irqentry_state - Opaque object for exception state storage
> - * @exit_rcu: Used exclusively in the irqentry_*() calls; signals whether the
> - *            exit path has to invoke ct_irq_exit().
> - * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
> - *           lockdep state is restored correctly on exit from nmi.
> - *
> - * This opaque object is filled in by the irqentry_*_enter() functions and
> - * must be passed back into the corresponding irqentry_*_exit() functions
> - * when the exception is complete.
> - *
> - * Callers of irqentry_*_[enter|exit]() must consider this structure opaque
> - * and all members private.  Descriptions of the members are provided to aid in
> - * the maintenance of the irqentry_*() functions.
> - */
> -typedef struct irqentry_state {
> -	union {
> -		bool	exit_rcu;
> -		bool	lockdep;
> -	};
> -} irqentry_state_t;
> -#endif

How is this supposed to compile on any architecture which uses the
generic entry code?

Thanks,

        tglx

