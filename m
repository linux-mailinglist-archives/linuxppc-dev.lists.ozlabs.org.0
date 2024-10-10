Return-Path: <linuxppc-dev+bounces-2058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17693999077
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:32:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXL6zMhz3cT0;
	Fri, 11 Oct 2024 05:27:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584850;
	cv=none; b=dH8ylQzS4398QQ0CDJCuFaFPb9FOlU1tAo2gFQZosHf0tedfhlUDEVNs0UUF+rYNIDTGMoP9MOXZNTZwSgqBHAqDv5zQ3oRMR4fLGH/WCz9ovdwkUxd6aqkB//lWDVZBsOgJXYfZe3qpQ66spMbGku0G6jT5dBWHoq3VDBv+zZ5hZ3OhvAxsh6dHDI5MrJqdqHgfispXyTURIdMxE2k4HId/Oi0IyKwEHPaP3ogBiqYt8GgORe/HjNBsoDGiDkLGyh86UK1aQtHzUM/RDYq73quwQ+vypLc75dN6u6j0zUa+7P+/1Q3KvA6s2bjlxLNdSYaDs2P5+6FTLUNpaDScfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584850; c=relaxed/relaxed;
	bh=t4DEWxyHdS8FH8bmPlxV35CavnLWtw4MDWneo+GIfaw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fnUbGcbJGVrbBgNGUis8eik+7CcMmgafNTyrhJfQ6pCyjgU9koFbWuZzSFVq4UHqJ47As/CzITD4CgDbTAe0Yo+2Gl5jF3h5POE0wOI2wEYuCQbUGckxMOrX2bc3fiKMMSQUZVunGVEl5PqGMAsEU5pcpik6GmLz7jRuE+p3/wEwzrG3hz1WiPeLr5wsezM6J85CrRuQpiWjGrOT73sNZ9K3GgGuBoL3CZCCH/4Gx+sTEaM1yWWcmD438Q5WgBoDQZORIYwbHMT/zt1QjlJRk8L1R0fbhHsQC8vkGbWjvkhuDGjmg1Z/nYlBlUb5S6x9El4WKS3HHNT5NfCtuKJFMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kGsgBVDH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3jhwizwykdccvhdqmfjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kGsgBVDH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3jhwizwykdccvhdqmfjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXL0VMyz3cSv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:29 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7e9f9a927a5so1044665a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584848; x=1729189648; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=t4DEWxyHdS8FH8bmPlxV35CavnLWtw4MDWneo+GIfaw=;
        b=kGsgBVDHch/8PYpEaPcGl90fM2nvF3opZsaG/RkzHD/uTu72PtN+iHx5ZFl7MqwdN3
         0ww9WznPjOXV6+rMKKWbR0xDwnn1MuMtFoemAJGbsXQWtqaKy9K2TzJAfqFMQXKGo1HB
         eDPckaQQQP8O8yNWuYQQHXdVgvFcAMWVjcQWL5tZZUXa1WexyfJ77eL4GwE5Sydf+y4K
         4FhK8Z4LSJNxdkvnjeW50y7Rl2DnzGUe3aJNLjdqgj0qiwH641y57yFUORL2zy243mIh
         RW5+SSuKCCNEZPtCJuE//Ce9/cg9XI2+AM+WyXrNApRLbfN5mT6FhVpbIizrINaM8pv/
         4veQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584848; x=1729189648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4DEWxyHdS8FH8bmPlxV35CavnLWtw4MDWneo+GIfaw=;
        b=qJjEnDg3bJt3bSHiCob401WXXmmj4UvZk96593PhvpEI+eY5ezoiQmuY1uH3ZrSqJK
         X9YHfX+rcYEjrHKSL4UeySxvy/bKl/VNHD/ZMBm1s2txMMqJFwiWcmO2IlgKhHyXtS+e
         qaraNX3W3WmtfhQARXPC3vwPtx5H0BaG6f/8Lk0uweXFOBWw9Ox6WJySjafiJAqaqAFC
         5H/puEICcWlhyEZT8irmL9mUaakYhUKK+/LYA4uJnaUlssEbnV3LYA06mrwNGh4ttNlz
         +mxo9+AE+1SgT1Y5yGI6M5Q7F5BkLwmisf5QEiaUoVawlyWo9MrsyFY/2hTzqGr1voFc
         G5kA==
X-Forwarded-Encrypted: i=1; AJvYcCW+7FzTEWSJnV2RFf6BRUhiZIcNWk2530ZnpUQ+9Y9LRTkEs9uuUYB4sFogxH+Fm2nGzE1BiRFn7YDsZNA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw22YjOFos45EJnzFMClRgrf/Dp1U22Xws3t3N/xY4Zu3k1GXLa
	y1DcJtZijzqThOrRdU3qF4c/fjT8KFAhafLfM+skJTn6erl2b8xuHFvgBw3I6wG6Wh23SusVsUN
	ACg==
X-Google-Smtp-Source: AGHT+IHU1NaHt28BJAfE9+Eihx21gIRaHWD3wJUzNDiwOfeaS4l1n7K6hdxyKTp49hAFCJqVbhS/fDDFwRQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:2545:0:b0:7e6:b4dd:fc0d with SMTP id
 41be03b00d2f7-7ea535b0baemr20a12.7.1728584846518; Thu, 10 Oct 2024 11:27:26
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:15 -0700
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
Message-ID: <20241010182427.1434605-74-seanjc@google.com>
Subject: [PATCH v13 73/85] KVM: PPC: Remove extra get_page() to fix page
 refcount leak
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

Don't manually do get_page() when patching dcbz, as gfn_to_page() gifts
the caller a reference.  I.e. doing get_page() will leak the page due to
not putting all references.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_pr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index d7721297b9b6..cd7ab6d85090 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -652,7 +652,6 @@ static void kvmppc_patch_dcbz(struct kvm_vcpu *vcpu, struct kvmppc_pte *pte)
 	hpage_offset &= ~0xFFFULL;
 	hpage_offset /= 4;
 
-	get_page(hpage);
 	page = kmap_atomic(hpage);
 
 	/* patch dcbz into reserved instruction, so we trap */
-- 
2.47.0.rc1.288.g06298d1525-goog


