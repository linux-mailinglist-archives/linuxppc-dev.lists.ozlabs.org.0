Return-Path: <linuxppc-dev+bounces-8149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54502AA0D1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 15:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn11H0CtSz3bgw;
	Tue, 29 Apr 2025 23:11:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745932306;
	cv=none; b=FhFiZ3YVOf+JcHqHM1uavmgUBOZ0SjVtv2PjM/BsVbjsAQHgJIbc8jyB3Wk+epRSVKpW8waBUTHl828cRxtBjubXmkmsUNWivs62kgfD4YqsZR/xheKBtDc6hzfX3knS71/oPHScmgFrgD2GC4SVZoYnvLl1jSNa9qZbcQxRmZ57YikgwAmgPMPT03DPDmY+ai7uLCwl+2+BJZSihEHRPLm/8EjQ8QrRGU78d3KbdFS54iD+2iHriYxH4NswBVlAVcYKKSOlWTdJvxzqXAjAClgwpygiOXjmGRqQuTE1Lx2TITjvfPE2V/HIGmF386vOUlC+ulBiZMulMAUIFp3TGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745932306; c=relaxed/relaxed;
	bh=JIT3OVdj+I/feDJ7MIZzHLsKy8BpbSltNl8ZAReeByk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNt5QdYC2KYWb/MCtfDjbmOKRMhRNxYQC56S1oEs4YwPbqJPzMcbunKeniMmQFBjACx3zSjjci4Cz8uzaR6vxBa4sGAk1s3str26TQPwF1ITJzBoaOGjEmqNXK/8+Jo6q2rGnOHMHXncZYwE1y4v/ztA4kF5hZF27Mi0IMint5UkjWahLJPQEZ0VFHM4T/Ozqy4ilxWYtGRPw+CLXTVDpgruC0b9tdvvCsgj0uc+6qUGXvoV1F40sY8xFrqWmuB4XBpAB0QG/z67LfCeYAKywyTtUWtDL4h4uN50Bip2qACgZi1iPEE7rx/1nCdCMpc1q+KpL32RYdB72YUJMGLBhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=VYryOxdF; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=VYryOxdF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn11G1JS9z2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 23:11:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745931874;
	bh=T0fD62G5Xd9JAdE1vJEHi+5qJb4+xZfzKULQbTpVsYY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VYryOxdFWiuicUrPjgyis2zuZL8HUMkxBtaWkvPWWMgwx6fNX77ASJjeDFDpfyYHw
	 KlP9XfRkBQRLrRP6PSNRiZKXU1e4Esjb2A29aFuLPFeS3riZO9QVkA9NNt7hZLeydC
	 NcnvAzHlpyrHYLn4kkg+67KDunNeKerUN6ll+XQs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 29 Apr 2025 15:04:31 +0200
Subject: [PATCH v3 4/9] kbuild: generate module BTF based on
 vmlinux.unstripped
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
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-module-hashes-v3-4-00e9258def9e@weissschuh.net>
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
In-Reply-To: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: =?utf-8?q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
 Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>, 
 kpcyrd <kpcyrd@archlinux.org>, Christian Heusel <christian@heusel.eu>, 
 =?utf-8?q?C=C3=A2ju_Mihai-Drosi?= <mcaju95@gmail.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931873; l=1584;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=T0fD62G5Xd9JAdE1vJEHi+5qJb4+xZfzKULQbTpVsYY=;
 b=6lIaRg6590Hj4acqj1sln00p80ejNkYdhE8fd1gi5gYjFoau00uJEyqPoFekX25gQwNDezEKu
 qEQc0ld+MXaAAf2/mWACbl7TSFfJDcOGbkpMK55cb7w/QH1GfpEOqS8
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The upcoming module hashes functionality will build the modules in
between the generation of the BTF data and the final link of vmlinux.
At this point vmlinux is not yet built and therefore can't be used for
module BTF generation. vmlinux.unstripped however is usable and
sufficient for BTF generation.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 scripts/Makefile.modfinal | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 5d01b553ec9a4565c8e5a6edd05665c409003bc1..527f6b27baff9db94d31c15447de445a05bc0634 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -36,11 +36,11 @@ quiet_cmd_ld_ko_o = LD [M]  $@
 
 quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
-	if [ ! -f $(objtree)/vmlinux ]; then				\
-		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
+	if [ ! -f $(objtree)/vmlinux.unstripped ]; then			\
+		printf "Skipping BTF generation for %s due to unavailability of vmlinux.unstripped\n" $@ 1>&2; \
 	else								\
-		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) $(MODULE_PAHOLE_FLAGS) --btf_base $(objtree)/vmlinux $@; \
-		$(RESOLVE_BTFIDS) -b $(objtree)/vmlinux $@;		\
+		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) $(MODULE_PAHOLE_FLAGS) --btf_base $(objtree)/vmlinux.unstripped $@; \
+		$(RESOLVE_BTFIDS) -b $(objtree)/vmlinux.unstripped $@;		\
 	fi;
 
 # Same as newer-prereqs, but allows to exclude specified extra dependencies

-- 
2.49.0


