Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B367B72B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 17:47:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P28rb1sq3z3cfm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 03:47:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SbMN/zr4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SbMN/zr4;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P28qd6MxWz3c8W
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 03:46:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5157EB81A96;
	Wed, 25 Jan 2023 16:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9EFC433D2;
	Wed, 25 Jan 2023 16:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674665177;
	bh=YeCOLGSvIumlcrZ7av8GvxR+/ErNvo1cXm8+M2K16/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbMN/zr4jJXDcBrQ4WyELbfAvEarnhllZNr/+74Q/d5+KDTZpgvZW6qyfG53ALtxQ
	 c609vHX1nuEwbgnCFAKswiR6tVAQfbYg6FawacXUsfHxVRwd+IEo5DCrtCOS/yJv4C
	 1etJPd65uQC0dCubcxbi5g+pnBTcQ2osaH20QTAJwX41SBdFiO21Ntca58u1mp63Ww
	 wtDeO1Qv6ABJwJkcdu67DMWD+fYrygwcGXyRQfegIRgvKEGVGcRkD301huJ/gQV7Tm
	 nNV2NsaqmkRC3W/JxiA3WktGhqq8vE8G33cBBhSv/thSUFSdULTCaR72lHJSSB+Q3s
	 gieyprWNnuwiQ==
Date: Wed, 25 Jan 2023 08:46:09 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH 2/2] powerpc/module_64: Fix "expected nop" error on
 module re-patching
Message-ID: <20230125164609.wvuarciciyoqa3tb@treble>
References: <cover.1674617130.git.jpoimboe@kernel.org>
 <2f6329ffd9674df6ff57e03edeb2ca54414770ab.1674617130.git.jpoimboe@kernel.org>
 <CAPhsuW40jEiyp0ogsO6oH_frpFCmiioSHrMOKkwGcZ8_6w5dZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPhsuW40jEiyp0ogsO6oH_frpFCmiioSHrMOKkwGcZ8_6w5dZA@mail.gmail.com>
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
Cc: live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 24, 2023 at 10:09:56PM -0800, Song Liu wrote:
> > @@ -514,9 +515,18 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
> >         if (!instr_is_relative_link_branch(ppc_inst(*prev_insn)))
> >                 return 0;
> >
> > -       if (*instruction != PPC_RAW_NOP()) {
> > +       /*
> > +        * For livepatch, the restore r2 instruction might have already been
> > +        * written previously, if the referenced symbol is in a previously
> > +        * unloaded module which is now being loaded again.  In that case, skip
> > +        * the warning and the instruction write.
> > +        */
> > +       if (insn_val == PPC_INST_LD_TOC)
> > +               return 0;
> 
> Do we need "sym->st_shndx == SHN_LIVEPATCH" here?

My original patch had that check, but I dropped it for simplicity.

In the non-livepatch case, the condition should never be true, but it
doesn't hurt to check it anyway.

-- 
Josh
