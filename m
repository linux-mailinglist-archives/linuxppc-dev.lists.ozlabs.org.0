Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7E459FBB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:04:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz09W2vCVz3fN3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:04:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b2uqDETw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=b2uqDETw; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzwj3khgz3c9d
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:25 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 200so17843103pga.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=doxu75HuXy1+Cx9ZsamWp32iQ6wAcrR6/+P3lnOH6uM=;
 b=b2uqDETwhq6tyrxtwcj9TPgLTqp3ft8Ld0QluUJovIL1731irjDbWzBDL/5TOH3uSX
 2fkz70f72V2vq6JymmG98P6UUEAvVlEAZvKm0N9yUC0ViET56lGKkQleo5q0e0s2jGMh
 GIBFrjJImNtA7+6cj8E2GFx7kVSx87ptLTVEMpcdXbUiakK7DQBzGpwu5LOepGgIU1ci
 2lCQyv/wfb2sHyDVKs3UcKBQLDP4njloB4oCQuJPFu8eaSxLL+oztjGZShQjvqWd2/dC
 fjC6JUvucJV2DNU+tJtx/4vtXWuraAIylCJScFgzsLtnJavmnj6SR2rZs2Z4izZd27/e
 qa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=doxu75HuXy1+Cx9ZsamWp32iQ6wAcrR6/+P3lnOH6uM=;
 b=0fk0WLdFyEpnmTf3/5KLn/wzFcsX4GCoZxYaxc4UwzYZXE/1Fv8JFpvmaOTaA+QYad
 LatVvb3QpJihC7auZPCIgF/JRNszac3ESONUvy97rW6LLEfjNhv3+LMeZVW27pxASK7A
 7KMu5VygrQTJd58rqlnNGV8/Wrz0oOmchQUGHxVhcrNv9aTufgUWBj6GFRjokm2lCwjM
 vJuXNkaWeQp9PuyWhOWLiSmpBjfEOi+LPeK19pUIpY6zhJr8NS9zEcZXnAnFZPrpn0sS
 TsB1qfpmg9J1LPa3WuNFyT5ZEoR+ZoBCkUnxbNCrT8RskBFaA846FErGU9fI4EwqbhYQ
 WAAA==
X-Gm-Message-State: AOAM531/40KMLaaxXzg9qCZAdSOj4mVtMSwUXaKI/0ERynd7TIuccf4C
 XCUNfxPz+WaK47bKBSqKINE7JE2Jh5Ve5Q==
X-Google-Smtp-Source: ABdhPJx+LhdnssxTUdsCdK+AbdiVbJ7AsNX7xFyj5/pnibfpV6u6l1634dILRHYRzBk7G7+dRHhzFw==
X-Received: by 2002:a63:6849:: with SMTP id d70mr2753759pgc.269.1637661203168; 
 Tue, 23 Nov 2021 01:53:23 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 18/53] KVM: PPC: Book3S HV P9: Move SPRG restore to
 restore_p9_host_os_sprs
Date: Tue, 23 Nov 2021 19:51:56 +1000
Message-Id: <20211123095231.1036501-19-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the SPR update into its relevant helper function. This will
help with SPR scheduling improvements in later changes.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index e4fb36871ce4..4e6a42b16998 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4106,6 +4106,8 @@ static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 				    struct p9_host_os_sprs *host_os_sprs)
 {
+	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
+
 	mtspr(SPRN_PSPB, 0);
 	mtspr(SPRN_UAMOR, 0);
 
@@ -4306,8 +4308,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	timer_rearm_host_dec(tb);
 
-	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
-
 	kvmppc_subcore_exit_guest();
 
 	return trap;
-- 
2.23.0

