Return-Path: <linuxppc-dev+bounces-13973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19134C436E0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 09 Nov 2025 01:37:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3v5m32T3z306S;
	Sun,  9 Nov 2025 11:37:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762648668;
	cv=none; b=X5DfZBpGDZv59pWLdl4v0/u6sFDKjxMhApRMTu62JGsHV2D9GtKLPFy/9mxA8YKfGNTBBW7z2nL8eYXb8bfDEpuXQMnjrpf3d/hgP0bWQIG62Vhfjan3nVuU3e5SKzMXmngGGQX8si3BWIX2ODTD5g1208H4DOPdgE3D+NOqxlP5ZscFd0i1ehP7qZzXE1Rj9UyxEL7Q0eQ1YPjOjsf33KMN5KJjPOpUbpCYoEdpF3X5lUAQ1Q1JyqxjkVkMpZck5/tfg1pEh79ejGOmUo3euQtXLCzJrlEqMKb33u0gqjA22M0aemdTpnJXO+ncrJo/PWmOH2T+OD24teZGywLMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762648668; c=relaxed/relaxed;
	bh=E4aZOzCULi3HBrGklZvBg0eT1cMNm/xQ1tyAYWhxK7U=;
	h=To:Cc:Message-ID:From:Subject:Date; b=CFLK36OVOJk4/oJ1mtH5M3Xe3ONDdVkmIxaRtHIbtf+T8jw4gutyKx4tOdWYewsScgh0+KimtKyKvBky9/alxA+/ADel9Gm75TOne63rdr65dYOw5VdDEkVx0nHNuvrmJS2FnU800KagIKyPK1NYTcOeR4I8va6Eu0y8TT8QJpMK+Wua8jymrdUJPnyNINHBFVz/A1sP/rngEPm0Yl5Mc2f3dApyOtFrBSVoCPawXiNr8BAWWVadcJ7mdXd/1yHVOhWost554wpNtiGoj01vB8MLJqLoONOBdezV0oL3g/vRRWPYnfBROEWAOknyjPYF/O36BHYgacHE0+5kp7zbcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YmA5QFNW; dkim-atps=neutral; spf=pass (client-ip=103.168.172.148; helo=fout-a5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=fout-a5-smtp.messagingengine.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YmA5QFNW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=fout-a5-smtp.messagingengine.com (client-ip=103.168.172.148; helo=fout-a5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3v5h5wX2z2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Nov 2025 11:37:43 +1100 (AEDT)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id E03B6EC0231;
	Sat,  8 Nov 2025 19:37:39 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sat, 08 Nov 2025 19:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1762648659; x=1762735059; bh=E4aZOzCULi3HBrGklZvBg0eT1cMN
	m/xQ1tyAYWhxK7U=; b=YmA5QFNW4Q2JUyQorIPO5qjvy0iffm1wFVOoblAsbWs0
	gfExFKIbtZTiZJoaJK1R+N0n1geUy+LOOt+2JYJ1rUGIFxF1lMUHKZPtLthrV4YK
	GQphd+mTXcsB3BaL7ilThm65stJ4LsOcNm0qwfZFfnBBxKT2TD+/t74p7yIg9vF6
	szfV08gaN9inrmIxVPU4+k8kzbcepRguAu1LxJISAeA9y6o8/cydcK+/yCTOux4J
	MOWmXn5K1lZ9rYLhwZ1oIt2XTxDwVhqmnm+HlpEZCIrb5gfnRk+VXKrSFFaZwtmY
	xVEO+RMmA0dFKVFPJJRFEgxnpY6LbWYSf6SR8+5Tdg==
X-ME-Sender: <xms:UeIPac4hLe6EQsJIyDU7u32ckqVirkmk4R20utFsQekc--RQ2mJB-A>
    <xme:UeIPaWBKfe7v9spAcEAmnWpFhW_eH_qQlI3oBd2aXuWab1-DcdazmUmerg-FFXamb
    CzZQk5DX5ugOroXa7z7I6-oMEY2D8o3G4ubxFxoB15Y5k__RFJ1Vir->
X-ME-Received: <xmr:UeIPaa_4Q7aZfPAeMWCjONlH3SqAMqGyUepi3RyL0nqHQDCWNLSEIEnzmIjUzVh2gK9kKMdou68APbNP8MxoHj755Qn2OkxmC24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleegtddtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:UeIPaRGbHAKoECcbUn7b9OOW3n-PZLLDU-EJ784-hcZ1vsKk7VD5_Q>
    <xmx:UeIPacRtG8j8nSrBwA_MQ_5ahQsvJBJfOFsyWcF3C8WxR0d83mbx2A>
    <xmx:UeIPaQR0aWYF9pY0hnFGFRWeKymwKxvy318bLYMndF_7RRpFdijJrQ>
    <xmx:UeIPaX0IvF1ZkhwEeC0rbvL3yfJM-99hkNgfWi19k75B0eGy4OWvaA>
    <xmx:U-IPaTS_kmcfx3H6wFLTx6l83SJPSXPqA0vC5acrXLijI3jQVLMJlUsQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Nov 2025 19:37:34 -0500 (EST)
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
Message-ID: <d941a3221695e836963c8f9cb5fbb61e202bad0c.1762648546.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] powerpc: Use relocated font data pointer for btext_drawchar()
Date: Sun, 09 Nov 2025 11:35:46 +1100
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

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Since Linux v6.7, booting using BootX on an Old World PowerMac produces
an early crash. Stan Johnson writes, "the symptoms are that the screen
goes blank and the backlight stays on, and the system freezes (Linux
doesn't boot)."
Further testing revealed that the failure can be avoided by disabling
CONFIG_BOOTX_TEXT. Bisection revealed that the regression was caused by
a patch which replaced the static btext font data with const data in a
different compilation unit. To fix this, access the font data at its
relocated address.

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
Signed-off-by: Finn Thain <fthain@linux-m68k.org>

---

Christophe, as you're the author of this patch, this submission will
probably need your sign-off.

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


