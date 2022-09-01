Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 231345A9ECC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 20:17:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJTmF5Czdz2yxZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 04:17:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=HrJjbOMA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=HrJjbOMA;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJTlZ6x86z2xGK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 04:16:57 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id v5so11602111plo.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 11:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=UHJ+wNg6rHSLjNi/6t6DVtAkUVcspchblfn/eFkKqsw=;
        b=HrJjbOMAscprcYO5PohMvHxByNRc1LKXTo6sQZuSzgC2XApf6bfM9LFErgYqRzoCgj
         dxDAMu9X4lyR7NRhOF5reb+70GOQgQhspYNlzgiePz3BU2vBiOTc/wCgQOTBX1nvY3rl
         gRAOXKbMZo6iWwdxi5XCFMyWAK0sm8241MmfzJSwrIHCME8q/lKFVw54cv+mMAQPeY+I
         CceuLNc7YMKHS9J6H0rqi3cuooZ6w2KLQeRcyB+ueRMsAHpJMRLidojb13a8cxBWurte
         4EKxdLd+1K5ihRfvnqll1rCH5Gk6uP70mqHUGIq9SNVjwOl+S/rBWIvlyRybEnmgp4Fk
         MA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=UHJ+wNg6rHSLjNi/6t6DVtAkUVcspchblfn/eFkKqsw=;
        b=zqG207H4cEuhZ2dyDxMoztfw85gC32+y3qjZQO/xTXBBuvt9/FztmAbCOIVKC4iEiE
         DEmC8a/tf4MoHZFBGvBBm64z/RRKLNiWgKowHzvTVkDsL0pdsdfD7Dc3r07O+6JPgcFx
         +LY7BVr5z23MqOP19H9LpdyANPncEds2x2lVXcolSJJjvBUMZnthZEnHs4BJxbzaHyL9
         58H+KZNRjbYg3MavvbPMf0HLX3Aq1rP1/II9Cz9CgE9UA9/MsDpaJO3c7sQgy6reSF6n
         AL94jfPoPO8yV2W4dOHuD9T69u64+gYMAyz/jEtAbw9PvpIfmhx9LXJeHoHiiAc+yXmu
         BJYQ==
X-Gm-Message-State: ACgBeo2XFgbIIEbIKjb7hyelOGYR/zVmsagkMU2ayR6aqcDj7oniyKVl
	q9fgZSnWUU94FMyNmJpG5C/RSw==
X-Google-Smtp-Source: AA6agR6b8r7oRaI6ROi7pyqAyUtxNINQwKB8079M56A+1+FEt2RYm/zemPHbg56SBzgLUP1mE90YiA==
X-Received: by 2002:a17:903:22c7:b0:175:3682:9cf5 with SMTP id y7-20020a17090322c700b0017536829cf5mr11191184plg.150.1662056214062;
        Thu, 01 Sep 2022 11:16:54 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170903228d00b0017519b86996sm6320538plh.218.2022.09.01.11.16.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Sep 2022 11:16:53 -0700 (PDT)
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
Subject: [PATCH 0/3] PCI/AER: Fix and optimize usage of status clear api
Date: Fri,  2 Sep 2022 02:16:31 +0800
Message-Id: <20220901181634.99591-1-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
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

Hello,

This series contains some fixes and optimizations of aer api usage.
We add some process to clear uncorrectable error status, then add
distinction between fatal and nonfatal situations in pcie_do_recovery()
and reduce some redundant code. The series involves pci driver and
vendor driver.

Thanks,
Zhuo Chen

Zhuo Chen (3):
  PCI/AER: Use pci_aer_clear_uncorrect_error_status() to clear
    uncorrectable error status
  PCI/ERR: Clear fatal status in pcie_do_recovery()
  PCI/AER: Use pci_aer_raw_clear_status() to clear root port's AER error
    status

 drivers/ntb/hw/idt/ntb_hw_idt.c |  4 ++--
 drivers/pci/pci.h               |  2 ++
 drivers/pci/pcie/aer.c          | 30 +++++++++++++++++++-----------
 drivers/pci/pcie/dpc.c          |  3 +--
 drivers/pci/pcie/err.c          |  8 ++++++--
 drivers/scsi/lpfc/lpfc_attr.c   |  4 ++--
 include/linux/aer.h             |  4 ++--
 7 files changed, 34 insertions(+), 21 deletions(-)

-- 
2.30.1 (Apple Git-130)

