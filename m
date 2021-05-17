Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C438231C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 05:36:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk4YG46Kkz3cHD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 13:36:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=J7lw4EVm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J7lw4EVm; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk4VT1lz0z308p
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 13:33:52 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id t11so2917353pjm.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 20:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zwESIBZpnR2m975fHalvCep9CeFwEanqy1akHv4NJIU=;
 b=J7lw4EVm7AC9ahoMtQkOYSo+707+XcWiq+0qwiknJ80mnPZ9BPBl+OUU2RLD8eB30g
 uztA2WI6cohxJzasaRlkZB7/0X+GKFjWgT69BYDIX/OJj4n4CQBZyAMRS5TL/Ux+Cw2i
 IxYNotxJU3DsFbVcCXdvUem1nic7vU05yZPusKZUMpurd7j0D+7IEvSiI8JH9neoccsY
 2v7Dt1EZQ5TF1fNGmUxkV2fflV9J7W9MCwzVkcspUF1ozzBLUNRgtdkLpPxK1MCO3EPw
 t64SqR+/gGl3mImvDifkazfyfZYAj0lwMeLRTU6+o4nUWUgRyuBmNLnsU3vsG73InQpr
 5SxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zwESIBZpnR2m975fHalvCep9CeFwEanqy1akHv4NJIU=;
 b=hytVV6lJvK2USuUWq7nHwGwFmhBwhnQJouggh7sAMU7ToxKsWBWaB5/ztrlClL+oC2
 hMsBxBvfr3A+YlbTPy24rJcv/LoS4MjaDDyx7GB6uLyzx1JoZpCcjVrUkpCzwVayi0vL
 gqOPFvA0jz+7+wloh987a6XKFiwOo/0DtkTsvwss4XlDlboeBcnjC4tgpHkqsReBmMkt
 QTIdZVGNGPA+mxHWVIWjIPEu+gfoJEiJOS992qFr/EaWMWuKJkcYI+gTV9mRYgOLsRvl
 pScX2LZJQIyUWZGZrOCspRcRX7ouHGVaXtI/HI1i0yLBNbzk5dyiZehoo6wmipefm60y
 LWzQ==
X-Gm-Message-State: AOAM533h2tSQQxnl6nsPj/Fw0ktMdDhqbvmxJ3T86wedxbWMWAPFlTB7
 XAo0q5q1NyDpKofQFDFPftMSBa7IJMI=
X-Google-Smtp-Source: ABdhPJwviFL6uWapgv6dPFvplwxHbjylI/ubSTRklJ/d7X//zJ+LJEW3Mu6tCdN+iVdE6UuTakchnw==
X-Received: by 2002:a17:90a:1782:: with SMTP id
 q2mr65065666pja.73.1621222431024; 
 Sun, 16 May 2021 20:33:51 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id s3sm9785418pgs.62.2021.05.16.20.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 20:33:50 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v14 5/9] powerpc/bpf: Remove bpf_jit_free()
Date: Mon, 17 May 2021 13:28:06 +1000
Message-Id: <20210517032810.129949-6-jniethe5@gmail.com>
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

