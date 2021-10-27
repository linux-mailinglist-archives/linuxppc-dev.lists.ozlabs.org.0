Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFFC43C797
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 12:23:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfPtL6ZWdz3cDr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 21:23:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=2a02:1800:120:4::f00:d; helo=newton.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Received: from newton.telenet-ops.be (newton.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfPsR0Lrcz2xXD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 21:23:06 +1100 (AEDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 4HfPhM1jymzMr5fh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 12:15:15 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:441:6c1a:bc30:46e])
 by andre.telenet-ops.be with bizsmtp
 id AyFE260042hfXWm01yFEen; Wed, 27 Oct 2021 12:15:14 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mffiU-008HRd-LB; Wed, 27 Oct 2021 11:59:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mfdzN-00DkK9-St; Wed, 27 Oct 2021 10:08:49 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Li Yang <leoyang.li@nxp.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: gadget: Mark USB_FSL_QE broken on 64-bit
Date: Wed, 27 Oct 2021 10:08:49 +0200
Message-Id: <20211027080849.3276289-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 64-bit:

    drivers/usb/gadget/udc/fsl_qe_udc.c: In function ‘qe_ep0_rx’:
    drivers/usb/gadget/udc/fsl_qe_udc.c:842:13: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
      842 |     vaddr = (u32)phys_to_virt(in_be32(&bd->buf));
	  |             ^
    In file included from drivers/usb/gadget/udc/fsl_qe_udc.c:41:
    drivers/usb/gadget/udc/fsl_qe_udc.c:843:28: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
      843 |     frame_set_data(pframe, (u8 *)vaddr);
	  |                            ^

The driver assumes physical and virtual addresses are 32-bit, hence it
cannot work on 64-bit platforms.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
One more casualty of CONFIG_WERROR=y.
http://kisskb.ellerman.id.au/kisskb/buildresult/14652936/
---
 drivers/usb/gadget/udc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 8c614bb86c665c77..69394dc1cdfb6436 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -330,6 +330,7 @@ config USB_AMD5536UDC
 config USB_FSL_QE
 	tristate "Freescale QE/CPM USB Device Controller"
 	depends on FSL_SOC && (QUICC_ENGINE || CPM)
+	depends on !64BIT || BROKEN
 	help
 	   Some of Freescale PowerPC processors have a Full Speed
 	   QE/CPM2 USB controller, which support device mode with 4
-- 
2.25.1

