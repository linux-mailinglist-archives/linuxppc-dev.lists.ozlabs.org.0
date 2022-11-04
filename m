Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4E061A207
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 21:16:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3sN41Qfrz3dt5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 07:16:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Feo7aLcc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Feo7aLcc;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3sM55zCWz3bkZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 07:15:44 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so5466104pjk.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Nov 2022 13:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwcH+iZxGlELoSFmbiG2F+LcSAfxo7d4BXkkQPL3oEI=;
        b=Feo7aLccvIiUFCz0IQvThwilRRuNsyrpZUnftVsZfjj8XYXQSFrIYH3rBJ9pl9AVd1
         0QBS4p0eS2Auk5grltqCZHhMy52m2eoOZ3Dyjvl6u7ksM+uKmfXQViJ2DXA8oC3D4Z34
         IZgMWO3NptjbIzmMH+7K07NkCucKQA3oBW+yQ9OuKRe0+DMXUgLl0Rs58L/pchkt3qwG
         SRvLV8FDseMonl0kTvvz0KTjPcnWljQWZJ8bRjD448LzwgH9ljB4ZZnYaguVVVZ5Rh/H
         Z656e04FZq7s/SPiTN5UXm2Xfu4LYQY2nb1iUEZCzGlvNIqMCMtTR0K0fg2+3idK7iEY
         /AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwcH+iZxGlELoSFmbiG2F+LcSAfxo7d4BXkkQPL3oEI=;
        b=RFzilYsrmBGBvp0m5vEiEPZ6TtwYver17c6z/cFuEfrAFvjCpo/dnkz88WvNjseLRK
         TFsDyQ+KD3w4KjowHYAQgja84Mc2e+tNJl6/xKMSz89YEwac0AgnyqCzhFxUg2ogfBuu
         eJL0iXJTed0A17yY4yZi5GDiTGvBQdFVqHjLdG3aRFaFjaUxhkcnaK3RikywyKoKKYSI
         KI83bJWtHwIUqWWtbtYbDWuFPJUw3Y9oEPqwcb6755CXdqL4iCTAfWVoQHIYubZjotOs
         0eQ0rqeSj8fyzpyZH39V4YEbXYVLcOZoxwPUyEPeT2xmtmNH+6TaH1S3r7RbafBkgNnO
         LDvw==
X-Gm-Message-State: ACrzQf3OPjgGxDzzVtcrsCsuLCvfwmT+MF8Y5Q+Ags9m2eCg/6Hr4mZU
	sfl5r9S830JbZbEpxbiwtR8ocw==
X-Google-Smtp-Source: AMsMyM7LA9CKVJucdf56FhPBIDbY23ArzmJdn5v66cKOhKDCPGvtmHqu7FhmyFiehmOw+k0waEgaCQ==
X-Received: by 2002:a17:90a:2bc9:b0:212:8210:c92d with SMTP id n9-20020a17090a2bc900b002128210c92dmr38288471pje.38.1667592940349;
        Fri, 04 Nov 2022 13:15:40 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b00183c67844aesm166908plr.22.2022.11.04.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 13:15:39 -0700 (PDT)
Date: Fri, 4 Nov 2022 20:15:36 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH 02/44] KVM: Initialize IRQ FD after arch hardware setup
Message-ID: <Y2Vy6Eq89tQa+3bq@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-3-seanjc@google.com>
 <Y2Rfz+TIcdfcawxh@gao-cwp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2Rfz+TIcdfcawxh@gao-cwp>
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oli
 ver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 04, 2022, Chao Gao wrote:
> On Wed, Nov 02, 2022 at 11:18:29PM +0000, Sean Christopherson wrote:
> > 
> >+	r = kvm_irqfd_init();
> >+	if (r)
> >+		goto err_irqfd;
> >+
> > 	r = kvm_async_pf_init();
> > 	if (r)
> >-		goto out_free_4;
> >+		goto err_async_pf;
> > 
> > 	kvm_chardev_ops.owner = module;
> > 
> >@@ -5927,6 +5926,9 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
> > 	kvm_vfio_ops_exit();
> > err_vfio:
> > 	kvm_async_pf_deinit();
> >+err_async_pf:
> >+	kvm_irqfd_exit();
> 
> >+err_irqfd:
> > out_free_4:
> 
> Do you mind removing one of the two labels?

Ah, I meant to tack on a patch at the very end to clean up these labels once the
dust had settled, e.g. to also resolve the "err" vs. "out" mess I created (on
purpose, because trying to describe the "out" path was frustrating and generated
too much churn).
