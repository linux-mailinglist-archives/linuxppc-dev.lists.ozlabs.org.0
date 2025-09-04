Return-Path: <linuxppc-dev+bounces-11745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD29CB44228
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 18:05:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHkpl2SyTz2yqf;
	Fri,  5 Sep 2025 02:05:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757001935;
	cv=none; b=RKJidsaM78h5BmDWVwoNkaipKL62gDkZEMDDkDQpP5Iy5Q7lC/P1cnXlggqj2N5lqjlxnmhlzPQcOaCEvXDRDCcm4LK9yjxGNgKxY4hhYzgci9Rjlt3RCxNhMdcZ9tdwYCLzqzb3czXbdAEqZEWlvhFZPRQ1A4ELtqujPncEzSihrXLaymUS1l+7IC3idR9YmWWM0v+gHaTGS0Rgso/31+5F3RpqvtDXMY2uXWrbWCZDnzYUqHgf5f9SKLhjfiPM3Xa76V0H3NOkx4HGSo0qARZEWbsFV0h9NneR1WvnAJTVPc+DbrkOWXkCRbh8mfxB6CwpsJO8OSCgV03Ymucnnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757001935; c=relaxed/relaxed;
	bh=j2e0miqXew5D1VJ555opZkdtW/8Qcdh1lziwULBNyaU=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=LlFcd6n6pH+rQ5fwkTZwAOvvgcuWRcFF/pid55zpW0IrErUQsZbqy2/ABkRmDTrwWm8wGZn+kbTyCiFzmvagRmCClyoqMgrHYEih/BzDAWODC2IFifWw/Rn8Tacw9QzJvOU9Sq0Qj1pX5dAIA11lXlSt7WiIUlKoo5s3Gdo/qXqWMKL4voXxLVARKO5sO1wcz3HW91Z0ZFmQ2PCd+AqisahUX3G1fVQ2uacA1FYS3lpxBO1VkF6v7m2jLwmdQyLDw+IqiPEZuqBqeYRJMcGXzoAR2dx1ovDGtLdp0cvbtnVtsVpR+Vc6Rz3DA1WHFn7+D9/ETPn4Np+EzbFzOvZJMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KVb4tOL7; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KVb4tOL7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHkpj5YPNz2xnv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 02:05:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BFE160210;
	Thu,  4 Sep 2025 16:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2DCC4CEF0;
	Thu,  4 Sep 2025 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757001930;
	bh=KItJqmznUE+2fwit9FzSceRDNxXt6o5PC13rQTzH+sE=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=KVb4tOL7+Z0dmSuT6e82G+YINUMIFIfTd/CC0/DWPIB1ig2LAmiajZ9Eg+t0PGjZE
	 /WQZzDJyWnv2/SKpGa7f5KsRwZn7AW6VtnfUhogX70Cq6XZrKTuYVKoYPgXqImwf3u
	 ijdj1M4dZQZc0RzHrs70/rCG73GN2jeGp5SsNopw=
Subject: Patch "powerpc: boot: Remove leading zero in label in udelay()" has been added to the 5.4-stable tree
To: christophe.leroy@csgroup.eu,gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org,maddy@linux.ibm.com,mpe@ellerman.id.au,nathan@kernel.org,npiggin@gmail.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 04 Sep 2025 18:05:27 +0200
In-Reply-To: <20250903211158.2844032-1-nathan@kernel.org>
Message-ID: <2025090427-coeditor-widow-8e8f@gregkh>
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
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-Spam-Status: No, score=2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SORTED_RECIPS,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


This is a note to let you know that I've just added the patch titled

    powerpc: boot: Remove leading zero in label in udelay()

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-boot-remove-leading-zero-in-label-in-udelay.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Thu Sep  4 18:03:41 2025
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed,  3 Sep 2025 14:11:58 -0700
Subject: powerpc: boot: Remove leading zero in label in udelay()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Nathan Chancellor <nathan@kernel.org>
Message-ID: <20250903211158.2844032-1-nathan@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

When building powerpc configurations in linux-5.4.y with binutils 2.43
or newer, there is an assembler error in arch/powerpc/boot/util.S:

  arch/powerpc/boot/util.S: Assembler messages:
  arch/powerpc/boot/util.S:44: Error: junk at end of line, first unrecognized character is `0'
  arch/powerpc/boot/util.S:49: Error: syntax error; found `b', expected `,'
  arch/powerpc/boot/util.S:49: Error: junk at end of line: `b'

binutils 2.43 contains stricter parsing of certain labels [1], namely
that leading zeros are no longer allowed. The GNU assembler
documentation already somewhat forbade this construct:

  To define a local label, write a label of the form 'N:' (where N
  represents any non-negative integer).

Eliminate the leading zero in the label to fix the syntax error. This is
only needed in linux-5.4.y because commit 8b14e1dff067 ("powerpc: Remove
support for PowerPC 601") removed this code altogether in 5.10.

Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=226749d5a6ff0d5c607d6428d6c81e1e7e7a994b [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/boot/util.S |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/powerpc/boot/util.S
+++ b/arch/powerpc/boot/util.S
@@ -41,12 +41,12 @@ udelay:
 	srwi	r4,r4,16
 	cmpwi	0,r4,1		/* 601 ? */
 	bne	.Ludelay_not_601
-00:	li	r0,86	/* Instructions / microsecond? */
+0:	li	r0,86	/* Instructions / microsecond? */
 	mtctr	r0
 10:	addi	r0,r0,0 /* NOP */
 	bdnz	10b
 	subic.	r3,r3,1
-	bne	00b
+	bne	0b
 	blr
 
 .Ludelay_not_601:


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-5.4/powerpc-boot-remove-leading-zero-in-label-in-udelay.patch

