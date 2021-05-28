Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD186393FA0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:13:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzVx6jt8z3dh3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:13:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lSoboG8t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lSoboG8t; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzPT6LBVz300T
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:29 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id q6so2171309pjj.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cUEbB1uxydd11jDkucwIfUU2Dj7cII3oAzBBJlkL/QU=;
 b=lSoboG8tpdJv4KS0a7P39fwC7DcRRmfH6xAxTphPgUrJaYoZF2yRQxBmdMVJyrXIzh
 4jNX3OOeEIvO2xUmFSPYxC5by7c0CgquXgFuRNp9cteTfh8JMMwPdxgG55+AKPMif+7T
 D00rs9DM8xSjjmBNFuNmjIhCZlgU/YDTuauycbQF/K84iCn52Emm8ThKNK0fkrGA4y0q
 tTr+iuBHC5bI5/5F6w9LCQZOYttr3v0by8LPe6/TfB5SD0mx7HZU8Ly2n1xcQ7AzF1X7
 KL1Q5vSXg3C4dYb5hqxjxxX0OAlA892UnmLluSVM2iAx4Fprji179epbIyxCrtlhAU/l
 jQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cUEbB1uxydd11jDkucwIfUU2Dj7cII3oAzBBJlkL/QU=;
 b=B6KYFQs7W4+6XEYe/2hyK9HNRXvMXfv2T/e/wQMp3PrHXxBFXhMpG6mSxqxtHrArf/
 YzcweoL1IuhQEvwwWGvPFrAoMMUUgBa6cZ/UmwnFmqmJPCTQga35XGNQrAWUM7/1WuVf
 WM6bhxyAVE6V64EeUggU+nj4XTzzyzx6tBfGLwDsm0KDgQ2stxBNregnryzUVUVIVKFO
 njRMq+T1leknW294bnAFa+QpqY+nZyL7HNrupiSY+quOWkjQtnYDbIdJMOj7obW6f8o/
 4STiR079PhbBdwUQ0jB/UukH2yAymc+PoZnaDcWETK5vCSncvAH1/qD/CHeZIiOznWCT
 dzGw==
X-Gm-Message-State: AOAM533ncZPyYJlQ5jK/XIkcVw/sogm8X4AXQ/dh9QQ8JwnNO/b9ptm1
 saN8ZpWxRvZzKOmyzFFc6NgJw20Zfb0=
X-Google-Smtp-Source: ABdhPJxrdarisH3hRxOuOV/WACSmAma1toX2dQ1LHiSLNjDGJKN08q6xHrQGCE+EM+hCtjt3nHlTnw==
X-Received: by 2002:a17:90a:a116:: with SMTP id
 s22mr3319681pjp.155.1622192908044; 
 Fri, 28 May 2021 02:08:28 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 11/32] KVM: PPC: Book3S HV P9: Move xive vcpu context
 management into kvmhv_p9_guest_entry
Date: Fri, 28 May 2021 19:07:31 +1000
Message-Id: <20210528090752.3542186-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
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

Move the xive management up so the low level register switching can be
pushed further down in a later patch. XIVE MMIO CI operations can run in
higher level code with machine checks, tracing, etc., available.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d82ff7fe8ac7..bb326cfcf173 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3558,15 +3558,11 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	kvmppc_xive_push_vcpu(vcpu);
-
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
 	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
 
 	trap = __kvmhv_vcpu_entry_p9(vcpu);
 
-	kvmppc_xive_pull_vcpu(vcpu);
-
 	/* Advance host PURR/SPURR by the amount used by guest */
 	purr = mfspr(SPRN_PURR);
 	spurr = mfspr(SPRN_SPURR);
@@ -3764,7 +3760,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			trap = 0;
 		}
 	} else {
+		kvmppc_xive_push_vcpu(vcpu);
 		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
+		kvmppc_xive_pull_vcpu(vcpu);
+
 	}
 
 	vcpu->arch.slb_max = 0;
-- 
2.23.0

