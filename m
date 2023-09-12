Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FD279D2E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 15:54:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m64W3uS2;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ieqafxgs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlQ6l6QM1z3dJd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 23:54:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m64W3uS2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ieqafxgs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 88812 seconds by postgrey-1.37 at boromir; Tue, 12 Sep 2023 23:50:55 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlQ33706Wz3c0X
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 23:50:55 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D06A8215E6;
	Tue, 12 Sep 2023 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694526651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jfsfCbmV4CKGMsiOpxVuXT74O5izS3toa2d723Akmmw=;
	b=m64W3uS2e57d3w4nffiJw2Fh7RVuCjr7bt3J7GNJYSsYTztKgQqHhgk+45ttX69+ok4VVh
	yw99bbZNMAnHVuSsmonUkgR2O2L9e14Mofs81IpcD5l45rxYbx5zcOxWmbHcFcOYwP/nct
	o5C2uHBJHXRzpiqUOohiTj85xw8bFlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694526651;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jfsfCbmV4CKGMsiOpxVuXT74O5izS3toa2d723Akmmw=;
	b=IeqafxgshLUoUAVGjmtdVjMjQk111anVIYX6bOmlE+8+ZaBBtGpsXakjueIXBxBxqhg67j
	VlS2K9Xq+v6m1vDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 934DD139DB;
	Tue, 12 Sep 2023 13:50:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 55MhI7tsAGVKQwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Tue, 12 Sep 2023 13:50:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	arnd@arndb.de,
	deller@gmx.de
Subject: [PATCH v4 0/5] ppc, fbdev: Clean up fbdev mmap helper
Date: Tue, 12 Sep 2023 15:48:58 +0200
Message-ID: <20230912135050.17155-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clean up and rename fb_pgprotect() to work without struct file. Then
refactor the implementation for PowerPC. This change has been discussed
at [1] in the context of refactoring fbdev's mmap code.

The first two patches update fbdev and replace fbdev's fb_pgprotect()
with pgprot_framebuffer() on all architectures. The new helper's stream-
lined interface enables more refactoring within fbdev's mmap
implementation.

Patches 3 to 5 adapt PowerPC's internal interfaces to provide
phys_mem_access_prot() that works without struct file. Neither the
architecture code or fbdev helpers need the parameter.

v4:
	* fix commit message (Christophe)
v3:
	* rename fb_pgrotect() to pgprot_framebuffer() (Arnd)
v2:
	* reorder patches to simplify merging (Michael)

[1] https://lore.kernel.org/linuxppc-dev/5501ba80-bdb0-6344-16b0-0466a950f82c@suse.com/

Thomas Zimmermann (5):
  fbdev: Avoid file argument in fb_pgprotect()
  fbdev: Replace fb_pgprotect() with pgprot_framebuffer()
  arch/powerpc: Remove trailing whitespaces
  arch/powerpc: Remove file parameter from phys_mem_access_prot code
  arch/powerpc: Call internal __phys_mem_access_prot() in fbdev code

 arch/ia64/include/asm/fb.h                | 15 +++++++--------
 arch/m68k/include/asm/fb.h                | 19 ++++++++++---------
 arch/mips/include/asm/fb.h                | 11 +++++------
 arch/powerpc/include/asm/book3s/pgtable.h | 10 ++++++++--
 arch/powerpc/include/asm/fb.h             | 13 +++++--------
 arch/powerpc/include/asm/machdep.h        | 13 ++++++-------
 arch/powerpc/include/asm/nohash/pgtable.h | 10 ++++++++--
 arch/powerpc/include/asm/pci.h            |  4 +---
 arch/powerpc/kernel/pci-common.c          |  3 +--
 arch/powerpc/mm/mem.c                     |  8 ++++----
 arch/sparc/include/asm/fb.h               | 15 +++++++++------
 arch/x86/include/asm/fb.h                 | 10 ++++++----
 arch/x86/video/fbdev.c                    | 15 ++++++++-------
 drivers/video/fbdev/core/fb_chrdev.c      |  3 ++-
 include/asm-generic/fb.h                  | 12 ++++++------
 15 files changed, 86 insertions(+), 75 deletions(-)

-- 
2.42.0

