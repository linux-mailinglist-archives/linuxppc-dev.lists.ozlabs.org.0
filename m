Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF832EDD2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:08:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWMf1gM0z3ddJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:08:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=C5Xz5RYQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C5Xz5RYQ; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWKt3xQDz3dHY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:06:58 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id h13so2214756pjt.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OqE85jl6MTcwHuvBnwFd1UHp75PiplctVH/sjdMOP1s=;
 b=C5Xz5RYQOMw1QPhs6aQT3WoCyvr3U5jPVO4aRwZCz7U2Yt7tj5XMKFFrhV5NKgUSbC
 zmB394eJOoELma7tlIhpOez/ZddcpNSqwl1hHJzKOxVw0qhpv6JLU1nMlhM/d0dMSeA0
 ILnRYWGOrXw5wI8GM8a9kRcgVwNpWfN8Jlk7Ezs9gGpWKGSsnh38JcYGLTtMT5eWHxbZ
 352+M/Bc4XY0Qw/4Wf+3ooc3BkyeAvgoNxin/GFqvCfjAUBMmkHsE4sRL7cAvAnIE87y
 qNFakIw0/mAN8s4EYF5YnLKQsgf72j0bk/T7oOwXhmr+RGo+XjuTx/F0yW2h6nT6DnjO
 vKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OqE85jl6MTcwHuvBnwFd1UHp75PiplctVH/sjdMOP1s=;
 b=GXNfnzBFLL7jVKekXhGu99NXOyiB8rANQ2C03FB0Fg+GJB5h5/JaqFzojXJ5f6ghTB
 tiKoD7O2PkHNPv1wcyFsDyLlUrLvNj0B4RulOi0tQPA1YTKdclMiTL8ZnvslJeRMtWGg
 qO/5FoiI/rUHllCPmY4CtUtL1wuu+TJf2kdDi+XKja4ui6Uni0x+k50tVg/tDwCj7dqV
 nOUPYggNYlHGEoIQ8dSGQalOBNJ8JhxL9W3Uo3228cFjhztYWdy4qxDIgQjEEm+RJIXH
 F8EAf3YQ8FMWGlGkUgXbmZbiurT0qPseLqIkguWNX2Ie5YCoDmVPDSLYBH1BL739+9Lh
 WxIA==
X-Gm-Message-State: AOAM531Ipx1dyTph8MD3F0ZOojed0J60g+T+k3FqUT9rpCCOC98nnQgn
 5GCTndn9tBtkNw8Na897EkM=
X-Google-Smtp-Source: ABdhPJx5/llvTT6K0Ik963e3DaHBuAbSBuyIFWQzDdCt4SFmbhfbV+lkfx7rdu7zbuCBN3odG28UGg==
X-Received: by 2002:a17:902:ec83:b029:e3:ec1f:9dfe with SMTP id
 x3-20020a170902ec83b02900e3ec1f9dfemr9011629plg.59.1614956816281; 
 Fri, 05 Mar 2021 07:06:56 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:06:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 03/41] KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
Date: Sat,  6 Mar 2021 01:06:00 +1000
Message-Id: <20210305150638.2675513-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This SPR is set to 0 twice when exiting the guest.

Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2e29b96ef775..0542d7f17dc3 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3758,7 +3758,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_DSCR, host_dscr);
 	mtspr(SPRN_TIDR, host_tidr);
 	mtspr(SPRN_IAMR, host_iamr);
-	mtspr(SPRN_PSPB, 0);
 
 	if (host_amr != vcpu->arch.amr)
 		mtspr(SPRN_AMR, host_amr);
-- 
2.23.0

