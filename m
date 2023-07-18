Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3BC75786B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 11:49:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=iwXsN1BN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4vLj1XQ0z30QQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 19:49:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=iwXsN1BN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4vKs60bnz2yDb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 19:49:05 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4vKm2LX4zBR1PD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 17:49:00 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689673740; x=1692265741; bh=TctDzT3+olxS6nLFPLTr5LbWtg7
	6T8LYhZ06EKd/PLQ=; b=iwXsN1BNAlju4Hudv35Whm8PobGEb/b+glPxZrfet6k
	gZpqxiSudO2IBfH2CO9kYr3uvIc+DlkRgf7FPPMdoR841l4ZOU6nfdXWFBEBXywy
	XhczobeD4g6cUCCvYPXKsn3U7CuKr5dgLe7F1Aw15Ts9gTDHgt7pAdy9ANhBvVj3
	VFvO06H7SybSqlgdME5W6qU2VmZsrJDAiL1HeRboV2MoSpVThKh42tf06m75+Eze
	kdzPo5mV41rh4DaSy0/xEVjb7REu4cVYkIHQ5e3o/NBV/RgFYo4jdsNrLMFZT2Kv
	rGuL2/dYzyQXXpG+PVW/l06wtPQcB7FIX1XhaNKoIEw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zR8Y-RUy1gZa for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 18 Jul 2023 17:49:00 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4vKl6WKqzBJBfd;
	Tue, 18 Jul 2023 17:48:59 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 17:48:59 +0800
From: hanyu001@208suo.com
To: benh@kernel.crashing.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, windhl@126.com
Subject: [PATCH] platforms: powermac: insert space before the open parenthesis
 '('
In-Reply-To: <tencent_EA51887C68AF6A7DCE5504EAAB3F2AB5C609@qq.com>
References: <tencent_EA51887C68AF6A7DCE5504EAAB3F2AB5C609@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <a475a9b5702e1044296209daec102e69@208suo.com>
X-Sender: hanyu001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes checkpatch errors:

/platforms/powermac/low_i2c.c:55:ERROR: space required before the open 
parenthesis '('
/platforms/powermac/low_i2c.c:63:ERROR: space required before the open 
parenthesis '('

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/powerpc/platforms/powermac/low_i2c.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c 
b/arch/powerpc/platforms/powermac/low_i2c.c
index 40f3aa432fba..25cc6eec962f 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -52,7 +52,7 @@
  #ifdef DEBUG
  #define DBG(x...) do {\
          printk(KERN_DEBUG "low_i2c:" x);    \
-    } while(0)
+    } while (0)
  #else
  #define DBG(x...)
  #endif
@@ -60,7 +60,7 @@
  #ifdef DEBUG_LOW
  #define DBG_LOW(x...) do {\
          printk(KERN_DEBUG "low_i2c:" x);    \
-    } while(0)
+    } while (0)
  #else
  #define DBG_LOW(x...)
  #endif
