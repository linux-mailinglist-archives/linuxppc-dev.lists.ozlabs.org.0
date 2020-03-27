Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3157195FB1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 21:28:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ptjF2WFCzDrKV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 07:28:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=BqA+8GVz; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ptg70SdqzDrJs
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 07:26:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KsC+SFzQg4vskBoE0lvjIZxP3fG7h7vOVL81m2MRoFM=; b=BqA+8GVzzRNsl+cmj33JBRW+7w
 2Xvh3AspNSG4ewWWpjnML83EPMl8MSne8uwZDi1bqEltrT5cCele8AkI2W2K7s7bnmZmM3p0B4DA9
 5/2OIszR/bMfZWSLslp4pN2Ai2FWx7SAZuEgWMtWngLXeNiZ1qHsf6k8+uEqZ41460XEk1lx5MRZE
 Zo2dBI1BgrRGowfEQ56YCCMOPGn3SMvjLBWaUxu4otMYoMGU6bccdjR6rQx9WAZqfVjwNtMV3j3iH
 aCKvDDvxRlPP76rfiPZkh51hSskO1ggHyYNp1kdusgjozyqAV6/vt35TTXTO4Sx6dtBIMck0b5h5U
 x/ohjWOw==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHvYd-0003IV-6A; Fri, 27 Mar 2020 20:26:23 +0000
Message-Id: <1bc5a16a22c487c478a204ebb7b80a22d2ad9cd0.1585340156.git.geoff@infradead.org>
In-Reply-To: <cover.1585340156.git.geoff@infradead.org>
References: <cover.1585340156.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Tue, 17 Oct 2017 20:00:31 +0200
Subject: [PATCH 1/9] powerpc/ps3: Remove duplicate error messages
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 27 Mar 2020 20:26:23 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>

Remove duplicate memory allocation failure error messages.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/platforms/ps3/os-area.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/os-area.c b/arch/powerpc/platforms/ps3/os-area.c
index cbddd63caf2d..e8530371aed6 100644
--- a/arch/powerpc/platforms/ps3/os-area.c
+++ b/arch/powerpc/platforms/ps3/os-area.c
@@ -613,10 +613,8 @@ static int update_flash_db(void)
 	/* Read in header and db from flash. */
 
 	header = kmalloc(buf_len, GFP_KERNEL);
-	if (!header) {
-		pr_debug("%s: kmalloc failed\n", __func__);
+	if (!header)
 		return -ENOMEM;
-	}
 
 	count = os_area_flash_read(header, buf_len, 0);
 	if (count < 0) {
-- 
2.20.1


