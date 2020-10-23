Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B805296896
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 04:47:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHTCh6RybzDr1N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 13:47:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=po-hsu.lin@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHTB70yTnzDqwn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 13:45:50 +1100 (AEDT)
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kVn5P-0006lY-OC
 for linuxppc-dev@lists.ozlabs.org; Fri, 23 Oct 2020 02:45:48 +0000
Received: by mail-pf1-f198.google.com with SMTP id y7so2546493pff.20
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 19:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=w+LvmvsmtGzZ1uHzJzeUdiay07yaHYmlemmh1WTIDHI=;
 b=hamm84z0ILyRmPPFPAhuqY4CR6pDcvFnBmWmXTO3oxl4Uf5kaLjeZT0hXkoX+iqTIO
 oLijgi4ujXdB4NpDOC5LHeL3h5p6a4HnnsFNWfP8XXD3dlR2HsiMnEDwXcCd1h10HJsL
 Cj7B4O10OA19AayVCIf4dnXYCFTIlFG+mDFhl4KtJluW9ZNTy+tHeup2XWmLhHL6NmhI
 vlrCQ6yl/ixCHzZClbkKTkgIkWqMtVRrATAxkTvOU5FCJ4AVncyk/uw5XInVRFvnqYEU
 JFZxtt8bV/WxW6eg5n+4zhxieg86+gyQ1hmSo59P9yEy+HyEUkMwcl7hKeBo1Nu6tTNQ
 38gw==
X-Gm-Message-State: AOAM530G4MKsCWNZsxCTh9P5Jchzr1PqaPoi5N5+z39Sd2LG16f5mwUL
 /e/DrSNQbjZr9DmSjE7oN+2BkSL9e7ubC8gaawP4lIce4Bbeseq9DoJUiukTIvgJdQA7BAjRnTy
 XJ/jTscIS6bl6Aug1sd0AJ5rUqCO0aryHD6i+Ge+X/g==
X-Received: by 2002:aa7:93b6:0:b029:155:3b0b:d47a with SMTP id
 x22-20020aa793b60000b02901553b0bd47amr43920pff.47.1603421146345; 
 Thu, 22 Oct 2020 19:45:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv5aNbWQd3UURPz7hMTf6/sNTaQY+8/+utv3JQsZSdOZBhomxuettop494BLNfghDk6NDxdA==
X-Received: by 2002:aa7:93b6:0:b029:155:3b0b:d47a with SMTP id
 x22-20020aa793b60000b02901553b0bd47amr43896pff.47.1603421145874; 
 Thu, 22 Oct 2020 19:45:45 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id b10sm101465pfr.135.2020.10.22.19.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 19:45:45 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, mpe@ellerman.id.au
Subject: [PATCHv2] selftests/powerpc/eeh: disable kselftest timeout setting
 for eeh-basic
Date: Fri, 23 Oct 2020 10:45:39 +0800
Message-Id: <20201023024539.9512-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
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
Cc: joe.lawrence@redhat.com, mathieu.desnoyers@efficios.com,
 po-hsu.lin@canonical.com, mbenes@suse.cz, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The eeh-basic test got its own 60 seconds timeout (defined in commit
414f50434aa2 "selftests/eeh: Bump EEH wait time to 60s") per breakable
device.

And we have discovered that the number of breakable devices varies
on different hardware. The device recovery time ranges from 0 to 35
seconds. In our test pool it will take about 30 seconds to run on a
Power8 system that with 5 breakable devices, 60 seconds to run on a
Power9 system that with 4 breakable devices.

Extend the timeout setting in the kselftest framework to 5 minutes
to give it a chance to finish.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 tools/testing/selftests/powerpc/eeh/Makefile | 2 +-
 tools/testing/selftests/powerpc/eeh/settings | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/eeh/settings

diff --git a/tools/testing/selftests/powerpc/eeh/Makefile b/tools/testing/selftests/powerpc/eeh/Makefile
index b397bab..ae963eb 100644
--- a/tools/testing/selftests/powerpc/eeh/Makefile
+++ b/tools/testing/selftests/powerpc/eeh/Makefile
@@ -3,7 +3,7 @@ noarg:
 	$(MAKE) -C ../
 
 TEST_PROGS := eeh-basic.sh
-TEST_FILES := eeh-functions.sh
+TEST_FILES := eeh-functions.sh settings
 
 top_srcdir = ../../../../..
 include ../../lib.mk
diff --git a/tools/testing/selftests/powerpc/eeh/settings b/tools/testing/selftests/powerpc/eeh/settings
new file mode 100644
index 0000000..694d707
--- /dev/null
+++ b/tools/testing/selftests/powerpc/eeh/settings
@@ -0,0 +1 @@
+timeout=300
-- 
2.7.4

