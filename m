Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE3E64EB19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 13:01:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYSPD3Y0dz3cD7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 23:01:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Xau4JfzO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Xau4JfzO;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYSMM6gCcz3bV1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 22:59:43 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id c13so1625624pfp.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 03:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkK8Pzds8OKBNuAjNuAFouO9VU2uQ92WQMSt5dA+bX8=;
        b=Xau4JfzOXLH/qpYXd83cOlucScIkfAGiAsElBDfFWtUK1hdDF5ENOBF7FyvzgIsHxV
         3B5zyqi30S23R+t9AmX5ZHXFPTNiIA649b7zs31WuPe66XuiZg5WY10bgH4cvIxNnTCe
         8t9jGmf/eKWIRBtQU35we8r4GpoLL9ZypxJqPStw4SmbQArh/mRe+/CxXR9q36chgiGY
         3FhbxoOwbxTQa4GtSoPk2dj2i11oMD8qkeQdRldRWTwOhaWLSVQKOl4ZpZKNvQfO1V9F
         DjoilcHP1UMBwqn2xy4ItQ7IA2DoUe5sjyf5BT4xi82uqK2LvcMBA3ZJibmZ01B6UkjZ
         1VcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkK8Pzds8OKBNuAjNuAFouO9VU2uQ92WQMSt5dA+bX8=;
        b=afiOpdoOdMHucACDmYJSnPmw6ZrnT3MAG9/ossfW5cHRi15OCTWuNQ9SIWdoLaThTI
         eYlTMSJNSjf3ak1MdIv/bGVoC3pA87HEZazgZIZeFOFasz0UTZuypPWHOm9GOyG5xEPj
         5S4ada+59jxt9oQ/CvjOqMVOMaSgbpo++89jnR8XE6xpmc9M5DRJtw98Wfddyvn6RTz/
         SokTmGDMYMBgr20yerCER3U0aFXkQ90exrsyVcHKsD3M+059C4R+xYeo9gkU0EfCPOSd
         TgkHQ/vSvYslDHmqUClMLxzCiTuHZxdWcjaFL3Ne6jtQRxY7cAJHqu4adXW/gsgitRo/
         wCFw==
X-Gm-Message-State: ANoB5pnduuwfUZ5zRNIJZUovtRiNmW8tzPL/FFHuyP592z1uEzfjT7UM
	ttuLgymSU8up1yAQa4fGNSZmjA6nxB/71Q==
X-Google-Smtp-Source: AA0mqf5VTPwRwijvxJ6ngo6MZWHmC/Z6CjFq6zKO69fkstHUS/HZKnRBWJXYUECXiKL7bw6khOw39A==
X-Received: by 2002:a05:6a00:795:b0:576:cc71:b8ed with SMTP id g21-20020a056a00079500b00576cc71b8edmr27886965pfu.34.1671191979361;
        Fri, 16 Dec 2022 03:59:39 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-236-36.tpgi.com.au. [115.64.236.36])
        by smtp.gmail.com with ESMTPSA id g22-20020a625216000000b0057ef155103asm1289438pfb.155.2022.12.16.03.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 03:59:38 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/64s: Fix stress_hpt memblock alloc alignment
Date: Fri, 16 Dec 2022 21:59:27 +1000
Message-Id: <20221216115930.2667772-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221216115930.2667772-1-npiggin@gmail.com>
References: <20221216115930.2667772-1-npiggin@gmail.com>
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

The stress_hpt memblock allocation did not pass in an alignment,
which causes a stack dump in early boot (that I missed, oops).

Fixes: 6b34a099faa1 ("powerpc/64s/hash: add stress_hpt kernel boot option to increase hash faults")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 80a148c57de8..fa1c148e1f50 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1051,7 +1051,8 @@ static void __init htab_initialize(void)
 		static_branch_enable(&stress_hpt_key);
 		// Too early to use nr_cpu_ids, so use NR_CPUS
 		tmp = memblock_phys_alloc_range(sizeof(struct stress_hpt_struct) * NR_CPUS,
-						0, 0, MEMBLOCK_ALLOC_ANYWHERE);
+						__alignof__(struct stress_hpt_struct),
+						0, MEMBLOCK_ALLOC_ANYWHERE);
 		memset((void *)tmp, 0xff, sizeof(struct stress_hpt_struct) * NR_CPUS);
 		stress_hpt_struct = __va(tmp);
 
-- 
2.37.2

