Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F716C13FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 14:51:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgGNr66gZz3cLF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 00:51:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bjqhzPUX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bjqhzPUX;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgGMx071Wz3cK8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 00:50:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679320237; x=1710856237;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n6T2JVYJbSsy1HsnBbxLghmE7GwndGUVZ+b4A2IrnVM=;
  b=bjqhzPUXtXsOJxB9hZ3ISdxCVDUYORBqWPwTGOdfBPxNQVmyJR0ClKmB
   YlF4WO+UU+6iSbP2IHno+anHK4NQGZ8yhAnS7BURvNxlhnXrMeFx8VC1e
   B+SN1WZaX3cwcpxElYBgGZAdiA6CKTw1KOx5hlPPgj7UzAHNQ6KBcMjnA
   fm1UhQtgnsc/Q0ismhVFzXu0CHp0+RvvzYgnkJrf9lCp+Iu4oNkIJzNFU
   2eC532BTbJAoJPLt5RMM8JLHKjkWbf8XF6J56EqYIhgsISvSA4DwpJVw1
   X2wBKHYM1EVASNEh7/LqpdhFUasgzTNT9ke+dGljVWbN0ZRItTNXDKtKY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="336171325"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="336171325"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 06:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674391698"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="674391698"
Received: from mbouhaou-mobl1.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.252.61.151])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 06:50:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Timur Tabi <timur@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] serial: ucc_uart: Use uart_circ_empty()
Date: Mon, 20 Mar 2023 15:50:08 +0200
Message-Id: <20230320135009.47170-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use uart_circ_empty() rather than open coding it.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/tty/serial/ucc_uart.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 32c7a5b43f8e..e6bd1256a4e7 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -366,15 +366,14 @@ static int qe_uart_tx_pump(struct uart_qe_port *qe_port)
 	/* Pick next descriptor and fill from buffer */
 	bdp = qe_port->tx_cur;
 
-	while (!(ioread16be(&bdp->status) & BD_SC_READY) &&
-	       (xmit->tail != xmit->head)) {
+	while (!(ioread16be(&bdp->status) & BD_SC_READY) && !uart_circ_empty(xmit)) {
 		count = 0;
 		p = qe2cpu_addr(be32_to_cpu(bdp->buf), qe_port);
 		while (count < qe_port->tx_fifosize) {
 			*p++ = xmit->buf[xmit->tail];
 			uart_xmit_advance(port, 1);
 			count++;
-			if (xmit->head == xmit->tail)
+			if (uart_circ_empty(xmit))
 				break;
 		}
 
-- 
2.30.2

