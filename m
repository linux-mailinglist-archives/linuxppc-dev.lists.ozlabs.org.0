Return-Path: <linuxppc-dev+bounces-17212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHymD6pxn2kccAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 23:03:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D0219E1A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 23:03:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLpW86sZBz3fGY;
	Thu, 26 Feb 2026 09:03:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772056996;
	cv=none; b=aY5EKOclgw2ULagnbxaeenTq74JTonUMYkliM2pMV02W4FHeIImrQ9gFJCoz7tU+tudpMX8o7VexdrzRAJaRDFNew8fpz4O83Xjk2nVs8P3BKf+XgcG6vz+JhIc0k5CbkdeLeaKelekMOdcT+YsBeaOT5ouH2N41yXhH4k2g0g7l/x3D/JR75wKzoFbdibmgdR5yI42rZatnL9RXQsxev2VX6Omj7YZ0a3M6ZOJYkoDU5ccGXXBGOVlb+vvdWZ0riDDaZ2rjeA1e+blDy/+e5WBpQh4ST9izG0NlyoFDnFZJBCHp9TXfFBjTn/RyMwZMYGnXLzxxp8pfzBTOuhvtIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772056996; c=relaxed/relaxed;
	bh=X5Uei7J6wPTaufFZfJ1QY+msf1MQQfu8WvoFcRNTGHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U/LgfGmMoXRE1G2RfAjKE+CJ0kIgAWOjCMfmjgZP7+VRzdStL0ehThZSedxFUx3cDK3ivwzBFnlkTaV8MZ+44teTvOT5J61NIltPrZyakzbB1I4F08Djlr9mXJytg5WEiPstwXV6s1q/vk/fwt+8X4BMigBRWHoZowf9IpSjHQtIe8obmU4OTDRWeQFtAFwuzJnypSAXNPLeaV6kpxNeAFYe3OIAtCjnE1Kihu4GV80oQEil+8Sl4lZ8hz2nApEn1c4LKkiIXqFtafWpyuD3hxk8VAAGhtj+lnF0ulx6idTL77PwhDqk1j96c9TAg75IOhAcXgFNiZZEDB7WRDfw2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lh2Gp07e; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lh2Gp07e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLpW63tp5z3fFx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 09:03:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B41C60053;
	Wed, 25 Feb 2026 22:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71333C116D0;
	Wed, 25 Feb 2026 22:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772056991;
	bh=gYzWYbqUVyUWAs9EGE5ShllXabtNZu/2sUv3FCUuj7w=;
	h=From:Date:Subject:To:Cc:From;
	b=Lh2Gp07eMCKl2XdNkedsqAZVkfBDWlOl2fsRxHEWE9tKv6jQh0edVVUsxDh6W5Xp/
	 cpuHLuvKro/8fpHAIcfb6xh/0YkDcRPPmsCi3vH9hoM2N/cp4Zu293fjw8x0Y3sBRt
	 xrryrjjtuF0G+GfHoJWSUPrL9Ub+h33d7ZDtN9xF5vWiBWN/Dqwh64X9F4ye8SQCek
	 kzV0xNeQjeGNvdSYha+gv6+Zs0BqrJ4PL5GFW9IS3v5kg8ppoQ0ELPzksn51X2e+bF
	 DsAPQYsTPAgDK9wa/O/d5HZiuyl/GUUOQtp0CrrKYMUtc7XQZ+nQdyI2fcEiQZeqbq
	 KLkKqVrgOPu2w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 25 Feb 2026 15:02:51 -0700
Subject: [PATCH] kbuild: Split .modinfo out from ELF_DETAILS
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-separate-modinfo-from-elf-details-v1-1-387ced6baf4b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORvoOh3MVxEPcUk1srWj6UQYe
 3erHr/L/29gklUMzs0GWV5qmmJFe2hgfFC8CypXg3e+d94f0WShTEVwTqwxJAw5zShTQJZCOhl
 y1/aO6RS6YYDaWbIEff8el+vftt6eMpZvGPb9A+qYJnaFAAAA
