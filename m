Return-Path: <linuxppc-dev+bounces-16573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAHUEz7fgmnfdgMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16573-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 06:55:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26A1E2238
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 06:55:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5V1k2L5Nz2xJ5;
	Wed, 04 Feb 2026 16:55:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.0.225.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770184506;
	cv=none; b=Q8W3cUclGC/FFw3h/+Um10KJAXkP+4EZMiadmSe28op+5a39FbCsSSzV404BEZPw7R8HBwHgH9Yf3eKqiDbzQtVvn0dsC6aZqr/r2uqEjKXyuiSslNMk1kINK55Ri6b8bTXsp79Ut5vUQdR5Q3XB8pYtaMfgq6WDT4c1yfKEErhkwh13mTeEYXWlb16xgEU/KTmUDKWhvGhcXfC3bZfYAO/kUYBjCip73jmi8u5f9Rw0s0J2OTBd7sm3VtQ19bkLPY0Zm93yxteYkrfifUWm0ulxi2cRU0KlLg451k1mXjPgZEJAYEItFNSTMv7mBT/j28ABaheQQ8P6YCShwLuISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770184506; c=relaxed/relaxed;
	bh=krvWU3RIDCFnaOlsjPiSzDQ5pbtuYU67LBfZYb0ibVA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ohHPdHffJ8oVpfJk5pBcy1ePpB03/R0Osy6BupHX65XmLWiXs9a/GBvKKOJPCwK7h+JFoRvZS4nYsykALmFr1SNXAtvzvjbwLQrqx/tZnrPDvkYDcj014uXqf7AzmltlOXn+dVllcOy3M9YbOJgD0kV8IKQudCmNsybq+E6KAJpCE+F0zo7GYuSU+mFwdWTazIls6vhwQE7xbJgEwVR6Oo/Loz2HFlXnK0ogwW9JRQwlyy/04Dj1RZO+MRMdfTypP2sDhoqOJ0BRR3ktN3t811gBpM4eV1Nuzd29yFdxo+cN1xYUHcwONfLHoVYBFmvR2voJAMf/4WFo7w0QxWZsVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass (client-ip=210.0.225.12; helo=mx1.zhaoxin.com; envelope-from=leoliu-oc@zhaoxin.com; receiver=lists.ozlabs.org) smtp.mailfrom=zhaoxin.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zhaoxin.com (client-ip=210.0.225.12; helo=mx1.zhaoxin.com; envelope-from=leoliu-oc@zhaoxin.com; receiver=lists.ozlabs.org)
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5V1h6sdJz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 16:55:02 +1100 (AEDT)
X-ASG-Debug-ID: 1770184481-086e2306f656ed0001-v7v7hK
Received: from ZXSHMBX3.zhaoxin.com (ZXSHMBX3.zhaoxin.com [10.28.252.165]) by mx1.zhaoxin.com with ESMTP id phGCJUvNjH60FnHe (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Wed, 04 Feb 2026 13:54:41 +0800 (CST)
X-Barracuda-Envelope-From: LeoLiu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from ZXSHMBX1.zhaoxin.com (10.28.252.163) by ZXSHMBX3.zhaoxin.com
 (10.28.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.59; Wed, 4 Feb
 2026 13:54:40 +0800
Received: from ZXSHMBX1.zhaoxin.com ([fe80::936:f2f9:9efa:3c85]) by
 ZXSHMBX1.zhaoxin.com ([fe80::936:f2f9:9efa:3c85%7]) with mapi id
 15.01.2507.059; Wed, 4 Feb 2026 13:54:40 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.165
Received: from HX007EA1.lan (10.32.64.12) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.59; Wed, 4 Feb
 2026 11:55:42 +0800
From: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar
	<mahesh@linux.ibm.com>, Lukas Wunner <lukas@wunner.de>, Przemek Kitszel
	<przemyslaw.kitszel@intel.com>, <leoliu-oc@zhaoxin.com>
CC: Oliver O'Halloran <oohall@gmail.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<CobeChen@zhaoxin.com>, <ErosZhang@zhaoxin.com>, <TonyWWang@zhaoxin.com>
Subject: [PATCH v2] PCI: dpc: Increase pciehp waiting time for DPC recovery
Date: Wed, 4 Feb 2026 11:55:42 +0800
X-ASG-Orig-Subj: [PATCH v2] PCI: dpc: Increase pciehp waiting time for DPC recovery
Message-ID: <20260204035542.53232-1-LeoLiu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.43.0
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.32.64.12]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Moderation-Data: 2/4/2026 1:54:39 PM
X-Barracuda-Connect: ZXSHMBX3.zhaoxin.com[10.28.252.165]
X-Barracuda-Start-Time: 1770184481
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://mx2.zhaoxin.com:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 3433
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.154017
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:mahesh@linux.ibm.com,m:lukas@wunner.de,m:przemyslaw.kitszel@intel.com,m:leoliu-oc@zhaoxin.com,m:oohall@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:CobeChen@zhaoxin.com,m:ErosZhang@zhaoxin.com,m:TonyWWang@zhaoxin.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[zhaoxin.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16573-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[LeoLiu-oc@zhaoxin.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.ozlabs.org,vger.kernel.org,zhaoxin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[LeoLiu-oc@zhaoxin.com,linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,zhaoxin.com:mid,zhaoxin.com:email]
X-Rspamd-Queue-Id: F26A1E2238
X-Rspamd-Action: no action

From: LeoLiu-oc <leoliu-oc@zhaoxin.com>

Commit a97396c6eb13 ("PCI: pciehp: Ignore Link Down/Up caused by DPC")
amended PCIe hotplug to not bring down the slot upon Data Link Layer State
Changed events caused by Downstream Port Containment.

Commit c3be50f7547c ("PCI: pciehp: Ignore Presence Detect Changed caused by
DPC") sought to ignore Presence Detect Changed events occurring as a side
effect of Downstream Port Containment. These commits await recovery from
DPC and then clears events which occurred in the meantime.

However, pciehp_ist() waits up to 4 seconds before assuming that DPC
recovery has failed and disabling the slot. This timeout period is
insufficient for some PCIe devices.

For example, The execution of the ice_pci_err_detected() in the ice network
card driver exceeded the maximum waiting time for DPC recovery, causing the
pciehp_disable_slot() to be executed which is not needed. From the user's
point of view, you will see that the ice network card may not be usable and
could even cause more serious errors, such as a kernel panic. kernel panic
is caused by a race between pciehp_disable_slot() and pcie_do_recovery().
In practice, we would observe that the ice network card is in an
unavailable state and a kernel panic.

Therefore, we need to increase the time that pciehp_ist() waits for the DPC
to recover. For some PCIe devices, the time taken for the error_detected()
to execute may exceed 16 seconds, but the dpc_reset_link() has not yet been
executed. In this situation, the Link Down/Up events and Presence Detect
Changed events that occur during the DPC recovery should also be ignored.

Signed-off-by: LeoLiu-oc <leoliu-oc@zhaoxin.com>

---
v2:
 - Modify and add code comments
 - Add handling for error_detected() execution exceeding 16s

v1: https://lore.kernel.org/all/20260123104034.429060-1-LeoLiu-oc@zhaoxin.c=
om/
---
 drivers/pci/pcie/dpc.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index fc18349614d7..331d0299af6a 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -103,6 +103,7 @@ static bool dpc_completed(struct pci_dev *pdev)
 bool pci_dpc_recovered(struct pci_dev *pdev)
 {
 	struct pci_host_bridge *host;
+	u16 status;
=20
 	if (!pdev->dpc_cap)
 		return false;
@@ -118,10 +119,22 @@ bool pci_dpc_recovered(struct pci_dev *pdev)
 	/*
 	 * Need a timeout in case DPC never completes due to failure of
 	 * dpc_wait_rp_inactive().  The spec doesn't mandate a time limit,
-	 * but reports indicate that DPC completes within 4 seconds.
+	 * but reports indicate that DPC completes within 16 seconds.
 	 */
 	wait_event_timeout(dpc_completed_waitqueue, dpc_completed(pdev),
-			   msecs_to_jiffies(4000));
+			   msecs_to_jiffies(16000));
+
+	/*
+	 * In some cases, the execution time of report_error_detected()
+	 * exceeded 16 seconds, and dpc_reset_link() was still waiting to
+	 * be executed. This situation should be treated as successful dpc
+	 * recovery.
+	 */
+	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_STATUS, &status);
+	if ((!PCI_POSSIBLE_ERROR(status)) && (status & PCI_EXP_DPC_STATUS_TRIGGER=
)) {
+		pci_warn(pdev, "DPC: error_detected() callback timed out\n");
+		return true;
+	}
=20
 	return test_and_clear_bit(PCI_DPC_RECOVERED, &pdev->priv_flags);
 }
--=20
2.43.0


