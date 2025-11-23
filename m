Return-Path: <linuxppc-dev+bounces-14429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E66AC7E0DF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Nov 2025 13:13:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dDnsw0SPZz2yvM;
	Sun, 23 Nov 2025 23:13:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763900003;
	cv=none; b=HNLEdkqxwXZAlghdt0VFEqm2EBgglExM3GxqDewVJVyVn0iBnnJlMbmyYcWZRpxIKNk4aracx47Hzxu35hGl7ng4WDreMVWTWMbV9opOe5CUYueadVn3R6Fy77QeptEkpYmcS+Q3jPlxNpGp9Tl6y91c+xMU9c+QOeD9FZcAX+4qudYob4jfEEY7RHS/xRtHApGW5BfWz8wHI/WeSUS2G+s60zLfMSXpovpv3KgooXrvKJlEsn/scuDRMQVrd+aVmXZRPzeikoaigokOTzoEmNQDWDrxM/riShhV/NeRADiT0PC/39TNN8iCnLvL5sNBNvJrG441/sD5yLDXOxkTOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763900003; c=relaxed/relaxed;
	bh=FiByvmPj4vskMAitEF2oyus7EhqWwE7+LOIfdmKxcgM=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=Sxdkb57w3oSF5OSajynn7B9Bkl1JGaNVp5kh+HGTXJOtAHJAqAjlKqznvV104KKRL8nql00YCZtvFXsu2GGaojfpA7Al3NwtxgthoEG5IJADjFE2kv1/2yXbd4fbAn+LIOh8/fds3tMgjSo3RSSIPCLdAo5C4P6RPT6k9Ip0pU5XmCH9cl9akxjHahqyYrhGDAPtGF0gnBrBJEUfJmDu7kD0T1MfDloR5srpezUaAzeMzSrnQJOrnH4LLi0B8Zcr2xwKKdEICB6IfOyS64pEQUj/ULiGYLr1xSB5frEhQtBHvjTfcZXjM/uD1XF4sYVK2DC7a63E9Rj+5D0wCyUsVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=YB7CtJNW; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=YB7CtJNW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dDnss0L62z2xSY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Nov 2025 23:13:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=FiByvmPj4vskMAitEF2oyus7EhqWwE7+LOIfdmKxcgM=; b=Y
	B7CtJNWX7Y5fdrO7Yf1Z8jmhNSOrbagvits5hHavY/HU6bNJLAeoX7WqzqMx0JQh/RcWMj97W7zSj
	ro5bNXzM9+MYOfIpNCrCJqgURkwsMg5+9dtXZ+Pv7opq+vTSd1sbdmVMeKNU5UGYi8vBriDlyYZoH
	E0ROQK5QWNAxJ+YYM0rxLecsAxCcM4SvPwczYE37WSSJLYZAaEvtcKLUjlZfmpBmesZs3p+nnlWiQ
	7e26SslRYZ121zcM1YU2VFGSOQZgrvlcnIzHp1m/GRfV0lrTrA/UUhhyTYubAvq73hRUPAwxXiRUX
	PEcPX/4ha4KT6HCMlSIN3bjvqn2tVv5RA==;
Date: Sun, 23 Nov 2025 13:13:30 +0100 (CET)
Message-Id: <20251123.131330.407910684435629198.rene@exactco.de>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os build
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
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
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Building a size optimized ppc64 kernel (-Os), gcc emits more FP
save/restore symbols, that the linker generates on demand into the
.sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
too. They are needed for the amdgpu in-kernel floating point support.

MODPOST Module.symvers
ERROR: modpost: "_restfpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_26" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savegpr1_27" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savegpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_28" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savegpr1_29" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savefpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savefpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_15" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
WARNING: modpost: suppressed 56 unresolved symbol warnings because there were too many)

Signed-off-by: René Rebe <rene@exactco.de>
---
V2: description
Theoretically for -stable, but no previous commit that broke it.
---
 scripts/mod/modpost.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 47c8aa2a6939..133dfa16308a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -602,6 +602,10 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
 		/* Special register function linked on all modules during final link of .ko */
 		if (strstarts(symname, "_restgpr0_") ||
 		    strstarts(symname, "_savegpr0_") ||
+		    strstarts(symname, "_restgpr1_") ||
+		    strstarts(symname, "_savegpr1_") ||
+		    strstarts(symname, "_restfpr_") ||
+		    strstarts(symname, "_savefpr_") ||
 		    strstarts(symname, "_restvr_") ||
 		    strstarts(symname, "_savevr_") ||
 		    strcmp(symname, ".TOC.") == 0)
-- 
2.46.0

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

