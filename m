Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8052C12DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Nov 2020 19:04:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cfw5935zDzDqSs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 05:03:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=elqeA/z9; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ixoq0vrT; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cfw2x5VL6zDqQb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 05:02:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606154518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dY1mghQ8s5wvu5GP9IjiMDQt/Oip4lglbTbH7hUAgQc=;
 b=elqeA/z9yy9ZagDlpGJM+kZp8TH6P2/Fm6UhiHCDtDdf0qcC2YYxFsYI6Zv+g2uMYEjStc
 9hX75x9gcu+t3bAf2DHcu/gXW50x+iEPk8PnlZ+2sidwUaz0BhhYKFHZ51bOrlYivW67Be
 iSg3o+l4SOP+zpg17/7TbuNTr7e13Eg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606154519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dY1mghQ8s5wvu5GP9IjiMDQt/Oip4lglbTbH7hUAgQc=;
 b=Ixoq0vrTf+Dbp151od5ApU9dy6WhCOld4GpeiETLuSWscjd3Lt5GmoBiuPPoUsqA37WuMX
 PnZNL7UdlQ2n4W+b6NGCYtqCPX++4/v1ApiydBkyzuF6F6E/KHRm+jWiYkWRTIyBqt9O/k
 Ic4N/FWBBBsbbcIubqX0LglSLj7Beb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-H8lW_4lcOYO-tNc5FXKnQA-1; Mon, 23 Nov 2020 13:01:54 -0500
X-MC-Unique: H8lW_4lcOYO-tNc5FXKnQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B35B87952B;
 Mon, 23 Nov 2020 18:01:52 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.134])
 by smtp.corp.redhat.com (Postfix) with SMTP id 2FD3760864;
 Mon, 23 Nov 2020 18:01:44 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Mon, 23 Nov 2020 19:01:51 +0100 (CET)
Date: Mon, 23 Nov 2020 19:01:43 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 2/2] powerpc/ptrace: Hard wire PT_SOFTE value to 1 in
 gpr_get() too
Message-ID: <20201123180142.GB20279@redhat.com>
References: <20201119160154.GA5183@redhat.com>
 <20201119160247.GB5188@redhat.com>
 <20201119221033.Horde.be-msjDTeIW4XeXARjUu7g1@messagerie.c-s.fr>
 <20201119224347.GC5138@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119224347.GC5138@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Jan Kratochvil <jan.kratochvil@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe, et al,

So what?

Are you going to push your change or should I re-send 1-2 without
whitespace cleanups?

On 11/19, Oleg Nesterov wrote:
>
> On 11/19, Christophe Leroy wrote:
> >
> > I think the following should work, and not require the first patch (compile
> > tested only).
> >
> > --- a/arch/powerpc/kernel/ptrace/ptrace-view.c
> > +++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
> > @@ -234,9 +234,21 @@ static int gpr_get(struct task_struct *target, const
> > struct user_regset *regset,
> >  	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
> >  		     offsetof(struct pt_regs, msr) + sizeof(long));
> > 
> > +#ifdef CONFIG_PPC64
> > +	membuf_write(&to, &target->thread.regs->orig_gpr3,
> > +		     offsetof(struct pt_regs, softe) - offsetof(struct pt_regs,
> > orig_gpr3));
> > +	membuf_store(&to, 1UL);
> > +
> > +	BUILD_BUG_ON(offsetof(struct pt_regs, trap) !=
> > +		     offsetof(struct pt_regs, softe) + sizeof(long));
> > +
> > +	membuf_write(&to, &target->thread.regs->trap,
> > +		     sizeof(struct user_pt_regs) - offsetof(struct pt_regs, trap));
> > +#else
> >  	membuf_write(&to, &target->thread.regs->orig_gpr3,
> >  			sizeof(struct user_pt_regs) -
> >  			offsetof(struct pt_regs, orig_gpr3));
> > +#endif
> >  	return membuf_zero(&to, ELF_NGREG * sizeof(unsigned long) -
> >  				 sizeof(struct user_pt_regs));
> >  }
> 
> Probably yes.
> 
> This mirrors the previous patch I sent (https://lore.kernel.org/lkml/20190917143753.GA12300@redhat.com/)
> and this is exactly what I tried to avoid, we can make a simpler fix now.
> 
> But let me repeat, I agree with any fix even if imp my version simplifies the code, just
> commit this change and lets forget this problem.
> 
> Oleg.

