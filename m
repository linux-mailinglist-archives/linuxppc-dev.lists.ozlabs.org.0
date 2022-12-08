Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA40C646B92
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 10:10:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSSzt50yJz2xZp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 20:10:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QEtT/hxn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QEtT/hxn;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSSwy6R3tz2xmg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 20:08:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DAAED61E0D;
	Thu,  8 Dec 2022 09:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3317C43470;
	Thu,  8 Dec 2022 09:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670490480;
	bh=/+A5oXIkfPVqlkdsYp0NLY4/uVwf3XSTDvcavOu+uhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QEtT/hxnWyXsDOquDQcYrJHOU+tUBHorP+rwZ5QfoNYvcJpM8gsnhSaA5eynkskUB
	 7k4QmLPwbfVNjvp+Kio+uBrLcplK8KL43Sa4RpXMaNED+YZ20iw15+95J+DXKYt+2c
	 wDRST3S8vXKSzjkwB5fbcunqSLFfP+2mcJqsKGZKgDTxxCsYKJFTGR8q7W5HogLk9s
	 lKiXt90jsqDhNQ1+LacP0KRvNcrFZUmugb9MvDk1sUcsrXlr0NQVx9X8lj6CUKs+WG
	 KW47TQW5kW/icnbnBka0Pg8DXCrcQhiGD8ynaicHbQeYiS0wLtPonZad5eAXXz9SZP
	 lOZE2Q4TLlEZA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 3/3] USB: sisusbvga: use module_usb_driver()
Date: Thu,  8 Dec 2022 10:07:48 +0100
Message-Id: <20221208090749.28056-3-jirislaby@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208090749.28056-1-jirislaby@kernel.org>
References: <20221208090749.28056-1-jirislaby@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Thomas Winischhofer <thomas@winischhofer.net>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now, that we only do usb_register() and usb_sisusb_exit() in
module_init() and module_exit() respectivelly, we can simply use
module_usb_driver().

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: Thomas Winischhofer <thomas@winischhofer.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
---
 drivers/usb/misc/sisusbvga/sisusbvga.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusbvga.c b/drivers/usb/misc/sisusbvga/sisusbvga.c
index a0d5ba8058f8..654a79fd3231 100644
--- a/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -2947,18 +2947,7 @@ static struct usb_driver sisusb_driver = {
 	.id_table =	sisusb_table,
 };
 
-static int __init usb_sisusb_init(void)
-{
-	return usb_register(&sisusb_driver);
-}
-
-static void __exit usb_sisusb_exit(void)
-{
-	usb_deregister(&sisusb_driver);
-}
-
-module_init(usb_sisusb_init);
-module_exit(usb_sisusb_exit);
+module_usb_driver(sisusb_driver);
 
 MODULE_AUTHOR("Thomas Winischhofer <thomas@winischhofer.net>");
 MODULE_DESCRIPTION("sisusbvga - Driver for Net2280/SiS315-based USB2VGA dongles");
-- 
2.38.1

