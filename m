Return-Path: <linuxppc-dev+bounces-9273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF74BAD4748
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 02:11:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH5fW31fpz30T3;
	Wed, 11 Jun 2025 10:10:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749600659;
	cv=none; b=NIgfVA+fk+0S6ssSZJJkWGlRuQLjR2VYkk5IMGm+FZPXJMZr7qWcXOqLqC/Fu1Ni6CpmdlGogVznGzrBC03KidaPtRCoG5+OYx1hf6S8fAd1tnmKEqZlEzCq85FqgFEXybZXS4TqLrNqu5fqeG/BLcbP91HuEnvu2bHWlLRiftgJt44LxraHizxB/BohMoE2gCbwbKQ8jb8AAAZ2uDXydxKiP8pq0iqs/aVFEZJCJtAhMgLoS4IdpWEKUuYqIxBzcyh8oa2FuCUJ5m4uAXGNlyqFpe6/FnILXowHFcuT2IwEz/TBSYVz/JqS2+9C6mosiqXLDJW8rdIGJpBhrXyKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749600659; c=relaxed/relaxed;
	bh=VlZgeHA644QawbjAzxLvevk+0CPgkFNL80WvPP4oWa8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L6WDm1h3PbCI7W5e9UZ8jN4lZntNU6UvNui12MJvAeFs0iLVgDI2rweaZqGZRxrGmvoKNc1dMRXVWOspABkUDDeW1jzysPNrONWhAaRZ0wuGQnqPRRAPh/a82N8bY5pPGhN/45IfE3ECXt1hafoGXrEwYIJ0cH0XwPLmxA+OORXcaSWv84v/xr6cCfxplGxvmqcBwj+otrmYmYlBjRGaDUm/jESOhJvSAylDipZaGUYrNIy+d9UTVFQ5OZTI23OBhSgsybDn84p7LSs1A/+R4p3MYILKw4BH4fPq1FQT8vJEf2x1BNgbnm3tDmUbZVJp5cqW8dOvMavVirQyyPhukg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OapWlLcj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3kcliaaykdjacyu73w08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OapWlLcj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3kcliaaykdjacyu73w08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH5fV5X1xz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 10:10:58 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b2f5a5da5efso1850844a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 17:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600657; x=1750205457; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VlZgeHA644QawbjAzxLvevk+0CPgkFNL80WvPP4oWa8=;
        b=OapWlLcjvDrc1e/C1jIwLORrBBwMSt9kVqXaFO9yZgv8HADr3A6XUKXSEORR9rR5F1
         tH7dP0BpGKaB1Q9Jm1ynenQqrt3svCaQQEZGHmxLPwP8hHwC6ZGyl31UrAThXxlXtMvo
         VutWFjWIbj+c0KZvgcLPYkoXUeC/bv8PtYphsQafCkrU4NiWeMwV/CzO3hKd6XHuoyd8
         5wcmuSb+AgYdZwspxRQVMEIFfAb7V/q8z7YDhwxoAW8kicERpxKmOF0oy3h22q+hyPoc
         NbFi6O80aR6exMJUQYprqMHfs2MKmyEXxGZCxXqWVqvVjOKOlPqg7XLqlxyJfjVCAv78
         yvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600657; x=1750205457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlZgeHA644QawbjAzxLvevk+0CPgkFNL80WvPP4oWa8=;
        b=CTxOjTj/mDnmisJtJlKLy3C9xrG8WIcb5h3Dda1Q2YVQDj++iSJMrdBh3U+4qz5iWS
         PzlMNbgWxtCObfcoHHJw2eXfJ5gV+8+KroUdGUWM6i1fDLLW2D03aSLzYcgz09HcGF/z
         SXI4uq6+nMx6a4czqR23e3lgs2fkn4I7JL4XMQzaeMDOM7tGagm4AnsaLhg4stM4hqG/
         SO4tDaYkTbzp+gpJz7ntLw9g6MqWXaFtXPzzVyjzDMzTz2YJyJ2ysJ64fLQVp8VMVmmw
         2fc3YFVbx7+wlIrF1MYSE9g05n/0FGvVQvuDqccMRT9D/X5FORCe9EYCCSjRCr/7Gnk5
         5o+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFdM6Z4siDnnNGf9He59MkzGRr9omTF9C5Og1eg5znthPxtNNIPguSxKGR/hZtTqfFCy6CB34iLq6huoM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZlPshA1yQAH/wjkceVbbY0MY+L7VPQlUiPSYtv8FyfVGTkSvY
	x6qhy6Co7uTwbVEHk8zUW0sJtOSFT5auCmPIRk4cQrMALPGYoU+dUA3dlrUzfsd8ZmfSsXwtKMd
	ZR+dd/A==
X-Google-Smtp-Source: AGHT+IEo+A1iKKp/d15/c3Y8CK62vwTvYQUmq5gUOhKzuXVKftWt1+9sRfxp1GZ6dnQl+d5j2tHzGoYEsqQ=
X-Received: from pjboh5.prod.google.com ([2002:a17:90b:3a45:b0:2fb:fa85:1678])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2643:b0:312:29e:9ec9
 with SMTP id 98e67ed59e1d1-313af1dd043mr2232849a91.24.1749600657225; Tue, 10
 Jun 2025 17:10:57 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 17:10:41 -0700
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
Message-ID: <20250611001042.170501-8-seanjc@google.com>
Subject: [PATCH 7/8] KVM: s390: Stop adding virt/kvm to the arch include path
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

Don't add virt/kvm to KVM s390's include path, the headers in virt/kvm are
intended to be used only by other code in virt/kvm, i.e. are "private" to
the core KVM code.  It's not clear that s390 *ever* included a header from
virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a x86's
Makefile when s390 support was first added.

The only headers in virt/kvm at the time were the x86 specific ioapic.h,
and iodev.h, neither of which shows up as an #include in the diff for the
commit range 37817f2982d0f..e976a2b997fc4.

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
index 9a723c48b05a..b742e08c036b 100644
--- a/arch/s390/kvm/Makefile
+++ b/arch/s390/kvm/Makefile
@@ -5,7 +5,7 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y := -Ivirt/kvm -Iarch/s390/kvm
+ccflags-y := -Iarch/s390/kvm
 
 kvm-y += kvm-s390.o intercept.o interrupt.o priv.o sigp.o
 kvm-y += diag.o gaccess.o guestdbg.o vsie.o pv.o gmap-vsie.o
-- 
2.50.0.rc0.642.g800a2b2222-goog


