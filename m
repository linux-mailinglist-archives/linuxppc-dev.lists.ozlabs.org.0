Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2543C11C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 03:56:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NCls2H9NzDqS8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 11:56:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="dQpPZ6wo"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NCjp6rYfzDqJC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 11:54:37 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 19so5515435pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 18:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d8vqyEfyEGXEarVNNYpCOFtLHlqzQ7o7fyj/liwhzuE=;
 b=dQpPZ6woCtcySsrf4Ul24GN4v7BttX0OsyBXheASptYvWUSyDbA8NWCGKPrtzLqrrv
 l7K8qC2z/2pi73CIZUzt9wGWtnEYd8AlZiYKTJWC787q4ePdDEMTa8c4vEX7IO97tRxm
 +3EMgB0ZMLZh1elTgLedz+xdXlx53qs8ajD7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d8vqyEfyEGXEarVNNYpCOFtLHlqzQ7o7fyj/liwhzuE=;
 b=qnU2ex6Y9pEyPKBGHSQPZe/xrogVHQgtgN6daszjjpTvAP/UnZnzd12wEMkFwSwrm8
 iwsIWRrd7M47WGXQ6ghtDyLKe0+KA9n6GcPGGYajC/X2QnU6cd9XMOMqRjhrxL7cQMqF
 kRqOt8eMPp6V+W8iH1eAWzSI2lgYg0olzYo4WCwfPOIFamVPH/+gYPlSjtYH2bkoy4n7
 U6qqkeVGB8/RbN4VLKtpNzGaB96pnXkaPNDwxncvQlOUTIoVnJuZR8pNv2XR9iA7igKB
 vn3A7jSRygIq21GKISA4Ji/QkwR0bCoLQfEPJqtIkeIv5yq2epSObvxfN5JrtS55p5A9
 ev5Q==
X-Gm-Message-State: APjAAAW/LaW0CZt4wUDSNCzZ0fswalnuLznS3RA4VqHyjZ9lBnHioIef
 TIr4T/QDZTJ1HdOdF+H1f6m/Jg==
X-Google-Smtp-Source: APXvYqw3WSeugZDuLtsfP733puLMUeQvH9dbPzsXTHy2ldDDcutOiW/unPP4BCv/v+BIqhRKFY58ig==
X-Received: by 2002:a65:6284:: with SMTP id f4mr18441480pgv.14.1560218076066; 
 Mon, 10 Jun 2019 18:54:36 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id b26sm7741233pfo.129.2019.06.10.18.54.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 18:54:35 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: mpe@ellerman.id.au, ebiggers@kernel.org, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH] crypto: vmx - Document CTR mode counter width quirks
Date: Tue, 11 Jun 2019 11:54:31 +1000
Message-Id: <20190611015431.26772-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
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
Cc: leo.barbosa@canonical.com, Stephan Mueller <smueller@chronox.de>,
 nayna@linux.ibm.com, omosnacek@gmail.com, leitao@debian.org,
 pfsmorigo@gmail.com, marcelo.cerri@canonical.com, gcwilson@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The CTR code comes from OpenSSL, where it does a 32-bit counter.
The kernel has a 128-bit counter. This difference has lead to
issues.

Document it.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 drivers/crypto/vmx/aesp8-ppc.pl | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/vmx/aesp8-ppc.pl b/drivers/crypto/vmx/aesp8-ppc.pl
index 9c6b5c1d6a1a..db874367b602 100644
--- a/drivers/crypto/vmx/aesp8-ppc.pl
+++ b/drivers/crypto/vmx/aesp8-ppc.pl
@@ -1286,6 +1286,24 @@ ___
 
 #########################################################################
 {{{	# CTR procedure[s]						#
+
+####################### WARNING: Here be dragons! #######################
+#
+# This code is written as 'ctr32', based on a 32-bit counter used
+# upstream. The kernel does *not* use a 32-bit counter. The kernel uses
+# a 128-bit counter.
+#
+# This leads to subtle changes from the upstream code: the counter
+# is incremented with vaddu_q_m rather than vaddu_w_m. This occurs in
+# both the bulk (8 blocks at a time) path, and in the individual block
+# path. Be aware of this when doing updates.
+#
+# See:
+# 1d4aa0b4c181 ("crypto: vmx - Fixing AES-CTR counter bug")
+# 009b30ac7444 ("crypto: vmx - CTR: always increment IV as quadword")
+# https://github.com/openssl/openssl/pull/8942
+#
+#########################################################################
 my ($inp,$out,$len,$key,$ivp,$x10,$rounds,$idx)=map("r$_",(3..10));
 my ($rndkey0,$rndkey1,$inout,$tmp)=		map("v$_",(0..3));
 my ($ivec,$inptail,$inpperm,$outhead,$outperm,$outmask,$keyperm,$one)=
@@ -1357,7 +1375,7 @@ Loop_ctr32_enc:
 	addi		$idx,$idx,16
 	bdnz		Loop_ctr32_enc
 
-	vadduqm		$ivec,$ivec,$one
+	vadduqm		$ivec,$ivec,$one	# Kernel change for 128-bit
 	 vmr		$dat,$inptail
 	 lvx		$inptail,0,$inp
 	 addi		$inp,$inp,16
@@ -1501,7 +1519,7 @@ Load_ctr32_enc_key:
 	$SHL		$len,$len,4
 
 	vadduqm		$out1,$ivec,$one	# counter values ...
-	vadduqm		$out2,$ivec,$two
+	vadduqm		$out2,$ivec,$two	# (do all ctr adds as 128-bit)
 	vxor		$out0,$ivec,$rndkey0	# ... xored with rndkey[0]
 	 le?li		$idx,8
 	vadduqm		$out3,$out1,$two
-- 
2.20.1

