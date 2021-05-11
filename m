Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3EF379C04
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 03:25:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfKxb3X7Tz3095
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 11:25:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=O+p9+j5u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31;
 helo=mail-oo1-xc31.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O+p9+j5u; dkim-atps=neutral
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfKx418l5z2xb6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 11:25:27 +1000 (AEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 s24-20020a4aead80000b02901fec6deb28aso3873343ooh.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 18:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+zrmRKMfhYQdmQyV7QCWBSNSaV4y4nE0vpkcRYPnOKY=;
 b=O+p9+j5uR83S5wiXzYtAJEFdSmojGyo6UvPwWAyrHBP8lKnyYkeXX21XuIGkuVY0n4
 LyCKY6vu5hX8/MbnbNKLyghn9b2BcofRg9jt42foOhv6x9rzYrfB2be5BJoaNaHO65jh
 zwYGcXRX2689+is8CpGQ6rH0t69ybjfJ6EmEgTv9tqHdmf4fHm6wQJRkkKbHZKQsuCv9
 OoNVuIJfFeLMkAOBM23Xgnrca/YTBNRRDdFab3BuZpff1gD/8msjTDVLBaKG8m916K4E
 dQFMdNYjzrwLS0MR5G546jW2zgDGkde7RnFkLM+N/Jp7K4lF8B/qGzT3AqtX7RAz4fkZ
 P9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+zrmRKMfhYQdmQyV7QCWBSNSaV4y4nE0vpkcRYPnOKY=;
 b=fYIo/lkI+xcP0hlV9v0RuBlM+07qCutZ8keIWITF6St4fLzkctrbo9wSqbhZ96oT4j
 RiRq9hEMUyMicbzGStaOCSeTGDkGOUl05Dy/02ZdTaxwEDO9/WKAituaA1vb5oo74jOX
 B5MiKKvs3gP20Ie028BojR08zk5Pb6YPnVvq5kuhTVk6iqG3oUkEUAvpPJNxjud+KBoH
 05Gnkb3zVqVF1jXho58b8u5k26oZytAYwsPGyMMzyjxpGpBxyeSOcgDnzjzdPjrpzGeS
 inRg3lASAOT6W3J5QtkksabvXjP05BpsMm9RbQWq/5htSh7bnllwgzWgpaz/YaDJYvpo
 4vpA==
X-Gm-Message-State: AOAM533I2Ycx3rVXEb6BxelUmoFN/xnaH5+Bv9AJ9G9hczI4AFxZ7cUv
 ZutwHg/Z4JpcU5CBdYOGXsc=
X-Google-Smtp-Source: ABdhPJxWDhaIHwP0HN4z6UfoNzeZDQ2EcwmZMT7jJBAx7ezhdanL8wgm7NMlueADj45pafaMg02X4A==
X-Received: by 2002:a4a:e644:: with SMTP id q4mr18666874oot.58.1620696322724; 
 Mon, 10 May 2021 18:25:22 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id u13sm1921893oop.40.2021.05.10.18.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 18:25:22 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] s390/hvc_iucv: Drop unnecessary NULL check after container_of
Date: Mon, 10 May 2021 18:25:19 -0700
Message-Id: <20210511012519.2359074-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
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
Cc: linuxppc-dev@lists.ozlabs.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The result of container_of() operations is never NULL unless the extracted
element is the first element of the embedded structure. This is not the
case here. The NULL check is therefore unnecessary and misleading.
Remove it.

This change was made automatically with the following Coccinelle script.

@@
type t;
identifier v;
statement s;
@@

<+...
(
  t v = container_of(...);
|
  v = container_of(...);
)
  ...
  when != v
- if (\( !v \| v == NULL \) ) s
...+>

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/tty/hvc/hvc_iucv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_iucv.c b/drivers/tty/hvc/hvc_iucv.c
index 2af1e5751bd6..3bd03ae01bf5 100644
--- a/drivers/tty/hvc/hvc_iucv.c
+++ b/drivers/tty/hvc/hvc_iucv.c
@@ -438,8 +438,6 @@ static void hvc_iucv_sndbuf_work(struct work_struct *work)
 	struct hvc_iucv_private *priv;
 
 	priv = container_of(work, struct hvc_iucv_private, sndbuf_work.work);
-	if (!priv)
-		return;
 
 	spin_lock_bh(&priv->lock);
 	hvc_iucv_send(priv);
-- 
2.25.1

