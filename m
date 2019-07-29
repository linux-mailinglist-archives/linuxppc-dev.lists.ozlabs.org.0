Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5667897A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 12:16:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xwZn3xSnzDqJB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 20:16:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xwXF5wCKzDqFv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 20:14:21 +1000 (AEST)
Received: by mail-lj1-f195.google.com with SMTP id r9so58015855ljg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 03:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Um6ED6I3PME6LFQVQV/8kHAjm+sTMuYfm30McVPwl0=;
 b=kGdmBsnTUeq+qQfwDoPCjRQGPm2I3ackfdPLtEKrm7H00xmfC4JR5rhe4EpINJqDD0
 oewNqX0CXvMj+CSo3fEEpNOFcCArp/5Hbz6RRX43kHDzH+BPmrYLlU522QrEIG17NY6L
 DCTSr/CG32kissbaT/CEPj9BF9qg2YvKGetmUxn/NWNvdmGlgCW0USXBx+oSy359V0D9
 UhZ5Ljtc9AP4JfXQSwqfhtMfp08+N4eGRO3UT17tTsI7JRn0DUOlCFPxDj22KCUhfxZq
 FS2i6bWkXEK5ys3L7W1fE30aU44A+VqMQpG2lh4Ili4ZEWFRiVas/E3rYWe0KgMIuR3X
 WO9w==
X-Gm-Message-State: APjAAAWUr9JZymbIIJOvppEcjSxekzWr/BpDR7ewA364ycCwvW7Meyzl
 T0wiYiCpIRkOCKwh7kivzow=
X-Google-Smtp-Source: APXvYqzW1ctvjiacKpwN/B8Wf3TwQY8a0G1QokUxEp47Rts8HLz1rJBfR1Qfky77XQ61Z4d7nS9tnA==
X-Received: by 2002:a2e:970d:: with SMTP id r13mr57395760lji.126.1564395257826; 
 Mon, 29 Jul 2019 03:14:17 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru.
 [188.32.48.208])
 by smtp.googlemail.com with ESMTPSA id y12sm11814834lfy.36.2019.07.29.03.14.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 03:14:17 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 0/5] PCI: Convert pci_resource_to_user() to a weak function
Date: Mon, 29 Jul 2019 13:13:56 +0300
Message-Id: <20190729101401.28068-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
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

Changes in v2:
1. Removed __weak from pci_resource_to_user() declaration
2. Fixed typo s/spark/sparc/g

Denis Efremov (5):
  PCI: Convert pci_resource_to_user to a weak function
  microblaze/PCI: Remove HAVE_ARCH_PCI_RESOURCE_TO_USER
  mips/PCI: Remove HAVE_ARCH_PCI_RESOURCE_TO_USER
  powerpc/PCI: Remove HAVE_ARCH_PCI_RESOURCE_TO_USER
  sparc/PCI: Remove HAVE_ARCH_PCI_RESOURCE_TO_USER

 arch/microblaze/include/asm/pci.h |  2 --
 arch/mips/include/asm/pci.h       |  1 -
 arch/powerpc/include/asm/pci.h    |  2 --
 arch/sparc/include/asm/pci.h      |  2 --
 drivers/pci/pci.c                 |  8 ++++++++
 include/linux/pci.h               | 12 ------------
 6 files changed, 8 insertions(+), 19 deletions(-)

-- 
2.21.0

