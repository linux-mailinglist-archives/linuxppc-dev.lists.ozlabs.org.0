Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEA1311296
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 21:37:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXRzb6g0kzDwhy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 07:36:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WkcblcPJ; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXRxn6dJszDwhx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 07:35:23 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id l23so5940916qtq.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Feb 2021 12:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=4AhGSITWRB/+3r9DX0VQhRwXg3mKhUT9vJOFFrm5ehI=;
 b=WkcblcPJROy90tOTWsZ/2MYZJJFSw8xz49/HRue/W9Q91oX0F0AQ+m5PPNj80Pwvod
 6dcVhzjEsH/LilwjTgE02RyPLv5IgYKV1gD7K06rYMiRbx/je+c6TXGrmVhEQpSImVJ9
 olab5jBEVm89bOiMYnWS4BARYK0mPrUzrC0wx/idthRuwxHM62NsqMcdMvXGeDFJ6i96
 FB/FsE5H6CjukH+ae5y0eGJ+JJpnGWP3JvZobpdmwWyy/j03TQZlnFPxYGu0GxMl5LVB
 2kAop/SFGzZzha4NGD+DhiO/8Wml8d5O7HvXwgsRM62p/tMHApd1s2epVRw7upripVrv
 FuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=4AhGSITWRB/+3r9DX0VQhRwXg3mKhUT9vJOFFrm5ehI=;
 b=rzjAWdDXsxO4FkxMRO95BjN/Agbh39eLblFXzaPAFfAd1L9gb1pBXNcuGwuwg2QEbD
 MkTZ8kCxJpcheiccYi0i0Oyf8Dt4DJLb5Uhp5M1Cm0lQ4pHfF6qIv0jshrPLs6LdpKh8
 YLRa0HJQrn3BtcAnE1bbWLisdq5+EzJ5j5gpQd0XIN2gCFYA0PulcgS3m9cO6OVbKBdU
 axJZGZKqeL24+HdEhf+7c8nu6eazpYsevdYxoZ2SCeT+jkwxGa6xyNx4Qjp7jfjMBlrQ
 Ovl/5NFte/cPXFUzo7brNATXJtvHfrJB52JlTFRhf6IP/sBuwMe+R5SB+ggQtPYXoH7J
 +Mbg==
X-Gm-Message-State: AOAM531miqxtNeabxhGLZ9Fh/ETy3ux9x2DuCQJF/nv7LvIN5konUDA8
 ZW7BmVkO0yfXVedD8a86kE0=
X-Google-Smtp-Source: ABdhPJyRTDK1ExugbcuH3wmjlLPaiNI2vCciWhLGrFzUqABxkTFyrjL0kWhpV9YzphNAJ8nTd5CUrw==
X-Received: by 2002:ac8:6f28:: with SMTP id i8mr3872524qtv.231.1612557319590; 
 Fri, 05 Feb 2021 12:35:19 -0800 (PST)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 (186-249-147-196.dynamic.desktop.com.br. [186.249.147.196])
 by smtp.gmail.com with ESMTPSA id t3sm10220763qkg.91.2021.02.05.12.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 12:35:18 -0800 (PST)
Message-ID: <10b5e7e55f18c14567d4076e76c204c8805b33c8.camel@gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/kvm: Save Timebase Offset to fix
 sched_clock() while running guest code.
From: Leonardo Bras <leobras.c@gmail.com>
To: Fabiano Rosas <farosas@linux.ibm.com>, Paul Mackerras
 <paulus@ozlabs.org>,  Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Jordan Niethe
 <jniethe5@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,  Frederic
 Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Date: Fri, 05 Feb 2021 17:35:12 -0300
In-Reply-To: <874kiqy82t.fsf@linux.ibm.com>
References: <20210205060643.233481-1-leobras.c@gmail.com>
 <874kiqy82t.fsf@linux.ibm.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Fabiano, 
Thanks for reviewing! 
(answers inline)

