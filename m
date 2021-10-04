Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6374219EF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:23:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNZxR0qkBz3c52
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:23:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o/QK+Mjg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=o/QK+Mjg; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNMxq5r3Wz2xt5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:08:14 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id e7so16657055pgk.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=90VZotrStGy8mgssJr/W9iFiKQDvcfNAnl0DsJhkfs0=;
 b=o/QK+MjgwS+aEQuPx4irPsbCaHMW6sfXp8BaqM12h1M93plmbNOTRFIEVh1NBvMkEB
 ZUI/rsaRIpecJgpTBkNdVhjXxkwcmFdasoMV5ExX4poVBKt+rT6b3AXqoH8YrS1V9Cma
 yTLd30q8/soHf0V8eO5srZz85E1ywxMMQjSiHSXBQmm4FwKQnXqmnLibeVWcAbhZsPoG
 g7rBm1DWVZe9gEnb4fnGCjTY7cLC1uB+fjbWcPtPfaxV99JFomRFEybhCoXr3oNyDkpZ
 +zue++onjHrY646/5Vrk8fAzNswt0qpQPvj0GEqZcPrHvgmnxDwplbLQUFeXbAVc1+Wk
 8g0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=90VZotrStGy8mgssJr/W9iFiKQDvcfNAnl0DsJhkfs0=;
 b=kQomRrzRjNEn8u2AKNrulu3NZDVTQ0xPH7uxx4RJIkLQNRlF7QT1qnt4mr+BPhD/9N
 DetPomVZ5erlcd94DmLipng5skdi2ToLXCuzIbgBDCpfpzNZbq6W65AlgUnjPU7uRMg9
 DBIIzIDeJFlDX2LSqkpaH2LsqPidIBFPSS7mgNg1xNHTWWbdtfQQJwCEGwXvYvV9Jj0I
 SfdEa6WKhkaDB31+sF9UI2UHwAH83qzWhdXtON4B0QB639AeMuJVvh6V8uGfnGSu5p7A
 wM4M4PwM5s0qAeR/5UOV3KSZPN+KT9oX6fpcsvZCIKrNcU8KptXntZZOayOFjTIVauA5
 KsGA==
X-Gm-Message-State: AOAM532PsDE3yVDVbu3GDy8E9HLJC/XD7XBSn5EAKMJTkxnKlbCkIoOU
 +Zyo7DtLSIjb/G6b1XrzSWzXNSRpEzFL65Zi
X-Google-Smtp-Source: ABdhPJxdmeh3wBzsACdJJKEbMJ6nFPRgGudEiYPsvM9XJ9KsMd2LE/efWBCTvow/NjbvzslzV8Q/lg==
X-Received: by 2002:a63:63c5:: with SMTP id x188mr5138080pgb.391.1633356491815; 
 Mon, 04 Oct 2021 07:08:11 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 p2sm15274135pgd.84.2021.10.04.07.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:08:11 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v2 0/8] Fix long standing AER Error Handling Issues 
Date: Mon,  4 Oct 2021 19:36:26 +0530
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, skhan@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
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

Changelog
=========

v2:
  Apologies for the mistake, I forgot to cc the linux-pci mailing list.
  Resent the email with cc to linux-pci.

Naveen Naidu (8):
 [PATCH v2 1/8] PCI/AER: Remove ID from aer_agent_string[]
 [PATCH v2 2/8] PCI: Cleanup struct aer_err_info
 [PATCH v2 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
 [PATCH v2 4/8] PCI/DPC: Use pci_aer_clear_status() in dpc_process_error()
 [PATCH v2 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER registers
 [PATCH v2 6/8] PCI/AER: Clear error device AER registers in aer_irq()
 [PATCH v2 7/8] PCI/ERR: Remove redundant clearing of AER register in pcie_do_recovery()
 [PATCH v2 8/8] PCI/AER: Include DEVCTL in aer_print_error()

 drivers/pci/pci.h      |  23 +++-
 drivers/pci/pcie/aer.c | 265 ++++++++++++++++++++++++++++-------------
 drivers/pci/pcie/dpc.c |   9 +-
 drivers/pci/pcie/err.c |   9 +-
 4 files changed, 207 insertions(+), 99 deletions(-)

-- 
2.25.1

