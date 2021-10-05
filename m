Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0167A422EFE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 19:19:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP48D5x9Dz2yyh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 04:19:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SAKUQo0n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SAKUQo0n; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP47X5Xm0z2yPY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 04:19:03 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id r201so14477369pgr.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Oct 2021 10:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qQT+mDvkkQCJQfW4l8MXueOtWGmReSv26PNLqJ69eIE=;
 b=SAKUQo0n36vAvd2dP1867PQKEdhRlgvmbuzGuIjn6ExEt33l2DZ+FZeddFfsxZhPoN
 pE1xkI3/fiwkKoL3lO3xSRKeT39B5otGFTRCa9aZtDn1KSLn8LY32Q3jEUGqnrGQhrRf
 FEtTYTJWYMEm+plrrqi7vMw6tb1+3M+HUHAEaCbcIwP/maFCEilzUAFRDi4o/D4gskpb
 dHH2tz7jl/EJDxM1lPpu8WUPW8FJtFq2xv+1kXuWmLX4IEXmoFtix8X8sQDIXBkTXUg6
 X/01cjlj1ILLP2ZCI0eSAjTkX/SUAk97sQ0ISZoae2hjQQVoyJioUA2bq18o/TxQ8bFD
 viIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qQT+mDvkkQCJQfW4l8MXueOtWGmReSv26PNLqJ69eIE=;
 b=De8l0sHe4aXkhETquKAWjJ62Ut2veMllpoNCRdCsCZqcxwefxxVcQPOSIIdnEb6HdA
 yZkYpDIlqA1SifpCzDJWJxYvUlQ9xG9YdZyL0t6LBjKrsgElvxSi26c552QGtLirRtnl
 XmCJm4YlY2sc/2yFUw2Y6qYN+xmCZN/rCMdEvZ34n7YVLMz+KNvHIgfdX47R/DXOZ2eM
 7eUx/W4D4y1g/GYuRbWBzQkrJ4DNjRx4j46OV2z7rTQmUJwiCkw5sAMEaMXz8fzYq+sN
 i1RFnpY1u1lA0QSI1FUikXHypTG9K0rfdN1SGCkfo55pUEUq1Mc5dYfMFpbYWdnQ8wEp
 Hl4A==
X-Gm-Message-State: AOAM531jXXrEPiwUXdVPBbR2FHbVelN9NxUD803W+dME9upGsfvRD5Vd
 9DvM9O/5OPV63KwUSLe458M=
X-Google-Smtp-Source: ABdhPJzEWfjabqzm399k9sgiMDMfZMs8fGUj9h1G1NasJnjVQm0jliPuqYwmVa/JBUHJf7aVDXzsGQ==
X-Received: by 2002:a63:5717:: with SMTP id l23mr1322508pgb.87.1633454340207; 
 Tue, 05 Oct 2021 10:19:00 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:f69:1127:b4ce:ef67:b718])
 by smtp.gmail.com with ESMTPSA id
 f25sm18476722pge.7.2021.10.05.10.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:18:59 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v4 0/8] Fix long standing AER Error Handling Issues 
Date: Tue,  5 Oct 2021 22:48:06 +0530
Message-Id: <cover.1633453452.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
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
  - "Patch 3/8" is dependent on "Patch 2/8" in the series

PATCH 5 - 7
  - Deals with converging the various paths and brings more
    commonality between them
  - "Patch 6/8" depends on "Patch 1/8"

PATCH 8:
  -  Adds extra information in AER error logs.

Thanks,
Naveen Naidu

Changelog
=========

v4:
  - Implement review comments
  - Make "Patch 1/8" commit message more meaningful
  - Fix the code comment error detected by kernel test robot 
    in "Patch 6/8"

v2 and v3:
  - Fix up mail formatting and include the appropriate receipients for
    the patch.

Naveen Naidu (8):
 [PATCH v4 1/8] PCI/AER: Remove ID from aer_agent_string[]
 [PATCH v4 2/8] PCI: Cleanup struct aer_err_info
 [PATCH v4 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
 [PATCH v4 4/8] PCI/DPC: Use pci_aer_clear_status() in dpc_process_error()
 [PATCH v4 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER registers
 [PATCH v4 6/8] PCI/AER: Clear error device AER registers in aer_irq()
 [PATCH v4 7/8] PCI/ERR: Remove redundant clearing of AER register in pcie_do_recovery()
 [PATCH v4 8/8] PCI/AER: Include DEVCTL in aer_print_error()

 drivers/pci/pci.h      |  23 +++-
 drivers/pci/pcie/aer.c | 269 ++++++++++++++++++++++++++++-------------
 drivers/pci/pcie/dpc.c |   9 +-
 drivers/pci/pcie/err.c |   9 +-
 4 files changed, 209 insertions(+), 101 deletions(-)

-- 
2.25.1

