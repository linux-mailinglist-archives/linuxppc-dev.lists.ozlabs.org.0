Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FF677EBFD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 23:40:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=B3mPwfTr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR1l75Qlwz3cPF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 07:40:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=B3mPwfTr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--justinstitt.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3d0ldzaskddybmklafklallyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--justinstitt.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR1kD1wpMz30dt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 07:39:30 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-57320c10635so92201067b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 14:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692221967; x=1692826767;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dgfv9XpiXMzsq2kLywbyVX/AZp8i35sYGiNA5Uju+Tg=;
        b=B3mPwfTrF1Ige4phc1lVSf7W1iqdnDLezfu/Ms6Scp4jsTZmzB8Vfhv4DjxvTlOZcs
         tk9VlKRIXH/RwiRpno3xlRg+kYX83WMe3fSZqxLsQk8WKCjS3QrUPun6+6rZd3biMiEj
         ZG5kCeCarobtr+BZHlkQj9h7xwP4ChxqgVGCxRNAks9MBaH2PoN9TO+DMTtcDE8Js0xd
         33v65vYmTZ13eJmIkbsGN9AMOKxl5rl/FHmo+ofyFjDDjj5uScL02oYID9O494OUmQQa
         ZMvGjuUfwo8WSY4vIfUiJkdlTULm7UYdPh65MmP5xyig/2Fz+behqtWgnayNAE3uRygV
         KUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692221967; x=1692826767;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgfv9XpiXMzsq2kLywbyVX/AZp8i35sYGiNA5Uju+Tg=;
        b=hfx8UVkmpbHw2T+bpIZmoTJY2mXh1BZRi18cb3ZTkFseZINwg/Omm6rBl5YQWioonD
         wK2yoryKXimTVQ3ds+MqY1gnm9S6eYXdXbjxbNiVbRpiRAZ4GUTp8xV7gJXGQdZqsyp7
         o1O25N6fPU0/JNq0/M6OxXw68j2rgoRMx+N9R37M3KxySo8zjsLqov1oloRYRea20IcM
         cmbpP4q2EhOnGHHECW9TokthcyaUu3vC7vuyS1ihzSQCgVcd4JAR4r+lrGzU1dhOb+t8
         vfnW0V0Lhc5s2iMRJE0B81pNnUCTYS6zU0zooHyGI+rEunE45OIp8F6CU0sUsSo1e9u9
         FZZg==
X-Gm-Message-State: AOJu0YybFU3QA0tpOmwFuUvDy82t+w5HIimdnOWfctSVGh8u2k+vz7F8
	HX1RIVcuBEXd415kJRY75OYD4q/zUrdO8elaxQ==
X-Google-Smtp-Source: AGHT+IEVHWg7faDJGpLl8t8qRgynXOF8x/oPuFyxnuV6asqFbVWol9ZvrF92XF57cIBZH1l24F8+JcpNC2abmYHuJg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:ae66:0:b0:589:9ebc:4bfc with SMTP
 id g38-20020a81ae66000000b005899ebc4bfcmr41356ywk.9.1692221967232; Wed, 16
 Aug 2023 14:39:27 -0700 (PDT)
Date: Wed, 16 Aug 2023 21:39:24 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAtC3WQC/x3NwQrCMAyA4VcZORtYW5zFVxEPpctcQNuQFHWMv
 bvF43f5/x2MlMngOuyg9GbjWjrcaYC8pvIg5Lkb/OjDGN2E1rRk2TBpXlHqh1QyyjO1perLUCy gklTjVnXDeE4ux+lCsw/Qm6K08Pf/u92P4wcoxlPwfwAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692221966; l=1607;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=30eCBoYcInKFNOcnuhFfYjRixFwqc2selXbnOKgw6dI=; b=xDzKLH1yz1jxJwierFXeVLUgiJfBIeQIt+nXl5gaKMxMfmxMDGzOJZDP9cseijM4Ywj0ktUp1
 Q2cOTSB+/0pDQWF0iqwsPv7ZIS9SsHY6BJ5okfK8iTSE6218SV8h728
X-Mailer: b4 0.12.3
Message-ID: <20230816-strncpy-arch-powerpc-platforms-ps3-repository-v1-1-88283b02fb09@google.com>
Subject: [PATCH] powerpc/ps3: refactor strncpy usage
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
Cc: linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

`make_first_field()` should use similar implementation to `make_field()`
due to memcpy having more obvious behavior here. The end result yields
the same behavior as the previous `strncpy`-based implementation
including the NUL-padding.

Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note:
This follows up on a previous RFC which can be found here:
https://lore.kernel.org/all/20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com/
---
 arch/powerpc/platforms/ps3/repository.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/repository.c b/arch/powerpc/platforms/ps3/repository.c
index 205763061a2d..1abe33fbe529 100644
--- a/arch/powerpc/platforms/ps3/repository.c
+++ b/arch/powerpc/platforms/ps3/repository.c
@@ -73,9 +73,9 @@ static void _dump_node(unsigned int lpar_id, u64 n1, u64 n2, u64 n3, u64 n4,
 
 static u64 make_first_field(const char *text, u64 index)
 {
-	u64 n;
+	u64 n = 0;
 
-	strncpy((char *)&n, text, 8);
+	memcpy((char *)&n, text, strnlen(text, sizeof(n)));
 	return PS3_VENDOR_ID_NONE + (n >> 32) + index;
 }
 

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230816-strncpy-arch-powerpc-platforms-ps3-repository-85a1c867ed23

Best regards,
--
Justin Stitt <justinstitt@google.com>

