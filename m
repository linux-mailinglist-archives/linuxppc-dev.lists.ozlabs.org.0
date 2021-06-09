Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6E83A0981
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 03:37:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G08qz2gv6z3clX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 11:37:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YrqttJLS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YrqttJLS; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G08ms6XBgz30Bc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 11:35:09 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id u126so13163797pfu.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 18:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hn7unOXRknxUolKeI3R/RYUkNJ1IJ3Em4zYkxuuGOMo=;
 b=YrqttJLSqa4joG/QF/bMINGFOJCGTB9SBnEc9N5x7XkLdnHXTvYlSgYyd5nWLS0udI
 GrJWAuu+AaBm8dR9lPvmst2TZgnA02wVtcuB/5P/OyBLXYA0y/VXYlBi7L0ioz0p1zwQ
 KPnn48oXW/QjZS7V7qUBpbFQAjqFE1RvCytmoYWgBcNaHHy/GSDeZGZd7y12VvUNQIHm
 b7Qbw3WiSCiuV+clBzRb5tIdL/phql3fuxlxJxio/SCPbOZOTexvOS1TSIqZ33pblPQl
 SvdZjH6g5oJSp9XpZcOOrr/kgiSCB6DHI6/4HDu65c4ssYcwXfbyir7T32C1S0gsDGtl
 bF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hn7unOXRknxUolKeI3R/RYUkNJ1IJ3Em4zYkxuuGOMo=;
 b=W3WlH49yZTLVKz5ZFXFHj4b802Q/2omPtquLOf408d7B8xe3VXHntMZCE2RMf5A8Gi
 Ki4jr1tNrR5Sjtrs05n2N9HrvRDGQaCv08M6qpyy20T7xpPXtRvDPAwYTqVdEsYuWEyL
 QJw2qw5sNJmJ506xUhvZhCHpnZLZOfLLDYEeSFMWIo/3XURxP/FDzYU7eIAxbR0M2zuW
 A+VkCmjPx5YBEMJsWuzdat1kNCLVSkDtTQZJnPzrFU3p5Pa9ahYOUR4zDtsNub6ivPhi
 FefLOhcVuLqA417OujVAXGZQw6yQnAnFW5hFFilQAUS4Qt3cP3X4aklNVmg2RFjpU8AC
 l1yw==
X-Gm-Message-State: AOAM530A7gA0kegI/UJd61xtLq8cZq8YDG6b5bTAOtSclD3DG8O/uaGC
 hvvjBX29RCDTGZ5IQ9CGQH9U1OH1Exw=
X-Google-Smtp-Source: ABdhPJxW/y+VKhpcqflgwbjwmbUNRPadm2q1IhFqxDL33jb7P10+6kQaRQfdCytSJxG7dTyDBNuQfQ==
X-Received: by 2002:aa7:8202:0:b029:2d8:c24d:841d with SMTP id
 k2-20020aa782020000b02902d8c24d841dmr2798737pfi.57.1623202506598; 
 Tue, 08 Jun 2021 18:35:06 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id s10sm11369406pfk.186.2021.06.08.18.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:35:06 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v15 6/9] powerpc/bpf: Write protect JIT code
Date: Wed,  9 Jun 2021 11:34:28 +1000
Message-Id: <20210609013431.9805-7-jniethe5@gmail.com>
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

