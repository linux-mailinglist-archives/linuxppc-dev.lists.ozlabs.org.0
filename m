Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 985076C0B1A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 08:09:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pg5Sp38x3z3fJk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 18:09:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fZbQsbBQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fZbQsbBQ;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg5Lt3Fg9z3cDp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 18:04:06 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so11355875pjz.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 00:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679295844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DK9dLTAGrMpm0BQxyn19vYjH0cboReyEkRdHItdBxGQ=;
        b=fZbQsbBQUoIFGp1JnZnU8ZMXqH//p630M3/9raEE6NDwYmA620sxEBj7wHOb9irD3v
         V9Rygp+hyp5eU1vPmMFuL90zbpU9bwD6xKVDRwrpWU365Egfsdq0ebn97+QYZUATFh80
         vbu5VtjK+70JeV4EcmrTVS77jHMoDRYEa8BwrqLoZJEPHLq/iJ8qUZ37CgFFlN7fs3sh
         yls7W7GklBk1cgd24hKISfBAUKBPhsKA/DwP9fEemZ+UYNGFDDzh9OxTXKcHHlNGtlBO
         ATG7wf1NsR+43zq31V/F5Ek335Y0IxHOjKjMQK1OueBezhKio7lgsn/nc0v+wyUhszXP
         dMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679295844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DK9dLTAGrMpm0BQxyn19vYjH0cboReyEkRdHItdBxGQ=;
        b=Ea+u/KogXhInrFTqsXF2LfjIAdCVIMuFKM+lOUIJwBKinredLU3T3rn7Cp3o8EmlhA
         CVza9UafHNhCv+yuHyLdHcS3uFPUKc28sIHKWQmPgGioE9EqqHvWEe8BV6FP4slp79ci
         Ug7sCUjuidJzKTnsTAtj5M4d31FTUGDEe429Jl2YxttoKxF4/9hN3m+AcJ23n3+QxHJk
         1dx3i0heeZDz9X4RDoWbbSHxlnLxPUjfSL63nKL5y+r0X3rAeXJU39fFqvJUGwkR+eMq
         AAWeSyJ/pzLv0M2dAfj3poYXqx66lxJH5pl9txbNfm9DsyfnwzSzgqum7zPdud4Ge4tL
         4zUA==
X-Gm-Message-State: AO0yUKW3MROApxip0g4KYvavk5IzklGbE6PTVEkNhpdyXgoVKHkFCiWw
	gbiC+K4W7zgWw5Z5UTVHFWH3NGUCF60=
X-Google-Smtp-Source: AK7set+gdr5NPSUQ2wzxNeH+vdLlvghZATI1sJX3v/UIzP9/k3N8tvJADvmM4eoF5n3lucA95ncVDA==
X-Received: by 2002:a17:90b:1bc8:b0:237:a174:ce54 with SMTP id oa8-20020a17090b1bc800b00237a174ce54mr17408446pjb.21.1679295844637;
        Mon, 20 Mar 2023 00:04:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id r17-20020a632b11000000b0050f7f783ff0sm1039414pgr.76.2023.03.20.00.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 00:04:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v2 05/10] powerpc: Indirect SPR accessor functions
Date: Mon, 20 Mar 2023 17:03:34 +1000
Message-Id: <20230320070339.915172-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320070339.915172-1-npiggin@gmail.com>
References: <20230320070339.915172-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make overly-clever SPR accessor functions that allow a non-constant
SPR number to be specified. This will be used to restructure test
in the next change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/sprs.c | 63 ++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index 6ee6dba..db341a9 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -28,21 +28,66 @@
 #include <asm/processor.h>
 #include <asm/barrier.h>
 
-#define mfspr(nr) ({ \
-	uint64_t ret; \
-	asm volatile("mfspr %0,%1" : "=r"(ret) : "i"(nr)); \
-	ret; \
-})
+/* "Indirect" mfspr/mtspr which accept a non-constant spr number */
+static uint64_t mfspr(unsigned spr)
+{
+	uint64_t tmp;
+	uint64_t ret;
+
+	asm volatile(
+"	bcl	20, 31, 1f		\n"
+"1:	mflr	%0			\n"
+"	addi	%0, %0, (2f-1b)		\n"
+"	add	%0, %0, %2		\n"
+"	mtctr	%0			\n"
+"	bctr				\n"
+"2:					\n"
+".LSPR=0				\n"
+".rept 1024				\n"
+"	mfspr	%1, .LSPR		\n"
+"	b	3f			\n"
+"	.LSPR=.LSPR+1			\n"
+".endr					\n"
+"3:					\n"
+	: "=&r"(tmp),
+	  "=r"(ret)
+	: "r"(spr*8) /* 8 bytes per 'mfspr ; b' block */
+	: "lr", "ctr");
+
+	return ret;
+}
 
-#define mtspr(nr, val) \
-	asm volatile("mtspr %0,%1" : : "i"(nr), "r"(val))
+static void mtspr(unsigned spr, uint64_t val)
+{
+	uint64_t tmp;
+
+	asm volatile(
+"	bcl	20, 31, 1f		\n"
+"1:	mflr	%0			\n"
+"	addi	%0, %0, (2f-1b)		\n"
+"	add	%0, %0, %2		\n"
+"	mtctr	%0			\n"
+"	bctr				\n"
+"2:					\n"
+".LSPR=0				\n"
+".rept 1024				\n"
+"	mtspr	.LSPR, %1		\n"
+"	b	3f			\n"
+"	.LSPR=.LSPR+1			\n"
+".endr					\n"
+"3:					\n"
+	: "=&r"(tmp)
+	: "r"(val),
+	  "r"(spr*8) /* 8 bytes per 'mfspr ; b' block */
+	: "lr", "ctr", "xer");
+}
 
 uint64_t before[1024], after[1024];
 
 /* Common SPRs for all PowerPC CPUs */
 static void set_sprs_common(uint64_t val)
 {
-	mtspr(9, val);		/* CTR */
+	// mtspr(9, val);	/* CTR */ /* Used by mfspr/mtspr */
 	// mtspr(273, val);	/* SPRG1 */  /* Used by our exception handler */
 	mtspr(274, val);	/* SPRG2 */
 	mtspr(275, val);	/* SPRG3 */
@@ -156,7 +201,7 @@ static void set_sprs(uint64_t val)
 
 static void get_sprs_common(uint64_t *v)
 {
-	v[9] = mfspr(9);	/* CTR */
+	v[9] = mfspr(9);	/* CTR */ /* Used by mfspr/mtspr */
 	// v[273] = mfspr(273);	/* SPRG1 */ /* Used by our exception handler */
 	v[274] = mfspr(274);	/* SPRG2 */
 	v[275] = mfspr(275);	/* SPRG3 */
-- 
2.37.2

