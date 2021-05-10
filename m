Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B98043779B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 03:21:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdjtP51lbz3bsw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 11:21:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=or39ANO6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=or39ANO6; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdjr66Pbpz3070
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 11:19:02 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id x188so12480117pfd.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 18:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zwESIBZpnR2m975fHalvCep9CeFwEanqy1akHv4NJIU=;
 b=or39ANO60if3KRR8qEsqEQVDnDcLv6XKUd5j0+dgzYkNtRlK8FVWcfnvnHTtQAmvuc
 4DVa2irK+p4nrahO4v/8AJ3ZVvl6MxeLFx+kaLIy+uqu9xonuYRCyd5GAZmC+Uy71pSV
 nWOqAjt9xZpcSSB2CkBlkvyMtZEbzBqNQ9Ep+YioBfFj5TLh164+M1LxdFCIjMago3Xd
 jaOOCRNnQx37xC5jBRnVJM0of/JOeRtQlWAKgvagjxVoylYaGmOzM5r4BK7ofHal2+7R
 XdKDsg4IF8m5iBjAsKA4IKiKxeJlXBUtTweN4XFk8LNt8gWi0c0kTaz885Zv46tRcBJ4
 aGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zwESIBZpnR2m975fHalvCep9CeFwEanqy1akHv4NJIU=;
 b=frT9fCAixaWXediGO0XmJ7e0/0TmDfGUYnxH3cGBu7hdi/Pw2CxQzevxpyE9M3hVwZ
 ZYaXd309QArZfy54CI+7Qw9KG/IKk0rnuwklxeu1ydpn7MwdusExeZxVjKo0RdEAWR93
 WUP987zD2ZrXKWHrsdFLbOjvIS4du6gn4qhWtqB4YGIFcIqp9RbsdiiQo1umIojKwSIu
 Fst0W7ZUSieGKxtb7ShY5lOY8LpLvbOkPwpDLd2gO2FmMEtSEZlz8p1xkmMo5jwumKWc
 fV/KrWBenY7WdcERbVzyYEIpZjA9cx2kpNPPqwpeNN5yXvj9lvsHIFUfMahgF0VooiOt
 n+rw==
X-Gm-Message-State: AOAM5338zCApWAuZW+LU/jbCHWw03VkT7G1QjKOx00GUAmvPT2Eibxrk
 VIreaZVmQH6yjUof4J2OsoTEH8gmLCk=
X-Google-Smtp-Source: ABdhPJw9v5wWgNKYojbS6W9FxpuOnHwUndU3SH3b8o+EspkncsWZPq9MR16uHJWk0NMDthK/fZSg5Q==
X-Received: by 2002:a63:b211:: with SMTP id x17mr15156989pge.106.1620609540263; 
 Sun, 09 May 2021 18:19:00 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id n129sm9887649pfn.54.2021.05.09.18.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 18:18:59 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v13 4/8] powerpc/bpf: Remove bpf_jit_free()
Date: Mon, 10 May 2021 11:18:24 +1000
Message-Id: <20210510011828.4006623-5-jniethe5@gmail.com>
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

