Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DFA459FD9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:15:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0Pw49Zpz307W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:15:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mQPplQa+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mQPplQa+; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzxK4kmDz2yNv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:57 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 71so2402350pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IACAwI2TxbLtHUpyZQ+W/iFLbATdV23N6JyyQJyuH/c=;
 b=mQPplQa+8xCNYFat0DJmBoXaCFtWksZkS6axJCWLfB5S/jQIri9pRXwo8ZXgO3E8om
 ilaigNxCWti/v3YfpZzfHKIDxdKI/gqj/3Pcz1/DnXezmbrLXXODzmXZojhVp6RCSIeR
 7i9AFlx69GijFu3QZ+TwN+LG0uuH65yrbDbiCWcqaHM1AxdDtLpfZ3LZ256LeT2aF7fI
 WbKsPEXWKr38hD8mUtfs6d4sDJxbxrHjGGo6G7tbZckIsQfyXCv/WWmMqB54d/T/QSuJ
 88cSQ/E/A6W74agEKS8kLi/H2CfUxHrWnBEZJLZHRyQ3ZbBba+kZq976hqZobSJHJML+
 DEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IACAwI2TxbLtHUpyZQ+W/iFLbATdV23N6JyyQJyuH/c=;
 b=LCfahVZ5t8LDlXOvmrawURjbdvLCH/NBaOesaHklmjJFjCrdoVwwLxE2o8LvEa5wNU
 P7aWKDETsgEgo1t7jZv1iwJ9uGNsJKAs1kuCCKClNHMn3HqqG3Bnmo1atw5OvvOjsSdy
 k8fPWPhYKZiNHYwPm0w6rb+vWU+vip6rZnPE7sl5KcrXBt3yiT4wI2h/yOi6MJUCvbvx
 PjqAFl9WpkcFmXwUkgdh5XvXvd5VF+XuEyxM4NzkqqDowe2qHXkj6qV+7z2z2tOGZ6vz
 uGKYIRQKsnCryaCrI2ouJTmZPjSXER2zoKzM7DfzdrP1fMw/I/6HCKxZd49/TifxPExo
 cH0g==
X-Gm-Message-State: AOAM5310JqnN0kg3h3wDE/2PKsZftK4f9mcfm5G2WIx2s/G+dFsJAeBr
 bn89surzFhs4l4dvqhlsYCzJAGPTO8uucg==
X-Google-Smtp-Source: ABdhPJx8wYzV4zUzoHkE3ym0McG69+y2ddCQ7JYPXq1qlxupIKv4f+ni0RxzAmkS0xeSbE41Ly0Yzg==
X-Received: by 2002:a05:6a00:b8a:b0:49f:ed97:16be with SMTP id
 g10-20020a056a000b8a00b0049fed9716bemr3953701pfj.16.1637661235978; 
 Tue, 23 Nov 2021 01:53:55 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 34/53] KVM: PPC: Book3S HV P9: Restrict DSISR canary
 workaround to processors that require it
Date: Tue, 23 Nov 2021 19:52:12 +1000
Message-Id: <20211123095231.1036501-35-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use CPU_FTR_P9_RADIX_PREFETCH_BUG to apply the workaround, to test for
DD2.1 and below processors. This saves a mtSPR in guest entry.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 3 ++-
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c14467cf23d3..3795080d5403 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1590,7 +1590,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		unsigned long vsid;
 		long err;
 
-		if (vcpu->arch.fault_dsisr == HDSISR_CANARY) {
+		if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG) &&
+		    unlikely(vcpu->arch.fault_dsisr == HDSISR_CANARY)) {
 			r = RESUME_GUEST; /* Just retry if it's the canary */
 			break;
 		}
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 619bbcd47b92..67f57b03a896 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -683,9 +683,11 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 * HDSI which should correctly update the HDSISR the second time HDSI
 	 * entry.
 	 *
-	 * Just do this on all p9 processors for now.
+	 * The "radix prefetch bug" test can be used to test for this bug, as
+	 * it also exists fo DD2.1 and below.
 	 */
-	mtspr(SPRN_HDSISR, HDSISR_CANARY);
+	if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+		mtspr(SPRN_HDSISR, HDSISR_CANARY);
 
 	mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
 	mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
-- 
2.23.0

