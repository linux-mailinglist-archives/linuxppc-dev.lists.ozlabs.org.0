Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC6A34E05A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 06:54:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8cYX0DDnz3cRv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:54:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IYWIZRHI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IYWIZRHI; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8cVy4FQnz304Z
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 15:52:10 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id w11so5519280ply.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 21:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3HvEvzP93WgGbGTzUC/vGlX5VBFq1Pm18mmRxCCMk0c=;
 b=IYWIZRHI6SOmNcbdXJiJ2CW2vZiEVnazU1RSAL+z72o9pT8KtNmDxSHVNHqrt+N5ES
 pJyu5zyAf+rQ7HkqRdCqLqwj0kODqok9tVZcneRdY+Oge8ZFjN/b+QXLsqDX+8Yfd6G0
 TqG3DOyIX72Rcuek6XpGH0EI0Sh6Kad+j4yEa50ub8o7jvAlCpc9BUx3LJnmsYzBXyFN
 v5h7J1m2THqX2lZqFnoimqF940LWlKiU2g5jBwJbyzy22n/TEEEHdTXSnM7iqURZujP1
 lhmdSuMw8fuQ3AxKhpAPWlaU8paZJJB9UxYf++aQtoIxonXr/HKZvnMcKmOpoexeWY45
 0iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3HvEvzP93WgGbGTzUC/vGlX5VBFq1Pm18mmRxCCMk0c=;
 b=TT7Ct3cA9wJtMOPd2ETaGQW3YKU5Q8nhBICmAO1B1qnw7GMXKU4J7GcbpaZzid8XSK
 HKBTL/jsc2Ko36kMksBoSD8U13qtuP9XEC8lxN8jmqzoH2/IMuXebkv4lKIetEbWQZqZ
 Xn6yMBNqRm8BCFXg/4eDecx7LOEdpCDNebQGS42P82U16B6aZNEhIXb3LpWSwmlF59V0
 eV00R/FJZKgRmD0JB0KDx/Xq9ziw3ggr4AVAXGEvu/JHNDpX+Qn4mLPNxVT6Rq7sQDwo
 SPykr0TH8vSfHlmMP+LP/lOemlNnJgSCaaxzrzVQgxnksd4YiS68FAbp4uhhMsGv3Ysz
 gxNg==
X-Gm-Message-State: AOAM532fCs9SaXjAHAwTJfFTjb3MLssK+Aks10NSBN4xNYqMRsWaltDL
 /4OXNLW35RuP7grUUsSFn7S+tAsMOwPW6Q==
X-Google-Smtp-Source: ABdhPJzJTF1BmAOPyCeHmQbMmWm/aPf/TfF/tyBUj9qHFrqZsol7RRbiUvPHJOZVC0ewB6+/Fpr+zw==
X-Received: by 2002:a17:902:e54c:b029:e6:42ee:18ae with SMTP id
 n12-20020a170902e54cb02900e642ee18aemr31226258plf.68.1617079928212; 
 Mon, 29 Mar 2021 21:52:08 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id a18sm14136574pfa.18.2021.03.29.21.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 21:52:07 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 05/10] powerpc/bpf: Write protect JIT code
Date: Tue, 30 Mar 2021 15:51:27 +1100
Message-Id: <20210330045132.722243-6-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330045132.722243-1-jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
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
 Jordan Niethe <jniethe5@gmail.com>, naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Once CONFIG_STRICT_MODULE_RWX is enabled there will be no need to
override bpf_jit_free() because it is now possible to set images
read-only. So use the default implementation.

Also add the necessary call to bpf_jit_binary_lock_ro() which will
remove write protection and add exec protection to the JIT image after
it has finished being written.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v10: New to series
---
 arch/powerpc/net/bpf_jit_comp.c   | 5 ++++-
 arch/powerpc/net/bpf_jit_comp64.c | 4 ++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index e809cb5a1631..8015e4a7d2d4 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -659,12 +659,15 @@ void bpf_jit_compile(struct bpf_prog *fp)
 		bpf_jit_dump(flen, proglen, pass, code_base);
 
 	bpf_flush_icache(code_base, code_base + (proglen/4));
-
 #ifdef CONFIG_PPC64
 	/* Function descriptor nastiness: Address + TOC */
 	((u64 *)image)[0] = (u64)code_base;
 	((u64 *)image)[1] = local_paca->kernel_toc;
 #endif
+	if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
+		set_memory_ro((unsigned long)image, alloclen >> PAGE_SHIFT);
+		set_memory_x((unsigned long)image, alloclen >> PAGE_SHIFT);
+	}
 
 	fp->bpf_func = (void *)image;
 	fp->jited = 1;
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index aaf1a887f653..1484ad588685 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -1240,6 +1240,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	fp->jited_len = alloclen;
 
 	bpf_flush_icache(bpf_hdr, (u8 *)bpf_hdr + (bpf_hdr->pages * PAGE_SIZE));
+	if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
+		bpf_jit_binary_lock_ro(bpf_hdr);
 	if (!fp->is_func || extra_pass) {
 		bpf_prog_fill_jited_linfo(fp, addrs);
 out_addrs:
@@ -1262,6 +1264,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 }
 
 /* Overriding bpf_jit_free() as we don't set images read-only. */
+#ifndef CONFIG_STRICT_MODULE_RWX
 void bpf_jit_free(struct bpf_prog *fp)
 {
 	unsigned long addr = (unsigned long)fp->bpf_func & PAGE_MASK;
@@ -1272,3 +1275,4 @@ void bpf_jit_free(struct bpf_prog *fp)
 
 	bpf_prog_unlock_free(fp);
 }
+#endif
-- 
2.25.1

