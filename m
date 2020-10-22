Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C91295A92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 10:39:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH14j0ByqzDqmY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 19:39:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH11B4v4vzDqgk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 19:36:30 +1100 (AEDT)
Received: from mail-pf1-f199.google.com ([209.85.210.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kVW5C-0003FV-Dx
 for linuxppc-dev@lists.ozlabs.org; Thu, 22 Oct 2020 08:36:26 +0000
Received: by mail-pf1-f199.google.com with SMTP id q16so770933pfj.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 01:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F2jy434wIuwXoLXzyeW6c/CAdjOSlRMynxqAD7g4/dU=;
 b=J2eYHDNKvSj0UhLVHhW7jVMuFhFxvQJWVmnEJ+JEZmYhjOLwHaABuklKN7IwIw2f2V
 BuVCN40y3G3ug+jeS7ABmHx6SLULUuX+WKatuJtkd4aAe5BuPxU2DF+PpV6F6hNY7cHU
 BcJ7ndioxJ2niIwQ9ZMN8feptsYguKmQcmDe4buV2zMAtdlDI2ue/9oVv/FnYnoq79mQ
 k/dafpmykSPvFLinvu5vgvTMDsSdgVs/UTouBiKuQ7CGD0DGDsEu2ly3ls3ZAKNIWLlx
 PCd2dsX9FHuykXPEvikKGKXr/I2jY0EoLtfNRyL/qDV64TZdBPnBF15DLX6DkGgstGZT
 xMiw==
X-Gm-Message-State: AOAM5311aTF0zytoxvd1XziZaXoFuM9BPdBVw3wxun4YquGOuK2rh8M9
 o/LMPZn7rGmk8kNkWw0GNPr5xaNaGMrz2Ttyy6YIXDXXNaOxgHMxhXK0Ypv4CxbRxaw8T/YXvtl
 6J9iqCnbohl8qSeR+UdU3A3SzEE74XJDtXtEn1BQ76A==
X-Received: by 2002:a17:90b:438c:: with SMTP id
 in12mr1367422pjb.32.1603355784923; 
 Thu, 22 Oct 2020 01:36:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNakAo0xdaw0VJxwPqXKhIaUfkhybuIzehY4Ztq4OIlZTIcIge6pr0+zczxLDbkwa2t0WsBg==
X-Received: by 2002:a17:90b:438c:: with SMTP id
 in12mr1367403pjb.32.1603355784654; 
 Thu, 22 Oct 2020 01:36:24 -0700 (PDT)
Received: from localhost.localdomain (223-137-29-213.emome-ip.hinet.net.
 [223.137.29.213])
 by smtp.gmail.com with ESMTPSA id y191sm1335465pfb.175.2020.10.22.01.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 01:36:23 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/powerpc/eeh: disable kselftest timeout setting for
 eeh-basic
Date: Thu, 22 Oct 2020 16:36:16 +0800
Message-Id: <20201022083616.41666-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.25.1
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
Cc: joe.lawrence@redhat.com, po-hsu.lin@canonical.com,
 mathieu.desnoyers@efficios.com, mbenes@suse.cz, shuah@kernel.org
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

Thus it's better to disable the default 45 seconds timeout setting in
the kselftest framework to give it a chance to finish. And let the
test to take care of the timeout control.

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
index 0000000..e7b9417
--- /dev/null
+++ b/tools/testing/selftests/powerpc/eeh/settings
@@ -0,0 +1 @@
+timeout=0
-- 
2.7.4

