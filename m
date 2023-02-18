Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C94269B9D4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 12:34:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJmn56Sh1z3fVL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 22:34:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CQRyzWHz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CQRyzWHz;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJmc14gcMz3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 22:26:57 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 02AF9B822AA;
	Sat, 18 Feb 2023 11:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9DEC4339B;
	Sat, 18 Feb 2023 11:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676719613;
	bh=5jg2jqGPIyL6vN19Ng9QZ/xR8UUjQOy1EGr++zpbTmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CQRyzWHzrkxJ03GZ8egiJEl13aeI8SFTPT6ryxKMdrLNwGNPhVoVVIMcOIbfbv01y
	 r8leIqNsTYTpUOBDlWOtZS/LRi93keSh5by0i6Qv0HJ1S9CjVEzfx6iVdQc/GraWJ8
	 nuoiygLirqQyEHVFTi+9wS+VXgM+CEwyjtg6LvPpN2C49iBDedHD9TIlI5PJC3Esm7
	 voAZLWaMayUVmN8ycPb5R365kHKXlEQda6tRToBJFZ1gqsZu7skM+qch3yO0ldz7tc
	 nXsUWr3PD4GWGXLA0/CQYa/P9ZVJTNZKfavNw4lhVwUcuMSjNQeyj+l5qqRKFrfrjN
	 SUrEt/fnERu3Q==
Received: by pali.im (Postfix)
	id E93DA2761; Sat, 18 Feb 2023 12:26:49 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Scott Wood <oss@buserror.net>,
	Sinan Akman <sinan@writeme.com>,
	Martin Kennedy <hurricos@gmail.com>
Subject: [PATCH v3 8/8] powerpc: dts: turris1x.dts: Remove "fsl,P2020RDB-PC" compatible string
Date: Sat, 18 Feb 2023 12:14:05 +0100
Message-Id: <20230218111405.27688-9-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230218111405.27688-1-pali@kernel.org>
References: <20230218111405.27688-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"fsl,P2020RDB-PC" compatible string was present in Turris 1.x DTS file just
because Linux kernel required it for proper detection of P2020 processor
during boot.

This was quite a hack as CZ.NIC Turris 1.x is not compatible with
Freescale P2020-RDB-PC board.

Now when kernel has generic unified support for boards with P2020
processors, there is no need to have this "hack" in turris1x.dts file.

So remove incorrect "fsl,P2020RDB-PC" compatible string from turris1x.dts.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/boot/dts/turris1x.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
index e9cda34a140e..a95857de6858 100644
--- a/arch/powerpc/boot/dts/turris1x.dts
+++ b/arch/powerpc/boot/dts/turris1x.dts
@@ -15,7 +15,7 @@
 
 / {
 	model = "Turris 1.x";
-	compatible = "cznic,turris1x", "fsl,P2020RDB-PC"; /* fsl,P2020RDB-PC is required for booting Linux */
+	compatible = "cznic,turris1x";
 
 	aliases {
 		ethernet0 = &enet0;
-- 
2.20.1

