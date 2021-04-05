Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3256353AD3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:30:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDClb6mTlz3ft5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:30:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZQRdDF6E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZQRdDF6E; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCY14ZNNz30HC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:21:25 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id k8so7174053pgf.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QxLOBUUPsmcmYWvGNUQT+fwEBAPKT3eRXC/liKQ+kU0=;
 b=ZQRdDF6EbQOyNCo2zPq1E2pCr0+B8MsLkIjMQRtf6WbrZ0Po7KCFMt1nmNoACL2avU
 8e+hk1fm+9hkq1LPlnBagOsPE/bPA/0Q8zhs26l98BU9CJjRSmh1dUXzuv8xu7noVZuU
 SH5yLQnqTkKArt25FSbMarOwHxnOG/52J2IG8jPeMazwrepy3XiA4IG54mx6nfWho9Xx
 j6T6zwgrEL0zxbz9+OpjYc+BFVXSA/ZKVpyiMLxqxXtGC7mevF0eFZiqiZeczt77ceDs
 WMaMU+ZizByZ6S8FSp22KmN0qIG32dClDL9AQ9RB2CkjRP0lP6Yr97DONk/zQ/xaRU2x
 Dxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QxLOBUUPsmcmYWvGNUQT+fwEBAPKT3eRXC/liKQ+kU0=;
 b=q8R7++4of7OepoSd+yb1uvx354sC6FgYIPkhWHu+XhOefYVy5AtT4DQqOp6W3u5zbt
 6CXb7f7glegiJ8oAIELyM4Q/DL9alNgLhgjN7U2ZU8+caA6Vt3IRuVFJz8eDM793cVKI
 gFLclkbBVstCzXXpvY6cCK/7iQfrWCyASqyvQaxSyliYFcTMpnzUIvrC5MJxyyUnlbwC
 dVPsGNVgJ3nLXvyNbWVsNqrASP4ySfnsSZ8+RZQteLgXT1yLdjCBuyBS1xWyJnsG3Bc2
 aZuU2w3tG6zSwrhO/oPF5kUxHNu9Idf5dGvqYh/sbA2GNhh84EvSv3XXIyxWiitvR+Jd
 Y6Yw==
X-Gm-Message-State: AOAM531/ioCLiHWqqnS2GbWAtSkf1uHsvY562J0CslYYJeXG2c/wE3QT
 ad1Xy+MbICVj4BpUUmy27HLAKP/HXHdZJA==
X-Google-Smtp-Source: ABdhPJyRe3Q+W1HOZzcCNDB6XF/GW8hCGHQBzfUis/17lKiAuhfokV8UwfRPKqEosOvGmtFJyJLO3Q==
X-Received: by 2002:a62:82cb:0:b029:1f6:213b:6590 with SMTP id
 w194-20020a6282cb0000b02901f6213b6590mr21258088pfd.17.1617585683327; 
 Sun, 04 Apr 2021 18:21:23 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:21:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 23/48] KVM: PPC: Book3S HV P9: Move setting HDEC after
 switching to guest LPCR
Date: Mon,  5 Apr 2021 11:19:23 +1000
Message-Id: <20210405011948.675354-24-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LPCR[HDICE]=0 suppresses hypervisor decrementer exceptions on some
processors, so it must be enabled before HDEC is set.

Rather than set it in the host LPCR then setting HDEC, move the HDEC
update to after the guest MMU context (including LPCR) is loaded.
There shouldn't be much concern with delaying HDEC by some 10s or 100s
of nanoseconds by setting it a bit later.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 782c02520741..f2aefd478d8c 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3557,20 +3557,9 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		host_dawrx1 = mfspr(SPRN_DAWRX1);
 	}
 
-	/*
-	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] = 0,
-	 * so set HDICE before writing HDEC.
-	 */
-	mtspr(SPRN_LPCR, kvm->arch.host_lpcr | LPCR_HDICE);
-	isync();
-
 	hdec = time_limit - mftb();
-	if (hdec < 0) {
-		mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
-		isync();
+	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
-	}
-	mtspr(SPRN_HDEC, hdec);
 
 	if (vc->tb_offset) {
 		u64 new_tb = mftb() + vc->tb_offset;
@@ -3616,6 +3605,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
 
+	/*
+	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
+	 * so set guest LPCR (with HDICE) before writing HDEC.
+	 */
+	mtspr(SPRN_HDEC, hdec);
+
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
 	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
 
-- 
2.23.0

