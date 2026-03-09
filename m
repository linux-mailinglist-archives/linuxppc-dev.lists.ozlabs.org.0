Return-Path: <linuxppc-dev+bounces-17930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFPiEGgOr2njNAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:16:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E59023E73E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:16:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV4tp2p7Xz3cPK;
	Tue, 10 Mar 2026 05:15:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773080130;
	cv=none; b=QB3l1/OModJb5TFE+uxAh6RGs3kNFvIcJrlFVTaJewFbX5B7QuyH1pBbLvhlHLxEY8Lu3lhqgBxs4SXh+aDv1MuLADGOSEuwuhkJ/SQ9S1tWwAauFyyPn4IyZWgqPIRTXq2BcYIPh2A2/LScxCPcdfxuT2pqs8uG1FE45PSSCiOHzafd0Mi9OXDt/T8iztKq2XDcqs495rKmfNugWSJyQ8A2gIXTPDS5vxrHUfrzpDNOeyxWeDkaY7trcMvD9y20VSSM9wojTJPIm7pmIhS4ExVRCFJi0NCIuRQmT9alfijYIbsTRh6UHBFt8cl9i90oAgFow9uIJHZBk+ZSpBJlwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773080130; c=relaxed/relaxed;
	bh=tHf8MvU2Vn2zfa3e8pClxbVH5sJkfjrHrBwS5gF12JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwnAqOhvhk6+5aJGsCiYkQIuAGJ6d/PLILa93BoyBnxvmdZG3WgydODUjGfWnP7i0QnnguKlkWxCO9RBoWmG+bYf2IEHKUICoKmKWVbge4AAk7WQNPWNIXzB8ZV9RBSrEsj6nwoJNiNHYazPrwInsNbrc2crmwtd8zzKlIkKv6KPde0v3LBZ7cIXyOrOBm9OBcLRbnUz2m0jR4lhwc1lQuTkmy9WrWDwQhbLu/sqqzmuPMbZs7upuiTDmNFnN/+t0JrFIT/iOtqXoi9/ZTpaWs7oW6qVl2yj1Qg2xWhYCpGBaSr7j9yfIu4CqHnUInIf5zm+OzaNZOCkY7f7vt7FnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FhAatSS4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FhAatSS4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV4tn5Njxz3cBW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 05:15:29 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82984c077b2so2101193b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 11:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080127; x=1773684927; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHf8MvU2Vn2zfa3e8pClxbVH5sJkfjrHrBwS5gF12JA=;
        b=FhAatSS4QPbBjOJE0GgF6Ki6mb25eTn114OIUWKR4lPsJcht7oA4wWx9q38tpTqY/E
         bQ+ld+V2lmmgnwxaa1YnOyAxamPxZ7tlyM+gCPNtuNuW8b1BVLNksllthIbdCBM5VQ3g
         ACAE8okBLiYcjGiLGD4FOr5R0jRpqKmdfFP38MITtWPqKOGoYkCREyr1D2Q+4ci9wo66
         5hDYnXOH2FRPtMeqXAjz9Hly7SEfFKsGLwvrqrk01mEx1n7E1YsdqOdApiS4poKoY8cp
         vgiCs+uXGIyQdqWgQ1gb/zZhdVluJSd/aqJSaios4YelMT9487b1KYVqfrepeg3k2emk
         uhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080127; x=1773684927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tHf8MvU2Vn2zfa3e8pClxbVH5sJkfjrHrBwS5gF12JA=;
        b=WnAZaxRkIlxMFh6k0C5h5YnjxZ9lUhFRaDzqMFgX/8Mhf6vqZnQUBnv9nN4saVg3SV
         CBsNBwWBS6e/cl0a/gVZDNZgBLoiVuAUaeHLHE6I6L0pk5/Oxs0NXGNiMDMWJ3KbCIHc
         lqqQSZhDv91U1k7UC1ruj6JxgFfmSnc8qwLNydmFL1absZp2j/RK2gnBJkaYHQglFh08
         yYs4ONi6zVxDKh9WsmwHtd1EnAKHILsRHu7Qgrg8YWRf6hPio6phG6HcyE8N+BuOo/Th
         /AVZynzFRD6O4BmfMhXPJnbCY+s7FgoGbHhtoC7eChIjKm81/wGVJmvOJBSJIeJonWbV
         2RQg==
