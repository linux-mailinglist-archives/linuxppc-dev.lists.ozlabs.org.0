Return-Path: <linuxppc-dev+bounces-13562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBFFC20CBE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 16:00:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6jg34DKz3dVm;
	Fri, 31 Oct 2025 02:00:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761836423;
	cv=none; b=dcnFbq4YV/PAYyPgza5wYc+gQQ862Qs0bdkMeNaSEBWXOlgmfqTEf9r0TWXnw+slwAMHEvcxF3j2GmpjFLJ0HLeesnDdQo22xcAVZCl1rpbGW7A7CslOIB9EDLkDAyiu8CsLKNO/dqLy8RLmojJxHrHsUcx9gxhx1iwKYFHMEloTJpBx2gWZ+WdAj7iqXClq2hwSVvHWVHIvfeHU9F1SKAREwZzgQ+i7Xoxl9zLh1iVu+LJtjOdWOb3TDZab7dTC8HOAXn4BZBwZAPSRlpHQoCELRJ8dPpLkUOuulD2UO6GkVGP5MTK1Vxo1PwA7z2/vk6x/lXRIJmzcVJYxDHtIhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761836423; c=relaxed/relaxed;
	bh=DhaabjmFAIB0XgSSf35H2/XE/U4Ou9qluqMoX3YcY3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5cSu2WN0O25I22hqsGJZsj6+C7BUIHZqUsh8gAsYMSK5jstQD/2MkP5Me8SAoVPnkf1F7tCn5BkE+NGwt78K+cKwWsaJDM/iSGoYZtzDdZtu1R6c3gDvwJ33wi66hieuLxpPSzDLA+ssOzUJJyrt3J3hbFBujGb2fdNY/CFgfWp5PlahLLFlEn5FdVJP8tL9ZUx+hscMZFLMYXhgm+4G1HLWFlYBUpabg+MIaxGXLLblGM1a7vtnXCe4jBRiwmD3DWMLW+7wvlzW08MoHwc7UBL72NVs73vS2U5AdzTxjL9ma1nC6x7rlkCi8QacQ4LvdKShahjIzMuM+XVZbIseA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G+O0XBxd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G+O0XBxd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6jf5tx1z3dV6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 02:00:22 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7a28c7e3577so1210618b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 08:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836420; x=1762441220; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhaabjmFAIB0XgSSf35H2/XE/U4Ou9qluqMoX3YcY3Q=;
        b=G+O0XBxdPeIqFcB+oMiyy+PUpBQEHUTgoyaaKc6p0cvHkt+VsmMw7OJnuvxHvU8g+f
         GVvUiLpdEdeCuE7ThGQUQOnJuBfN1KgKBFpxOL+GNlwScwn0XvkdjgFjM8VoCD4FDt4F
         21ZxNgIenPWQxW/CUdx2apYwzPmjzGoTdTT2cnhl9lVTV015yuWrbQD+LDM9ezKhLtBh
         CD9IeKwhB1K8wLkkpMYlwDRiu9UDHtflu0qMOm09VxX4e9q+i5rIvCqMqxZJxYPNCucq
         hWzpkt898td0x3L9x8a4bPD7huhXXmb7qQ29aCHtPG4HO1wCeEO+JeVW1wCnHdQSGJAz
         wxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836420; x=1762441220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhaabjmFAIB0XgSSf35H2/XE/U4Ou9qluqMoX3YcY3Q=;
        b=ABTKt5GtUpMpvlMZPVQ5bITjSk9s4BXxiY9xn4ifHg7fJoY570vIgLqKAnyXxqVoUw
         0IhxEw9kCODWCDBqwnYEmGgY/BztX1s1L14ucGzCd2fRtO2SY4kffrad2FEfqdgPTRGf
         HWhSnEuANwz3IoryQTqx76kXEN/eJ/RfDnZbQa4cMhfs1Iu3+1yrxARewhNIhtJoaB8e
         jZ/ZckdclWQwgiCiyO4emH40ejs9QHBA515/aQFrgPZAC56HXznsgoxBVyam+OnfYd1H
         N9EpwYYxBztpYvjIAe6UnY2zkRv4gJj3QaXzYpL+Ealihovl1YtmJHVXClw9WEtc4aoc
         ntuA==
X-Gm-Message-State: AOJu0YzCkacnmqr9HuOwn1+9QOaSMbmOhajlhHZpBzoih6SAJ9sdd6lQ
	fDFBwGWoZmWDayhSsTt4/CzkiyWv6yZKFwtJgJIQaOBf/kVStjQAGAWcLk48jbD1
X-Gm-Gg: ASbGncvtdoA2vtCOheuxddYNijFOwM3bAQkWYLE5Q6zubmyY0kA1ZN9Y6nf4kVBeUyM
	xLamrTLZt9XtyDppoCJ2y8fYxSmTHc6WBXN3CsbNPl4HeePYsdPMNNGGzHCzLmpwRHanMIsdgEc
	hgZPZQn7hQNARbi6+/Y4Qp3LEgVM08ALLeN6qDPPYGpvJbZRTPIIBC1aXWeSjB5F0NDRJM9D4ho
	WrSVhezMWDSe/pgGQI39+dCUnrPmtiodtk2BHkkG72CnB/F3Y/pXoUc3tQczFVQO+krJDke291+
	Rtx5G/SpUhr8nw36kd1EkT/WA/tvFeZW35M06feHomQcStai5cXhvzyS7JNzYUP+kSvzZmZJ3Bt
	k6EbOAB/vmogqFIdkjqyu/zVe5hcKjxRKPwjblVNI5hoBy3MJlNo6aqsJi3IGYdJaNbpfSg==
X-Google-Smtp-Source: AGHT+IFwHjQoAHIJSRbBSXA7LUEAKcXlW0OYr6D9V39n+GHf5S2tNINFzkvI4PMPhJTfYI7Aat+MuA==
X-Received: by 2002:aa7:88cf:0:b0:77f:1ef8:8acb with SMTP id d2e1a72fcca58-7a624c63b65mr4610764b3a.13.1761836419421;
        Thu, 30 Oct 2025 08:00:19 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404987esm18594112b3a.36.2025.10.30.08.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 08:00:18 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	Pavithra Prakash <pavrampu@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 06/11] powerpc/64s/hash: Hash hpt_order should be only available with Hash MMU
Date: Thu, 30 Oct 2025 20:27:31 +0530
Message-ID: <99237176a51c73e85f4a7edd60a2460017882d69.1761834163.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761834163.git.ritesh.list@gmail.com>
References: <cover.1761834163.git.ritesh.list@gmail.com>
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

This disables creating hpt_order debugfs entry with radix mode.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 2fa98d26876a..e63befc96708 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -2434,6 +2434,8 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_hpt_order, hpt_order_get, hpt_order_set, "%llu\n")
 
 static int __init hash64_debugfs(void)
 {
+	if (radix_enabled())
+		return 0;
 	debugfs_create_file("hpt_order", 0600, arch_debugfs_dir, NULL,
 			    &fops_hpt_order);
 	return 0;
-- 
2.51.0


