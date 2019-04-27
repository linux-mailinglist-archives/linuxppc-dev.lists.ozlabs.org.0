Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D21B7B39E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:39:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rsTm1NGFzDqQ0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 23:39:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rrZq49VHzDqb5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 22:58:42 +1000 (AEST)
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mspy4-1gVqbT38iO-00tCHb; Sat, 27 Apr 2019 14:52:51 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 21/41] drivers: tty: serial: cpm_uart: fix includes
Date: Sat, 27 Apr 2019 14:52:02 +0200
Message-Id: <1556369542-13247-22-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:xQq23jU9i9rUL2fNQuvkwl6eGPDVSQvpkDbQ/zveful4zboC1HW
 oNd3D0zOYk84zfCJ0Xuzpmh6YQ79oPwoYvw/oeAO14yaLEcslLKcMENViWN+rlXtE9vM1qv
 1jCwWuLOXgdLjw4fxAGT3BB8TcpKk2wNp9jWPWPgaYVVv0WEj/TEQ/U7sklnKXLuZSVuAgG
 ee5Mn3D1VCygJnSepJUyg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G6YjMjuCEzU=:vTbjOK57YMxDpyHJDCsvgf
 g5oSd2GABlrVrg6R3Y2bibtDmrWjuJETHno5Baj4LpBZm6EeK2HYZ1OFvfKTLXiZu+lwgaBdl
 Qac2M4i+nAw5rOrAw2ow775Sclco5rlIvEYaZn9n+JvQdxwhsEMG47EoWyn/ndEiv0D382c1j
 VcxXa0YV2wDanrP23G5UgPydtCBUW3WmBO1JtKXAW7IKnMCVM/8CBvGdxWWlp6xSIZNcnqX50
 +6UMTFNjs6rWE7tAgAHhSt53/vMlfs2segTSR4Ej9genNrs5l5pn68GqZYLFmx/SIha3LVMad
 oeE867ky2ohaZuVLoEeZmShtJ+6kHaB3EJrNUBmO6mfcv6BOFAGaJTrkij+dzySWyEKMrs7/k
 c/ieUXGQb3gWaXyFRkFpeOxRwEYUaB8XGQmecH9NKRVV10m4DvNGPz9Y64pQuKNUiPuYPMRLh
 sRo9hufn0Wdv5bLRF2gxpF7M9j68eBxmtgmobENUwLNFjLCrQhnIxTnO75TVL4S+LzKM+9uNj
 R0lxv0wx2tlf0WYPAwgVEhDMDSZPu62EVjTqJqocmGaCmVfBVbHxH7GUqGTPb5wtk/fsOeMKk
 23J9Zg4qsvkXBMG6i9rDbRv4frJBGt0AfD8OmXdpSmZhpXV7CUFtmWllY5odxIkOhZ9mqOHuI
 HAoX2YlQaOPn+CGIvsgNdrpDxk+3hYt45FHWcJ6fe6fs6nHQSm/mcfSwhd68KN3jKp1Zt81C9
 tPbxzWFyE1TQmFbx1N4B8YhOIYg9ssLx1tizDw==
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixing checkpatch warning:

    WARNING: Use #include <linux/io.h> instead of <asm/io.h>
    #25: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:25:
    +#include <asm/io.h>

    WARNING: Use #include <linux/io.h> instead of <asm/io.h>
    +#include <asm/io.h>

    WARNING: Use #include <linux/delay.h> instead of <asm/delay.h>
    +#include <asm/delay.h>

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/cpm_uart/cpm_uart_core.c | 4 ++--
 drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_core.c b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
index 374b8bb..c831d31 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_core.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_core.c
@@ -33,10 +33,10 @@
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
 #include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/delay.h>
 
-#include <asm/io.h>
 #include <asm/irq.h>
-#include <asm/delay.h>
 #include <asm/fs_pd.h>
 #include <asm/udbg.h>
 
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
index ef1ae08..40cfcf4 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
@@ -21,8 +21,8 @@
 #include <linux/device.h>
 #include <linux/memblock.h>
 #include <linux/dma-mapping.h>
+#include <linux/io.h>
 
-#include <asm/io.h>
 #include <asm/irq.h>
 #include <asm/fs_pd.h>
 #include <asm/prom.h>
-- 
1.9.1

