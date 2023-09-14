Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B561C7A119D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 01:21:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JD8XCF9b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmtcz4WnDz3cK8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 09:21:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JD8XCF9b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--justinstitt.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3y5udzqskdmoza89y389y99w44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--justinstitt.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmtc736yQz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 09:21:10 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d818fb959f4so1533666276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 16:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694733667; x=1695338467; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K4BixPSI6K4mFdvHjP22A4GYUb6n9IBpB9f1xvsMH7k=;
        b=JD8XCF9bxB0YXiWtFiEiKBFoFBaE7opAw6u4gRFChWda6nzRxzwQAhSyg6jVFemegA
         gYVnhZUjtA2IQa38nel4BNWOiPT6MFVTuCiJ1I9oNzQOlwDXXb3AvxnDNYaCZGGEhaNM
         hED3G+/JFCjwihx6KBqjMGk0RQlxtPgkzOOm3ZTNKwA0IVIX4LKK9sqOFTS7/uE+irUE
         dWBSwkBtDrgknivGJLt5GC569GUREgoA8WZOJRBXcZH6Yu34P098dJx4n7yPlnA5nh8C
         DcMJmzJVvpvOrGYYycHpE3qedpkE/+A3CnbMUR3tUtrEMY5ui47GoD2jJEE4FPOG5PX1
         eVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694733667; x=1695338467;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4BixPSI6K4mFdvHjP22A4GYUb6n9IBpB9f1xvsMH7k=;
        b=WQdjeCmP5mOQiqtxJPvtEE4qm2LlDTbC5aXgCy+mtYZLZwGfjgp42W/thEzpjg14zQ
         kCPTd6MvCUm6tAdWbUI0962Mcn/0SAjN5lSCdw3n4Kg/CJA2Z+NO6mZy3Ymk80HrETVr
         1kBosvBf0Pd/gyWsvcE5Mllrk62qO9EfemlAJO7U8HMlEhA10aK5eZOBWryCFveL+TsU
         dXKlnaexdOHkkSpY/d92jiSFYaqHTesJI2mSSEStoziL/ujYrba50bUfeLVsvVl2rDDt
         ZvO6acxm1l6WWfg2y4XwK9ZxGFqJlx84S0uD5kBhTSMEcUM7HSUty3bpiDQHQiVywFkV
         3ViA==
X-Gm-Message-State: AOJu0YyB3KuTwHHEJ8v1K0GqGAXk3Jwz7psAU3SUETSoMiWzH4Ppfq1O
	mirBWfokvlbB7lRZQbwPwqN0tX38MTL7AZ+yIg==
X-Google-Smtp-Source: AGHT+IFq3p2ctNKfynOgDkjxwZcw+cwOO3eWZyDO7yA9WDMfkjmAMvoMpTDs7Uz247dBLv6Bmcx4o1fQfc3Tnq8V7A==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a5b:cb:0:b0:d05:98ef:c16b with SMTP id
 d11-20020a5b00cb000000b00d0598efc16bmr208490ybp.5.1694733667417; Thu, 14 Sep
 2023 16:21:07 -0700 (PDT)
Date: Thu, 14 Sep 2023 23:21:06 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGGVA2UC/x3NMQ7CMAxA0atUnrGUNAhRroIYQuJSD3UiG6Wgq
 ncnYnzL/zsYKZPBbdhBqbFxkQ5/GiAtUV6EnLthdGNwkz+jvVVS/WJWbqSGy7YWQX6utWyk0jD h1UUXZn/JU4jQQ1Vp5s9/cn8cxw+ObRsDdAAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694733666; l=1418;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=EQqFhuW6eyqVcI+2qvkN1RrCgJ3Q+ZXalbGWG4ulzH0=; b=zl7/VHFqVwFRJkvIBYDgTR3z8vsBLvP/9HPrgIpXao92oev7YfIZMtLc+vTpq3+YfxHy/8tSV
 gQhyQ2VQBRIAJjn6FVAwdCVZDDTwvbnJgKbwaEimBGIqyZmsAX2qbOq
X-Mailer: b4 0.12.3
Message-ID: <20230914-strncpy-drivers-hwmon-ibmpowernv-c-v1-1-ba6b7f42c98c@google.com>
Subject: [PATCH] hwmon: (ibmpowernv) refactor deprecated strncpy
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

We should prefer more robust and less ambiguous string interfaces.

A suitable replacement is `strscpy` [2] due to the fact that it
guarantees NUL-termination on the destination buffer without
unnecessarily NUL-padding since `buf` is already zero-initialized.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/hwmon/ibmpowernv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 594254d6a72d..57d829dbcda6 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -234,7 +234,7 @@ static int get_sensor_index_attr(const char *name, u32 *index, char *attr)
 	if (copy_len >= sizeof(buf))
 		return -EINVAL;
 
-	strncpy(buf, hash_pos + 1, copy_len);
+	strscpy(buf, hash_pos + 1, copy_len);
 
 	err = kstrtou32(buf, 10, index);
 	if (err)

---
base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
change-id: 20230914-strncpy-drivers-hwmon-ibmpowernv-c-80a03f16d93a

Best regards,
--
Justin Stitt <justinstitt@google.com>

