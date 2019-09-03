Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A68A7677
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 23:46:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NL9z399jzDqng
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 07:46:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="wN1zs7zR"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NL7w45jnzDqY2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 07:44:28 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id q10so6682460pfl.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 14:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ePHWL5UBGW8VSpLG6dEo3DijGeVx5QzzAUce6TagAfs=;
 b=wN1zs7zRMQMpq9blbJO3J8E3XyvQwU3H+E0fWNR/Hu0jJlbkGp+y9JDerBZV4RdcOY
 Fqf855K8aydk7n99NRItkpzLV7xnj1IyoVVGAA0TGQZgLRa/XSDaqKY/EcdwL46m4lsn
 +hDXABd68P47Xo4mVOJeqNspSBJG3EM6nYVAffXHPaMZ5de+FpRBFNMq44k1cbP+/yXt
 JF8W1M08q683BrZIfXG3bQ7Px0Z08Ns9tCiMs1AbwkiHHCWKfzC25oLjCjzmob6DOVwn
 w3yimwfJif6Shcvd61k2leuRx6VomvaJTQy341oMJEa1+S0S0xaGDkI/ObBPE09GwW6I
 jXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ePHWL5UBGW8VSpLG6dEo3DijGeVx5QzzAUce6TagAfs=;
 b=Q0gmORTOj4JUcbIkZMznyA+3MWxUJAlfKlW4Ss/wh83MtnmVjHoDG5SQW6JIpV0gE8
 d5X0zgXRWsbqnnVLkMwOYBvAF44y3f7SpuMJtkpBQW6n112VsMFSEYN3TxnRdL45FyWA
 fIEwmnjryXiHdy5ojBPq6te/hErW+RSPfmH5J1VVnYT9CjJ1Us7uc89SoWUzlpwr8t9x
 B/aSC73iUFmXLN9GgQtZkfGDjgqCggl1ORXjEdF5Tflmd6rf6kBW9r/ztL7+mon04bGH
 4yHT+xArgsvqLvdoSAYi5Wnct8LRJf7O+6lnsbrs2bPeXsKTsfL8hJLDmxMfvKYRmsUl
 thTg==
X-Gm-Message-State: APjAAAUKSHdm5Pays0w5w+7tnuXfjJnkWCT9Zgl9vmsEO4AiXpIKk88f
 izb4KozPUM8xlFW8by5dCpX6dK95Zcs=
X-Google-Smtp-Source: APXvYqxrWjzb0irSaj7Pfo5g4gHJcv2MLq3ShR5b0brXHomU01z3a7Y9mSrf8krtY18aNy+hXKPPuQ==
X-Received: by 2002:a63:184b:: with SMTP id 11mr33845242pgy.112.1567547065968; 
 Tue, 03 Sep 2019 14:44:25 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([49.207.60.65])
 by smtp.gmail.com with ESMTPSA id t6sm487970pjy.18.2019.09.03.14.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 14:44:25 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] seltests/powerpc: Add a selftest for memcpy_mcsafe
Date: Wed,  4 Sep 2019 03:13:59 +0530
Message-Id: <20190903214359.23887-2-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903214359.23887-1-santosh@fossix.org>
References: <20190903214359.23887-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Appropriate self tests for memcpy_mcsafe

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 tools/testing/selftests/powerpc/copyloops/.gitignore       | 1 +
 tools/testing/selftests/powerpc/copyloops/Makefile         | 7 ++++++-
 tools/testing/selftests/powerpc/copyloops/asm/export.h     | 1 +
 .../testing/selftests/powerpc/copyloops/memcpy_mcsafe_64.S | 1 +
 4 files changed, 9 insertions(+), 1 deletion(-)
 create mode 120000 tools/testing/selftests/powerpc/copyloops/memcpy_mcsafe_64.S

diff --git a/tools/testing/selftests/powerpc/copyloops/.gitignore b/tools/testing/selftests/powerpc/copyloops/.gitignore
index de158104912a..12ef5b031974 100644
--- a/tools/testing/selftests/powerpc/copyloops/.gitignore
+++ b/tools/testing/selftests/powerpc/copyloops/.gitignore
@@ -11,3 +11,4 @@ memcpy_p7_t1
 copyuser_64_exc_t0
 copyuser_64_exc_t1
 copyuser_64_exc_t2
+memcpy_mcsafe_64
diff --git a/tools/testing/selftests/powerpc/copyloops/Makefile b/tools/testing/selftests/powerpc/copyloops/Makefile
index 44574f3818b3..0917983a1c78 100644
--- a/tools/testing/selftests/powerpc/copyloops/Makefile
+++ b/tools/testing/selftests/powerpc/copyloops/Makefile
@@ -12,7 +12,7 @@ ASFLAGS = $(CFLAGS) -Wa,-mpower4
 TEST_GEN_PROGS := copyuser_64_t0 copyuser_64_t1 copyuser_64_t2 \
 		copyuser_p7_t0 copyuser_p7_t1 \
 		memcpy_64_t0 memcpy_64_t1 memcpy_64_t2 \
-		memcpy_p7_t0 memcpy_p7_t1 \
+		memcpy_p7_t0 memcpy_p7_t1 memcpy_mcsafe_64 \
 		copyuser_64_exc_t0 copyuser_64_exc_t1 copyuser_64_exc_t2
 
 EXTRA_SOURCES := validate.c ../harness.c stubs.S
@@ -45,6 +45,11 @@ $(OUTPUT)/memcpy_p7_t%:	memcpy_power7.S $(EXTRA_SOURCES)
 		-D SELFTEST_CASE=$(subst memcpy_p7_t,,$(notdir $@)) \
 		-o $@ $^
 
+$(OUTPUT)/memcpy_mcsafe_64: memcpy_mcsafe_64.S $(EXTRA_SOURCES)
+	$(CC) $(CPPFLAGS) $(CFLAGS) \
+		-D COPY_LOOP=test_memcpy_mcsafe \
+		-o $@ $^
+
 $(OUTPUT)/copyuser_64_exc_t%: copyuser_64.S exc_validate.c ../harness.c \
 		copy_tofrom_user_reference.S stubs.S
 	$(CC) $(CPPFLAGS) $(CFLAGS) \
diff --git a/tools/testing/selftests/powerpc/copyloops/asm/export.h b/tools/testing/selftests/powerpc/copyloops/asm/export.h
index 05c1663c89b0..e6b80d5fbd14 100644
--- a/tools/testing/selftests/powerpc/copyloops/asm/export.h
+++ b/tools/testing/selftests/powerpc/copyloops/asm/export.h
@@ -1,3 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #define EXPORT_SYMBOL(x)
+#define EXPORT_SYMBOL_GPL(x)
 #define EXPORT_SYMBOL_KASAN(x)
diff --git a/tools/testing/selftests/powerpc/copyloops/memcpy_mcsafe_64.S b/tools/testing/selftests/powerpc/copyloops/memcpy_mcsafe_64.S
new file mode 120000
index 000000000000..f0feef3062f6
--- /dev/null
+++ b/tools/testing/selftests/powerpc/copyloops/memcpy_mcsafe_64.S
@@ -0,0 +1 @@
+../../../../../arch/powerpc/lib/memcpy_mcsafe_64.S
\ No newline at end of file
-- 
2.21.0

