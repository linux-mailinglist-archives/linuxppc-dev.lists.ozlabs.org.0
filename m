Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0A013D460
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 07:34:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yvZ56pC7zDqRB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 17:34:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=GfTRpKom; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yvNj6mXGzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 17:26:45 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id e11so1083872pjt.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 22:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SI5glm9tTBFJlI56hJYs/doyA7zUbu5YUKwxBp+hpYY=;
 b=GfTRpKom0tPQq8D4aXQyI2foQczp9UuJXSAyw66CT6hkWQrJmpym0PT6cvNRyGY8Uk
 0VvHyXu1/QQxb3+Jjk5FQ//6OW1fSF4+GEXglW8TGLZKjd4szY+kf1EU0mFv2H1ywD7M
 VbwSiZQaQuyCsyymCLbnA4sRvShcMEGUaENZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SI5glm9tTBFJlI56hJYs/doyA7zUbu5YUKwxBp+hpYY=;
 b=a8wp8AeUddrKvfi30TN1LNiRvIrhPHtiGBgztrsJArPefqeHYXVnc9lgMlr3whXu79
 xpLgEDq+eU5OAkwQf0pZW/g31ZeBOXIGhtqqj4Zs4o6N0/xg1DcwWCinO3YN1O9cB+od
 9zgMYMwat73uTK+LUaIgIJPVPPqKGLPtRArblRpWePEkDuT9Dg0lI7ECI14/LjapGf9/
 Nriz6GzVIFPV3AxhKvpO1xsh9BKeGBuVBM6M5xqr8V2pvyCAHF2QeBXTsyWwspYrVrqN
 GZKGIIt840GnXtAEiKxCJ7RDo2w2yoQkfaTG1JQtSn/qmQhlNlMYX1Zlp/hZJ2JeRSAK
 1u1A==
X-Gm-Message-State: APjAAAW8+QcYGE7h0udU9ZM3bSV/dgq+LlYoRqslRgXf8huKVY193HTW
 uXzibfEoPBXVr/cOo+jcUEqBKw==
X-Google-Smtp-Source: APXvYqyt2Oz5lp6I4QYJC6msD4qYWnWAGuSCIA+DMfGiAHr8tDPwjSQJBDVs1A0BbM5XvepejAB4uQ==
X-Received: by 2002:a17:902:6b8c:: with SMTP id
 p12mr29998912plk.290.1579156003508; 
 Wed, 15 Jan 2020 22:26:43 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-097c-7eed-afd4-cd15.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:97c:7eed:afd4:cd15])
 by smtp.gmail.com with ESMTPSA id r3sm24681158pfg.145.2020.01.15.22.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 22:26:42 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com
Subject: [PATCH v2 3/3] kasan: initialise array in kasan_memcmp test
Date: Thu, 16 Jan 2020 17:26:25 +1100
Message-Id: <20200116062625.32692-4-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116062625.32692-1-dja@axtens.net>
References: <20200116062625.32692-1-dja@axtens.net>
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
Cc: linux-s390@vger.kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linuxppc-dev@lists.ozlabs.org,
 dvyukov@google.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

memcmp may bail out before accessing all the memory if the buffers
contain differing bytes. kasan_memcmp calls memcmp with a stack array.
Stack variables are not necessarily initialised (in the absence of a
compiler plugin, at least). Sometimes this causes the memcpy to bail
early thus fail to trigger kasan.

Make sure the array initialised to zero in the code.

No other test is dependent on the contents of an array on the stack.

Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 lib/test_kasan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_kasan.c b/lib/test_kasan.c
index a130d75b9385..519b0f259e97 100644
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
@@ -619,7 +619,7 @@ static noinline void __init kasan_memcmp(void)
 {
 	char *ptr;
 	size_t size = 24;
-	int arr[9];
+	int arr[9] = {};
 
 	pr_info("out-of-bounds in memcmp\n");
 	ptr = kmalloc(size, GFP_KERNEL | __GFP_ZERO);
-- 
2.20.1

