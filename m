Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9C8421A09
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:29:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNb466JdQz3dcY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:29:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dCrrsJvn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dCrrsJvn; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNNRl3bhhz2yHt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:30:41 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id k23so796623pji.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6rr106+TYNeK97taV8nJ/RZEy+nuSWL8bqPL/aoVjRQ=;
 b=dCrrsJvny+hB8TpVDzPJqM5XRNvg99gIyL7pccDv7Hg1idhKdsZXpuRzIqSm3k86wK
 6EpxKp5R2n/dSTSd3atPrxHHsbxx+oe4QOD9qiSAZBylCjJ/UaJEVRxwhOYJgvYAEwCg
 0CzNm2RlWEjNdGNgA4/UBYBB3yQNWWFADdfOlPRfJZb4Qwn7xV0cLfa/mnbiDSaE2V+A
 J145kLAi1Edyeub2jRxpLg3PP5yJ3pq/1p63zI+4MvIcFjEoGjPVtz07Vu1hRTxdft0L
 IhSYV9nXW/pt8qQRW7/qijuCW/9s3fZ74iEFxxUI/5U3H+UOjySRtoIH+mIODSuiBZhB
 G++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6rr106+TYNeK97taV8nJ/RZEy+nuSWL8bqPL/aoVjRQ=;
 b=ONhF3kXulkm48rOaCZqJ8RBLL/x0ECW0fIyCacRdmbJ47pW+apY1Nr2q1DyDGZeTcH
 oLbJBDT0tctjunROcQy0BS8PRi6n5ub+ipPz84mTZ5eTpf1ZLlCIO+GMYsBq+9YGZhw1
 9simIl8Kx1JeF8ZLsqc8d+kMSAJk7g3zSwQvaUQMmd/CCLfCmKbhLCOzT3z4eC4eWn+d
 haL9Zx4qqjslSqaFeJn8s5OwwCj+8XJJJUKC3cvfuxhYSFCSj3SRAts/g8f3dDsfUsF1
 +yuEXp7d+QYcT03xvkMX9NKVnPtrFdkMHVNr4dK38KiRUlIkAaKJGKP3/cid2OBcOZzJ
 ZshA==
X-Gm-Message-State: AOAM5339Ro8SHdk4ntsODwGJgDfnJtUZyCjjEfWObvx4HSTA6lq6/vJq
 Wwe8j8PNxzSC0E2mOSDJpho=
X-Google-Smtp-Source: ABdhPJw6PldeGsjV/EL0pdYEviOaQ4rPP1DQowLQR2PYIHQgBZUm1Hnv61uEdepS0yhN1pwijPziZA==
X-Received: by 2002:a17:902:9689:b0:138:d2ac:44f with SMTP id
 n9-20020a170902968900b00138d2ac044fmr23336055plp.85.1633357836449; 
 Mon, 04 Oct 2021 07:30:36 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 q3sm14489146pgf.18.2021.10.04.07.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:30:36 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v3 0/8] Fix long standing AER Error Handling Issues
Date: Mon,  4 Oct 2021 19:59:56 +0530
Message-Id: <cover.1633357368.git.naveennaidu479@gmail.com>
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

v3:
 - Fix up mail formatting and resend the patches again.
   Really sorry for all the spam. I messed up in the first try and
   instead of fixing it well in v2, I messed up again. I have fixed
   everything now. Apologies for the inconvenience caused. I'll make
   sure to not repeat it again.

v2:
  - Apologies for the mistake, I forgot to cc the linux-pci mailing 
    list.Resent the email with cc to linux-pci

Naveen Naidu (8):
 [PATCH v3 1/8] PCI/AER: Remove ID from aer_agent_string[]
 [PATCH v3 2/8] PCI: Cleanup struct aer_err_info
 [PATCH v3 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
 [PATCH v3 4/8] PCI/DPC: Use pci_aer_clear_status() in dpc_process_error()
 [PATCH v3 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER registers
 [PATCH v3 6/8] PCI/AER: Clear error device AER registers in aer_irq()
 [PATCH v3 7/8] PCI/ERR: Remove redundant clearing of AER register in pcie_do_recovery()
 [PATCH v3 8/8] PCI/AER: Include DEVCTL in aer_print_error()

 drivers/pci/pci.h      |  23 +++-
 drivers/pci/pcie/aer.c | 265 ++++++++++++++++++++++++++++-------------
 drivers/pci/pcie/dpc.c |   9 +-
 drivers/pci/pcie/err.c |   9 +-
 4 files changed, 207 insertions(+), 99 deletions(-)

-- 
2.25.1

