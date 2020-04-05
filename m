Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8140A19EA1E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 11:12:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48w7Gs60MXzDrGx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 19:12:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=hqjagain@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=asQpikoM; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48w7F50NcHzDqx5
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 19:10:47 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id x1so4691017plm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 02:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mnpDuNSJf4idjQMWn0+0VKn4i4vrRg7dKql4TPPMlww=;
 b=asQpikoMB82WzIe7GCp4O0VKa70l4WeL+s/v9JvBYQaJWfpC4mJWFGdAEXW7zu6igJ
 mD6Os/OfXnCRrVHiNtnfLuS9Dykz6Z9rHgNa8hl/PyErwapnwyGDHcNGXS2bJICl4LS8
 7lTu/QMA7LIatT2XBk04vAcCndyCfSodER7nvq2idhslZskq0q4nncpthYcIELGDxlvd
 hxI+FP74xm4xnRLGnk0c6r9TmbmnJkeyRl8Ui8isozExNmjl62+ft9fonIFdqK8yWldH
 gbu6kUlxoLHGozZLjsMiz/GuMKHkKvX1f6xqzTzVSRTxArhOotCBq2ACE7aNK00wxL6L
 3j6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mnpDuNSJf4idjQMWn0+0VKn4i4vrRg7dKql4TPPMlww=;
 b=r6mz1JI0Gmm0r///wWdplNxKtoDlZxewj5E2kxDfB6NxdCO9KpXHo8K0Dt/Gl+lEmQ
 HislnymMgFZjrsfUISZD5xsAvfZlExd9DES5CxZUeWOPVunphrump7k/3CLO1L6cbSlg
 zd4qF8MO1qz1m9uhYe7R5aSQ1br4l8oYVaF9bCNdNFGWYMyS4V8ut1exzIt6kEU+csY3
 h/ahqzj35GA7crwkG8E83yEhfJsZQq4h9qv9OgLrYpzpU03ykOZC628aqR96fbkyG+Kq
 P4tkBnwU8BTbSHciup1xazBIWBGD+Zzrgl316E6NPjG2p3XoR/PJISqVIEPKXnR/cG5r
 kxTg==
X-Gm-Message-State: AGi0PuYoZRPLYNS2I87U/JIYAIe0u4Yk8YG77MA9dvmNfN5hQaVN7OaO
 Nw46EP2DPIpIiuOHmLd430g=
X-Google-Smtp-Source: APiQypLWzVuUDtIGQ8G2eOA23S2vzFYjQ4vp/WxwKYnPXILzs4mehmugr4FB+E2gNti3ySSEdBZvtQ==
X-Received: by 2002:a17:902:ee53:: with SMTP id
 19mr15486190plo.173.1586077844496; 
 Sun, 05 Apr 2020 02:10:44 -0700 (PDT)
Received: from localhost (n112120135125.netvigator.com. [112.120.135.125])
 by smtp.gmail.com with ESMTPSA id t27sm411518pgn.53.2020.04.05.02.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Apr 2020 02:10:44 -0700 (PDT)
From: Qiujun Huang <hqjagain@gmail.com>
To: paulus@ozlabs.org,
	benh@kernel.crashing.org,
	mpe@ellerman.id.au
Subject: [PATCH] KVM: PPC: Book3S HV: Remove NULL check before kfree
Date: Sun,  5 Apr 2020 17:10:38 +0800
Message-Id: <20200405091038.29822-1-hqjagain@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Qiujun Huang <hqjagain@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

NULL check before kfree is unnecessary, so remove it.

This issue was detected by using the Coccinelle software.

Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index dc97e5be76f6..cad324312040 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1416,8 +1416,7 @@ static long int __kvmhv_nested_page_fault(struct kvm_run *run,
 	rmapp = &memslot->arch.rmap[gfn - memslot->base_gfn];
 	ret = kvmppc_create_pte(kvm, gp->shadow_pgtable, pte, n_gpa, level,
 				mmu_seq, gp->shadow_lpid, rmapp, &n_rmap);
-	if (n_rmap)
-		kfree(n_rmap);
+	kfree(n_rmap);
 	if (ret == -EAGAIN)
 		ret = RESUME_GUEST;	/* Let the guest try again */
 
-- 
2.17.1

