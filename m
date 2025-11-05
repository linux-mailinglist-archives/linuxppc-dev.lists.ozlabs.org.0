Return-Path: <linuxppc-dev+bounces-13771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AC8C338FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 01:56:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1Rhv0Ghpz2yr2;
	Wed,  5 Nov 2025 11:56:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762304174;
	cv=none; b=M3JNqIc0XPfcL0/1KSWT31uUVCbezU0EyR65TTDxbazm1pz8NT7jrpu6L4FO6CruQCUxBuSvMY7cM53BczArq8NCrtEcino5n39FLCtXYFAo7G4RzCbZMMwZIlB6kgrpy3nRuJ+E5HB2pGE5n7kjmXFkcSOPs7BBlspAquCA3E2y7tBJA829Ky6etsE3BQQfqbH4NusvI3qTxVHRRK/Ok70ZWAesr8RN6RE17fX0GKmcd1UFgVeL5scEeIc/jLzYam6A66RdyPN6h7MFiib2u4oQXQfgagLx/ZCjggu32v4QHx4fB69y8y5UX70qtKeo2GMJrIhZ+tcpTHaiBiu4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762304174; c=relaxed/relaxed;
	bh=CMps5D/U5zs/rOw7MoP/fF/eizTbKMw9tNqh4wbRSps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7n7yGjEabiujTe0gw9VXbiHSX6ly/ErTK7HjF5FMRuZvkmWukXz6uTnnqTlP+NpgUjdUM0tUuMaS7j6tELQqWDEIjaaL+fCKHXijPyj0YE+3kF3z+iIsZoZrXOYONrm5rGJNVeQw+mIsSiAo4+ATGDpFqSTqiIP2/7UFbUm3HGbPUOoo71tArYVmYfh0dOhx7fKYu/7GEhV5MPIlR6NtVx3OMAIzLW+3A1IiA46PFXMGj+66oJWQcUS+e1v/JOYs8oJFDz0bdNjJxBwoTZfD07z8b2e4jodBnwWedTMLnnBkfcUEDKxOloNq1FrutnxhW1Q64lNlyAGRddaAUOg1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HitUVvu9; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HitUVvu9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1Rhs0qW2z2yjq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 11:56:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9047A6020D;
	Wed,  5 Nov 2025 00:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AFDC116B1;
	Wed,  5 Nov 2025 00:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762304169;
	bh=Bvm2Nhl2+r7royt5yqzJsom1ydwfu9ptstfPqK7iPMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HitUVvu9wiVErxtr0ah4QUG+vMFNYwwqaDx1QJqR4bhbUWDJ9S1hTYO9+AylLAzeF
	 5PkDCpNRx+cagT0xUtJYIjCra1JnthcghCtelhFwJwUnx1qMnO1dSVaQ08ClWuzdyG
	 6lvhGTf1DhHYXM1c/ZKmQqTl4nNlXNBYyuP72OQJLgEZithy1tEv3tJNN9VDtjOE8F
	 iLMP9evJPksFuF9IjeJvOzwlLmQ79aOtU12ZPqNC3MeUGKn64G59xeS+dDX8Lflu2p
	 f8GzQhWdxc0UIDOFC8p0DiPGWlQq2HCzK4fbLvphwox5M8SqqZ+SLPSSDmR60K7OoH
	 Yj2ElC/Ug3g1g==
Date: Tue, 4 Nov 2025 17:56:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Omar Sandoval <osandov@osandov.com>
Cc: Samir M <samir@linux.ibm.com>, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, dimitri.ledkov@surgut.co.uk,
	stable@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Alexey Gladkov <legion@kernel.org>, linux-debuggers@vger.kernel.org
Subject: Re: [mainline]Error while running make modules_install command
Message-ID: <20251105005603.GA769905@ax162>
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

+ Nicolas and Alexey, just as an FYI.

Top of thread is:

https://lore.kernel.org/7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com/

On Tue, Nov 04, 2025 at 04:54:38PM +0530, Venkat Rao Bagalkote wrote:
> IBM CI has also reported this error.
> 
> 
> Error:
> 
> 
> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> prefix
>   INSTALL /boot
> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> prefix
> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> prefix
> 
> 
> Git bisect is pointing to below commit as first bad commit.
> 
> 
> d50f21091358b2b29dc06c2061106cdb0f030d03 is the first bad commit
> commit d50f21091358b2b29dc06c2061106cdb0f030d03
> Author: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
> Date:   Sun Oct 26 20:21:00 2025 +0000
> 
>     kbuild: align modinfo section for Secureboot Authenticode EDK2 compat

Thank you for the bisect. I can reproduce this with at least kmod 29.1,
which is the version I can see failing in drgn's CI from Ubuntu Jammy
(but I did not see it with kmod 34, which is the latest version in Arch
Linux at the moment).

Could you and Omar verify if the following diff resolves the error for
you? I think this would allow us to keep Dimitri's fix for the
Authenticode EDK2 calculation (i.e., the alignment) while keeping kmod
happy. builtin.modules.modinfo is the same after this diff as it was
before Dimitri's change for me.

Cheers,
Nathan

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index ced4379550d7..c3f135350d7e 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -102,11 +102,23 @@ vmlinux: vmlinux.unstripped FORCE
 # modules.builtin.modinfo
 # ---------------------------------------------------------------------------
 
+# .modinfo in vmlinux is aligned to 8 bytes for compatibility with tools that
+# expect sufficiently aligned sections but the additional NULL bytes used for
+# padding to satisfy this requirement break certain versions of kmod with
+#
+#   depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix
+#
+# Strip the trailing padding bytes after extracting the .modinfo sections to
+# comply with what kmod expects to parse.
+quiet_cmd_modules_builtin_modinfo = GEN     $@
+      cmd_modules_builtin_modinfo = $(cmd_objcopy); \
+                                    sed -i 's/\x00\+$$/\x00/g' $@
+
 OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
 
 targets += modules.builtin.modinfo
 modules.builtin.modinfo: vmlinux.unstripped FORCE
-	$(call if_changed,objcopy)
+	$(call if_changed,modules_builtin_modinfo)
 
 # modules.builtin
 # ---------------------------------------------------------------------------

