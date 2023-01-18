Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C7A6715D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 09:05:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxdbG1z94z3cBh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 19:04:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i4bw46JJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i4bw46JJ;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxdVJ0Thrz3fBQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 19:00:39 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id v23so31200288plo.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 00:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrPiR9IjSMnA6UKTOp8OkTYk/Ghbyk4227JxOnG3eIc=;
        b=i4bw46JJNHRCls6t57srDxlnFl9Ixtn2MdZ/C1ywWOJAZ6c4MzBYu4pOZeTJcb/q7N
         UsxGeUe0RQcuI8CsYp+iwUQSUUwXzJJH/aoZLqbs8vXZiAVTsoNPzhMrgcJ56rVs7UyC
         3wO94DAvEHxcY8Wc7kErGUl9QIJzkStrhbVKKsW0tMVDhEBg0wBmovNzmHyWbXyE6NdP
         TYBWmk/p0jbSH5WF00hnqcEwOS109b2suq6lAXft0IQlzKGzp7MmKdgJLgQioXXYUHz4
         D6ia+/6u4/Dws5LDHKM6NQv/orJW01MoD44qPN/ZLK3HdidkLzBV8lr0dSmdnyYamY+9
         Kkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrPiR9IjSMnA6UKTOp8OkTYk/Ghbyk4227JxOnG3eIc=;
        b=CpyLF6VNwzSxX9MevxaTRpX1/qtj3VFDrQKnJHdzLyaXQ2hh/4yfMjQorOLx31rcKS
         qPcbkXcN5SpV0ssB3iNcqwqXBVCo3sK06Z0Wlnjl+KjqS7MGKVjHr2+P5RsYbeZZNtTX
         maV+wEwBlM12T0oJVFZFJYIzbc3m68FVsO6KyUeDu2rKWXWkLsTkqwFG0DpyFZ4WXaFu
         xPc1789iBIheL+WfGaPWH6jAkDacLfNWFGd0fNDHmlvRRN2N205i8pUcjtUC2ePBjGnz
         QQ1i1xmeEBqfui2VIQMn1Mc8ZM7rUgAopNcdqbKTvVZHIaGcB5S7ubFMYOxLhtsX0wBu
         l6Fw==
X-Gm-Message-State: AFqh2kr0I6pX5OAO03+TtLqOnYXT4Gf/y7wcSXEylhDsxTaO9TIRAeJx
	Raga1Xb6sOOsOn4D5RWjP+I=
X-Google-Smtp-Source: AMrXdXtTl64G4cCab9NpNyGKytSh9JoZppnQQfip0s76mKtZrzwRQdlnqZiCFVAJ79+Rk/NIj37VRw==
X-Received: by 2002:a17:90a:e543:b0:229:a2:a265 with SMTP id ei3-20020a17090ae54300b0022900a2a265mr6031348pjb.3.1674028838309;
        Wed, 18 Jan 2023 00:00:38 -0800 (PST)
Received: from bobo.ibm.com (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a16c200b002272616d3e1sm738462pje.40.2023.01.18.00.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:00:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 4/5] powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
Date: Wed, 18 Jan 2023 18:00:10 +1000
Message-Id: <20230118080011.2258375-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230118080011.2258375-1-npiggin@gmail.com>
References: <20230118080011.2258375-1-npiggin@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mm <linux-mm@kvack.org>, Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a 16-socket 192-core POWER8 system, a context switching benchmark
with as many software threads as CPUs (so each switch will go in and
out of idle), upstream can achieve a rate of about 1 million context
switches per second, due to contention on the mm refcount.

64s meets the prerequisites for CONFIG_MMU_LAZY_TLB_SHOOTDOWN, so enable
the option. This increases the above benchmark to 118 million context
switches per second.

This generates 314 additional IPI interrupts on a 144 CPU system doing
a kernel compile, which is in the noise in terms of kernel cycles.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b8c4ac56bddc..600ace5a7f1a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -265,6 +265,7 @@ config PPC
 	select MMU_GATHER_PAGE_SIZE
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MMU_GATHER_MERGE_VMAS
+	select MMU_LAZY_TLB_SHOOTDOWN		if PPC_BOOK3S_64
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE		if PPC64 || NOT_COHERENT_CACHE
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK	if PPC64
-- 
2.37.2

