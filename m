Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E672C346A68
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 21:46:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4k0t6zCMz3bcZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 07:46:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KTcJlCyG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KTcJlCyG; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4k0S3y7gz2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 07:45:43 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id cx5so11192084qvb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 13:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RUgvO1rZctYMPdZPottzZ9JagbxcsrEkbruYu8o8cmo=;
 b=KTcJlCyGSOmooctjTz2tK6OWYwyoF63uzwiGE4kGwAdssi7d/ZhZE4T/d/fufa3w0F
 RAFsqNq/tPAC+P8VBK7KaTFqqqYXHJLUK5T4tkZ2vE/Eb3csdn+5s5546DopsUoSBn03
 DdMZP2nBor5my2zh2+cmAqpDMLBK35A6TI468FzsEoScipjT0sg7sIbEQz2IApLwahl/
 oXgTBSQVvuMUyeyuPQswd8LIr7riVLdX0MOJKAAvyRmKUZaOp5viMxWL0WHrpo8MHeUm
 uFuXS2J0XVjRhYlTgNiG3qfArq+u9atFWWnqQu71sTL3qEU0JQJJJx/xRxjwS3TmlAXX
 JhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RUgvO1rZctYMPdZPottzZ9JagbxcsrEkbruYu8o8cmo=;
 b=ekAO3tccL2Mvnu263rXCtCWPPT8NZLH+0cH3N0ZPgLgbCtYHnBpX9aEy52+wqlg13x
 N1kGzpXq5bKH7n+pRfpc++rNioRSDeaxtMTezsvmxbtUK2wrctQSGEpQAOHhQkQDooa2
 znou2CiTPHAsWDxMX8yBFg8wmDdkYI8kjj+AHE+NubcfG/NH6BiIEEoES+FBFpA3UJru
 RRP66IlMT64qIy1oXBuYNO/z42ZMImr3lZKG0EQb2fpLV6gwfsdya8/enwmn2C50arKC
 mL+a4FOWFADjjeIMYr0GHsbNyUnglyyqYf+Z5mNXdyIpYA5+b+6QbtPMm5DbfLz71Xuy
 vQ4g==
X-Gm-Message-State: AOAM531g5qIWaBphdnK7rhcYHUej51nGce2zbJKuQIDPv7z2kcEQnhhk
 Cv+pB7h6rrn3NsKt8HyuGWc=
X-Google-Smtp-Source: ABdhPJy3r1AWvy/tj6UqYhI5mZoK/SHIM8KoJ20iKRDVrq3gLlrrWD37tIBBc2ZzUGGFYyZ4UxcqkQ==
X-Received: by 2002:a05:6214:16c1:: with SMTP id
 d1mr6999063qvz.29.1616532338069; 
 Tue, 23 Mar 2021 13:45:38 -0700 (PDT)
Received: from Slackware.localdomain ([37.19.198.105])
 by smtp.gmail.com with ESMTPSA id j24sm26367qka.67.2021.03.23.13.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 13:45:37 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: benh@kernel.crashing.org, unixbhaskar@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] macintosh: A typo fix
Date: Wed, 24 Mar 2021 02:16:52 +0530
Message-Id: <20210323204652.23059-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
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
Cc: rdunlap@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


s/coment/comment/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/macintosh/windfarm_smu_controls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/windfarm_smu_controls.c b/drivers/macintosh/windfarm_smu_controls.c
index 79cb1ad09bfd..75966052819a 100644
--- a/drivers/macintosh/windfarm_smu_controls.c
+++ b/drivers/macintosh/windfarm_smu_controls.c
@@ -94,7 +94,7 @@ static int smu_set_fan(int pwm, u8 id, u16 value)
 		return rc;
 	wait_for_completion(&comp);

-	/* Handle fallback (see coment above) */
+	/* Handle fallback (see comment above) */
 	if (cmd.status != 0 && smu_supports_new_fans_ops) {
 		printk(KERN_WARNING "windfarm: SMU failed new fan command "
 		       "falling back to old method\n");
--
2.30.1

