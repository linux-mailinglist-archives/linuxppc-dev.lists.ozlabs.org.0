Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 275DC63E537
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:16:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMw810LTBz30hw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:16:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Qu2Gj2AQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3vekhywykdmq2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Qu2Gj2AQ;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMvzz2t1Rz3bb1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:09:51 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id r17-20020a17090aa09100b0021903e75f14so152940pjp.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=g1stMgF+unVz+1wniuTG4sBb8H6V2BLTtzNNraJ+L2g=;
        b=Qu2Gj2AQMSdn5ynZ5uRxUGFqbeHyl2Ed5IXeJ2cS9b8RyxUmxP+UPpwD4AXe0Ud2wQ
         GLE5fpqUn5yzNfMmkf1QqZp6YlOWxyIHZvzY2PTHyliCph5U92Ri7VRil5QNW2hbhlro
         eqLV3fzPciK364AgPpAWure/pils1YFI032lNHB5vYzqLYNGO/HTaCFu4SnHfGbx0IJL
         YzVxc9OdZl6JuUto8jah8ZZUeY5Nlgmu8NeURLW2FfXGR4hkpIETaC3DDgh3Y+VWw9aT
         wnj+XTBDiyARsefNZ1R+h94oYnfXDMDFEaIxFxgvi52xPOyDG50iBdiNI6MjV0enlZkj
         ltag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1stMgF+unVz+1wniuTG4sBb8H6V2BLTtzNNraJ+L2g=;
        b=0zaa9cU5AbA58gC/YMwLbw8UvZdmDGebqlrkvnop5flOJn7LOy3rhEwrTKhC6v712l
         iq4K/s9E0gBJbLfErlU4vl/0Ar3xG7eHtvfBXaXdAJBxu/qr6cyiWeHiz4isgm9fp8jq
         kZGEivXdnN2paUvVucEV7pSjuRMhfrmw5Eh1VY1LcRy+aVcKltnvniaHfns8vfX8Md/7
         RitmkTyHiRzpDOvjIQaSMpq2Huq7f5/toWipAVZWmRzoOAfsuefcU1N1qDubio2Rrrh5
         +cM66aY3isO/UnaO02cuQRRWNf20j+21CQfW/E0IyqTcL2LjCP/4rO8xW3nrnDB/qBY7
         lDMQ==
X-Gm-Message-State: ANoB5pn9iwEzhlyOmq+hLIaoHdOBxQOopqK6z+dggQbrhvUM8MvG3X9n
	KlJVqQPhRQpePpWW0A1aBFOEdJJ2WTM=
X-Google-Smtp-Source: AA0mqf66P6cZGe+dew2XFgeia1skilH4V8u9knhT3C8CLrninF2nDNQmOIJQuI+E9fZev+1MNEWaGc+MIJs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:9a47:b0:189:acf9:87af with SMTP id
 x7-20020a1709029a4700b00189acf987afmr3514511plv.160.1669849789646; Wed, 30
 Nov 2022 15:09:49 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:51 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-8-seanjc@google.com>
Subject: [PATCH v2 07/50] KVM: x86: Do timer initialization after XCR0 configuration
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move kvm_arch_init()'s call to kvm_timer_init() down a few lines below
the XCR0 configuration code.  A future patch will move hardware setup
into kvm_arch_init() and slot in vendor hardware setup before the call
to kvm_timer_init() so that timer initialization (among other stuff)
doesn't need to be unwound if vendor setup fails.  XCR0 setup on the
other hand needs to happen before vendor hardware setup.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f18f579ebde8..a873618564cd 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9326,13 +9326,13 @@ int kvm_arch_init(void *opaque)
 	if (r)
 		goto out_free_percpu;
 
-	kvm_timer_init();
-
 	if (boot_cpu_has(X86_FEATURE_XSAVE)) {
 		host_xcr0 = xgetbv(XCR_XFEATURE_ENABLED_MASK);
 		kvm_caps.supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
 	}
 
+	kvm_timer_init();
+
 	if (pi_inject_timer == -1)
 		pi_inject_timer = housekeeping_enabled(HK_TYPE_TIMER);
 #ifdef CONFIG_X86_64
-- 
2.38.1.584.g0f3c55d4c2-goog

