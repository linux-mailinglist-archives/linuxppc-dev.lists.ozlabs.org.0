Return-Path: <linuxppc-dev+bounces-9271-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3876AD4745
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 02:11:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH5fS0pLBz2yFJ;
	Wed, 11 Jun 2025 10:10:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749600656;
	cv=none; b=Yb0L1YOqNyjCkRcDslL7EVho9Xm232VqblBgduroDnFeCFbxoIpqvo0zsLi4GxqIUWRkL0RUifXEhJ593HvnI2AuGgh/RF/yWVcViFbA6RXeEx2uQvGniWWZgkNKSRMmOCCqHyR6Rg0R46FQ96Rtle00THC62QrAS0XylAGveY2/YTegm2uP+Y1bMw9xwAoVJx55sEVMa5aNCnC7rAAnPxxDRO3PHHk/NYUYX1dGjhMtUBb6AV8fssrI37MRWZGOmztWD2ygt6yCGSnUv5iQGoBtD0lZDTKtl1AXtRjR2nFRqTGORaB3nHHthboAqsijANfDUkO0Im8hudQJLhDhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749600656; c=relaxed/relaxed;
	bh=hBjwKNBikKgFeXvQ1q5Ivd9CecF6t6Q9MZtjOeYYky8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UojpGY0Z9zeXXi8mGWFS8/D1pGYOnnRqMtxQKr2ew/qwQeDHP+iVoC2zgj8ftvuN89l8q4yyf88IXSTylwq11kxz5/h9Rl6Qmaxl5Oi/AdXcBxom10/KR7+WTqRIH9GI8DvmwxJHjTm3hTZL68cwL3uBQXsvxEXbeam8D+JeKl0Xa6MKfWSAx/4L+JHUNXsz4AunTbJt34cEwC70y7bdByYZNStjHWIdqpczuIw/rwpQh+4r2rfgp8BpEIfgUTEKyO0v0LhC7s9FuELC49yJzc54DgfqkGWQTe1mdL5f8/CxEMmYuU91CBgJBC/PCCr6piT4MC9pfyc+kQt+DwY4QA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Y2x/rHzt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3jcliaaykdiw8uq3zsw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Y2x/rHzt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3jcliaaykdiw8uq3zsw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH5fR3rcyz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 10:10:55 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311b6d25163so5171469a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 17:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600654; x=1750205454; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hBjwKNBikKgFeXvQ1q5Ivd9CecF6t6Q9MZtjOeYYky8=;
        b=Y2x/rHztt9m/iArrn0+K2PN8zTZhKHMvqJ64kb2bh3c85e2LEiyA//WOO1ladBh3Ne
         foRi4bX/65y9xGUZ+84IotpVW9MD3ij39QerG0B1dsZggzXewT/ATogxTVlm9pBbHfZQ
         GvjUwvwnc0NWpgfLpyMiQqzGNx97fxWN0k5tmHW4vTWNulvg7F+rmhPPhi7KSO92UhuC
         F8jDUJywGTrEsQSEdxRRZIsB7swNA7LK8QMx1eKvWH6trhZGFjZ+D2TkID5s+mTiqzGp
         a9hJevwmb6mPwlSYRogrN2elewZ+JXE+EaXE47OmGUGqNr18EAzzb6AqbLaheV1ztZ3q
         Cemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600654; x=1750205454;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBjwKNBikKgFeXvQ1q5Ivd9CecF6t6Q9MZtjOeYYky8=;
        b=fiovDgB9/QVOUzX+M06+KqpU+PMg1IJx50j3+gmhtrVTgUHcQ3SQWJNiTWRbxzbTIH
         QlGoZUhizUOoOQzNtbEYbLs1uV11UdAii2kp2P9nBXPrYpP8ccHedwNyVQqqMQeqyvfm
         Ci7B2bvRYWRM1PCDOidbfvCj9LIT1cka6Zsa4uzuok/81yUT1yJwvAA0NgedAbLYAIFr
         A7vP220Iup1mhsBwY40O9M8+uKauembf/vKg5uGof5zcraA7dPFUltz0wiYE5tZle1Jx
         OgKM38WlYH/bnYL5QWTuZxM07PuRvzoAwhjz6+Y2pOykJs0mQiMio/taVfVFr7esauY8
         /P9w==
X-Forwarded-Encrypted: i=1; AJvYcCXzP3kJQ6hJ6HgNEf4N9wXeIh35XMc6njRRlCefY3IFdjeRtuTTIIir42tSIr00hIGhbjsgGcQfEtmTvZ0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlTgK1brCCQW2Dpi65FUVRTQ5cgPIMxWEzcUR0P1Vi6S8UyVM7
	OWxpur+Y9GJhhFD1CzJKMNRFO/YL3D7445uxWeWSfy3AphnVEfTZuVui1ACqkQFzkHb+alU3Eio
	V2reEug==
X-Google-Smtp-Source: AGHT+IED4B4s7Ytoor8mnhgXxSS0ZKiCE28nENLHgtxurTVkQjPNLlNungxBpASYaT+z3Y4fvBlDrrKUUDc=
X-Received: from pjh3.prod.google.com ([2002:a17:90b:3f83:b0:2fc:2c9c:880])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cc4:b0:312:26d9:d5b2
 with SMTP id 98e67ed59e1d1-313b1d9c310mr956755a91.0.1749600653718; Tue, 10
 Jun 2025 17:10:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 17:10:39 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-6-seanjc@google.com>
Subject: [PATCH 5/8] KVM: MIPS: Stop adding virt/kvm to the arch include path
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Don't add virt/kvm to KVM MIPS' include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that MIPS *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a different
architecture's Makefile when MIPS support was first added.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 805aeea2166e..96a7cd21b140 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -4,7 +4,7 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y += -Ivirt/kvm -Iarch/mips/kvm
+ccflags-y += -Iarch/mips/kvm
 
 kvm-$(CONFIG_CPU_HAS_MSA) += msa.o
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