X-Gm-Message-State: AOJu0YwogU2I4200s8WijFHE9ntrGfWHIzTxLtdl+3pievzvN3YuDYkt
	aX6mJer1itaV7rXpVoZhROvb1ssm7teTfz5MfpoazUICjSVed7I/h+/vs2sttqrb
X-Gm-Gg: ATEYQzxPWxdBW/8lIqjfn3qSRbZ18Wtc2k5FQ4FB6gYHBIAkh+aZhcn+4cUAkItfeL/
	3e/FMbUfvHpIqEDBWKEFVI/M9Mki8fMlCQl5tlJkThYxkVw7dIQbL3fn0V+SP59clNK+lVk2ZH+
	gKslCAfa/DC+iFiQ00HFgFCbphddS1veRMT/dTaYeYtRBVhkGpyEhpBimnAqrPEGMRdRkJm3oEj
	dkNZP/eer5tqtY+2aeoNZmxJ5zGOZ6fgOSskg+yx3aL9tIj3qwYGY2j6iyxz3z1hOCHKPwypSNw
	GMj5+1RUlvPTVTaWr9bMXUfhX2LhbuWbQiKWfNsLJRi3yuYPiDkQl5USerJTRMrjWYGTKrsamlP
	3MPtAFiPvb0tZ3iyhTDJ+bVjai6QeAHEaNJZ+f8L0G2b3jjoSuUGK7XclN/mdDbPuQm4yNJBLDJ
	gMOjVFIsqLFJK82cY0mEJ5+F5Bm8eiQZHj2YMIpRdggCcTvSAiYf4kLVqOxlnJHnGH
X-Received: by 2002:a05:6a00:b483:b0:827:3946:a236 with SMTP id d2e1a72fcca58-829a2dba523mr10023041b3a.9.1773080127281;
        Mon, 09 Mar 2026 11:15:27 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f29:53c8:742c:4036:d7c6:9024])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm10775477b3a.29.2026.03.09.11.15.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Mar 2026 11:15:26 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sayali Patil <sayalip@linux.ibm.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 10/10] powerpc: Print MMU_FTRS_POSSIBLE & MMU_FTRS_ALWAYS at startup
Date: Mon,  9 Mar 2026 23:44:33 +0530
Message-ID: <c37a9f314a723048d25aa5424f7ede8eec691d86.1773078178.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1773078178.git.ritesh.list@gmail.com>
References: <cover.1773078178.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 7E59023E73E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17930-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Similar to CPU_FTRS_[POSSIBLE|ALWAYS], let's also print
MMU_FTRS_[POSSIBLE|ALWAYS]. This has some useful data to capture during
bootup.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kernel/setup-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index cb5b73adc250..002b312eb7e9 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -866,6 +866,10 @@ static __init void print_system_info(void)
 		cur_cpu_spec->cpu_user_features,
 		cur_cpu_spec->cpu_user_features2);
 	pr_info("mmu_features      = 0x%08x\n", cur_cpu_spec->mmu_features);
+	pr_info("  possible        = 0x%016lx\n",
+		(unsigned long)MMU_FTRS_POSSIBLE);
+	pr_info("  always          = 0x%016lx\n",
+		(unsigned long)MMU_FTRS_ALWAYS);
 #ifdef CONFIG_PPC64
 	pr_info("firmware_features = 0x%016lx\n", powerpc_firmware_features);
 #ifdef CONFIG_PPC_BOOK3S
-- 
2.50.1 (Apple Git-155)


