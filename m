Return-Path: <linuxppc-dev+bounces-3090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E959C371C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 04:47:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmwVH5RFRz2ygx;
	Mon, 11 Nov 2024 14:47:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.132.65.219
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731296855;
	cv=none; b=WJ673Jg6kHzE1/mdCSc2aBFHX5cTIE/noUytqq7Li4Q2TwdUO4Q4XAo6+gxk8dUDZYtL8m/Qv7W20wmdLxhki06FUHx0EcGJEQo2SA32qxtrjrZz16s4cBYo2vTZEfrY6hQBrEejct3T5Ybc+MUelbbLOQlT+JIGsgh1/EG0lD3CEle6dUkag3SQ5PMiaigG+mK/9b1PaH/joDGvmPrCiQghwcfQhXNsmyfPnlgL5tMVJuGzVEw3Vfp+t4INHO6Uo5QSNfgzntJViILkmi5k3R4KHY/VR74k8W6j4yVhaX2GNvcvRJh8mXaHS8+9BEZ5c2EKZu8esjNfXr1aFycvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731296855; c=relaxed/relaxed;
	bh=1rRJwpyl8qM4kt1MyuT907lmD8U2YNicX4dBpd3hItQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjA+58PlFnc+ceQEkQCtT3kURkJFjG6sI5KLyNeX6tJpnHD4KLoLGL18Y/xh2cyEKB80EiWThjlXImVKugqPzuQ0j6WVwOeQYCRLsY0WrvSsFvcbgpt3H0+ouu254fUiETbTe6w5vVutDQ5+6Qj7ledLb3toblKZl5JN6A+eGZkS9rQ3812VadoyyzrKTd+Prrb3/K2fyqsfFhcUuMz+zMReIjRR3Aufrne/HGxLvTK1U06y7EOHcqgOLtnN4vhDbIqj3kUxcqkXv0fcMQDhxYTermp5hSdrjRy7W6usC9TSTEHegOXynxPkrE0oFa1CRj6MFvCc+/zHCubIse7oqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=114.132.65.219; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=114.132.65.219; helo=bg1.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 1463 seconds by postgrey-1.37 at boromir; Mon, 11 Nov 2024 14:47:33 AEDT
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.65.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XmwVF309gz2ygG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 14:47:32 +1100 (AEDT)
X-QQ-mid: bizesmtpsz7t1731296770ta4mx0a
X-QQ-Originating-IP: bvxLK2njrzRzAdvQrDBCWRhLpLWS/ywWpzJe1RbKcOY=
Received: from HX09040029.powercore.com.cn ( [116.233.136.127])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Nov 2024 11:46:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17304001754305010295
Date: Mon, 11 Nov 2024 11:45:58 +0800
From: Luming Yu <luming.yu@shingroup.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	luming.yu@gmail.com
Subject: Re: [PATCH 6/7] powerpc/entry: factout irqentry-state
Message-ID: <31612651FF6E56AB+ZzF99uEvysXekBf0@HX09040029.powercore.com.cn>
References: <20241012035621.1245-3-luming.yu@shingroup.cn>
 <E6FB8D32FAAFC3BE+20241012035621.1245-8-luming.yu@shingroup.cn>
 <87ed4he5je.ffs@tglx>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ed4he5je.ffs@tglx>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NvWYEgjCCjcVZHLRkYpt647SHZtglcXoAbdXjeFXPlvudxoO6OruGBpj
	U6+NfW0ArGZUM35C2I+D0UpU6llKn276+TF6emKF4A1Xt14yfKZN8F5vhK1kjWjiyXgdFf1
	pxpYcpld2o800vUmmxLWtrptrQytP/diYfnRS/arKWpP/O6zUq9DR3nlMIqR3/gN2ikFEpo
	Lec57SwB6ZF/onIyGZE0a/j/S3MsJMpgisNiX6VLQEEydlPLBLLu7974WEDJLdOo0Pma/Yl
	uxF2LLJDQca7UuGtZxO+Z6XquWxJwarlbaWyvsIJYEG3NwJuBAytSuY686Ad4ID4ITTURgZ
	8b1D6aVeERilaTMLhz1YypZ7v94tardUfe72s2S9GEs7a4hLTaPbiv9sl0V84tvyTx39sgX
	ZLbgkK4cny3gyzndJb9664WyPTnPTSxEc2RU44eBsrvP4jLBMBFmLhgOeeofGSXbzHXVlwu
	fndjUhuQzAnTBlucKYRoUx4Z34tdePYrGix2AxEXOD4KTUxeQNQO5VS72OYWLtbxXtuox/a
	342m1ZV6oumMBfCdtxYZzN2g1Ve7OMrx6ZqAjdNCrejki8K8l8c/Vu77BRDMp1cfQ19htbu
	2ax7Ef/UVCv6ftLhyhpQWQm67tpYqcIzudvhYHtUm/NBxKAfAzmDvzdxA+fWbYwSa+kM/GE
	TfW/u0EJ9t1JH69zG3G6GzWYU6aokXOZqdzvvIAs6WzS8c2uSeh53nRHdeuWYbkZJZ+D22k
	RvZ//emH0lgJ8jyn8QV89k7QS4GRMWG3nzBU07FJqC0Xax/f5EKFxdwd8SEVb/ubls49iql
	iKfj44eIiCu1bD/oISuPvLQKaXXZIeOpOmUDrqvvSAo42He7O+gAidavViolIHGZTRcHBZ5
	A7IX6jLkDKwOjX+72uF4qvTK7JXBPp/mtMosNZFdTBpOxISjoA8BKt8U0vkWQWcmTTPRFZc
	ob44KpWlWC4TT5HRr/wLB0ozB0pACBI8KPH26EIiHSd2mih/MxcUS+IGFO6+MGd2LJyw=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 15, 2024 at 05:42:45PM +0200, Thomas Gleixner wrote:
