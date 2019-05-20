Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70522C0D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 08:27:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456ppW4FsBzDqHL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:27:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Px5FqM/m"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456pn63z7yzDqGC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 16:26:00 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id f12so6208611plt.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2019 23:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=63xHHZG4cCJKLX16xEPSfZS7UyrdZwd6ga9JsMxKYuA=;
 b=Px5FqM/mS1qyALv+qJhcikuGpTx7I75PqW5boA29rD51XQx76h2wTajAGDbEZbxspY
 bxlnJQW5+dQICDbCxrvtk6px/wRRXsisMheeia/L8MThczsPUsR/lTbwznXHMmrYdHdd
 Yy4Qt5CfjIehQFSi50fwMq7vUMfAShTqOv0ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=63xHHZG4cCJKLX16xEPSfZS7UyrdZwd6ga9JsMxKYuA=;
 b=blqSIWO6LPe0sWMWPIIY1F/XimyJ3/FJDa4e07iPQ7+Qam+leqaBtqDk16ZKj6TQZG
 eBpKbHESfoOuXCMk13K4tTVZLYMajR83zgUDXWy0yBy5Mu99RYL3RxBZl+Qnt4+Xa4Zj
 SEPUUV1J99yMWpr3HE7whKbxz5O2++Z3wHPPkOZ4oddTLYDiCfE+4zN4xzMTrYRKiPnD
 pynnJu2IUSRmsHoPDgozQBRPWocyRTk7wEGxmVVcvVxpr7wnQG6joDWX2VBDAqFugT+J
 7kbggQgyorXU0+vrQRktvq83PgsrD5616Rln9pOuVqsWRH4LhyaQO0oz+LOKkj515mYh
 t4ig==
X-Gm-Message-State: APjAAAVM30KOOuFAEqpz7rb/OG8lBT8FfvFhmwIIGAGnQ2nGGbh19jjZ
 QAXtTs6H9oTmWwVlKTvPvFlHKWli9EU=
X-Google-Smtp-Source: APXvYqwzCBetVhqi03nlstH+2xiRvE1S8LLzzKPoHl8PnMWGRbi9WPqIjh6DlV3BAMChVYt4vLwyIQ==
X-Received: by 2002:a17:902:bc4b:: with SMTP id
 t11mr67117635plz.255.1558333558539; 
 Sun, 19 May 2019 23:25:58 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id q17sm28567910pfq.74.2019.05.19.23.25.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 19 May 2019 23:25:57 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: nayna@linux.ibm.com, cclaudio@linux.ibm.com, linux-fsdevel@vger.kernel.org,
 greg@kroah.com, linuxppc-dev@lists.ozlabs.org
Subject: [WIP RFC PATCH 0/6] Generic Firmware Variable Filesystem
Date: Mon, 20 May 2019 16:25:47 +1000
Message-Id: <20190520062553.14947-1-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

As PowerNV moves towards secure boot, we need a place to put secure
variables. One option that has been canvassed is to make our secure
variables look like EFI variables. This is an early sketch of another
approach where we create a generic firmware variable file system,
fwvarfs, and an OPAL Secure Variable backend for it.

In short, platforms provide a simple backend that can interface with
the hardware, and fwvarfs deals with translating that into a
filesystem that you can use. Almost all of the hard work is done by
kernfs: fwvarfs provides a pretty thin layer on top of that to make
backends a simple as possible.

Behaviour and the API is documented in Documentation/filesystems/fwvarfs.txt

To demonstrate the concept, a fully functional memory-based backend is
provided, and a read-only but userspace-compatible EFI backend.

For OPAL secure variables, I have taken Claudio's commit, tweaked it
to apply to linux-next, replaced all the EFI support with a generic
API, and then written a backend against that. There's a coming version
from Claudio that moves the opal calls towards a simple key/value
interface rather than (name, vendor) pairs - I haven't waited for
that: this is really just to demonstrate that it could be done rather
than an attempt to get mergable code.  It is also compile tested only
as I haven't yet set myself up with a test machine.

The patches are a bit rough, and there are a number of outstanding
TODOs sprinkled in everywhere. The idea is just to do a proof of
concept to inform our discussions:

 - Is this the sort of approach you'd like (generic vs specific)?
 
 - Does the backend API make sense?
 
 - Is the use of kernfs the correct decision, or is it potentially too
   limiting? (e.g. no ability to do case-insensitivity like efivarfs)

 - Is assuming flat fwvars correct or is there a firmware with a
   hierarchical structure?

Regards,
Daniel

Claudio Carvalho (1):
  powerpc/powernv: Add support for OPAL secure variables

Daniel Axtens (5):
  kernfs: add create() and unlink() hooks
  fwvarfs: a generic firmware variable filesystem
  fwvarfs: efi backend
  powerpc/powernv: Remove EFI support for OPAL secure variables
  fwvarfs: Add opal_secvar backend

 Documentation/filesystems/fwvarfs.txt        | 154 ++++++++++
 arch/powerpc/include/asm/opal-api.h          |   6 +-
 arch/powerpc/include/asm/opal-secvar.h       |  58 ++++
 arch/powerpc/include/asm/opal.h              |  10 +
 arch/powerpc/platforms/powernv/Kconfig       |   8 +
 arch/powerpc/platforms/powernv/Makefile      |   1 +
 arch/powerpc/platforms/powernv/opal-call.c   |   4 +
 arch/powerpc/platforms/powernv/opal-secvar.c | 121 ++++++++
 fs/Kconfig                                   |   1 +
 fs/Makefile                                  |   1 +
 fs/fwvarfs/Kconfig                           |  47 +++
 fs/fwvarfs/Makefile                          |  10 +
 fs/fwvarfs/efi.c                             | 177 +++++++++++
 fs/fwvarfs/fwvarfs.c                         | 294 +++++++++++++++++++
 fs/fwvarfs/fwvarfs.h                         | 124 ++++++++
 fs/fwvarfs/mem.c                             | 113 +++++++
 fs/fwvarfs/opal_secvar.c                     | 218 ++++++++++++++
 fs/kernfs/dir.c                              |  54 ++++
 include/linux/kernfs.h                       |   3 +
 include/uapi/linux/magic.h                   |   1 +
 20 files changed, 1404 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/filesystems/fwvarfs.txt
 create mode 100644 arch/powerpc/include/asm/opal-secvar.h
 create mode 100644 arch/powerpc/platforms/powernv/opal-secvar.c
 create mode 100644 fs/fwvarfs/Kconfig
 create mode 100644 fs/fwvarfs/Makefile
 create mode 100644 fs/fwvarfs/efi.c
 create mode 100644 fs/fwvarfs/fwvarfs.c
 create mode 100644 fs/fwvarfs/fwvarfs.h
 create mode 100644 fs/fwvarfs/mem.c
 create mode 100644 fs/fwvarfs/opal_secvar.c

-- 
2.19.1

