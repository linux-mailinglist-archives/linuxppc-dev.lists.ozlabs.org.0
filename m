Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC32A3D5243
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 06:12:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY62n5VfGz3fHK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 14:12:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TNpHgJIr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TNpHgJIr; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5br1jYDz3bbm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:52:40 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id e5so8070802pld.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ss4SKT1mXpLqh5sHj/o40xs+IZbBpzSCdWo+XRcuK+I=;
 b=TNpHgJIrduC7LKWTgROEqE0OvQNLCPmPxYxafWgzN9+45UdApS0cAvqJDNcA/HyyLD
 2ifIGY7B6lJYPM5k4LxIHgxhofJ7AwIqVwSLJalvx/vY0qkSJfs8zqUTW0glll+/Aw11
 EeVU5XMdHgJAo/EgUSicIoq+ZVBorCMBwt2bNgaROtjzdaVTPA38cIj9KSjRM0THouJy
 CKulW7uyuFe93LSgr+qVvE5xzEWa4Pzuwqkcpu/N29nCy5BwpqlcrZVYh0tWIBCb/Iq3
 aH7fKVh7XSTExSVXwADaVACxYg/6CVvMO+pqrviWqDddGj9qfNJt649oXGy7y9gGodbr
 Mjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ss4SKT1mXpLqh5sHj/o40xs+IZbBpzSCdWo+XRcuK+I=;
 b=bXt5L4pW2NTZMhxEFQKgw54EFfOWoy48HcZ55hQ/TRXawnsPTfLY0ztvvVi79fBZ3l
 MfLAeLPq59HBw0CMaLk8YiVauRg9YTIXvjwNuBqWQHTopD+RPQe9IfEZR6ZMjVdnJIKb
 65ZN9gUoyKizYMRjuhAyvxu3aBRcOf4OSndgyw0D0WasWaNbN8wolgAEORcZUi7tiHKr
 F78abOwpfXp19oa9mFHax85Wrbr6XSjAwPnGbykOd4fS/0xCvKXowiiKR+RS/3SlxCrW
 VZ/ZiGuZpJ6CJ3cktnk6l9ZryMv1lc6coCZgxIDSvleNOWp0rXLDis4EIL3/nQYVhwhJ
 l3mg==
X-Gm-Message-State: AOAM530PG0NH87tBKXXdrwow0Cv/DujYrBqpA0R5CDGpQor75PZTS+2K
 MlyjC5yytmCwRpCU3Mgh5mg=
X-Google-Smtp-Source: ABdhPJz2PWY2wqBl1nbx6nNLUFWaqLoEMHAWftB5D29WCaNQQxV/uu7OTwoucCw4z7znMCz8lH+3PA==
X-Received: by 2002:aa7:93cd:0:b029:328:9d89:a790 with SMTP id
 y13-20020aa793cd0000b02903289d89a790mr15681898pff.71.1627271557733; 
 Sun, 25 Jul 2021 20:52:37 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:52:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 49/55] KVM: PPC: Book3S HV P9: Optimise hash guest SLB
 saving
Date: Mon, 26 Jul 2021 13:50:30 +1000
Message-Id: <20210726035036.739609-50-npiggin@gmail.com>
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

slbmfee/slbmfev instructions are very expensive, moreso than a regular
mfspr instruction, so minimising them significantly improves hash guest
exit performance. The slbmfev is only required if slbmfee found a valid
SLB entry.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 1287dac918a0..338873f90c72 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -477,10 +477,22 @@ static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator
 #define accumulate_time(vcpu, next) do {} while (0)
 #endif
 
-static inline void mfslb(unsigned int idx, u64 *slbee, u64 *slbev)
+static inline u64 mfslbv(unsigned int idx)
 {
-	asm volatile("slbmfev  %0,%1" : "=r" (*slbev) : "r" (idx));
-	asm volatile("slbmfee  %0,%1" : "=r" (*slbee) : "r" (idx));
+	u64 slbev;
+
+	asm volatile("slbmfev  %0,%1" : "=r" (slbev) : "r" (idx));
+
+	return slbev;
+}
+
+static inline u64 mfslbe(unsigned int idx)
+{
+	u64 slbee;
+
+	asm volatile("slbmfee  %0,%1" : "=r" (slbee) : "r" (idx));
+
+	return slbee;
 }
 
 static inline void mtslb(u64 slbee, u64 slbev)
@@ -610,8 +622,10 @@ static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
 		 */
 		for (i = 0; i < vcpu->arch.slb_nr; i++) {
 			u64 slbee, slbev;
-			mfslb(i, &slbee, &slbev);
+
+			slbee = mfslbe(i);
 			if (slbee & SLB_ESID_V) {
+				slbev = mfslbv(i);
 				vcpu->arch.slb[nr].orige = slbee | i;
 				vcpu->arch.slb[nr].origv = slbev;
 				nr++;
-- 
2.23.0

