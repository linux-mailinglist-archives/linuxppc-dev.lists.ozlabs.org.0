Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4E2781E0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2019 23:37:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xblG5HLLzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 07:37:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.208.195; helo=mail-lj1-f195.google.com;
 envelope-from=yefremov.denis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xZ4t3FPzzDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 06:22:49 +1000 (AEST)
Received: by mail-lj1-f195.google.com with SMTP id p17so56489388ljg.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 13:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H30JE1TBEsAuw94izU6UpoMxwvUnP+RXDRNZnh1O8pc=;
 b=uPjtM/lpXsew345llBPaeG7P1DUbKm9J73z8QE/pLIWfhnYqZ9QlKPzAkYuwJHk7WD
 CrRxo5J2gKJWxe1TYnbF4FAVJJ4f85M2OAGaMZ69JRGC52VSZd4DHNNvAejSP6tMqxuN
 7Oq+aXQDI0cqDId37cmnzp4DgQGApHuBCUmOqH+YobgHFiii1y3TnjINAVJ0+PszOJic
 +Ce7NNvJW+lAevEAy8Yj8JhBmfhAuG7p6/7w0nTr4XKjloejDhF7oaqT2+9qEv7uiPdD
 /AFsLv5vmcZCAP+R+b6vGph80lKnCIv76pdnoYA3vDrX8lwhIeN7MoZA/BKGnLefug4C
 oZ8w==
X-Gm-Message-State: APjAAAVxiXqBqMepHTXli4x0dDm+IswrNilGnwspQ+4ca1UWQhLy2bdt
 CQH3XYXU2ab5MB//ml6uz4o=
X-Google-Smtp-Source: APXvYqygX2Y5dS/gnwNqOZKPSCByVOdOdiau/6PoALAhMf0ml07RPwI9uM2EKDeRpNnJ5yE9cYpa9g==
X-Received: by 2002:a2e:814e:: with SMTP id t14mr20112908ljg.167.1564345365258; 
 Sun, 28 Jul 2019 13:22:45 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru.
 [188.32.48.208])
 by smtp.googlemail.com with ESMTPSA id z17sm12395917ljc.37.2019.07.28.13.22.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2019 13:22:44 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 0/5] PCI: Convert pci_resource_to_user() to a weak function
Date: Sun, 28 Jul 2019 23:22:08 +0300
Message-Id: <20190728202213.15550-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:36:11 +1000
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
Cc: Michal Simek <monstr@monstr.eu>, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Paul Mackerras <paulus@samba.org>,
 Denis Efremov <efremov@linux.com>, James Hogan <jhogan@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Architectures currently define HAVE_ARCH_PCI_RESOURCE_TO_USER if they want
to provide their own pci_resource_to_user() implementation. This could be
simplified if we make the generic version a weak function. Thus,
architecture specific versions will automatically override the generic one.

Denis Efremov (5):
  PCI: Convert pci_resource_to_user to a weak function
  microblaze/PCI: Remove HAVE_ARCH_PCI_RESOURCE_TO_USER
  mips/PCI: Remove HAVE_ARCH_PCI_RESOURCE_TO_USER
  powerpc/PCI: Remove HAVE_ARCH_PCI_RESOURCE_TO_USER
  spark/PCI: Remove HAVE_ARCH_PCI_RESOURCE_TO_USER

 arch/microblaze/include/asm/pci.h |  2 --
 arch/mips/include/asm/pci.h       |  1 -
 arch/powerpc/include/asm/pci.h    |  2 --
 arch/sparc/include/asm/pci.h      |  2 --
 drivers/pci/pci.c                 |  8 ++++++++
 include/linux/pci.h               | 18 +++---------------
 6 files changed, 11 insertions(+), 22 deletions(-)

-- 
2.21.0

