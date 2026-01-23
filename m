Return-Path: <linuxppc-dev+bounces-16253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qACKBNkPdGmp1wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 01:18:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0AA7BA33
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 01:18:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyb4H4Kwjz2yFh;
	Sat, 24 Jan 2026 11:18:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.0.225.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769166065;
	cv=none; b=dWY7v6BJoVAVNk2ji5wz+WW2UTQEaMy1xsMj0UJg26A05YZuWxIgCHOY2Kq0B1bHsfc47pCCv0Q44sPV35868an9i/Cv0l1yxlogwiFNwxvziapW4mRcLodbnrLp97TJSPUxhTuDexd/PmU4Pglde9WnLzXhVRsFNHX0SX/zFliv9j5NazKg5XkfjED5ADhxh5NYftP3+M7UPFim9e7GVzR1tf2TjdyXGA7s3ICw71m2Cs2DWeVcS34yfb1/b4ZTYXMYv8U7tbRv9cEV+MkUEjo1+HsQkFRRl7WHM1MVZczONiZ5JjG1FeSD89ZA5ED7c3KXCLAsQI+s9nuMpeushA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769166065; c=relaxed/relaxed;
	bh=jzPwbEeeQw2vnJZX7XdQ2MBbz9aV59PxUo9MHT3+/8g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O374TOi81flrXchtGdg8cj5HgrRBhrOmiQHZzZTyZu3aZA4CKUdRc9wDGI93dT8b0ekZIpmPrag582izVDuT7vSAm6U56jZMNtYsV1O0YGqKQ4dP87SBe4yQJOtrEPg4SVJw0y56Z5PncEpEgzZQlVNE2vFzbGjiFA8s5jwcAvmNcuni8NHNw3epSXirqg3xfnDKxr8RfElzeqGmppA7DIvZ+TwxEZUf456FcsEtne5s7lmCBi80iwqBlHFK/yJiLhO25ZAWKo5kHakVJ4iZs1oMxPqOya7n1B/hHBmiloadFzuLp9vCHHIbC2WGYcpodhLY6S4so+RkdqZY3Ri4fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass (client-ip=210.0.225.12; helo=mx1.zhaoxin.com; envelope-from=leoliu-oc@zhaoxin.com; receiver=lists.ozlabs.org) smtp.mailfrom=zhaoxin.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zhaoxin.com (client-ip=210.0.225.12; helo=mx1.zhaoxin.com; envelope-from=leoliu-oc@zhaoxin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1153 seconds by postgrey-1.37 at boromir; Fri, 23 Jan 2026 22:01:04 AEDT
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyFNJ4wpVz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 22:01:02 +1100 (AEDT)
X-ASG-Debug-ID: 1769164884-086e2306f936500002-v7v7hK
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx1.zhaoxin.com with ESMTP id zi7TNQI7lFCBKrup (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 23 Jan 2026 18:41:27 +0800 (CST)
X-Barracuda-Envelope-From: LeoLiu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXSHMBX1.zhaoxin.com (10.28.252.163) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.59; Fri, 23 Jan
 2026 18:41:26 +0800
Received: from ZXSHMBX1.zhaoxin.com ([fe80::936:f2f9:9efa:3c85]) by
 ZXSHMBX1.zhaoxin.com ([fe80::936:f2f9:9efa:3c85%7]) with mapi id
 15.01.2507.059; Fri, 23 Jan 2026 18:41:26 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from HX007EA1.lan (10.32.64.5) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.59; Fri, 23 Jan
 2026 18:40:34 +0800
From: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>
To: <mahesh@linux.ibm.com>, <oohall@gmail.com>, <bhelgaas@google.com>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <CobeChen@zhaoxin.com>, <TonyWWang@zhaoxin.com>, <ErosZhang@zhaoxin.com>
Subject: [PATCH] PCI: dpc: Increase pciehp waiting time for DPC recovery
Date: Fri, 23 Jan 2026 18:40:34 +0800
X-ASG-Orig-Subj: [PATCH] PCI: dpc: Increase pciehp waiting time for DPC recovery
Message-ID: <20260123104034.429060-1-LeoLiu-oc@zhaoxin.com>
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
X-Originating-IP: [10.32.64.5]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Moderation-Data: 1/23/2026 6:41:25 PM
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1769164884
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://mx2.zhaoxin.com:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1355
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.153451
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[zhaoxin.com];
	FORGED_RECIPIENTS(0.00)[m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:CobeChen@zhaoxin.com,m:TonyWWang@zhaoxin.com,m:ErosZhang@zhaoxin.com,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-16253-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.ibm.com,gmail.com,google.com,lists.ozlabs.org,vger.kernel.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[LeoLiu-oc@zhaoxin.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FROM_NEQ_ENVFROM(0.00)[LeoLiu-oc@zhaoxin.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 0E0AA7BA33
X-Rspamd-Action: no action

Commit a97396c6eb13 ("PCI: pciehp: Ignore Link Down/Up caused by DPC")
amended PCIe hotplug to not bring down the slot upon Data Link Layer State
Changed events caused by Downstream Port Containment.

However, PCIe hotplug (pciehp) waits up to 4 seconds before assuming that
DPC recovery has failed and disabling the slot. This timeout period is
insufficient for some PCIe devices.
For example, the E810 dual-port network card driver needs to take over
10 seconds to execute its err_detected() callback.
Since this exceeds the maximum wait time allowed for DPC recovery by the
hotplug IRQ threads, a race condition occurs between the hotplug thread and
the dpc_handler() thread.

Signed-off-by: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>
---
 drivers/pci/pcie/dpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index fc18349614d7..08b5f275699a 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -121,7 +121,7 @@ bool pci_dpc_recovered(struct pci_dev *pdev)
 	 * but reports indicate that DPC completes within 4 seconds.
 	 */
 	wait_event_timeout(dpc_completed_waitqueue, dpc_completed(pdev),
-			   msecs_to_jiffies(4000));
+			   msecs_to_jiffies(16000));
=20
 	return test_and_clear_bit(PCI_DPC_RECOVERED, &pdev->priv_flags);
 }
--=20
2.43.0


