Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC6E93DB41
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 01:54:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Jqqy+RRy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4N5703Tz3d9V
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 09:53:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Jqqy+RRy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3xzakzgykdaiugcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Lg0W5rz3cBH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:52:42 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc5e61f0bbso13355115ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037960; x=1722642760; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=B44llYCZd4EZ9BiHApjJ5QQ8CK6GbkfpTxw4rYmbmqk=;
        b=Jqqy+RRy5sb/EjEI5yx+ZDabOJh+LI5/qZbizsQmPsfMCofkE3idf5mLmporjqDUwM
         CdjLKnEn/fRcBTjmD7R6DpnYdwto0zvbEkIgPAYl4x+SLynIPjgunXMAKS9Xd8eFsgJ+
         J7DUnB34uCdsmqL1EriVuloGpxF550ATnXxGJx2mw5sxVdaif1EYab/jQE7UzcpZBZxS
         dndEx5IA6KUlPoJnQvh0LEpuTt66QpQUpVut3XxCHWT4F+4c3dyZc7Vt4pA0AYHBFAGm
         biacwtcglw7oQidxmTkNy6Rpp0yHnA4mITtpTNJlQtNo4MTl2SD0lYQtvIugJp0WLb+A
         fB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037960; x=1722642760;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B44llYCZd4EZ9BiHApjJ5QQ8CK6GbkfpTxw4rYmbmqk=;
        b=NgKu5TIXB9xL1flibhVSKOgOSthrAcw8/cOYO8U9aaUMHlaswjqD1kBsbvx3SEUp0i
         PytOxHcqlVkXzUR7jDh1AF+0FJ1ljf6xjn843Yw19y2aYyPlcKBXqbUMbz81McqSTGn9
         nYquptVpfjfWJP3XdYLJd5KzTqRybebKfovGgYpEskidBee7/fGxFC0Vr5pD+XeKrTV3
         1kHkrRHQXC+glnf2Al7WP0jiP7Rjnp8yb27Y3u814PrLn58c3Vk+k0QBQxTvkuW3SZ+C
         K55g88oVZGAu9PkxEE3hqQKv+hKUMiESsDqFc+u+QIUWhhh2phIXihhzsgeHy8uId5+a
         6s+w==
X-Forwarded-Encrypted: i=1; AJvYcCWbpMf6dT3bYb7rJqyUi7R72wY9WqjUmPnJAvpvfH2s5ENf1YreJdfOneJ/ALiFlD37Jdx3nLzUYvPZkjife2ZF+qC8zmYirozBAfjwHA==
X-Gm-Message-State: AOJu0YxdF1PbF+YP1gX27SuoJZPBiyXlwtWfTpBzF+QaYyOTVJoOOLyv
	t7rN8HPMPMVB9n1+2JKA57BHhnCMHI9NYJr1WCL/W9lzIboZmfVQsd4aEr3om/PREAejUtRPm4A
	I8w==
X-Google-Smtp-Source: AGHT+IEjG0ZQEVlDvyCmqtjyibvaIBPxkBHQDdDjj94pZYYC/xb/lJ2iSbTktb4rvu/gOGNYLlpIc1q2Vcw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2b0e:b0:1fd:7097:af5c with SMTP id
 d9443c01a7336-1ff048d8505mr410065ad.11.1722037959655; Fri, 26 Jul 2024
 16:52:39 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:10 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-2-seanjc@google.com>
Subject: [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if copying
 MTE tags hits ZONE_DEVICE
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Put the page reference acquired by gfn_to_pfn_prot() if
kvm_vm_ioctl_mte_copy_tags() runs into ZONE_DEVICE memory.  KVM's less-
than-stellar heuristics for dealing with pfn-mapped memory means that KVM
can get a page reference to ZONE_DEVICE memory.

Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/guest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 11098eb7eb44..e1f0ff08836a 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1059,6 +1059,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 		page = pfn_to_online_page(pfn);
 		if (!page) {
 			/* Reject ZONE_DEVICE memory */
+			kvm_release_pfn_clean(pfn);
 			ret = -EFAULT;
 			goto out;
 		}
-- 
2.46.0.rc1.232.g9752f9e123-goog

