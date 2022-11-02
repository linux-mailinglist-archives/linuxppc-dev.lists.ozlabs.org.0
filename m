Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A83086172AF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:34:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2jsR41qYz3fTd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:34:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ay8cPyDC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3dftiywykdlaiuqdzsweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ay8cPyDC;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jXH3R3Fz3cMb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:19:43 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id ci1-20020a17090afc8100b00212e5b4c3afso14580pjb.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yE/4Y9j/oYhrNnppN3pBbrFR3yZQeQID1rXlzF1UIrs=;
        b=ay8cPyDCIqaMfo0DK1yGgX9Wb9Bl9/1fVHbdhv2aAy1cj0+xuZ97OrHcZUeV1cFb37
         6xEzJJ8+vktqwJnTtuH1USFvq8dlhSmN+zODY90fpIycgDYl660YnoWyBjRJ4shxmyzm
         eiIMz6ZQ5l1bjRGivO4fA9kceUx/9ETkzTfr9tWJ9HyO6sppdHxDi6fl6UdHy8ptqT6P
         DK4l+CKIMpqMLCpZJAWwhuO/obSacLjdsxWR0MNI7G5lNuNRlHspSUm1vSdSmF25/DFv
         q5eNxeOVs/atfRGxPMYHZj9KnffzNZveBs/Mh+BUBe8auRPPWp99Q7jjD7exn9MfTR0m
         9eDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE/4Y9j/oYhrNnppN3pBbrFR3yZQeQID1rXlzF1UIrs=;
        b=xRhbCoQP7faPzEo4M3l+MNhoiLGGWjYj3VCsqbe6ttTmjzaOJ3OxqdPA62GxLs984+
         KbjIJQoxlBB0S9QAQxG6Lrsu58MNh6gwSNu0WRzaepI8OCq3ZKPDlng7/4AkoWSsSIMk
         8cg4bA1Ijy4XlsfmpG8HqVJf17JXXwPtOeCbQgxZv85ckNe0iJJ0SQx/PRcaLCc4hlWN
         zpq+ZIs41fPou+/Tea4jiX0pFTxygcUtkN4vSWUJbHJXW2bd+kMwNukqDj9SF3DDduPo
         J61bn+mLXTD9GclHUcG2VycvnuEf3NOl12ugiBD2HjZktFHfSi+B7yie8/GYyqwjCM9M
         JOSg==
X-Gm-Message-State: ACrzQf11aEoOIk4Px4AqopFhNrgcS9gbPuQtDfsW7a4QjHWpbK04Q4JV
	ISUzv3dpSRZ5zyK7fR2aoptj/vyhkkc=
X-Google-Smtp-Source: AMsMyM5/m9Qv5qe0i9jmB6ZTvP1qiSAaI3rCUeMWt3X4Tz8UOP4pahzgtmW58pUMKKKCCfw0sH3ElrsKh+M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:d412:0:b0:56c:6f25:8b12 with SMTP id
 a18-20020a62d412000000b0056c6f258b12mr27322827pfh.60.1667431181026; Wed, 02
 Nov 2022 16:19:41 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:43 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-17-seanjc@google.com>
Subject: [PATCH 16/44] KVM: arm64: Unregister perf callbacks if hypervisor
 finalization fails
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Undo everything done by init_subsystems() if a later initialization step
fails, i.e. unregister perf callbacks in addition to unregistering the
power management notifier.

Fixes: bfa79a805454 ("KVM: arm64: Elevate hypervisor mappings creation at EL2")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 73644def7780..f400a8c029dd 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1839,12 +1839,21 @@ static int init_subsystems(void)
 	kvm_register_perf_callbacks(NULL);
 
 out:
+	if (err)
+		hyp_cpu_pm_exit();
+
 	if (err || !is_protected_kvm_enabled())
 		on_each_cpu(_kvm_arch_hardware_disable, NULL, 1);
 
 	return err;
 }
 
+static void teardown_subsystems(void)
+{
+	kvm_unregister_perf_callbacks();
+	hyp_cpu_pm_exit();
+}
+
 static void teardown_hyp_mode(void)
 {
 	int cpu;
@@ -2237,7 +2246,7 @@ int kvm_arch_init(void *opaque)
 
 	err = init_subsystems();
 	if (err)
-		goto out_subs;
+		goto out_hyp;
 
 	if (!in_hyp_mode) {
 		err = finalize_hyp_mode();
@@ -2258,7 +2267,7 @@ int kvm_arch_init(void *opaque)
 	return 0;
 
 out_subs:
-	hyp_cpu_pm_exit();
+	teardown_subsystems();
 out_hyp:
 	if (!in_hyp_mode)
 		teardown_hyp_mode();
-- 
2.38.1.431.g37b22c650d-goog

