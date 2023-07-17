Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A375C755EB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 10:48:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=gypN3lrl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4G1s43Ktz3cbv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 18:48:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=gypN3lrl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Fjb5fYyz2y1b
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 18:33:54 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4FjJ5H4bzBR9sS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 16:33:40 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689582820; x=1692174821; bh=qDEzJDHeLkl5fOCGw+7n0TBDlqx
	xR3XxrG/mc9PY8lI=; b=gypN3lrlaHSNA4wCXFaOQVAYpDtGRX4q90wB9KeZsR0
	0f3dDdO/tnDjUa/XQfMMmRwwZka2g1F5l+G0rQVP8BP6qIHsWOaR6masT/WflIcq
	O4u4q67/dI2+SNxGnnpt0+zcDV9Wi0bSE7Gc0nva171EEut3j1lqBh58g3rA/XXf
	HTd8jcu4TCq1cZafG8PqsHaUFDYScNsB8f9yzWy+iYAPJGRQZV2cg9wuMeDjDoX8
	NVuLdtqyKyphv9PzImIOjEX6AQEndS00+EYE5EVo8FRjBcunkkj3HcfHYziToUtR
	cPeJTqjktOlFxC67Ejsxwt9TjAuG5JpvOFsDZuqQLRw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id X4y1RWr90XKZ for <linuxppc-dev@lists.ozlabs.org>;
	Mon, 17 Jul 2023 16:33:40 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4FjJ2JpCzBR5lS;
	Mon, 17 Jul 2023 16:33:40 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 17 Jul 2023 16:33:40 +0800
From: hanyu001@208suo.com
To: benh@kernel.crashing.org, mpe@ellerman.id.au, baihaowen@meizu.com,
 studentxswpy@163.com
Subject: [PATCH] drivers: macintosh: add spaces required around that ':' and
 '?'
In-Reply-To: <tencent_A7289285160569DAEE7418CF0B205D2C520A@qq.com>
References: <tencent_A7289285160569DAEE7418CF0B205D2C520A@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <1deebcc233b93769ff1c85c74a432199@208suo.com>
X-Sender: hanyu001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 17 Jul 2023 18:42:53 +1000
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

This patch adds spaces required around that ':' and '?'.

./drivers/macintosh/macio-adb.c:143: ERROR: spaces required around that 
'?' (ctx:VxW)
./drivers/macintosh/macio-adb.c:143: ERROR: spaces required around that 
':' (ctx:VxW)

Signed-off-by: maqimei <2433033762@qq.com>
---
  drivers/macintosh/macio-adb.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/macio-adb.c 
b/drivers/macintosh/macio-adb.c
index 55a9f8c..4de4883 100644
--- a/drivers/macintosh/macio-adb.c
+++ b/drivers/macintosh/macio-adb.c
@@ -140,7 +140,7 @@ static int macio_adb_autopoll(int devs)
      spin_lock_irqsave(&macio_lock, flags);
      out_8(&adb->active_hi.r, devs >> 8);
      out_8(&adb->active_lo.r, devs);
-    out_8(&adb->autopoll.r, devs? APE: 0);
+    out_8(&adb->autopoll.r, devs ? APE : 0);
      spin_unlock_irqrestore(&macio_lock, flags);
      return 0;
  }
