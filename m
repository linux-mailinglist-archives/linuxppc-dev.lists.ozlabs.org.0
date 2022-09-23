Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 783655E807F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 19:11:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYzFf1PhBz3cfG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 03:11:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=uumJiLIU;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Fngpn3ub;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=uumJiLIU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Fngpn3ub;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYzF36j8Fz3bxL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 03:10:47 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 9C334219EC;
	Fri, 23 Sep 2022 17:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1663953043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZSPBzEUu4HvvRKKrmrdU/FMS6Qx20fLyxT3yF1tghgc=;
	b=uumJiLIU2hCeUjB//pYmunQ3XhUTmH5n97IVRpx0df4OZYv5fuXBQ0xekIy4XJccvKNdf+
	ZZ2q/2pniI8zXucmq84IOe9+SqdEoZRhNamUxbx08sYZ/Rz9mhwPlaqhD1IuXjRA5vy2v5
	Iqu37b4i4NZhqLy45/3MLfqEcVgd2Os=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1663953043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZSPBzEUu4HvvRKKrmrdU/FMS6Qx20fLyxT3yF1tghgc=;
	b=Fngpn3ub5IEe7UJDgzoo8OBgYwiwTJAr8CYGfJ5/Ppmar1cb8XYsiESPKo8Bi3lpB3A8SE
	scN82gpoaRkfC7CQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id 44B9C2C15B;
	Fri, 23 Sep 2022 17:10:41 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 5.15 0/6] arm64: kexec_file: use more system keyrings to verify kernel image signature + dependencies
Date: Fri, 23 Sep 2022 19:10:28 +0200
Message-Id: <cover.1663951201.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.35.3
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Alexander Egorenkov <egorenar@linux.ibm.com>, keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Sasha Levin <sashal@kernel.org>, "open list:S390" <linux-s390@vger.kernel.org>, Coiby Xu <coxu@redhat.com>, Baoquan He <bhe@redhat.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>, "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michal Suchanek <msuchanek@suse.de>, Eric Biederman <ebiederm@xmission.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, Mimi Zohar <zohar@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "moderated list:ARM64 PORT AARCH64 ARCHITECTURE" <linux-arm-
 kernel@lists.infradead.org>, Philipp Rudo <prudo@redhat.com>, "open list:KEXEC" <kexec@lists.infradead.org>, linux-security-module@vger.kernel.org, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this is backport of commit 0d519cadf751
("arm64: kexec_file: use more system keyrings to verify kernel image signature")
to table 5.15 tree including the preparatory patches.

Some patches needed minor adjustment for context.

Thanks

Michal


Coiby Xu (3):
  kexec: clean up arch_kexec_kernel_verify_sig
  kexec, KEYS: make the code in bzImage64_verify_sig generic
  arm64: kexec_file: use more system keyrings to verify kernel image
    signature

Naveen N. Rao (2):
  kexec_file: drop weak attribute from functions
  kexec: drop weak attribute from functions

Sven Schnelle (1):
  s390/kexec_file: move kernel image size check

 arch/arm64/include/asm/kexec.h        | 20 ++++++-
 arch/arm64/kernel/kexec_image.c       | 11 +---
 arch/powerpc/include/asm/kexec.h      | 14 +++++
 arch/s390/boot/head.S                 |  2 -
 arch/s390/include/asm/kexec.h         | 14 +++++
 arch/s390/include/asm/setup.h         |  1 -
 arch/s390/kernel/machine_kexec_file.c | 17 +-----
 arch/x86/include/asm/kexec.h          | 12 ++++
 arch/x86/kernel/kexec-bzimage64.c     | 20 +------
 include/linux/kexec.h                 | 82 ++++++++++++++++++++++----
 kernel/kexec_core.c                   | 27 ---------
 kernel/kexec_file.c                   | 83 ++++++++++-----------------
 12 files changed, 163 insertions(+), 140 deletions(-)

-- 
2.35.3

