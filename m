Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E61938231D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 05:36:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk4Yl334Wz3cTV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:36:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lGaHC6Q/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lGaHC6Q/; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk4VY5wGJz2yyL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 13:33:57 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id 69so2362731plc.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 20:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hn7unOXRknxUolKeI3R/RYUkNJ1IJ3Em4zYkxuuGOMo=;
 b=lGaHC6Q/JYRei0Y+jn2Wh5MpDK9oRT5GHJusOo3rl5sfJn/FPOxKJ6SHZ7cQ09E54l
 UTZyi0YSTiOlItepSmU9Bb+uSEwePJ6bI7rvDYAY/VGLBwjWgRbBdWHMW5jzY009A29L
 LR1154TVVU5QFzD92B9ZSDPROHb6tPp6v/BOJHeZ+pLMXk6Y6vj5Xv4MZ2NP9DcI7sZY
 9bdsL8OuQ87RtZDYIAGI0khCnCravq2m53lxLuA0nIje+iP2+udqFyVInre4ix8p7VOT
 DTm3Qpoe1zkgW5Cq97BzqSosYEnHE1QzCAmWD4kT2dqGV06Hu1Wf8KoGfKhGaeDPLMNT
 FYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hn7unOXRknxUolKeI3R/RYUkNJ1IJ3Em4zYkxuuGOMo=;
 b=Z/qZ5klWimyx1PUv/uA+/k1Wo5pnr71Zv83/nBx4FvAkQxOI4p5eegb4AINp8DmWFc
 YizEcnrl/7fxvE7YLzrDvU8YElXFmtNmMu5dozS9PWDbqUWHKDxcb0C7hqb/ll4KlTKe
 deAUeyNyy2M/J2bodsfdZVUKjTtMNe8nDTKAa+z+6U2Ku8GrvrKS4MHLYzfqGvGYl3hC
 yFh7gTMOaY816oBYMBCa7bds1ptJBH2sbeSmdnBYuie9tUVFk4BlOUpoUrd06iBQkh9I
 27gGgzMgWLVKM0IQA2LC/wILR/RpykCWboksytynTBzVbUgIE+7sbDxThsY6zloRi48N
 huPA==
X-Gm-Message-State: AOAM531/0pej+9jPFAWSS5vlCQK0xsVWiMWASBNKTLfozHX6sV1e9FaP
 sC46SFbDjP0RxKS1IgC3rviSbf9e//c=
X-Google-Smtp-Source: ABdhPJzXDyDVZmaaEpbHjNvBlLBs4R8+us2uiQgWBbazu3lVyZhk5soIV9FGlicjR+n2rvfqi6cxyQ==
X-Received: by 2002:a17:90a:ee89:: with SMTP id
 i9mr1117265pjz.57.1621222435985; 
 Sun, 16 May 2021 20:33:55 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id s3sm9785418pgs.62.2021.05.16.20.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 20:33:55 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v14 6/9] powerpc/bpf: Write protect JIT code
Date: Mon, 17 May 2021 13:28:07 +1000
Message-Id: <20210517032810.129949-7-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517032810.129949-1-jniethe5@gmail.com>
References: <20210517032810.129949-1-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the necessary call to bpf_jit_binary_lock_ro() to remove write and
add exec permissions to the JIT image after it has finished being
written.

Without CONFIG_STRICT_MODULE_RWX the image will be writable and
executable until the call to bpf_jit_binary_lock_ro().

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v10: New to series
v11: Remove CONFIG_STRICT_MODULE_RWX conditional
---
 arch/powerpc/net/bpf_jit_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 6c8c268e4fe8..53aefee3fe70 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -237,6 +237,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	fp->jited_len = alloclen;
 
 	bpf_flush_icache(bpf_hdr, (u8 *)bpf_hdr + (bpf_hdr->pages * PAGE_SIZE));
+	bpf_jit_binary_lock_ro(bpf_hdr);
 	if (!fp->is_func || extra_pass) {
 		bpf_prog_fill_jited_linfo(fp, addrs);
 out_addrs:
-- 
2.25.1

