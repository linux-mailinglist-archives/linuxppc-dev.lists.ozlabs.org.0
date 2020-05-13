Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEA21D2176
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 23:49:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MpGy3bw1zDqkS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 07:49:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=emil.l.velikov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RW1G+oga; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MpD334kCzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 07:46:52 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id d207so9895115wmd.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 14:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qwEXZysR23CccmrNbp4oN3ldgqd9cJzH2UZSb4ihijw=;
 b=RW1G+ogaAUWg4GP/IAaKNDiWpKHIvYpQnbau/mVBhnk3xIed4Kf27YNjBWyThTty/b
 aa6RzDE2vVQpDzT4KYj0Hg1pX7a86XwH8Gkjh+dqN2ijY/Bh7VOGNBKaBvllUvvgTe7V
 JYtYdUkSr9CrVUUlGhGy0qMnqJzhlEs9Gg1WhRCbrsggDPN8rSk+V+Xjj/ZBwbDca1zn
 Zqxq/ucDBkApCW26k1BrUvDs0z4ynUSWmSjyaEkSz0+q23ekyBhQTXxIbOAkQi1qEUd3
 PJfBW7d+pq1xy7EbcafYMm7NFocw/Ek9E40OFAv8yotfqMA/LMU73/trnk1ziQrnvLwP
 0KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qwEXZysR23CccmrNbp4oN3ldgqd9cJzH2UZSb4ihijw=;
 b=Y62TQtVSvO7zUF+3PR17cohSwUeHi0+cAFRNqKedTZ/f5jrXhVu6f7MksrNFVDp30e
 foK0ZW5B1MVKkItXofcJGWxdE/IRxtBOrzqp+jtnixe4x33ntDZYBg3KUjinFd9JcOAT
 kMmQx7eHnXa24eIYIFNmXZAKjugq93WUUfZoc/5pHNsVeIQ+8UXVIqEbeZgE7uriOKHT
 R42eMaF2gPGBnEMe7Olsm1pArfqC48GQfHiidoUNpykDzIs+4mUEbuFQjvt5Jd9HBr61
 o6uzQuY+9mMdiXSEPm8uSoDSVEQ72nvKETgBXdeiGK9m7E+8Gd4unIceQ5ZyrxMwd0+u
 +91g==
X-Gm-Message-State: AOAM530D+hUMNxa5etB8y/BIinSzxBsIxP2YFhUK4CV6x5/vRaUZW4Od
 GLOD2HG8Z5+usPjPlveF9WY=
X-Google-Smtp-Source: ABdhPJyLIg3eccKezg4f5axysxo4mad1I/De7u6J1LU+oD/g9NIWVf+Zl8ski/Ae57u9v6OoYfDaPA==
X-Received: by 2002:a1c:e188:: with SMTP id y130mr9611614wmg.105.1589406403908; 
 Wed, 13 May 2020 14:46:43 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:43 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] powerpc/xmon: constify sysrq_key_op
Date: Wed, 13 May 2020 22:43:46 +0100
Message-Id: <20200513214351.2138580-6-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
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
Cc: Jiri Slaby <jslaby@suse.com>, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With earlier commits, the API no longer discards the const-ness of the
sysrq_key_op. As such we can add the notation.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 arch/powerpc/xmon/xmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 7af840c0fc93..0d8ca5c9f131 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3842,7 +3842,7 @@ static void sysrq_handle_xmon(int key)
 		xmon_init(0);
 }
 
-static struct sysrq_key_op sysrq_xmon_op = {
+static const struct sysrq_key_op sysrq_xmon_op = {
 	.handler =	sysrq_handle_xmon,
 	.help_msg =	"xmon(x)",
 	.action_msg =	"Entering xmon",
-- 
2.25.1

