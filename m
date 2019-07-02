Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CF25C8C7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 07:29:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCTS4b69zDqND
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:29:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="ioFuKzOg"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCHH4XfBzDq62
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:20:11 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id j2so7656877pfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mCkd72MD7RytSXHmQTG+BJmdV+ujuMt041RZ+wphY4U=;
 b=ioFuKzOgaVjoTIhAoYS6/aGh1BN++JfYYIy0iANwC1pFnO/dTfdRd31WhsRFOG4CJN
 ySN5ZaFPQG8CClw61nMuSTzoh1FUAUaaeaNTF4ulNfmz9BGhtaiXZ7m26Ktw7/PcgUDP
 IwJUJHyROmyTVeFCpr+/4edeM0YYYA9EXaAU0XVgbSFwQWDIz722TdbObdb/+GMpwBIz
 DmLoySUi9hYqCJxZtFgAnoAonjT8wu05tAXoup85pJ/oKtiIXk+MUnWlVAwSWoqlufKd
 Z/Pp5lRlzywHSqg4ULf+AVlBrjMWuGAnD7cl7HIJfVkeJ9L8lv0QBfPSZd5ly27utkph
 ZtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mCkd72MD7RytSXHmQTG+BJmdV+ujuMt041RZ+wphY4U=;
 b=aZ/V2e19i1Vl69wDtrmr0US7MrdV5soXvkEFGmwwK5z8Nv1qRwQmbgnxauMp67rRq8
 Ps9DhOJU5bIo2mYSnK+kZToNbDrGpsGQcbRfTvmgVPtZwAVveu2ZOpvSqWpi186Bdhz8
 cjtmRExJbA1iniiI5epyeo0Z7SSsB50jO6fIdhNy+FvXKTk314G48BhEbTyLP4GQ3BFC
 YFG5Rrk7hkeTlJ2dcR8lBJfQhrBPL4/7gxuY+GT/OlLgFJKWlCkozBYxRS52SUweT080
 HGkpYwSUknWa9bIihwn1hD74WO7Ms4JXf2mG8CKCiHdmeLGO2y+Y0Y0qJTDNexTBbqtj
 583g==
X-Gm-Message-State: APjAAAVtfwmEVqvEkXFsQRXqxqdAtnHMb7DMazF83EsLW5n6y+Iye2tN
 2gZ5roMReos9NDZOMFQQTtcsbwi+CTc9WQ==
X-Google-Smtp-Source: APXvYqzjRFZR4nlLY9fbLiLnsoq3Z/EGF8m38NURTQD9IKHvziQR502z0muCydGSfqHyPxMgsEb3DA==
X-Received: by 2002:a63:224a:: with SMTP id t10mr28515088pgm.289.1562044809104; 
 Mon, 01 Jul 2019 22:20:09 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.67])
 by smtp.gmail.com with ESMTPSA id t9sm1106898pji.18.2019.07.01.22.20.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:20:08 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v2 08/12] powerpc/mce: Handle memcpy_mcsafe()
Date: Tue,  2 Jul 2019 10:49:28 +0530
Message-Id: <20190702051932.511-9-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702051932.511-1-santosh@fossix.org>
References: <20190702051932.511-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Reza Arbab <arbab@linux.ibm.com>

Add an mce notifier intended to service memcpy_mcsafe().

The notifier uses this heuristic; if a UE occurs when accessing device
memory, and the faulting instruction had a fixup entry, the callback
will return NOTIFY_STOP.

This causes the notification mechanism to consider the MCE handled and
continue execution at the fixup address, which returns -EFAULT from the
memcpy_mcsafe() call.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/kernel/mce.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 0233c0ee45ab..a8348a9bea5b 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -56,6 +56,40 @@ int mce_unregister_notifier(struct notifier_block *nb)
 	return blocking_notifier_chain_unregister(&mce_notifier_list, nb);
 }
 
+static int check_memcpy_mcsafe(struct notifier_block *nb, unsigned long val,
+			       void *data)
+{
+	struct machine_check_event *evt = data;
+	unsigned long pfn;
+	struct page *page;
+
+	if (evt->error_type != MCE_ERROR_TYPE_UE ||
+	    !evt->u.ue_error.physical_address_provided)
+		return NOTIFY_DONE;
+
+	pfn = evt->u.ue_error.physical_address >> PAGE_SHIFT;
+	page = pfn_to_page(pfn);
+	if (!page)
+		return NOTIFY_DONE;
+
+	/* HMM and PMEM */
+	if (is_zone_device_page(page) && evt->u.ue_error.fixup_address_provided)
+		return NOTIFY_STOP;
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block memcpy_mcsafe_nb = {
+	.notifier_call = check_memcpy_mcsafe
+};
+
+static int __init mce_mcsafe_register(void)
+{
+	mce_register_notifier(&memcpy_mcsafe_nb);
+	return 0;
+}
+arch_initcall(mce_mcsafe_register);
+
 static void mce_set_error_info(struct machine_check_event *mce,
 			       struct mce_error_info *mce_err)
 {
-- 
2.20.1

