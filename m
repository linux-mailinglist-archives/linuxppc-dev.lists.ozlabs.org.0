Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 464A62B9DC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 23:45:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcZX95dqyzDqsX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 09:45:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BsS4DQJa; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=BsS4DQJa; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcZVG2vMRzDqby
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 09:44:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605825843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tKxRHxunHt1N9ZBPxfMk6k1u2rcoVcD83DVFC6TLu74=;
 b=BsS4DQJadWL7KUWmonWpE6WU20us9+INNUOBmLiqrqt2F2H1FhZTPkOtXZhreTzHbVNXAZ
 TSBoMyjpkKGPwgUsrQZ6Fywj5/LDxARluVjD3GdiVrgjGRvDWHrLrNeqt+SFOVbff3l28Z
 vuXO82GpGZbRfyPdOrv54Q/23Lcf+DQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605825843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tKxRHxunHt1N9ZBPxfMk6k1u2rcoVcD83DVFC6TLu74=;
 b=BsS4DQJadWL7KUWmonWpE6WU20us9+INNUOBmLiqrqt2F2H1FhZTPkOtXZhreTzHbVNXAZ
 TSBoMyjpkKGPwgUsrQZ6Fywj5/LDxARluVjD3GdiVrgjGRvDWHrLrNeqt+SFOVbff3l28Z
 vuXO82GpGZbRfyPdOrv54Q/23Lcf+DQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-uu7psJv2MnuTKJxL3UojBg-1; Thu, 19 Nov 2020 17:43:58 -0500
X-MC-Unique: uu7psJv2MnuTKJxL3UojBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C2F78143F3;
 Thu, 19 Nov 2020 22:43:56 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.164])
 by smtp.corp.redhat.com (Postfix) with SMTP id CADE919C47;
 Thu, 19 Nov 2020 22:43:49 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Thu, 19 Nov 2020 23:43:56 +0100 (CET)
Date: Thu, 19 Nov 2020 23:43:48 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 2/2] powerpc/ptrace: Hard wire PT_SOFTE value to 1 in
 gpr_get() too
Message-ID: <20201119224347.GC5138@redhat.com>
References: <20201119160154.GA5183@redhat.com>
 <20201119160247.GB5188@redhat.com>
 <20201119221033.Horde.be-msjDTeIW4XeXARjUu7g1@messagerie.c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119221033.Horde.be-msjDTeIW4XeXARjUu7g1@messagerie.c-s.fr>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On 11/19, Christophe Leroy wrote:
>
> I think the following should work, and not require the first patch (compile
> tested only).
>
> --- a/arch/powerpc/kernel/ptrace/ptrace-view.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
> @@ -234,9 +234,21 @@ static int gpr_get(struct task_struct *target, const
> struct user_regset *regset,
>  	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
>  		     offsetof(struct pt_regs, msr) + sizeof(long));
> 
> +#ifdef CONFIG_PPC64
> +	membuf_write(&to, &target->thread.regs->orig_gpr3,
> +		     offsetof(struct pt_regs, softe) - offsetof(struct pt_regs,
> orig_gpr3));
> +	membuf_store(&to, 1UL);
> +
> +	BUILD_BUG_ON(offsetof(struct pt_regs, trap) !=
> +		     offsetof(struct pt_regs, softe) + sizeof(long));
> +
> +	membuf_write(&to, &target->thread.regs->trap,
> +		     sizeof(struct user_pt_regs) - offsetof(struct pt_regs, trap));
> +#else
>  	membuf_write(&to, &target->thread.regs->orig_gpr3,
>  			sizeof(struct user_pt_regs) -
>  			offsetof(struct pt_regs, orig_gpr3));
> +#endif
>  	return membuf_zero(&to, ELF_NGREG * sizeof(unsigned long) -
>  				 sizeof(struct user_pt_regs));
>  }

Probably yes.

This mirrors the previous patch I sent (https://lore.kernel.org/lkml/20190917143753.GA12300@redhat.com/)
and this is exactly what I tried to avoid, we can make a simpler fix now.

But let me repeat, I agree with any fix even if imp my version simplifies the code, just
commit this change and lets forget this problem.

Oleg.

