Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C145861A224
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 21:28:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3sdS53q3z3dt5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 07:28:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q/PTXKQj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=q/PTXKQj;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3scW4mvtz2xf6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 07:27:22 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id k22so5462829pfd.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Nov 2022 13:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzyhTv3BAtgpGpRr8HnNLx/d2zCvSqkboAFtik4Imo0=;
        b=q/PTXKQj3ArVm2XzZe97QeFygVMm1eXh+9AVtXcJ75aOhS7rpOmmmorCukrcxmTsXJ
         xtHpP7JyICLKwJpO4UdyBCOfADg9j8qWzQtBsGyOUBj4dtUE2hEcaa0M2lJNL2RYHNdm
         t9CE40syL4mSgI+9axRmHRY3m49U53Bcc5xsUL4w5HmCnvq3rZFCi8RspoeZ0S4Nhg0P
         dklWYN0e+iqclhNFPVLNqLlrIm4bRgIuUSiy6nVFx0aKBZbtXqUzzmm+oTu43A9TiINS
         r9mhyi03/1kAIfHUOzdEnLew/bMGSFKH13ZsSBoEdZkxO+PvUKRhjXGV6DaJ6ZELthJK
         tWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzyhTv3BAtgpGpRr8HnNLx/d2zCvSqkboAFtik4Imo0=;
        b=iwMPxE1hkInVZKhRtFpvj2XEXL4MMzReibK6HNudjhZScbwAr14j8WvysX1H55ZCkd
         vgzWVK5tgvxJcWT+sUe+l8iDPRx6RPyLmHqlqbr6fY9UXCqC++4YAALTZPM+QGmR+OPj
         CIVAuvL3qB/deMjAECEUXvpLBe0j+RGt1FvxY2fRagqqNPDn4Z0dtEXhEBjgWy7xUtPO
         UzINODR4Igiza0QNYGG7Z4JjBcfn5qgyxCx5gdKa8q8zmtnAFki63BRZJB4M8D+naEdM
         SdvE4MEwQOz9/MSSvWT7aOsLzha9sHqzf7Yamhe/ZXGe+hVtOPwQ0yv+Xk0xfAe4reVa
         WCJw==
X-Gm-Message-State: ACrzQf0cJ/PN/UlZ8Qr8RhBMcIwLhrcy380dUgCH+topRO0FhLS6k8il
	ju78euhbe6iWweJVfeN7ZTHtLA==
X-Google-Smtp-Source: AMsMyM6nILnCIcSIsk5JMrE+WRVnxFnaYDn7QGx3yWf1KAa3dZc7TNSn3aZcg19Xay3NbhiF32a9mw==
X-Received: by 2002:a05:6a00:1781:b0:561:7f7f:dc38 with SMTP id s1-20020a056a00178100b005617f7fdc38mr38037687pfg.42.1667593638927;
        Fri, 04 Nov 2022 13:27:18 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id u8-20020a1709026e0800b0018863e1bd3csm159522plk.134.2022.11.04.13.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 13:27:18 -0700 (PDT)
Date: Fri, 4 Nov 2022 20:27:14 +0000
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
Message-ID: <Y2V1oslbw24/2Opd@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221104071749.GC1063309@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104071749.GC1063309@ls.amr.corp.intel.com>
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

On Fri, Nov 04, 2022, Isaku Yamahata wrote:
> Thanks for the patch series. I the rebased TDX KVM patch series and it worked.
> Since cpu offline needs to be rejected in some cases(To keep at least one cpu
> on a package), arch hook for cpu offline is needed.

I hate to bring this up because I doubt there's a real use case for SUSPEND with
TDX, but the CPU offline path isn't just for true offlining of CPUs.  When the
system enters SUSPEND, only the initiating CPU goes through kvm_suspend()+kvm_resume(),
all responding CPUs go through CPU offline+online.  I.e. disallowing all CPUs from
going "offline" will prevent suspending the system.

I don't see anything in the TDX series or the specs that suggests suspend+resume
is disallowed when TDX is enabled, so blocking that seems just as wrong as
preventing software from soft-offlining CPUs.
