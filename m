Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A096420C0C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 15:00:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNLRd71JHz3036
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:00:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNLR71XWlz2xtF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 00:00:01 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mXNZN-0005K3-Lr; Mon, 04 Oct 2021 14:59:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mXNZN-0000MV-3l; Mon, 04 Oct 2021 14:59:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mXNZF-0000ci-Qr; Mon, 04 Oct 2021 14:59:41 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v6 05/11] powerpc/eeh: Don't use driver member of struct
 pci_dev and further cleanups
Date: Mon,  4 Oct 2021 14:59:29 +0200
Message-Id: <20211004125935.2300113-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004125935.2300113-1-u.kleine-koenig@pengutronix.de>
References: <20211004125935.2300113-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=Zpj0MfNpdqb/t0RctaGob3+oRuWP4Yx6JOoywu4XRsI=;
 m=qLVHAb7UOiGrqQuPN/p5loiFStoGSa1I5N8zuOAmNU8=;
 p=0U5IO+Yv/dUfU3ayUE/9KpmDUjFv5zoIY+LRFqJ9Pw0=;
 g=70976583fe04d220fe4cb7c498cea58f830f1545
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFa+pMACgkQwfwUeK3K7An2DQf7BwJ
 +5mTDkIUqy7dufqTCmfUL/PuOO3mdLaN1UMkgI+kPHMqsXVfWtUV44UIB4C931RElHQkQMHbdzind
 MaO/mCm0chUWdShL8e7yyolxTjG9jIOFeJ8djp7717jyeRduuYev+tzQHfZtVlzf+gZ0fUhDceib9
 zbLjwW63K/k14aNwXGpoaQjI8l98vZkZJdvXd8thLuKZt3md1tCPZmB47YRaA/kALD/jXtqmM2geN
 dp6ooS4aElGr+AodCUYLzzzx+Agh0Zj5+KJ21gckCg7UtotQIwH78aOEpP/C1QIVQUXpwxBWhNHZm
 Whg67TxzuSne0ilvaKGdceDZvjcEUhg==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: linux-pci@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 kernel@pengutronix.de, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The driver member of struct pci_dev is to be removed as it tracks
information already present by tracking of the driver core. So replace
pdev->driver->name by dev_driver_string() for the corresponding struct
device.

Also move the function nearer to its only user and instead of the ?:
operator use a normal if which is more readable.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/powerpc/include/asm/ppc-pci.h | 5 -----
 arch/powerpc/kernel/eeh.c          | 8 ++++++++
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
index 2b9edbf6e929..f6cf0159024e 100644
--- a/arch/powerpc/include/asm/ppc-pci.h
+++ b/arch/powerpc/include/asm/ppc-pci.h
@@ -55,11 +55,6 @@ void eeh_pe_dev_mode_mark(struct eeh_pe *pe, int mode);
 void eeh_sysfs_add_device(struct pci_dev *pdev);
 void eeh_sysfs_remove_device(struct pci_dev *pdev);
 
-static inline const char *eeh_driver_name(struct pci_dev *pdev)
-{
-	return (pdev && pdev->driver) ? pdev->driver->name : "<null>";
-}
-
 #endif /* CONFIG_EEH */
 
 #define PCI_BUSNO(bdfn) ((bdfn >> 8) & 0xff)
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index e9b597ed423c..4b08881c4a1e 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -399,6 +399,14 @@ static int eeh_phb_check_failure(struct eeh_pe *pe)
 	return ret;
 }
 
+static inline const char *eeh_driver_name(struct pci_dev *pdev)
+{
+	if (pdev)
+		return dev_driver_string(&pdev->dev);
+
+	return "<null>";
+}
+
 /**
  * eeh_dev_check_failure - Check if all 1's data is due to EEH slot freeze
  * @edev: eeh device
-- 
2.30.2

