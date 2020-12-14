Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 819552D9385
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 08:10:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvXb80GVTzDqSK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 18:10:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EBV8ywP4; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvXPF2dgFzDqHS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 18:01:36 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id w5so11074100pgj.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 23:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cxv1/xcoFyc0+rLkO7iNlzfTmTCUobsv0mf1a1fJaKs=;
 b=EBV8ywP4FdjYHK6Zs3pDMM/umySWWxUPltYnJrMBAcmSNSrWDQ9XMhWHy0oK/dZhkt
 mLuWcdPYgZ1T+rntAUck+SBWkw1wKlUH94Qr46nl4/BWhJw7PzgNFCdnq92WNA9BhoWB
 s8B9bP0O7v5R2B1SM/hMsaO1bfvOw7EJZu4ZBQi6Io0XQvfLxxp/ScAF6c5nl5Z4gxOY
 EqAy2QuVQUTiezdjMTmBwRk86RieavdiE+zX/OVFC/wJy1fiIcpfP12XwS8WErhncquo
 WlvMsM6ce4p/hs3r4DiLYkhtSooj48Kx8Zo4YtnHMIXxP3UmAA3IOmqOGzrTgI7cEb2+
 dYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cxv1/xcoFyc0+rLkO7iNlzfTmTCUobsv0mf1a1fJaKs=;
 b=KZm4cC1DxbG858vs0ptvnD4Oe315ekFOel9NkDKqVqgG/N60LMBFxc0BP8J9O2YhSa
 OUkRqehyv7TQZuyfZ1UShVN9psItoc/f4Rj90knspxTGpNxRaKZJwM8CVcbCzwpUM+w3
 khG/6reDRo/vmQD1dQrIe8HXL7nZDiyG7kZDaWIpJff33ddiZeR19ueLsKkPKCGbq3mt
 WItIhrNx3WvURgW9eTG6FkzDCzmZUpCgMNyVd8Y+KFNHuw4OvHpST0Ic+N9G2qrROFoj
 xWHC6pHd+YXjIK7CNfX/aueEkfpw8FGMdbHXS/idkbvon+4IJKAajo9/RStRqIN5JguF
 X4JQ==
X-Gm-Message-State: AOAM532NT5gbU47XoCOqsQoz1Z51KOd4TC5EFws8NW4U84VGvMLe+NuL
 qhK3FN+pNPcaqypTPUwSWzqBRk/viJ0=
X-Google-Smtp-Source: ABdhPJx5AmILXSD1xPGNVdPYIqA2jTn8bVniddzn968H7tbSxzitU/Hs0byrii/p6xSaJmriLmU4jw==
X-Received: by 2002:a63:5418:: with SMTP id i24mr22887288pgb.165.1607929293976; 
 Sun, 13 Dec 2020 23:01:33 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.228.148])
 by smtp.gmail.com with ESMTPSA id 84sm19570018pfy.9.2020.12.13.23.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 23:01:33 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
Date: Mon, 14 Dec 2020 16:53:12 +1000
Message-Id: <20201214065312.270062-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201214065312.270062-1-npiggin@gmail.com>
References: <20201214065312.270062-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a 16-socket 192-core POWER8 system, a context switching benchmark
with as many software threads as CPUs (so each switch will go in and
out of idle), upstream can achieve a rate of about 1 million context
switches per second. After this patch it goes up to 118 million.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 5181872f9452..356138bdb5bb 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -232,6 +232,7 @@ config PPC
 	select HAVE_PERF_USER_STACK_DUMP
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MMU_GATHER_PAGE_SIZE
+	select MMU_LAZY_TLB_SHOOTDOWN		if PPC_BOOK3S_64
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
 	select HAVE_SYSCALL_TRACEPOINTS
-- 
2.23.0

