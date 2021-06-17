Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AEC3AB7EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:52:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RQ935Kjz3c9T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:52:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=c2n9810j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c2n9810j; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPG4cKKz3bsQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:51:29 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id 11so3145979plk.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BHMU6AOurbTXzLfma/o2qAFGIymmkLw5/j5CZJj9PxY=;
 b=c2n9810j15RCcbLL3xqX70EpK0Swu+hv1IetFKRFcY7+bHeLfHO8+HfSBtj0Nsdzmp
 Ztb4aP82dfJMEVsPNpSRpaIqv2G+7QIcRXBoJSiKgB+J/8TvXY8fJJEHiFKTSGcHGpdp
 l14fEfxjOVK+tyqAIcs7c05dVMlM2aGz/v+uGZXDPqbfh85W1H4M1EFRIlxOoF1T8nKE
 nNOHW/3ncf9d1ScKTiFXNBmUoNJs/7bCIkpQCEWq0AXrmNk6Xs2HrpIMS3hKEXonREr4
 fVezOKb1W5ZFjBHDVLgyfS34YzJKMKK+AP6eFYk1YN9IQeogcCXqv9rwD2PKtS+tYlh9
 3Z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BHMU6AOurbTXzLfma/o2qAFGIymmkLw5/j5CZJj9PxY=;
 b=qLWmy/KgnewD3S7wd+NEIJvQ4hJsN+9hkMDPkIWUMVD7WWIrZcFr9RTBaV/Dbdkwqp
 a4sJ2AdpAA2PUE1X3y7MA2KHI4yh/UYnTaCeMSvq4XB6zYV6iOlqXw4AzWzdeIQSUVq9
 bZZITXDpxJHCzOhdWnSi1QW+M8fW6dcb0PHGw5oGd/3IT/+jp+pwp0xSpSG4du+Q2s9C
 emoB/vrpL92A1NIHSm04QjcqmBUVDhirr8daaGv27dpWTTlGT4ApPkk3L+ZfgoFTiv31
 R6Z1zHoG73nGBqimSO/pkvSgYWgILnTppTVB6Mt6ukMTSLNjFVqbXJzstiBaqqRAcZBG
 VPfw==
X-Gm-Message-State: AOAM533xu8jonXspiUSaiL3k/tX+FeVwjuMdZij8F5Nj/Va5TBpdzW4t
 SInYpheh+MRD4PGG9hvi8JufZrQPXDo=
X-Google-Smtp-Source: ABdhPJwWaOcQT3eV1QR42G5c3xI4+oN/fsWG2O/MWYmDWCbrr7EK1TzIkMNssMP2UtfegaaqMBB1hA==
X-Received: by 2002:a17:90b:400c:: with SMTP id
 ie12mr6186342pjb.107.1623945086535; 
 Thu, 17 Jun 2021 08:51:26 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:51:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 01/17] powerpc/interrupt: Fix CONFIG ifdef typo
Date: Fri, 18 Jun 2021 01:51:00 +1000
Message-Id: <20210617155116.2167984-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617155116.2167984-1-npiggin@gmail.com>
References: <20210617155116.2167984-1-npiggin@gmail.com>
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

From: Christophe Leroy <christophe.leroy@csgroup.eu>

CONFIG_PPC_BOOK3S should be CONFIG_PPC_BOOK3S_64. restore_math is a
no-op for other configurations.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
[np: split from another patch]
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index e0938ba298f2..f2baeee437f7 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -303,7 +303,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		ti_flags = READ_ONCE(current_thread_info()->flags);
 	}
 
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && IS_ENABLED(CONFIG_PPC_FPU)) {
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
 		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
 				unlikely((ti_flags & _TIF_RESTORE_TM))) {
 			restore_tm_state(regs);
-- 
2.23.0

