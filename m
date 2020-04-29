Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 803F31BD56C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 09:07:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BqMt5bmczDqDK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 17:07:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=V5mlLmUT; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bq7z6Wr7zDr5D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:57:19 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id v63so640669pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qLGXGJfB1Kxz4TW1ENW4rnKz/McMbvO4oi+kq2PYQxQ=;
 b=V5mlLmUT98BhjwGWkawRt8flAEjEevHT2VjRAupfsFJgyhH9hrDmp9M+E7SSZXc5yM
 VXerhD3fQhfgyioXOWQ5mH4Lvjnkmra487kJov2vTPRUdMuJXOXR3MDsT4epuSnVT8lD
 7ppmF6phd/NxkdblL66TtJtfzVVMY/prIFC84T63HPIddAegKkA424N9CBHWy70Agr5k
 bBD6qiadRVF1fz0Lapr+6Ur6rQdouOwVOKGQhqG4Xwuic20qqG6t0R1DYXeeK7CecYjO
 18sxcrtVq4L2lSJMbu39obhZi3bW5Kq9FCi/DBmrJJZmF88K/BrPjmq4Ni2Q7bs5wZUy
 XimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qLGXGJfB1Kxz4TW1ENW4rnKz/McMbvO4oi+kq2PYQxQ=;
 b=O4T7IdXsL9Sap4Ulhd+jRIbbbb1LOKzFp8lJsMqNgz3ECQpIfOt6KbvY5q8dgWgr2u
 z8KTnXCVAu8IOuSv4e1j5mY4SdqFVdXlFPGR3uei77cmdRNw7OTyJj77w5ClA66fTkDC
 FmUm4wfVyCnSG5AMxA+WHf64rKZ+xLvk+kvbSz+hvUACutYnv89QsZH6eHdmiJATcG79
 qoCLZLuVVkjN3PoS3iCPuPEapsXgCbX+VmoH+f5sbvDSSVnmZ8I7/BalYaGc/C5d1UdD
 veHirwhyPGxDlZgVQKocrBo0wq+Kf+D94sd2zeHKuCSKCyPPNSfbxybPjiUGonVdsQ7E
 Uajg==
X-Gm-Message-State: AGi0Pua0urru1sQbqpeIj/y9leFWPSMyBqCCPtJVDDIuyp2hLW8dqPMP
 faXbyHYL7+jGj8QRuKJDtOXvRQ6z
X-Google-Smtp-Source: APiQypKVJAhASBwKKQZI0kDPRRpIYMhD8G6ntNufujfzZxpiLG6fcfImR8c1ZsIYnuhDhYg4AS90xQ==
X-Received: by 2002:a63:4383:: with SMTP id q125mr29902920pga.27.1588143437470; 
 Tue, 28 Apr 2020 23:57:17 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id a26sm254660pgd.68.2020.04.28.23.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:57:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] powerpc/64s/kuap: restore AMR in system reset exception
Date: Wed, 29 Apr 2020 16:56:52 +1000
Message-Id: <20200429065654.1677541-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429065654.1677541-1-npiggin@gmail.com>
References: <20200429065654.1677541-1-npiggin@gmail.com>
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

system reset interrupt handler locks AMR and exits with
PTION_RESTORE_REGS without restoring AMR. Similarly to the soft-NMI
ler, it needs to restore.

ed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 728ccb0f560c..b0ad930cbae5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -971,6 +971,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
+	kuap_restore_amr r10
 	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
 
-- 
2.23.0

