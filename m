Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 859EA63E57D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:32:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwTh335kz3fmC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:32:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=h6rsUUCp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=32ukhywykdoevhdqmfjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=h6rsUUCp;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0W1PTLz3bgc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:19 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id b6-20020a170902d50600b00189a5536820so5305599plg.16
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5yXQhNujyCn0BKG7v31c4OGaNv+fuibQffzvzfRXOMY=;
        b=h6rsUUCphQInF8YIuJSydp7y3K+kWTxAbyRCfeyJQKJ+Y6qbtiTSAEs1qGlDllqT/J
         MMyCWI1z6QQ9M7p7Zu6QpSl/9m1uIwFhUqPqC0VY2dNxBAtSmKEBK4CCdgkZqO6Ul8Kx
         fACOhEYDJb6v1xuMAezabk8g2ZSsJuhT+lDS/T3ozQuYyR/lRYpg7LUF046Tas5T+NY5
         CeL2ERbYxquxucrniWQA910RogetkvuImYcNKj0ET57pNLum/MqlKCc6KP+V5OUAEk8P
         PnX37vQ/dZrpTC3Oabzm833Uf9cuKd5yhE1OeJVb9W6pQwUrjh0B5ijm+gc3WgDVn+HL
         6XjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5yXQhNujyCn0BKG7v31c4OGaNv+fuibQffzvzfRXOMY=;
        b=hHz4FN5C7muzxZNPZiw8d4BTlmOi+Ajt+oCKgys5guyn8ri5jPM50mXsktIUx9wis2
         XkACcxZVUHPDQGTPQA78MrvbnF1VyBGNFRS7kYjEi17KE3JwlPEDzHsXzUbA7oLfQxGU
         49VXMam3f7dlFVUcOhMeRtTaA3qqqLsKdHV0BLi1nQ7N6c5KX85UjvI0wX8WqkNRtqFx
         yEneDBQOogwKhndTz9F6reXMFhzzXuF7oG/Vo+o+nRdoxEYZI1gcLboAQC0y67nYKFsQ
         UUR2bebSg7EOO+/MLVL1+vnyiWTCPhYIOGPOmonA0aWavAAIoLV63z8VGhegQErVtzlS
         J6tg==
X-Gm-Message-State: ANoB5pnqh9kzAEb8UWGL3dthcJJjP/ncpjfcce63YlOYqquamUC8ToLo
	xcmEJmIOjFIjwUJBBVAy1zrqCfrQxTw=
X-Google-Smtp-Source: AA0mqf4uayK8uJVSnmaHjmcUzYqE9zwUJpBZYJxTpzlvsNbotM7JFJFGgIIUFhNbqetWZOK5ykPGKeuQP1w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ec8a:b0:188:640f:f400 with SMTP id
 x10-20020a170902ec8a00b00188640ff400mr45576276plg.143.1669849818577; Wed, 30
 Nov 2022 15:10:18 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:08 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-25-seanjc@google.com>
Subject: [PATCH v2 24/50] KVM: RISC-V: Do arch init directly in riscv_kvm_init()
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
Content-Transfer-Encoding: quoted-printable
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

Fold the guts of kvm_arch_init() into riscv_kvm_init() instead of
bouncing through kvm_init()=3D>kvm_arch_init().  Functionally, this is a
glorified nop as invoking kvm_arch_init() is the very first action
performed by kvm_init().

Moving setup to riscv_kvm_init(), which is tagged __init, will allow
tagging more functions and data with __init and __ro_after_init.  And
emptying kvm_arch_init() will allow dropping the hook entirely once all
architecture implementations are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Acked-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index a146fa0ce4d2..cb063b8a9a0f 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -66,6 +66,15 @@ void kvm_arch_hardware_disable(void)
 }
=20
 int kvm_arch_init(void *opaque)
+{
+	return 0;
+}
+
+void kvm_arch_exit(void)
+{
+}
+
+static int __init riscv_kvm_init(void)
 {
 	const char *str;
=20
@@ -110,15 +119,6 @@ int kvm_arch_init(void *opaque)
=20
 	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
=20
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-}
-
-static int __init riscv_kvm_init(void)
-{
 	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 }
 module_init(riscv_kvm_init);
--=20
2.38.1.584.g0f3c55d4c2-goog

