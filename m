Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A421E7BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 06:54:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453j006TdPzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 14:54:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="k9cSPMsL"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453hyc08tnzDqFY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 14:53:25 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id c13so717771pgt.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 21:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/nPH78rMZi+N42kFDUtjB2yFcI3lwn1M6vMbllJuVg=;
 b=k9cSPMsLXKJRS3JccoESqEluJdmibEefjgOjob0u2Go+/fMrse21E1o+Dorl8uf/ze
 Mu1XlT85aiOUX+BzfHAHvmA5TP/3eWnd8pa8fPGMGfQjFxKMhaRTnmww7Qz+Qx6EnRoC
 RCNrhqO2SX1ZCV0b2a2u2v+BiyMqX87Eb0Sczd/bHeqwO52vqofl03dmnhp/aqMjVaDA
 93ngqjvzhuBbDS7zGuSNy+1aOM/Te1hQaHHPEBIuNgpEfEpUzThNr8hv9NEwG1mJV11L
 3rbK514Wv0owmyRA5K2oyE2xW079xCt7yHT1lLPkJpyr21h9sawi2hhac4P4+0fRIwdT
 t5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=P/nPH78rMZi+N42kFDUtjB2yFcI3lwn1M6vMbllJuVg=;
 b=OHIAJXSAw12CzyUUylLK4Mo7HUn1V0TYmx4UvTRSHnIop+Vqmj/BzU+EQlBsi3aUBS
 U6zGunztqSTkA/qj5viPl4z/J+GuvLwHJcuICT7yw5FubgOJ3yszCi5j9IemBLiUOKW8
 3A4Rpabhc67y2vMuf9DciRPXY1aGnSSO4rNFKC3bwpr7DlQHfzC0B72wlxql2qKLRW+n
 6nJhZ3LJEm7EZ7oiN7NYS22BITFrkRg+axkxZO++1F4JdRTA0hiBtLgakJ901O4yrtK0
 pKB5AzMAEqo54vSN+AbMeri8yJ3kh7ZnLgTyUKj8qU6S8d1ZyxKiS18xQ2qPa37bSR69
 YGng==
X-Gm-Message-State: APjAAAUy+8ydpmF4S4Y51qu2vlPc0+p7iYuhk0u3jJw7O5aHfUDZ0T1/
 JpTS5nSjTWGF8tBCdWdWuEs=
X-Google-Smtp-Source: APXvYqwfckTGIbynQBCAqX7EmODSFULXGqw2TQrQAdQutgLvuNuKnB2EA6YgNm1nFV6iR6fVjRB5cA==
X-Received: by 2002:aa7:8e46:: with SMTP id d6mr16566727pfr.91.1557896002038; 
 Tue, 14 May 2019 21:53:22 -0700 (PDT)
Received: from voyager.jms.id.au ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id f29sm1296247pfq.11.2019.05.14.21.53.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 21:53:20 -0700 (PDT)
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
 Wed, 15 May 2019 14:23:14 +0930
From: Joel Stanley <joel@jms.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] powerpc/security: Fix build break
Date: Wed, 15 May 2019 14:22:06 +0930
Message-Id: <20190515045206.10610-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes a build break introduced in with the recent round of CPU
bug patches.

  arch/powerpc/kernel/security.c: In function ‘setup_barrier_nospec’:
  arch/powerpc/kernel/security.c:59:21: error: implicit declaration of
  function ‘cpu_mitigations_off’ [-Werror=implicit-function-declaration]
    if (!no_nospec && !cpu_mitigations_off())
                       ^~~~~~~~~~~~~~~~~~~

Fixes: 782e69efb3df ("powerpc/speculation: Support 'mitigations=' cmdline option")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
This should be applied to the 4.14 and 4.19 trees. There is no issue
with 5.1. The commit message contains a fixes line for the commit in
Linus tree.
---
 arch/powerpc/kernel/security.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index e9af5d9badf2..68d4ec373cfc 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -4,6 +4,7 @@
 //
 // Copyright 2018, Michael Ellerman, IBM Corporation.
 
+#include <linux/cpu.h>
 #include <linux/kernel.h>
 #include <linux/device.h>
 #include <linux/seq_buf.h>
-- 
2.20.1