> On Sat, Oct 12 2024 at 11:56, Luming Yu wrote:
> 
> > To have lowlevel paca.h include high level entry-common.h cause
> > include file dependency mess. Split irqentry-state.h to have
> > the irqentry_state.h can be included in low level paca.h
> 
> What's the rationale for this?
> 
> > Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> > ---
> >  arch/powerpc/include/asm/paca.h |  2 ++
> >  arch/powerpc/kernel/interrupt.c |  2 ++
> >  include/linux/entry-common.h    | 24 ------------------------
> >  include/linux/irqentry-state.h  | 28 ++++++++++++++++++++++++++++
> 
> This is not how it works. Split the include file in a first step and
> then make changes to the PPC side.
> 
> > diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> > index d95ab85f96ba..6521171469f2 100644
> > --- a/include/linux/entry-common.h
> > +++ b/include/linux/entry-common.h
> > @@ -352,30 +352,6 @@ void irqentry_enter_from_user_mode(struct pt_regs *regs);
> >   */
> >  void irqentry_exit_to_user_mode(struct pt_regs *regs);
> >  
> > -#ifndef irqentry_state
> > -/**
> > - * struct irqentry_state - Opaque object for exception state storage
> > - * @exit_rcu: Used exclusively in the irqentry_*() calls; signals whether the
> > - *            exit path has to invoke ct_irq_exit().
> > - * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
> > - *           lockdep state is restored correctly on exit from nmi.
> > - *
> > - * This opaque object is filled in by the irqentry_*_enter() functions and
> > - * must be passed back into the corresponding irqentry_*_exit() functions
> > - * when the exception is complete.
> > - *
> > - * Callers of irqentry_*_[enter|exit]() must consider this structure opaque
> > - * and all members private.  Descriptions of the members are provided to aid in
> > - * the maintenance of the irqentry_*() functions.
> > - */
> > -typedef struct irqentry_state {
> > -	union {
> > -		bool	exit_rcu;
> > -		bool	lockdep;
> > -	};
> > -} irqentry_state_t;
> > -#endif
> > -
> >  /**
> >   * irqentry_enter - Handle state tracking on ordinary interrupt entries
> >   * @regs:	Pointer to pt_regs of interrupted context
> > diff --git a/include/linux/irqentry-state.h b/include/linux/irqentry-state.h
> > new file mode 100644
> > index 000000000000..d4ddeb1c6ab6
> > --- /dev/null
> > +++ b/include/linux/irqentry-state.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __LINUX_IRQENTRYCOMMON_H
> > +#define __LINUX_IRQENTRYCOMMON_H
> 
> The guards reflect the header file name and are not randomly chosen strings.
> 
> But aside of that. How is any of this supposed to compile?
> 
> You move the typedef into a separate header and then nothing (except
> powerpc) includes it. Oh well.
thanks for review, I will fix it in V3.
> 
> Thanks,
> 
>         tglx
> 


