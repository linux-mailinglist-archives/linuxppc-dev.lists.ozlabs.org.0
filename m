Return-Path: <linuxppc-dev+bounces-3607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A689DC2A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2024 12:16:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y09cK2T34z2xl5;
	Fri, 29 Nov 2024 22:16:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732877078;
	cv=none; b=X+xhZ0dfdEPSICyjYU0gxFFK8LEMRBnW5yMEJSppZE8WKQTHludo/8Cj5uulbh4lBOJA4/nv89Tm8+3Yl+2jAu1OAHdXzjvCkZKcBaFLLZIuhAAnbqu1brgakGxZWtFO21Bnz0kBaYepIaO9hxxkjsbtt2oGY8jQKzEMgxL9Q7o5spvlz4onHLVvMNmOhOKoKcfZzRBZ9qzXWbDNv3nMtKUo/1mBKKrImHKflnKcccUC8nCh7ZilJ0Cq3VDAp1xTiFc8+OMZTA5Pv1JekuAbKi9rzp7ARhdJL7sCVUsIEJgDf6RSi9O5bWOgkjFhEQvhZ8ad5nVSUIkiZVFqVBowjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732877078; c=relaxed/relaxed;
	bh=+tceCOdD9w17Xb0NF05p4gwCJE5PDpjfmbXsA+3YzBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KleBGpbryrdNYBGJ/OlqPDoEd6mUs+3A8dYlvwXXqTk2Ygg1AbxywDTTlSEeeo7Iyz7AG9FYB+/0sG/9U5jIdV0YEvk7kbZiyvMI0S6ZugvSqRiJqNnCjFiqgpdMQaD7IiBjDzG50tSY/KGaQWO9veFF2UiO27bZ10/tzQWx6BScr+spUdzuLxPgxxCwrPZm/uvG2hlJnGqr66nuDxxGfLLHasWsykOvasLTo/MgBQQeL/F9o4TYrNloNVMGfiu/HObNqnDdgviihKiGttsflQBUDKIoB2A2PYHFcAw25EL4KaaJxtgkgHJv6ZD2wVA444J+g80GOIAdwsA+fIAzMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l75uRObj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=evepolonium@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l75uRObj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=evepolonium@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y08v85lZ6z2xg3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2024 21:44:34 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so1296656a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2024 02:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732877069; x=1733481869; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+tceCOdD9w17Xb0NF05p4gwCJE5PDpjfmbXsA+3YzBI=;
        b=l75uRObj4RVLSZRXe0c+X4OO+Eemc7vndPhdIuiW81xjFvbtHaFKPy75MsWc7IycNY
         rHzss39rKLHPn3KGfJPdCRlZ33yeejvP1UiH9mU91hUpWUp93fQR6yozly91ZIKnwXF0
         yXpowLLXSjf4k2W6/2s94rPw1UW+ZLf+VN/jR5Ycf9wBxcg6euEi3CLcqEM6zNtWo7yK
         NruZSU1UOnWcbyehGd+hfYztMMNkbsLxN4v2RHm7q2faDkPFgv7xcvTvQ5M0vddJ+ghI
         GWT1YQxJiDu6Sy2RftFILCl07XYwkPc0gPFcyD3b5BdDFEPNJiAfjSp/q/47sjI9G622
         ULXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732877069; x=1733481869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tceCOdD9w17Xb0NF05p4gwCJE5PDpjfmbXsA+3YzBI=;
        b=wbbWuxBK6mfVnNRAMkyBmSAQGJuK8i8sYj6u2+r49CAJ7enJhyc1tcTzPbA77ecIJa
         bvlnEa520dgdZ9IEL81ClVtMErkCVCdxjoqTR0qpFzqXyO6f7utc730QKgohIoyzOM0c
         MfB5B8O7ZTr3OJ3vUHEcHvyq8PcoLFhiGVwtQi4GLk4LQuhcnAWAeVbKkuNOdiYYKAlJ
         X2Eoe4WiLUTI9+/IoIBIysGF5UJQ1DdQsS4Gi/co66gA1b5IYBasmPq0Dblo26QzXJz1
         ejrXBQWKLmu9tY0ZtCNQmH99WCFYs90BwoV+582wsDYT7w07vQ9basYzylmLr1s8VDCx
         DE8w==
