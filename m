Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D6310563
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 08:03:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX5wJ10z4zDsQH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 18:02:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ch+EAbuB; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX5tQ6f1TzDvZ8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 18:01:18 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id a19so6030636qka.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 23:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=XknozRzZUXK43pAz/ZEABzhId2YCplO4rf+QlAhTH1g=;
 b=ch+EAbuBqqWUq/KOQ3wFuIPk6FhxxRuFgr+oVOJUgEpMgZs+p9MCdyGiZ5cvP/OFMN
 19tj3L0lgSMq296VU7xrbQvq94K9thyWQElBhs3lOCI1kKfIfvYutm9ISWlSVe9dZVHc
 MnODvT4YQWTFlW+suNVqqySSe77/m3I1DVMvv/B/srHqC0TnOmQOfNwJRl0aYzaHkTFb
 luOljWLlxmcDgmq1ldlT9wwbqGd1gOMdnLhxM7KnxM1cjflf/5YzTd5FrY+MehAZe4JT
 +r51+2VDYm7d4H7kLd7ryp+WPx9eAed0EBgBkZsSNRyS3iPP38XHRXrDOVgKbbnsMqCI
 AMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=XknozRzZUXK43pAz/ZEABzhId2YCplO4rf+QlAhTH1g=;
 b=WgMBF9boBhXdZOx+dHiUC0bKx8KyJMor3EMzoBHegDMC1vohGQoiSZZo6wZEnQ42Ve
 Ja7vRB/PQx8kWkJcwsorSOL8eR7LvPfuy+SRvVQMMK2FPCWoUaF8aqi8+x43Zzy7+G7d
 zmvxxzOAxbmzqy7phW0WWuaI01oHLST494sMpJ5gsbPf2CkYTKhssZYE0/L+mQbn2U+Z
 ZZSCUE55saq8yqFZbtFWhCBoydPAv/vVeM9TY2nMRQjiIP/khiFv3hfwz/+e94GkBqFF
 ccUyU0Iei4g3bZ4AaJGERN5LPGV0Wijlam4VMligv69abbnBm8IJThLIIMHghRD5WENU
 0szw==
X-Gm-Message-State: AOAM530VjUHBaPEV7DPHfdij7+7uKve1RsFhFOuX8JScahrW126w/lbi
 OMlGvsKTFJ7ul6h0J8hqqgI=
X-Google-Smtp-Source: ABdhPJy0jHqhXxMW19PSeN6LZaI7E2rznuvE+ob72+Krjyj7C1lA1j1JXwkyljqQz1hBA9DZLn0M1w==
X-Received: by 2002:a05:620a:149b:: with SMTP id
 w27mr3047841qkj.64.1612508475899; 
 Thu, 04 Feb 2021 23:01:15 -0800 (PST)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 (186-249-147-196.dynamic.desktop.com.br. [186.249.147.196])
 by smtp.gmail.com with ESMTPSA id c14sm8026079qkl.18.2021.02.04.23.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 23:01:15 -0800 (PST)
Message-ID: <7e231b91e41c3f3586ba2fd604c40f1716db228d.camel@gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/kvm: Save Timebase Offset to fix
 sched_clock() while running guest code.
From: Leonardo Bras <leobras.c@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Frederic Weisbecker <frederic@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jordan Niethe
 <jniethe5@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras
 <paulus@ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 05 Feb 2021 04:01:09 -0300
In-Reply-To: <1612506268.6rrvx34gzu.astroid@bobo.none>
References: <20210205060643.233481-1-leobras.c@gmail.com>
 <1612506268.6rrvx34gzu.astroid@bobo.none>
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

Hey Nick, thanks for reviewing :)

On Fri, 2021-02-05 at 16:28 +1000, Nicholas Piggin wrote:
> Excerpts from Leonardo Bras's message of February 5, 2021 4:06 pm:
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
> 
> Ouch. Not sure how reasonable it is to half switch into guest registers 
> and expect to call into the wider kernel, fixing things up as we go. 
> What if mftb is used in other places?

IIUC, the CPU is not supposed to call anything as host between guest
entry and guest exit, except guest-related cases, like
kvmppc_guest_entry_inject_int(), but anyway, if something calls mftb it
will still get the same value as before.

This is only supposed to change stuff that depends on sched_clock, like
Tracepoints, that can happen in those exceptions.


> Especially as it doesn't seem like there is a reason that function _has_
> to be called after the timebase is switched to guest, that's just how 
> the code is structured.

Correct, but if called, like in rb routines, used by tracepoints, the
difference between last tb and current (lower) tb may cause the CPU to
trap PROGRAM exception, crashing host. 

> As a local hack to work out a bug okay. If you really need it upstream 
> could you put it under a debug config option?

You mean something that is automatically selected whenever those
configs are enabled? 

CONFIG_TRACEPOINT && CONFIG_KVM_BOOK3S_HANDLER && CONFIG_PPC_BOOK3S_64

Or something the user need to select himself in menuconfig?

> 
> Thanks,
> Nick
> 

Thank you!
Leonardo Bras

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
> > +	u64 tb_offset;		/* Timebase offset: keeps correct timebase while on guest */
> >  #endif
> >  };
> >  
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
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
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
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
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> >  
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
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
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> >  	if (vc->pcr)
> > @@ -3594,6 +3595,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
> >  		if ((tb & 0xffffff) < (new_tb & 0xffffff))
> >  			mtspr(SPRN_TBU40, new_tb + 0x1000000);
> >  		vc->tb_offset_applied = 0;
> > +		local_paca->kvm_hstate.tb_offset = 0;
> >  	}
> >  
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> > 
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
> > -- 
> > 2.29.2
> > 
> > 


