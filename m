Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD3F35B853
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 03:52:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJWvH4Nvvz3d3S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 11:52:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QkYMrAhT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QkYMrAhT; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJWqr4jtXz30J6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 11:49:12 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id i4so5801150pjk.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 18:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cpb0XptfeBMEd7qKsPHT+YBhIbp2/2VOCByAd+xlm2w=;
 b=QkYMrAhT2zZNRUqAfP+TulXEuU+UstC9cxmsiDYerJmc2MhpzRX2wg4ls53EG2D8+V
 7h+m/ZWZMjNtANeJ/aFsXQKygp68Zfvsn686XeQHs+qlZSHfVRTnHN0hHkYUnCDz8jNN
 gohiOQHcRCcGMQtJ7dc/86F9o1NWeexOF3I88etqvFKJh03KgGNwGzkSSHGIjXJE5Ilq
 XsGSdMillDam8701eiEBTubhfA3751zVq+eiZVpR2Mp5MU2Tyju56DLrZKLeRDZz9JUD
 SaLUiSgSRKreQXpjrxexQBpZqHpyyE//+PzlmSvonJ6HfPlnBUuPgOSqWdXuSn0tApMo
 W+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cpb0XptfeBMEd7qKsPHT+YBhIbp2/2VOCByAd+xlm2w=;
 b=ER/nIUP3QPUtMGBipx704AnH+kBU6OY4J8+3nwx87To/hE7uOkPU7HysccbSYxZ+9B
 0w61uaGAUf/Vz5H+a29xYItiBxxgVibPVniPp07FqvmViqdrd8YeVhm6oI7RDBe4xxo+
 +b0av6JJ1GY0iw/+e4ThLtOr60pVa23DMVGSgretQBdq9cih5+ivwOrvfBOXqu2o2FyK
 bw/N557QFcQW14qU1vB4GcB8j8ipfFKyJk7L8zdwAh1ET5uPTePp01APpy7V11uQMnSE
 H/Lj4gaNY4sp+t7a9ogK3sg6+HKCynuWlwjcEXKhLZw76o9w0ZUMYFbqQLQsoAyeDALI
 42og==
X-Gm-Message-State: AOAM533R97eXM1Z0t2J1zQI7oYo/PaVUH53XSk9czL3W/U0EWnRD52Oj
 CkTdsh3vA2RGnFWXbGMlIGkalbsM+vk=
X-Google-Smtp-Source: ABdhPJxUFVcm9udHXZivrKxIi7Y8tuEXU1lceLemYm3P4Efs1s+ojSOkkmJnlrqeco1bkvq2YzM2Lw==
X-Received: by 2002:a17:902:527:b029:ea:b5ef:689d with SMTP id
 36-20020a1709020527b02900eab5ef689dmr10954544plf.19.1618192150372; 
 Sun, 11 Apr 2021 18:49:10 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id m9sm9502345pgt.65.2021.04.11.18.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 18:49:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 06/12] KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
Date: Mon, 12 Apr 2021 11:48:39 +1000
Message-Id: <20210412014845.1517916-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210412014845.1517916-1-npiggin@gmail.com>
References: <20210412014845.1517916-1-npiggin@gmail.com>
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
Cc: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This SPR is set to 0 twice when exiting the guest.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 70c6e9c27eb7..b88df175aa76 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3790,7 +3790,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_DSCR, host_dscr);
 	mtspr(SPRN_TIDR, host_tidr);
 	mtspr(SPRN_IAMR, host_iamr);
-	mtspr(SPRN_PSPB, 0);
 
 	if (host_amr != vcpu->arch.amr)
 		mtspr(SPRN_AMR, host_amr);
-- 
2.23.0

