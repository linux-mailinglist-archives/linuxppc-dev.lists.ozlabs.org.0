Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D9E4219D8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:18:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNZqX2xdkz3cD5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:18:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HD1FAaEt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HD1FAaEt; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNMcg09sWz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 00:53:20 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id y1so11132629plk.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 06:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QehrCbnowDf1RKEEztwsvEnHuiWWf1+by9ueLaqBt5I=;
 b=HD1FAaEtufc7ayGdPFagvKFo4lY+o6I6/nQOa+nVkJHZWF4gn1Zd86f56QDiJmRERT
 cJ7/qKo40ISZ9l6pLFbm7BG+GvlqxekUCZucWtRLoGIZL0sAmMTGgGxEbo+89QGomMqk
 F06R/fZFslZqdzjDhsuFd6DM9UJxmwRmegojJHXlFwjzshrhgKufUcrnmWtk8oQOyKyV
 48P036+d1eYmnHMqEMXCm084uNEGSg9txbxUXWiU69JjBsacmUsrPGih+ky85b/2QB3r
 lLSD1qhYF77rBR/NWuUVA4marCG9VaWVfBOoI9Rnw4dd1xAyB9uJHKQU04cUUSzm0j6p
 Zhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QehrCbnowDf1RKEEztwsvEnHuiWWf1+by9ueLaqBt5I=;
 b=KkI/VjIkHWY/WThZw2IPuNNGXaVX32nzFdcnF56OVi1h3DEeP80Tnx+2/qWp7vSZAd
 NZSJNsaI/QrT3GmfskXgJNQemyWAOYjRRZx7GcOFF2kKXq0vDelgkigS1oelEgasOiWH
 gzn8iT2hoBIUqbCLbTZCaO3FNo6A0cZtYczQAZ4ZtbZtKlppSSRlhMQHOGy46JCGOWfn
 dJ5EA7u3Q9xMvUU/v65ClNyGYbO+vXWYU9pkFfO0L6nQ6hCq21EZnbKWkZWN/66JqvTu
 BuR/XsfmC8krgpqpLOtYn1b6cC3SV5DHQddJWRSuJUyKqA2apRt/ljacqWFzNrsdbXR7
 QayQ==
X-Gm-Message-State: AOAM532og62c6S3eSi80mVADi57prY+WmF/tS757deLXdlg0niNG1BSH
 JjtqUSqw+NbDXYysZBXD3FM=
X-Google-Smtp-Source: ABdhPJyN7WK8TDIV07lY6Vw3BSCzWsRh8SxCdZyrqPzER9GZiXV7WlUHrJTVeRbnHqxrI3lD1Qshqw==
X-Received: by 2002:a17:90a:1984:: with SMTP id
 4mr31119195pji.241.1633355597382; 
 Mon, 04 Oct 2021 06:53:17 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 k17sm12209548pfu.82.2021.10.04.06.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:53:16 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH 0/8] Fix long standing AER Error Handling Issues 
Date: Mon,  4 Oct 2021 19:22:35 +0530
Message-Id: <cover.1633353468.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Oct 2021 09:16:56 +1100
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
Cc: Naveen Naidu <naveennaidu479@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series aims at fixing some of the AER error handling issues
we have.

Currently we have the following issues:
 - Confusing message in aer_print_error()
 - aer_err_info not being initialized completely in DPC path before 
   we print the AER logs
 - A bug [1] in clearing of AER registers in the native AER path

[1] https://lore.kernel.org/linux-pci/20151229155822.GA17321@localhost/

The primary aim of this patch series is to converge the APEI path and the
native AER error handling paths. In our current code, we find that we
have two different behaviours (especially when it comes to clearing of
the AER registers) for the same functionality.

This patch series, tries to bring the same semantics and hence more 
commonanlity between the APEI part of code and the native OS 
handling of AER errors.

PATCH 1: 
  - Fixes the first issue

PATCH 2 - 4:
  - Fixes the second issue
  - "Patch 3/8" is dependent on "Patch 2/3" in the series

PATCH 5 - 7
  - Deals with converging the various paths and to bring more
    commonality between them
  - "Patch 6/8" depends on "Patch 1/8"

PATCH 8:
  -  Adds extra information in AER error logs.

Thanks,
Naveen Naidu

Naveen Naidu (8):
 [PATCH 1/8] PCI/AER: Remove ID from aer_agent_string[]
 [PATCH 2/8] PCI: Cleanup struct aer_err_info
 [PATCH 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
 [PATCH 4/8] PCI/DPC: Use pci_aer_clear_status() in dpc_process_error()
 [PATCH 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER registers
 [PATCH 6/8] PCI/AER: Clear error device AER registers in aer_irq()
 [PATCH 7/8] PCI/ERR: Remove redundant clearing of AER register in pcie_do_recovery()
 [PATCH 8/8] PCI/AER: Include DEVCTL in aer_print_error()

 drivers/pci/pci.h      |  23 +++-
 drivers/pci/pcie/aer.c | 265 ++++++++++++++++++++++++++++-------------
 drivers/pci/pcie/dpc.c |   9 +-
 drivers/pci/pcie/err.c |   9 +-
 4 files changed, 207 insertions(+), 99 deletions(-)

-- 
2.25.1

