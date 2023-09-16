Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BCD7A2CAA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:46:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DygTur6Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXS73TYJz3fXm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:46:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DygTur6Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3evcezqykdksdplyunrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX7J6J1Qz3dGw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:31:56 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d81a47e12b5so2554684276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824315; x=1695429115; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PzobvpQc4vWfR42iy4RjYEgAb/kHLuzC5INLwcS+RqY=;
        b=DygTur6Z9NYVg54OkksLMgpSZvfRHX8Scv/HuBAa4FMElpbXZHLYQtKfub4AeNeTZc
         IUxYU8h/iEYlxYhK97M6l99xRXTE5zD4gLBRGFO6QPnRVjiNi1YQUo9jlcKmHbOwis6E
         XXDGiJ+gsD2pZPo3cwQwgU/LRxyp/4rHVyCUTzylByRCkSEp+HEgbiJP31xmYrVETsP0
         OetcoThvJ39h/QLoP+dDumiPcdq35fU0jMiqa33OvdyMqHZ3imeZ01xqXAn9q/S9i/xp
         SZkkpHhIagHUF4bl1XxhjesMlhl9Q8O4eCrhEh3bfqSfn8f9RFoHpAKmuNEKALz9KJ8t
         R46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824315; x=1695429115;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzobvpQc4vWfR42iy4RjYEgAb/kHLuzC5INLwcS+RqY=;
        b=IhAaIbgrZXN8SgpkAv0ikiu78EQhZI5R+FF3T1o1X+PW8cs9pUh02TvXqUVxC8Bbrm
         4eJ5tAynQff05caChTobskCA5Mlw6Bkr+ns6JawgP8wmC0vulQRtK28+seALc7aFxEVy
         J/qHciDyrM+kTN+1E1GCUDx/sgSctFwhiJ/QHdCASbVSsCA6g/bowjxh7l8y6j2XocsH
         fqQf2cnw/Pn9BxloWeDjeclGlSeL2vETxIaciPWq72FsNZkY3xFPjLTsKwojXWL8fKNj
         vW7F5uXf4QDmcqviyIzyO5Se6u7Q7y/Q8hD80R3bRp0atnTHV6HcnO2H/HFCEYYO9i16
         5aCA==
X-Gm-Message-State: AOJu0Yy51GYPS7q9xqG25Zncr1y/FEh/yigMgB6jvK7EB0wcwFHo/OSh
	X61Jwhx1NacFeQPz489rcnDaw2EVhHY=
X-Google-Smtp-Source: AGHT+IEHyBaVn0yDFSDy5XyxKJ2PGYyocUtrZpuSTqYnDVflp7SqStNr9ZpB4/OYXqxtlzASuEez5Ye4vGU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2e06:0:b0:d77:fb4e:d85e with SMTP id
 u6-20020a252e06000000b00d77fb4ed85emr78448ybu.6.1694824314795; Fri, 15 Sep
 2023 17:31:54 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:09 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-18-seanjc@google.com>
Subject: [PATCH 17/26] KVM: PPC: Stop adding virt/kvm to the arch include path
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

Don't add virt/kvm to KVM PPC's include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that PPC *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a different
architecture's Makefile when PPC support was first added.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 5319d889b184..08a0e53d58c7 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -3,7 +3,7 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y := -Ivirt/kvm -Iarch/powerpc/kvm
+ccflags-y := -Iarch/powerpc/kvm
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-- 
2.42.0.459.ge4e396fd5e-goog

