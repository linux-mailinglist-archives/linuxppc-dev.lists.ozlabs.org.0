Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B90421231
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 17:01:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNP713wq1z3cXM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 02:01:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OqiGrt0D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OqiGrt0D; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNP386z2xz2yw1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:57:56 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id np13so1744652pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y3UUZ0cNS5SteKRQt8YweO+7E1xDF2fYjVUngXFgFMs=;
 b=OqiGrt0DXmiitRYwusII8DFq+kzJDqQp/2inSwFfjH0xKTskhUi5YBPDIKHevmziFo
 R+MHb5PJAhX1TONIYRepzHIeQ8Mpu6v4oruiNy9ZQzwQeFKTL6PokKv39SJ49tzQNHFv
 mHd5TUNffimvIpIXwJppAswfzceMF87ldMKAkXq4OMSzGX3cPhAaJ8zWi0VmywPTbWTA
 jzK7QkZqPoNXTl7fS/j0asf+GIIkgWSkLFHyzHbt1/1a3eSwmBqAnVPCvi41Byoz4ZWw
 BDQEU7Ca+6nC0CT8DKFnpI0JcyBw/p/1WUtZH8SgfmfFKJKHwx2nicdIgS/qDKoPLIxd
 a7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y3UUZ0cNS5SteKRQt8YweO+7E1xDF2fYjVUngXFgFMs=;
 b=VYm/6QVpsV9rOG0D7/l7QK6SyivD5GxErj5QQPjNx6S/dt5EZ20hzzpbra3EE0GTkC
 NGWOA3jYQ//hVDX2iyhR7eiUhPBo9ORUbzphq10kMQ/BkPWROjAqGRRqkmqULYBFHexP
 cQqjh98RkB9pYc1YlsZzTB8RBic7c3ZygN1ugQjJsvo6mzlvb2B2DGwcD+nRiAnAjbA5
 fqcYKVxBkCFsggShBVqDvEcDfEVBQskCrO4cUFZOqjM68eiWaIIPqt2XfxKYYkHzLWEv
 j7M/XqIqEiWHkVkb67Lua2CdD65PI6McJOBKls/Ki4SqrJR7kxkgno5kmg5dKnB6o/lk
 koGg==
X-Gm-Message-State: AOAM531CIBzxeT9B3P0cEqF7zAsehh6mbrEl3efrA+e+AcM1zkU5L2c5
 VfppTew6JJHYp4d6SKfHofX4TwltvIc=
X-Google-Smtp-Source: ABdhPJy6VdjXJ3xNwEf+bMNVUW6gf62/TkzUvDHjF9mPJTiL5ZB1lXsaL4xmtb4HUhzQFbi8cCztfQ==
X-Received: by 2002:a17:90b:4016:: with SMTP id
 ie22mr17389044pjb.29.1633359474755; 
 Mon, 04 Oct 2021 07:57:54 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 127sm15052299pfw.10.2021.10.04.07.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:57:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Book3S HV: H_ENTER filter out reserved HPTE[B] value
Date: Tue,  5 Oct 2021 00:57:49 +1000
Message-Id: <20211004145749.1331331-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

The HPTE B field is a 2-bit field with values 0b10 and 0b11 reserved.
This field is also taken from the HPTE and used when KVM executes
TLBIEs to set the B field of those instructions.

Disallow the guest setting B to a reserved value with H_ENTER by
rejecting it. This is the same approach already taken for rejecting
reserved (unsupported) LLP values. This prevents the guest from being
able to induce the host to execute TLBIE with reserved values, which
is not known to be a problem with current processors but in theory it
could prevent the TLBIE from working correctly in a future processor.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h | 4 ++++
 arch/powerpc/kvm/book3s_hv_rm_mmu.c      | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 19b6942c6969..fff391b9b97b 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -378,6 +378,10 @@ static inline unsigned long compute_tlbie_rb(unsigned long v, unsigned long r,
 		rb |= 1;		/* L field */
 		rb |= r & 0xff000 & ((1ul << a_pgshift) - 1); /* LP field */
 	}
+	/*
+	 * This sets both bits of the B field in the PTE. 0b1x values are
+	 * reserved, but those will have been filtered by kvmppc_do_h_enter.
+	 */
 	rb |= (v >> HPTE_V_SSIZE_SHIFT) << 8;	/* B field */
 	return rb;
 }
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 632b2545072b..2c1f3c6e72d1 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -207,6 +207,15 @@ long kvmppc_do_h_enter(struct kvm *kvm, unsigned long flags,
 
 	if (kvm_is_radix(kvm))
 		return H_FUNCTION;
+	/*
+	 * The HPTE gets used by compute_tlbie_rb() to set TLBIE bits, so
+	 * these functions should work together -- must ensure a guest can not
+	 * cause problems with the TLBIE that KVM executes.
+	 */
+	if ((pteh >> HPTE_V_SSIZE_SHIFT) & 0x2) {
+		/* B=0b1x is a reserved value, disallow it. */
+		return H_PARAMETER;
+	}
 	psize = kvmppc_actual_pgsz(pteh, ptel);
 	if (!psize)
 		return H_PARAMETER;
-- 
2.23.0

