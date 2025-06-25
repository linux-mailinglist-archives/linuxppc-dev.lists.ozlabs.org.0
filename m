Return-Path: <linuxppc-dev+bounces-9752-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B040AE855D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 15:59:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS3Mn6V3Qz30TG;
	Wed, 25 Jun 2025 23:59:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750845188;
	cv=none; b=fFAlyNVzAdJJE+wgCMTaSkcZjVrJIA8ENcIrM4ddxWi6bIqOuAWFIt6qkmHejCAJTZxPSDINSLdFGJRVAUH0wUYTHhrdnBa8YEkYoqTJh7OBurn33FPoFYieUeeOlE77lWbEMM0TTpWO3nB1bFZ1/6qoMzyfS30Xhsh+Y3XmAdwqvS3MQA+n0ntLML1pIPRDtSeWL9bA4HKfum2xaRkE+U9uDLX5er7gJ2UikHZmBcQN/7s8yZNkmpFoNi/Fe3AAwbYtIkyMy58e6PFa5TYaN+q0OAq+ftYs9BQpydTbrtZ2VTo7YReQeg5gyriJwg88ph1ZEl0nUnUEq1RnL0ECvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750845188; c=relaxed/relaxed;
	bh=m8+Li4ZqAZW0QY7sIIldmBLFf6VQ+4AeP6Iv95ugt8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hH9PhkfIp6IZHiVrci8KYOaiSlNxCQyOCMzuLkezC4HQpdV2wZOrMjUqcplOZHEV0ll1ieWUzcJj4iaRUhbODbHmJfz66YrGLNXZkoGUaURAqJg/rXZzdRwxo2vVtseaUvf9H3swVUHllUqmG9CMemw29zRDrTeMRgXGa9SdWyQ7AeUEUAU+fd6hGT9N8CcXP3rJDFoQ0XvjRn2HSJa8hk9mQLcJaFATn01HEiYdmopNJJj7dB2yNH3WziYSToHe9FgLWh+KSFq9Y78oYl8uZ6NcRVip+3su8/2fAuAvGVf9ueCqSGdjOBHw+1zkC05z5eDa4GBaXPPMLGP63M+z/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=imrudxgr; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=imrudxgr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRxvk4JFsz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 19:53:06 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso16443581fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 02:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845183; x=1751449983; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8+Li4ZqAZW0QY7sIIldmBLFf6VQ+4AeP6Iv95ugt8g=;
        b=imrudxgrq3RUV4CY1wxuWji14YECfswQqw5ecdFbUxihe+Bb5fCd7TGMq8nxQlmHmI
         1QGOwRjrBurvyBuXsOE3sFWZ3k8MhYcmDOxfmbd5j+Xk562EGxFVontiZBmw9gUH0h3/
         2UOSw4QXvc6lz/PEF5tSZuMQYfslQRRiofeGS+OVQ4knCDRvDqqmOr0udChlDGeAsytD
         O2vc0r23WNhgeqWIABYvU8GXJGDAXM6jRstnbPBQYK//HabO7pH+uRBp1ORlhAGQZA0b
         w2+Zejiy9/xyeoddE0CsyYKH3DxM2Qe7+qfOUq+PlTClimTUuZAAck6OHiqcA/BsyZXv
         MkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845183; x=1751449983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8+Li4ZqAZW0QY7sIIldmBLFf6VQ+4AeP6Iv95ugt8g=;
        b=PnseIRMK8MLFBgW8IROPqKxddcBaax/13X5ugaF3K6SXZgwo3f4gqHNXKCJOgJFAVh
         0WSUHPCXHveS8fc/9QotwD0kEXyBokWFKHwdVDr07sXLU6OVCqE+TCLk9+302/UgTkNR
         +XITtRnwJyB31GFSYnWJFG9SHRda2RiMCWSUfuOctXUC142bB3XgKpX06XpbpRDZUj5b
         MDO2CZvpunCUYuwnlGMqNjO8H0Ye4/lpc9A2JLBlrLJBrOzHwqCTJt8H2vSEl7uH31ly
         uUenhufX5uPZ6WCE/pPEptm6JKWNQF64C3jckAQguHOpSe7XSJN+Vx2bY/w4vuk3QkAL
         COxA==
X-Forwarded-Encrypted: i=1; AJvYcCVZSgpPfwHuT5SLdhnztPgbeniKZBMz8AiYgmxqaL0GrU50XMD+0JgzEAsoABnmOtlYtd1bVYLYpI03qAM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyCBA7AqdGvwju/TOkD55F9JaIDAuyDH7gIMb4aeXIzA+N/19Wt
	ghCTpaMIJW0q8XJQPZjMnSMW8e9aTNRNFAGV2QYrwrD6C/4dpSJ4X4zp
X-Gm-Gg: ASbGncts0uzOgGtPO/XNUDUu2QPu3+0u/rc4Fkj0CScr/RV/cqnIjGcwlV0aYvk7kge
	x89sH4jaDnwdJXJxjQwmK0SOg1ZkZXdiJeRlxNFC5KGYsBjVxrU/h3PdMX3fsoUJ5+A9mnRpXiQ
	g1qo4XQabEa6ydfIdErIfofRN9Qp0YrNv9RFBRB6l9ypKcX0PSllVgd9DJYic6dqW84vZ9ypXTC
	iylyMlzm7R2f/JMAuh5HqKxd2Uhm7wJlIWydWDd6m7KsefieYe8CtpRYQU0CFgIIze3OFk1CpLx
	G0AOKNuC3Dz/J5gybRvnw06e6/wxHL3f+kdMfM6j0XQXaMjEwbt+2ocn2yvXEP0ZuEw0Pmd76vn
	JaxjVjCqPLAco9sbs9HTv5f5cdJJsKw==
X-Google-Smtp-Source: AGHT+IFM+6Gp9FKNRVxfpjNXcdXOUjE/qQpWABAqK3bSElIsQlHP18BbIkRAqZ9Oq2fiOL+vDX3DJA==
X-Received: by 2002:a05:651c:e11:b0:32a:714c:12d1 with SMTP id 38308e7fff4ca-32cc649716bmr4987311fa.1.1750845183165;
        Wed, 25 Jun 2025 02:53:03 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:02 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com,
	geert@linux-m68k.org,
	rppt@kernel.org,
	tiwei.btw@antgroup.com,
	richard.weiyang@gmail.com,
	benjamin.berg@intel.com,
	kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH 3/9] kasan/arm64: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:18 +0500
Message-Id: <20250625095224.118679-4-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625095224.118679-1-snovitoll@gmail.com>
References: <20250625095224.118679-1-snovitoll@gmail.com>
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

Call kasan_init_generic() which enables the static flag to mark KASAN
initialized in CONFIG_KASAN_GENERIC mode, otherwise it's an inline stub,
and the flag is enabled in kasan_init_sw_tags() or kasan_init_hw_tags().

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/arm64/mm/kasan_init.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index d541ce45dae..abeb81bf6eb 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -399,14 +399,12 @@ void __init kasan_init(void)
 {
 	kasan_init_shadow();
 	kasan_init_depth();
-#if defined(CONFIG_KASAN_GENERIC)
+	kasan_init_generic();
 	/*
 	 * Generic KASAN is now fully initialized.
 	 * Software and Hardware Tag-Based modes still require
 	 * kasan_init_sw_tags() and kasan_init_hw_tags() correspondingly.
 	 */
-	pr_info("KernelAddressSanitizer initialized (generic)\n");
-#endif
 }
 
 #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
-- 
2.34.1