On Fri, 2021-02-05 at 10:09 -0300, Fabiano Rosas wrote:
> Leonardo Bras <leobras.c@gmail.com> writes:
> 
> > Before guest entry, TBU40 register is changed to reflect guest timebase.
> > After exitting guest, the register is reverted to it's original value.
> > 
> > If one tries to get the timestamp from host between those changes, it
> > will present an incorrect value.
> > 
> > An example would be trying to add a tracepoint in
> > kvmppc_guest_entry_inject_int(), which depending on last tracepoint
> > acquired could actually cause the host to crash.
> > 
> > Save the Timebase Offset to PACA and use it on sched_clock() to always
> > get the correct timestamp.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > Suggested-by: Paul Mackerras <paulus@ozlabs.org>
> > ---
> > Changes since v1:
> > - Subtracts offset only when CONFIG_KVM_BOOK3S_HANDLER and
> >   CONFIG_PPC_BOOK3S_64 are defined.
> > ---
> >  arch/powerpc/include/asm/kvm_book3s_asm.h | 1 +
> >  arch/powerpc/kernel/asm-offsets.c         | 1 +
> >  arch/powerpc/kernel/time.c                | 8 +++++++-
> >  arch/powerpc/kvm/book3s_hv.c              | 2 ++
> >  arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 2 ++
> >  5 files changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
> > index 078f4648ea27..e2c12a10eed2 100644
> > --- a/arch/powerpc/include/asm/kvm_book3s_asm.h
> > +++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
> > @@ -131,6 +131,7 @@ struct kvmppc_host_state {
> >  	u64 cfar;
> >  	u64 ppr;
> >  	u64 host_fscr;
> > +	u64 tb_offset;		/* Timebase offset: keeps correct
> > timebase while on guest */
> 
> Couldn't you use the vc->tb_offset_applied for this? We have a reference
> for the vcore in the hstate already.

But it's a pointer, which means we would have to keep checking for NULL
every time we need sched_clock(). 
Potentially it would cost a cache miss for PACA memory region that
contain vc, another for getting the part of *vc that contains the
tb_offset_applied, instead of only one for PACA struct region that
contains tb_offset.

On the other hand, it got me thinking: If the offset is applied per
cpu, why don't we get this info only in PACA, instead of in vc?
It could be a general way to get an offset applied for any purpose and
still get the sched_clock() right. 
(Not that I have any idea of any other purpose we could use it) 

Best regards!
Leonardo Bras

> 
> >  #endif
> >  };
> > 
> > diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> > index b12d7c049bfe..0beb8fdc6352 100644
> > --- a/arch/powerpc/kernel/asm-offsets.c
> > +++ b/arch/powerpc/kernel/asm-offsets.c
> > @@ -706,6 +706,7 @@ int main(void)
> >  	HSTATE_FIELD(HSTATE_CFAR, cfar);
> >  	HSTATE_FIELD(HSTATE_PPR, ppr);
> >  	HSTATE_FIELD(HSTATE_HOST_FSCR, host_fscr);
> > +	HSTATE_FIELD(HSTATE_TB_OFFSET, tb_offset);
> >  #endif /* CONFIG_PPC_BOOK3S_64 */
> > 
> >  #else /* CONFIG_PPC_BOOK3S */
> > diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> > index 67feb3524460..f27f0163792b 100644
> > --- a/arch/powerpc/kernel/time.c
> > +++ b/arch/powerpc/kernel/time.c
> > @@ -699,7 +699,13 @@ EXPORT_SYMBOL_GPL(tb_to_ns);
> >   */
> >  notrace unsigned long long sched_clock(void)
> >  {
> > -	return mulhdu(get_tb() - boot_tb, tb_to_ns_scale) << tb_to_ns_shift;
> > +	u64 tb = get_tb() - boot_tb;
> > +
> > +#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_KVM_BOOK3S_HANDLER)
> > +	tb -= local_paca->kvm_hstate.tb_offset;
> > +#endif
> > +
> > +	return mulhdu(tb, tb_to_ns_scale) << tb_to_ns_shift;
> >  }
> > 
> > 
> > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> > index b3731572295e..c08593c63353 100644
> > --- a/arch/powerpc/kvm/book3s_hv.c
> > +++ b/arch/powerpc/kvm/book3s_hv.c
> > @@ -3491,6 +3491,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
> >  		if ((tb & 0xffffff) < (new_tb & 0xffffff))
> >  			mtspr(SPRN_TBU40, new_tb + 0x1000000);
> >  		vc->tb_offset_applied = vc->tb_offset;
> > +		local_paca->kvm_hstate.tb_offset = vc->tb_offset;
> >  	}
> > 
> >  	if (vc->pcr)
> > @@ -3594,6 +3595,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
> >  		if ((tb & 0xffffff) < (new_tb & 0xffffff))
> >  			mtspr(SPRN_TBU40, new_tb + 0x1000000);
> >  		vc->tb_offset_applied = 0;
> > +		local_paca->kvm_hstate.tb_offset = 0;
> >  	}
> > 
> >  	mtspr(SPRN_HDEC, 0x7fffffff);
> > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > index b73140607875..8f7a9f7f4ee6 100644
> > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > @@ -632,6 +632,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
> >  	cmpdi	r8,0
> >  	beq	37f
> >  	std	r8, VCORE_TB_OFFSET_APPL(r5)
> > +	std	r8, HSTATE_TB_OFFSET(r13)
> >  	mftb	r6		/* current host timebase */
> >  	add	r8,r8,r6
> >  	mtspr	SPRN_TBU40,r8	/* update upper 40 bits */
> > @@ -1907,6 +1908,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> >  	beq	17f
> >  	li	r0, 0
> >  	std	r0, VCORE_TB_OFFSET_APPL(r5)
> > +	std	r0, HSTATE_TB_OFFSET(r13)
> >  	mftb	r6			/* current guest timebase */
> >  	subf	r8,r8,r6
> >  	mtspr	SPRN_TBU40,r8		/* update upper 40 bits */


