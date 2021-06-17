Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 588343AAD8F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:28:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5DDj0Kgxz3dkJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:28:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IPYAnM20;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IPYAnM20; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5DCt3gqWz3c9v
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 17:27:37 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso5598415pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 00:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q3EX7CyG2rNhO0jlWhSISSSdZOa8xQTSkIbcAZ7IlOc=;
 b=IPYAnM20kkPd0fArHYlJu3WL296AewtyN7Cx6kaiuDMMoOKMsVVxLzc6Yov7dhAAh+
 6/oQpsFLhlpmeTpUgYFAo6q5evNJllTUQoj6X37sgAEgTpj8YJh3rRWTZ97YawLDNltq
 HoGb7+M6owGBgkQFILaXEc67I6GQ/SBcRQsJlzoAz4492iQRvaFgq2du+ruyOMow6AQw
 wqVNAiwvUzdqQTZrlm60ytv8Ok8n7JYFQygJ0s7KiewWqyU9ODQMKoamB+CXZlBCRmVm
 gxAuhcDaZWNvzkz+Qg078PLoE9emEt2orQxJbBJBOMwChxI5xoOyGqPE8P4KtTjDKUmS
 QXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q3EX7CyG2rNhO0jlWhSISSSdZOa8xQTSkIbcAZ7IlOc=;
 b=NI6lyRY5Vh2eWJQjmT5dEcuO6VtnHMbOClWqSqiFBO8oQsar2blMSFkyILem2K0Z40
 WgrdpBbPXD0MNY0Gzh/CW0SWlmr9Jm5Po436SeYgCew/a5Wnanu1IQSO2Vv6NV1d6PAe
 IZ6JkjGDBvqOYFc5hxokzkmZ1GFwhb4h0U1ZzG5b4F4ogH0LSSLyUigUjl0bzh55r9i1
 DHb6S1Sst0rCn4rK/Yqodw+XCoDzIfwzuc/LpeGyprJZB8kLTcVWPyq5mQ3HxQW49LGj
 TuztrZyqad1dQB8qrDIBUAVd4Ean8rI7uX/LM/5kRP88xTkjnMaKy1HP7nO5WNK0lfx8
 fCxw==
X-Gm-Message-State: AOAM530dOsEqC3B7pMSJk/10A50sJE+Lr4/z+2vyQAmdfJrk+cEcl8kb
 8GU2AtS2NlxzGd9Qzyomhg6R/rbG6gw=
X-Google-Smtp-Source: ABdhPJzG1f9h0FZ47mlK0uToNOTlI3hwF33lUiQNthJb9y2hTlAb1I5j5kpfnzLLeeE7dnOGmPJvgQ==
X-Received: by 2002:a17:90b:152:: with SMTP id
 em18mr4128425pjb.96.1623914853323; 
 Thu, 17 Jun 2021 00:27:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id h21sm3813429pfv.190.2021.06.17.00.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 00:27:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Fix for "powerpc/64: use interrupt restart table to speed up
 return from interrupt" SOFTE loading
Date: Thu, 17 Jun 2021 17:27:26 +1000
Message-Id: <20210617072726.1914546-1-npiggin@gmail.com>
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

This patch loads SOFTE(r1) with lbz, which existing code stores to with
std. This causes interrupt flag corruption on big endian (as Michael
pointed out to me, lbz happens to grab the correct byte on LE kernels
which explains why I didn't run into it).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
64e still seems to have an issue I'm chasing, and I still need to send a
fix for the cpu hotplug lock warning.

 arch/powerpc/kernel/interrupt_64.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 76b827ae849a..4bf859e7dc25 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -618,7 +618,7 @@ RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr
 
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 .Linterrupt_return_\srr\()_kernel_rst_start:
-	lbz	r11,SOFTE(r1)
+	ld	r11,SOFTE(r1)
 	cmpwi	r11,IRQS_ENABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
 	bne	1f
-- 
2.23.0

