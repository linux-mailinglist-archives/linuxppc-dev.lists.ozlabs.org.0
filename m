Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DF243599A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 05:58:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYcj5Pnsz3ddt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 14:58:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FR8934zW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FR8934zW; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYWy4KkFz3bN5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:54:38 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id s136so21147466pgs.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+n/orxsGE5Dy6sCMbDmnBv6aqkBCkukdq9o2NqgSIg=;
 b=FR8934zW8ikw35aCJaLlu64iE2OHjP0VXdud7pyi7Uphe4iw2vBNth9WZobh6a/Cj0
 MZfeur+QKUqaylHDm4Gi7jdh0DrAYV40WXk2RNROo9X7YNN7gWMMTyyDmGpPXZ1aHhVv
 qt5ejT5hfEptasSYAPEOIkvc/9LkS08dUmufVGPHdE+nJu3qAl6rY4Ckp7WF7htrKH8N
 BN2L9PLe5w31eIgWtnM00PiaYBmKY4F9Bgk+fCf2+ubN4OymZ/yiDM7tESfi8KLqqTAb
 +488jb4r6kQNRjKgIxMcKMnmVrgl7/y3P/i31UkVpkgNgkU0hd5RH4193RuRYYUWIeZq
 EryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+n/orxsGE5Dy6sCMbDmnBv6aqkBCkukdq9o2NqgSIg=;
 b=hW0xvfQhtbGWXLTAe7/m9ZZdUlhEAdwKODySUQYRUKyuY1UtFrEYKtL5YRrrymdopD
 HPJYWoLTVK2ZMH5tmHdsySDHaukWw1apdmoBkJzX//QvtAN+FJT8coF99zdgM0ZBdPxI
 8SRIofOJSOefSvOi7KqxMy7zWwXH0nil8sD0m/Vv3t0M5Dxa9GzqOeYGTGcuU+hE580w
 jxBaaqXgjRx8lEXghmUYYJFhtS+2NXZpYfPNU31zl4lP84UxlNBdWht6+nOEtbsdYko5
 a3On18dR7y9T/rCJ6icaZv/TToVqM4SkrVVEV28y6zJA8itTJidffmUx22h3K3eQFTjX
 pVLw==
X-Gm-Message-State: AOAM530hxTtSdJahf/4zOoj4zsskU1fbhx3wu39ac4Kw7ibLenCa3YDn
 YJH8tLWK9s9bAgS2dlZityoqiVyPnjo=
X-Google-Smtp-Source: ABdhPJx5voNFww0gTE/ORIuDjA33A2gr/b4byQ/EwxDdIDTNnaUOf7KuonOLIEtv+6cN90v3gOLRVA==
X-Received: by 2002:a05:6a00:24c1:b0:457:a10e:a0e with SMTP id
 d1-20020a056a0024c100b00457a10e0a0emr2774878pfv.63.1634788476066; 
 Wed, 20 Oct 2021 20:54:36 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 06/16] powerpc/pseries: lparcfg don't include slb_size line
 in radix mode
Date: Thu, 21 Oct 2021 13:54:07 +1000
Message-Id: <20211021035417.2157804-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021035417.2157804-1-npiggin@gmail.com>
References: <20211021035417.2157804-1-npiggin@gmail.com>
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

This avoids a change in behaviour in the later patch making hash
support configurable. This is possibly a user interface change, so
the alternative would be a hard-coded slb_size=0 here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index f71eac74ea92..3354c00914fa 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -532,7 +532,8 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 		   lppaca_shared_proc(get_lppaca()));
 
 #ifdef CONFIG_PPC_BOOK3S_64
-	seq_printf(m, "slb_size=%d\n", mmu_slb_size);
+	if (!radix_enabled())
+		seq_printf(m, "slb_size=%d\n", mmu_slb_size);
 #endif
 	parse_em_data(m);
 	maxmem_data(m);
-- 
2.23.0

