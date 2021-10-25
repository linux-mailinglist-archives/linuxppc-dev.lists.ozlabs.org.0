Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D4F439C94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 19:02:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdLpc6jJfz305v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 04:02:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B/oKHfT/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=B/oKHfT/; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdLnz5JzQz2xC7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 04:01:26 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id n12so3692351plc.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8HZsp9BvdntOEBLsd033W6ZW3RXr9hJrrgi/DSIEiZc=;
 b=B/oKHfT/wUi2uwyEuNgWcKyEN7bNb1zznXch9q1rURws+JRljbJEIPz0+rgscXU0+Y
 SCs5Z+HviUmO/AG6Z/ANiKZe4sA5pzDCa+CIEjE3N5dq9PnkcFuiSkw3lDaQaV/ep//u
 ML0AA4vKJiuK7hluPphy+3uxXyhhohyLOWd/UXwTy3rPg2TO7smbF3Fwk9xJQHUp31bm
 LBfNWATE8ZnQ0WXPUVZXg8XJ+cEYa++C35DWFIZz9KbWcTReIP/lY78+rYfYbXko3beJ
 y/jCN5CcI/o3LdBpkqsUiU46xGnE0j44QUDcKmtzvDotdBtawKt/3XJNuzWrpRHLrlmY
 C2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8HZsp9BvdntOEBLsd033W6ZW3RXr9hJrrgi/DSIEiZc=;
 b=KQsoJC/zOIFIlHO/xvK5pbtTX6RBqx5gPH7IBqX4YKa4PQz216D/QboTrx++CWwYfr
 9t6VGwIBqwrduwV4IvgvWioP9t22jU8rfBCo/+CRfO8xsFp7BIAs5RYKbdmVoIPeGti9
 PapwkBgl2uYZtVCa4JFZGamfjyNJOFZtxEa81E9mEFxJZ6yfsYpNs6+n43qlWglBI561
 4p8REIAyVyqhfgPmP0qTmCm01DuR3S1rn3Sw6RPTUbCImIrFeqlD3+fUznPGSauWHeGw
 GFOyR2xEotmsMecWdE5nCxI/0j3b3wY/HC4HVtZU4uGj4Z99q5rWoiEWUIHzgYSmlvDn
 EJpQ==
X-Gm-Message-State: AOAM530DZQpxBaxpdpN19SHNrrkDywugYs8z5vhdH88TuW/dOK/0JB3G
 SXWLAmLshh2vHrQJmLws9crijUoAEhjSVA==
X-Google-Smtp-Source: ABdhPJwUXQUjwnugVGLJbHKCyPdLUZ/UBQqXh8Cy82r1VP1k13Hq1CAUhdRWR7+Izqw0iqyEfe89ug==
X-Received: by 2002:a17:90a:2c9:: with SMTP id
 d9mr22098933pjd.73.1635181283642; 
 Mon, 25 Oct 2021 10:01:23 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:df8b:7255:8580:2394:764c])
 by smtp.gmail.com with ESMTPSA id
 g18sm5100858pfj.67.2021.10.25.10.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:01:23 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v5 0/5] Fix long standing AER Error Handling Issues
Date: Mon, 25 Oct 2021 22:30:59 +0530
Message-Id: <cover.1635179600.git.naveennaidu479@gmail.com>
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
Cc: Oza Pawandeep <poza@codeaurora.org>, linux-pci@vger.kernel.org,
 Sinan Kaya <okaya@kernel.org>, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, skhan@linuxfoundation.org,
 Keith Busch <kbusch@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series aims at fixing some of the AER error handling issues
we have.

Currently we have the following issues: 
  
  1. Confusing message in aer_print_error()
  2. aer_err_info not being initialized completely in DPC path before 
     we print the AER logs
  3. A bug [1] in clearing of AER registers in the native AER path

[1] https://lore.kernel.org/linux-pci/20151229155822.GA17321@localhost/

The patch series fixes the above things.

PATCH 1: 
  - Fixes the first issue
  - This patch is independent of other patches and can be applied
    seperately

PATCH 2 - 3:
  - Fixes the second issue
  - Patch 3 is depended on Patch 2 in the series

PATCH 4
  - Fixes the bug in clearing of AER registers which leades to
    AER message spew [1]

PATCH 5:
  - Adds extra information (devctl register) in AER error logs.
  - Patch 5 depends on Patch 4 of the series

Thanks,
Naveen Naidu

Changelog
=========
v5:
    - Edit the commit message of Patch 1 and Patch 5 to include how to
      test the AER messages using aer-inject.
    - Edit Patch 3 to initialize info.id depending on the trigger
      reason.
    - Drop few patches (v4 4/8, 5/8 7/8) since they were wrong.

v4:
    - Fix logical error in 6/8, in the previous version of the patch set
      there was a bug, in how I added the devices to the queue.

v3:
    - Edit the commit messages to be in imperative style and split the
      commits to be more atomic.

v2:
    - Add [PATCH 7] which includes the device control register 
      information in AER error logs.

Naveen Naidu (5):
  [PATCH v5 1/5] PCI/AER: Remove ID from aer_agent_string[]
  [PATCH v5 2/5] PCI: Cleanup struct aer_err_info
  [PATCH v5 3/5] PCI/DPC: Initialize info.id in dpc_process_error()
  [PATCH v5 4/5] PCI/AER: Clear error device AER registers in aer_irq()
  [PATCH v5 5/5] PCI/AER: Include DEVCTL in aer_print_error()

 drivers/pci/pci.h      |  23 +++-
 drivers/pci/pcie/aer.c | 269 ++++++++++++++++++++++++++++-------------
 drivers/pci/pcie/dpc.c |  16 ++-
 3 files changed, 214 insertions(+), 94 deletions(-)

-- 
2.25.1

