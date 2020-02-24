Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2916B5BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 00:37:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RJPc6TVgzDqHh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 10:37:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RJHV4xFyzDq6Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 10:31:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=X0VLEUMq; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48RJHV43FGz9sQt; Tue, 25 Feb 2020 10:31:50 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48RJHV2RF7z9sRJ; Tue, 25 Feb 2020 10:31:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582587110;
 bh=iMhwIn4qZ6J9t/aXW+vFOqz6zFFtCUD/Scd2rEKsk6I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X0VLEUMqCZTTFakFDK0QSpyidvf//x3QQ8H+dKeS57KHmsX8U24xBpGITYIBPutAC
 /Pc4T5VbukMx8OsMy/+DJC+Jc7QFxZKNuLNnCmpDgA3hz8HS4LZXx1MExfE474IgQ/
 XG6jHlyCucjU+yzfdgzMjt0+xTlOD1utjCC9nuVLxtqB8hRW45Dg4Xj4IWqBaMyywc
 aSQs5vUFCcLD7Z1CC8VUSRY5xe+yMBo2NReQ9yU1qh5Nwtoj7BmEwdxqRyWme7i7OT
 V27rNh0Ij6pD1Pt06Y/vlQUT745n7tywAGDKyjMVACy5AdoIB6QDK2eEtS1eeUeSO5
 BIYCjYUo2uEqA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 3/8] powerpc: Remove PA SEMI MAINTAINERS entries
Date: Tue, 25 Feb 2020 10:31:41 +1100
Message-Id: <20200224233146.23734-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200224233146.23734-1-mpe@ellerman.id.au>
References: <20200224233146.23734-1-mpe@ellerman.id.au>
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
Cc: Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PA SEMI entries have been orphaned for 3 ½ years, so fold them
into the main POWERPC entry. The result of get_maintainer.pl is more
or less unchanged.

Cc: Olof Johansson <olof@lixom.net>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 435e4efc9a32..5c4f37c41188 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9621,6 +9621,8 @@ F:	drivers/crypto/vmx/
 F:	drivers/i2c/busses/i2c-opal.c
 F:	drivers/net/ethernet/ibm/ibmveth.*
 F:	drivers/net/ethernet/ibm/ibmvnic.*
+F:	drivers/*/*/*pasemi*
+F:	drivers/*/*pasemi*
 F:	drivers/pci/hotplug/pnv_php.c
 F:	drivers/pci/hotplug/rpa*
 F:	drivers/rtc/rtc-opal.c
@@ -9675,13 +9677,6 @@ S:	Orphan
 F:	arch/powerpc/*/*virtex*
 F:	arch/powerpc/*/*/*virtex*
 
-LINUX FOR POWERPC PA SEMI PWRFICIENT
-L:	linuxppc-dev@lists.ozlabs.org
-S:	Orphan
-F:	arch/powerpc/platforms/pasemi/
-F:	drivers/*/*pasemi*
-F:	drivers/*/*/*pasemi*
-
 LINUX KERNEL DUMP TEST MODULE (LKDTM)
 M:	Kees Cook <keescook@chromium.org>
 S:	Maintained
@@ -12541,16 +12536,6 @@ W:	http://wireless.kernel.org/en/users/Drivers/p54
 S:	Maintained
 F:	drivers/net/wireless/intersil/p54/
 
-PA SEMI ETHERNET DRIVER
-L:	netdev@vger.kernel.org
-S:	Orphan
-F:	drivers/net/ethernet/pasemi/*
-
-PA SEMI SMBUS DRIVER
-L:	linux-i2c@vger.kernel.org
-S:	Orphan
-F:	drivers/i2c/busses/i2c-pasemi.c
-
 PACKING
 M:	Vladimir Oltean <olteanv@gmail.com>
 L:	netdev@vger.kernel.org
-- 
2.21.1

