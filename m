Return-Path: <linuxppc-dev+bounces-6800-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F3EA56395
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 10:21:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8LPh556Bz3btk;
	Fri,  7 Mar 2025 20:21:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741339272;
	cv=none; b=DAoAJ5sQYkt8Qv3JWCydbZO/MlEG3MOCsD1pkCuzcH30tUkMa2ccvtoKNBsRxoMUbSP5B18rLJQQxeKE9xBmjN3dmiZEPj80uW6AnEoZmg4IZMlKq9bpp5hWQzDr3oVeV9md0JpStOsU+cjEu/FcOZhCt9rlt+h2X8n1qjnMCriE1OVOCAjcZOBsaJiPHbQiwnh3xvfiW9jvtejLS0WNQQsdT3FQ1Z38SCNhCJOviTmfMZlV0i4XUJT4yYgqqoDpIcSlmiBWMLRzzuAvqVTPLWaERqe9QusXZhl/zmMwV3AhqleTxiEjYB37R53NMV8GmIesd2UhJPi6DEqVNh1JBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741339272; c=relaxed/relaxed;
	bh=kqxqcPqwKkwzQqSoeNGsuK4t8y7YgkAyzT+CFhOL+Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P/MyfYI9AFSdrisCmlXU5tZR+Oxo33Nss/8P3bGtaf25ADs2Ll8IsJz88VudwOx820DVeQIEiw7vVI1Ly5XCOVDfDk+XjNIHDi9IYMTtt8u6fKSreBjoFdUd2Rr/oQxWppf4jHAOHwpMm36XEzyG+Ko2UG1LV8gIe8vD78qr25WmOXswxLlaa9ZeMjDCh0g0jl6pYKZiVAjUiv5PwBKAOEKafeflyh0/nuyqxvXeCx/hvI8fS8n0C0DPkL+vEkuRbPQ2Tk/NWWLYQK8nzWA1k/aR+/il6vXkXHpVLAiIBASnnpc2XNXilQgxYzD7opq6PYC+eflpbws6WDiJaSzXcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1dwYROUq; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8poSsgS5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1dwYROUq; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8poSsgS5; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1dwYROUq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8poSsgS5;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1dwYROUq;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8poSsgS5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8LPd5fl5z2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 20:21:09 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	by smtp-out1.suse.de (Postfix) with ESMTP id 2AADC21197;
	Fri,  7 Mar 2025 09:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741339262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kqxqcPqwKkwzQqSoeNGsuK4t8y7YgkAyzT+CFhOL+Xw=;
	b=1dwYROUq+tvV2eJNdDehJTD3S8Mg8iIqQHJ3ioPN3AVogznUpSCpO6ZtH+oWL066noalfX
	xg+qa+17RdjGoPBv2Pls58PMi7cK/6MQdyAFSNLRZoZ/IFL7DWvg5WSXUFX0vxTrStjWE1
	/P0J1aTftRCxUhkU7SRASBcnmS+sqHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741339262;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kqxqcPqwKkwzQqSoeNGsuK4t8y7YgkAyzT+CFhOL+Xw=;
	b=8poSsgS5heeqVir9dYeGzPbKeDduyiKEb0mhfyqn3tEnpjtzE2cIw5cYlsY95p9/fWLD3D
	Wkoh/BSRAoPrgRBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741339262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kqxqcPqwKkwzQqSoeNGsuK4t8y7YgkAyzT+CFhOL+Xw=;
	b=1dwYROUq+tvV2eJNdDehJTD3S8Mg8iIqQHJ3ioPN3AVogznUpSCpO6ZtH+oWL066noalfX
	xg+qa+17RdjGoPBv2Pls58PMi7cK/6MQdyAFSNLRZoZ/IFL7DWvg5WSXUFX0vxTrStjWE1
	/P0J1aTftRCxUhkU7SRASBcnmS+sqHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741339262;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kqxqcPqwKkwzQqSoeNGsuK4t8y7YgkAyzT+CFhOL+Xw=;
	b=8poSsgS5heeqVir9dYeGzPbKeDduyiKEb0mhfyqn3tEnpjtzE2cIw5cYlsY95p9/fWLD3D
	Wkoh/BSRAoPrgRBw==
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michal Suchanek <msuchanek@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/boot: Fix build with gcc 15
Date: Fri,  7 Mar 2025 10:20:52 +0100
Message-ID: <20250307092055.21986-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.47.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,fjasle.eu,google.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Similar to x86 the ppc boot code does not build with GCC 15.

Copy the fix from
commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/boot/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 1ff6ad4f6cd2..e6b35699c049 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -33,6 +33,7 @@ else
 endif
 
 ifdef CONFIG_PPC64_BOOT_WRAPPER
+BOOTTARGETFLAGS	+= -std=gnu11
 BOOTTARGETFLAGS	+= -m64
 BOOTTARGETFLAGS	+= -mabi=elfv2
 ifdef CONFIG_PPC64_ELF_ABI_V2
-- 
2.47.1


