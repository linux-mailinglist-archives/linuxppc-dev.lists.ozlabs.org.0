Return-Path: <linuxppc-dev+bounces-2059-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD89999079
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:33:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXP0DKsz3cT9;
	Fri, 11 Oct 2024 05:27:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584853;
	cv=none; b=Pp5CQLNq/ApiiNb0DXKII/PwpPIkYDbSD9FilH99fus1QjvG/KTAX2DjbBa3lQWpQCbeHjxwF6f6BfaV4SyMud5SCvdPS47HkKvmYhXO2/BIddzhVqs6xKLHgkSMiE2HO38JRpsPEZ4jslKkpvDR2Yqenfdy2rxgeM6LtcUCZ4tu8DsdMJ7s02X8cgnqyiQLEovQb3vEebdkBCZVk8DEqwBLjUpxRL61t8onM2EYUwArWP9FKDCh3Bme0/xM+7+MaemhPdma6wKtqt7PaUqEPDU0ikM1aiBL+YWmTbfBrmdVWMDTOPGC1q2HHzVNssbuTXebDk/2Gp8+GCsb/hQQig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584853; c=relaxed/relaxed;
	bh=DOlbrv8SiXT4cHz79KGvl4RMUSE/a2Kzzqa4ZWuWNYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a+ofqam52d35wa7KH/GAcxNmnNuB+myoRunrMq/HTJExTDStjOr6ZsGU8KUR21qDC7d0yO0jULI8jT4K7I47iIEfCKdxEvs3QRZ90i/oTNCc+UiH33kd5L3mV4MPa2ydBez37xEUigCy/c3YZPd4ymaW/W9l6J39plVwnxlYJYWH+NBVRPlpYgLsNFc2QQv/Bs5qFXcZ7AA7fhB8hquFP67f+A8MiYk93GkkWZPU+t/mxoLRZGyTi3Kh8rMm4mbFvGdzM+Tm3Z5bH3oJRWK11UCfQHrgSjMrnUUFC/auw8oFy69dWMCOL6NT+m9e8DB5sqVNf2Hcmo35d3UTAFx2Dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=N5E+0G0p; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3krwizwykdcoykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=N5E+0G0p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3krwizwykdcoykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXN0ghyz3cSv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:31 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e2d287f944so24113637b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584850; x=1729189650; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=DOlbrv8SiXT4cHz79KGvl4RMUSE/a2Kzzqa4ZWuWNYk=;
        b=N5E+0G0pXBw5n7Yk00IEYElzXJ5T4rP9r1gWAzTUia5FwYno7VsacBSp1ky+xKqa+I
         Q6IFXL2x6ELUPgwvIchsRJKucGiPuKQY4geEkWwgtP7YBOFhxnaZpXyk00ZKoJemmoqh
         QJZH4g0HJTVD35Ze42+9ENovhgjVvR4sOZSpmLatqC3Fyx4Xs2V2sjSgEXhj3B6P/2h9
         eJFFwCnz1iaoGIulmhBNj1XiHGH28aLQi2Xu1ie0KUSByfqy5wKONw3+5qE2LOcYrqWL
         oOzJckvKhS+c/389TQDgyLRLqt+b9H9Oo54+gHtoTVm3VYVzg01NVzSwdGFltaSxdJXY
         NvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584850; x=1729189650;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOlbrv8SiXT4cHz79KGvl4RMUSE/a2Kzzqa4ZWuWNYk=;
        b=cIimwR/5UFauyKt6SwRr+AFF3pAaq7IY9eiGV7AZtjfmrECO26VZfQe99k/CGTytxq
         3DqfkU9RecdhICqNqFfloEs9HSY9+0yaPphNKn29zBfpxx48EIYukcUlmZzk5F6x7I7m
         MD8nkqesNvWGiL5AicF/GjDUD0hfSr7X7l39pw4ZMl7WZd2AxwiLS8hKPp7AZngNETnz
         PmDSER/U9yCJPZr6NSU9iaORrYRGcnRjoHCRa/VplxBfdEy6QDLieHuiG4Yj7J7rjXbm
         cRPEOw4o9+PN1wIeCyNFYB8qkx0+NAVoEEho9QLKg7tyyW6BjUzy0ToqyqFOK564kAzO
         T6wA==