X-Change-ID: 20260224-separate-modinfo-from-elf-details-d3160da5f399
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Sam Creasey <sammy@sammy.net>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Stafford Horne <shorne@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-kbuild@vger.kernel.org, 
 stable@vger.kernel.org, Ed W <lists@wildgooses.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11544; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gYzWYbqUVyUWAs9EGE5ShllXabtNZu/2sUv3FCUuj7w=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJnzCyeriCZdaxI+5Sf0rTM57l6D0sWGw+sO7C6JuqWuV
 lv08cGpjhIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjAR9SKG75EsPLMZNsz8+2PX
 foVJdy5bdNqZ6l3jFRDMuD/jsMiKLoa/Andbtyi/Z/w0p6XQ5urDDXN8jKJenk+u2/pZubeWW6q
 QDwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,kernel.org,arm.com,xen0n.name,linux-m68k.org,sammy.net,alpha.franken.de,southpole.se,saunalahti.fi,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,arndb.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org,wildgooses.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17212-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:vgupta@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:guoren@kernel.org,m:bcain@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:geert@linux-m68k.org,m:sammy@sammy.net,m:tsbogend@alpha.franken.de,m:dinguyen@kernel.org,m:jonas@southpole.se,m:stefan.kristiansson@saunalahti.fi,m:shorne@gmail.com,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:ysato@users.sourceforge.jp,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.or
 g,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:kees@kernel.org,m:arnd@arndb.de,m:masahiroy@kernel.org,m:legion@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-kbuild@vger.kernel.org,m:stable@vger.kernel.org,m:lists@wildgooses.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[72];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 90D0219E1A0
X-Rspamd-Action: no action

Commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
vmlinux.unstripped") added .modinfo to ELF_DETAILS while removing it
from DISCARDS, as it was needed in vmlinux.unstripped and ELF_DETAILS
was present in all architecture specific vmlinux linker scripts. While
this shuffle is fine for vmlinux, ELF_DETAILS and DISCARDS may be used
by other linker scripts, such as the s390 and x86 compressed boot
images, which may not expect to have a modinfo section. In certain
circumstances, this could result in a bootloader failing to load the
compressed kernel [1].

