Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18DC3779B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 03:21:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdjtt4tdVz3cKK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 11:21:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=q6gSxMFu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q6gSxMFu; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdjrC6ClGz3087
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 11:19:07 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so9100352pjz.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 18:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hn7unOXRknxUolKeI3R/RYUkNJ1IJ3Em4zYkxuuGOMo=;
 b=q6gSxMFuSfvEjk6nyuBXky3PnPHG4rMsR7ZMH2Jgdb3SWxNYjqElL8WJUTWw2x5ztk
 YJ8t/VbUgS5l4sUsQyob+YmpHDOBcptv1CQfPAwdSJj9xjINea+OliuoqXzJe/BwQMz9
 ENXE3ehMpkKyvlsP24nZX0zfqD1uk9SUKODg1xBWf9pxnIyNHS7prlUV0CSG9zXVLk52
 1k5cObXgGz6TExO1RTm29SMTFT/EbhxLNXVVRK6nPsUrg42/8IPcRr89p9ThASS54mJj
 4MeZ3YO5tK/pCbtd5AmdlxC5OLh+s0Jybs914TiogAzttbC/Vg4e0hke/GUw0o/B8IgH
 fVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hn7unOXRknxUolKeI3R/RYUkNJ1IJ3Em4zYkxuuGOMo=;
 b=NxF8OrG0cXyAqHQsoxmaTY7/9mMQrvYw+5q5V0+AUgbOGdv0zn+8or/fNiR0LgSSjw
 MVd3kHXzdd02W39ZmAkVyeigYnBx6XQ5mVGANDSccbUAl8+rj+cxKIC9qHnwxVHpPUMs
 LW1t8o2+v9WMnroNbiwHVHndHCwqekv54ea94OWnTNM8zFe/JiLyZshOuvUuYENVS/DG
 jW2+4JP/fI1yAlkMA1gklXrskUVQATNosRyCLzWgNgpr9e7a4QE27F/Ndh0nkLPgF0MG
 BWWwWMxzPQr4NxJ4mk0DNYPf5jhWu56ZyxsrAcWDe1zR4ABNYbc5a/CgzLoIS95Qc6In
 FIRQ==
X-Gm-Message-State: AOAM532j3iAlGBrp0YLB4tdyKSwle9vuZLcDYzbe4dLU9nV4WMoctG0X
 h6vJxQTvAjWa/utXofEkIJnd1FCF8nc=
X-Google-Smtp-Source: ABdhPJyBRJNDciU8FIYw7eQY2NND191A3M+kwfO2jHrmihdk18IO5K2ZV8wq5EZdrkaUynXQr1flfw==
X-Received: by 2002:a17:90a:6be1:: with SMTP id
 w88mr38535938pjj.101.1620609545253; 
 Sun, 09 May 2021 18:19:05 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id n129sm9887649pfn.54.2021.05.09.18.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 18:19:04 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v13 5/8] powerpc/bpf: Write protect JIT code
Date: Mon, 10 May 2021 11:18:25 +1000
Message-Id: <20210510011828.4006623-6-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510011828.4006623-1-jniethe5@gmail.com>
References: <20210510011828.4006623-1-jniethe5@gmail.com>
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

