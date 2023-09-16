Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4917A2CBA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:49:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=mi/AgKSd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXX24CtKz3fHB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:49:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=mi/AgKSd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3g_cezqykdlqmyuhdwaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX7T1CrQz3dJD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:32:05 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59c12d31d04so12968107b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824323; x=1695429123; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kZSgVl8Q+hmlGcu9E42B+6nCYbsSFCH4k+E/cwlLEa8=;
        b=mi/AgKSdx8Td913EBUFNyf/TuGeMm6MfMC9nS2VB0pJqoAm66mfqdD5CmnLEUdbVlQ
         4xlu+JF0BGEQLrZDnpLfEg1TmBYIyi8J7jzXZ8SQEM2Kj8XYGuRfBqav+IHmd6BpnPZL
         c2Ijfx7ZDNqtZLrrd0zkfpOiDSr8m9iBxibeSlaLiHA8dEBRixvj0bvePV9gOI9GEyyf
         eXrVS2PqtcR+EymnWhdAuWCTjqVgdGp9JZM9zB9SFNGrUv4yB5q+AgTbGt2EBqBDO0mp
         K2Y/n5xCFLnAfqSmSxhP191ytRSwz9GEjmchFyEKmeHXHF6LR10NSWhi1tqBFH9JN5uj
         CJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824323; x=1695429123;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZSgVl8Q+hmlGcu9E42B+6nCYbsSFCH4k+E/cwlLEa8=;
        b=MyPepwUjAqDqgylpetD3OAHix2o9O0bD7+wjj846ztJlIYbmwXoFOapONqRoQWCbGg
         wjR6ETgyRlc7OIJOU/USw0vOTBYsnH+sdLpLUJuagBAuJL0vp1uaqpAdo7GuPNROcwRc
         8vyaf8z7a5+AC7mqnWyr3os2+ST++6DzDWspdyEJ1DQ5AQZyU69J/tquReYB953S9AKB
         LBOMiZjHqNceIi0f/LUwU6JqsQjioDqnDhJ54aXV0G6WkDb+8wP2q7IHUqrDBDBcymaz
         tRW9byrT2H/LNcECEmdhI9YsvO6Krd9ZLcHhEkYXpxr8qltP21KQgGgq7PXuiudhOLlb
         Favg==
X-Gm-Message-State: AOJu0YyDqJc4hTY9Via2Rosmc40x08y+8/bo5UImO7yEg5nhKKZM12cl
	rhVxvfR0fzhPtCvApPPy+7oNnfwxT1I=
X-Google-Smtp-Source: AGHT+IGvK90kPH1o5bQH0EPib2Mktorl92L52Xc3vYMLm3HoBq+aka+3/3i87f2Q/TuhX6d+6vnq3Y1BBZw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b60c:0:b0:586:a58d:2e24 with SMTP id
 u12-20020a81b60c000000b00586a58d2e24mr95790ywh.5.1694824323076; Fri, 15 Sep
 2023 17:32:03 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:13 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-22-seanjc@google.com>
Subject: [PATCH 21/26] entry/kvm: Drop @vcpu param from arch_xfer_to_guest_mode_handle_work()
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Venkatesh Srinivas <venkateshs@chromium.org>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Thornton <andrewth@google.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop the "struct kvm_vcpu" parameter from
arch_xfer_to_guest_mode_handle_work() as a preparatory step towards
removing the vCPU parameter from xfer_to_guest_mode_work() as well.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/entry-kvm.h | 7 ++-----
 kernel/entry/kvm.c        | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/linux/entry-kvm.h b/include/linux/entry-kvm.h
index 6813171afccb..e7d90d06e566 100644
--- a/include/linux/entry-kvm.h
+++ b/include/linux/entry-kvm.h
@@ -25,18 +25,15 @@ struct kvm_vcpu;
 /**
  * arch_xfer_to_guest_mode_handle_work - Architecture specific xfer to guest
  *					 mode work handling function.
- * @vcpu:	Pointer to current's VCPU data
  * @ti_work:	Cached TIF flags gathered in xfer_to_guest_mode_handle_work()
  *
  * Invoked from xfer_to_guest_mode_handle_work(). Defaults to NOOP. Can be
  * replaced by architecture specific code.
  */
-static inline int arch_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu,
-						      unsigned long ti_work);
+static inline int arch_xfer_to_guest_mode_handle_work(unsigned long ti_work);
 
 #ifndef arch_xfer_to_guest_mode_work
-static inline int arch_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu,
-						      unsigned long ti_work)
+static inline int arch_xfer_to_guest_mode_handle_work(unsigned long ti_work)
 {
 	return 0;
 }
diff --git a/kernel/entry/kvm.c b/kernel/entry/kvm.c
index 2e0f75bcb7fd..c2fc39824157 100644
--- a/kernel/entry/kvm.c
+++ b/kernel/entry/kvm.c
@@ -19,7 +19,7 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
 		if (ti_work & _TIF_NOTIFY_RESUME)
 			resume_user_mode_work(NULL);
 
-		ret = arch_xfer_to_guest_mode_handle_work(vcpu, ti_work);
+		ret = arch_xfer_to_guest_mode_handle_work(ti_work);
 		if (ret)
 			return ret;
 
-- 
2.42.0.459.ge4e396fd5e-goog

