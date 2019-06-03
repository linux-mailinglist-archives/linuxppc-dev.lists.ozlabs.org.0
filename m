Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F21133B11
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 00:22:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HqKl6fKLzDqQg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 08:22:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rHbA+7oj"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HqJX6z1BzDqNn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 08:21:00 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id f20so28970734edt.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 15:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6SwsUdnmJqsKjqmMv1ig0nFgLQISlIZ4mL0Bgh3d+ww=;
 b=rHbA+7ojNx2L8Y/O1X17tjfQ/ccJkMcflnR9LyPSByMs/+CaDM7588Ir9t9RCF6Tin
 lNZZwQ9Gf0eaxcIBJmjzcKt2W/7xPDdtLNk3lqUkdPFDIqLQfWYVNK1FRCS6m8izMj8o
 CR8zKd+dzcYJmoPDewqMUtr0ZbSeKyM9zcbLqCVtcX+d99RD0IWoF/R+GdWe40Jb+ghp
 5EOciicMprv68Ht7k4mZyACACMbu85DqHslBZ5G3Oo68aNWaOSqAEOq69+ZZj5//eY+r
 LpdPgsxdma7p37jEdVF6X/XXb3au94zh2bUhNBDUHRdrMUmk0e4c3GsyikXDu4Bjt3eQ
 PDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6SwsUdnmJqsKjqmMv1ig0nFgLQISlIZ4mL0Bgh3d+ww=;
 b=aqW9XviDR/VaOsimUw8txT/KMGHH/1lmbt1bwg3smkIBEjEyJC1YxV8gr85NKAP3Cm
 Vyd/X5WTJbeVnAwB6X/7ksF9NS3Flpvjs+4/E+B58O2alP9o1OmtVKLgwjIcdPAIfyv4
 MLKCO2+8OJcRrpO2EzXmpu2mdRYcWYhWS8MnbYnDdHsnMMKok8IIc4GAXjo0VA1kpRSS
 4S93lv6X71jrz3uelbhUbZJkrDsSXCvJIKia5jyeXKb966RGolMJU/AqlGh1Nh8t+rPm
 5IZRDKUYtNg6JSJbLb0T8DjhzMN1IWmc5HO9IQwQ9J6C9RDIA/94ZSGptWyxNvB7Ntfe
 b4mQ==
X-Gm-Message-State: APjAAAX8xm5ADrMFQZ+5abSOAxPjf7Xe+OTgAY+zVpTXMY0QRHWBi6d5
 pOgXk+uYb03oKU11ioOrVv0=
X-Google-Smtp-Source: APXvYqzntAHVC76B3HN+FQleN5MXwP0M+Bge4licIbThASXbaFHS9A4UtGAue+zV3RciZP5zzKQGDw==
X-Received: by 2002:a50:a4f7:: with SMTP id x52mr31464852edb.86.1559600457550; 
 Mon, 03 Jun 2019 15:20:57 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id j9sm1515579ejm.68.2019.06.03.15.20.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 15:20:56 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2] scsi: ibmvscsi: Don't use rc uninitialized in
 ibmvscsi_do_work
Date: Mon,  3 Jun 2019 15:19:42 -0700
Message-Id: <20190603221941.65432-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0.rc3
In-Reply-To: <20190531185306.41290-1-natechancellor@gmail.com>
References: <20190531185306.41290-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

clang warns:

drivers/scsi/ibmvscsi/ibmvscsi.c:2126:7: warning: variable 'rc' is used
uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
        case IBMVSCSI_HOST_ACTION_NONE:
             ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/scsi/ibmvscsi/ibmvscsi.c:2151:6: note: uninitialized use occurs
here
        if (rc) {
            ^~

Initialize rc to zero in the case statements that clang mentions so that
the atomic_set and dev_err statement don't trigger for them.

Fixes: 035a3c4046b5 ("scsi: ibmvscsi: redo driver work thread to use enum action states")
Link: https://github.com/ClangBuiltLinux/linux/issues/502
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Initialize rc in the case statements, rather than at the top of the
  function, as suggested by Michael.

 drivers/scsi/ibmvscsi/ibmvscsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 65053daef5f7..3b5647d622d9 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -2109,9 +2109,6 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
 
 	spin_lock_irqsave(hostdata->host->host_lock, flags);
 	switch (hostdata->action) {
-	case IBMVSCSI_HOST_ACTION_NONE:
-	case IBMVSCSI_HOST_ACTION_UNBLOCK:
-		break;
 	case IBMVSCSI_HOST_ACTION_RESET:
 		spin_unlock_irqrestore(hostdata->host->host_lock, flags);
 		rc = ibmvscsi_reset_crq_queue(&hostdata->queue, hostdata);
@@ -2128,7 +2125,10 @@ static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
 		if (!rc)
 			rc = ibmvscsi_send_crq(hostdata, 0xC001000000000000LL, 0);
 		break;
+	case IBMVSCSI_HOST_ACTION_NONE:
+	case IBMVSCSI_HOST_ACTION_UNBLOCK:
 	default:
+		rc = 0;
 		break;
 	}
 
-- 
2.22.0.rc3

