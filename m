Return-Path: <linuxppc-dev+bounces-3202-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EA39C8B86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 14:12:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0sY2LgMz30C5;
	Fri, 15 Nov 2024 00:11:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731589889;
	cv=none; b=UqXUEySzhbOUKHLGssuaEdFoUlZoNxYo2Ei04dTQXBE28kdDDpinfLUt+aXQGBYuy2kRYr8VNb2CI2CZd/om1RbUoJQ58emC4dZTXEjGOzU2PW2BWE9oooJUbtVaAkN28Xq+aBJLWcBGXLgSRYTFFL/67vH5kc5DlTxUyM3TSiVKP8KrYEZR8mkmHHzGwMSRreKZ6VDOZYCKGuhyauqFssWVkl3lS/fQC9S5BIQxuaSode3sZgc5fqlydWbRAbU0+DQz2SBt51vLNJYBmYq1U4S4L4d+oXkSw0a5gyZbZUyLywAAY5oprxlDVrYKvTLHp8+jDwwubr0B3uZHHjWmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731589889; c=relaxed/relaxed;
	bh=bh4YSrNjXuKLor5p5E2eFlc/Em8vHgx4kf/5d9oGFhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Th27NjwBrKaWf89AxsTLWOkMx+WWmvoLe4654+eZcvU0AoGNYPWyPGgBOjBhma57E7tuG3SAMsTKV8Pisz+Vf0/dxCViwfqw9ekt7zi/JpnpqsTRrnavjxkivEizIDnwV4z9FGuYE+1zeC1GuOS2er3MLwxKR6T319I3E2fqqCqr1RoWs+G9JzkeHpUJEiuDIZYfEOdK9j/b0C3WT4ei3c9JHZDsacHEzlsi/pNXFnck6OQ63v+tKEP9jyDPpAaQzpv69MYoYd4uMC9Q+VB5eF8QyCtHIZ49s/D4lqitN7dSv/riYWLK1sxNA2vWnNI40/fcv1Hgo+dkEVMZHRhlbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sNX/7hKB; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sNX/7hKB;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0sX6C4Mz306x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 00:11:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731589886;
	bh=bh4YSrNjXuKLor5p5E2eFlc/Em8vHgx4kf/5d9oGFhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sNX/7hKB+hZn4c4CkhnjBmgVReHB2OzVWMjh5M4I6ytM5hgn0mZVUpyHcBafMsKml
	 MU0dZe8q3HwMSTrCfGxwcq5JjpcXY6fyq+FwAyYxhkIzO5/GMQyAqUHoDMb3HJU5si
	 D1QOp2Gk9oKgsTLZfrIVLKne3wFSMiMd1uXEuzcFua5+UnoEtZah3sIvmXK+pgfU7Z
	 ri/mb5mqUBVsnT70yI7Rd3kr98MW3XzUBBhwEDuWejsqcReT1BHYL3sWEgHHmQUFRl
	 TpaTNI9GkAddCop5qMoLLESWk8slCTjkvqVeEMSJeXoO+qeiXU+LkRIrQh39poHzFl
	 FfbpK/RGLL3yw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0sV0Gy1z4xSX;
	Fri, 15 Nov 2024 00:11:26 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<geert@linux-m68k.org>,
	<arnd@arndb.de>
Subject: [RFC PATCH 10/10] i2c: Drop reference to PPC_CHRP
Date: Fri, 15 Nov 2024 00:11:13 +1100
Message-ID: <20241114131114.602234-10-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114131114.602234-1-mpe@ellerman.id.au>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

PPC_CHRP has been removed, so remove the reference to it in Kconfig.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index cbd072955e45..153929ac5f59 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -371,7 +371,7 @@ config I2C_SCMI
 endif # ACPI
 
 comment "Mac SMBus host controller drivers"
-	depends on PPC_CHRP || PPC_PMAC
+	depends on PPC_PMAC
 
 config I2C_POWERMAC
 	tristate "Powermac I2C interface"
-- 
2.47.0


