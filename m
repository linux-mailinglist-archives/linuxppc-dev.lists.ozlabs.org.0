Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1226261880E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:59:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3CjF6rv6z3dsG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 05:59:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=crtTNSDL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=crtTNSDL;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3ChK13DRz3cG1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 05:58:23 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 78so2444231pgb.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 11:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OgBlWniGTXEnPcASGuNFCxIZuwOSNaqHJ+Eb2HtkZ3A=;
        b=crtTNSDLBpNcvDSxofCENmrvtDvGgpUzGCkxI3/S4zR915QtnPiMfGmQ1bfa1+IphI
         JYKHG76keqoKUqskuvBrM1m0JyELxmvNXlZ4KiPUOKMYgaWfFysvap9RGXI963+2hoeq
         HHT/GX+S1XBR2PYehjOUxetwVpL78GGV9aYozWyKXyCWQQP6iGe8zgNPOME2bv1qjA9e
         apMslXORbm1rWkX1K/6OQ1RCG98VSwtHOf2J04nfLy9jITyFIIcn6ieZ9TY4AUm1gsGc
         eyQU7zbjJP0kGKm2zN/8wgEWv2C3dUA3cPXDwDYFGn1wLuJmRxozNVKQFEnfavfSL6Lx
         ZqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgBlWniGTXEnPcASGuNFCxIZuwOSNaqHJ+Eb2HtkZ3A=;
        b=qtL1e3EoE8YjexuUqJflyLNrJwlGY6Gv05JdyyuBJANnG75WbSxppUq1Ttj0pqUmtm
         vmJpeOueUyPlRAKwlBEH3AZRi3E2UddvD0NoJx+CFYu6J+v/ZBuU2vp5WKFDLVsrIyIP
         s/yOQ3IgYRN8+q414eR/ttFPEfJDEdjd48EkQlAkelB3FTZKlxx7eh5yKGhfAhrPL6cK
         kGg0Y0ysj9TaRQmavm8D3OZK8PMoGdMtgu4Bp2gsbu2cqVmX0OH6B+VpKLlacpcd4okP
         8QWEtjJonjFFgmRxRzKhRrtb9UDMgvIsMXmtLEak1NXnMOK3oiNOeyo1cI1ATotn0jm7
         xOQQ==
X-Gm-Message-State: ACrzQf0Njfsfnmmbl0Ri5LElvNSwn/hv/ktYK25EBOogWcVieC2aWcYo
	S60VE2CL/tFlT1CN7ymWUKr/lg==
X-Google-Smtp-Source: AMsMyM7lUXjnrFRO+e+xTY8enXMXmh/YC+M/IqwbxJRPxqwsuhxb3fUJPK1b1MpOBO3HsUEvz+aKuA==
X-Received: by 2002:aa7:81cf:0:b0:561:7d72:73ef with SMTP id c15-20020aa781cf000000b005617d7273efmr31655060pfn.16.1667501900762;
        Thu, 03 Nov 2022 11:58:20 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id c20-20020a17090ad91400b00209a12b3879sm309308pjv.37.2022.11.03.11.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 11:58:20 -0700 (PDT)
Date: Thu, 3 Nov 2022 18:58:16 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
Message-ID: <Y2QPSK1/6esl61wQ@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
 <Y2QJ2TuyZImbFFvi@google.com>
 <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
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
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 03, 2022, Paolo Bonzini wrote:
> On 11/3/22 19:35, Sean Christopherson wrote:
> > It's technically required.  IA32_FEAT_CTL and thus KVM_INTEL depends on any of
> > CPU_SUP_{INTEL,CENATUR,ZHAOXIN}, but init_ia32_feat_ctl() is invoked if and only
> > if the actual CPU type matches one of the aforementioned CPU_SUP_*.
> > 
> > E.g. running a kernel built with
> > 
> >    CONFIG_CPU_SUP_INTEL=y
> >    CONFIG_CPU_SUP_AMD=y
> >    # CONFIG_CPU_SUP_HYGON is not set
> >    # CONFIG_CPU_SUP_CENTAUR is not set
> >    # CONFIG_CPU_SUP_ZHAOXIN is not set
> > 
> > on a Cenatur or Zhaoxin CPU will leave X86_FEATURE_VMX set but not set
> > X86_FEATURE_MSR_IA32_FEAT_CTL.  If VMX isn't enabled in MSR_IA32_FEAT_CTL, KVM
> > will get unexpected #UDs when trying to enable VMX.
> 
> Oh, I see.  Perhaps X86_FEATURE_VMX and X86_FEATURE_SGX should be moved to
> one of the software words instead of using cpuid.  Nothing that you should
> care about for this series though.

Or maybe something like this?

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 3e508f239098..ebe617ab0b37 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -191,6 +191,8 @@ static void default_init(struct cpuinfo_x86 *c)
                        strcpy(c->x86_model_id, "386");
        }
 #endif
+
+       clear_cpu_cap(c, X86_FEATURE_MSR_IA32_FEAT_CTL);
 }
 
 static const struct cpu_dev default_cpu = {
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index c881bcafba7d..3a7ae67f5a5e 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -72,6 +72,8 @@ static const struct cpuid_dep cpuid_deps[] = {
        { X86_FEATURE_AVX512_FP16,              X86_FEATURE_AVX512BW  },
        { X86_FEATURE_ENQCMD,                   X86_FEATURE_XSAVES    },
        { X86_FEATURE_PER_THREAD_MBA,           X86_FEATURE_MBA       },
+       { X86_FEATURE_VMX,                      X86_FEATURE_MSR_IA32_FEAT_CTL         },
+       { X86_FEATURE_SGX,                      X86_FEATURE_MSR_IA32_FEAT_CTL         },
        { X86_FEATURE_SGX_LC,                   X86_FEATURE_SGX       },
        { X86_FEATURE_SGX1,                     X86_FEATURE_SGX       },
        { X86_FEATURE_SGX2,                     X86_FEATURE_SGX1      },

