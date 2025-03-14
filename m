Return-Path: <linuxppc-dev+bounces-7047-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E40DFA60D34
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 10:25:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDf9c49B6z3cYG;
	Fri, 14 Mar 2025 20:25:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741944340;
	cv=none; b=SFpajZXpvIdM9dxCmxvY03d3BKViJAXqTfUVsv3tTh9oZLoNt0tgP8veq1hHjkosAYWS4nXlqNbkGxygdEkFxC5hEK8z5VS9pQp0EvAf2oec9qBu0T536M22LkM5oZeH6ZUcYz4a8exegkTAHjqB/hZ1iF7D8ut9Pb9erqb1LjTUIW/8Dono92scEgP6hn6dOhXRyLESTnxYizvObMuXlvjwdUUa88bwsVuwQSN4o5nqjP4QZUcygdLBHfGB8wzJv9s72xjs+UJRIsCEgx9Tggge4goQOCxsFZFfWTFhI8l5w61g/gBmox1QSZ6086r2+TT68H05BEakCJ3t6lSllg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741944340; c=relaxed/relaxed;
	bh=tmaj98J/fxkfgoUEV6gT/fCczi5L/Uyg0IXGLFH63V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ec00iuRfecgLPz/3hN04jLJ9jB49LTNYlzlf7JGNY/5xpFKqs9KWIQJvUbs66qimNprlHWr8Cw0rAFnDSNXVFb48w8EUmOQiqBJQM6r+GtkYJrroRnPk0QHpDSfdiTPFikAVNwnIQgN45FEojsiW/ImMuElUvIeNkBYI/1VQqdiS3sStuF4jzM7RKdzpjUJqEGKDn2hCvbcGug2gN1nwkyuoBLnQzdOx4026YffimROB3gCrYJzZ7o7hNlnE3lTILmdNrLhNUI4Er3OxGRG1VKa/EwMueYJREW+X5KqmCfkL02EPChNy2qPyRBRrrVqTz35mPx6oUcy5hWySz4n79A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b9kg9Eou; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=t7mxcR2c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b9kg9Eou; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=t7mxcR2c; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b9kg9Eou;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=t7mxcR2c;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b9kg9Eou;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=t7mxcR2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDf9b26c8z3cWc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 20:25:39 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	by smtp-out2.suse.de (Postfix) with ESMTP id E4D6D1F388;
	Fri, 14 Mar 2025 09:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741944336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmaj98J/fxkfgoUEV6gT/fCczi5L/Uyg0IXGLFH63V0=;
	b=b9kg9Eou7sCDQ/zMFDOXv2H8frkSr3cznK8uO1q2nlfJ1MgNxEMIbULLgTEF/eRko5Uvnv
	OQEF3kV9QxJcUihfWAjzyHHtsgeD7MSdAmF+HPkt9ZMXRHE9J+13AtLPFO8ILNvlbwMAh0
	gsr2QI9XLrCao3MIBWnUjjX8eV1Ue0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741944336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmaj98J/fxkfgoUEV6gT/fCczi5L/Uyg0IXGLFH63V0=;
	b=t7mxcR2c1iON3DvFhhP1If79mdaLUE48gbYj39tjy2K4g2QGidh1bGc08oHM2aGlOa1EVw
	j13KQvs+dBPrNlBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741944336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmaj98J/fxkfgoUEV6gT/fCczi5L/Uyg0IXGLFH63V0=;
	b=b9kg9Eou7sCDQ/zMFDOXv2H8frkSr3cznK8uO1q2nlfJ1MgNxEMIbULLgTEF/eRko5Uvnv
	OQEF3kV9QxJcUihfWAjzyHHtsgeD7MSdAmF+HPkt9ZMXRHE9J+13AtLPFO8ILNvlbwMAh0
	gsr2QI9XLrCao3MIBWnUjjX8eV1Ue0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741944336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tmaj98J/fxkfgoUEV6gT/fCczi5L/Uyg0IXGLFH63V0=;
	b=t7mxcR2c1iON3DvFhhP1If79mdaLUE48gbYj39tjy2K4g2QGidh1bGc08oHM2aGlOa1EVw
	j13KQvs+dBPrNlBA==
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michal Suchanek <msuchanek@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org,
	"Nysal Jan K.A." <nysal@linux.ibm.com>
Subject: [PATCH v2] powerpc/boot: Fix build with gcc 15
Date: Fri, 14 Mar 2025 10:25:23 +0100
Message-ID: <20250314092528.15506-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <Z86liwlwP5WvrEkw@kitsune.suse.cz>
References: <Z86liwlwP5WvrEkw@kitsune.suse.cz>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,fjasle.eu,google.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Similar to x86 the ppc boot code does not build with GCC 15.

Copy the fix from
commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v2: Move the fix outside of ifdef to apply to all subarchitectures
---
 arch/powerpc/boot/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 1ff6ad4f6cd2..210c60d3d4cc 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -32,6 +32,8 @@ else
     BOOTAR := $(AR)
 endif
 
+BOOTTARGETFLAGS	+= -std=gnu11
+
 ifdef CONFIG_PPC64_BOOT_WRAPPER
 BOOTTARGETFLAGS	+= -m64
 BOOTTARGETFLAGS	+= -mabi=elfv2
-- 
2.47.1


