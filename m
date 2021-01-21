Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BD32FE469
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 08:55:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLvnv0jBGzDr5J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 18:55:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+5b2bf2cc950c4867fd89+6360+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=lEUjKYCe; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLvm156NczDqvV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 18:53:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=UGANRP/KM5q83XfobVV7DWx5ZvtoCTKMobbFGMONdGw=; b=lEUjKYCeFs939aYUT/oDk6x8Y8
 cQ3mrs840LqXWpjhVo/H1r9njWTQ2UPMp9vFEXNfezGdicLLr/cpJYuAIPKokMcQdsrz5ps+wCZNK
 nZ2RUpOEkYuO5olwBDJmnGrb7/ILlsTg617y335c8QBpy3BbsWSMBVQgNHVcD3kQsM+HbV3hK4fA9
 oqMsrTu5NsH9B5ZNHX/iQUwurf1JG18BrQ4usaMdfm8xeUK3jmKB47YIhmvEp4W3VqZRJ+yOtCKrq
 95e+rD3HXbyxkwd44BUDiR7XtNG/my8cZkRGEyei9qwBKaHcXWITUTwK8+IKHsYEr6qESVUJyPNHu
 1BsbRzLQ==;
Received: from 089144206130.atnat0015.highway.bob.at ([89.144.206.130]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l2UlI-00Gm22-Ef; Thu, 21 Jan 2021 07:52:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Yu <jeyu@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>
Subject: module loader dead code removal and cleanusp
Date: Thu, 21 Jan 2021 08:49:46 +0100
Message-Id: <20210121074959.313333-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

this series removes support for long term unused export types and
cleans up various loose ends in the module loader.

Diffstat:
 arch/arm/configs/bcm2835_defconfig          |    1 
 arch/arm/configs/mxs_defconfig              |    1 
 arch/mips/configs/nlm_xlp_defconfig         |    1 
 arch/mips/configs/nlm_xlr_defconfig         |    1 
 arch/parisc/configs/generic-32bit_defconfig |    1 
 arch/parisc/configs/generic-64bit_defconfig |    1 
 arch/powerpc/configs/ppc6xx_defconfig       |    1 
 arch/powerpc/platforms/powernv/pci-cxl.c    |   22 -
 arch/s390/configs/debug_defconfig           |    1 
 arch/s390/configs/defconfig                 |    1 
 arch/sh/configs/edosk7760_defconfig         |    1 
 arch/sh/configs/sdk7780_defconfig           |    1 
 arch/x86/configs/i386_defconfig             |    1 
 arch/x86/configs/x86_64_defconfig           |    1 
 arch/x86/tools/relocs.c                     |    4 
 drivers/gpu/drm/drm_crtc_helper_internal.h  |   10 
 drivers/gpu/drm/drm_fb_helper.c             |   21 -
 drivers/gpu/drm/drm_kms_helper_common.c     |   26 +-
 include/asm-generic/vmlinux.lds.h           |   42 ---
 include/linux/export.h                      |    9 
 include/linux/kallsyms.h                    |   17 -
 include/linux/module.h                      |   42 ---
 init/Kconfig                                |   17 -
 kernel/kallsyms.c                           |    8 
 kernel/livepatch/core.c                     |   61 +----
 kernel/module.c                             |  319 ++++++++++------------------
 kernel/trace/trace_kprobe.c                 |    4 
 lib/bug.c                                   |    3 
 scripts/checkpatch.pl                       |    6 
 scripts/mod/modpost.c                       |   50 ----
 scripts/mod/modpost.h                       |    3 
 scripts/module.lds.S                        |    6 
 tools/include/linux/export.h                |    3 
 33 files changed, 181 insertions(+), 505 deletions(-)
