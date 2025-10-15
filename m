Return-Path: <linuxppc-dev+bounces-12931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F78BE02C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 20:28:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cn02B3n9Yz3dT1;
	Thu, 16 Oct 2025 05:28:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760552882;
	cv=none; b=YSXQcq7/Sr2Kcf7W06nhf2nOoYHRx+aApPbtRKBIeXG3SQ6TEBBwfUUMj5k4GJvBhe8G6AESXA2K2tylv/UvFfQx7hEGryfT7Z2j673jsaR9q09Xqs5LueGLOVzLmjKp37CN4DvWixGuVQJuzKxiHadJdedA0tRBqKMDqfZGZp5MFffphCp/iKur5dmYGdNpCr0KQU2OOlE/uSQtXMMEerYCU8dkyldg2VIOIdat3JCPondmML49KpOj6a6G8oU6OSyCMOfrM4Vz7KQ1ke9CDsSWLTIGTQPQ5j8pAyX0b7bozFXqryPNxZor7fNiswe+sZTpCVq8zmb1WhOkO6xCFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760552882; c=relaxed/relaxed;
	bh=UT1DXpH6stHZzpuLlVt523N6/w2vc+6EjpAG1UNrdqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQ2gcKEl8wShNU3ipI+q7+UaWa6y7OZOzFp+XtokfTkqQAbtTBXlYvNKPn7yXYy6crIQAfrrj4zIWngechjWBZFXHH6Pf9c7Ej9ujYk1Et1mF/tDUgFBFqTSV3RMadZfYslBHVTKWbUopFUZSmd+vz3rBx01CSlCKDIcEsUG7OoT65XbLAuf1WL6TfEfxRhUFpje8axPsr2BPbxkZRBQ3jgNpSgmxQt4aPBWY4a8kvqWnwO3bqI67G7VEq710s6sJRubRbIpLRCW8hPl/o4b5ZM4YG4Otc/Ft0ihWX9JChRUqOoe8Ab7U1MSa6O03Uu3tEAHX0E6RkNpnWtcXW16jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tvsXYo3t; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tvsXYo3t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cn0294Bp1z3dLN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 05:28:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C495F405B2;
	Wed, 15 Oct 2025 18:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D958C4CEF8;
	Wed, 15 Oct 2025 18:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760552878;
	bh=rySxjUJGg5L0aeZfKHHZ0liCV/P4tKXtl04chJYFmac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvsXYo3tNsSSd1Bz9TDhzLY1SF60Zj/zoVNkVcI9gooMMrugG/vEvL3ZQmZVTEddb
	 nphzg6XcABe8gl9eMhGNC9/aJsyz/wBDpNJC4SO8A0glFGnAv2L7JiZjy/Ov/6xHZW
	 3dJj5m5opzwG6VWnATLPfb1MiUBPb3rK2LDLMJtNeGqPj8JwvuMiw1Bipx7KdVgnCT
	 1meUG04vCBWam7Q+YQwf5nBrmvoBDhqvUyz1I1cPVqRwo4hodMQqTj3AEfpFqiBFfn
	 /Qk6cX7PKw1xUqzQPEVJaAYtMFkPlKvrENokbCFdql3cXXcBT7z8hn2RtAarg90WOZ
	 19Efg6D7mTxyg==
Date: Wed, 15 Oct 2025 11:27:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, maddy@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [PATCH] arch/powerpc: Remove .interp section in vmlinux
Message-ID: <20251015182754.GA1055324@ax162>
References: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>
 <20251013040148.560439-1-vishalc@linux.ibm.com>
 <2b4a3215-1620-40c9-a00c-ca833ebbb7b6@csgroup.eu>
 <aOypxKMzsLR5tAtv@linux.ibm.com>
 <20251015002154.GA2300901@ax162>
 <aO8XEhMdT19UOPlp@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO8XEhMdT19UOPlp@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 15, 2025 at 09:07:54AM +0530, Vishal Chourasia wrote:
> Hello Nathan,
> 
> On Tue, Oct 14, 2025 at 05:21:54PM -0700, Nathan Chancellor wrote:
> > In this bug report, you mention using LLVM=1. Does the issue happen if
> > you use GNU ld (ld.bfd) via LD (i.e., LD=powerpc64le-linux-gnu-ld or
> > equivalent) over ld.lld from LLVM=1? This sounds more likely to be a
> > linker difference rather than a compiler difference.
> 
> Thank you for the insight.
> 
> Yes, when using powerpc64le-linux-gnu-ld linker .interp section is not
> emitted.
> 
> Command:
> $ make LLVM=1 ARCH=powerpc LD=powerpc64le-linux-gnu-ld -j 8 zImage
> $ llvm-readelf -p .comment vmlinux
> 
> String dump of section '.comment':
> [     0] clang version 22.0.0git (https://github.com/llvm/llvm-project.git 7314565281ec28b745502c3f429fd431e16673eb)
> 
> $ llvm-readelf -p .interp vmlinux                                                                                    
> llvm-readelf: warning: 'vmlinux': could not find section '.interp'

Thanks for confirming. Does this fix the issue for you? It appears to
work for me.

Cheers,
Nathan

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index de6ee7d35cff..15850296c0a9 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -330,7 +330,6 @@ SECTIONS
 	}
 	.hash : AT(ADDR(.hash) - LOAD_OFFSET) { *(.hash) }
 	.gnu.hash : AT(ADDR(.gnu.hash) - LOAD_OFFSET) { *(.gnu.hash) }
-	.interp : AT(ADDR(.interp) - LOAD_OFFSET) { *(.interp) }
 	.rela.dyn : AT(ADDR(.rela.dyn) - LOAD_OFFSET)
 	{
 		__rela_dyn_start = .;

