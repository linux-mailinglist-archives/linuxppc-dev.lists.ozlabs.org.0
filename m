Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD85A6710
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 17:13:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MH9n952mBz3c99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 01:13:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fK9cBnGK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fK9cBnGK;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MH9mX0Mccz3bkR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 01:13:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 01490B81C55;
	Tue, 30 Aug 2022 15:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28E1C433D6;
	Tue, 30 Aug 2022 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661872389;
	bh=Pgu0YF4oBMGHXYWgr2TFEwahMVgu94xHlgw22WwIyBU=;
	h=From:To:Cc:Subject:Date:From;
	b=fK9cBnGKjoVCbzqeVmKWBzw9/2/Tladl+REU5tEVU0MW5DMA2JK+EICuWAEaD3Ekg
	 jOLXpOo3PRDVzImqYVz0IC6i5iGXps49kYZ+sSoTo9lzF0ySMEw6Ort7P4x+fk2TeP
	 EXDJF1zCuBd6ZdEogQGN/ld1wXA34gYZTaaqC7H/klPGdivESDnFv6zcd8R8cRFCSG
	 Jqe4FYD/xS3/r9s+1jM+ayvQVEj+jJH5Rx0PAqF/d/wVls4vorBfXzepWbs0s52tAP
	 n4Xk+N96K8Ob/VnVgGAlbRG3ttWXFEdAUzD+8JV81vx2d92wBxemEnhckcFN3v4HBv
	 3mFu13UZGu/PA==
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/papr_scm: Ensure rc is always initialized in papr_scm_pmu_register()
Date: Tue, 30 Aug 2022 08:12:56 -0700
Message-Id: <20220830151256.1473169-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.2
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Kajol Jain <kjain@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang warns:

  arch/powerpc/platforms/pseries/papr_scm.c:492:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
          if (!p->stat_buffer_len)
              ^~~~~~~~~~~~~~~~~~~
  arch/powerpc/platforms/pseries/papr_scm.c:523:64: note: uninitialized use occurs here
          dev_info(&p->pdev->dev, "nvdimm pmu didn't register rc=%d\n", rc);
                                                                        ^~
  include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
          dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
  include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                  _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                      ^~~~~~~~~~~
  arch/powerpc/platforms/pseries/papr_scm.c:492:2: note: remove the 'if' if its condition is always false
          if (!p->stat_buffer_len)
          ^~~~~~~~~~~~~~~~~~~~~~~~
  arch/powerpc/platforms/pseries/papr_scm.c:484:8: note: initialize the variable 'rc' to silence this warning
          int rc, nodeid;
                ^
                = 0
  1 warning generated.

The call to papr_scm_pmu_check_events() was eliminated but a return code
was not added to the if statement. Add the same return code from
papr_scm_pmu_check_events() for this condition so there is no more
warning.

Fixes: 9b1ac04698a4 ("powerpc/papr_scm: Fix nvdimm event mappings")
Link: https://github.com/ClangBuiltLinux/linux/issues/1701
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 54740af21557..2f8385523a13 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -489,8 +489,10 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 		goto pmu_err_print;
 	}
 
-	if (!p->stat_buffer_len)
+	if (!p->stat_buffer_len) {
+		rc = -ENOENT;
 		goto pmu_check_events_err;
+	}
 
 	nd_pmu->pmu.task_ctx_nr = perf_invalid_context;
 	nd_pmu->pmu.name = nvdimm_name(p->nvdimm);

base-commit: 91926d8b7e71aaf5f84f0cf208fc5a8b7a761050
-- 
2.37.2

