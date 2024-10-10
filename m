Return-Path: <linuxppc-dev+bounces-2017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6E1999023
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:28:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVf0hKHz3bjg;
	Fri, 11 Oct 2024 05:26:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584762;
	cv=none; b=fT+paY/hiZ4sZS7r6LSgRTEaxb7ol9mkSLFT2PYy+nW2gYQfR0bHoPABaY6EWeQWFV9SiHdoXv3SkCEbvrj7JwRXR30fq2+xwhv37L0G25zkqTbdYu021tXZneV3XA58MK3MgRoU6+/lhkcQM4iQ23vH1N7LvwgROaZWlrpNjWNxwSBZDwR+NVEehRnDDUIMV23jAanCmeIDJfxhLbMjqod09xHaRLBwz/obeWXP4rZW5xXzDDyHlCavGX0SIVVOJYGLHZG/YQr0o3qfmOp5pGr9wKKzGekXaoQFaLoMGB/UQ4Vzj2qPidgfUbwdIC9YyQ+NGZeD2EJv+o+UXMhBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584762; c=relaxed/relaxed;
	bh=VITkHk6wYCk30qmAXnWfpQxFdItqbxje0xl/TrLgm28=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZGXQBvnzhY4mQQuD9mbgcqXzPuiEXiFLVKFEuAfA8FlNakwAWTBl9ixXV0HfxSDNfSQsEV1miAVobbFGz0K4F4dXDwLzZ6ySMdDIl1jdEFdcsZOH83L0B1T7HykXyZQlZKWH/Dth8k6AKdTomtvqHYot7MmclTz6ZgUJn091UwhxaHprNHkv/BFy4arkE3eiI9Nb9KzBLYb9fO14ATJWvs1gymBd9yM5t3DF/sBE/m/lIRmbgwC8YJ6bks84lBxtGOPLA2+JXYdbbuyJp3bzd3qR4Se+FRPBseMW8rVUu8LgDMJjbicuVjZ4lafLlY5mlgwNaFzvQZx2UmpdBJhtNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AWtns4Ei; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3nxwizwykdm4cyu73w08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AWtns4Ei;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3nxwizwykdm4cyu73w08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVd1Gqbz3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:00 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7ea05b8ea21so1335568a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584759; x=1729189559; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VITkHk6wYCk30qmAXnWfpQxFdItqbxje0xl/TrLgm28=;
        b=AWtns4EicTkikaxr6+gVz8zclabAyS6ol7d1fA7GtadImTNe2k1NWS6Emlq1Y2SbZ5
         oehFuX0YTKKkjB9spEnwIPfTB49Ek3sJmfDTfp0KVKzJw3tJu2Ys6QbTn62P/cPVDNlu
         Mwb75y9c/z53YLjJaA2OiVFfAyGGw5ijZqaGtzXAFClS4ahJZvbTehC5R4KHnvO/FCZY
         LYgzc0YvEMLlPTlD9BRAZ2213+1qmLuqG9WzuDwHHFISrN5uSTtqJjiuUWHsHafYfuKP
         0kLOQquFClhvIS2Xn3Xw+zCuWISIZa/0xi7nta3nEQ+k/sq7cBkq91N7IepRrssyDJtj
         U+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584759; x=1729189559;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VITkHk6wYCk30qmAXnWfpQxFdItqbxje0xl/TrLgm28=;
        b=pDNjIbR60H74QIb5R6/NunFhgZ4Q3SgYON3NBDy/t5lEWgopuMXxpHgEnGcC+OcXuO
         QBENdKLMnjTgvbLn3rLNgdusbJhtY3AFwqWLIIxgshm0s7Bj8QJD32OZqENPZtm5KgNC
         tpa+UrnA67FcteA7Nj0V8eFx5ZHI1CSa3faMugpUUZQInGzESI6btjFKHZx3wpZfAp8L
         xExmCYBJOlOb2v7fnUTnPZ1cFXGGDHhysTj0iaqxlQwJ7w9hHktN7sbV40x5YLuuSXjk
         hsgzW1meS/rji+Pn3CGLlRFbrA5noYrEmXO29VrfgoKZvOv8Btai1dYiB0uOrlt4kesz
         OgIg==
X-Forwarded-Encrypted: i=1; AJvYcCUvz/Q8dG+jD+0/bRfE9Kd/f/2bI3XEQ4rNool6YUP0GHIDExohB4pU2VuRWeoSVcoRVP7oM5MF47yEivw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4i028y3EEame1e48yobJloyTw5V8hif1b0x6YlmjZ4VWPP6xS
	eiUdkh6qHX5Mu0w3GMxxlD/Ng8ECtKXx1ySVjLe6UwngcgGF7YNEKVmcGzCK0fSyhFIIYCo+PzW
	zCA==
X-Google-Smtp-Source: AGHT+IEekecUM0XVWoBmNjTczqp1a2/ixTMw1fOAmBrSm/Dp9XgHLEkyd54mJG+SlDPSB0szYk/zKOq5dxU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a65:678f:0:b0:7e9:f98c:e9f7 with SMTP id
 41be03b00d2f7-7ea5359ed14mr32a12.10.1728584759044; Thu, 10 Oct 2024 11:25:59
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:34 -0700
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
Message-ID: <20241010182427.1434605-33-seanjc@google.com>
Subject: [PATCH v13 32/85] KVM: nVMX: Mark vmcs12's APIC access page dirty
 when unmapping
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

Mark the APIC access page as dirty when unmapping it from KVM.  The fact
that the page _shouldn't_ be written doesn't guarantee the page _won't_ be
written.  And while the contents are likely irrelevant, the values _are_
visible to the guest, i.e. dropping writes would be visible to the guest
(though obviously highly unlikely to be problematic in practice).

Marking the map dirty will allow specifying the write vs. read-only when
*mapping* the memory, which in turn will allow creating read-only maps.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 81865db18e12..ff83b56fe2fa 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -318,12 +318,7 @@ static void nested_put_vmcs12_pages(struct kvm_vcpu *v=
cpu)
 {
 	struct vcpu_vmx *vmx =3D to_vmx(vcpu);
=20
-	/*
-	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
-	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
-	 * and if it is written, the contents are irrelevant.
-	 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, true);
 	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
 	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
 	vmx->nested.pi_desc =3D NULL;
--=20
2.47.0.rc1.288.g06298d1525-goog


