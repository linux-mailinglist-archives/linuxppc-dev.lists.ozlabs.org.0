Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C38F32CAB9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 04:14:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrbYt3PXGz3cV7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 14:14:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jKnyWjMF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=menglong8.dong@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jKnyWjMF; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrZt21Qlpz30Pl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 13:43:04 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id e9so5839863pjj.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Mar 2021 18:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p9XOASjZi/B+/Tdwk2J3ZNUj0y7LUvV1fcbGUGMVUVQ=;
 b=jKnyWjMFC/FhozUcL9k4EFK6CGCMb8g4drCfBpEMtFEzQz1ZaB65OpQR0DhGOw4I4H
 dDnK4AGrO8ehFSbDCC78cw/VsKRF9aEgRlrspuUgyEeG1KPNSRzn1wHGjol+KRWFDNnq
 marKQZUVwgoGZuJZCW9DZb7ePiTqhuC4PITlF3pIXRVjzXpkGLqO6D4BUdhgc9pv5c4t
 UR5KJZn651nJwuqBu7k4Xs6XW9I21QyKFi0FmKN7X1xvF64cQ3PQc2DWsXR4n4EGd1mw
 OiemnJrB25gLUWpWShpai57xC9OUYk2zeaI709ZXoXd/SegSHcjcEupXslQB75x4Ym08
 FbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p9XOASjZi/B+/Tdwk2J3ZNUj0y7LUvV1fcbGUGMVUVQ=;
 b=QFbPMtYec4dcmBFnufiOHH6VxoPym7VuDoP5CZ+3meLvZZlUjvAFamX7zsQhsXTRVa
 Am9QUG3myc61nV8lKjWOl/BlDIr9x4injlQqOut4FOFXA2uz1EvmO4jZEftrhjpvwzrO
 rIQeB5CQ0jo/bLsaU6BpV74hR9ZfF24D3l2V4XThokUmj+Ym2A7QJAPLLt4YOhXGcci+
 VrO2sL0VeYTr3VCFUPFf52RHFauZYDn7rskAzOVluwy8/sUewFcWIr0BjDIjBnBlQngW
 +eleb3hmk9iZS3hDVcszYjGpLmWjQzNbkOBY+3qIaejvA6KQCEiCLUvfyCDdn0t3/tIg
 hcuw==
X-Gm-Message-State: AOAM531caNZo+zryq2/nV6Ix9/llk53w16eCy08dgdtKDrLW/wqJfsJE
 AvyaJczUR8R91cgCu/NsYec=
X-Google-Smtp-Source: ABdhPJye1qLaewI6IUQ0dDIT3PhMsjFm31Z9Qc/lnYueo/RHFFUZBjoR84pSVYn8cMj5JyyGFUaJGw==
X-Received: by 2002:a17:90a:4598:: with SMTP id
 v24mr2185607pjg.102.1614825780360; 
 Wed, 03 Mar 2021 18:43:00 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
 by smtp.gmail.com with ESMTPSA id h27sm19068913pfq.32.2021.03.03.18.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 18:42:59 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: zhang.yunkai@zte.com.cn
To: mpe@ellerman.id.au
Subject: [PATCH] arch/powerpc/include/asm/book3s/64/: remove duplicate include
 in mmu-hash.h
Date: Wed,  3 Mar 2021 18:42:51 -0800
Message-Id: <20210304024251.187564-1-zhang.yunkai@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Mar 2021 14:13:48 +1100
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
Cc: rdunlap@infradead.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 zhang.yunkai@zte.com.cn, paulus@samba.org, clg@kaod.org,
 aneesh.kumar@linux.ibm.com, ganeshgr@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

'asm/bug.h' included in 'arch/powerpc/include/asm/book3s/64/mmu-hash.h'
is duplicated.It is also included in the 12th line.

Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index f911bdb68d8b..3004f3323144 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -18,7 +18,6 @@
  * complete pgtable.h but only a portion of it.
  */
 #include <asm/book3s/64/pgtable.h>
-#include <asm/bug.h>
 #include <asm/task_size_64.h>
 #include <asm/cpu_has_feature.h>
 
-- 
2.25.1

