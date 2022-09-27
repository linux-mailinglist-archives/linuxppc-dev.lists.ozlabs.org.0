Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C12125EC812
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:36:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McNyj33bwz3cdR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 01:36:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=VMxLQw+Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=VMxLQw+Y;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McNy80sfHz2yxX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:36:15 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 129so8311833pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ENsxjBVLvcS9Sl/erSmzP+QvgvvXtgtHf/5YnhDAvHI=;
        b=VMxLQw+YzPOn2ZG207xNCd7dLUdSahvAo2cuZvccakSqdgflshCiO1x7gfYWchdJ7V
         MCbKf+oPmAXIPER4u7KiJyyz7pAcid/j6/AlL50WeYv/o2l8dj+CX7bohhgd6tHED0Ww
         VMT71agF2P2Am58mJrlx0azMo4TcSPcfRKByBmJl//FaKLgerEtYxKuFwTXtZHb5FLfl
         yhyajQl/AQ+9ykGvVPVSv+D+3GIKNbUm2Mit6c6d1/fe2Er8ssiIFJRXmnJf2LTqc1jU
         5qdhgsGc7x4OP7dpnBunyb2WPnVW5doGUv3OcRPtdGreBu3hN1KBDzTdqoETRdQhu9/b
         G5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ENsxjBVLvcS9Sl/erSmzP+QvgvvXtgtHf/5YnhDAvHI=;
        b=Um28WkxueTVq0hoR892BwFPxQaOE98Cfc8fUJoq63nN3Q7ekjL8x4fsHnnnvs6g6kS
         paHmecJoRkPquc/xvuKKEhCyluD+RjbObtP5K/loY3HSHIWzr3HQ7q9N5rzy2nlAZ1Q6
         CNR2/C7N5PoHq0VVpoPdEG6wHKEDj8K/e5L3edunep/w1dlWqeLtcebZOMV56GwiKgBI
         PaA2FN39K7eNbkTo/4421MIM3QKfk9KfOuuc/iwEAEkWbmKk97bEryL8zV5aDkmag5gl
         sYXNByvO23gf81urbKT4eMceLclwEoep4qtX8j582bkEUAZlqtJPxWGSn1/laIkHDbJB
         vHJQ==
X-Gm-Message-State: ACrzQf2RvzGEW0QF9egiQnB4HX6MtOcFdenbHK91t5fHuH4vWgNdZ4Al
	OzN2oo3lFEqyQd85n55UG2xP3A==
X-Google-Smtp-Source: AMsMyM4AesfztARYj7VKlI8kwy86tANKtLJm/3jYH/7q0idxBuYkgELKcxtj7x5R4ivUtTFXDoPKoA==
X-Received: by 2002:a05:6a02:205:b0:41b:96dc:bb2a with SMTP id bh5-20020a056a02020500b0041b96dcbb2amr25106581pgb.116.1664292971298;
        Tue, 27 Sep 2022 08:36:11 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id w16-20020aa79a10000000b0053639773ad8sm1933087pfj.119.2022.09.27.08.36.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Sep 2022 08:36:10 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com,
	fancer.lancer@gmail.com,
	jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	james.smart@broadcom.com,
	dick.kennedy@broadcom.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Subject: [PATCH v2 0/9] PCI/AER: Fix and optimize usage of status clearing api
Date: Tue, 27 Sep 2022 23:35:15 +0800
Message-Id: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
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

Hello.

Here comes patch v2, which contains some fixes and optimizations of
aer api usage. The original version can be found on the mailing list.

Changes since v1:
- Modifications to comments proposed by Bjorn. Split patch into more
  obvious parts.

Zhuo Chen (9):
  PCI/AER: Add pci_aer_clear_uncorrect_error_status() to PCI core
  PCI/DPC: Use pci_aer_clear_uncorrect_error_status() to clear
    uncorrectable error status
  NTB: Change to use pci_aer_clear_uncorrect_error_status()
  scsi: lpfc: Change to use pci_aer_clear_uncorrect_error_status()
  PCI/AER: Unexport pci_aer_clear_nonfatal_status()
  PCI/AER: Move check inside pcie_clear_device_status().
  PCI/AER: Use pcie_aer_is_native() to judge whether OS owns AER
  PCI/ERR: Clear fatal status when pci_channel_io_frozen
  PCI/AER: Refine status clearing process with api

 drivers/ntb/hw/idt/ntb_hw_idt.c |  4 +--
 drivers/pci/pci.c               |  7 +++--
 drivers/pci/pci.h               |  2 ++
 drivers/pci/pcie/aer.c          | 45 +++++++++++++++++++--------------
 drivers/pci/pcie/dpc.c          |  3 +--
 drivers/pci/pcie/err.c          | 15 ++++-------
 drivers/pci/pcie/portdrv_core.c |  3 +--
 drivers/scsi/lpfc/lpfc_attr.c   |  4 +--
 include/linux/aer.h             |  4 +--
 9 files changed, 46 insertions(+), 41 deletions(-)

-- 
2.30.1 (Apple Git-130)

