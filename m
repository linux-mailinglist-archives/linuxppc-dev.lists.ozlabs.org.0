Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8EC779956
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 23:22:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=128hCHya;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMxb96Ss1z3c2f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 07:22:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=128hCHya;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--justinstitt.bounces.google.com (client-ip=2001:4860:4864:20::4a; helo=mail-oa1-x4a.google.com; envelope-from=336xwzaskdlibmklafklallyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--justinstitt.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x4a.google.com (mail-oa1-x4a.google.com [IPv6:2001:4860:4864:20::4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMxWW22G7z2yW5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 07:19:34 +1000 (AEST)
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-1c1112030a7so1805727fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691788768; x=1692393568;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQpId7/xrpQlCKdhMKKnoX3RMnX16k+BrWUnYQTLzJw=;
        b=128hCHya//JHzdXhTW2CGyRdp38F0s52ydFM+ztzOLjWpqji4lq7pRKtUvxGv84IkH
         wTsTmt7XD+pLGDWgO+vr/qo4k/H/EqByvTcULpct3zOI2yFHEP+DuGVJ3DY08XXZNvba
         XjqfRrHnR9CNNHo3IiiSWnahVHqbPnt1J7Vv7ouY70wrKUfBlDC3DXK5DyQBNc4oTxuA
         I+28vm9RAKZYpeLXLVoVDQscn2FTLOS+BhBJw4/ipAlkBwpxC2QOzF/Tc+xi+v5KI+Rb
         ItXmg3VLoMd2HBgt3X5I8nnv8VqWD4LOe70c8pfhXN6nlrUbLXHvKWZ5fpT1zDF+A57S
         3dHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691788768; x=1692393568;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQpId7/xrpQlCKdhMKKnoX3RMnX16k+BrWUnYQTLzJw=;
        b=IF8RLfDPOhtw6scB0VHqYKNjjTGJjoTirBztO3RQfBV62FAvlu9lFpi1uTPKN5G/hf
         lF6PTP2p9YkA0wVcGUGmAcpcSlNeiYNhTNZjyJSetHSKa9uguLNMVp3U1KfpgaL/UuOG
         v59hY2kh0qBpLSJUVYDzxbF6sBKW4+4XV82E0DmzBA2xPpZaAQgYtLsRbnoFthHPDVg+
         12lND+iHgg5l5gsx4451pwNd8JhJ1Z5xGDkrSBaLqPdh6mgpTtX8DTfgYHlu/SPoPdQ0
         3jGARxqesQauu/8T/p9eYHOj2NquqGnouExsDbBynlGU2DaSITUOzEXkAHqGAyhANPcd
         A5FA==
X-Gm-Message-State: AOJu0YwAmeoneH7eNp1Vi1PDVdiAxqQLLOr9YpgYgDAV7/+6QbV3F0KK
	bYXT3QTN0BxqilE1JGKpRhaGpKXfIcytVLCLbA==
X-Google-Smtp-Source: AGHT+IGk1uf0kGWR1cjzqQP7AfmkJkzJDJmfyuKmDjGLWg1w0/gQx1YVAdwd/TAqEYcQ0G5w7a5EsM3oLCtnyG9dyA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6870:9567:b0:1c0:eac2:979c with
 SMTP id v39-20020a056870956700b001c0eac2979cmr65726oal.3.1691788767834; Fri,
 11 Aug 2023 14:19:27 -0700 (PDT)
Date: Fri, 11 Aug 2023 21:19:20 +0000
In-Reply-To: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com>
Mime-Version: 1.0
References: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691788764; l=2495;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=OU2B7x8FNL1q157scUIMm8YAPWH0YRRYFkNwfqAAlYc=; b=t8i/MBrRZYTBCyZG+n62sm6BtF8rrxy6c3AXOklnMgD6g/y9j3NSShRjs0U3zb6DojFQXi7R6
 t71tXOebyWwC4lP3GudY7BB2KoS2VPhOxRDI6pEsirAJWNJJ7/C+0lD
X-Mailer: b4 0.12.3
Message-ID: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-2-301052a5663e@google.com>
Subject: [PATCH RFC 2/3] powerpc/ps3: refactor strncpy usage attempt 2
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

This approach tries to use `make_field` inside of `make_first_field`.
This comes with some weird implementation as to get the same result we
need to first subtract `index` from the `make_field` result whilst being
careful with order of operations. We then have to add index back.

The behavior should be the same but would love some comments on this.

Signed-off-by: Justin Stitt <justinstitt@google.com>

---
Note: I swapped the position of the two methods so as to not have to
forward declare `make_field`. This results in a weird diff here.
---
 arch/powerpc/platforms/ps3/repository.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/repository.c b/arch/powerpc/platforms/ps3/repository.c
index 1abe33fbe529..6b731a5d4adc 100644
--- a/arch/powerpc/platforms/ps3/repository.c
+++ b/arch/powerpc/platforms/ps3/repository.c
@@ -63,36 +63,33 @@ static void _dump_node(unsigned int lpar_id, u64 n1, u64 n2, u64 n3, u64 n4,
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
 	u64 n = 0;
 
 	memcpy((char *)&n, text, strnlen(text, sizeof(n)));
-	return PS3_VENDOR_ID_NONE + (n >> 32) + index;
+	return n + index;
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

-- 
2.41.0.640.ga95def55d0-goog

