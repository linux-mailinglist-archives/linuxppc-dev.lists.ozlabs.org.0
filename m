Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A43A031F523
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 07:37:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhhhR586Yz3clh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 17:37:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Awp7d0Sz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Awp7d0Sz; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhhfn0qmXz3cHV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 17:36:01 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id b21so3038405pgk.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 22:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZhKElMmAcxWKYLVW6gD2OsH4YAnkNF8CvR9dzFQpDY=;
 b=Awp7d0SzPgQ6XK5hl6dIzWewPmyPCyCOOYqfEnzVJh5aAiuWfrKaht8+jsNmKZpPXj
 1Q8RpGrWb2jAusPRuw4j8ugExyWeSnLAsKXvQCgFa0npjAB50qUmfABVGe0ZsqCteNaW
 VdVBjlEAZ1x2oUsY7/7IB+XIbK3Sqf2k522XQ1sZHyuEHGwkEw3mIpIwdPQSEP+fEs3a
 55zOecmfvNEDVeEw436tj1tafCGAMyuuR+JWRDh7pmYTcmgF+FvDM6f11jmuZR8fOZy8
 ymiK9i54fl7prn41OP5QHhjKD+MkIVABT10VOONITAlLg77CMq0frTLKi4NWVHTRzRjV
 jtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZhKElMmAcxWKYLVW6gD2OsH4YAnkNF8CvR9dzFQpDY=;
 b=ZXZ9347Fa+H9EBf9+A7pGyq8W9+7Sz4Rwb3VyEtK0kHZKdHy9eSJFF4IBi37tmoOxK
 U/XqQf3C3ZYs/jooMFbriyl/gUg84Q0sCD/R51nOrIEhNZ3/C5DnyUVusqOclUKStxnl
 56/mQapi/CNmVPppspcox/Gc4eWpLs1gFYjlPeYd/HoGQpM2GxwfctVxtqba+4zToLZ4
 EaVEZ98lLRYVWRLoOtXOZW8SE8uEV8dDcmSd+HGnGW1XprK5tmAUIfRd09qKyl3u7l7v
 yOY6DsFri+dqkH1pa/GgKyiFr82O0diO8eXebVYuIaNgV5dRCGAN9wU42H+/UyUJGBXL
 0aFw==
X-Gm-Message-State: AOAM533mDpQUhrMfEPdsDYKNu5BsZQfQY0R4Yi0NKd/l8L39KxL7dYV4
 oAUZ7PY0geg5UrcDMKERCXA=
X-Google-Smtp-Source: ABdhPJz4aYnevNUuieq8Zho6aComunXfjgCrXGaoUj2A1QT9k8k2kQz8VCpjG4hC7hDEunbibjCnng==
X-Received: by 2002:a63:510:: with SMTP id 16mr7162825pgf.42.1613716558890;
 Thu, 18 Feb 2021 22:35:58 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id v16sm7813099pfu.76.2021.02.18.22.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 22:35:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 03/13] KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in
 guest MSR
Date: Fri, 19 Feb 2021 16:35:32 +1000
Message-Id: <20210219063542.1425130-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210219063542.1425130-1-npiggin@gmail.com>
References: <20210219063542.1425130-1-npiggin@gmail.com>
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

Rather than add the ME bit to the MSR when the guest is entered, make
it clear that the hypervisor does not allow the guest to clear the bit.

The ME addition is kept in the code for now, but a future patch will
warn if it's not present.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_builtin.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index dad118760a4e..ae8f291c5c48 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -661,6 +661,13 @@ static void kvmppc_end_cede(struct kvm_vcpu *vcpu)
 
 void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr)
 {
+	/*
+	 * Guest must always run with machine check interrupt
+	 * enabled.
+	 */
+	if (!(msr & MSR_ME))
+		msr |= MSR_ME;
+
 	/*
 	 * Check for illegal transactional state bit combination
 	 * and if we find it, force the TS field to a safe state.
-- 
2.23.0

