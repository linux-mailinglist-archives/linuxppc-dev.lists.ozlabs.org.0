Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B410C5A9ED1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 20:18:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJTnk5DvZz2xfS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 04:18:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=lbGN4Kp3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=lbGN4Kp3;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJTmh32Kwz30Lb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 04:17:56 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id y127so18252843pfy.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 11:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zI/BTKFXJXbsFO1kxQzveFTmwvhlHGn8PgFA+S1jres=;
        b=lbGN4Kp3lRbdgZAgZthVUQrgacQyY9T1ORf4+IRNyEdsR08hfaasoXVs5DtXtNjkTt
         wTxeqEsp7RBY+UWH7L93OCDfVRg9a1qSh9cBwhtS4I6Er4mCMCBHZU5JSui19cnXXiig
         44oPiVPAXmom3N3thvuWvMaOvOfbAWjPKiQSDzINje0Iw3JqQRthMh0s8MIbff5OnpvO
         N9tS9ZKZ0SL5YyBB3QM4IjwgO1zAcad5VDu0Kunmmzc158kOPOqoqYiZnKQaU3pCner0
         QYRlE7l5InBZMbljno6S49tduW45wREpYyIuNPHbDZ1EkbLBhOg8Xve56z8sFCfzHqVq
         iV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zI/BTKFXJXbsFO1kxQzveFTmwvhlHGn8PgFA+S1jres=;
        b=J6gukzI8FgRA6YdQN4IcKW8tKbqIR24IzCt3dM9Yxt3PgviEAUSZZwE8uBWvWm+WV8
         NE01EyZQiBM41XiLO2k6F2XGk7thTN46iPQ07YTgMsoGsCx3y8TcMZVTX0MDantOSc55
         +owjvnY+ZB7/CnTI1xx3AJWHxA9gH1mQsghID0niDGg21Ddm6kurqWQr9KT9yCIXEyFW
         PCYaLdZpbow/IcGNFqZ006r6wk40PYw/aYGe4yGl0YQyWLxahBnM6Ad3tnAmyTSgKEka
         jpAEA1mjIQjR7HvRkRgeGqT8B+2oP2bcVTOSLYfgy5K51WLtHKEAovj266KpWXZD9SBs
         MgFQ==
X-Gm-Message-State: ACgBeo3HEq/cFe88T3IMhhDmtRnyJNxCmol6XuumdUn7ZA0V7SZeS4rh
	gUbzDB6mD5iZZCX2kNHiIhaqfw==
X-Google-Smtp-Source: AA6agR7kM8iGzccwGQ6iMySe4S2grbdHOsy/itfUuKWXsnekyj0x05dNeHnyQVuTcw2HeZHUxsgADQ==
X-Received: by 2002:a05:6a00:88a:b0:53a:b7a0:ea3a with SMTP id q10-20020a056a00088a00b0053ab7a0ea3amr9698501pfj.21.1662056274006;
        Thu, 01 Sep 2022 11:17:54 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170903228d00b0017519b86996sm6320538plh.218.2022.09.01.11.17.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Sep 2022 11:17:53 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: fancer.lancer@gmail.com,
	jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com,
	james.smart@broadcom.com,
	dick.kennedy@broadcom.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Subject: [PATCH 2/3] PCI/ERR: Clear fatal status in pcie_do_recovery()
Date: Fri,  2 Sep 2022 02:16:33 +0800
Message-Id: <20220901181634.99591-3-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20220901181634.99591-1-chenzhuo.1@bytedance.com>
References: <20220901181634.99591-1-chenzhuo.1@bytedance.com>
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
Cc: linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org, chenzhuo.1@bytedance.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When state is pci_channel_io_frozen in pcie_do_recovery(),
the severity is fatal and fatal status should be cleared.
So we add pci_aer_clear_fatal_status().

Since pcie_aer_is_native() in pci_aer_clear_fatal_status()
and pci_aer_clear_nonfatal_status() contains the function of
'if (host->native_aer || pcie_ports_native)', so we move them
out of it.

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/pci/pcie/err.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 0c5a143025af..e0a8ade4c3fe 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -243,10 +243,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	 * it is responsible for clearing this status.  In that case, the
 	 * signaling device may not even be visible to the OS.
 	 */
-	if (host->native_aer || pcie_ports_native) {
+	if (host->native_aer || pcie_ports_native)
 		pcie_clear_device_status(dev);
+
+	if (state == pci_channel_io_frozen)
+		pci_aer_clear_fatal_status(dev);
+	else
 		pci_aer_clear_nonfatal_status(dev);
-	}
+
 	pci_info(bridge, "device recovery successful\n");
 	return status;
 
-- 
2.30.1 (Apple Git-130)

