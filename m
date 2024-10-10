Return-Path: <linuxppc-dev+bounces-2038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB599904D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:30:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWW6TvMz3cMV;
	Fri, 11 Oct 2024 05:26:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584807;
	cv=none; b=P6BwSHtdA7ygENHwdq1YNeO2A0iiklZBhevVZfZjNwXi8IKtSuvdD5/P1LVX+QPMtl/c8h2WsrTl2aoVz+XO/MBqaL5OtgKuXk8bBh0WdngLcYobWYJV/qkJ6EGLY2rwFUv5LNoBp+c1lMjBONdL6E5FCERy+7YcIzviyWlHot3LP1M9yhu2oVYz54RFt3NQ1l/9IGru0+okgDSfSCdt9udQ2Mp6CDb0l4MM0gPWTSzIWYrIZ+tWfFh3yMkjkBChryVchXdJ/8WPqpV3qzkDPhiW+FTr2Z1UDy16ljVz0QpohXclNXqePfZiJUeXa0vK2J48pbSvh5/rnCL1h+5lCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584807; c=relaxed/relaxed;
	bh=RAEBOjiR86B8MKio5svj+gL/GJb0VtWq7ImNxArS0H8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RgMPCmRrVH9R/S4QghrghVuKhmWJ2PGnsOjv2kzUYG9dxXg2qHblIGiPM9QNnValcF2J0E7F92Gc5wdIDHeWIVbrk5HV0tHktNDFUompy0Opp4h1xwKV5MVxUqTvHXdLrb/zuNrYQvzroiaH2lLk0Xe1FJudnAD13jxe7AN5WowjsRalKdpBpXqtQPIPp9HCepkPhBtEopIsaDdvXAtbWaXxKOlHSqkB7VcyeEy7+7XC0Uz2+vV4y8Jp90mQkxIojehWTpdHiFaO/myJ5a84Fu0BIzXl8O4e7frkSSxrBcB76LwNx1TIRG9+B7YAtJ4KneLX/a6krVLsHiAGgL4wFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=E4vhdseY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3zrwizwykdpwwierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=E4vhdseY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3zrwizwykdpwwierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWW0CGCz3cMQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:47 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7e6af43d0c5so1109095a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584805; x=1729189605; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RAEBOjiR86B8MKio5svj+gL/GJb0VtWq7ImNxArS0H8=;
        b=E4vhdseYW2yPHyV+ulIucdQxDK97XMwX5FZjFFdx+4RlHGXQvlr5GLJhQElcfa1qQ9
         KBLmrwYrwDGkCgw5svrnhRQdgpx9zOwaypS90fc4pmWjz5QV0uKM5qtHUrsWOHHeaV/G
         w9Rpw4PqJ5WetWdMpqc9YKDMxnE6a5uiXATtrcb83lPxi/Xt+hROWo8cMwR7yf1ibfM4
         f9N6f5js6350DLu48LDornS/liugVXuFXr6UMdzZ/dXccNME9riuq8sQRWmCs72Klelz
         /v4R2nVLxbrJy+kEPiFHW7WRD0WWpOOQdb1vbSMI6WQ6eCKlLzvL5DUsTGFLl0FLbrFr
         ifVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584805; x=1729189605;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAEBOjiR86B8MKio5svj+gL/GJb0VtWq7ImNxArS0H8=;
        b=B5MNZn7wPfED4EXbk8Ncm6nc3IPSJ/mfqyIkO2uo5jOUwNXlZm7GhyzaTN509xEfh8
         1t2J0cijuN9oRfj5kUxfoRUU9g5C/pXhOd8/euTuRaeF5G9HticyE8cOu208nkqAdyVb
         77HduvKcGXA3oXBSbQIjz5fBkcx1RRtrC5VyK9bzAViUo/uQPh0LP5qBGOewiu/v8AQc
         l+0j70qgGj8njN42HTZZPOJngAcLD1UqqByKiDqd0m/bZ86Y53vf2tLRfTxAYAFdA2ce
         LIoGLf7NcdrYOd9lgy9xr9A7IaidB55MsmoPD06I8CLc3BVabsuKQ99+HXs1qwrkkpEH
         Gvpw==
X-Forwarded-Encrypted: i=1; AJvYcCWE2iOKQkpW4eNNZn37Kcb807gT/h5ldelRmI0JRzr25Pem/4KAIiD9g65TYM4aBZW4Hdu5rWRcZ5v51Tw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMq1scmd9Ajl8xYO4EJL2y0XR+W0NneekQog79odKgoeWNsAnF
	f+/19mOzEbZNmnR+HKBdcvyCB07WMLkM3tW4AcIVwLu2WlxCt/ImfOv1dPRYQtvymt7IcNdciWK
	EQg==
X-Google-Smtp-Source: AGHT+IH3g+or1uGKI8zaqA7g6VjAId1uToioip8sNGZo/KyXggeZoODfUOK1q5z450FXHERnWYgwR7EwX2I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:5107:b0:2e2:ca3e:10fe with SMTP id
 98e67ed59e1d1-2e2f0f88a54mr24a91.8.1728584805241; Thu, 10 Oct 2024 11:26:45
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:55 -0700
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
Message-ID: <20241010182427.1434605-54-seanjc@google.com>
Subject: [PATCH v13 53/85] KVM: PPC: e500: Mark "struct page" pfn accessed
 before dropping mmu_lock
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that shadow_map() can convert to kvm_release_faultin_page() without
tripping its lockdep assertion on mmu_lock being held.  Marking pages
accessed outside of mmu_lock is ok (not great, but safe), but marking
pages _dirty_ outside of mmu_lock can make filesystems unhappy.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 5c2adfd19e12..334dd96f8081 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -498,11 +498,9 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	kvmppc_mmu_flush_icache(pfn);
 
 out:
-	spin_unlock(&kvm->mmu_lock);
-
 	/* Drop refcount on page, so that mmu notifiers can clear it */
 	kvm_release_pfn_clean(pfn);
-
+	spin_unlock(&kvm->mmu_lock);
 	return ret;
 }
 
-- 
2.47.0.rc1.288.g06298d1525-goog


