Return-Path: <linuxppc-dev+bounces-13979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1925C44A38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 00:32:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4Tbw3LY4z2yG3;
	Mon, 10 Nov 2025 10:32:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762731148;
	cv=none; b=PJCmt1cTb2OV4Q4FCF6N7yEsSzQHXvWDHnCLJ4er7G/wJzha3XmOVGxfYxEDXd31fAaNYJxqal2qu0wLTEawDVq6M+lGtmtJ470HdjiApnjzVHKuyuyrTgL7ie+9veN7V1eQTNalKCvTM97X0ezKQ0BTUh+z3KVNrz4ZeqVjvviKnLfVP6E6AxdXCMLxgFrbhmHeussjjOMPR2kAXukbiELJBAx3VPJQUr/JAodT3V9B5loOKL39vmpcNz+ikm6AUc+qMpp2O9gER3RQQpk+R0y7Zm0exSB0QXJPbilFn4taGuYgJX/b/QeY4sc5wfVhQNZgfLz/EDHqqq9W1Lll0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762731148; c=relaxed/relaxed;
	bh=nx4FOrWdSq+YAbCvyjoWIFM0L4cdYEzeFfgYi/pIqlo=;
	h=To:Cc:Message-ID:From:Subject:Date; b=DA2248KqorFAAMi39j0JLpvPfitQHg/9/yGHoDz44bpPM4dxuTyLbOp9NhDKCTJxw9XDOtVtwPqc9VIE4/HNExAbOa/JEA/mFk13mco+Z9lSSYqXbE3Jv/O3jpPBICd0N+7mRf/oCl1C1YnLuLKsyAswMz7NghJbBnbGihje0BppeAw9Nwuq3eLm1jXgxJ5Xg92cry1xtw3Y7aVONWfB/tw8XN4tldbSLet3sI9bPKNROOG/AXwdIqcXS6es9DTyqHPzIvsyWZlHldflcYlRBTU8mQgt1NN9yu2F0ZFd4arIUCj8VnJj9E5aOtTJ3BJNQDh8Az4lkLSOawVABqdOrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=sTTRis8q; dkim-atps=neutral; spf=pass (client-ip=103.168.172.146; helo=fout-a3-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=fout-a3-smtp.messagingengine.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=sTTRis8q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=fout-a3-smtp.messagingengine.com (client-ip=103.168.172.146; helo=fout-a3-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4Tbt2DdMz2yG1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 10:32:24 +1100 (AEDT)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 7D0C9EC0096;
	Sun,  9 Nov 2025 18:32:21 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 09 Nov 2025 18:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1762731141; x=1762817541; bh=nx4FOrWdSq+YAbCvyjoWIFM0L4cd
	YEzeFfgYi/pIqlo=; b=sTTRis8q4cGmdKtjI7SQR5NMchmNSUj9D2hEv2YLMbmC
	8W2R4duBlMvcfkFtQbaF1innN67sAqe/j+vhwMyCjaPcV5ozcZoR6DPaAua0YEky
	X66t2MuVcTfeWiJcM9IRXlSd0goYmxub6Hx662cM+OD2bGN/ZzeNJSyW6py5TWpI
	9F4SXOwSuC1687WcSYRG2sXK0cztIwUgy5GXuy55j11lqWyCM7yYmtx6+u9BkuN5
	cW/01r3zKfOz9HM+f6SKZrtBW2NhQfyDbik1X6fdBEzikJMTme4hRJlTY+3egQZP
	ypx+y2DMJe/UKoi7AI1XrkdITE/5WCv3CSIBebNsFA==
X-ME-Sender: <xms:gyQRaVxoHoSwFU4KR8ZgDOtrT2hPSwXtnwz7TK7KEIg8pZStBNUOYQ>
    <xme:gyQRadbog7rYoRV6h9uQxmyr-PmdrhegsZ4qJfn0OB8LKgs8gGJJafbT4fBqaOTsj
    Fao59dqo_yn6pWSCom4k4qydW2srLzCFiv833AipMytX5yEbnARVEA1>
X-ME-Received: <xmr:gyQRae10O_B0O-NV6Xdv97bGFa5Ik7zTA0PI0MzySsdAIdTe-Q3xz8urr9-oCMT1cUqY9Ly0Dr4DZ_rdFswUauF_zuKkjiQ55jM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleeijeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepvfevkffhufffsedttdertddttddtnecuhfhrohhmpefhihhnnhcuvfhhrghinhcu
    oehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpe
    eukedugeettdegfffhfeejveevkedtgeeuudeggffgheegleejheeiffelgfeuueenucff
    ohhmrghinhepuggvsghirghnrdhorhhgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhu
    gidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepmhgrugguhieslhhinhhugidrihgsmhdrtghomhdprhgtphhtthho
    pehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehnphhighhgihhnse
    hgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegt
    shhgrhhouhhprdgvuhdprhgtphhtthhopegtvggurghrmhgrgiifvghllhesmhgrtgdrtg
    homhdprhgtphhtthhopehushgvrhhmheejseihrghhohhordgtohhmpdhrtghpthhtohep
    lhhinhhugiesthhrvggslhhighdrohhrghdprhgtphhtthhopegsvghnhheskhgvrhhnvg
    hlrdgtrhgrshhhihhnghdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhk
    vghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:gyQRaXc1RFdIknDVT28Jr6NJ5CHLiMceYEgqOPUG66Pwxxw-HYd_Zg>
    <xmx:gyQRaTLPt2hEREj_BMqP524Q5xj_cna2JkjukdC8Mx97Hz7EYoHNvw>
    <xmx:gyQRadrD7307-ZTMu5fxNNN3BReLwHYaAGmM17Otbr7WvFgOybJbvA>
    <xmx:gyQRaZtK7jqdKf0Bj1nmwjFPUpheifYGZsZGAszOqAytc_FGvrvSrg>
    <xmx:hSQRadKHSj-vVrXAFHXXRS0w98m3FHAElT2rKORMXn6cuMf0Zlzdnl2D>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Nov 2025 18:32:16 -0500 (EST)
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
    Michael Ellerman <mpe@ellerman.id.au>,
    Nicholas Piggin <npiggin@gmail.com>,
    Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Cedar Maxwell <cedarmaxwell@mac.com>,
    Stan Johnson <userm57@yahoo.com>,
    "Dr. David Alan Gilbert" <linux@treblig.org>,
    Benjamin Herrenschmidt <benh@kernel.crashing.org>,
    stable@vger.kernel.org,
    linuxppc-dev@lists.ozlabs.org,
    linux-kernel@vger.kernel.org
Message-ID: <22b3b247425a052b079ab84da926706b3702c2c7.1762731022.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v2] powerpc: Add reloc_offset() to font bitmap pointer used for
 bootx_printf()
Date: Mon, 10 Nov 2025 10:30:22 +1100
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Precedence: list

Since Linux v6.7, booting using BootX on an Old World PowerMac produces
an early crash. Stan Johnson writes, "the symptoms are that the screen
goes blank and the backlight stays on, and the system freezes (Linux
doesn't boot)."

Further testing revealed that the failure can be avoided by disabling
CONFIG_BOOTX_TEXT. Bisection revealed that the regression was caused by
a change to the font bitmap pointer that's used when btext_init() begins
painting characters on the display, early in the boot process.

Christophe Leroy explains, "before kernel text is relocated to its final
location ... data is addressed with an offset which is added to the
Global Offset Table (GOT) entries at the start of bootx_init()
by function reloc_got2(). But the pointers that are located inside a
structure are not referenced in the GOT and are therefore not updated by
reloc_got2(). It is therefore needed to apply the offset manually by using
PTRRELOC() macro."

Cc: Cedar Maxwell <cedarmaxwell@mac.com>
Cc: Stan Johnson <userm57@yahoo.com>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: stable@vger.kernel.org
Link: https://lists.debian.org/debian-powerpc/2025/10/msg00111.html
Link: https://lore.kernel.org/linuxppc-dev/d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com/
Reported-by: Cedar Maxwell <cedarmaxwell@mac.com>
Closes: https://lists.debian.org/debian-powerpc/2025/09/msg00031.html
Bisected-by: Stan Johnson <userm57@yahoo.com>
Tested-by: Stan Johnson <userm57@yahoo.com>
Fixes: 0ebc7feae79a ("powerpc: Use shared font data")
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
Changed since v1:
 - Improved commit log entry to better explain the need for PTRRELOC().
---
 arch/powerpc/kernel/btext.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 7f63f1cdc6c3..ca00c4824e31 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -20,6 +20,7 @@
 #include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/udbg.h>
+#include <asm/setup.h>
 
 #define NO_SCROLL
 
@@ -463,7 +464,7 @@ static noinline void draw_byte(unsigned char c, long locX, long locY)
 {
 	unsigned char *base	= calc_base(locX << 3, locY << 4);
 	unsigned int font_index = c * 16;
-	const unsigned char *font	= font_sun_8x16.data + font_index;
+	const unsigned char *font = PTRRELOC(font_sun_8x16.data) + font_index;
 	int rb			= dispDeviceRowBytes;
 
 	rmci_maybe_on();
-- 
2.49.1


