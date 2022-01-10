Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 993DA489ACC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 14:50:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXZwP42pMz30LJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 00:50:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Cxi4DKWB;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=M5mR11XF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Cxi4DKWB; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=M5mR11XF; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXZvk0GZrz2yNr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 00:50:09 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 3CFF81F395;
 Mon, 10 Jan 2022 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641822606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dsFwmuk0CX7ltVsRVZVwGSb46zqyAdrIjBZaVQwQYsw=;
 b=Cxi4DKWB9qWnepRS9zf3XEXXuVPiwup7TAHvK+JLUGGtm0BerCUq/suWnWzntdzQYGF3vp
 4A7gSVRUNwFiTa0Pn5a/y453sqAHJcRcsarbauzov8BOEh8AuFd4prI5YG3MIQrHAareCG
 45Ry/WuimBqKLNFDp47Y0yZLBSubD2M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641822606;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dsFwmuk0CX7ltVsRVZVwGSb46zqyAdrIjBZaVQwQYsw=;
 b=M5mR11XFV1E1tlCtH8DkYBxALX63UOfVbEIwxOyXJ/UNwj3kNqIG/LUHUFY+E3Z4bsllSl
 CmTHDgKRABSaB6AQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 by relay2.suse.de (Postfix) with ESMTP id 28230A3B83;
 Mon, 10 Jan 2022 13:50:03 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org
Subject: [PATCH v4 0/6] KEXEC_SIG with appended signature
Date: Mon, 10 Jan 2022 14:49:52 +0100
Message-Id: <cover.1641822505.git.msuchanek@suse.de>
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Michal Suchanek <msuchanek@suse.de>, "Serge E. Hallyn" <serge@hallyn.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 linux-security-module@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

This is a refresh of the KEXEC_SIG series.

This adds KEXEC_SIG support on powerpc and deduplicates the code dealing
with appended signatures in the kernel.

powerpc supports IMA_KEXEC but that's an exception rather than the norm.
On the other hand, KEXEC_SIG is portable across platforms.

For distributions to have uniform security features across platforms one
option should be used on all platforms.

Thanks

Michal

Previous revision: https://lore.kernel.org/linuxppc-dev/cover.1637862358.git.msuchanek@suse.de/
Patched kernel tree: https://github.com/hramrach/kernel/tree/kexec_sig

Michal Suchanek (6):
  s390/kexec_file: Don't opencode appended signature check.
  powerpc/kexec_file: Add KEXEC_SIG support.
  kexec_file: Don't opencode appended signature verification.
  module: strip the signature marker in the verification function.
  module: Use key_being_used_for for log messages in
    verify_appended_signature
  module: Move duplicate mod_check_sig users code to mod_parse_sig

 arch/powerpc/Kconfig                     | 16 +++++++
 arch/powerpc/kexec/elf_64.c              | 12 +++++
 arch/s390/Kconfig                        |  2 +-
 arch/s390/kernel/machine_kexec_file.c    | 41 +----------------
 crypto/asymmetric_keys/asymmetric_type.c |  1 +
 include/linux/module_signature.h         |  1 +
 include/linux/verification.h             |  5 +++
 kernel/module-internal.h                 |  2 -
 kernel/module.c                          | 12 +++--
 kernel/module_signature.c                | 56 +++++++++++++++++++++++-
 kernel/module_signing.c                  | 34 +++++++-------
 security/integrity/ima/ima_modsig.c      | 22 ++--------
 12 files changed, 116 insertions(+), 88 deletions(-)

-- 
2.31.1

