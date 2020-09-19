Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D14B7270A60
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 05:22:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtbbT4jXfzDqRg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 13:21:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sholland.org (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=samuel@sholland.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sholland.org header.i=@sholland.org header.a=rsa-sha256
 header.s=fm3 header.b=jQ0RJFmN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Qhr5ijpX; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtbYh0V7BzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 13:20:17 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5FDD8C85;
 Fri, 18 Sep 2020 23:20:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 18 Sep 2020 23:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=+klDHT4tIeJVl4fgQHq2RfH08C
 mREckooi3m30a5UCo=; b=jQ0RJFmNOpIwpCANwC4OJdLY4yyTqiSWbNqzQrBvIU
 yUeMnR2j/ohd+NhiZcavWACRKnql+z+0GbYFw05W9/D3QPD9/Ji10/a3GV5uex7B
 RA9AC4vD34GqfrnVvKhK35PCedstAEtmQZUJXSL9PgRdlm03iMQMQhRcsnL5aFHj
 pDuuhujCAKdbdN+/slMynwW4YQkQxpZ9iHotjVU4MmqdfJw9iJjzF3EtW8sniRgX
 KNKj8HBOG3nkvJW+0hUg1ekim0blgLkwH3rtQ2uQBPTAMqe8XSmcRuO9UmWP80Nf
 Biz43slSF8iNI2jptUPzkcy53D+C3JgdWuEEZqMgtL5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+klDHT4tIeJVl4fgQ
 Hq2RfH08CmREckooi3m30a5UCo=; b=Qhr5ijpX6iqjimQMjwfFdGgNVENqOM+TQ
 vTFRwZNrZNl0MXZ9bf6cdak9eTv+gVUpHzMZuE0KM1JJzG2NjENp77liHWBXXcgT
 drTz/1D6hbMyl9meC/3IpkHZYVkUuVk8AxhCbczFgqXJ5qSqlSyovI6wCVq2qsOM
 pkFVZcShuZ3paZj0dK+8dUAGcMVpQNYIbyHqHHztWYCG0YG9+yEpDmg9wNY1GTG5
 H8JUL+J3BUyzNuf2EyivN9dmgxj9Hlgv5JzTBGR3wZ+UlxiSPzUkxZ7rsMCJagQ4
 dggJK7dnKeKkQviLT0XY5+5tdXTzP0T6SoWl0cicHqDhg0pesn6HA==
X-ME-Sender: <xms:6nhlXxKLHLjMB0bQu0mCRnsDvEMvfECIsSaeMYFKmgbqBIbeU1czOA>
 <xme:6nhlX9J-pyGgsUxuAjEOcybbG9p6jMBpRlUIsYdQ4gNqGvXPH7kDbxxS180BZkKQu
 Jt5SiWGZcGkSMzdzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdejgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
 ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
 htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
 tdevnecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdho
 rhhg
X-ME-Proxy: <xmx:6nhlX5sDOs37MMY2eacFEHsazrIygWZuK8g8zE7WBZ8pAsU4YFQNMQ>
 <xmx:6nhlXyY3uILhrkEuHzLhJe8DTbQ6cWoSYti4fS_uvp9_XlWwwk1L-w>
 <xmx:6nhlX4ZjRzGVzloKhQOgeQyGu5SfASCQiXVjeGbKpm8DOUfiEpVOtw>
 <xmx:7HhlXwFybixx5eLHpPcwfxV-9-rtYjQMyVJ0C9K9-xwrTX-fSVVwdg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C4D2306467E;
 Fri, 18 Sep 2020 23:20:10 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Select HAVE_FUTEX_CMPXCHG
Date: Fri, 18 Sep 2020 22:20:09 -0500
Message-Id: <20200919032009.8346-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc, access_ok() succeeds for the NULL pointer. This breaks the
dynamic check in futex_detect_cmpxchg(), which expects -EFAULT. As a
result, robust futex operations are not functional on powerpc.

Since the architecture's futex_atomic_cmpxchg_inatomic() implementation
requires no runtime feature detection, we can select HAVE_FUTEX_CMPXCHG
to skip futex_detect_cmpxchg() and enable the use of robust futexes.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ad620637cbd1..5ad1deb0c669 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -196,6 +196,7 @@ config PPC
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
+	select HAVE_FUTEX_CMPXCHG
 	select HAVE_GCC_PLUGINS			if GCC_VERSION >= 50200   # plugin support on gcc <= 5.1 is buggy on PPC
 	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
 	select HAVE_IDE
-- 
2.26.2

