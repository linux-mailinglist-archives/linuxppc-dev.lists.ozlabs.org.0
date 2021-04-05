Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8023D353AB2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:22:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCZ43klcz3cZq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:22:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jteegXL2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jteegXL2; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCWh36mHz30Cl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:16 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id q5so7184736pfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ljQ2o/1KJXmV5budvf2xHhIW20DBRLuADvMqiJ21X0=;
 b=jteegXL22i+h9UVPqzn2fKvO68awdCVK3/kmTXzoyUnBcLbviueKoFI+ypqp8rvTw3
 Q+wiC7tzAFBILyZdrXGElHnzu2vR4ujsIz1szk24wBflaorLv9Sc57jZ3fIY8ylC4LnX
 ckclJGWyS2ugmRrEJM2liYX4/0e3ILdx4973YzOEcwakKJ8abSW06w397K1P/SH6Ld90
 wZkVMRsWCh5SPnaYm4WgEhuL9rKuFyMLq+IyUDFdv210jbVe+1zcvlRM+7nvlcIud5xc
 RunY0YAzhPRN7YiyWhtnfdFB34KPQGDpjxc/dwqUjSrr9YGFXuED5iB2JA1BCaH5ZK5N
 hXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ljQ2o/1KJXmV5budvf2xHhIW20DBRLuADvMqiJ21X0=;
 b=TapO0g18Cna+A4Zrn+CnjSjIxWGmNtlYGuMXSw3mbwGgKKnBGsJBu1P6esgypSqX5j
 QKok+YZNqVbK3rogbJYIBvlQFC3kSlEOaMtn/dNUA3JVpMlp23JP1iVn3wE1OuO9ykTr
 4FIbthXjhoTVc2fSUExTIsbvfV/0BFvDq+Ykq2JjhS+m00V4xyGO7sA1do50Q5Ll0zRn
 TSJUpps/g/6gR1HBRVV0adxTlVEQbE/0ysgYcfunVrEufSZKjWM4dqgztIluSC4iYiuD
 swixqBEOy0/Mw1dz+cnbGBL+N5kN1Yd1mUzmXdFCAuILQg3gnMLtE+DJi515oCKoNbYb
 edBQ==
X-Gm-Message-State: AOAM533E3CeB/dvFzBRsRtzrJ+mHsijqsLGayM1hjqLRGlgD7KGVRgHK
 NQ8Muwd83vAegmd38lmmdLI=
X-Google-Smtp-Source: ABdhPJy4e6XKE8ykNm7P8y7vG58oHuwFcXPgmxUmMJ1wX3FpQZ9izeGtMahOaoXNWJTWTTcgx2o7LQ==
X-Received: by 2002:a65:6645:: with SMTP id z5mr20660659pgv.273.1617585614266; 
 Sun, 04 Apr 2021 18:20:14 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:20:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 04/48] KVM: PPC: Book3S HV: Prevent radix guests setting
 LPCR[TC]
Date: Mon,  5 Apr 2021 11:19:04 +1000
Message-Id: <20210405011948.675354-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prevent radix guests setting LPCR[TC]. This bit only applies to hash
partitions.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index daded8949a39..a6b5d79d9306 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1645,6 +1645,10 @@ static int kvm_arch_vcpu_ioctl_set_sregs_hv(struct kvm_vcpu *vcpu,
  */
 unsigned long kvmppc_filter_lpcr_hv(struct kvm *kvm, unsigned long lpcr)
 {
+	/* LPCR_TC only applies to HPT guests */
+	if (kvm_is_radix(kvm))
+		lpcr &= ~LPCR_TC;
+
 	/* On POWER8 and above, userspace can modify AIL */
 	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
 		lpcr &= ~LPCR_AIL;
-- 
2.23.0

