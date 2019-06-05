Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A80BF36627
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 23:00:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K1Qr5qv7zDqX8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 07:00:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="b5zgI136"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K1HF1QLrzDqX3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 06:54:01 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id d15so130518qkl.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 13:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=3I/eXWvJhwSVDdh8Zk+3yhEvGDlVYSksXxQUYrEAKJw=;
 b=b5zgI136ZoyI71YdMfYjvCeo5DwkFy5O06xRkDqWtHFpDCDlQYZFrU/aNE4MRqNRZH
 zbmWl0Loxa7+GSwkOReA/hGFD+nlccreU6RgEYTE/O81s8p161pXoFBHTDuxIHwdCbTy
 ZmrZkMRtXTGrcKPX3EtQ93T3UfG2N1zPciRGHef1AjUef5xSizA6hwqGwRw6Bd/7svO9
 afyd9X+/PH2pN4nIYEqGWP2Vawxp/0TJ1N9PjaK2cJqC/esj8Wp4ItEmIAqWddnj6ZJs
 WtEIXdo0KpExjAAPrQfncDOVEXlKxkJ91WKnmx0YvV9ZEPre4LockN/vCtlYv/iea0bI
 5eLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3I/eXWvJhwSVDdh8Zk+3yhEvGDlVYSksXxQUYrEAKJw=;
 b=ZOQpajzjYy/Jlp38gizgCOA6qczZNdsSUFAAl50Bn0s76XFySkDTfP+Df9fGPrtbFI
 BBjeCiTW8niH4SCqukZa854rgOkQ/7wKNjQ3HPyUEWiZj4IG8gz+xO0XUu7qRybrdF4P
 kWJV9pcBphQ3WJ5UPr76Lyu4j5UuiqVl6z92XNqztkcF+Y3wY6QZMei00JrJeZkVsVrR
 1LinUxfQfmazB5kAiG/77znvejM0i/BDG56RuIub8ox/JYcrD2YZyL26UAX79h3eng/F
 EG0elX5CeP7Z7a2T89e/P8dGZygc8ukIMiSOJZQ0N0rq4WXs/nX2d9YZtkkYdsaGT/aE
 l4IQ==
X-Gm-Message-State: APjAAAVBkSVd44yRg0Ue0mYBuMs4L18Ss1/GAZxQVYM1126ibSUyO/ea
 SQhQ0+XBYnkeoakx81lhGIeCPQ==
X-Google-Smtp-Source: APXvYqzUFHqsZZVYvNweCNBlnJ0lRHg417FNWY7bLMP+8s2MUhv7xbWQsQnjU5bAxZa8edaaKSE+6w==
X-Received: by 2002:a05:620a:124f:: with SMTP id
 a15mr35279575qkl.173.1559768037237; 
 Wed, 05 Jun 2019 13:53:57 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id n67sm12149368qte.42.2019.06.05.13.53.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 13:53:56 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/setup_64: fix -Wempty-body warnings
Date: Wed,  5 Jun 2019 16:53:38 -0400
Message-Id: <1559768018-7665-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
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
Cc: linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>,
 tyreld@linux.vnet.ibm.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the beginning of setup_64.c, it has,

  #ifdef DEBUG
  #define DBG(fmt...) udbg_printf(fmt)
  #else
  #define DBG(fmt...)
  #endif

where DBG() could be compiled away, and generate warnings,

arch/powerpc/kernel/setup_64.c: In function 'initialize_cache_info':
arch/powerpc/kernel/setup_64.c:579:49: warning: suggest braces around
empty body in an 'if' statement [-Wempty-body]
    DBG("Argh, can't find dcache properties !\n");
                                                 ^
arch/powerpc/kernel/setup_64.c:582:49: warning: suggest braces around
empty body in an 'if' statement [-Wempty-body]
    DBG("Argh, can't find icache properties !\n");

Suggested-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Signed-off-by: Qian Cai <cai@lca.pw>
---

v2: fix it by using a NOP while loop.

 arch/powerpc/kernel/setup_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 44b4c432a273..bed4ae8d338c 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -71,7 +71,7 @@
 #ifdef DEBUG
 #define DBG(fmt...) udbg_printf(fmt)
 #else
-#define DBG(fmt...)
+#define DBG(fmt...) do { } while (0)
 #endif
 
 int spinning_secondaries;
-- 
1.8.3.1

