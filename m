Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021F81B503
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 12:38:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=vpZoQveA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwpN96vTPz3cVN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 22:38:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=vpZoQveA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yandex.ru (client-ip=2a02:6b8:c0e:500:1:45:d181:d202; helo=forward202a.mail.yandex.net; envelope-from=dmantipov@yandex.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 492 seconds by postgrey-1.37 at boromir; Thu, 21 Dec 2023 21:31:36 AEDT
Received: from forward202a.mail.yandex.net (forward202a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swmtw3WXgz30YZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 21:31:36 +1100 (AEDT)
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d102])
	by forward202a.mail.yandex.net (Yandex) with ESMTP id E92FB69BCD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 13:23:31 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-33.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-33.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:5b80:0:640:1f93:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTP id 11F5260901;
	Thu, 21 Dec 2023 13:23:11 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-33.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 9NLuGbUOquQ0-UwP9Wodq;
	Thu, 21 Dec 2023 13:23:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1703154190; bh=2pdItxhakGom1sdDvXNZRGdYoqt70Mi+TSoKoE5DWb0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=vpZoQveAtqiFqy3M6OjATigi46zx1FmYYHPlcX1u9vLXNmY80t4VB8MGdOaG/hIiN
	 P0zwtwIXnQnvos7vJFlW+o+kM3xseN4Vi4dC0wFlbPA82HhVomPM/5X1WfmI7rAXEb
	 avWHnqByWXzeBq7LG7/w/iCMHAJlxjb+//IiKKqU=
Authentication-Results: mail-nwsmtp-smtp-production-main-33.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] soc: fsl: dpio: fix kcalloc() arguments order
Date: Thu, 21 Dec 2023 13:20:44 +0300
Message-ID: <20231221102054.19643-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Dec 2023 22:37:52 +1100
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
Cc: Roy Pledge <Roy.Pledge@nxp.com>, Dmitry Antipov <dmantipov@yandex.ru>, linuxppc-dev@lists.ozlabs.org, Ioana Ciornei <ioana.ciornei@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When compiling with gcc version 14.0.0 20231220 (experimental)
and W=1, I've noticed the following warning:

drivers/soc/fsl/dpio/dpio-service.c: In function 'dpaa2_io_service_enqueue_multiple_desc_fq':
drivers/soc/fsl/dpio/dpio-service.c:526:29: warning: 'kcalloc' sizes specified with 'sizeof'
in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
  526 |         ed = kcalloc(sizeof(struct qbman_eq_desc), 32, GFP_KERNEL);
      |                             ^~~~~~

Since 'n' and 'size' arguments of 'kcalloc()' are multiplied to
calculate the final size, their actual order doesn't affect the
result and so this is not a bug. But it's still worth to fix it.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/soc/fsl/dpio/dpio-service.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/dpio/dpio-service.c b/drivers/soc/fsl/dpio/dpio-service.c
index 1d2b27e3ea63..b811446e0fa5 100644
--- a/drivers/soc/fsl/dpio/dpio-service.c
+++ b/drivers/soc/fsl/dpio/dpio-service.c
@@ -523,7 +523,7 @@ int dpaa2_io_service_enqueue_multiple_desc_fq(struct dpaa2_io *d,
 	struct qbman_eq_desc *ed;
 	int i, ret;
 
-	ed = kcalloc(sizeof(struct qbman_eq_desc), 32, GFP_KERNEL);
+	ed = kcalloc(32, sizeof(struct qbman_eq_desc), GFP_KERNEL);
 	if (!ed)
 		return -ENOMEM;
 
-- 
2.43.0

