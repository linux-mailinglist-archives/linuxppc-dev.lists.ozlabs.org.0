Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DD1755F01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 11:12:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=uGz2viwA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4GZN4s0yz2ygT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 19:12:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=uGz2viwA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4GYX29bxz2yDG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 19:11:59 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4GYP0jTVzBHXhg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 17:11:53 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689585113; x=1692177114; bh=vj4//deCA33OOlFe8LFxHO33dYk
	UaS71mYSQYbPAi+o=; b=uGz2viwAd5vEYbFkyY7V3UTVFRT9HvHBSK5LtrpgFli
	nI332PdqAZ9KRIXj6Bliz35X+wUNYTAmGHarDfR2ASPH/O8moUDTpEq555bTP7PT
	4DMTOWT6qMJMQwhBK7XgO2YdOWyPltVEiCR0g1m4CgHutjJbQRmdKZ/XYbzDMCrT
	2QzU+F8dpkZs6j7SwoM6p78nE5/bTDAEUvQWLl0IlimMsXKRwJdcu5fkCwsRdvey
	sVSCXVycNmnDT5zRbYwgfkHFith65ETu9kYkQeeXo5sYszESXzWUmTDlWly/kG8M
	GI7ZGq2Jrv37YDiVNgjavYULSUQsdayvyJuGQJ+atTA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YRdvx_yZ0ePA for <linuxppc-dev@lists.ozlabs.org>;
	Mon, 17 Jul 2023 17:11:53 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4GYN6L4yzBHXhJ;
	Mon, 17 Jul 2023 17:11:52 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 17 Jul 2023 17:11:52 +0800
From: hanyu001@208suo.com
To: benh@kernel.crashing.org
Subject: [PATCH] drivers: macintosh: space required after that ','
In-Reply-To: <tencent_ADDBAE8EF1F902A4A64541C5ABD08C207D07@qq.com>
References: <tencent_ADDBAE8EF1F902A4A64541C5ABD08C207D07@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <7eb1fdadf332dccdb74bf4721b7772de@208suo.com>
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
