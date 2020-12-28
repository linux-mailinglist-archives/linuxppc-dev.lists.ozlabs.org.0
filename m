Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3612E3408
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Dec 2020 05:36:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D44WZ0GfRzDqDc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Dec 2020 15:36:42 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D44Tv5n1ZzDq8W
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Dec 2020 15:35:14 +1100 (AEDT)
Received: from mail-pf1-f200.google.com ([209.85.210.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1ktkFR-0005R6-Rz
 for linuxppc-dev@lists.ozlabs.org; Mon, 28 Dec 2020 04:35:10 +0000
Received: by mail-pf1-f200.google.com with SMTP id r15so2895611pfg.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Dec 2020 20:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xDaj2aGFc8Ryio1B37xmDRbgZ25x8BPX+LqRqApW28A=;
 b=ZKSGzoQv62H5s+b6hH2Li3u9P2GJ0eDQPr+7O6f3fIlIqkPOHR8vjmK7zV7QKdARqI
 Wij5BQcECmuo7ohxMWVqCziLc1jpM3DjzdbaWL4b8e9+bnPE7ujuPDzncuEeIn3OSYS1
 xQCHE5WGaiRwMvYfCAOWvOOYeZwAmB+3tTpgjmNWuETaADpFKPO1E9hKJzwQqFvje638
 HxgPWKIKPnaMF7p0Aa+nx5/wa+TeUn0+OajdC/lSEpikWmBMlLhg7GYEXfSm9t7NAGNS
 Z7EAN46r39lJfnDaixhwPiJ47zCmbmhmmElYkMEyPXW99FCKd+OoO17zdadbHk1MM3VQ
 huTg==
X-Gm-Message-State: AOAM53071wtgiQOZ25fjOpkLBGGwsH2ev930u8CrZoddmKLofZOpS9a2
 E6rRGHVwjgJUTNdpBCyEwe5L+9yyPIu6YRUrW7yyep1IbSbVReS8938BYGcq1MLb2OXTlNyxASj
 rIJHlnBbKf01buZVwjq5z+A+o5GNh3NosSh9QNcrfpA==
X-Received: by 2002:a05:6a00:8c7:b029:19d:afa5:34e5 with SMTP id
 s7-20020a056a0008c7b029019dafa534e5mr39739019pfu.30.1609130108308; 
 Sun, 27 Dec 2020 20:35:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAvOE6o0cTX5MNAozIzz9VZuWmqcjEVnhGxLPmH3qElG3qiwVdIXI/yBMtB9j5uKel2nyJxA==
X-Received: by 2002:a05:6a00:8c7:b029:19d:afa5:34e5 with SMTP id
 s7-20020a056a0008c7b029019dafa534e5mr39739005pfu.30.1609130107999; 
 Sun, 27 Dec 2020 20:35:07 -0800 (PST)
Received: from Leggiero.taipei.internal (61-220-137-38.HINET-IP.hinet.net.
 [61.220.137.38])
 by smtp.gmail.com with ESMTPSA id a1sm34567962pfo.56.2020.12.27.20.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Dec 2020 20:35:07 -0800 (PST)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: make the test check in eeh-basic.sh posix
 compliant
Date: Mon, 28 Dec 2020 12:34:59 +0800
Message-Id: <20201228043459.14281-1-po-hsu.lin@canonical.com>
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
Cc: oohall@gmail.com, po-hsu.lin@canonical.com, shuah@kernel.org,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The == operand is a bash extension, thus this will fail on Ubuntu with

As the /bin/sh on Ubuntu is pointed to DASH.

Use -eq to fix this posix compatibility issue.

Fixes: 996f9e0f93f162 ("selftests/powerpc: Fix eeh-basic.sh exit codes")
Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 tools/testing/selftests/powerpc/eeh/eeh-basic.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/eeh/eeh-basic.sh b/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
index 0d783e1..64779f0 100755
--- a/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
+++ b/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
@@ -86,5 +86,5 @@ echo "$failed devices failed to recover ($dev_count tested)"
 lspci | diff -u $pre_lspci -
 rm -f $pre_lspci
 
-test "$failed" == 0
+test "$failed" -eq 0
 exit $?
-- 
2.7.4

