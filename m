Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EFC19EF75
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 05:11:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wbCv3b46zDr2J
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:11:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J8lTbrbR; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wb82756YzDqs8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 13:08:02 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id f206so6859496pfa.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 20:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pQP5wDfqlM1Reo+P7etosHyX354NfcGWU0e7tHfs54A=;
 b=J8lTbrbRw7roqx2E46ykpCAi5Bfc8bedF4adubz07O1StUkfXy4+tsVjPS2q2dnDTk
 w4z8hEuCJFqXaygVNFXoU5Ou+aRHTa8PF1yCmZAdXUWyfZkjGc4a89V7cFgkKnoCB7yE
 /rlhnEHRRe83bsvRPNvDh/otqRrXQh43viZT5rsPpN2bjBdbvtB7Zz3ukl0jXkm49rby
 912Phj0K4hkkzraffoCEEpnXBZ7H2qUWv1ANcvM1E1h2esKuLoTGARmjnK5WSETHxduf
 YCsk6/4aAGceRj/L0i7zxCW0WOKfzFlLQXvTM45YDecqYB4QoDuovSeiHLWgcDVKE/jR
 OJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pQP5wDfqlM1Reo+P7etosHyX354NfcGWU0e7tHfs54A=;
 b=pbi5I/B0EJjHInAmSgtjM/hc5XkV2zs2iKvxXMcKXnxsPp27e5p5zn/fB5CdzxSU+r
 yZzPJdJkP31ra5XWT0bn3BtSc0DMUl4bHBOxybhcMzowOjdHrF19NkO++W9oX6E0RCxl
 k7B/tnLONZpFb6mmZrvnOksLMdKAeas493fZ+rYBRw92Mv40YAQvRGu6438JvanW62ux
 dZzGFQWMG2oZhjKzZW8dI1P8tHkCrnB6gKOoJiKZ6jF8l4odjDAnVg2tO8BttFwi+Qz/
 4XSL8Zy4FTzRct12jPzALuKWDh9RFyMW6uijvH6sbbhmmBafXypNnivizCuf3DUIHGN/
 JpHQ==
X-Gm-Message-State: AGi0PuYZ1/o8vRWoTQmfBP1Cz9CAfQ6OxZ2GBlJm4Yl4m3Eh6VJmBdKK
 IRjbdk+5fSe+xLBZImfpfmJgAKiN
X-Google-Smtp-Source: APiQypJGfJ39TYUfXxvsq2GtZMkZrpaK1bEMQC2pdcpvC2srCISKNHvjJtbVwSkEYs/M2hxwgM3Zwg==
X-Received: by 2002:aa7:83c5:: with SMTP id j5mr19909009pfn.100.1586142477229; 
 Sun, 05 Apr 2020 20:07:57 -0700 (PDT)
Received: from localhost.ibm.com ([220.240.58.168])
 by smtp.gmail.com with ESMTPSA id e187sm10196443pfe.143.2020.04.05.20.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 20:07:56 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Make PowerNV IOMMU group setup saner (and fix it for hotpug)
Date: Mon,  6 Apr 2020 13:07:38 +1000
Message-Id: <20200406030745.24595-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
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
Cc: aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently on PowerNV the IOMMU group of a device is initialised in
boot-time fixup which runs after devices are probed. Because this is
only run at boot time hotplugged devices do not recieve an iommu group
assignment which prevents them from being passed through to a guest.

This series fixes that by moving the point where IOMMU groups are
registered to when we configure DMA for a PE, and moves the point where
we add a device to the PE's IOMMU group into the per-device DMA setup
callback for IODA phbs (pnv_pci_ioda_dma_dev_setup()). This change means
that we'll do group setup for hotplugged devices and that we can remove
the hack we have for VFs which are currently added to their group
via a bus notifier.

With this change there's no longer any per-device setup that needs to
run in a fixup for ordinary PCI devices. The exception is, as per usual,
NVLink devices. For those the GPU and any of it's NVLink devices need
to be in a "compound" IOMMU group which keeps the DMA address spaces
of each device in sync with it's attached devices. As a result that
setup can only be done when both the NVLink devices and the GPU device
has been probed, so that setup is still done in the fixup. Sucks, but
it's still an improvement.

Boot tested on a witherspoon with 6xGPUs and it didn't crash so it must
be good.


