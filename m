Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE11245E47C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 03:29:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0dxM58Tcz3c9S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 13:29:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BXiyZTKF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BXiyZTKF; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0dwH0wJ5z30RC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 13:28:46 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id g19so7443062pfb.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 18:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/RxlLdp83LkjBUbdt3IrEeN0bLA2PP47+Rx6Y1GNXOw=;
 b=BXiyZTKFsQjv+pPlmlF2Fi1q/BALykUs8S65Y0zavdGwqn30ZUFSwfL2SWzkaF8hap
 1OZSYO05yVO91HIIZNF14jOvr1OePQbZjU2AkACjHCtnIJh6SFIfbqGyuM6JCRMSwmaz
 WxNskSQXHE0Bu3i7qmIkJoXqKvyHqIZ4WVf5oPR3OtnDS/nfewrOhChX5paPA/tKpone
 LjINGtUs4ZeW1kZtdglEzWYa1DY3ltyvGN3yrYkLfvhetJOYV+/zGx0cdiAzcgjHMix8
 Wa/C1Ep+COdpU1JKCK4ZUkXAFEWNICTChQp+j4bYEdvzSQZXv2VHr/P+ze8nFphnWHzk
 uu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/RxlLdp83LkjBUbdt3IrEeN0bLA2PP47+Rx6Y1GNXOw=;
 b=gcoSNU2tpdlI6u7cz8Mobgh9AG5hWL8TP8cMujQi5frrvT2AFCQWKA880rDxfU4BS8
 yxwB1DrWcVdtaqKmq2Q58hDjkiVaWXqq3cXfRa4v4VQo72i7adsQK96c9PYB3L9GAv8U
 WA75DQGTCzZyw6fxRlusXsfB2bigxZ2k1B9NtjK79lI4udC8Mf7DCjXnrc4AM9lmsUk3
 HTenNtWMRKZdhWkiOKLeQnasjgcu24TXmdhoDgjGV0+ldzg21BgxV8j8/Ch/pwqIyKot
 BtiB4JIGyXG9ujy1KHfG4M4ofbVBBR+IzoyIwGNYSlT5Bil+MGPxyXPwVf06CvAemgTB
 d6cQ==
X-Gm-Message-State: AOAM531AMNmLBInfK8TWA0StbuQ/K23QhwmX5UVRGa4QkRmbGPoA3Pq1
 745NPVLYPBMRLeRhlnsskdvXyVi+Sis=
X-Google-Smtp-Source: ABdhPJze6NSn6nGOA9WpBjWwUTaOOIpzv77ozA1AZVG4sDmPNULToEQby6GyImgWPyLRlNkEqsvwaQ==
X-Received: by 2002:a63:5014:: with SMTP id e20mr19285552pgb.480.1637893723194; 
 Thu, 25 Nov 2021 18:28:43 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id p66sm3524624pga.31.2021.11.25.18.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 18:28:42 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/radix: Fix unmapping huge vmaps when
 CONFIG_HUGETLB_PAGE=n
Date: Fri, 26 Nov 2021 12:28:34 +1000
Message-Id: <20211126022834.1622106-1-npiggin@gmail.com>
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

pmd_huge is defined out to false when HUGETLB_PAGE is not configured,
but the vmap code still installs huge PMDs. This leads to errors
encountering bad PMDs when vunmapping because it is not seen as a
huge PTE, and the bad PMD check catches it. The end result may not
be much more serious than some bad pmd warning messages, because the
pmd_none_or_clear_bad() does what we wanted and clears the huge PTE
anyway.

Fix this by checking pmd_is_leaf(), which checks for a PTE regardless
of config options. The whole huge/large/leaf stuff is a tangled mess
but that's kernel-wide and not something we can improve much in
arch/powerpc code.

Fixes: d909f9109c30 ("powerpc/64s/radix: Enable HAVE_ARCH_HUGE_VMAP")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 99dbee114539..7559638068ef 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1089,7 +1089,7 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 
 int pud_clear_huge(pud_t *pud)
 {
-	if (pud_huge(*pud)) {
+	if (pud_is_leaf(*pud)) {
 		pud_clear(pud);
 		return 1;
 	}
@@ -1136,7 +1136,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
 
 int pmd_clear_huge(pmd_t *pmd)
 {
-	if (pmd_huge(*pmd)) {
+	if (pmd_is_leaf(*pmd)) {
 		pmd_clear(pmd);
 		return 1;
 	}
-- 
2.23.0

