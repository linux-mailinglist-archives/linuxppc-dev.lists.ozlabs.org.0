Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F42353ABC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:23:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCb61D7Qz3dC6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:23:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oFuGn8uX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oFuGn8uX; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCWr63BYz3bmg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:24 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id nh5so3039822pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kcMSsKOd9XJdn7alZvC43Pwxot302AJo0nnXaxeTFDs=;
 b=oFuGn8uX+ROQHvXOx9JhZf+MLrC6LVCvFmuGEVKre8zV53rMFZFlLyFkqKvEA8ZnGP
 bqIT3G31WiEYLEOKfDo/DpHuT9SoQrqcXnMI5U6n3tXaleXSBO8ARK/SVPWFRVciRGft
 VoxiJ7SVLJM8DXFqm2pnSRp0bpKeizMkh++ZVQLPeDpI0hZ6P1PP/ePO8VaemLvmww+Z
 07h5qNP6YFA6R+Q4oJftIcT8xlMN7ed+OEZR3SKciXmMAD6xoPqGbvYWgoZjGHBLqlN1
 7YpYmiQEsz0KBBP02dr0kXBE1zoQlD+Q2NKTDK9M44NBanc1JhVBc1jcwh7NDnK3akkH
 BkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kcMSsKOd9XJdn7alZvC43Pwxot302AJo0nnXaxeTFDs=;
 b=jvw8k6/IFoVpvQV9QJ77A4M/Xu0SmFOrPQryDcPDwbnxoU5JTBTMqwCoifdkuMic6T
 lGy3xgKlLXgfClRmt6RWivms1IRiCG6+jdHPJX/objZwDRfR130WUrrSaOcP/u91W6z2
 GBmt1QfBVxvVwG68iH2mzC6ndivoHlVzha3njsbkZi2zvIQTkvuL5fiu9JOQ+oVLURsx
 ohMpG7YIHOSeRIDMEZqTqksQyucBl7dytNrgvYt0SG+UBcWhUNyYn1S527mXLdsFcsIe
 4WIYRDIwf2Pm+MkZG+L7r8ZL5eZXUF8IiVFvA0QfLzUzIP1oOOrA+7J3teN1PlMp/a0a
 GDfA==
X-Gm-Message-State: AOAM531Q+Mx/CuiV6h7BneW5NdBQYjJED/LabzKgEWB0ew5htjTfL2Ir
 6Q9ef+4Qmxzka8p91U5EF/E=
X-Google-Smtp-Source: ABdhPJzu6OWLDH6qzyRrj0OWZN7Ppb3avbojcT1MReb+hAokjIRNAbh9i0Xlz//auLea/i8zqZPdSg==
X-Received: by 2002:a17:90a:5d14:: with SMTP id
 s20mr24453563pji.6.1617585622570; 
 Sun, 04 Apr 2021 18:20:22 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:20:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 06/48] KVM: PPC: Book3S HV: remove unused kvmppc_h_protect
 argument
Date: Mon,  5 Apr 2021 11:19:06 +1000
Message-Id: <20210405011948.675354-7-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The va argument is not used in the function or set by its asm caller,
so remove it to be safe.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_ppc.h  | 3 +--
 arch/powerpc/kvm/book3s_hv_rm_mmu.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 8aacd76bb702..9531b1c1b190 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -767,8 +767,7 @@ long kvmppc_h_remove(struct kvm_vcpu *vcpu, unsigned long flags,
                      unsigned long pte_index, unsigned long avpn);
 long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu);
 long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
-                      unsigned long pte_index, unsigned long avpn,
-                      unsigned long va);
+                      unsigned long pte_index, unsigned long avpn);
 long kvmppc_h_read(struct kvm_vcpu *vcpu, unsigned long flags,
                    unsigned long pte_index);
 long kvmppc_h_clear_ref(struct kvm_vcpu *vcpu, unsigned long flags,
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 88da2764c1bb..7af7c70f1468 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -673,8 +673,7 @@ long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu)
 }
 
 long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
-		      unsigned long pte_index, unsigned long avpn,
-		      unsigned long va)
+		      unsigned long pte_index, unsigned long avpn)
 {
 	struct kvm *kvm = vcpu->kvm;
 	__be64 *hpte;
-- 
2.23.0

