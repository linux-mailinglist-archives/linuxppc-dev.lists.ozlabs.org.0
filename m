Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3670D72F5A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 09:13:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=AB1SzX7l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgxV514wpz30P8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 17:13:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=AB1SzX7l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=wuyonggang001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgxTD0xqBz309V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 17:12:47 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4QgxT734jCzBQJYg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 15:12:43 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1686726763; x=1689318764; bh=c7RaFsDa5kAGNhcFOSGO7z6+FkC
	thRmwJp7Hw4Z60gs=; b=AB1SzX7lR5CKs5uEHH8+G0KuN2jcD7M89WKDMBX6fSC
	iiFhJLoWldyy7H6+TJn2fVidX4EYoSCzVaTRSIz+NOJkDghePBzOpbHgsRO+kkiA
	EZmJnul1e/MWaBnGynFrSyvTyYq63eAYhfRg5oFzzdWSN0ELP4V6HE7yO15tvcze
	hlCtOfiSpXYGHeJX4yofzl5m21aAsAHuCMYxj/z1FeVO2S1Yu2zMWbRQ6Ve4MS32
	BUpYcDj2/oT6ogMREifncICyQuj8SmliRVbrfUbAvdPszw0Y6mJVto40gkfNo0OZ
	7TCd6ApbJcSXgfhJNNOIYGkuYDqqn01aRUl3b92gDBQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qWGN-nZSzDMY for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 14 Jun 2023 15:12:43 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4QgxT70W8GzBJLB3;
	Wed, 14 Jun 2023 15:12:43 +0800 (CST)
MIME-Version: 1.0
Date: Wed, 14 Jun 2023 15:12:42 +0800
From: wuyonggang001@208suo.com
To: shuah@kernel.org
Subject: [PATCH] selftests/powerpc: Remove unneeded variable
In-Reply-To: <20230614070926.36395-1-zhanglibing@cdjrlc.com>
References: <20230614070926.36395-1-zhanglibing@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <553bb6053c7b7bee60eda3ca90470ac3@208suo.com>
X-Sender: wuyonggang001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix the following coccicheck warning:

tools/testing/selftests/powerpc/alignment/alignment_handler.c:558:5-7: 
Unneeded variable: "rc". Return "0"

Signed-off-by: Yonggang Wu <wuyonggang001@208suo.com>
---
  .../powerpc/alignment/alignment_handler.c     | 24 +++++++++----------
  1 file changed, 12 insertions(+), 12 deletions(-)

diff --git 
a/tools/testing/selftests/powerpc/alignment/alignment_handler.c 
b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
index 33ee34fc0828..4980656c3f70 100644
--- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
+++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
@@ -332,7 +332,7 @@ int test_alignment_handler_vsx_206(void)
      STORE_VSX_XFORM_TEST(stxvd2x);
      STORE_VSX_XFORM_TEST(stxvw4x);
      STORE_VSX_XFORM_TEST(stxsdx);
-    return rc;
+    return 0;
  }

  int test_alignment_handler_vsx_207(void)
@@ -348,7 +348,7 @@ int test_alignment_handler_vsx_207(void)
      LOAD_VSX_XFORM_TEST(lxsiwzx);
      STORE_VSX_XFORM_TEST(stxsspx);
      STORE_VSX_XFORM_TEST(stxsiwx);
-    return rc;
+    return 0;
  }

  int test_alignment_handler_vsx_300(void)
@@ -380,7 +380,7 @@ int test_alignment_handler_vsx_300(void)
      STORE_VSX_XFORM_TEST(stxvx);
      STORE_VSX_XFORM_TEST(stxvl);
      STORE_VSX_XFORM_TEST(stxvll);
-    return rc;
+    return 0;
  }

  int test_alignment_handler_vsx_prefix(void)
@@ -399,7 +399,7 @@ int test_alignment_handler_vsx_prefix(void)
      STORE_VSX_8LS_PREFIX_TEST(PSTXSSP, 0);
      STORE_VSX_8LS_PREFIX_TEST(PSTXV0, 0);
      STORE_VSX_8LS_PREFIX_TEST(PSTXV1, 1);
-    return rc;
+    return 0;
  }

  int test_alignment_handler_integer(void)
@@ -458,7 +458,7 @@ int test_alignment_handler_integer(void)
      STORE_DFORM_TEST(stmw);
  #endif

-    return rc;
+    return 0;
  }

  int test_alignment_handler_integer_206(void)
@@ -473,7 +473,7 @@ int test_alignment_handler_integer_206(void)
      LOAD_XFORM_TEST(ldbrx);
      STORE_XFORM_TEST(stdbrx);

-    return rc;
+    return 0;
  }

  int test_alignment_handler_integer_prefix(void)
@@ -494,7 +494,7 @@ int test_alignment_handler_integer_prefix(void)
      STORE_MLS_PREFIX_TEST(PSTH);
      STORE_MLS_PREFIX_TEST(PSTW);
      STORE_8LS_PREFIX_TEST(PSTD);
-    return rc;
+    return 0;
  }

  int test_alignment_handler_vmx(void)
@@ -522,7 +522,7 @@ int test_alignment_handler_vmx(void)
      STORE_VMX_XFORM_TEST(stvehx);
      STORE_VMX_XFORM_TEST(stvewx);
      STORE_VMX_XFORM_TEST(stvxl);
-    return rc;
+    return 0;
  }

  int test_alignment_handler_fp(void)
@@ -550,7 +550,7 @@ int test_alignment_handler_fp(void)
      STORE_FLOAT_XFORM_TEST(stfsux);
      STORE_FLOAT_XFORM_TEST(stfiwx);

-    return rc;
+    return 0;
  }

  int test_alignment_handler_fp_205(void)
@@ -568,7 +568,7 @@ int test_alignment_handler_fp_205(void)
      STORE_FLOAT_DFORM_TEST(stfdp);
      STORE_FLOAT_XFORM_TEST(stfdpx);

-    return rc;
+    return 0;
  }

  int test_alignment_handler_fp_206(void)
@@ -582,7 +582,7 @@ int test_alignment_handler_fp_206(void)

      LOAD_FLOAT_XFORM_TEST(lfiwzx);

-    return rc;
+    return 0;
  }

@@ -599,7 +599,7 @@ int test_alignment_handler_fp_prefix(void)
      LOAD_FLOAT_MLS_PREFIX_TEST(PLFD);
      STORE_FLOAT_MLS_PREFIX_TEST(PSTFS);
      STORE_FLOAT_MLS_PREFIX_TEST(PSTFD);
-    return rc;
+    return 0;
  }

  void usage(char *prog)
