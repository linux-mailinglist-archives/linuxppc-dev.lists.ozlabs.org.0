Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E114C6F4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 15:26:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6jNW1d5Zz3bSs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 01:26:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XhXH3g7w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c;
 helo=mail-ed1-x52c.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XhXH3g7w; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6jMq6kBNz30L1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 01:25:26 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id x5so17806232edd.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 06:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t89NhqJYorEFTw8WrVtJVWyHHmbVnl5aLtAxBdRQbyU=;
 b=XhXH3g7w69442RPA1I5M5/K8M1qvIrQSI2wWBRk3Rtw6la/HhkC0ud+M4OxwK4jHbE
 ZHDHRpEiplIwdsIqTShexd2pbaNzsdkX75dxSIQDwnWM/omTHoUp7oIfpj716pUmQk6h
 0MEKVNCRE13ruMxNqOc+zvibmaUfAjIxBFnWmxDdlSBrCuVt+luarFbAbpx8SebKxfKI
 RVYrAlfpv0VGCiwdx93Z7+tpDINxXHaDcVl7OLPNqvfjBjFP+jaBR3kbYNXc01sfxfKl
 gnuJwe+zxdbeB5jHT/tX78TiFmpr9fm2X23LTpOfqPZ6Yw1OQLTcDURBxpuue7yVAbWs
 xrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t89NhqJYorEFTw8WrVtJVWyHHmbVnl5aLtAxBdRQbyU=;
 b=pdQn0vpqiXFsPeT1e4tnBuKGdOPkBHhwIb8hBVUcYniLrKrGZ/o6NSOHFaFqx/gK/d
 TWoeHI/PdW6lfs3iarSiVpfR+BgD6H7eNuxTDitxxkWmieqv1CLCDb3nQwl9pFg+6YxF
 0tTfR1lKLy6vglZZnSnjFdgunkRgVeSQ/ZrUqJ6j8Cm6Lr5qscrN9BGPM6vwhrWRw294
 ORITx0rHA2570Rbs5aVAJ4ACCH5mGoKHG1kk4IO3VgkLCMF/0MtHq8jnhbttnZ1tWQ/E
 E6emnITJMMMkEOWTioV3TkEqzAKaXkCwwW3jLq6M/AfSOJ6uBHq+AlhpmmHxSmZDoOru
 LIvw==
X-Gm-Message-State: AOAM531aTtqNuwJ3G51RKpL8JnQjNwRyhreN/c0qrfrqk+RZhf7TiRjv
 CFi3dKKLQNTg1e5K80Ne4GA=
X-Google-Smtp-Source: ABdhPJxOxtmXMvYcLKAjDOX0lh9MhTomTdWMimmV0Cfq/XIN4jDu+unVS7ejvfrzCMb440clF5fS2w==
X-Received: by 2002:a50:d711:0:b0:410:a51a:77c5 with SMTP id
 t17-20020a50d711000000b00410a51a77c5mr20374819edi.154.1646058320341; 
 Mon, 28 Feb 2022 06:25:20 -0800 (PST)
Received: from localhost.localdomain (dhcp-077-250-038-153.chello.nl.
 [77.250.38.153]) by smtp.googlemail.com with ESMTPSA id
 ov6-20020a170906fc0600b006cf54ef58ddsm4494527ejb.149.2022.02.28.06.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 06:25:19 -0800 (PST)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/sysdev: fix incorrect use to determine if list is
 empty
Date: Mon, 28 Feb 2022 15:24:33 +0100
Message-Id: <20220228142434.576226-1-jakobkoschel@gmail.com>
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
Cc: Kumar Gala <galak@kernel.crashing.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Jakob Koschel <jakobkoschel@gmail.com>,
 Anton Vorontsov <avorontsov@ru.mvista.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'gtm' will *always* be set by list_for_each_entry().
It is incorrect to assume that the iterator value will be NULL if the
list is empty.

Instead of checking the pointer it should be checked if
the list is empty.

Fixes: 83ff9dcf375c ("powerpc/sysdev: implement FSL GTM support")
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 arch/powerpc/sysdev/fsl_gtm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_gtm.c b/arch/powerpc/sysdev/fsl_gtm.c
index 8963eaffb1b7..39186ad6b3c3 100644
--- a/arch/powerpc/sysdev/fsl_gtm.c
+++ b/arch/powerpc/sysdev/fsl_gtm.c
@@ -86,7 +86,7 @@ static LIST_HEAD(gtms);
  */
 struct gtm_timer *gtm_get_timer16(void)
 {
-	struct gtm *gtm = NULL;
+	struct gtm *gtm;
 	int i;

 	list_for_each_entry(gtm, &gtms, list_node) {
@@ -103,7 +103,7 @@ struct gtm_timer *gtm_get_timer16(void)
 		spin_unlock_irq(&gtm->lock);
 	}

-	if (gtm)
+	if (!list_empty(&gtms))
 		return ERR_PTR(-EBUSY);
 	return ERR_PTR(-ENODEV);
 }

base-commit: 7ee022567bf9e2e0b3cd92461a2f4986ecc99673
--
2.25.1

