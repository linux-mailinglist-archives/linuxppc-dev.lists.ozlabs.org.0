Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 735441176FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 21:06:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WvMw4xc8zDqS7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 07:06:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T0jaTOd4"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WvKN5zHfzDqDb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 07:04:08 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id j22so7518415oij.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2019 12:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G4lX5eJKbIc8x2MqyvzE/E7t4HYCVGzR2AGVHkKedOc=;
 b=T0jaTOd4QOUF9v8/lIlTVwazu3Na2r+8WN142yDlNT+6n8c3PqZxOng4fFKlN2P+84
 ZttX4gw2o7Za8Lz4bMA7hzYgwSXo9+jMfdrcJDehP6lpxCFDmgJcHrDPtWlZQWXPY3ml
 2l7ptN62CXwL3QdQdULCzVT3JLarlSuO4/9d+fTq8HTmdEpsIl5aMbl3vHf8ia1xukVB
 GOR0eaSUNNCUMkBkFxiH8CAUJxTGD349b0Rk6tZvSHx7cHy3+vQh8FkenptCZSCGqVx/
 44BKFc8EhZUHMWtKK0KoqnfyWzxnBdGdR6wcqBBnuaNkx6iijnvpJU7D/e7A3YnTcscJ
 9a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G4lX5eJKbIc8x2MqyvzE/E7t4HYCVGzR2AGVHkKedOc=;
 b=HQ0wPAszxmQOHK0xm6QLtO0Zp8vML4sIduZikyZ44DAr01FBRGnh8J60lk8B4s6xSa
 fTWIQrFmAEAu8YFjt441crYmeklZdF4fzxbod1eYvTgDOlZChf1aiRRoQvIHuK2BWpnP
 /LykDMO+vvHZ8nvQ0SdNaMw/U/yJpK1rMmbHO8miw8v4M96MeZwg639/b2d4IXNDynum
 I27E4LU4A70udzifawBy+dUMoL+kMAsdLO+qlPPzchHJ9odx0dc85iIpdgeJXrhDLr4m
 svO11aAy5ZY8FqbHvBtw5QV38f0jhhykGypkrnq4TnhcFtCA7U8u+zp6iW759eaGy7+9
 4WRg==
X-Gm-Message-State: APjAAAWm6vyhokwLt7IVeI81Qg2m9wU2syP14vMGKPakfEb7fThUIaSm
 LC8rx09sOFF3c5ClUEncgPw=
X-Google-Smtp-Source: APXvYqx6+vG6ZE2HfIGLpTilMccVGcopEJCfeuryXwYf63nVtZJORgHY/e0zzsInhfrH/vN9dkbssA==
X-Received: by 2002:a05:6808:1c6:: with SMTP id x6mr789282oic.49.1575921844942; 
 Mon, 09 Dec 2019 12:04:04 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id m19sm326478otn.47.2019.12.09.12.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 12:04:04 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/44x: Adjust indentation in ibm4xx_denali_fixup_memsize
Date: Mon,  9 Dec 2019 13:03:38 -0700
Message-Id: <20191209200338.12546-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang warns:

../arch/powerpc/boot/4xx.c:231:3: warning: misleading indentation;
statement is not part of the previous 'else' [-Wmisleading-indentation]
        val = SDRAM0_READ(DDR0_42);
        ^
../arch/powerpc/boot/4xx.c:227:2: note: previous statement is here
        else
        ^

This is because there is a space at the beginning of this line; remove
it so that the indentation is consistent according to the Linux kernel
coding style and clang no longer warns.

Fixes: d23f5099297c ("[POWERPC] 4xx: Adds decoding of 440SPE memory size to boot wrapper library")
Link: https://github.com/ClangBuiltLinux/linux/issues/780
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/powerpc/boot/4xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/4xx.c b/arch/powerpc/boot/4xx.c
index 1699e9531552..00c4d843a023 100644
--- a/arch/powerpc/boot/4xx.c
+++ b/arch/powerpc/boot/4xx.c
@@ -228,7 +228,7 @@ void ibm4xx_denali_fixup_memsize(void)
 		dpath = 8; /* 64 bits */
 
 	/* get address pins (rows) */
- 	val = SDRAM0_READ(DDR0_42);
+	val = SDRAM0_READ(DDR0_42);
 
 	row = DDR_GET_VAL(val, DDR_APIN, DDR_APIN_SHIFT);
 	if (row > max_row)
-- 
2.24.0

