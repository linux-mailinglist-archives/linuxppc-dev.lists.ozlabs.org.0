Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE0A2FDB33
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 21:51:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLd3x2qnhzDqGg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 07:51:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lSs9ai1z; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLSQb2TGXzDqpf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 01:22:11 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id f26so25420147qka.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 06:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z4W9rabaHYlfp3dZefhZ5eDc2vFVS8lzPwoif6mGzIk=;
 b=lSs9ai1zpvEddnzbn0rPsX1lMsDhdwTM2sGuacKqBuxvFOp54XeD5QVbqhtCJ3jvdE
 7jeoGRp5VQH3Yuoxr7uVpSAknAQQ6kfPLR0Nb4s2MXshtYqE9Qasr3BHDUswnNpbVKot
 h8vTMB6s2y/krzb9joV4VLeAAg4rOKCJ0r29LeLWbN5LxNWvsF7ljOlhFUAToZb30CXT
 tpCqnpGmSVqGc1jpsd+orsN+cDWxWhAf89+XBMouzdpubCPgNd2bSeEpJEhI/8MJjTvp
 n4sye4N1CGVVJaLvSEC4dr2MrL7wNp27sIqy3NorhXvT3FbNUYbq7zrZ10x2qZEmjsED
 HjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z4W9rabaHYlfp3dZefhZ5eDc2vFVS8lzPwoif6mGzIk=;
 b=AjMT6CFIfxrMWsplB7Z9KDXQNCFCaYwSVmUqkqZi8VGv8i1JYZtM+zz5NFRmNgQVEw
 sabbZ5YnPljCTlbQxaEbW8Am6eljURf5aPezu9E0RNS1fX5GON7tX3fJCpsV9iWNfSgD
 Pqr9C5xz1NDI1uSjruYmzptwXhkId93jpxN5Uf+qVHmMBpvZ43Di3OXKH1VKyMeUocSt
 I2GZCZ4KlyCLnT4eEXvRAE4IY9kFZQx/TvCxM5/ViGpFSTi6Q9JCtNLpAw5Apzf0VmoG
 1HhY/LBeC7VeOrMt05j2mUiJkcDhF0TjuJ5Gh84XdxLp1fp+PeWYg0FtdVPr/FUqQ4TL
 Rf4A==
X-Gm-Message-State: AOAM531iSvLoiNrlW21qs6muuBqQ9dgNEFl90kZpB7CgIk7J1Yga5q34
 X/0tqJjj13u72b/Je9Opon8=
X-Google-Smtp-Source: ABdhPJxkYYw2XbGfGKURyhRpH6boaYYKpat53CLT9cYotcvRIL2s4CHl/gop67NAmIcos1xmP/Y+CQ==
X-Received: by 2002:a05:620a:788:: with SMTP id
 8mr9564286qka.224.1611152527536; 
 Wed, 20 Jan 2021 06:22:07 -0800 (PST)
Received: from localhost.localdomain ([156.146.54.160])
 by smtp.gmail.com with ESMTPSA id n7sm1402912qkg.19.2021.01.20.06.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 06:22:05 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 akpm@linux-foundation.org, rppt@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arch: powerpc: mm: book3s64: Fixed spelling architectue ->
 architecture in line number 1061
Date: Wed, 20 Jan 2021 19:50:21 +0530
Message-Id: <20210120142020.2623355-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Jan 2021 07:49:58 +1100
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s/architectue/architecture/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 98f0b243c1ab..8b8f1451e944 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1058,7 +1058,7 @@ void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
 		 * Book3S does not require a TLB flush when relaxing access
 		 * restrictions when the address space is not attached to a
 		 * NMMU, because the core MMU will reload the pte after taking
-		 * an access fault, which is defined by the architectue.
+		 * an access fault, which is defined by the architecture.
 		 */
 	}
 	/* See ptesync comment in radix__set_pte_at */
--
2.30.0

