Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F828BF8F0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 10:42:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T5s20t+9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZ7tV46qYz3cWd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 18:42:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T5s20t+9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=colin.i.king@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZ7sk5N2Nz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 18:41:29 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-41f9ce16ed8so1381075e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2024 01:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715157679; x=1715762479; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oahqZfDyyAg3+t3i7wWbHAtk2w+BE0/9KN4JkqkuepE=;
        b=T5s20t+9qdDBdeSEZxv3b61tYru5vjdJSrYrctnZqc5PJLbLElyE+ueeedrKq62dDO
         edcRe2nE/JYLQach+JSYC1+AS35RJSWCcYc2EbLjxWgdAbM2yj4xtQlsZmURBO+5TnUg
         9z2zBbmlaZH+nF32lDOPFzgIHsFtwFBaKDlg2RJEOB+TsIOulAhMWjCOwjnFjB1Caxvz
         ySAH/e+LvqK9mtrZdv/chIDXWrXYL7BImkFgoETrTlHwEsciRU5Jnr3OsxivzwjExY7D
         ZEWM4rNMARVwhBw7/w5pL60Zse5jOc5zrkv3cYZltQl+Qg0PKaLz/c3iH05gKgoGr6vK
         AbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715157679; x=1715762479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oahqZfDyyAg3+t3i7wWbHAtk2w+BE0/9KN4JkqkuepE=;
        b=EgEB41LTn7cKZx2025WNty6pkh7AXG9yX3KcYKofog3pA/YVrz9XuBRSc+n+KkctoY
         T8e+c7BDi1xo3OMamFEl2TF4qlghG+nB0hTzVaZAHwgJuW8ZzKla50HI/9WTzYg8E4el
         BOCKVkX78fKrYEq124vU+9Ld0Y4B/RAtRhrNQJgxBhJA6blKPnKSxu4QBCZg48Stf3i7
         992R7FDRfV4OPehWkH7oR0YOZ6Bdk5TTHrB049VJn+opmBH6aNQXM5Z48GMhbaUbMy6I
         S5D/PPlzBVCTFFi4DKmcXGMb1ocst0fSLePURpuA04jTzHHalrBO2hxPqWBqvFcK3b6R
         aQ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWp9hwQe6UeBoN31+Fi0YA6Z4rRCwtzJkXDHUFugoSU3wKx4vFsAzrS9+KaMhQFduhDJ5NBSqttMvppP1jQIUfgcLuPtOHsW4ZYFmbXnQ==
X-Gm-Message-State: AOJu0YxV7ocO5L7qhy2gqVaEAQnB1+JRFS6uq76BjekXcj4SiQ1pukGy
	oCoFZ8gHHJH13W88qtUXgQHv8YqzHxn04HBnxuhsyQ81nwD5rEhX
X-Google-Smtp-Source: AGHT+IFlZthE/gNpHlsP4PzBCS7/ATHrR1sotaFVQmvVdO9ZDKPaoW32q0ewDHy1qLhhfNuhcB32Bg==
X-Received: by 2002:a05:600c:3587:b0:41b:fa34:9e48 with SMTP id 5b1f17b1804b1-41f719d6190mr19055165e9.30.1715157679003;
        Wed, 08 May 2024 01:41:19 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f87b26675sm14959835e9.2.2024.05.08.01.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 01:41:18 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Shuah Khan <shuah@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	Benjamin Gray <bgray@linux.ibm.com>
Subject: [PATCH][next] selftests/powerpc/dexcr: Fix spelling mistake "predicition" -> "prediction"
Date: Wed,  8 May 2024 09:41:17 +0100
Message-Id: <20240508084117.2869261-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a spelling mistake in the help message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/powerpc/dexcr/chdexcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/dexcr/chdexcr.c b/tools/testing/selftests/powerpc/dexcr/chdexcr.c
index bda44630cada..c548d7a5bb9b 100644
--- a/tools/testing/selftests/powerpc/dexcr/chdexcr.c
+++ b/tools/testing/selftests/powerpc/dexcr/chdexcr.c
@@ -26,7 +26,7 @@ static void help(void)
 	       "\n"
 	       "The normal option sets the aspect in the DEXCR. The --no- variant\n"
 	       "clears that aspect. For example, --ibrtpd sets the IBRTPD aspect bit,\n"
-	       "so indirect branch predicition will be disabled in the provided program.\n"
+	       "so indirect branch prediction will be disabled in the provided program.\n"
 	       "Conversely, --no-ibrtpd clears the aspect bit, so indirect branch\n"
 	       "prediction may occur.\n"
 	       "\n"
-- 
2.39.2

