Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C45444384
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 15:27:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hkpyc2D9Fz2yY0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 01:27:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=BORuspiw;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FTgDDkPG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BORuspiw; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FTgDDkPG; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hkpxw1cK3z2xCG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 01:27:16 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6FCE5218D9;
 Wed,  3 Nov 2021 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635949632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Dog1kS0Nm8BT5xToDrdeBUJVtPUNFmm5wWj5SRd7+2I=;
 b=BORuspiw5Z2g1pJmzhS/Mn/w26i3SRVFn4yIidQgmvBEwaNrAoDYRkIsdA1J7ZtN8oUtx8
 /m/9RbtrEeXQNjK/UZyI0IkzAkQWSeNrBkGMWK3WLWwzXhx80V04K9Q+i1p/2b8Bc5IJu7
 aTVOKIZI7QIiWwdudr4Z694kUKcYpiU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635949632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Dog1kS0Nm8BT5xToDrdeBUJVtPUNFmm5wWj5SRd7+2I=;
 b=FTgDDkPGlsImvWmFW+/Zw3OfT/3JwHgMG85BIekvkJkkoZVThpg3GQtPj8HmbLxg9F/bCi
 t/ooTeugcRuWZkDw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id 3C1A9A3B84;
 Wed,  3 Nov 2021 14:27:11 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: keyrings@vger.kernel.org
Subject: [PATCH 0/3] KEXEC_SIG with appended signature
Date: Wed,  3 Nov 2021 15:27:05 +0100
Message-Id: <cover.1635948742.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.31.1
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
Cc: Rob Herring <robh@kernel.org>, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Heiko Carstens <hca@linux.ibm.com>, Jessica Yu <jeyu@kernel.org>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org,
 Frank van der Linden <fllinden@amazon.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

S390 uses appended signature for kernel but implements the check
separately from module loader.

Support for secure boot on powerpc with appended signature is planned -
grub patches submitted upstream but not yet merged.

This is an attempt at unified appended signature verification.

Thanks

Michal

Michal Suchanek (3):
  s390/kexec_file: Don't opencode appended signature verification.
  module: strip the signature marker in the verification function.
  powerpc/kexec_file: Add KEXEC_SIG support.

 arch/powerpc/Kconfig                  | 11 +++++++
 arch/powerpc/kexec/elf_64.c           | 14 +++++++++
 arch/s390/kernel/machine_kexec_file.c | 42 +++------------------------
 include/linux/verification.h          |  3 ++
 kernel/module-internal.h              |  2 --
 kernel/module.c                       | 11 +++----
 kernel/module_signing.c               | 32 ++++++++++++++------
 7 files changed, 59 insertions(+), 56 deletions(-)

-- 
2.31.1

