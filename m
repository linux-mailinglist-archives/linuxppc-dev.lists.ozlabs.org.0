Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E9F36E398
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 05:19:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW11n4qkBz3c8J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 13:19:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NOBadK/1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NOBadK/1; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW0zF15pDz30C4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 13:16:56 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id b21so5492889plz.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 20:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=POSty/xjT/eLodok8fWzwr6xbYAtFXCRxSVPBEi6woo=;
 b=NOBadK/10MTb8wtEyPK/XSXKZFLjoqJ3g50mEfgERx8/RNh4EppQkBcNMflkNdUwPb
 ASaOMvfbglBOgEaPznLBBrt3TWYq+87QPDvXMlMdveKpgvZvBpvA4kFrrYk9iWr9ZM1G
 9K8c6u15aV7Sz138LuoUrScNGF5Ab3kDdwVK8nHqXM3wkzpU+imRa7HcdBdDFWcJI8lr
 mz5liLy31Ri5h4UFtn51z0QALqDmEmFTFd/uQspyGwV9Nt/ln1zREbK+FKK84a0bCnvT
 F7Re43GIY/OYTgTp7v6JaXD67eF/dGBrTMN6+l9WI1qHmqkmhXQOjALDtU14fJhLXrOF
 7NzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=POSty/xjT/eLodok8fWzwr6xbYAtFXCRxSVPBEi6woo=;
 b=JPX8xMoKErz6AVtbCZWgN71Lr2Rq2viHoY+yt5RHDJLKygCMIZdbWmJkVh4nXNqoMh
 YWOQDIh9LMoG2hrFLdiG0IKDnTAVrvwCPGE8nZBC+xzl8uok3mh5kN0CypfOeS+zVAWk
 v73vi0ba+5Uzmkisrt8p7B4yy/t/7uAIzBl/ZO56kP80Sn8Yk4Lasf7A+vG3DHWrdIb+
 d9BeikoxKUsbuYTajgZzpkrbE/dvjzlOms+HR4nIuDzjwvqRCeskrm54OwrweVYTSJHe
 xTsNl+IwKk1Ny9bO9Q1Hyr8/XDi4bHV0hyb30BJgBepsAZ2YCqpd8Z489Kk+YeYG07JJ
 4a1w==
X-Gm-Message-State: AOAM531ArS7dRRDyHCmxN56renF1NPA9JOLKt8XBwp6hu1tWQv+T4mnB
 2aAGyKaCL82Yqz9Na+iju4e+KSb6lBw=
X-Google-Smtp-Source: ABdhPJxid+nERDImsayJJ46qOnxNj46VzDP5CghkQKYDp67KMeNIxUWFg9fMNtcQnTdYOFUjgIEnRA==
X-Received: by 2002:a17:90a:540b:: with SMTP id
 z11mr36470678pjh.133.1619666214048; 
 Wed, 28 Apr 2021 20:16:54 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id l16sm3650742pjl.32.2021.04.28.20.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 20:16:53 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v11 5/9] powerpc/bpf: Remove bpf_jit_free()
Date: Thu, 29 Apr 2021 13:15:58 +1000
Message-Id: <20210429031602.2606654-6-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429031602.2606654-1-jniethe5@gmail.com>
References: <20210429031602.2606654-1-jniethe5@gmail.com>
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

Commit 74451e66d516 ("bpf: make jited programs visible in traces") added
a default bpf_jit_free() implementation. Powerpc did not use the default
bpf_jit_free() as powerpc did not set the images read-only. The default
bpf_jit_free() called bpf_jit_binary_unlock_ro() is why it could not be
used for powerpc.

Commit d53d2f78cead ("bpf: Use vmalloc special flag") moved keeping
track of read-only memory to vmalloc. This included removing
bpf_jit_binary_unlock_ro(). Therefore there is no reason powerpc needs
its own bpf_jit_free(). Remove it.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v11: New to series
---
 arch/powerpc/net/bpf_jit_comp.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 798ac4350a82..6c8c268e4fe8 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -257,15 +257,3 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 
 	return fp;
 }
-
-/* Overriding bpf_jit_free() as we don't set images read-only. */
-void bpf_jit_free(struct bpf_prog *fp)
-{
-	unsigned long addr = (unsigned long)fp->bpf_func & PAGE_MASK;
-	struct bpf_binary_header *bpf_hdr = (void *)addr;
-
-	if (fp->jited)
-		bpf_jit_binary_free(bpf_hdr);
-
-	bpf_prog_unlock_free(fp);
-}
-- 
2.25.1

