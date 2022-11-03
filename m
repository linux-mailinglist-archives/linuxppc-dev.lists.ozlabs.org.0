Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCC46187A0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:36:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3CBW2kvMz3cKv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 05:36:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Pm4Lr3kA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Pm4Lr3kA;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3C9Y1msHz3c5D
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 05:35:12 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so1231365pjs.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 11:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgoOqWPJe20h3F3t+kWJTAR37+M7sNOsPG89iz5Bulk=;
        b=Pm4Lr3kAm7G9yhV3E+texinWexF8/BykknHnX+41QMhdAJg8Q6KGdsZlwDR9KsaQ03
         q0oiA6QGnfMNaCLi6FwippomEY2Gxx8DIbtsls7Wm3K9Y5ntAz6T/fo5rOOGqR0XZexV
         IMpIarVZKtd2r4wbd6pBH2HWWgUKLdmEcjKjz7hr2eZWqilU2ZOjSL0LQYBIbuLk+an3
         F080UdTs/Pl//2c4Y7M3MC5aXIj0L8ze9uKQnOS3RTfUxOdNjPBYkRT7wM2xznbkkPNf
         k6rWzEiCMkA6YZikO6kTaZUjEx2R8QJERpkjNDf1cNtL0uRiWX1pfQEgD4PMO8IN1GPi
         cqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgoOqWPJe20h3F3t+kWJTAR37+M7sNOsPG89iz5Bulk=;
        b=jxdi5h/BH/n4uY5cu3OCHmyno2rjGbfiPvp2diEOJBHNWsoG+oTyYPjfYwgX97l89j
         tD/rQJA7PjhIpGrcRbXKpi73gNIrTacZQ4dszRvTwxd92yVaxTxk0JC0ddCV1IZUOLOA
         RWZ4WNi2HJh+39tABnbGTGv4IUy4o/K+tUmY/DPWPMshb3XGSCuDvUJ01/sV9IUVDPw2
         zQ9lGoX3Fuv4rrKb9D7qq9UWv4F/c7+gqvO9x+J6xZzW5KyXslKoY+7CrTvIVwi/dUKL
         /aV+7k1lABwFKq2gGJnbnkhKEE2WKPkNTpHgbpsxLFERna4l01IhrnrkiLqKBTb86CJc
         o7MA==
X-Gm-Message-State: ACrzQf1RKBlqKtEhlFJ5wtkrV6HG72frmMlyqatrC6IHwQnSeIs7GA3h
	IKFog1kPbBC617vCpsns0/dokw==
X-Google-Smtp-Source: AMsMyM7An2PKDpytAFzn8oRI/SQJomdGS1nTfx9CsrnDxhHyyoY4AD/5FsaR2YoYMTMl2oHfbxu0kQ==
X-Received: by 2002:a17:903:1250:b0:185:40c6:3c2c with SMTP id u16-20020a170903125000b0018540c63c2cmr31387342plh.64.1667500509087;
        Thu, 03 Nov 2022 11:35:09 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id z4-20020a1709027e8400b0017da2798025sm914686pla.295.2022.11.03.11.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 11:35:08 -0700 (PDT)
Date: Thu, 3 Nov 2022 18:35:05 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
Message-ID: <Y2QJ2TuyZImbFFvi@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfa98587-3b36-3834-a4b9-585a0e0aa56a@redhat.com>
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
> On 11/3/22 00:19, Sean Christopherson wrote:
> > +	if (!boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> > +	    !boot_cpu_has(X86_FEATURE_VMX)) {
> > +		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL\n");
> > +		return false;
> 
> I think the reference to the BIOS should remain in these messages and in
> svm.c (even though these days it's much less common for vendors to default
> to disabled virtualization in the system setup).

Ya, I'll figure out a way to mention BIOS/firmware.

> The check for X86_FEATURE_MSR_IA32_FEAT_CTL is not needed because
> init_ia32_feat_ctl() will clear X86_FEATURE_VMX if the rdmsr fail (and not
> set X86_FEATURE_MSR_IA32_FEAT_CTL).

It's technically required.  IA32_FEAT_CTL and thus KVM_INTEL depends on any of
CPU_SUP_{INTEL,CENATUR,ZHAOXIN}, but init_ia32_feat_ctl() is invoked if and only
if the actual CPU type matches one of the aforementioned CPU_SUP_*.

E.g. running a kernel built with

  CONFIG_CPU_SUP_INTEL=y
  CONFIG_CPU_SUP_AMD=y
  # CONFIG_CPU_SUP_HYGON is not set
  # CONFIG_CPU_SUP_CENTAUR is not set
  # CONFIG_CPU_SUP_ZHAOXIN is not set

on a Cenatur or Zhaoxin CPU will leave X86_FEATURE_VMX set but not set
X86_FEATURE_MSR_IA32_FEAT_CTL.  If VMX isn't enabled in MSR_IA32_FEAT_CTL, KVM
will get unexpected #UDs when trying to enable VMX.
