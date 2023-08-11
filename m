Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE3779954
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 23:21:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=69/W2KdB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMxZD1WqCz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 07:21:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=69/W2KdB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--justinstitt.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=34axwzaskdlqdomnchmncnnaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--justinstitt.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMxWV4tNXz2yVN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 07:19:34 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5866e5f6e40so66726397b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691788769; x=1692393569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JiHGiTVfdz5CucudaZHkceNNqnAp127R9oXTgpxLmS0=;
        b=69/W2KdBUbTfVSLt7H2R1qqS3DXKFqFlWpbGW7Cg3ECEi8vGGHJaho4vRdFup3fEeV
         zVcU2qUDoBdNFmSOCqTHHDQHKg2IrdYm39Vt5gS5rz94OnIR7DEtN2lsAVmSb0Tqz0Ht
         Z5l8peAOiEHZtJ2Gklp82OPAuiBTHojD7Pg5Q7iZZcREV+yEUuxSLNG0n8waPGLDRreo
         a+NcGUKV8kMK8j8cMqGepg+/OizzIBECrGyezlwSfbYn9niSi09jOGbJhiGnOPkuEtJ8
         YU/x8cXvc9erPDbri9oiyV6O0REpsuYGmemCP2W4ouJtR3u/tP7DEk/xn+Z9gKF0xqOQ
         LNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691788769; x=1692393569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiHGiTVfdz5CucudaZHkceNNqnAp127R9oXTgpxLmS0=;
        b=Y/FyEiYELaC4kSAqqWRHM9c8tOssU9kKg3P/CQ1kevRF1VGQ1+3byRss4lE2SgPUL4
         eksusLf4j5lEZ6hv3fbuF1Zu1JYw7jomO0UIHYSohYW1G8BgEUd8oPv32cccCpXbfu5r
         j1zEaVoAiQSm7hgnL/l9/UITAUr3GaLKoyKcyXrCvDchHmvtLckGJjEf8NPsjE3tkmpr
         cbLLh7AdHcesv9L/VGo5TuMZ6eYB0uZTxRvl+hh7wIkbZ3nbglvC4KAxHLIzJiF9t3Bn
         mBWOqs8RcK+LXLfOZsjJdj68xmrij2Qih9XCXd2QohLOqw9IubIy1QClAwk+7edYkEa5
         iYrw==
X-Gm-Message-State: AOJu0YwkFYqecKbzC9wrWvE5ue2bWsDXZ4g8TigOw2hO03cK6dAfPYTw
	mbkwT0TM1bHfgpckedsVRaRHaoEA3kh0C5IpHg==
X-Google-Smtp-Source: AGHT+IHbwU50kF0vOvJsfl6xiGMeCABLjZMuvF4jlcuA/i0PNQczwluQDWHlLkKRUAyDj0PAcSup4QVhVi2nvA+/Lg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:af49:0:b0:589:a610:aef with SMTP
 id x9-20020a81af49000000b00589a6100aefmr76862ywj.2.1691788769080; Fri, 11 Aug
 2023 14:19:29 -0700 (PDT)
Date: Fri, 11 Aug 2023 21:19:21 +0000
In-Reply-To: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com>
Mime-Version: 1.0
References: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691788764; l=2360;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=un5KrhEbUeSG5MIia1JYWEm7kQ5KlO4dof2rfH0SxB0=; b=3nGjJYu+m7uWyObArsWKunAcpSZnHjKe9mn5gkmY/yM21roqfaVuczXVmSVp0u0rKkq9+vbWf
 LjstrWwCo1OAJQJrgXlXQxNm1g4I4F9O5JB8O/Ope1+HZNTSmJBVJ/g
X-Mailer: b4 0.12.3
Message-ID: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-3-301052a5663e@google.com>
Subject: [PATCH RFC 3/3] powerpc/ps3: refactor strncpy usage attempt 2.5
From: Justin Stitt <justinstitt@google.com>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Forward declare `make_field` for a cleaner diff

Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 arch/powerpc/platforms/ps3/repository.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/repository.c b/arch/powerpc/platforms/ps3/repository.c
index 6b731a5d4adc..6a08bb7704da 100644
--- a/arch/powerpc/platforms/ps3/repository.c
+++ b/arch/powerpc/platforms/ps3/repository.c
@@ -20,6 +20,8 @@ enum ps3_lpar_id {
 	PS3_LPAR_ID_PME = 1,
 };
 
+static u64 make_field(const char *text, u64 index);
+
 #define dump_field(_a, _b) _dump_field(_a, _b, __func__, __LINE__)
 static void _dump_field(const char *hdr, u64 n, const char *func, int line)
 {
@@ -63,33 +65,33 @@ static void _dump_node(unsigned int lpar_id, u64 n1, u64 n2, u64 n3, u64 n4,
 }
 
 /**
- * make_field - Make subsequent fields of a repository node name.
- * @text: Text portion of the field.  Use "" for 'don't care'.
+ * make_first_field - Make the first field of a repository node name.
+ * @text: Text portion of the field.
  * @index: Numeric index portion of the field.  Use zero for 'don't care'.
  *
+ * This routine sets the vendor id to zero (non-vendor specific).
  * Returns field value.
  */
 
-static u64 make_field(const char *text, u64 index)
+static u64 make_first_field(const char *text, u64 index)
 {
-	u64 n = 0;
-
-	memcpy((char *)&n, text, strnlen(text, sizeof(n)));
-	return n + index;
+	return PS3_VENDOR_ID_NONE + ((make_field(text, index) - index) >> 32) + index;
 }
 
 /**
- * make_first_field - Make the first field of a repository node name.
- * @text: Text portion of the field.
+ * make_field - Make subsequent fields of a repository node name.
+ * @text: Text portion of the field.  Use "" for 'don't care'.
  * @index: Numeric index portion of the field.  Use zero for 'don't care'.
  *
- * This routine sets the vendor id to zero (non-vendor specific).
  * Returns field value.
  */
 
-static u64 make_first_field(const char *text, u64 index)
+static u64 make_field(const char *text, u64 index)
 {
-	return PS3_VENDOR_ID_NONE + ((make_field(text, index) - index) >> 32) + index;
+	u64 n = 0;
+
+	memcpy((char *)&n, text, strnlen(text, sizeof(n)));
+	return n + index;
 }
 
 /**

-- 
2.41.0.640.ga95def55d0-goog

