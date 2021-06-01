Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE61397F1F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 04:33:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvtPF1MZfz3099
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 12:33:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WU1tJppY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T/L0W2sa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=WU1tJppY; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=T/L0W2sa; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvfsD1NBfz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 03:53:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622569991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pNOYNG97wxiKXrv1fY3MLdBLOgcafFxSlaK17pla1RE=;
 b=WU1tJppYJCzz36pGtPanVocaVYSP0ckOwpJ8BKmRlMcGkqXByu1uWOMc36cV/C+jeEFeNO
 9MFKNHuNqocsevzNk1Zrj0/MrFg2Z0w4s0lzWg45Hma/nPg9v6pjUjzusrDwJzJSer+dOY
 FEEOZTngU8gRiDUrdL08oki6tM5DA3o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622569992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pNOYNG97wxiKXrv1fY3MLdBLOgcafFxSlaK17pla1RE=;
 b=T/L0W2saDI9b+eo/NdRekK9wJxih+Gy7qX0EEw60znPcFvee61QwYz4ZaxjbiXjvz+Im3d
 1z/6P7Pox96Vg20AGlU6KAsO9MqN0i17fDgmHBXsREC1iv8TZYmMoPEVueFXd3xNobPwF2
 9C6M9XTRqd/X5ODXzP5vilCt35d5d/Q=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-hbhg3vcMOsuFmJkopUwZBg-1; Tue, 01 Jun 2021 13:53:09 -0400
X-MC-Unique: hbhg3vcMOsuFmJkopUwZBg-1
Received: by mail-ot1-f71.google.com with SMTP id
 y2-20020a0568301082b02903b5696f0a64so70172oto.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jun 2021 10:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pNOYNG97wxiKXrv1fY3MLdBLOgcafFxSlaK17pla1RE=;
 b=MwAMFDXKlbSqXiZKxBxMWiLnOj66upO/XvzWDXCWk3tkE7vBfCkGHN1gwuMDf57fR7
 IjYBVo2Xrlk5q+NvnEid4R/IVOnxUuZ2S0lMqhjfUpX+KgbeiTqCY7dXKoXlxabwOejX
 fYuUUiUFiiubcSyFpRnKCVhEakQLz7c8MvPxbWr1bQviHSRnfVomT3/AZtl2vwal1stZ
 3fLesy7+sVcTtlcxMrVnguc6O8kgRKQfd1KaKURyjMx1/RnHfBU8zd6bV2zvM3k/ktI+
 RNlJBO3J3yLv592jaduErY7B+1hCC7pX6EoltiDcBvX33+nN8ojiwCb6VEb7Hk3SZq/3
 L2DQ==
X-Gm-Message-State: AOAM530zFmHwudiMVFbkSJFm07KdlvVQqN6haOqrgcOCfRS8IKtBMKsY
 KnmEtoivxd2GIj+j+8VpMujl+UesBwohlSGPvp274tJJk6TjzZ/8Iylou2GMPyE6yxLXeI3rAdZ
 lpDDdSAYYC4qbxPDXGRcT2acBKQ==
X-Received: by 2002:aca:b605:: with SMTP id g5mr19367058oif.127.1622569989156; 
 Tue, 01 Jun 2021 10:53:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzDMtyES5IO0g4tKfr9KgONwWoEXJGguwbpp38uye5bNA0u9EOVxUefy/X5FiVfd7rwRnouw==
X-Received: by 2002:aca:b605:: with SMTP id g5mr19367027oif.127.1622569988610; 
 Tue, 01 Jun 2021 10:53:08 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id e29sm3585403oiy.53.2021.06.01.10.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 10:53:08 -0700 (PDT)
From: trix@redhat.com
To: christophe.leroy@csgroup.eu, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
Subject: [PATCH] powerpc/8xx: select CPM1 for MPC8XXFADS
Date: Tue,  1 Jun 2021 10:53:04 -0700
Message-Id: <20210601175304.2634549-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Mailman-Approved-At: Wed, 02 Jun 2021 12:32:57 +1000
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
Cc: Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tom Rix <trix@redhat.com>

With MPC8XXFADS, there is this linker error
ppc64-linux-ld: m8xx_setup.o: in function `cpm_cascade':
m8xx_setup.c: undefined reference to `cpm_get_irq'

cpm_get_irq() is conditionally complied by CPM1
So add a select, like the other plaforms

Signed-off-by: Tom Rix <trix@redhat.com>
---
 arch/powerpc/platforms/8xx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/8xx/Kconfig b/arch/powerpc/platforms/8xx/Kconfig
index 60cc5b537a98..919082cdb2f1 100644
--- a/arch/powerpc/platforms/8xx/Kconfig
+++ b/arch/powerpc/platforms/8xx/Kconfig
@@ -10,6 +10,7 @@ choice
 
 config MPC8XXFADS
 	bool "FADS"
+	select CPM1
 
 config MPC86XADS
 	bool "MPC86XADS"
-- 
2.26.3

