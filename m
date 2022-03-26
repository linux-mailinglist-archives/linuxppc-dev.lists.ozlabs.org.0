Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B15D4E8372
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:43:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnsr09ljz3cFt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:43:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=WhP51Dsj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=lpn1kNOh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=45.77.206.31; helo=stuerz.xyz;
 envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=WhP51Dsj; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=lpn1kNOh; 
 dkim-atps=neutral
Received: from stuerz.xyz (unknown [45.77.206.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlbd45Cqz306r
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:01:17 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 9A83FFB7CD; Sat, 26 Mar 2022 17:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314075; bh=F4mFOP6R8mSC+27qiR8caNRLqSuQe2zZwUjAxTCpWKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WhP51Dsj9ygdfkekHcodjm11EIvWjBmngru0X/UyaTK4e4arlt2AHoCufYL1xvJbV
 I1UAiqqP4qX9B4TYWdutbN7A8+kGZfnYTUmlaI9TRZtQ1MjPrlTlup53OKRHidf/zP
 ErGxYeA2Drr9rm+QpLhFoo6VVzqvDrn4p0aLz+JLqUAN7QEOfg/JcO/p6CzuHiuF+o
 F+uHHu4yvCmMEw0RkDVhvJtQJ7YUf2qp4/4UCjuXh/FtnKSHeE39BIojNHCWA9uPHW
 6BntlSqCJB9JM2MqanPpNUwAFgJvMp3ShGh8OltUq9JSqBktdxRjZFURyyib+byOYw
 dbh9v07zFksbw==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id A2186FB7CD;
 Sat, 26 Mar 2022 17:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648314073; bh=F4mFOP6R8mSC+27qiR8caNRLqSuQe2zZwUjAxTCpWKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lpn1kNOht3IjqkwWrlXCvwxCCuKRTgm9xratBr2om8NH60q2A3PkG7ny40QNucd/c
 TI5QLl5gJY3hgaLe/x2wsXDBNDJ8sD7BM5hPjca1hImMajeyzv97QpcvqYXtaodIwn
 LP32ozhih5w7oBi1imaMTktrGINSREkWcl8znBajxoBVw+kh9bYQXBdB0++rNIqnjk
 /56oT7zPXmWOO1JkR7/z86GemOpPv2MOrbeEd2gs6B4eQE/NQoych/gsIiVj9RsovA
 xRoAwNJStE0bvDErb8jy1vAHc4WALCyAibhfkba1AKMkK5kA2ZNDgcbcDAeFBT4Qns
 573fZe452hA5g==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 17/22] cxl: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:59:04 +0100
Message-Id: <20220326165909.506926-17-benni@stuerz.xyz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326165909.506926-1-benni@stuerz.xyz>
References: <20220326165909.506926-1-benni@stuerz.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 05:40:34 +1100
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This replaces comments with C99's designated
initializers because the kernel supports them now.

Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
---
 drivers/misc/cxl/hcalls.c | 40 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/misc/cxl/hcalls.c b/drivers/misc/cxl/hcalls.c
index aba5e20eeb1f..ed2086d579d3 100644
--- a/drivers/misc/cxl/hcalls.c
+++ b/drivers/misc/cxl/hcalls.c
@@ -86,32 +86,32 @@
 
 
 static char *afu_op_names[] = {
-	"UNKNOWN_OP",		/* 0 undefined */
-	"RESET",		/* 1 */
-	"SUSPEND_PROCESS",	/* 2 */
-	"RESUME_PROCESS",	/* 3 */
-	"READ_ERR_STATE",	/* 4 */
-	"GET_AFU_ERR",		/* 5 */
-	"GET_CONFIG",		/* 6 */
-	"GET_DOWNLOAD_STATE",	/* 7 */
-	"TERMINATE_PROCESS",	/* 8 */
-	"COLLECT_VPD",		/* 9 */
-	"UNKNOWN_OP",		/* 10 undefined */
-	"GET_FUNCTION_ERR_INT",	/* 11 */
-	"ACK_FUNCTION_ERR_INT",	/* 12 */
-	"GET_ERROR_LOG",	/* 13 */
+	[0]  = "UNKNOWN_OP",		         /* undefined */
+	[1]  = "RESET",
+	[2]  = "SUSPEND_PROCESS",
+	[3]  = "RESUME_PROCESS",
+	[4]  = "READ_ERR_STATE",
+	[5]  = "GET_AFU_ERR",
+	[6]  = "GET_CONFIG",
+	[7]  = "GET_DOWNLOAD_STATE",
+	[8]  = "TERMINATE_PROCESS",
+	[9]  = "COLLECT_VPD",
+	[10] = "UNKNOWN_OP",		         /*  undefined */
+	[11] = "GET_FUNCTION_ERR_INT",
+	[12] = "ACK_FUNCTION_ERR_INT",
+	[13] = "GET_ERROR_LOG",
 };
 
 static char *control_adapter_op_names[] = {
-	"UNKNOWN_OP",		/* 0 undefined */
-	"RESET",		/* 1 */
-	"COLLECT_VPD",		/* 2 */
+	[0] = "UNKNOWN_OP",		         /* undefined */
+	[1] = "RESET",
+	[2] = "COLLECT_VPD",
 };
 
 static char *download_op_names[] = {
-	"UNKNOWN_OP",		/* 0 undefined */
-	"DOWNLOAD",		/* 1 */
-	"VALIDATE",		/* 2 */
+	[0] = "UNKNOWN_OP",		         /* undefined */
+	[1] = "DOWNLOAD",
+	[2] = "VALIDATE",
 };
 
 static char *op_str(unsigned int op, char *name_array[], int array_len)
-- 
2.35.1

