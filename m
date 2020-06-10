Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E01F5751
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 17:09:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hr4C0FyGzDqQ5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 01:09:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=jEQRIxYJ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEQRIxYJ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hr266LzDzDqjp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 01:07:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591801639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PWDev/u3hjr273VuifVX8zNUbNFXR9kYhrB8QSfR8HU=;
 b=jEQRIxYJ9K8J0xmhYzLoCDXkypizrsqoy3svoIX6Ad/N0eHrDtXHC70pbWQEMpVJ3j1LFx
 /T0ehJPsmYafFvx4unyVW2JEOEkNmmZoRavxOt5pCtEwksS2+qtnwXMADQPxWdPhbW2tP/
 in/vkFlDudlE13Eh7cXcYLOPLq70dA0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591801639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PWDev/u3hjr273VuifVX8zNUbNFXR9kYhrB8QSfR8HU=;
 b=jEQRIxYJ9K8J0xmhYzLoCDXkypizrsqoy3svoIX6Ad/N0eHrDtXHC70pbWQEMpVJ3j1LFx
 /T0ehJPsmYafFvx4unyVW2JEOEkNmmZoRavxOt5pCtEwksS2+qtnwXMADQPxWdPhbW2tP/
 in/vkFlDudlE13Eh7cXcYLOPLq70dA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-gdTGQtgkPYenzHkXd_Z-oA-1; Wed, 10 Jun 2020 11:07:13 -0400
X-MC-Unique: gdTGQtgkPYenzHkXd_Z-oA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46791107ACF6;
 Wed, 10 Jun 2020 15:07:11 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.117])
 by smtp.corp.redhat.com (Postfix) with SMTP id CACEC8FF62;
 Wed, 10 Jun 2020 15:07:05 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Wed, 10 Jun 2020 17:07:10 +0200 (CEST)
Date: Wed, 10 Jun 2020 17:07:03 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH? v2] powerpc: Hard wire PT_SOFTE value to 1 in gpr_get()
 too
Message-ID: <20200610150224.GA6793@redhat.com>
References: <20190917121256.GA8659@redhat.com>
 <20190917143753.GA12300@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917143753.GA12300@redhat.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Jan Kratochvil <jan.kratochvil@redhat.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

looks like this patch was forgotten.

Do you think this should be fixed or should we document that
PTRACE_GETREGS is not consistent with PTRACE_PEEKUSER on ppc64?


On 09/17, Oleg Nesterov wrote:
>
> I don't have a ppc machine, this patch wasn't even compile tested,
> could you please review?
> 
> The commit a8a4b03ab95f ("powerpc: Hard wire PT_SOFTE value to 1 in
> ptrace & signals") changed ptrace_get_reg(PT_SOFTE) to report 0x1,
> but PTRACE_GETREGS still copies pt_regs->softe as is.
> 
> This is not consistent and this breaks
> http://sourceware.org/systemtap/wiki/utrace/tests/user-regs-peekpoke
> 
> Reported-by: Jan Kratochvil <jan.kratochvil@redhat.com>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  arch/powerpc/kernel/ptrace.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
> index 8c92feb..291acfb 100644
> --- a/arch/powerpc/kernel/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace.c
> @@ -363,11 +363,36 @@ static int gpr_get(struct task_struct *target, const struct user_regset *regset,
>  	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
>  		     offsetof(struct pt_regs, msr) + sizeof(long));
>  
> +#ifdef CONFIG_PPC64
> +	if (!ret)
> +		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
> +					  &target->thread.regs->orig_gpr3,
> +					  offsetof(struct pt_regs, orig_gpr3),
> +					  offsetof(struct pt_regs, softe));
> +
> +	if (!ret) {
> +		unsigned long softe = 0x1;
> +		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &softe,
> +					  offsetof(struct pt_regs, softe),
> +					  offsetof(struct pt_regs, softe) +
> +					  sizeof(softe));
> +	}
> +
> +	BUILD_BUG_ON(offsetof(struct pt_regs, trap) !=
> +		     offsetof(struct pt_regs, softe) + sizeof(long));
> +
> +	if (!ret)
> +		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
> +					  &target->thread.regs->trap,
> +					  offsetof(struct pt_regs, trap),
> +					  sizeof(struct user_pt_regs));
> +#else
>  	if (!ret)
>  		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
>  					  &target->thread.regs->orig_gpr3,
>  					  offsetof(struct pt_regs, orig_gpr3),
>  					  sizeof(struct user_pt_regs));
> +#endif
>  	if (!ret)
>  		ret = user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
>  					       sizeof(struct user_pt_regs), -1);
> -- 
> 2.5.0
> 

