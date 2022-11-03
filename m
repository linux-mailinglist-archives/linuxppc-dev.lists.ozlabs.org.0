Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 334376182E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 16:30:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N374s0bH5z3ccn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 02:30:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JxP3em5m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=seanjc@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JxP3em5m;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N373x3y1qz2x9v
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 02:30:05 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id b62so2003572pgc.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UyUe+HbRzSrTdJquQCMiaXWC2coZG28I37xguDaJaYg=;
        b=JxP3em5mMEo8M/seyYjwqQClKWueZhrkefM7iopEbtJ9U0ARhXsBBlBaHvB0YZ+mCq
         7I2lDIbzgsTnUJXXFFd+Mf2MRkvMQ3d/mi120+0k+co+feliF2fGnlDGLipP3oo4jHIs
         yhCQnzB0LNdLsoCiyP2ThdGCDug/wevVBzx4ZCIoRVJzM62ULFanZrMyKnrfoLhgGw7L
         LE3NJVvLI80qGdb5QUdNBUYtcEfD6sTxNonp/rLGuh5no7R8ACiBwreWQkoFJnyoE1Nq
         joZ/uzznkWHqO7mwwbSR52gm1kYa+vf+hliw2Y9f1o05+cN6N5swUWJ7vJszMr5BEKoW
         HTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UyUe+HbRzSrTdJquQCMiaXWC2coZG28I37xguDaJaYg=;
        b=ytsWfWJVQiLq0mUEP57vqFWSncXVilHQWDFfJtRGuZwnZ7YFwOjlhXkr5f8+tJFWlv
         VhrY5kmMxDh++wbI07XYvTpFB8c8CGpeEcVKIxHV38XXB+wnbfjA4PCp2p4HKsMpy7x1
         iIpgr3LebaUiMzkzYYkB2YOUqe35wnS6ClNu0QBxDwuONECaEWiDRO4KunsAYnYCd/3p
         cPu7X1FqQAeq+gzgGuZFf4E5eaYTO4/7XLZlIw2uYIs9wghgrG90ovE05vIWK2AaFZHm
         cyRkWwvb1qN8w5r5cP0DpHrsG6XDyc7luKyx9b8+tSdIFIzxFUGppOzStBWLTdHmB95d
         XJEQ==
X-Gm-Message-State: ACrzQf20A0/O+WJABQUBCbTJuJW2SQaMwanyR8zIO6kPO+GFs5z+bghn
	Q+EQCJJZKXpu2vsAE1MUS6/2bQ==
X-Google-Smtp-Source: AMsMyM6by5WQXi0G4lBZGaavWsGrxKC8DeWyAUbAtvZsM8BboB9ucyemIyMYLKoI4FadI1MlyxYOPw==
X-Received: by 2002:a05:6a00:1996:b0:56d:a845:5789 with SMTP id d22-20020a056a00199600b0056da8455789mr17697890pfl.59.1667489402026;
        Thu, 03 Nov 2022 08:30:02 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id f3-20020a170902f38300b0017a018221e2sm835452ple.70.2022.11.03.08.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 08:30:01 -0700 (PDT)
Date: Thu, 3 Nov 2022 15:29:58 +0000
From: Sean Christopherson <seanjc@google.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH 17/44] KVM: arm64: Do arm/arch initialiation without
 bouncing through kvm_init()
Message-ID: <Y2Pedr1MYt/P1uL0@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-18-seanjc@google.com>
 <dd59d579-4a4e-6db2-eac4-6c5c3ab71fd3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd59d579-4a4e-6db2-eac4-6c5c3ab71fd3@linaro.org>
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

On Thu, Nov 03, 2022, Philippe Mathieu-Daudé wrote:
> Hi Sean,
> 
> On 3/11/22 00:18, Sean Christopherson wrote:
> > Move arm/arch specific initialization directly in arm's module_init(),
> > now called kvm_arm_init(), instead of bouncing through kvm_init() to
> > reach kvm_arch_init().  Invoking kvm_arch_init() is the very first action
> > performed by kvm_init(), i.e. this is a glorified nop.
> > 
> > Making kvm_arch_init() a nop will allow dropping it entirely once all
> > other architectures follow suit.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/arm64/kvm/arm.c | 25 ++++++++++++++++---------
> >   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> >   /* NOP: Compiling as a module not supported */
> >   void kvm_arch_exit(void)
> >   {
> > -	kvm_unregister_perf_callbacks();
> 
> Doesn't this belong to the previous patch?

No, but the above changelog is a lie, there is very much a functional change here.

The goal of the previous patch is to fix the error paths in kvm_arch_init(), a.k.a.
kvm_arm_init().  After fixing kvm_arch_init(), there are still bugs in the sequence
as a whole because kvm_arch_exit() doesn't unwind other state, e.g. kvm_arch_exit()
should really look something like:

  void kvm_arch_exit(void)
  {
	teardown_subsystems();

	if (!is_kernel_in_hyp_mode())
		teardown_hyp_mode();

	kvm_arm_vmid_alloc_free();

	if (is_protected_kvm_enabled())
		???	
  }

Becuase although the comment "NOP: Compiling as a module not supported" is correct
about KVM ARM always having to be built into the kernel, kvm_arch_exit() can still
be called if a later stage of kvm_init() fails.

But rather than add a patch to fix kvm_arch_exit(), I chose to fix the bug by
moving code out of kvm_arch_init() so that the unwind sequence established in the
previous patch could be reused.

Except I managed to forget those details when writing the changelog.  The changelog
should instead be:

  KVM: arm64: Do arm/arch initialization without bouncing through kvm_init()
  
  Do arm/arch specific initialization directly in arm's module_init(), now
  called kvm_arm_init(), instead of bouncing through kvm_init() to reach
  kvm_arch_init().  Invoking kvm_arch_init() is the very first action
  performed by kvm_init(), so from a initialization perspective this is a
  glorified nop.
  
  Avoiding kvm_arch_init() also fixes a mostly benign bug as kvm_arch_exit()
  doesn't properly unwind if a later stage of kvm_init() fails.  While the
  soon-to-be-deleted comment about compiling as a module being unsupported
  is correct, kvm_arch_exit() can still be called by kvm_init() if any step
  after the call to kvm_arch_init() succeeds.

  Add a FIXME to call out that pKVM initialization isn't unwound if
  kvm_init() fails, which is a pre-existing problem inherited from
  kvm_arch_exit().

  Making kvm_arch_init() a nop will also allow dropping kvm_arch_init() and
  kvm_arch_exit() entirely once all other architectures follow suit.
