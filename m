Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B8619BEE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 16:41:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3lGr39sgz3cjY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 02:41:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=slnKaxTV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=slnKaxTV;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3lFs2n9Qz3c6M
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 02:40:48 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 136so823230pga.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Nov 2022 08:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aFlTeUJ4nQplolWHip6FrS/j8TYR0+QbDmRZAFvu7G8=;
        b=slnKaxTVWka5uyvV8ksftk1iXtqkYG7wonGPtAtNy/P6RP4ZnWhdbZSV/6seXnMCof
         dnF6JUiRfV2oVCETco2jEIOQzRouLfUDiH7vxFD2orQpNLxCcfMVtLr6ntSOZeUo+8A4
         1WMtzeSAIQ00ZBggEzItHUadG+pi52a6RW5LTbSCWNWQHjLySk/BPh9TembQq8ly6ISW
         XBS14fXfAOCGbRuWccsHUKA4no5JdNrqlAYc2mDDTkISHx1kXdJjDDClXTXp09r2HKHF
         4YYshPvOotdfKVbVnw4u/+IsxQ4NAMvmIrkrc7+c9m8NGZEp/7DC/KTLI5ge39pksAS0
         M2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFlTeUJ4nQplolWHip6FrS/j8TYR0+QbDmRZAFvu7G8=;
        b=pFpdY6bncsPOdKd98JwDkB8Gq+NrEkiaa6+8JgrzfTh8mJMaxo6MbeQmoUnXJSZnsD
         eEnBNx4e+bWqc4kGt6yriyvdV/vdRBx2yOUOY/QsnMeh+UoOS+Ck7NpHBPiMB1WeESDe
         r6r3E/PkKf1BdtBBPkyEWxCE5Jojau54Qe+8Is7KiQKgrPUghvyT+MybMhA3/2kAMcvR
         EayQkwbOWPFHMf7mJsKOL9/ee+pO3J6aiCXvPMJbDnKSkU5kYZFFcQmkiOmkMgRbwXnN
         7mQ4L73drZSFb75JkJLQaf3dU53CsLZ04/apvunUU46c7rFeeq5OG7diH2jWgbQmMzA4
         KKpg==
X-Gm-Message-State: ACrzQf0mgEvilGTagSGMbAvQPKpE8ZxMnnC+nDBoPbn2QiBXs+GPwDtP
	PJF/l1MyQz5chrRkVRV6t0HwJA==
X-Google-Smtp-Source: AMsMyM5MdI5VKNUr37j2LDfWFXfSalVZ70lqDfROHdw5vEhrWbzDEJP2xBkjkN31VBShKB5D+mx4vA==
X-Received: by 2002:a62:1a8d:0:b0:544:1309:19f3 with SMTP id a135-20020a621a8d000000b00544130919f3mr36549720pfa.37.1667576439875;
        Fri, 04 Nov 2022 08:40:39 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id y133-20020a62ce8b000000b00565cbad9616sm2905778pfg.6.2022.11.04.08.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 08:40:39 -0700 (PDT)
Date: Fri, 4 Nov 2022 15:40:36 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
Message-ID: <Y2UydNBFR3e2DAe7@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
 <Y2QJ2TuyZImbFFvi@google.com>
 <c29e7d40-ddb9-def0-f944-a921a05a4bb2@redhat.com>
 <Y2QPSK1/6esl61wQ@google.com>
 <6c71fcca-c17f-5979-e15e-afcf08899064@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c71fcca-c17f-5979-e15e-afcf08899064@redhat.com>
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

On Fri, Nov 04, 2022, Paolo Bonzini wrote:
> On 11/3/22 19:58, Sean Christopherson wrote:
> > 
> > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> > index 3e508f239098..ebe617ab0b37 100644
> > --- a/arch/x86/kernel/cpu/common.c
> > +++ b/arch/x86/kernel/cpu/common.c
> > @@ -191,6 +191,8 @@ static void default_init(struct cpuinfo_x86 *c)
> >                          strcpy(c->x86_model_id, "386");
> >          }
> >   #endif
> > +
> > +       clear_cpu_cap(c, X86_FEATURE_MSR_IA32_FEAT_CTL);
> >   }
> >   static const struct cpu_dev default_cpu = {
> 
> Not needed I think?  default_init does not call init_ia32_feat_ctl.

cpuid_deps is only processed by do_clear_cpu_cap(), so unless there's an explicit
"clear" action, the dependencies will not be updated.  It kinda makes sense since
hardware-based features shouldn't end up with scenarios where a dependent feature
exists but the base feature does not (barring bad KVM setups :-) ).

That said, this seems like a bug waiting to happen, and unless I'm missing something
it's quite straightforward to process all dependencies during setup.  Time to find
out if Boris and co. agree :-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 1a85e1fb0922..c4408d03b180 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -147,6 +147,7 @@ extern const char * const x86_bug_flags[NBUGINTS*32];
 
 extern void setup_clear_cpu_cap(unsigned int bit);
 extern void clear_cpu_cap(struct cpuinfo_x86 *c, unsigned int bit);
+extern void apply_cpuid_deps(struct cpuinfo_x86 *c);
 
 #define setup_force_cpu_cap(bit) do { \
        set_cpu_cap(&boot_cpu_data, bit);       \
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 3e508f239098..28ce31dadd7f 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1884,6 +1884,8 @@ static void identify_cpu(struct cpuinfo_x86 *c)
                        c->x86_capability[i] |= boot_cpu_data.x86_capability[i];
        }
 
+       apply_cpuid_deps(c);
+
        ppin_init(c);
 
        /* Init Machine Check Exception if available. */
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index c881bcafba7d..7e91e97973ca 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -138,3 +138,13 @@ void setup_clear_cpu_cap(unsigned int feature)
 {
        do_clear_cpu_cap(NULL, feature);
 }
+
+void apply_cpuid_deps(struct cpuinfo_x86 *c)
+{
+       const struct cpuid_dep *d;
+
+       for (d = cpuid_deps; d->feature; d++) {
+               if (!cpu_has(c, d->feature))
+                       clear_cpu_cap(c, d->feature);
+       }
+}

