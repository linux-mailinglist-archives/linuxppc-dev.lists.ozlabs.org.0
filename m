Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B672E63E589
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:34:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwXq4ScPz3cNb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:34:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=luHLl3Wd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=34okhywykdocbnjwslpxxpun.lxvurwdgyyl-mneurbcb.xiujkb.xap@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=luHLl3Wd;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0d73xFz3bh5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:25 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id md9-20020a17090b23c900b00218fa3308a9so156926pjb.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZ/AA3AN9yZfFS+Yz2Hj0GA1Db97x+XE1LjIfmdmS/w=;
        b=luHLl3WdRQNdBhH/vZv/hfYOmt9Q6vwep+qjtUAST73H1MF3LqvzoF2Ukv7UaDUlgb
         fXELwkqnEzgBN1h88nvzTImTYOnZGPEMito85bT2cMG/Dw2lvuyXP8zeBz8U2jGVs5tj
         pSDhoig8xe+6jwKUzsQZ0HNL6W7uKODl2j0YOlmoXogdfyORLlX0GkBhzBuT5EaiKGr7
         PCHzZt497tY3kEsEdxjbaw0LnCs8v3tH39skbarsReDUyuZOdzK6YVSLerydaPGb/0Z5
         eHv7VqvGcSRs3JMgPsz9Bq5kCqCHy9eUbAeqCz5po17CqSrTsXQffsEYVsh38nZQAmal
         lJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oZ/AA3AN9yZfFS+Yz2Hj0GA1Db97x+XE1LjIfmdmS/w=;
        b=ZEwga6LFNV3AFMzRLTnaxGZwb3UPSKoQBUT9Ye8K8BIXOFpCaehwUYL3Z4kOXJ69aX
         wgsjbux2xB8Q4d1qJLGo1oTuuPeejMZdx30Hsm/QKdAJEgTUXIllzRuyTw0O8nq2nH6Y
         bauyX7/CGk/hqQDi29gkmtD1N3oNnlzpl1qtNaRmpG8Y1a/iMUpKCMPnM+UQ1UO8jG0+
         hBB7zMty3jnQcuVM6zQdnCcvllJSxewxDJGRp7r09oxxToUbEG90uN6+QuhuyTcekh38
         d/YWhhHXN1GhvE/KeN6XbYQbqSslwgiMgVoLKTsakW2flQaz4+VqHNGITt2yPjjnoGSQ
         QG2Q==
X-Gm-Message-State: ANoB5plu6jFabe2t1lKN12lKcOGXoumAOj6GN3nZGm6HXkWqT4hIiXiy
	guPyjIup+8hOYv6pIVkxow68ikpjbBs=
X-Google-Smtp-Source: AA0mqf70Xm5b73dwbCTmumj9PiXG1e+aKYb1a7npTh2VM+OaIt1Kg/9NwT12H0mJEQDQr8PRUFC8axppjXM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f1c5:b0:189:39e4:c0ed with SMTP id
 e5-20020a170902f1c500b0018939e4c0edmr41790703plc.108.1669849824265; Wed, 30
 Nov 2022 15:10:24 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:11 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-28-seanjc@google.com>
Subject: [PATCH v2 27/50] KVM: s390: Do s390 specific init without bouncing
 through kvm_init()
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

Move the guts of kvm_arch_init() into a new helper, __kvm_s390_init(),
and invoke the new helper directly from kvm_s390_init() instead of
bouncing through kvm_init().  Invoking kvm_arch_init() is the very
first action performed by kvm_init(), i.e. this is a glorified nop.

Moving setup to __kvm_s390_init() will allow tagging more functions as
__init, and emptying kvm_arch_init() will allow dropping the hook
entirely once all architecture implementations are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
---
 arch/s390/kvm/kvm-s390.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 829e6e046003..8c4fcaf2bd36 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -469,7 +469,7 @@ static void kvm_s390_cpu_feat_init(void)
 	 */
 }
=20
-int kvm_arch_init(void *opaque)
+static int __kvm_s390_init(void)
 {
 	int rc =3D -ENOMEM;
=20
@@ -527,7 +527,7 @@ int kvm_arch_init(void *opaque)
 	return rc;
 }
=20
-void kvm_arch_exit(void)
+static void __kvm_s390_exit(void)
 {
 	gmap_unregister_pte_notifier(&gmap_notifier);
 	gmap_unregister_pte_notifier(&vsie_gmap_notifier);
@@ -541,6 +541,16 @@ void kvm_arch_exit(void)
 	debug_unregister(kvm_s390_dbf_uv);
 }
=20
+int kvm_arch_init(void *opaque)
+{
+	return 0;
+}
+
+void kvm_arch_exit(void)
+{
+
+}
+
 /* Section: device related */
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg)
@@ -5696,7 +5706,7 @@ static inline unsigned long nonhyp_mask(int i)
=20
 static int __init kvm_s390_init(void)
 {
-	int i;
+	int i, r;
=20
 	if (!sclp.has_sief2) {
 		pr_info("SIE is not available\n");
@@ -5712,12 +5722,23 @@ static int __init kvm_s390_init(void)
 		kvm_s390_fac_base[i] |=3D
 			stfle_fac_list[i] & nonhyp_mask(i);
=20
-	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	r =3D __kvm_s390_init();
+	if (r)
+		return r;
+
+	r =3D kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (r) {
+		__kvm_s390_exit();
+		return r;
+	}
+	return 0;
 }
=20
 static void __exit kvm_s390_exit(void)
 {
 	kvm_exit();
+
+	__kvm_s390_exit();
 }
=20
 module_init(kvm_s390_init);
--=20
2.38.1.584.g0f3c55d4c2-goog

