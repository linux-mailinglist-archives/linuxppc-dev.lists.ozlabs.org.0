Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 448BD6191BD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 08:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3X7V41y8z3f3M
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 18:19:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pMTxZL/o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pMTxZL/o;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3X692KSTz3dsJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 18:18:25 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id v17so4134367plo.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Nov 2022 00:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eA0yZupCmJu+lIFxWoscgsZofsCuVm6nQ+r3Bs4PfgM=;
        b=pMTxZL/oe6jfdbdYCNUp+Xb6WGMwDJ0tqzYjFuCFVTbU1K6LCmp38IhtqgFEtGH1Fw
         eLi3S+bCzf2+/rSdLI9BvXSs2AxVFQGLdZ/VpkCMRosDZICPg8K0E7aAi3VCg4WFPYDw
         BfmWNQys/m/eitnUWQLYZ4i97xNTJmOpokS1/YmW7+tK6sMrbeSwt/lUvRFiVPBmwrU/
         ivWuBjfa1WZ8S1UNebL0AtpJKNK0IoOPWmP7NKKqfcpMaASq0oFieIk/rtzcNf6p/IAa
         QK7q17GoUs4Yjdkmho6a4WFZ4muIgt4Uy+uR4Vu4p0vmgfomnVLk+4/4y9tD9W4Njnx3
         1t6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA0yZupCmJu+lIFxWoscgsZofsCuVm6nQ+r3Bs4PfgM=;
        b=zt9B3AXpEfdessmm9Rr4uyjN2h+874ZiDJPGJxtwSE2CWzeOFkVk06w4oW3GSSLWXH
         kHsZGkPe2lV7JgAuXJj+b/pUjHKf/4eQyc7rWeJqFAbOpCKVh5VgqpjWS+RvlV/DaTvG
         0/0qhVDonLk8E0hD2ATOPNxgwdy94VIqwsWScpfP1w0PbMgafN7hxSPX2fZ9CA289mT5
         wgMn2ZkbUtwOXA50giIXyQjkNnhKDlY+0rk6WvrHYMAfDkGDrC3DxSYsvwzsA6JSTaiQ
         vQDkSPmghxxRHoBT8ssOqXMlDw9tzV4hAJkUtkvR2MR4NPSukw1Wi3WAcQ+6FcU/3fZV
         SoHw==
X-Gm-Message-State: ACrzQf3V2F8zs4bRUBe6m/V3+nx+/ScI8f8Wv7UCyPqg75ZNo4Vn9zTS
	dMb4oxJE1Un99yHH2zhHAEk=
X-Google-Smtp-Source: AMsMyM44DihVYXeoqfThPObIIFl16q8Fgq5Ol1s8X3KRnlnJD5T+n/qjAhXcJhbg7QI1HMtgLqbViQ==
X-Received: by 2002:a17:902:d592:b0:17a:582:4eb with SMTP id k18-20020a170902d59200b0017a058204ebmr34136415plh.40.1667546300864;
        Fri, 04 Nov 2022 00:18:20 -0700 (PDT)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090322c900b00186f0f59c85sm1854838plg.235.2022.11.04.00.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 00:18:20 -0700 (PDT)
Date: Fri, 4 Nov 2022 00:18:19 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 36/44] KVM: x86: Do compatibility checks when onlining CPU
Message-ID: <20221104071819.GD1063309@ls.amr.corp.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-37-seanjc@google.com>
 <20221103210402.GB1063309@ls.amr.corp.intel.com>
 <Y2RB4qT02EkhMjPL@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y2RB4qT02EkhMjPL@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel
 .com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 03, 2022 at 10:34:10PM +0000,
Sean Christopherson <seanjc@google.com> wrote:

> On Thu, Nov 03, 2022, Isaku Yamahata wrote:
> > On Wed, Nov 02, 2022 at 11:19:03PM +0000,
> > Sean Christopherson <seanjc@google.com> wrote:
> > > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > > index f223c845ed6e..c99222b71fcc 100644
> > > --- a/arch/x86/include/asm/kvm_host.h
> > > +++ b/arch/x86/include/asm/kvm_host.h
> > > @@ -1666,7 +1666,7 @@ struct kvm_x86_nested_ops {
> > >  };
> > >  
> > >  struct kvm_x86_init_ops {
> > > -	int (*check_processor_compatibility)(void);
> > > +	int (*check_processor_compatibility)(int cpu);
> > 
> > Is this cpu argument used only for error message to include cpu number
> > with avoiding repeating raw_smp_processor_id() in pr_err()?
> 
> Yep.
> 
> > The actual check is done on the current executing cpu.
> > 
> > If cpu != raw_smp_processor_id(), cpu is wrong. Although the function is called
> > in non-preemptive context, it's a bit confusing. So voting to remove it and
> > to use.
> 
> What if I rename the param is this_cpu?  I 100% agree the argument is confusing
> as-is, but forcing all the helpers to manually grab the cpu is quite annoying.

Makes sense. Let's settle it with this_cpu.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
