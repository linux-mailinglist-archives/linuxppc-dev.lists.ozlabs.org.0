Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46395646B8A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 10:09:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSSyv0h8Hz2xmg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 20:09:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hUSFMFEV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hUSFMFEV;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSSwy2clyz2xmg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 20:08:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B1A65B821EA;
	Thu,  8 Dec 2022 09:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34E1C433D7;
	Thu,  8 Dec 2022 09:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670490477;
	bh=DA/5HF7V2NSQkN54uky2gasVxMmd2cNnNAGMRQXALrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hUSFMFEVBQn9ITl5BeybwRbPT7vgOeOeyiP4TUgB907EOmVknn+3axNxVOIP6odNR
	 mFA3dKr7PYIbfPVNdUDxTB+X8v5VoerBUD7jC3nSmD69KD/cVtRqnX3icWXhxrmvEg
	 pg0wqFZqMejbkYKKMGP9aGm3iMIWHAPiBWQ/DcSpFulHQqIQF0Z0H9QrumOfm2IAyC
	 tBSXHfJlbDn0URePQmOlQnMjO6Lf1UiubiV7mrt+pc0Kk1IlSBfIw2QjrKWq1P5unf
	 fcC/+Wj98ip88HYq2xArfn4RyG7rCnVhPL9oKQ/PmTRptWR1do1H7/06ugDh8fxYj7
	 +1iiLU26E5McA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 2/3] USB: sisusbvga: rename sisusb.c to sisusbvga.c
Date: Thu,  8 Dec 2022 10:07:47 +0100
Message-Id: <20221208090749.28056-2-jirislaby@kernel.org>
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

As it's the only source for the sisusbvga module, there is no need for a
2-steps build.

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
 drivers/usb/misc/sisusbvga/Makefile                  | 2 --
 drivers/usb/misc/sisusbvga/{sisusb.c => sisusbvga.c} | 0
 2 files changed, 2 deletions(-)
 rename drivers/usb/misc/sisusbvga/{sisusb.c => sisusbvga.c} (100%)

diff --git a/drivers/usb/misc/sisusbvga/Makefile b/drivers/usb/misc/sisusbvga/Makefile
index 93265de80eb9..28aa1e6ef823 100644
--- a/drivers/usb/misc/sisusbvga/Makefile
+++ b/drivers/usb/misc/sisusbvga/Makefile
@@ -4,5 +4,3 @@
 #
 
 obj-$(CONFIG_USB_SISUSBVGA) += sisusbvga.o
-
-sisusbvga-y := sisusb.o
diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusbvga.c
similarity index 100%
rename from drivers/usb/misc/sisusbvga/sisusb.c
rename to drivers/usb/misc/sisusbvga/sisusbvga.c
-- 
2.38.1

