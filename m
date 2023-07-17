Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC75755F64
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 11:35:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=jXI/ytPY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4H4D081Nz2yV5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 19:35:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=jXI/ytPY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4H3K1hBCz2yDQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 19:34:18 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4H353hjHzBR5lf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 17:34:09 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689586449; x=1692178450; bh=vj4//deCA33OOlFe8LFxHO33dYk
	UaS71mYSQYbPAi+o=; b=jXI/ytPYUb1e4QfuOGnAhPf6HAHmQvgkSUDsRc0zGJs
	WP7dRbRp3pUsGUdRWUlhVkPPrtTBt44L8mLkMqU1NwZaDPflTPSxa7GpEYxOyMTM
	jWHIfeyx2vXaZrnOZBlmrZ9/2gK1rYPkp+Is6ZX4fxJSLXAYvuNpAkepc2/YGNYb
	iStjyMbkF6Q77J6mctaM8qdPgL35ZADvVBpdJGPjM1ULs42uKjvnzRlUvrpMEvGE
	Xup8hIjI+Yljt+FjSlldN0JSo0q0bF3y8WKBF2g3COpAtSQV+0duqXBfjVH34fCE
	rQk/3DziM2ewBdNZjzrmPw7sR+7CYre6k1N+XEkXCag==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id T4aXXkzcir08 for <linuxppc-dev@lists.ozlabs.org>;
	Mon, 17 Jul 2023 17:34:09 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4H350HmPzBJ96K;
	Mon, 17 Jul 2023 17:34:08 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 17 Jul 2023 17:34:08 +0800
From: hanyu001@208suo.com
To: benh@kernel.crashing.org
Subject: Fwd: [PATCH] drivers: macintosh: space required after that ','
In-Reply-To: <tencent_C3903C16C7148542F183E66C393B6AE71109@qq.com>
References: <tencent_C3903C16C7148542F183E66C393B6AE71109@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <180c4f063ceee2b5b433de4e849cea29@208suo.com>
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

This patch fixes the checkpatch.pl error:

./drivers/macintosh/adbhid.c:1091: ERROR: space required after that ',' 
(ctx:VxV)

Signed-off-by: maqimei <2433033762@qq.com>
---
  drivers/macintosh/adbhid.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/adbhid.c b/drivers/macintosh/adbhid.c
index b2fe7a3..293e72a 100644
--- a/drivers/macintosh/adbhid.c
+++ b/drivers/macintosh/adbhid.c
@@ -1088,7 +1088,7 @@ static void adbhid_input_unregister(int id)
      unsigned char r1_buffer[8];

      adb_request(&req, NULL, ADBREQ_SYNC | ADBREQ_REPLY, 1,
-            ADB_READREG(id,1));
+            ADB_READREG(id, 1));
      if (req.reply_len < 8)
          pr_err("%s: bad length for reg. 1\n", __func__);
      else
