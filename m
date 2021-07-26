Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF75E3D523A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 06:10:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY60G5Ry7z3dkW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 14:10:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jY1YdaiW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jY1YdaiW; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5bc4K1Lz3bYw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:52:28 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id ch6so2118029pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HLk6HQ2z18NVVIxNvv7ggfI6nteda2G9xIwBhEx3DRA=;
 b=jY1YdaiW8IgRfdLESK4f4q/4PvLd8YOSNM0z4I5+GnB93BrdspXXkM38MaNV8dmbv1
 43HOOjeCqympcBUjz0ZjAmh5Q26NrTeRX86qRWBDaSLoMV5ua14a1rTawJ59XyWFS7Xf
 OoQmJfjekfKWvwkN9cLC9LVD8LnFdlxftawKU11q/0xPFsSfa74tAiM7bZTcsPOs6KZQ
 G1nZlfDIU0AkPbEdD4G/aZd0n0SIGb8UkdvXfO2ECSu49dRNsLa8rzWlsBuuyzc7gWsw
 S8hvwkvJ2sCOu3zZZxLSJh39I5PyJUUHBcGIk31mU+IeyFD+yuzxaURZ0E4z4KbhceU+
 p92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HLk6HQ2z18NVVIxNvv7ggfI6nteda2G9xIwBhEx3DRA=;
 b=FQ7VkDX3RVNacWjSmTkaVTab+zVwnkXlHLWGmkD0g8Lx4v+aYdjYHCVj05NLeFG6AE
 bivfIEBpX1eA9a9qpUAqV7cqYdu2ZI97zISIc8/CbgPyk8E6GvOQzEpRI/XHqH1HS74e
 CIkFa0PnijouX3ZyZQJEkcV8m6WU7mOeOcvEhU4evGQ7EiAPsgc1jES0SPQXIF9+hjJq
 blMlUur71QVJeFgaQhMtxmtsIMyCdZ8fNwdzOipIbTa6W6UU8rbdxpdIg3uRIYMMc/Go
 sCXnQzkBjbTHWcVNBfLqmDtxz8JtOkwxd5hc6yeuEPQvkqeLycXY7Xr8qI5S24jh3oqc
 JJeg==
X-Gm-Message-State: AOAM530Ow7j09ELhWLHnObHBp+F5F/CsejxfokA47FyHVkZux1+hgazn
 fmbejsM++HA4xiUqikq2yL6sM8W3FpM=
X-Google-Smtp-Source: ABdhPJy5Iq0w/nkquumaKPmXNbJJpEX0ODTDzd4tC7tGfKeCS5HCEBavwGpVltJ+qGXCpsT58KKsbQ==
X-Received: by 2002:a63:1f5c:: with SMTP id q28mr16263015pgm.114.1627271546679; 
 Sun, 25 Jul 2021 20:52:26 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:52:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 44/55] KVM: PPC: Book3S HV P9: Test dawr_enabled() before
 saving host DAWR SPRs
Date: Mon, 26 Jul 2021 13:50:25 +1000
Message-Id: <20210726035036.739609-45-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some of the DAWR SPR access is already predicated on dawr_enabled(),
apply this to the remainder of the accesses.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 34 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 0aad2bf29d6e..976687c3709a 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -656,13 +656,16 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	host_hfscr = mfspr(SPRN_HFSCR);
 	host_ciabr = mfspr(SPRN_CIABR);
-	host_dawr0 = mfspr(SPRN_DAWR0);
-	host_dawrx0 = mfspr(SPRN_DAWRX0);
 	host_psscr = mfspr(SPRN_PSSCR);
 	host_pidr = mfspr(SPRN_PID);
-	if (cpu_has_feature(CPU_FTR_DAWR1)) {
-		host_dawr1 = mfspr(SPRN_DAWR1);
-		host_dawrx1 = mfspr(SPRN_DAWRX1);
+
+	if (dawr_enabled()) {
+		host_dawr0 = mfspr(SPRN_DAWR0);
+		host_dawrx0 = mfspr(SPRN_DAWRX0);
+		if (cpu_has_feature(CPU_FTR_DAWR1)) {
+			host_dawr1 = mfspr(SPRN_DAWR1);
+			host_dawrx1 = mfspr(SPRN_DAWRX1);
+		}
 	}
 
 	local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
@@ -996,15 +999,18 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	mtspr(SPRN_HFSCR, host_hfscr);
 	if (vcpu->arch.ciabr != host_ciabr)
 		mtspr(SPRN_CIABR, host_ciabr);
-	if (vcpu->arch.dawr0 != host_dawr0)
-		mtspr(SPRN_DAWR0, host_dawr0);
-	if (vcpu->arch.dawrx0 != host_dawrx0)
-		mtspr(SPRN_DAWRX0, host_dawrx0);
-	if (cpu_has_feature(CPU_FTR_DAWR1)) {
-		if (vcpu->arch.dawr1 != host_dawr1)
-			mtspr(SPRN_DAWR1, host_dawr1);
-		if (vcpu->arch.dawrx1 != host_dawrx1)
-			mtspr(SPRN_DAWRX1, host_dawrx1);
+
+	if (dawr_enabled()) {
+		if (vcpu->arch.dawr0 != host_dawr0)
+			mtspr(SPRN_DAWR0, host_dawr0);
+		if (vcpu->arch.dawrx0 != host_dawrx0)
+			mtspr(SPRN_DAWRX0, host_dawrx0);
+		if (cpu_has_feature(CPU_FTR_DAWR1)) {
+			if (vcpu->arch.dawr1 != host_dawr1)
+				mtspr(SPRN_DAWR1, host_dawr1);
+			if (vcpu->arch.dawrx1 != host_dawrx1)
+				mtspr(SPRN_DAWRX1, host_dawrx1);
+		}
 	}
 
 	if (vc->dpdes)
-- 
2.23.0

