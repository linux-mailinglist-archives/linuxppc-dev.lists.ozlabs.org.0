Return-Path: <linuxppc-dev+bounces-2008-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB8A99900E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:27:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVH3Kyqz3byP;
	Fri, 11 Oct 2024 05:25:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584743;
	cv=none; b=GMpQQkTbKLbT6GYbGn4g5kTES4cex47vzTadFcuu3EDVXkrzLit9Q08JZkIcTXITj5L2/9vNza8TaMdXyoFz5B1kJamgv4g0NqAZ4GlaOu5zY9wirZrluMFD/0NccraTRCliyjbi/RNHZg12SZ5Tq8EhTLa2UHt0ZCYbjc4XQFu9eTghT3YoHafl6ygmGtfvDPOzFfzpRRtZvqN+UTtPybMgZbYSxyj3tMyIfrjocVHkVGzr+88hLUhrL+jfQJ5X0c4UpSurO4E2t0Jx1Dj2t+IrfJdHsVRuVSUZDbrf2Vv0HKFIQLild0kr/JjwVfd7p3Qqxj6TJOSfRRbVHEvcew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584743; c=relaxed/relaxed;
	bh=UxQVf2h1B1ZgTBX9bfQB+O4u0WEdBy2E8BNaXtNQtEc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BSgQ5SPDZ4TJr9DGOcHSBksJ4dpnBco4j3wUO3KUTXirv8WiqzMwBkgkkSF6qy/RtIzZRSlU5aLEf9CxdIga4M9ZUDvF9EWRfPscdwTg7+DZmZ4qi1Q8ayRikur/lLPVmMjKeQ+BunuL2MkfPX4GUO7A03HKDwgIEqQZZXAot09A+tdOMPwDg+Cj9rcCJgswspQWkiNkk0WPo/oBx/648ro/TV7lkJGgVVjViY6iVRQqYSCuhsh/NacntnQaqfkZYYtwei3DRY60uAzLjC09QpW9bEPErqN6RylsZbD2lMI1G0iXLHbNaFFGYxUV9sxMjGLg/0cTs2SIgqWSL2KNow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Wi9eigQa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3jbwizwykdlstfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Wi9eigQa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3jbwizwykdlstfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVG43j5z3blc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:42 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-20c8a637b77so13049515ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584741; x=1729189541; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxQVf2h1B1ZgTBX9bfQB+O4u0WEdBy2E8BNaXtNQtEc=;
        b=Wi9eigQa9ohQYNdO9m6NWpGUkgcl1sfwW/COHB6w80FnLx8c5iz4nKlfp4l7AfY2Y2
         PirLdUKx+FjEL/io4GHkoOiGz7ZTh23OrJb2l6CEkfsg+gpECtESxslld0k9RFtw+07x
         reqwtJ6tO78Y653JW1pM92kTA+0VIoXeRp+Ghe49WHStVs4ET3GLcshujmo4iO0LjQ9a
         N9te32LcBE8qDrVITu4LnOuo5YxGLTP3KSP4B0yXhkW69ApMA5/FsnOkLLaPkJ8NXIkP
         omoF758nkDIVoQQev9yeFbxQ6w4iHk+YwqYSApRJDuEKFA41szzMEgkvFDOT1Bwpbz8j
         hn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584741; x=1729189541;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UxQVf2h1B1ZgTBX9bfQB+O4u0WEdBy2E8BNaXtNQtEc=;
        b=nMuqY5vctDqbPbfm59k7jadsEqr+ZqaN1rFGvQnA9cmrphAoDnNCI/GG1rzCuKHNnw
         3r761uHwc+ZO33NH/DK+EOE6vzLgWCBRB821DQi4XdQN/3TeCGQCyVemMVFtP2t3bd+0
         1QIFYJxrc3QwJxhRQMg8ctj8LD+LCdWb44dRndtpBFfky31EMEmeW48KFybPW8Y/d3M/
         sa7lO3CPn8cTemyN3e6PJb2CKiRaxx1gHEUX4f+hou9t8+eVskHmdvyACDO/YHe7QVYX
         R6nQfuXp6PZBxTowIA2fUf3nnvSkqoDsyamKaxUSMseRqmUsDyLN+bFg1smtH0yBuqi4
         ZgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWgm+EKJpb2iD45q/lYTdh7OmU4fW8P/Z8AvESzcEBdP7ou2m0Og5HYgG+rrtQbcsxxAmp/yL6zH4cy5E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxOO+RCBTjkpQ1wcaxXtClV5PDYySsvhp/qOly1hnT6f9KLE/fG
	tYW5pTtLiV8pbgSJ8YdobDb6U5BwuogxfJVMw5QG9ztqpwPLsh+aCp/c7SQm/9EEs/wBYTUw2Su
	Y0w==
X-Google-Smtp-Source: AGHT+IFSsaj7YGs0xXvL7KvHpo4OHZS23TfW901WnGn1dNBw4UEq8HUBbyPz7tDSJuBwPv672jv+MkN6+4M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:903:2349:b0:20b:9365:e6e4 with SMTP id
 d9443c01a7336-20c63782bdcmr1094885ad.9.1728584740809; Thu, 10 Oct 2024
 11:25:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:25 -0700
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
Message-ID: <20241010182427.1434605-24-seanjc@google.com>
Subject: [PATCH v13 23/85] KVM: nVMX: Rely on kvm_vcpu_unmap() to track
 validity of eVMCS mapping
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

Remove the explicit evmptr12 validity check when deciding whether or not
to unmap the eVMCS pointer, and instead rely on kvm_vcpu_unmap() to play
nice with a NULL map->hva, i.e. to do nothing if the map is invalid.

Note, vmx->nested.hv_evmcs_map is zero-allocated along with the rest of
vcpu_vmx, i.e. the map starts out invalid/NULL.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index a8e7bc04d9bf..e94a25373a59 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -231,11 +231,8 @@ static inline void nested_release_evmcs(struct kvm_vcp=
u *vcpu)
 	struct kvm_vcpu_hv *hv_vcpu =3D to_hv_vcpu(vcpu);
 	struct vcpu_vmx *vmx =3D to_vmx(vcpu);
=20
-	if (nested_vmx_is_evmptr12_valid(vmx)) {
-		kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map, true);
-		vmx->nested.hv_evmcs =3D NULL;
-	}
-
+	kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map, true);
+	vmx->nested.hv_evmcs =3D NULL;
 	vmx->nested.hv_evmcs_vmptr =3D EVMPTR_INVALID;
=20
 	if (hv_vcpu) {
--=20
2.47.0.rc1.288.g06298d1525-goog


