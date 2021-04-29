Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C37F936E3A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 05:19:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW12F626gz3cDG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 13:19:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rRCx0iR4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rRCx0iR4; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW0zK4hvjz30DG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 13:17:01 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so10119413pjj.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 20:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5nbcoFPtObHnxPB4SGssIrcwmZACcgci7p82u/XPo7g=;
 b=rRCx0iR4FD0dxMEmSzwIJhLok2/1gjcGrdQ+UGlkZaXwG0aKug2JrkJhViN+49rdcN
 azY4c+SBjSt2spu1BQBmnYNfu+kPbEySwyD5qNV7N1K5J+3R1P+oFk7hq5EF48SOwiDx
 9GebMUg3vWEkqyjLUCPv2ut1PSTG6NaOVjhUH+p0uOsuX9aVHiEwtKg9+h6oHvIEvNFM
 prFTos/0ysuYxFFOPZ/JFx56zCdOU/H8BP3T0mJ24AL24nsqFirAqz3IMGFarhpADmc8
 tLcwg55JPy3L9n2f0djkDkpNZkRlro9GwPBBAxb7VOdHivu+GSs3Fyr9sES06XpDbEit
 fBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5nbcoFPtObHnxPB4SGssIrcwmZACcgci7p82u/XPo7g=;
 b=NTRbSDOIQUcyXtbjzIK98UERHaxOIASgF7HgzGf8ojXh6mSPyJg5AVsUWW6iaFwSuj
 3JqLDj3Jh35ApYXZ8FCNg4DzhGWi1la+twXS/uhXFhKCWfWqjwuyTgS9RD1J7RnvgJCW
 NNQU7w9+UvgAcAKr8MK9iAILLHJZFMMKMwCyqDZpld8aYoMmnCLBZ3qCGl+4RD26lNLG
 YP2Wcc4rDS4fzWmEGECMAQc0VBlkPF+z/pNJHn6iC4jiJ+0VZWCMTWY6Pumf4fggU1gq
 9QXOFVXH6msEskv53/dY+mi8nxufCj/pYBV+8CFYD4mvxbOr6CzZbnHQi2ip8SfEWzCz
 2ESw==
X-Gm-Message-State: AOAM530OHrejlYnuFpP2Xl8exQlwEfm/2iZkaQ+m/PHTqJVLm25N9f8E
 yeWuxE9l2bTDirN/ZywxtDYZm51mi9c=
X-Google-Smtp-Source: ABdhPJwKRksa3Q05+YCh7+Ear5KW6HebtP81zZQ84LdpjgVc742ceEBJqLu7cL01zZZF6LtzdGdcIA==
X-Received: by 2002:a17:902:d2cc:b029:ed:2984:d73c with SMTP id
 n12-20020a170902d2ccb02900ed2984d73cmr20357824plc.54.1619666219106; 
 Wed, 28 Apr 2021 20:16:59 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id l16sm3650742pjl.32.2021.04.28.20.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 20:16:58 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v11 6/9] powerpc/bpf: Write protect JIT code
Date: Thu, 29 Apr 2021 13:15:59 +1000
Message-Id: <20210429031602.2606654-7-jniethe5@gmail.com>
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

