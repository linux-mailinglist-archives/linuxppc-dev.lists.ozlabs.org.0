Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063D7618B9C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 23:35:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3JVJ4sj2z3dsy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 09:35:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mkCIQ7bn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mkCIQ7bn;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3JTP5hR9z3cJ2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 09:34:16 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id l6so3017363pjj.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 15:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ldFAJy69ux+7z8nNCEANq8kYxugZwXEN2GoxlipQK+E=;
        b=mkCIQ7bnuqf5rnZcP6hp5JREtMJ78/S1f1OWtkJaTeRse5OVZRNDMID1AYpz+jBJzg
         eTpW9c3Fpt1GJSjywJBWRecDimPLsqOLfN7Nt46XLz4VoW6wiMtnGP3QRSBmWb2Jy2Ue
         XIrU3j6Zv6WjRE+wBsl7MInjLBoh0ETGKk290BPhyym2xqAHPTTSp2piVfBSnA5Xqpa6
         3LkVfTkbpSA7y+3xQukW44oEvhoV3ll0HshYQg8WmMixLpenp+usLAkNlELtK9JmVVTO
         f4CyPp1jxX+2aW0ZdvzjRbMLb0KbcueA1rrAX1kSu3aGK0UrE4ad6SuEvUCcApyckgBR
         ztmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldFAJy69ux+7z8nNCEANq8kYxugZwXEN2GoxlipQK+E=;
        b=1kuYeqgavn24bDqbtOpceHgKDaD0hLQLCi5UkQ1xzPVl/OQy0QbwiIgH0rkXpKInGH
         53TYdYWdkrmguny/QyAM7TTJTdGGB8vpeI63ZY6gbfFH0eE4Tyds7AICCX+Muw7bZ5V/
         twtlDf9cqfa3jjZH2EmzArqLzCsRHCh2LlJH0b1aATmFPnsbgRFMVnlTT2nSfn+DfEOP
         tw0BuKvKTkEJIAR86scO0lKy2jDL4cH0rDcEyWdHY3AYCfcVZALcBqz9Zax1KXyWGWmq
         jXsLMPQO1NC87qNgkDC+oF3iGc4hikWJiKr1eAn7BDT0lnvDjmvyOTlmvrSjsLwu0/xI
         eycA==
X-Gm-Message-State: ACrzQf1hVb6tW8pha0g0flPZ4Yd3AYORxF/sjDoi/2tbxGpJZlftz2eu
	7pQNvXtVMYVlg9eCk4nw5zuViA==
X-Google-Smtp-Source: AMsMyM4x/1h/4H3vdmKr9CnvGb6Osipgsi8YDrhqpMcYmjYNzerzqYc2UHi5AhKhfTxXN1DVaborYg==
X-Received: by 2002:a17:90a:6045:b0:212:fe9a:5792 with SMTP id h5-20020a17090a604500b00212fe9a5792mr49415367pjm.178.1667514854306;
        Thu, 03 Nov 2022 15:34:14 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id u10-20020a170902e80a00b00186ad73e2d5sm1151929plg.208.2022.11.03.15.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 15:34:13 -0700 (PDT)
Date: Thu, 3 Nov 2022 22:34:10 +0000
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: [PATCH 36/44] KVM: x86: Do compatibility checks when onlining CPU
Message-ID: <Y2RB4qT02EkhMjPL@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-37-seanjc@google.com>
 <20221103210402.GB1063309@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103210402.GB1063309@ls.amr.corp.intel.com>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, 
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 03, 2022, Isaku Yamahata wrote:
> On Wed, Nov 02, 2022 at 11:19:03PM +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index f223c845ed6e..c99222b71fcc 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1666,7 +1666,7 @@ struct kvm_x86_nested_ops {
> >  };
> >  
> >  struct kvm_x86_init_ops {
> > -	int (*check_processor_compatibility)(void);
> > +	int (*check_processor_compatibility)(int cpu);
> 
> Is this cpu argument used only for error message to include cpu number
> with avoiding repeating raw_smp_processor_id() in pr_err()?

Yep.

> The actual check is done on the current executing cpu.
> 
> If cpu != raw_smp_processor_id(), cpu is wrong. Although the function is called
> in non-preemptive context, it's a bit confusing. So voting to remove it and
> to use.

What if I rename the param is this_cpu?  I 100% agree the argument is confusing
as-is, but forcing all the helpers to manually grab the cpu is quite annoying.
