Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7755EDAD6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:00:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MctnY36yxz3c5B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:00:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=SJyC2mJG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=SJyC2mJG;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mctn128xgz2xGg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:00:03 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id w10so11455512pll.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 04:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fo4HmuLb/yqh2kDNnoKinrIdDSvba5fowzMna9C2QUg=;
        b=SJyC2mJGff3oqgJGbJ2CIG5odbv/+k+1zDOycX2oUS4T2LLeoqU3dGE1ZjN4uoa9Nl
         L1NfMbijmpRASuYUSNvspDxj8CM+rmq+/DcgF1yNslYBahnv7Jb+1k0YpGpi6O/VoXyp
         GCrRgidVi8vWTLkSPgT8qrawa1Xty5l7bByP6CdG/DOYYe0SpUcqP9wk9r9hQ/Ioqxav
         LHNhhGOS8rnJwxzopvjmpsVw3e+VTF33QopJR0QRACOzuMj/kpD0CM6KmvStlb4Og72e
         DEiv3fFrzOIVDxsWfTKuL64jyIYcqAOGQi6b6EG9tMIphMP2u9SnfieVTmst7pefV5rv
         zROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fo4HmuLb/yqh2kDNnoKinrIdDSvba5fowzMna9C2QUg=;
        b=fas2wPYNh0ny3V0Nqs54tUV081gk7VO3uZGgYQiiNlxEY7GJQMj5/VwtqTJ4iPbmXB
         BL5nKrAQEduCuSqlQVT3/BlL1PA38fdoZj1F2mm8cg/1XEEBWz9LsFAEvi58bXfnzdrh
         G/H65JyPFeLTxAf/jkKQzOtM2zc3wKobOQzXJoBx7XOKoSKxhjfdbz/oRx6M5D2gDqdu
         q/p4we0CthHvRN62UmytRX/06dUWCbQG1gcM/aa3ySj8GQhDRk78pT3qfdfy3cJvC0Wb
         Q7hkMuAGBAyZ4LNDBm55MjLkiwLeUc4pgtFSVIN9Qm9o+N6N1WUUxiWpt3r08mqexnoF
         t+ag==
X-Gm-Message-State: ACrzQf3cuu+zPrcFG85mkNfz4Jfdby1DXoTQuLHXT0Ejcxe8K/l0dAa8
	0UruR4zzLWKYzF2lNsPw4T1XtA==
X-Google-Smtp-Source: AMsMyM6I8LxP5weTVzsQIxACRMckvsr0iobx2qFTGVa4rjJZfzUFY8aCAwEoIseeeiNOKAkMUe7yDQ==
X-Received: by 2002:a17:90b:38c3:b0:205:d6b5:582d with SMTP id nn3-20020a17090b38c300b00205d6b5582dmr9053345pjb.229.1664362798761;
        Wed, 28 Sep 2022 03:59:58 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902d50d00b00177efb56475sm1539524plg.85.2022.09.28.03.59.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 03:59:58 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: sathyanarayanan.kuppuswamy@linux.intel.com,
	bhelgaas@google.com,
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
Subject: [PATCH v3 0/9] PCI/AER: Fix and optimize usage of status clearing api
Date: Wed, 28 Sep 2022 18:59:37 +0800
Message-Id: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
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

Here comes patch v3, which contains some fixes and optimizations of
aer api usage. The v1 and v2 can be found on the mailing list.

v3:
- Modifications to comments proposed by Sathyanarayanan. Remove
  pci_aer_clear_nonfatal_status() call in NTB and improve commit log. 

v2:
- Modifications to comments proposed by Bjorn. Split patch into more
  obvious parts.

Zhuo Chen (9):
  PCI/AER: Add pci_aer_clear_uncorrect_error_status() to PCI core
  PCI/DPC: Use pci_aer_clear_uncorrect_error_status() to clear
    uncorrectable error status
  NTB: Remove pci_aer_clear_nonfatal_status() call
  scsi: lpfc: Change to use pci_aer_clear_uncorrect_error_status()
  PCI/AER: Unexport pci_aer_clear_nonfatal_status()
  PCI/AER: Move check inside pcie_clear_device_status().
  PCI/AER: Use pcie_aer_is_native() to judge whether OS owns AER
  PCI/ERR: Clear fatal error status when pci_channel_io_frozen
  PCI/AER: Refine status clearing process with api

 drivers/ntb/hw/idt/ntb_hw_idt.c |  2 --
 drivers/pci/pci.c               |  7 +++--
 drivers/pci/pci.h               |  2 ++
 drivers/pci/pcie/aer.c          | 45 +++++++++++++++++++--------------
 drivers/pci/pcie/dpc.c          |  3 +--
 drivers/pci/pcie/err.c          | 15 ++++-------
 drivers/pci/pcie/portdrv_core.c |  3 +--
 drivers/scsi/lpfc/lpfc_attr.c   |  4 +--
 include/linux/aer.h             |  4 +--
 9 files changed, 44 insertions(+), 41 deletions(-)

-- 
2.30.1 (Apple Git-130)

