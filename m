Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E0373977C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 08:32:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c4admOdf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmrCG2RpZz3bfS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 16:32:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c4admOdf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmrBN2Ns6z2xrW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 16:31:56 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3C426176C;
	Thu, 22 Jun 2023 06:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D074C433C8;
	Thu, 22 Jun 2023 06:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687415509;
	bh=8I3kJ3yOV1l9VHYXSTomQCnY9vroIhrMd3w0kNO1mok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c4admOdfTJlntgfqiYhEbR+hYmU1RQkqVn3vkCG8qxpgca6Vu3XNiT2wZaSMSJ8jc
	 im7uujX9ssnfnP/0KagDOeLDuQmYKE/fcaVBCzVifC21TMCT4mdjp1CPA7oAwlscn9
	 0pmlZ8AZtu9DNJfaKHdyesgXuhkLkL6Ck4NVzYs+o5KfZVkp+RnJzr2OJYvAF9zrZ6
	 dlFkIdUEtlsuE1BfNHC9GavOTCKpnGTJxzhmS20EsBGyI1TyArcdPLTOwdJz373DV3
	 6TwWzxM2DEP6aXcBJUb7t/SWbAhWAhuA3MaZ33f6497ZobQKof4mmspk7ODUkw0vyd
	 JOA5z/W9a5kbw==
Date: Wed, 21 Jun 2023 23:31:47 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] objtool: Make 'sec-address' always on
Message-ID: <20230622063147.wpd4nxvludjjk2qa@treble>
References: <e7e1de1d01194df3ff4053cb0815fc2ddba33213.1687360711.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e7e1de1d01194df3ff4053cb0815fc2ddba33213.1687360711.git.christophe.leroy@csgroup.eu>
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 21, 2023 at 05:20:31PM +0200, Christophe Leroy wrote:
> Most of the time objtool warnings are useless without the
> absolute address within the section.
> 
> Today there is --sec-address option to get it printed, but
> that option is nowhere used and requires a change in Makefile
> to use it.
> 
> Having the address inside the section at all time in addition
> to the address within the object doesn't hurt and will help.
> 
> Remove the --sec-address option and print it at all time.

This option actually feels like clutter to me.  The func+offset format
works fine, combined with scripts like objdump-func and faddr2line.  And
we also have a new OBJTOOL_VERBOSE=1 option which auto-disassembles the
affected function.

On x86 we've been using func+offset for console stack traces for many
years, due to KASLR.  So maybe we're just more used to it.  But the
scripts make it fine.

Also it helps with identifying the same warning across different
configs/compilers.

-- 
Josh
