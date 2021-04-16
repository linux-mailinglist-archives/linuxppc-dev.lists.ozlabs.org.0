Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FCF361E79
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 13:13:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMD8h1HDVz3c9T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 21:13:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZgYFYmGx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZgYFYmGx; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMD7t6Pdxz300C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 21:12:26 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FMD7k34t6z9sWD; Fri, 16 Apr 2021 21:12:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618571538;
 bh=K7YTqxtrJPMNZTltGAO0MVUHMJiEzeN58Dt0hTySp2w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZgYFYmGxuwGr2JCSR3i2nMlmOHFmRI07FBmBZPK4RetrHKKmvaNq5227JIsQb9IYb
 f0YLg+SOt1OzVdQ1XCc5xfGJZbwLrp4VgGUKXe3aFa45ZoBwZkSgHwbtFD/BWCAH4W
 U4HWl3DWReOwGwB+sDVoHpIHcoNnh1nanOS7PGLxmPclFiJ0GMw7Wpm9Fr0XVCnXhP
 VPVv8STjOrnesIepavAJbvZ+QIgRDgvNFRhog/KgSAJWu0k6niVxeT+r5QJDViLnvO
 zabx7F4TiSksRWPiDH8gvnjUDwMbF0ULNq19P9zwMFIkdiPJ/jVzASpAudLGmrZ6B1
 JL98YB+PVQ7FA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/papr_scm: Fix build error due to wrong printf
 specifier
Date: Fri, 16 Apr 2021 21:12:09 +1000
Message-Id: <20210416111209.765444-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416111209.765444-1-mpe@ellerman.id.au>
References: <20210416111209.765444-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When I changed the rc variable to be long rather than int64_t I
neglected to update the printk(), leading to a build break:

  arch/powerpc/platforms/pseries/papr_scm.c: In function 'papr_scm_pmem_flush':
  arch/powerpc/platforms/pseries/papr_scm.c:144:26: warning: format
    '%lld' expects argument of type 'long long int', but argument 3 has
    type 'long int' [-Wformat=]

Fixes: 75b7c05ebf90 ("powerpc/papr_scm: Implement support for H_SCM_FLUSH hcall")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index ae6f5d80d5ce..48de21902116 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -141,7 +141,7 @@ static int papr_scm_pmem_flush(struct nd_region *nd_region,
 	} while (rc == H_BUSY);
 
 	if (rc) {
-		dev_err(&p->pdev->dev, "flush error: %lld", rc);
+		dev_err(&p->pdev->dev, "flush error: %ld", rc);
 		rc = -EIO;
 	} else {
 		dev_dbg(&p->pdev->dev, "flush drc 0x%x complete", p->drc_index);
-- 
2.25.1

