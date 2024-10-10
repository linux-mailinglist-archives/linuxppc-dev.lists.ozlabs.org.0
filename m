Return-Path: <linuxppc-dev+bounces-2032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF8C999041
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:30:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWG1x9Hz3cJW;
	Fri, 11 Oct 2024 05:26:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584794;
	cv=none; b=AU5Ww5at7VPfhFedabkxmB3cv/UATyLdZC4eDnjK4+ue3wMNyzhHdz45DzNWEa388+b5IH8onniUhoBvjSY8Z6eXcaLB0qKxi8kC71p79ZC7OhTt/59JUop9psRmgWWagVjoXgtFyO/JUCdt5Tw/mER1S62WMIH48E4C1MlC2Zxe9tNwVgf1k/85JtnLhFhwfjBYj50/q6LGRISYDWEm4GrPw0Z5X2gx1wcmApBuxOpZbljSuQaVqaOMgpzu/DTy9adY9gKlOtdcAggZ0M78N0TQX1ec1glFn9jDuMlnwRPSN1AykNmQzmim5og7wxt+T4Af3hXWTMUW3XbwDdYCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584794; c=relaxed/relaxed;
	bh=l4aL9ye2ZxrCnqTpLqQlinT65BUul16gfmDzid4NN5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V/Iv7yQrYbd6ttdCnGn3qfVwCVHPmkAji0J3WQ7k17ZmBvVqXfgH8qxRxowi5zKhp8ZJz+NciVml7AWfmRL7aDTwPGlOU9PftqVmDvo/aodGL+O7bxtfha1u1IU5acQVC9B91bsuo8y4YQ2j3EgQgJsChm2Y3jvJCFiwgaCGM///0+EJGAuir8kyJdegwgkAxvfiUMUmVX96YlZbbYHyAqSDJOQeQBMEuUw8MtvWmXiKVDDx98tMFXBsu8kV5V8SPSvXhUysuWjoRISOoIg2xo/o7Tdzbrceuh5ruCynrD0b2Aru9x39KW0xwZNu+vFnQfOrkwORAGJvTp/A2MClmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZJYbRk37; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3vhwizwykdo0htpcyrvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZJYbRk37;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3vhwizwykdo0htpcyrvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWF3RJhz3cH7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:33 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-71e019ab268so1589283b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584792; x=1729189592; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4aL9ye2ZxrCnqTpLqQlinT65BUul16gfmDzid4NN5Y=;
        b=ZJYbRk372ElEE5xinEQMgmUbbxVyCB9pMrqqqBUVd1njR/HiGgjydEw7YKhvc/wa96
         qbE3P+lVWu6q4r1EI3kBO84995zXJwVCqLNGXxTQjC9hqaTKq5QE9+4Vi9rkIPwurg8I
         CLUgHLS0RR5ZVF3PHsk77S/HrVw+VnozyLRB0UTBsMOk1D5bVL/BQnpeXONqgfxG4JNu
         ZNzBhf04Xa0d0ide7o7gU+pY5ACrAMB6lQ8CpFujh4enOjQTllxYZ6gXoqD1kdI3iPHf
         SLqNZpdFKpKxcwCKI4qK9UjM7Mp2tULO3muy8RLiiitsqOB0tN84XNN6DISa9LwPw8oY
         lqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584792; x=1729189592;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4aL9ye2ZxrCnqTpLqQlinT65BUul16gfmDzid4NN5Y=;
        b=j9LUk5i57KjmWcu3w50ISJhXd/4phhL9RxgDrkIMez7utPgAxcmgGdFjrQyA4Z7fkM
         W0ge6W4Ul+iuE7jftzgTYt2+nEosc1aPMbuG3KmgnIr4ZJszC9jsIJ7nn/OKQ46BUDnG
         wHwIgbMfMufuomN48indBIgR4RPD8TM3cQXqkJb9iOUUfV6DoTS1VTuvsypzTDriI8qu
         TAjomZfeVoHU5/qO+p5O02ze7ragEwpnm6aL66KQ2i5ccOFMjg/18OoTbhJfnM6vM3SW
         dila1jIpmAyEDZO2OpRnhDjXKUkkMgu5/7KzpczM/yz7HfkknJ1h9UoP3gpF7SyDyKPG
         H/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI0QFPy/+4E4aX+ibenHZkWRZbCEt05F5gdFpEBi6vb5BRAB/cCpN0bdjSmTmyARH9s3vkZysrYmHUW74=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxEsUI1xQtJDwAazX3Ob4vF9vmLbzODbXGHbntuk4yRO4qABllq
	tPXt2HSAQRxkRP4FvyISf50Ay6uhioU93oP/boa5hT6SLfasmgIejdC2/QV0U7rllP+nb7msdrw
	LoA==
X-Google-Smtp-Source: AGHT+IFunsAHL0GYDEyxrwNnSExkBiXOv88aJkEgjVxw5ZDXOBsEr4Eha3ByEK4QIBQ4extfr7SnAz+Fl/s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:aa7:9184:0:b0:71d:f7c9:8cb3 with SMTP id
 d2e1a72fcca58-71e1dbf1ab5mr7799b3a.5.1728584790633; Thu, 10 Oct 2024 11:26:30
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:49 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-48-seanjc@google.com>
Subject: [PATCH v13 47/85] KVM: x86/mmu: Put refcounted pages instead of
 blindly releasing pfns
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now that all x86 page fault paths precisely track refcounted pages, use
Use kvm_page_fault.refcounted_page to put references to struct page memory
when finishing page faults.  This is a baby step towards eliminating
kvm_pfn_to_refcounted_page().

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a038cde74f0d..f9b7e3a7370f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4373,6 +4373,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu=
 *vcpu,
 	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
 			    r =3D=3D RET_PF_RETRY);
=20
+	if (!fault->refcounted_page)
+		return;
+
 	/*
 	 * If the page that KVM got from the *primary MMU* is writable, and KVM
 	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
@@ -4384,9 +4387,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu=
 *vcpu,
 	 * folio dirty if KVM could locklessly make the SPTE writable.
 	 */
 	if (!fault->map_writable || r =3D=3D RET_PF_RETRY)
-		kvm_release_pfn_clean(fault->pfn);
+		kvm_release_page_clean(fault->refcounted_page);
 	else
-		kvm_release_pfn_dirty(fault->pfn);
+		kvm_release_page_dirty(fault->refcounted_page);
 }
=20
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
--=20
2.47.0.rc1.288.g06298d1525-goog