X-Forwarded-Encrypted: i=1; AJvYcCVa3cVBNyoYLrbugMPH5avXQ48xQJ4uQWuJNvzp4Yp6ug5s6SvNCrKZMD46HVPdYSDHF4Ac3Yq54QKzshI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz4BaVGFRrYbwBGjWXSDmuH0i+8MJBHlkurfs/wbaMUHswZcZqT
	z+rVetb8XwcTRlImG/VnqtRpvC/jO4RCr5+d3k0XAy2DCoIo1mauXyBEYJKC3U3BMKaEKki9w4e
	MjA==
X-Google-Smtp-Source: AGHT+IFYivPtvbNeJBK5QJ/MFgPKbd4XQ4GDAEMeTnfD7MuZnOh5ZwxKPEpX2RNQ0xKTZSwXcPzTQuagswA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a0d:f043:0:b0:6db:c6eb:bae9 with SMTP id
 00721157ae682-6e3220dbc31mr798327b3.2.1728584849896; Thu, 10 Oct 2024
 11:27:29 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:16 -0700
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
Message-ID: <20241010182427.1434605-75-seanjc@google.com>
Subject: [PATCH v13 74/85] KVM: PPC: Use kvm_vcpu_map() to map guest memory to
 patch dcbz instructions
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
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use kvm_vcpu_map() when patching dcbz in guest memory, as a regular GUP
isn't technically sufficient when writing to data in the target pages.
As per Documentation/core-api/pin_user_pages.rst:

      Correct (uses FOLL_PIN calls):
          pin_user_pages()
          write to the data within the pages
          unpin_user_pages()

      INCORRECT (uses FOLL_GET calls):
          get_user_pages()
          write to the data within the pages
          put_page()

As a happy bonus, using kvm_vcpu_{,un}map() takes care of creating a
mapping and marking the page dirty.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_pr.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index cd7ab6d85090..83bcdc80ce51 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -639,28 +639,27 @@ static void kvmppc_set_pvr_pr(struct kvm_vcpu *vcpu, u32 pvr)
  */
 static void kvmppc_patch_dcbz(struct kvm_vcpu *vcpu, struct kvmppc_pte *pte)
 {
-	struct page *hpage;
+	struct kvm_host_map map;
 	u64 hpage_offset;
 	u32 *page;
-	int i;
+	int i, r;
 
-	hpage = gfn_to_page(vcpu->kvm, pte->raddr >> PAGE_SHIFT);
-	if (!hpage)
+	r = kvm_vcpu_map(vcpu, pte->raddr >> PAGE_SHIFT, &map);
+	if (r)
 		return;
 
 	hpage_offset = pte->raddr & ~PAGE_MASK;
 	hpage_offset &= ~0xFFFULL;
 	hpage_offset /= 4;
 
-	page = kmap_atomic(hpage);
+	page = map.hva;
 
 	/* patch dcbz into reserved instruction, so we trap */
 	for (i=hpage_offset; i < hpage_offset + (HW_PAGE_SIZE / 4); i++)
 		if ((be32_to_cpu(page[i]) & 0xff0007ff) == INS_DCBZ)
 			page[i] &= cpu_to_be32(0xfffffff7);
 
-	kunmap_atomic(page);
-	put_page(hpage);
+	kvm_vcpu_unmap(vcpu, &map);
 }
 
 static bool kvmppc_visible_gpa(struct kvm_vcpu *vcpu, gpa_t gpa)
-- 
2.47.0.rc1.288.g06298d1525-goog


