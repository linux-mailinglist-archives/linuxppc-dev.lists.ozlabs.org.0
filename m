Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A27A7A13
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 13:08:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Y7VJt+9K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrG3s6jTlz3cR0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 21:08:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Y7VJt+9K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--justinstitt.bounces.google.com (client-ip=2607:f8b0:4864:20::249; helo=mail-oi1-x249.google.com; envelope-from=3d9ikzqskdhydomnchmncnnaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--justinstitt.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x249.google.com (mail-oi1-x249.google.com [IPv6:2607:f8b0:4864:20::249])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrG3158PWz2ysB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 21:07:40 +1000 (AEST)
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-3ade1002692so3199866b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 04:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695208056; x=1695812856; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u02BBGPGfX0yPbijfRs1PCNnIlPGBgpzZObvNQnBP78=;
        b=Y7VJt+9KpAua967I69QPEF/PZWPPTvnvnI/zEv3pfU55FmX3VDtk7anTR/mViaS69/
         EEsc7BHst71G29lJo2DzD9rwFTI+lC2OcbQrZIWodYCh2TDOnNUeF+QBthZnjU0BZjEg
         oX45N3jZI50NM2put/pUTixOKN5kq91WYNNKmtC+2B0n6oCRuUj0YR4CaTWhePpP/ZEb
         yFh0gtrHhKk29ZdxyD/lT+ZGERfb6/l5qc9uHnGVLoN40K3Hk1Imo8Y2GJp9vqHsEb5s
         DKvvZvo9FRY08X2D0Poh977uLAft8VGOM7u4/+PIyb79VoAIZxRu71Tge3njpH9KMyib
         Tw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695208056; x=1695812856;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u02BBGPGfX0yPbijfRs1PCNnIlPGBgpzZObvNQnBP78=;
        b=q08xVpYQXzRO5lXruEVPkf+yG8c6ZhPoeapEFs0AUP52xOsu+hKD3dwNVtuLhKOouF
         Zzbu8jtSWBHLqSrWa7YjsmRNj4SYIDWO0FOwhszcBvNZCZQEfCulAsQzYDx3V+r8O8UH
         +PodJcmygGm+NqKWj6vJEuu1zj7wOUOMfzwuJz+9nsp1JB0bowlfez6OOhT7iirqGRTJ
         JVU83uMQ+GwXO+6vFiRHCwjVSpZnkmPy/PnGtZKB0ysJ96Q6CJJ2ZxS5PdLq5Y24VBjp
         iaci//B8qK1ToT/XlRWBTtzyPPCvsjZEfE9ae9OHCtE0+UKofI99yBbjsqHLJpzy995v
         lUXw==
X-Gm-Message-State: AOJu0YyKQzaI+osVnwiV0+NX5+Vm90GTBo6uL/gaZZ9E7Cw91ZiG7/Pk
	tHQuTrq2RaspgXIyVK4kexPSEppcfBzy4PRiww==
X-Google-Smtp-Source: AGHT+IE115b88HcBODPWahXYHJ0j40viadxpeRWbQ4t1GGOfk/djKEXImG98c+ybEVTBRw5IQmhnWJpaXy8orLNGFQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6808:19a8:b0:3a7:7e66:2197 with
 SMTP id bj40-20020a05680819a800b003a77e662197mr1072227oib.2.1695208055987;
 Wed, 20 Sep 2023 04:07:35 -0700 (PDT)
Date: Wed, 20 Sep 2023 11:07:35 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHbSCmUC/yWNuw7CMAwAf6XyjKUkCKrwK4ghdQ310DSy6QNV/
 Xci2O6Wux2MVdjg1uygvIjJlKv4UwM0pPxilL46BBfOLgaH9tZM5YO9ysJqKIGwm834j2VaWcd ESJjixfm2u8bWe6i9ovyU7fe6P47jC9mtn657AAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695208054; l=1809;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=43KHe364FJHinbfAf5b51PqpKyrOTl6pEsGjXdoYGGk=; b=eHtC0NjEj+DC+VenI5onyQtBNvqXdaXL9USn7KK2KyrqhUYYw7P14M/xRG/+v1dI6/SLaffNx
 BstvDQQ+GdLAUG418aw8Fsrorxtz2WZN/2c296ApqokqUhaW/aQjr8p
X-Mailer: b4 0.12.3
Message-ID: <20230920-strncpy-drivers-i2c-busses-i2c-powermac-c-v1-1-0a3e9a107f8a@google.com>
Subject: [PATCH] i2c: replace deprecated strncpy
From: Justin Stitt <justinstitt@google.com>
To: Andi Shyti <andi.shyti@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
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
Cc: linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We should prefer more robust and less ambiguous string interfaces.

`info.type` is expected to be NUL-terminated judging by its use in
`i2c_new_client_device()` wherein it is used to populate `client->name`:
|	strscpy(client->name, info->type, sizeof(client->name));

NUL-padding is not required and even if it was, `client` is already
zero-initialized.

Considering the two points from above, a suitable replacement is
`strscpy` [2] due to the fact that it guarantees NUL-termination on the
destination buffer without unnecessarily NUL-padding.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/i2c/busses/i2c-powermac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index 4996a628fdae..8e57ebe595be 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -231,7 +231,7 @@ static void i2c_powermac_create_one(struct i2c_adapter *adap,
 	struct i2c_board_info info = {};
 	struct i2c_client *newdev;
 
-	strncpy(info.type, type, sizeof(info.type));
+	strscpy(info.type, type, sizeof(info.type));
 	info.addr = addr;
 	newdev = i2c_new_client_device(adap, &info);
 	if (IS_ERR(newdev))

---
base-commit: 2cf0f715623872823a72e451243bbf555d10d032
change-id: 20230920-strncpy-drivers-i2c-busses-i2c-powermac-c-a95017b69711

Best regards,
--
Justin Stitt <justinstitt@google.com>

