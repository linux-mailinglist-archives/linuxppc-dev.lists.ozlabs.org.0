Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A18A3A0980
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 03:37:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G08qQ0LTjz3cZ2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 11:37:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=f4nF6fAO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f4nF6fAO; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G08mn5Lrrz301W
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 11:35:05 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id s14so16253270pfd.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 18:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zwESIBZpnR2m975fHalvCep9CeFwEanqy1akHv4NJIU=;
 b=f4nF6fAOcc3NlepZ3KeYSBVsuk6yjaY0k8auYr4UOz+19OPfjJvysEGW9kFY0gMgt+
 9ukhIxsjDfL+yONnrZ4Vb1MbYJJs67yrabV+4cJPpC/T4QV/3/2+5bbfn6n57MZ5C9C/
 d1Ws/mfLQhkpjRo5CKV7Iq2EnYLnrQ8kyquk1/0WBkreH/NIyq9+9ARpBW40na0KLnp4
 bTScmX0tX1YbDk8D2RDH9z3QKcq0oDGUZ4wXOUKrpPKJscZjcuZN1E4oUBI48erj4nEB
 5jnUKcCf0BHtjSb/21y9HMNgHNhq+Ghrge3ckaqwhQ2lIz1h/vA0Lg6GPlinSabE24Eg
 H44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zwESIBZpnR2m975fHalvCep9CeFwEanqy1akHv4NJIU=;
 b=PUSnvlRti5IZVbHnXQUjjM6NEElTW8txmsz9O1JTkK0YUlN9BRSb7zMvr2DstMYuGD
 UcDoFuuZjEpJWP5wcWRtwd2jN1TWTG3iNPblB2Hyk92vjNuRz+E5l9rqbzLO4aOkcGw7
 vDIODQbytsBXHxNFuoWd+WxC9MRzS7CJkRo186SrIydjX50fKhPDKJ8QuPC9K9ECzVob
 AW+p9Vzwqgh+qTQHjJ02VS5rn0syuB346w9AZoBcft7oyPHGBR8f5rKq6sa4+JKOdYYh
 bmCeNhDwUVghT4U2oBKl2/cSJOTwsiQn5w5qWtaD6xFgANdW2nCZGA/BqoHXlScDokCc
 nEhA==
X-Gm-Message-State: AOAM5333J2Fxa83zkvzaZ2BYmARyymgrRv/F+Uftr3nEW5CbhBtxw2ML
 9OZ5fDQ/k/4VexhOcEfgxg+87/reIrA=
X-Google-Smtp-Source: ABdhPJwTIce098Go1uUQLhC1o28wGVo5rd8dWQjraoxQcMjYtF+pKKVz+06q8IGcRt+JvM4IxIdEbg==
X-Received: by 2002:a62:cdc6:0:b029:2ec:8ee0:57bd with SMTP id
 o189-20020a62cdc60000b02902ec8ee057bdmr2615448pfg.78.1623202502185; 
 Tue, 08 Jun 2021 18:35:02 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id s10sm11369406pfk.186.2021.06.08.18.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:35:01 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v15 5/9] powerpc/bpf: Remove bpf_jit_free()
Date: Wed,  9 Jun 2021 11:34:27 +1000
Message-Id: <20210609013431.9805-6-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210609013431.9805-1-jniethe5@gmail.com>
References: <20210609013431.9805-1-jniethe5@gmail.com>
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

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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

