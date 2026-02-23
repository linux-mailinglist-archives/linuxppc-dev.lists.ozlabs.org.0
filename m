Return-Path: <linuxppc-dev+bounces-17068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIRLAEqmnGklJwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 20:11:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FC417C0F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 20:11:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKVnJ3hWkz30FD;
	Tue, 24 Feb 2026 06:11:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771873860;
	cv=none; b=VrTm1MPhC261EdtC82pH+4zx+Rj7A5KUU4cYvcGUFqcD8u+gyR2L+YhawAP6IgpAMB2d/Pt+nGUOFgKgMWRHBJucx9ISp7gc8pngpG35qMNS+FGWbsIGuBSWWErKPUiY4GFbkiHxic+KedPf3rvp13JLDzB6vtPZ5rBH2qVcAkkPW+ayJRYIywug0DPt2jN8XXlwTGMGK1X5w1LTrQZzwjx++CUeISYSo+bqtH8SX5bG03SpXL8p6lmbnhwSRrsltvo446FVUVmNk4Jfcod/HfdRQLV3PkGll6rBIYvQNQN2G6ZLTqI1HZiMT4eCMmlkxAFF8IIWDBigsWCFSXFrYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771873860; c=relaxed/relaxed;
	bh=sGcZneDFcdfwURBJr7w0EZkJUKWDffeIZC2cPyZtn9M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ne5kYuOm6TeojbwUpVYUvSbvkZt+V4LzgxAejV1IBbDRyJRsRx2JvtwFvCcyE5J+DUUz1CfXJjN2NhSIytDeDNtS3UWCYJ0KFEnG5sDutjb1A+bqhN0y84DBL0wpS8tmmRltWZcfR+IbzXJnfg67FJbqCJKtDdu0BQrIyvb3tIPLQFge+4zzA87N+M2dpY/ogly1ORlXCED3xXbjcqq9fPRslDSooBhGjvqt8d14X3lm6gdwnPBrHs+c1WzqshaM+QFPQfZVrmKDSHiKqXZKe5CuUD1+LMePqxuy7+bssB1xH79QvhubmaHQy+eH/r79IbYrLsYXYXoaG6e2I9TF8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W7lb9mvt; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W7lb9mvt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKVnH4HPnz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 06:10:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 611A84457F;
	Mon, 23 Feb 2026 19:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55F7C2BCAF;
	Mon, 23 Feb 2026 19:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771873857;
	bh=lEKimZnEjne2BNdsm8RfAwEFAB1/q1VUQbalmtODD1Q=;
	h=From:Subject:Date:To:Cc:From;
	b=W7lb9mvt8Ss7DIDpVVbHvo8HG9uV2RHrY5VNGVfhxu/bODlNHPOMU8AHU7cyge+Yt
	 iRloWl9TfRuTMAM2B+UtspS3O6ZXW8kKmkvGes8uLVlEMNdiU2xt3fqmoiVtIi1Cod
	 SarcI/AdLtw17TCwEFJVDqDlJoLVMkEcAdtk4srZiwFRO4xHP50LbwxcaP0hEea+z4
	 RQpOuIRuHl6d6iyM1gY+9wf/r1WTKKzhKqKQITVCr+YsLeL7dTY8wNVJ/jbAXYxUvW
	 G8FCGINS88O6kG4fIPtGvpELH4y3kmpwj/vyFTEAcpNbcJGdv8VyHGqk/ExuZxYFDL
	 2gl/lR3828f7g==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] kbuild: Switch from '-fms-extensions' to
 '-fms-anonymous-structs' when available
Date: Mon, 23 Feb 2026 12:10:27 -0700
Message-Id: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDtgIwbxKqWLGCc6gknJJNIi3
 t1Ul2/x/w5CkUmgr3aItLFw8AXPRwV2Nn4i5LEYVK10rVSDbhU0PvjfGrKgpJhtEnTajKRtN7R
 GQ2k/kRx/r+/rfVvysJBN/xkcxwnoIdTAeQAAAA==
X-Change-ID: 20260223-fms-anonymous-structs-f6ade6c8b5a6
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-efi@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2594; i=nathan@kernel.org;
 h=from:subject:message-id; bh=lEKimZnEjne2BNdsm8RfAwEFAB1/q1VUQbalmtODD1Q=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlzllkKpdb9/H8vK1IjjHf1par1+w9qXs5/w91Rs6jo7
 o0KpXUhHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiR+IYGR7dj3Mv9tp9XOzY
 T6tjbKzOTUe/79vdcuXP9qw297/fahUZ/qec2K/kXJAvNPuxK8fqb9Jb/zLOkuXmujS3dH7QXL9
 tnWwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17068-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:torvalds@linux-foundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:
 lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,arm.com,kernel.org,xen0n.name,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,linaro.org,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 61FC417C0F0
X-Rspamd-Action: no action

Hi all,

The kernel enabled '-fms-extensions' in commit c4781dc3d1cf ("Kbuild:
enable -fms-extensions") in 6.19 to gain access to a Microsoft
(originally Plan 9) extension around including a tagged structure/union
anonymously in an other structure/union. Since then, Clang 23.0.0
(current main) has added a flag to enable only that extension, rather
than all Microsoft extensions, '-fms-anonymous-structs' [1]. Using this
narrower compiler option would have avoided the build error fixed by
commit a6773e6932cb ("jfs: Rename _inline to avoid conflict with clang's
'-fms-extensions'"). While these errors are not expected to be common,
using the narrower option when available has no drawbacks because the
kernel only cares about this extension in '-fms-extensions', no others.
While this could result in build errors for folks using
'-fms-anonymous-structs' if a developer uses another extension in
'-fms-extensions' (either intentionally or unintentionally), flagging
these uses for further scrutiny seems worthwhile.

This series converts the build system to use that flag when it is
available. The first patch consolidates all of the C dialect flags into
a single variable to make future updates to the dialect flags less
painful, as updating the logic in every place that uses their custom
built C flags is getting cumbersome (and C23 is looming). The second
patch makes the actual switch.

I would like Nicolas to carry this in the Kbuild tree for 7.1, please
provide Acks as necessary.

[1]: https://github.com/llvm/llvm-project/commit/c391efe6fb67329d8e2fd231692cc6b0ea902956

---
Nathan Chancellor (2):
      kbuild: Consolidate C dialect options
      kbuild: Use '-fms-anonymous-structs' if it is available

 Makefile                              | 16 ++++++++++++----
 arch/arm64/kernel/vdso32/Makefile     |  3 +--
 arch/loongarch/vdso/Makefile          |  2 +-
 arch/parisc/boot/compressed/Makefile  |  2 +-
 arch/powerpc/boot/Makefile            |  3 +--
 arch/s390/Makefile                    |  3 +--
 arch/s390/purgatory/Makefile          |  3 +--
 arch/x86/Makefile                     |  6 +-----
 arch/x86/boot/compressed/Makefile     |  6 +-----
 drivers/firmware/efi/libstub/Makefile |  3 +--
 init/Kconfig                          |  5 +++++
 scripts/Makefile.warn                 |  5 -----
 12 files changed, 26 insertions(+), 31 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-fms-anonymous-structs-f6ade6c8b5a6

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


