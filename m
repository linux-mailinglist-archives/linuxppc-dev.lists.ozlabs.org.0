Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA6261356D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 13:10:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1Bmt1J8hz3dsj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 23:10:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VBJYqllw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VBJYqllw;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1Bk35Qscz3bqt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 23:07:55 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id y4so10560691plb.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zed+8ilXn6MGIJcL2z90P1TobfWQ+njImejMWMmf58=;
        b=VBJYqllwLFKjjSog/J2zrGa1E0jj6lPzM1Ul9Z7cCsRz8OTNshgJ2ToIavollcnHLt
         3Xh0awyDJZ+YLP1fO/40IlMN/ZwdoBVWWA7qOMRW2GjrY3h/PvN5a0KcCKfcMSzGIW10
         2S+wm31G2aDkYuffcnTHjN3SnfuTN7VvJNmPpHJ93uK1NYPOeADA+cZefMhs73PR+sOo
         TSnoO7bwOPE3ThPzfvkY4EPsR3Exf5qS48DKXjV/V5IqgHufQmzgGB7T+Wed/ZIX8AXC
         AsUkncP/ob33JkaFN+r3IsiYeqp8Br6SNYftE8LGqsLFD8C83+O5bRsNxT0bUEcR/sbl
         aCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zed+8ilXn6MGIJcL2z90P1TobfWQ+njImejMWMmf58=;
        b=x0PYG24ZW1Qy/EKa+2jx87msBihf3jJjxkhAlxoH29o4W6vAR7CuZJTu/O1OV69kka
         hKPI/ktMT5BPc+2cEib1QFJ6iM5K8T8XTPQi0CmYOeEcZdjnj9whAm6PAjGMI1MXeY2q
         4OwQIfBXaZXn04brYW/MpC1Z1OELTaHJZSBBjNE6TUWouF5jZMlYYLUEw8CZdfy9prg2
         mfUyJy2kCFWcct+QAMbl3q5rwqVaQ2iG3UEMYjtRupDUTi+T6U6U4G1C2FqL9PGlIFSt
         Y63zTM/MVZ6TwRaWT89lXfSrGrik6J6uPTcpGWEsyg/gqt0+ThQnPwI/6uyMtwazgHdS
         0kGg==
X-Gm-Message-State: ACrzQf1u1MQy+EaNv3U7+xU+s8NjB5kQ2nKszrIPtN6zEMXtiykg4FTs
	eKgJ0LpqK6huc4omsHbjxNonG88MKl8=
X-Google-Smtp-Source: AMsMyM6XhgTq1aU0IovI+tOfx0sloE3/zK0Q6l/El5DFFIfDlPvfv+ImgWi15cABY0LrTsEWLwRPBg==
X-Received: by 2002:a17:90a:fe5:b0:212:cae0:7482 with SMTP id 92-20020a17090a0fe500b00212cae07482mr14516891pjz.108.1667218073416;
        Mon, 31 Oct 2022 05:07:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id p17-20020a170902e75100b0017e64da44c5sm1595134plf.203.2022.10.31.05.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 05:07:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-modules@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 2/2] powerpc/64: Add module check for ELF ABI version
Date: Mon, 31 Oct 2022 22:07:33 +1000
Message-Id: <20221031120733.3956781-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221031120733.3956781-1-npiggin@gmail.com>
References: <20221031120733.3956781-1-npiggin@gmail.com>
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Override the generic module ELF check to provide a check for the ELF ABI
version. This becomes important if we allow big-endian ELF ABI V2 builds
but it doesn't hurt to check now.

Cc: Jessica Yu <jeyu@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
[np: split patch, added changelog, adjust to Jessica's proposal]
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/module.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index f6d6ae0a1692..d46bf9bfda26 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -19,6 +19,23 @@
 
 static LIST_HEAD(module_bug_list);
 
+#ifdef CONFIG_PPC64
+bool module_elf_check_arch(Elf_Ehdr *hdr)
+{
+	unsigned long abi_level = hdr->e_flags & 0x3;
+
+	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2)) {
+		if (abi_level != 2)
+			return false;
+	} else {
+		if (abi_level >= 2)
+			return false;
+	}
+
+	return true;
+}
+#endif
+
 static const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
 				    const Elf_Shdr *sechdrs,
 				    const char *name)
-- 
2.37.2

