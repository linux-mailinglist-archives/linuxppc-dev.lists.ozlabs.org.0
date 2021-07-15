Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFAA3C9F43
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 15:16:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQZdC3hc3z3bsW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 23:16:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NG2gZrOR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NG2gZrOR; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQZcL0pzTz2yMD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 23:15:29 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id k20so6230800pgg.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dg+kECwAuBShufULtVDvhwFWlxHBpA5vuIilKUWCHKw=;
 b=NG2gZrORvpOx1ukjrrzSAx3vIGo65+AokhbSqsqCW+ATo/Fc3r3a8483nr08C+CKNm
 T4heEkQjD+3daIkQKXPGMMSFXPdBy/aIfzuBbeKRg2h9bRzXKe1zGJNSWL3Mne/fEEBu
 HApJ0QcRVqS9vf52yr2VJrTsJChSvAh1wFwRt6BYBN8EoqjEAWfEiCFU7/TkZT6UgCR/
 xaAcjH7QATyIohzEZKdM1arlHoh3CKrCiNr32iEf+j/a4khT6qgfp/nHv/IE+ZTdVGc0
 FGOx+Y8ryfIlrSpkYm0/1l9SVORCAxxhe9rRPUNc8LyPaRj8sdFV8G8qFdSMuTxFLxGf
 IEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dg+kECwAuBShufULtVDvhwFWlxHBpA5vuIilKUWCHKw=;
 b=gU4bts01NHf6Qx5OYpCTAXKaz+Jguw6DWQEUeQiARr40OulwbLgzqNCmzYw+sjoRj3
 8lf86tTLDNRWtyZ/mE5YdnA/YcorAlAacN+5mUkgbe8eMcJrppSmFXI1Psn4624eW4cW
 yFnhI844KKq0AVXh5tgbxbqCOc/OohuPOrBh9OmHySRqcQQiaU3Rj/noZvpfgqokB2b+
 kBl7GMtp4IRVADN0BIlelmU319gUHQ+wdxjpq8gLxbI2+a1KF2P5K/hIdOWj9x3ComZW
 5C0U/He1BaS9MlU32OzeJt/HhpDhnY1xueEbq6/fXNZ7hPAHQdS8xIAvk4ibvUEjuYdx
 7QtQ==
X-Gm-Message-State: AOAM533E39LZWsaFxixXBC98mftiVJFJBrIj5hm6iqTkj04C8visU5T3
 X+xQwpx3XDE9ny5lq5j2CoBoeHRZwkDpvw==
X-Google-Smtp-Source: ABdhPJwTuWAXRw7sa81YbVR8I3Tp1EmxpLH90UEDYGKD0GbKrm+IKtLnyiBgmLCRrYOaPmHlNwVg6g==
X-Received: by 2002:a05:6a00:1713:b029:332:7eca:41a1 with SMTP id
 h19-20020a056a001713b02903327eca41a1mr4694625pfc.26.1626354927624; 
 Thu, 15 Jul 2021 06:15:27 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-33-83-114.tpgi.com.au. [27.33.83.114])
 by smtp.gmail.com with ESMTPSA id
 k6sm4864216pju.8.2021.07.15.06.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 06:15:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 1/6] KVM: PPC: Book3S HV P9: Add unlikely annotation for
 !mmu_ready
Date: Thu, 15 Jul 2021 23:15:13 +1000
Message-Id: <20210715131518.146917-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210715131518.146917-1-npiggin@gmail.com>
References: <20210715131518.146917-1-npiggin@gmail.com>
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

The mmu will almost always be ready.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 9d15bbafe333..27a7a856eed1 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4367,7 +4367,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->runner = vcpu;
 
 	/* See if the MMU is ready to go */
-	if (!kvm->arch.mmu_ready) {
+	if (unlikely(!kvm->arch.mmu_ready)) {
 		r = kvmhv_setup_mmu(vcpu);
 		if (r) {
 			run->exit_reason = KVM_EXIT_FAIL_ENTRY;
-- 
2.23.0

