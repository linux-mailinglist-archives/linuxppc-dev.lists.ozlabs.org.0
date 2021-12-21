Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1564547C1DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 15:49:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJK8v01Qzz3c6G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 01:49:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QwYotQVA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QwYotQVA; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJK892w6fz2xtw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 01:48:23 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id v22so12997298qtx.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 06:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zZuDkRiIkR9ys/6q9NNmS5Lq8rxb7QfIIo9v52hklq8=;
 b=QwYotQVAOw8t142MhQtL5+mbjmyHKWsbUStue/SPP7IY9tm5RYJdi7gtxSTCyIJo/O
 IpimVtyfCBPML408CUBDpht1PQswdsEokBKl4jg4euhi6pg7H8MChYJVNbG//xr39NTn
 d/mRWIWTEQdTKq1LODzeNdA1yAAr8aTM2zrV/VClEpZ+g5CxLtjFf/p776IDItuOYed5
 a5UbzizCDkLkmFJvjF4D3wVXNwSuff/olsX1y7V2yWn2J4b3juMBRyIHQ25wjMsUFWMW
 uqrJEYrVQSv01yGAAE7tbvifskxNi4PZVXJy8CGhSiMnmkG+z5RtB+AP8jfKA5LQ0UkK
 kEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zZuDkRiIkR9ys/6q9NNmS5Lq8rxb7QfIIo9v52hklq8=;
 b=Mp+59EdVQvAtBsgEiUitt6w697yYFTx849q8VaUZMMDfCpgnqWqm4+BO/2f+E8+5bl
 E6KwJwdq+QPCbvvCFyg/w/rKMFQXk/Sqa3vU/quqQdmp4ZgrJ8soed+6SXwVmDYyoDS2
 4HJXcQQ29nr4FTu84b79NX0rFGRQSRXU9xQGiNx4PdGkQiH8gTFRGV21+duCI0zFgxmG
 IN5JpZT7iqKKxxPuRDuJvdV0mGWHHMmZtrn/9r+jpbWvfu7udWljoSOXWqgPfX9dpcoN
 of/XK9R0qlmj70S8UaW/SWF/P2iiJ9CHJXhzXFYrRMMRsOKiYnrKFgHV804B+Fo99Dbx
 p91Q==
X-Gm-Message-State: AOAM531SKDkAN7US/RHPSCz7z+aGIiI5LVRRoPM+i2vz8sZxp++6CaZ1
 0U255wSchvTYATthTysnVzs=
X-Google-Smtp-Source: ABdhPJycfYQf2KP5PZ7xjWj+VSDFrXKBOwWd5EsILfz2JTg5hj204QyNxDQyiJNBB5Ho2MIZXAm3Pw==
X-Received: by 2002:a05:622a:c8:: with SMTP id p8mr2483288qtw.52.1640098099976; 
 Tue, 21 Dec 2021 06:48:19 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id y11sm18110177qta.6.2021.12.21.06.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 06:48:19 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: arnd@arndb.de
Subject: [PATCH] powerpc/cell/axon_msi: replace DEFINE_SIMPLE_ATTRIBUTE with
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Tue, 21 Dec 2021 14:48:14 +0000
Message-Id: <20211221144814.480849-1-deng.changcheng@zte.com.cn>
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
Cc: Zeal Robot <zealci@zte.com.cn>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, linux-kernel@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Fix the following coccicheck warning:
./arch/powerpc/platforms/cell/axon_msi.c: 456: 0-23: WARNING: fops_msic
should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Use DEFINE_DEBUGFS_ATTRIBUTE rather than DEFINE_SIMPLE_ATTRIBUTE for
debugfs files.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 arch/powerpc/platforms/cell/axon_msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platforms/cell/axon_msi.c
index 354a58c1e6f2..47bb0ae8d6c9 100644
--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -453,7 +453,7 @@ static int msic_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_msic, msic_get, msic_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_msic, msic_get, msic_set, "%llu\n");
 
 void axon_msi_debug_setup(struct device_node *dn, struct axon_msic *msic)
 {
-- 
2.25.1

