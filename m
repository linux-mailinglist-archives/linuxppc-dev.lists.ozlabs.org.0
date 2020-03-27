Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B99195FF2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 21:44:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pv401Hp3zDrQF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 07:44:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=QqTDef/u; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ptgC2HzZzDrJt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 07:26:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WNUESAKxE7AZphzB0Gt0i9UkITAjbVa213iEAx2FsxU=; b=QqTDef/umBexlapmfSem1T6/Wn
 UfYu3TzB8zfQ5Cd5OqulRfJhM61aU0HrudTTFpcA54Vvmetl0cfRVEEmeVDyUzFNE4OW9IQa1svlG
 zHDe1P7t7srrcAas4DtOYHUu30PWrpYO0nd4MsxXKJ13Y7EsIvtQgSEzHUn+NfKkM6rYSKsbta9NV
 Js+uqs5UDUmLhicsOcxsL+MD3qCj7/vAx3i0fbYUXB/Zeltg1/lnMzPORRN2wWobwAAscjz1E0DqL
 rXdZhrgQRr3y4Mzlcnym7D65MeGI/jwfFDVUjTrn3Ok+e8oKW3cP3USH2Q7tRIRQJltixI1mMb1O6
 4YMBl/ow==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHvYd-0003Ip-Ks; Fri, 27 Mar 2020 20:26:23 +0000
Message-Id: <410cda9aa1a6e04434dfe1f9aa2103d0694f706c.1585340156.git.geoff@infradead.org>
In-Reply-To: <cover.1585340156.git.geoff@infradead.org>
References: <cover.1585340156.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 27 Mar 2020 13:07:30 -0700
Subject: [PATCH 6/9] powerpc/ps3: Set CONFIG_UEVENT_HELPER=y in ps3_defconfig
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 27 Mar 2020 20:26:23 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Set CONFIG_UEVENT_HELPER=y in ps3_defconfig.

commit 1be01d4a57142ded23bdb9e0c8d9369e693b26cc (driver: base: Disable
CONFIG_UEVENT_HELPER by default) disabled the CONFIG_UEVENT_HELPER option
that is needed for hotplug and module loading by most older 32bit powerpc
distributions that users typically install on the PS3.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/configs/ps3_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/configs/ps3_defconfig b/arch/powerpc/configs/ps3_defconfig
index 4db51719342a..81b55c880fc3 100644
--- a/arch/powerpc/configs/ps3_defconfig
+++ b/arch/powerpc/configs/ps3_defconfig
@@ -60,6 +60,8 @@ CONFIG_CFG80211=m
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
 # CONFIG_MAC80211_RC_MINSTREL is not set
+CONFIG_UEVENT_HELPER=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=65535
-- 
2.20.1


