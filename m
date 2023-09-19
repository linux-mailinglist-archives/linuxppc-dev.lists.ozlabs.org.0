Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE067A594E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 07:23:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kK3+8Q2e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqVSh2wyPz3cBQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 15:23:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kK3+8Q2e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--justinstitt.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3mtajzqskdoqpayzotyzozzmuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--justinstitt.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqVRq3B2Lz2ydR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 15:23:02 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-597f461adc5so64500377b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 22:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695100977; x=1695705777; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oNNrBnYfOYV0KaxSsoYAY7HFcM1nxRdVcxEdAxuQSek=;
        b=kK3+8Q2ekg/QwwKWCxUIGsaSsoxBULrrScI9B7C0GJjB699x0vURxErEdzcZpsk6Sy
         jXr6i8gmaq8I+T2E/IyaepNJBAXhK74UW2DUjUVxZQzqfXEo8p1ttyxW2y2YRAiAQ4wo
         XFmjliooc9ZRIM8o6FYRWcTmUKARjDUfU7hA7jVAzpLcBhU6YakHx6hcJtdKwLfrCxRS
         cyRHE3BKWJ/iHse8nXtyy8XMzVWHVGiCEoBSOTLsbar6JX2RV4+APmGCX1YwwnGNFH8U
         2noRic/uHSRmuqK/Bd6/NJela6FeKg21sftSPYG7FY9/ORVZfjc/DDu+7bUGH1HhqGzf
         uiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695100977; x=1695705777;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oNNrBnYfOYV0KaxSsoYAY7HFcM1nxRdVcxEdAxuQSek=;
        b=pFD2mbp1+FlA9zL4Sl2p2uu45TtAQeGdVdhRbyczK4b1+uGhUwf36Yd9P5Hm5acHN9
         qGZ1q+DFzsBQLEbw6EfDGnj8/M6rzSaaORo1KyM9MIw/V7WzT+Tk2JGCGwf/kYphSMRI
         3ODAiGZ5UIE5aRphOWuxrtYr1fTByyjSztl/YDwvP3ZWEwdNE4W37C6dn1QeIjTHbOy9
         CrgsGXevCrjVEEDKFleNdTLw2sJyVhqy/Rkv6E0Qe5jZKKKlY79jo6ghC+PgVKwGDlNb
         d6L3u47dRLe2iXcEQY0k8LppolyblcFp6FhROWtrHmgrPOJXYqJVVbE3anFBCkQhNf30
         Zf/g==
X-Gm-Message-State: AOJu0YyxHVG5RF9DLmzTlH4N9v7aOimWqC9tVQZKVjK0ECSex/8JH89r
	Nzj44SV29xwhD1q6kkJ20yxW1qkKP4ucZ54kmQ==
X-Google-Smtp-Source: AGHT+IG9VOZ8zzSUvNNcCsXcq/7ZmSP6vcfwDpombAcNa9QU+2UY0m040xo/bdOp7q8pB9p79XxGurEYq/YEnQlOsw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:cbc3:0:b0:d07:7001:495b with SMTP
 id b186-20020a25cbc3000000b00d077001495bmr246617ybg.11.1695100977385; Mon, 18
 Sep 2023 22:22:57 -0700 (PDT)
Date: Tue, 19 Sep 2023 05:22:51 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACowCWUC/5WNQQ6DIBAAv2I4dxtAY7Un/9F4QFx1kwpmMVhj/
 HupP+hx5jBziIBMGMQzOwRjpEDeJdC3TNjJuBGB+sRCS53LWhUQVnZ22aFnisgBpm32DqibF78
 huwgWKmlkPqiyr3MjUmhhHOhzTV5t4onC6nm/nlH97F/5qEBBZ8ruMRTa1pVtRu/HN96tn0V7n ucXgTQnLdUAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695100976; l=1508;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=OAz/JRiRID2OTRUyttHDX/ZpXIkZrNearv6uLWj/7bU=; b=x26VBNt6hCJK6tE9iCypOq5ZUv1fkpkRwGDtfS8IE17RETDDR0O83LqmzEj+caTfyJBrLb4x5
 WBI5kzz6P7aCpbLgI0Es1r5kYhqhQdKrtYkMYnrEgathKQdL8i+TK6m
X-Mailer: b4 0.12.3
Message-ID: <20230919-strncpy-drivers-hwmon-ibmpowernv-c-v2-1-37d3e64172bc@google.com>
Subject: [PATCH v2] hwmon: (ibmpowernv) refactor deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-hwmon@vger.kernel.org, Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

A suitable replacement is `memcpy` as we've already precisely calculated
the number of bytes to copy while `buf` has been explicitly
zero-initialized:
| 	char buf[8] = { 0 };

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- prefer memcpy to strscpy (thanks Kees)
- Link to v1: https://lore.kernel.org/r/20230914-strncpy-drivers-hwmon-ibmpowernv-c-v1-1-ba6b7f42c98c@google.com
---
 drivers/hwmon/ibmpowernv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 594254d6a72d..70ca833259ab 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -234,7 +234,7 @@ static int get_sensor_index_attr(const char *name, u32 *index, char *attr)
 	if (copy_len >= sizeof(buf))
 		return -EINVAL;
 
-	strncpy(buf, hash_pos + 1, copy_len);
+	memcpy(buf, hash_pos + 1, copy_len);
 
 	err = kstrtou32(buf, 10, index);
 	if (err)

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-strncpy-drivers-hwmon-ibmpowernv-c-80a03f16d93a

Best regards,
--
Justin Stitt <justinstitt@google.com>

