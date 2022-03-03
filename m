Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FBB4CB67C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 06:37:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8KVp4hZFz3chm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 16:37:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L1bATKQo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=L1bATKQo; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8KQq0kfsz3c01
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 16:33:38 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so3869916pjl.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Mar 2022 21:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1WtRymlzfOOEBptL4OCnKTBAcmjVZ3RoHCwByP43AEo=;
 b=L1bATKQov0rlO3q6A7vxSFZtE+SBUb9LqushChTwH4LhO86eAG1N0qlWAuGFSFOts3
 N+UyE9O+ljEIW7dBmiVtDTIuxiguiHzg5iRisj7dkY+r68lI5dB25BimF72B5gtP2iTH
 Qsd8i3EBHCkAY8CTeZphsshHBQthjHGYduX8CMoQCEYqgM68fo7R5XoVZPQWrJ11zqdC
 zrAPyrPRD9KysitYUB2dQwplLnz0A6PwY2kvs4oynU9Ybd96thTEGouPApsSEwkPVdUn
 NLa5lM2D0Y58UV+biVbMxVha8r7V/36eiV8qfLADyq9Jh/D9hW69rtHCvp82ojHaWOeV
 c/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1WtRymlzfOOEBptL4OCnKTBAcmjVZ3RoHCwByP43AEo=;
 b=ytyutxpRM3Nso4Z/iSK8bY0Jbq29BBEHm35gaPMyVxSiJbiNrYKxWInDdBNGIfrZRU
 qLXpNdDZ7Wc8l7bkxIbCg+DlLiQY6LYv7L9WtNrWO8gWlwyUabV6p0Y1NKXFZCnfO3o/
 mfD0NiRVAyGTc8ViwwWBj9DIpqW1S53qkE1kYj+HvNBu82wWBD5W7tDhje7hXGjI/FeE
 O50Sx+a/OtKkBAIKf6i/KC+aDpimFEmHNdSpSX61XDXGtXrdzFEEfE5t5bh1WdCToeeV
 zeNDBP6MdwYOrbSR0R2jzyQYai5uP+RXZyzKmJUleMJtESU3Ub36j+s6Am5dh/HUYzCe
 L3iw==
X-Gm-Message-State: AOAM533F6p8GRKYgQAOjWGNZYcUNGTOcldMN4Cu8urj9aIBr0shtzwcg
 oY53nqzgFCaQHtf0BM5A3pyuHUGNmtvi0Q==
X-Google-Smtp-Source: ABdhPJwuCcSsWCAGxLC9zl6DccnnjtrBEjCM0UWM16m6wdfn6zKrby8mY/6Fqsd5e9BUZ/WPhpvE+g==
X-Received: by 2002:a17:902:7296:b0:14f:2a67:b400 with SMTP id
 d22-20020a170902729600b0014f2a67b400mr34865322pll.172.1646285617742; 
 Wed, 02 Mar 2022 21:33:37 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-90-129.tpgi.com.au.
 [193.116.90.129]) by smtp.gmail.com with ESMTPSA id
 t7-20020a17090a024700b001bf12386db4sm170300pje.47.2022.03.02.21.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 21:33:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] KVM: PPC: Book3S HV Nested: L2 LPCR should inherit L1
 LPES setting
Date: Thu,  3 Mar 2022 15:33:15 +1000
Message-Id: <20220303053315.1056880-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220303053315.1056880-1-npiggin@gmail.com>
References: <20220303053315.1056880-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The L1 should not be able to adjust LPES mode for the L2. Setting LPES
if the L0 needs it clear would cause external interrupts to be sent to
L2 and missed by the L0.

Clearing LPES when it may be set, as typically happens with XIVE enabled
could cause a performance issue despite having no native XIVE support in
the guest, because it will cause mediated interrupts for the L2 to be
taken in HV mode, which then have to be injected.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c        | 4 ++++
 arch/powerpc/kvm/book3s_hv_nested.c | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 77315c2c3f43..acba9cb241c9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5323,6 +5323,10 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 		kvm->arch.host_lpcr = lpcr = mfspr(SPRN_LPCR);
 		lpcr &= LPCR_PECE | LPCR_LPES;
 	} else {
+		/*
+		 * The L2 LPES mode will be set by the L0 according to whether
+		 * or not it needs to take external interrupts in HV mode.
+		 */
 		lpcr = 0;
 	}
 	lpcr |= (4UL << LPCR_DPFD_SH) | LPCR_HDICE |
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 9d373f8963ee..58e05a9122ac 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -261,8 +261,7 @@ static void load_l2_hv_regs(struct kvm_vcpu *vcpu,
 	/*
 	 * Don't let L1 change LPCR bits for the L2 except these:
 	 */
-	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
-		LPCR_LPES | LPCR_MER;
+	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD | LPCR_MER;
 
 	/*
 	 * Additional filtering is required depending on hardware
-- 
2.23.0

