Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F21AF374DA7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 04:41:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbHry6dg9z3c9V
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 12:41:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vIVjdIp/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vIVjdIp/; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbHpC03HFz30BM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 12:38:58 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id y32so3673514pga.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 19:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5nbcoFPtObHnxPB4SGssIrcwmZACcgci7p82u/XPo7g=;
 b=vIVjdIp/nh2NKrafdRvn8/pEO1eGdwf3dcyuGEAb5lgNt2B9lIdZMHKP6D3gVtzAvi
 qxRbm/Y6KFov+vzNSaUq05acgVB4b8k6BrI64+bglzIY7aq5D3lUUbeWkeubepySs/dV
 izFNGdET7DRuKkhIcAYlfj/wsI+a4sskD0R8ClsP5cwJi4SFuwD1h2H4fM+x+iNm1QVu
 1ND2cgKGF/zzu78WWfacZkChr9z5izpLLPCzgIr4KQnfhm7ydIoT6liKBzx4u1wki1Ty
 qU2U3ICGR2DXedbQgJ+yahBicVjDRB3FrIiUhgDpBVYnLcYzWSsDP9nn+npy1Xt/7382
 mO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5nbcoFPtObHnxPB4SGssIrcwmZACcgci7p82u/XPo7g=;
 b=C+RGxsiN754HDh8Ix4vvOY5ls4h3YIAcf2fW4FBrzoZVsCp55BFfZh/2zA3brbS92D
 A7vsYHrND/A4IO07B7w8VU84xRzgqJl1VGdQoIGv2AJd3JFiG5UqEDxOxT+1fgT75JLN
 uouM6yfdnVqtedlW4LQGhfti/4u/tglHuKF/7HEdrUAsfT/l/nJwHWvs+UsMNTqKENxg
 wpBris4la+O6E+CXXmvL2WytfyDACYRLqCpdggmVQU8RHUOawF4/T11T9uymcsWlZj3d
 UujNtWBvyTUcYic9DKa89xxKnWYON/TdxlLG2/+YdSYeSrskn+7Gckuj+Vn8i7FK82tE
 3wRQ==
X-Gm-Message-State: AOAM532gJv22lJuNSTvFXjnG924nc9g9OT5ukBaK0Qj6/1veZxx2U5La
 Ap7pQfzYbsXLeRCuoP0hQuRcClzQH24=
X-Google-Smtp-Source: ABdhPJyIrhE5F4KLF5zUPReMoJ45CRDLg236A1MfgoRlirtfTmXGhfWj07ij2123TaXBv68jZBbGBg==
X-Received: by 2002:a63:c6:: with SMTP id 189mr1844639pga.216.1620268736520;
 Wed, 05 May 2021 19:38:56 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id k12sm454490pgh.16.2021.05.05.19.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 19:38:56 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v12 5/8] powerpc/bpf: Write protect JIT code
Date: Thu,  6 May 2021 12:34:46 +1000
Message-Id: <20210506023449.3568630-6-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506023449.3568630-1-jniethe5@gmail.com>
References: <20210506023449.3568630-1-jniethe5@gmail.com>
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

