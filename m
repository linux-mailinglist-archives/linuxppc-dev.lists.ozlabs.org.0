Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB1459F96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 10:54:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyzyF0whdz3cbs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 20:54:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YpQXCHpg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YpQXCHpg; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzw249Z1z2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:52:50 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so2420028pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=liEVdIsUFRVVM5/Ddp9/2J5swe17jJoI5pP0iV7NyKc=;
 b=YpQXCHpg75XWW96PMCPVff8uvOwaVcft0YZ540JriW0BJMvTcquYTOVbs+fu+Oke/Q
 z1kgpH2IA9O7yZaEFFHCvRyihSJB1OnoNsU5QAYBD+Cl21qPbDyB1aQqa2dI7zcPglMo
 ROpa2zvsSeipjrru65rRJ2n1vzGkVD6CtD3y9NyMZSThLOgv+vwZouLXHKLoz5mWIInG
 Wa1vEPBa+Syd5CYZ2iU8/OOqlPi61Mf4CI5nDrQl6wGDwZ+AipaLYd7rMJbD53U0o3JR
 nHCSWMXT0VCdBOQTewgEM3Gv/mHODCA6MDE/zToLvKKRtFu6ZVhPU2mHhYnktyOirVkj
 wW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=liEVdIsUFRVVM5/Ddp9/2J5swe17jJoI5pP0iV7NyKc=;
 b=PIwztpAzKZPqtm4rHROKN2cT2LpgOyMZCqSXkxxueHLTK1YvtCQ10fhQlHestB11VH
 94rNrE2U/lWfpd4j8muFlv7YZykb0SYWcmK7/HDANJT0z5argIs4wloTR6FHnxffxUjm
 5En/9lPerTDTgSxIoaliaxo2rNPmCrWAnTmkQKakrD4LYRnXZLit+QpaEusw64U7Pdud
 gtDXDnOZFZqf003fInX6bVaTRP3Jf70wIoPrqw3nPHIeNBsD4zauIJ8upJK4Snqt8AQS
 DhGGVfKNqrCakKhpmgeWbl6l8jx2ePNj1NXBCu80rM+TcAfFyqEKzzk//3GLUwQS/VLa
 vWtA==
X-Gm-Message-State: AOAM532iuC/3/OjoOgqhhoYF0PT8hlrz3alFc3Gxq7RKs0dC0yBdF6nr
 HCssr7TXq+NbF/WlwtuJd1MKx9GADbnH3Q==
X-Google-Smtp-Source: ABdhPJwDEZR4xgoxzRKpj4d1uAaK0RnWBtMI7z6VULmGv+sws+ovFGDYH42DXTxIxUeHBzPO2l9PCA==
X-Received: by 2002:a17:903:32c7:b0:141:eb39:30b7 with SMTP id
 i7-20020a17090332c700b00141eb3930b7mr5325823plr.41.1637661168595; 
 Tue, 23 Nov 2021 01:52:48 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:52:48 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 03/53] KMV: PPC: Book3S HV P9: Use set_dec to set
 decrementer to host
Date: Tue, 23 Nov 2021 19:51:41 +1000
Message-Id: <20211123095231.1036501-4-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The host Linux timer code arms the decrementer with the value
'decrementers_next_tb - current_tb' using set_dec(), which stores
val - 1 on Book3S-64, which is not quite the same as what KVM does
to re-arm the host decrementer when exiting the guest.

This shouldn't be a significant change, but it makes the logic match
and avoids this small extra change being brought into the next patch.

Suggested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2777f66001a8..c7dbdec183b9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4063,7 +4063,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - mftb());
+	set_dec(local_paca->kvm_hstate.dec_expires - mftb());
 	/* We may have raced with new irq work */
 	if (test_irq_work_pending())
 		set_dec(1);
-- 
2.23.0