Commit ddc6cbef3ef1 ("s390/boot/vmlinux.lds.S: Ensure bzImage ends with
SecureBoot trailer") recently addressed this for the s390 bzImage but
the same bug remains for parisc and x86. The presence of .modinfo in the
x86 bzImage was the root cause of the issue workad around with
commit d50f21091358 ("kbuild: align modinfo section for Secureboot
Authenticode EDK2 compat"). misc.c in arch/x86/boot/compressed includes
lib/decompress_unzstd.c, which in turn includes lib/xxhash.c and its
MODULE_LICENSE / MODULE_DESCRIPTION macros due to the STATIC definition.

Split .modinfo out from ELF_DETAILS into its own macro and handle it in
all vmlinux linker scripts. Discard .modinfo in the places where it was
previously being discarded from being in DISCARDS, as it has never been
necessary in those uses.

Cc: stable@vger.kernel.org
Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
Reported-by: Ed W <lists@wildgooses.com>
Closes: https://lore.kernel.org/587f25e0-a80e-46a5-9f01-87cb40cfa377@wildgooses.com/ [1]
Tested-by: Ed W <lists@wildgooses.com> # x86_64
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I intend to take this as a fix via the Kbuild tree for 7.0 after
sufficient testing in -next, please Ack accordingly.
---
 arch/alpha/kernel/vmlinux.lds.S           | 1 +
 arch/arc/kernel/vmlinux.lds.S             | 1 +
 arch/arm64/kernel/vmlinux.lds.S           | 1 +
 arch/csky/kernel/vmlinux.lds.S            | 1 +
 arch/hexagon/kernel/vmlinux.lds.S         | 1 +
 arch/loongarch/kernel/vmlinux.lds.S       | 1 +
 arch/m68k/kernel/vmlinux-nommu.lds        | 1 +
 arch/m68k/kernel/vmlinux-std.lds          | 1 +
 arch/m68k/kernel/vmlinux-sun3.lds         | 1 +
 arch/mips/kernel/vmlinux.lds.S            | 1 +
 arch/nios2/kernel/vmlinux.lds.S           | 1 +
 arch/openrisc/kernel/vmlinux.lds.S        | 1 +
 arch/parisc/boot/compressed/vmlinux.lds.S | 1 +
 arch/parisc/kernel/vmlinux.lds.S          | 1 +
 arch/powerpc/kernel/vmlinux.lds.S         | 1 +
 arch/riscv/kernel/vmlinux.lds.S           | 1 +
 arch/s390/kernel/vmlinux.lds.S            | 1 +
 arch/sh/kernel/vmlinux.lds.S              | 1 +
 arch/sparc/kernel/vmlinux.lds.S           | 1 +
 arch/um/kernel/dyn.lds.S                  | 1 +
 arch/um/kernel/uml.lds.S                  | 1 +
 arch/x86/boot/compressed/vmlinux.lds.S    | 2 +-
 arch/x86/kernel/vmlinux.lds.S             | 1 +
 include/asm-generic/vmlinux.lds.h         | 4 +++-
 24 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index 2efa7dfc798a..2d136c63db16 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -71,6 +71,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/arch/arc/kernel/vmlinux.lds.S b/arch/arc/kernel/vmlinux.lds.S
index 61a1b2b96e1d..6af63084ff28 100644
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -123,6 +123,7 @@ SECTIONS
 	_end = . ;
 
 	STABS_DEBUG
+	MODINFO
 	ELF_DETAILS
 	DISCARDS
 
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index ad6133b89e7a..2964aad0362e 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -349,6 +349,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	HEAD_SYMBOLS
diff --git a/arch/csky/kernel/vmlinux.lds.S b/arch/csky/kernel/vmlinux.lds.S
index d718961786d2..81943981b3af 100644
--- a/arch/csky/kernel/vmlinux.lds.S
+++ b/arch/csky/kernel/vmlinux.lds.S
@@ -109,6 +109,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/arch/hexagon/kernel/vmlinux.lds.S b/arch/hexagon/kernel/vmlinux.lds.S
index 1150b77fa281..aae22283b5e0 100644
--- a/arch/hexagon/kernel/vmlinux.lds.S
+++ b/arch/hexagon/kernel/vmlinux.lds.S
@@ -62,6 +62,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 	.hexagon.attributes 0 : { *(.hexagon.attributes) }
 
diff --git a/arch/loongarch/kernel/vmlinux.lds.S b/arch/loongarch/kernel/vmlinux.lds.S
index 08ea921cdec1..d0e1377a041d 100644
--- a/arch/loongarch/kernel/vmlinux.lds.S
+++ b/arch/loongarch/kernel/vmlinux.lds.S
@@ -147,6 +147,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 #ifdef CONFIG_EFI_STUB
diff --git a/arch/m68k/kernel/vmlinux-nommu.lds b/arch/m68k/kernel/vmlinux-nommu.lds
index 2624fc18c131..45d7f4b0177b 100644
--- a/arch/m68k/kernel/vmlinux-nommu.lds
+++ b/arch/m68k/kernel/vmlinux-nommu.lds
@@ -85,6 +85,7 @@ SECTIONS {
 	_end = .;
 
 	STABS_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	/* Sections to be discarded */
diff --git a/arch/m68k/kernel/vmlinux-std.lds b/arch/m68k/kernel/vmlinux-std.lds
index 1ccdd04ae462..7326586afe15 100644
--- a/arch/m68k/kernel/vmlinux-std.lds
+++ b/arch/m68k/kernel/vmlinux-std.lds
@@ -58,6 +58,7 @@ SECTIONS
   _end = . ;
 
   STABS_DEBUG
+  MODINFO
   ELF_DETAILS
 
   /* Sections to be discarded */
diff --git a/arch/m68k/kernel/vmlinux-sun3.lds b/arch/m68k/kernel/vmlinux-sun3.lds
index f13ddcc2af5c..1b19fef201fb 100644
--- a/arch/m68k/kernel/vmlinux-sun3.lds
+++ b/arch/m68k/kernel/vmlinux-sun3.lds
@@ -51,6 +51,7 @@ __init_begin = .;
   _end = . ;
 
   STABS_DEBUG
+  MODINFO
   ELF_DETAILS
 
   /* Sections to be discarded */
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 2b708fac8d2c..579b2cc1995a 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -217,6 +217,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	/* These must appear regardless of  .  */
diff --git a/arch/nios2/kernel/vmlinux.lds.S b/arch/nios2/kernel/vmlinux.lds.S
index 37b958055064..206f92445bfa 100644
--- a/arch/nios2/kernel/vmlinux.lds.S
+++ b/arch/nios2/kernel/vmlinux.lds.S
@@ -57,6 +57,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/arch/openrisc/kernel/vmlinux.lds.S b/arch/openrisc/kernel/vmlinux.lds.S
index 049bff45f612..9b29c3211774 100644
--- a/arch/openrisc/kernel/vmlinux.lds.S
+++ b/arch/openrisc/kernel/vmlinux.lds.S
@@ -101,6 +101,7 @@ SECTIONS
 	/* Throw in the debugging sections */
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
         /* Sections to be discarded -- must be last */
diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S b/arch/parisc/boot/compressed/vmlinux.lds.S
index ab7b43990857..87d24cc824b6 100644
--- a/arch/parisc/boot/compressed/vmlinux.lds.S
+++ b/arch/parisc/boot/compressed/vmlinux.lds.S
@@ -90,6 +90,7 @@ SECTIONS
 	/* Sections to be discarded */
 	DISCARDS
 	/DISCARD/ : {
+		*(.modinfo)
 #ifdef CONFIG_64BIT
 		/* temporary hack until binutils is fixed to not emit these
 		 * for static binaries
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index b445e47903cf..0ca93d6d7235 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -165,6 +165,7 @@ SECTIONS
 	_end = . ;
 
 	STABS_DEBUG
+	MODINFO
 	ELF_DETAILS
 	.note 0 : { *(.note) }
 
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 15850296c0a9..8fc11d6565bf 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -397,6 +397,7 @@ SECTIONS
 	_end = . ;
 
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 61bd5ba6680a..997f9eb3b22b 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -170,6 +170,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 	.riscv.attributes 0 : { *(.riscv.attributes) }
 
diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index 53bcbb91bb9b..2b62395e35bf 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -221,6 +221,7 @@ SECTIONS
 	/* Debugging sections.	*/
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	/*
diff --git a/arch/sh/kernel/vmlinux.lds.S b/arch/sh/kernel/vmlinux.lds.S
index 008c30289eaa..169c63fb3c1d 100644
--- a/arch/sh/kernel/vmlinux.lds.S
+++ b/arch/sh/kernel/vmlinux.lds.S
@@ -89,6 +89,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/arch/sparc/kernel/vmlinux.lds.S b/arch/sparc/kernel/vmlinux.lds.S
index f1b86eb30340..7ea510d9b42f 100644
--- a/arch/sparc/kernel/vmlinux.lds.S
+++ b/arch/sparc/kernel/vmlinux.lds.S
@@ -191,6 +191,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/arch/um/kernel/dyn.lds.S b/arch/um/kernel/dyn.lds.S
index a36b7918a011..ad3cefeff2ac 100644
--- a/arch/um/kernel/dyn.lds.S
+++ b/arch/um/kernel/dyn.lds.S
@@ -172,6 +172,7 @@ SECTIONS
 
   STABS_DEBUG
   DWARF_DEBUG
+  MODINFO
   ELF_DETAILS
 
   DISCARDS
diff --git a/arch/um/kernel/uml.lds.S b/arch/um/kernel/uml.lds.S
index a409d4b66114..30aa24348d60 100644
--- a/arch/um/kernel/uml.lds.S
+++ b/arch/um/kernel/uml.lds.S
@@ -113,6 +113,7 @@ SECTIONS
 
   STABS_DEBUG
   DWARF_DEBUG
+  MODINFO
   ELF_DETAILS
 
   DISCARDS
diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
index 587ce3e7c504..e0b152715d9c 100644
--- a/arch/x86/boot/compressed/vmlinux.lds.S
+++ b/arch/x86/boot/compressed/vmlinux.lds.S
@@ -88,7 +88,7 @@ SECTIONS
 	/DISCARD/ : {
 		*(.dynamic) *(.dynsym) *(.dynstr) *(.dynbss)
 		*(.hash) *(.gnu.hash)
-		*(.note.*)
+		*(.note.*) *(.modinfo)
 	}
 
 	.got.plt (INFO) : {
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 3a24a3fc55f5..4711a35e706c 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -427,6 +427,7 @@ SECTIONS
 	.llvm_bb_addr_map : { *(.llvm_bb_addr_map) }
 #endif
 
+	MODINFO
 	ELF_DETAILS
 
 	DISCARDS
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index eeb070f330bd..1e1580febe4b 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -848,12 +848,14 @@
 
 /* Required sections not related to debugging. */
 #define ELF_DETAILS							\
-		.modinfo : { *(.modinfo) . = ALIGN(8); }		\
 		.comment 0 : { *(.comment) }				\
 		.symtab 0 : { *(.symtab) }				\
 		.strtab 0 : { *(.strtab) }				\
 		.shstrtab 0 : { *(.shstrtab) }
 
+#define MODINFO								\
+		.modinfo : { *(.modinfo) . = ALIGN(8); }
+
 #ifdef CONFIG_GENERIC_BUG
 #define BUG_TABLE							\
 	. = ALIGN(8);							\

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-separate-modinfo-from-elf-details-d3160da5f399

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