X-Forwarded-Encrypted: i=1; AJvYcCXuiS+VUOhO6oiHNuuwYlnQ3iAJc9OvqmsACS1xLNuwNApq2383irzAinsm9vEA/RM4g3RFnTE2j2r780I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyk9qLohkxiIBVI6r4uxcyMlIsL6IoFxKk6xnSDX+u80oUoPWiE
	piHkj9k+JB7PhikqgzStkV2d5cMcuoS+ecItxRPukXiopsIQPp9Y
X-Gm-Gg: ASbGnctL2Dz1itCcd9IRTPvEv2su4VNxfQ0EY4CXQosTTSBY8W8/dnIo7SawAaD9l3R
	S+JVFP7dSb6k07Ay3CVAeYl5al6wN4fhnVHnjSYsd9JaZlIEYaBt2044In9vwZ3VekuXb8+W0Ny
	NGMH2k6nEafa+jekWQBlXer2BLf63wXONpMaCncKSqWP8KwbZ5GLpJORjrOmdfb47urFLkhIUXs
	LhkyP5/uAKdW4XTteQ6BqWtACjcM2Vmmm7raUhz6CkVR+KV/+tGE8mkS/dUjt7Rc2MN2awQ5JWj
X-Google-Smtp-Source: AGHT+IFXf4FfV/mmpqOgApowWW1WEgFHCNbUvuebjgKU838+pqiz1rhyPZ+W2eSrg3lBkm0/2WC2QA==
X-Received: by 2002:a05:6a20:9185:b0:1e0:d618:1fe3 with SMTP id adf61e73a8af0-1e0e0b249a3mr15187416637.26.1732877069118;
        Fri, 29 Nov 2024 02:44:29 -0800 (PST)
Received: from kernel-VirtualBox.. ([2401:4900:1c80:568a:3302:a169:fb39:495d])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72541770310sm3153455b3a.74.2024.11.29.02.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 02:44:28 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
X-Google-Original-From: Atharva Tiwari <atharvatiwari1101@outlook.in>
To: 
Cc: atharvatiwari1101@outlook.in,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Eder Zulian <ezulian@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fix: add safety check for OPTION_END and refactor code for consistency
Date: Fri, 29 Nov 2024 16:13:53 +0530
Message-ID: <20241129104401.5997-1-atharvatiwari1101@outlook.in>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

- Added a null check for 'o' before copying the last OPTION_END in options__order function to prevent potential uninitialized usage.
- Refactored the parse_long_opt function for improved readability by aligning function signature.
- Minor formatting fix to ensure consistency in the codebase.
- Updated the wrapper script for pseries architecture to handle 'notext' option in a more reliable way.

Signed-off-by: Atharva Tiwari <atharvatiwari1101@outlook.in>
---
 arch/powerpc/boot/wrapper        |  1 +
 tools/lib/subcmd/parse-options.c | 10 +++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 1db60fe13802..d25ad8c622f4 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -267,6 +267,7 @@ pseries)
     link_address='0x4000000'
     if [ "$format" != "elf32ppc" ]; then
 	link_address=
+	notext='-z notext'
 	pie=-pie
     fi
     make_space=n
diff --git a/tools/lib/subcmd/parse-options.c b/tools/lib/subcmd/parse-options.c
index 555d617c1f50..f85b642bc9aa 100644
--- a/tools/lib/subcmd/parse-options.c
+++ b/tools/lib/subcmd/parse-options.c
@@ -360,8 +360,7 @@ static int parse_short_opt(struct parse_opt_ctx_t *p, const struct option *optio
 	return -2;
 }
 
-static int parse_long_opt(struct parse_opt_ctx_t *p, const char *arg,
-                          const struct option *options)
+static int parse_long_opt(struct parse_opt_ctx_t *p, const char *arg, const struct option *options)
 {
 	const char *arg_end = strchr(arg, '=');
 	const struct option *abbrev_option = NULL, *ambiguous_option = NULL;
@@ -828,9 +827,10 @@ static struct option *options__order(const struct option *opts)
 
 		nr_parent = nr_opts;
 	}
-	/* copy the last OPTION_END */
-	memcpy(&ordered[nr_opts], o, sizeof(*o));
-
+	/* Check whether o is  valid before using it to copy the last OPTION_END. */
+	if (o && o->type == OPTION_END) {
+		memcpy(&ordered[nr_opts], o, sizeof(*o));
+	}
 	/* sort each option group individually */
 	for (opt = group = ordered; opt->type != OPTION_END; opt++) {
 		if (opt->type == OPTION_GROUP) {
-- 
2.43.0


