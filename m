Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E43856DB8A3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 05:45:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pth305xzqz3fY6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 13:45:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kmragcoo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pth262cBjz3cHX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 13:44:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kmragcoo;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pth252BKxz4xD8;
	Sat,  8 Apr 2023 13:44:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680925485;
	bh=So3KNEobg4Li+f42EP4bnx22M4396Gfc3W0rtTFWCKs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kmragcooXWfNzJy2iLsUOC00kEHNqEdL4leKz0+exJiHeGAbQsdlxOsRqeReuw5+s
	 m1rw0+UzvKZpYtgplpcRqOEQ7o7BmZbIOehBdnMG3KOWi7UA+q/CClxeFuFMCzOMHe
	 A+6ZGvJK7qKfaabo3+gMyRdanBTMc0/unUPrgTICqZK1orD54fr9/SWL424K61yW7F
	 SacVxIQdaOljwIqZrvQwvka6wxDI4Ol1W7kH5GXdUvlniwW/7VpZLdesw9kjJT5dr9
	 yYL2t80m4B4NnB0J6+OCBT/OLcXXwq+zLR8mu4RsbMnLxtTZirmBBAI4e2BZ/1n71T
	 CZKkwCQWzhPIQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/boot: Fix crt0.S current address branch form
In-Reply-To: <20230407040924.231023-1-npiggin@gmail.com>
References: <20230407040924.231023-1-npiggin@gmail.com>
Date: Sat, 08 Apr 2023 13:44:44 +1000
Message-ID: <875ya7javn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Use the preferred form of branch-and-link for finding the current
> address so objtool doesn't think it is an unannotated intra-function
> call.

We don't run objtool on this code in mainline AFAIK. Because BOOTAS
doesn't call it.

Did you actually see a warning, or are you just anticipating that it
would warn about it?

This diff would run it on boot asm and seems to build OK, so maybe we
should do that.

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 08071bac056d..5d3a4c5354d7 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -223,7 +223,7 @@ quiet_cmd_bootcc = BOOTCC  $@
       cmd_bootcc = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTCFLAGS) -c -o $@ $<
 
 quiet_cmd_bootas = BOOTAS  $@
-      cmd_bootas = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTAFLAGS) -c -o $@ $<
+      cmd_bootas = $(BOOTCC) -Wp,-MD,$(depfile) $(BOOTAFLAGS) -c -o $@ $< $(cmd_objtool)
 
 quiet_cmd_bootar = BOOTAR  $@
       cmd_bootar = $(BOOTAR) $(BOOTARFLAGS) $@.$$$$ $(real-prereqs); mv $@.$$$$ $@


cheers
