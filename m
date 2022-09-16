Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E5B5BA5A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 06:11:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTLHJ2KY6z3f69
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 14:11:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Cp1QREYI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Cp1QREYI;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTLCW1rQdz3bxC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 14:08:22 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id l10so20271881plb.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 21:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YGPP8XImmZTA0T4AZaC5f07EKxjXmelqW985ES55Y9Q=;
        b=Cp1QREYIQm32QJTF11N0L/3yGymWBsXkuKbEo+NJQ2Gq4OsS3uyQUhRj5GXqQM7DFG
         YdHuZwSnxIeW/GQHk7UdJJDqoB+BHyQoemiqtzhTCJ+BnT1CwP2nnO5Xs7bz4Sl0jfD/
         4RdPhX6M6TQ1FXf72/BvQLxxjAf6KZTCgEWju4aRVBuoVR4/HkV336Yz8K5t7bJGSNEN
         yZnvDID5stNG+OgGbU4qIzPp1zQwX/AkWuNBMtiw3UGHZtqaKFXsjsRNkptCopUtkMGB
         FbFP7CZ4oB08+eIJRO0iN896H/VY6QHl0QR1qD98nt8uXBgkFTYGqOQdTjlm/21EoIQP
         qeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YGPP8XImmZTA0T4AZaC5f07EKxjXmelqW985ES55Y9Q=;
        b=LbKydkPZ+jYQu9FV9fNrYU7iUwicCJpdiP8wZdoQilGmDCy6riHyCcvsPuroJcp8Lu
         RA1HJR/KNvXbUGfwQhVpsILyFHYIt5gpWDSTBjkTmr8BXp7hUpKbcoMZPx6jHFFIJ1vu
         gYK6Wh6ynflzjHuHy0tg1sau+qCi6fNsOC/KuuxNBbDCfr2Q6TLNPjq4W0tDMiR8ykJK
         xSKpE5Za233O7/64OOc3ZHcBjkBiLBnwJq+0e8//xleZdwdSN3aGnIoxIhEGciZcB8pE
         YuNjN1NorgcL2rRqnrcStfvUXC+Q8RafeeYXqmHfBPuuOqoYNr6dYJSLGQSamiG+LYGA
         J1XA==
X-Gm-Message-State: ACrzQf1UXxXRIlXceZkL8GzqlEJ/+vQKcy1Hvqj1Pp4TJ0HiNd2jWslf
	r4TL8uxruFyStP9gwPxIp+uWklj9/Qo=
X-Google-Smtp-Source: AMsMyM7CUH5SScSeAgLth2fGLSiMlWaIphtbWzkPIzUbtqhHOKuIcN8Ic5WdzSUxANtwubebvtyDDA==
X-Received: by 2002:a17:90a:6887:b0:203:5861:fc5d with SMTP id a7-20020a17090a688700b002035861fc5dmr185723pjd.132.1663301300337;
        Thu, 15 Sep 2022 21:08:20 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-127-167.tpgi.com.au. [193.116.127.167])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0017534ffd491sm13696816plb.163.2022.09.15.21.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 21:08:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 5/7] powerpc/64/build: only include .opd with ELFv1
Date: Fri, 16 Sep 2022 14:07:53 +1000
Message-Id: <20220916040755.2398112-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220916040755.2398112-1-npiggin@gmail.com>
References: <20220916040755.2398112-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ELFv2 does not use function descriptors so .opd is not required.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index ae0814063900..737825ae2ae0 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -181,11 +181,13 @@ SECTIONS
 	SOFT_MASK_TABLE(8)
 	RESTART_TABLE(8)
 
+#ifdef CONFIG_PPC64_ELF_ABI_V1
 	.opd : AT(ADDR(.opd) - LOAD_OFFSET) {
 		__start_opd = .;
 		KEEP(*(.opd))
 		__end_opd = .;
 	}
+#endif
 
 	. = ALIGN(8);
 	__stf_entry_barrier_fixup : AT(ADDR(__stf_entry_barrier_fixup) - LOAD_OFFSET) {
-- 
2.37.2

