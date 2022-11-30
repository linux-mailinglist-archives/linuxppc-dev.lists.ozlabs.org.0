Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 070D763E55A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:20:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwD96QRkz3fF2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:20:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JGKTwFHT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3xokhywykdms9vr40tx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JGKTwFHT;
	dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw064w4Xz3bb1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:09:58 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id s16-20020a632c10000000b0047084b16f23so91447pgs.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uhI8yDhdR7lIAaqvku/gdFE7HWy6VU8JNAGQp8QsO6I=;
        b=JGKTwFHTr3zFyFeRyDhx800NTwE8fbKBoChRZ4rCsQDcOc/eGjPbGsVDNkCwWmSHdn
         4zWsAcy02h7DG9I7KIrR/3G3ynUAl5zHFprvqWawNYq0ujuz0rj9xQPN87hRttEvJWya
         MaZkpYk6hJDhRKiSggxmfSLSCGk6wAycOhmze7v3vnTNsBJM82DsGnT9K7gXXth5q453
         GXnW0gnhFQMQ7rKcFFJUmj9xHXOE1CyUnZYbsfJ9eekI1f6DwJJHgA0YwjDavFZGHgxi
         PIdF3Xw7u6ZSs+rqvW6sJFzKLF1Mn/CCKFnzXLHVYU5aHYTg5a9RqdAAC/8bhq/W34bo
         HRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhI8yDhdR7lIAaqvku/gdFE7HWy6VU8JNAGQp8QsO6I=;
        b=fMpOS6zj+gStG8ziDBDP2CRHQjIbhbt3T7yH9RKeTQY188pGouIacnggjwhVad/Sb5
         hEIYxtwvDqSBwXHdoV0VoaKNPC2CpF0G+k/ejE5CC740fpz6+58ItmT/tyLqRIbz1nE4
         bhQukLBxjE7ZZ2LJ5XPtbOuD2z9/oaRQ5e6trvmahTjXHyaU9yryK/ayh6LBzAKCvpNX
         ck6CW/BuurXIGNOuIMC8E7ADlLz7a260EYtMe1O2w9dziCiORfw8y/FoslcQFMTekiTs
         jFZ7XNzTK00Iss1eyBu7KzHnfXk50bEI3v6W8ykOfRUw5Z/9CfmHI4ELrD8BucbBxMNx
         BgMQ==
X-Gm-Message-State: ANoB5pkLdKF3LRCqhS2Ake7ImsILCsVZd8z5byZCSdTQH00GD9ELUYmi
	WfWMa5qWMaHBO6t3rgvSirFjG0JnjOo=
X-Google-Smtp-Source: AA0mqf4UbHeO/7xp9TeaJC3lcd9wjoTeVcRzR2/roKzeL1N7msdBGBxph7L3Wcu7JbcPwh3sZzXNOI19OJg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:3084:0:b0:56d:dd2a:c494 with SMTP id
 w126-20020a623084000000b0056ddd2ac494mr44472082pfw.76.1669849796263; Wed, 30
 Nov 2022 15:09:56 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:55 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-12-seanjc@google.com>
Subject: [PATCH v2 11/50] KVM: VMX: Don't bother disabling eVMCS static key on
 module exit
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

Don't disable the eVMCS static key on module exit, kvm_intel.ko owns the
key so there can't possibly be users after the kvm_intel.ko is unloaded,
at least not without much bigger issues.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index d85d175dca70..c0de7160700b 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8490,10 +8490,6 @@ static void vmx_exit(void)
 
 	kvm_exit();
 
-#if IS_ENABLED(CONFIG_HYPERV)
-	if (static_branch_unlikely(&enable_evmcs))
-		static_branch_disable(&enable_evmcs);
-#endif
 	vmx_cleanup_l1d_flush();
 
 	allow_smaller_maxphyaddr = false;
-- 
2.38.1.584.g0f3c55d4c2-goog

