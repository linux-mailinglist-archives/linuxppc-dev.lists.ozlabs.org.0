Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BCA301F4D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 23:39:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DP7Fz1Z7VzDqr5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 09:39:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--adelg.bounces.google.com
 (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com;
 envelope-from=3-vqnyaukdcm9cdkffnnfkd.bnlkhmtwoob-cdukhrsr.nyk9ar.nqf@flex--adelg.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=p5tCUkHc; dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DP74427r2zDq7d
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 09:30:22 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id u10so7858805pjx.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 14:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=SxtKzCg4dSNF6QnMe9COOsJOULIieI+eWa3vw44r5d4=;
 b=p5tCUkHczxdJmnnrbsCGm3oloYhaKnaqjkx0aChjGIdJnlGg1xv7KWe9JUoeND13y2
 Jvx2gPYLMmlfaqwKU6g4HCM0Y4Ak7imMz1wZDyRI6Su4JyGDeoHHsu7GYOlBZ6Y8t/Bh
 Sfwy6NvZw7vHEIx3RtAY3xX2Jn/h3n+ZVl/h3CAPgWd7MDXdQ9ilTE6Bam1VZq3wtXs1
 2hqGMYPLiB8xDXjJEmGOHL7yRY89SIhrX7QH3IkR3YpWuPkd7fy3CQMkkjzDwR4VNyCv
 OcPMYHZcRBhbWUh7U5LSU2fjnO/HiMODjd8T40rdo6dfP00ncV1+nLDQPdpvgQMOIpp/
 T76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=SxtKzCg4dSNF6QnMe9COOsJOULIieI+eWa3vw44r5d4=;
 b=lI31J1yUB6Ze0Jl9z2fHKI2olH1kGUokg3zBP6F/2dQltjb5aPEc+PUc35mYdAK3Nx
 N5tGDuxJPVPh/1pKwqEKwZ5Z9PP8DkJF8PqR75TSS891Uxm9YFv38mElYS3UONNtnc+i
 PFK+16eGUSvqe0kGAld7g+DsUdUw9Guq3157cK27Dnt8InJeSLF773JIJUiDGQ1WMgjL
 4TKoe6HCbR1qZpGrF3+HowF4jcoJwldIchPsNXi2EWY2JP3/5BBQlX+z1V6FkSpqrww3
 xueERQVGaHc5rfP4mUfE4e2SAgOfsISM50H1MaxMm/a90skUamdcjRKU6v+ucl47Vi2t
 1TqA==
X-Gm-Message-State: AOAM533X/FZlXZuVVSYgrNdydlj+Ml6wylhwPFI0KXsYC9SCe0KHe1F4
 AfM9djaUyAcDNx3ymzFZvYxgLDbk7Q==
X-Google-Smtp-Source: ABdhPJy7q/aqXSiPdZSzxzJDuav8mNeTlI0EZJT8lRYZWvAjHa3CRBU+D+9Br4bvBT8k/t9k1q2AEyjpXA==
X-Received: from adelg.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:a16])
 (user=adelg job=sendgmr) by 2002:a05:6a00:a8d:b029:1ba:71d1:fe3c with SMTP id
 b13-20020a056a000a8db02901ba71d1fe3cmr4955904pfl.51.1611527418279; Sun, 24
 Jan 2021 14:30:18 -0800 (PST)
Date: Sun, 24 Jan 2021 22:30:12 +0000
Message-Id: <20210124223012.63762-1-adelg@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH] powerpc: Update broken clean & mrproper
From: Andrew Delgadillo <adelg@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 25 Jan 2021 09:37:22 +1100
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
Cc: Andrew Delgadillo <adelg@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit cc8a51ca6f05 ("kbuild: always create directories of targets") breaks
mrproper on ppc. arch/powerpc/boot/arch/ is not cleaned up when running
mrproper. Before this patch:

$ make ARCH=powerpc
$ make ARCH=powerpc mrproper
$ git clean -ndxf
Would remove arch/powerpc/boot/arch

After this patch, the directory reported by git clean is no longer
reported.

Fixes: cc8a51ca6f05 ("kbuild: always create directories of targets")
Signed-off-by: Andrew Delgadillo <adelg@google.com>
---
 arch/powerpc/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 2b8da923ceca..3cc762cce1a4 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -454,7 +454,7 @@ PHONY += install zInstall
 clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
 	zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
 	zImage.miboot zImage.pmac zImage.pseries \
-	zImage.maple simpleImage.* otheros.bld
+	zImage.maple simpleImage.* otheros.bld arch
 
 # clean up files cached by wrapper
 clean-kernel-base := vmlinux.strip vmlinux.bin
-- 
2.30.0.280.ga3ce27912f-goog

