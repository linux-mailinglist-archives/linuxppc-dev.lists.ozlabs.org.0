Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D736288D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 20:02:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9zG602B3z3f6V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 06:02:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OCy/Y1e8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OCy/Y1e8;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9z9303dYz3057
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 05:58:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668452295; x=1699988295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BZMLhTwKqFLidxOVtwWq081cCaNo7ow4HF5ovB57GGE=;
  b=OCy/Y1e8/70wK3jLv5seA+VKKVJjCkd526VzyaLdC8vRkZprVOnbJF3+
   9a2aNAp6vS5wJkqT6FEW5QsN94H2wunnqkYvLd+7XIl3VfkXO5HsqqjY+
   z9Q3/56QgAaFN+V0uTo2TBPtD+u62eQSrWtbOYMiGyGyHQpZs/MwDf3Cv
   XmSnvsck/pw859ErYBXZExsZZ9mQckbp/e1Mx8767n7SuP1BOw25qz/V6
   8OUuhKckTNpW+OmHiW9tHlK+IfVHpWP+SlyUz0Uzw/lE9TKIIlu9bfE/8
   seEwnaqoqnmhvOGUZDtdIP+JqHHXfELbYBoA5XGP+OnkrXAtXxWSAuMkH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="398343515"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="398343515"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 10:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="638607286"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="638607286"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 14 Nov 2022 10:58:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EECC2348; Mon, 14 Nov 2022 20:58:24 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 4/4] pcmcia: Convert to use pci_bus_for_each_resource_p()
Date: Mon, 14 Nov 2022 20:58:22 +0200
Message-Id: <20221114185822.65038-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
References: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Miguel Ojeda <ojeda@kernel.org>, Matt Turner <mattst88@gmail.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pci_bus_for_each_resource_p() hides the iterator loop since
it may be not used otherwise. With this, we may drop that iterator
variable definition.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 drivers/pcmcia/rsrc_nonstatic.c | 9 +++------
 drivers/pcmcia/yenta_socket.c   | 3 +--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
index ad1141fddb4c..9d92d4bb6239 100644
--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -934,7 +934,7 @@ static int adjust_io(struct pcmcia_socket *s, unsigned int action, unsigned long
 static int nonstatic_autoadd_resources(struct pcmcia_socket *s)
 {
 	struct resource *res;
-	int i, done = 0;
+	int done = 0;
 
 	if (!s->cb_dev || !s->cb_dev->bus)
 		return -ENODEV;
@@ -960,12 +960,9 @@ static int nonstatic_autoadd_resources(struct pcmcia_socket *s)
 	 */
 	if (s->cb_dev->bus->number == 0)
 		return -EINVAL;
-
-	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
-		res = s->cb_dev->bus->resource[i];
-#else
-	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
 #endif
+
+	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
 		if (!res)
 			continue;
 
diff --git a/drivers/pcmcia/yenta_socket.c b/drivers/pcmcia/yenta_socket.c
index 3966a6ceb1ac..b200f2b99a7a 100644
--- a/drivers/pcmcia/yenta_socket.c
+++ b/drivers/pcmcia/yenta_socket.c
@@ -673,9 +673,8 @@ static int yenta_search_res(struct yenta_socket *socket, struct resource *res,
 			    u32 min)
 {
 	struct resource *root;
-	int i;
 
-	pci_bus_for_each_resource(socket->dev->bus, root, i) {
+	pci_bus_for_each_resource_p(socket->dev->bus, root) {
 		if (!root)
 			continue;
 
-- 
2.35.1

