Return-Path: <linuxppc-dev+bounces-308-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C669395AE8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:14:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDw071kcz2yZ3;
	Thu, 22 Aug 2024 17:14:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::22c"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TWZPtvue;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDw051jPz2yZ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:08 +1000 (AEST)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3db14339fb0so294269b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310846; x=1724915646; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1mpKMHwwZ1CFkcRRT4IxjhKZ5nh5A3TknIoqewquLI=;
        b=TWZPtvueDriJIMI6gtUVEu7qiK1ZbgeQjRaNdAxxh4I4++Dl23p10U4iHNrvnJsARx
         ejfBcA7cdqPBMQx/Hdxtg3yZiiv1Nc8js3X1bVEjyGklwzJsHRWXajf0PGra+OQIH+eI
         kxSgBXdP9SeK0c34pRi6D7gPg8NA33rMno+sb8//FU+2LChvYuSSUAnWUzgVAp8ebAEv
         FCutsfAm1ETJ6/K3VvK4XFr6wayrtQTZIzYQsfAIbZvkk6AVHqoN/ioKkFb0KDwRN7EY
         eq6yFfOadPO9yuFbvPvFqHwrAnugjp6ctk7GVGXZGJentXFp1wlaoWpKaegloZMvmmKu
         3pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310846; x=1724915646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1mpKMHwwZ1CFkcRRT4IxjhKZ5nh5A3TknIoqewquLI=;
        b=g9ZZWGxtvfyf2FQYZw+b3tBLYyVx5gwOMIlduC+wWSNWlQ0MfNRoPIo7ZCvpOtsM1z
         euVXtx88GRUiDIZsqcCIlj59Ja1rJpyvyJjiltz3f6g3FTrjHpHaLxZxdfesbnAcq8PP
         iB20Fil2WTyySQcDE0WoLeytvPS0CDwG3+DakC3enaopQA9AH+iECI5R9AVnJEEbaiER
         X2iYC0AIS040jmPR+eF/KiP210+6sVytsh1ZhXlc0xpoZq/d8Std7YZMyC2CR0d9ItqW
         Jtafeh8F9LsItg0/y7iFsk0LQ5+/a/SB+dJUSSDvoHXNG0eTEJISDLspCjw+WXpc6Fu8
         WVtw==
X-Forwarded-Encrypted: i=1; AJvYcCVF28MoDqmE9sAcJLaWpxe9IybqjKGRWvmCTSACBeKNSimLAA5VHGQ6Qbsnr7UidvtL7MdTC70L1j8pqW4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxA6tzgdMc67PNeROpRw5R8bVjh0W0/SG2skaz+YJxkzXbE0ocz
	HMMBD050tU9QdGWSU726zlpgDKDv6dc0n1dA1zuQGvEHDPGvVnkrKP1ruyjH4g8=
X-Google-Smtp-Source: AGHT+IFDX2PqWoIoI6wCA8pFxmw/BmBf/PDUvtd9hijDBvTgLhn0KCKCIBnod1yVuIa/+/M4c6qbig==
X-Received: by 2002:a05:6808:1a08:b0:3da:a16e:1764 with SMTP id 5614622812f47-3de194e0e97mr6243309b6e.4.1724310845744;
        Thu, 22 Aug 2024 00:14:05 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:14:05 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: david@redhat.com,
	hughd@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	vishal.moola@gmail.com,
	peterx@redhat.com,
	ryan.roberts@arm.com,
	christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 03/14] powerpc: assert_pte_locked() use pte_offset_map_ro_nolock()
Date: Thu, 22 Aug 2024 15:13:18 +0800
Message-Id: <89ae94f722996b4ee7ef20d44cd7f5e2f0495c47.1724310149.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1724310149.git.zhengqi.arch@bytedance.com>
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In assert_pte_locked(), we just get the ptl and assert if it was already
held, so convert it to using pte_offset_map_ro_nolock().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/powerpc/mm/pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 7316396e452d8..61df5aed79894 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -398,7 +398,7 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
 	 */
 	if (pmd_none(*pmd))
 		return;
-	pte = pte_offset_map_nolock(mm, pmd, addr, &ptl);
+	pte = pte_offset_map_ro_nolock(mm, pmd, addr, &ptl);
 	BUG_ON(!pte);
 	assert_spin_locked(ptl);
 	pte_unmap(pte);
-- 
2.20.1


