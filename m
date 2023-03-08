Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4115F6B0CA4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 16:28:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWx621G4xz3ccw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 02:28:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZYmQz5nl;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Z3HWQqX4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZYmQz5nl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Z3HWQqX4;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWx524QSxz3bgT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 02:27:18 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 7F4081FE47;
	Wed,  8 Mar 2023 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678289226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGjH5COgVdP8437ejGbqbCLhP6qbEkoX1bMEbmXg6s8=;
	b=ZYmQz5nlHTN0xS9mbciT79+soTvuQE30ot9nFoBK+YhirN7CQ6VlyRudO0INMDTd4jsPr2
	AUHH4gdGUc9qeSydyeYaWujgN1rPllpTHCRwTPCTcNzj3nIp4jQ6AwZXyVzUzTQcdB92XS
	4vvChGrt0yR5g9dGPq0EXpRXmzm59zI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678289226;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGjH5COgVdP8437ejGbqbCLhP6qbEkoX1bMEbmXg6s8=;
	b=Z3HWQqX4PISkUhZTkMUt+ftG9Z2fQfTBHHQMt8QOmAXIJqJcWliSQR0gTzEe1vWIiUUFWW
	mxjCE658vsJgLIAA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id DADEE2C141;
	Wed,  8 Mar 2023 15:27:03 +0000 (UTC)
Date: Wed, 8 Mar 2023 16:27:02 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4 1/2] powerpc/mm: Support execute-only memory on the
 Radix MMU
Message-ID: <20230308152702.GR19419@kitsune.suse.cz>
References: <20220817050640.406017-1-ruscur@russell.cc>
 <166195163958.45984.15308325694886524412.b4-ty@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166195163958.45984.15308325694886524412.b4-ty@ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: ajd@linux.ibm.com, anshuman.khandual@arm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com, linux-hardening@vger.kernel.org, Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org, nicholas@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, Aug 31, 2022 at 11:13:59PM +1000, Michael Ellerman wrote:
> On Wed, 17 Aug 2022 15:06:39 +1000, Russell Currey wrote:
> > Add support for execute-only memory (XOM) for the Radix MMU by using an
> > execute-only mapping, as opposed to the RX mapping used by powerpc's
> > other MMUs.
> > 
> > The Hash MMU already supports XOM through the execute-only pkey,
> > which is a separate mechanism shared with x86.  A PROT_EXEC-only mapping
> > will map to RX, and then the pkey will be applied on top of it.
> > 
> > [...]
> 
> Applied to powerpc/next.
> 
> [1/2] powerpc/mm: Support execute-only memory on the Radix MMU
>       https://git.kernel.org/powerpc/c/395cac7752b905318ae454a8b859d4c190485510

This breaks libaio tests (on POWER9 hash PowerVM):
https://pagure.io/libaio/blob/master/f/harness/cases/5.t#_43

cases/5.p
expect   512: (w), res =   512 [Success]
expect   512: (r), res =   512 [Success]
expect   512: (r), res =   512 [Success]
expect   512: (w), res =   512 [Success]
expect   512: (w), res =   512 [Success]
expect   -14: (r), res =   -14 [Bad address]
expect   512: (r), res =   512 [Success]
expect   512: (w), res =   512 [Success]
test cases/5.t completed PASSED.

cases/5.p
expect   512: (w), res =   512 [Success]
expect   512: (r), res =   512 [Success]
expect   512: (r), res =   512 [Success]
expect   512: (w), res =   512 [Success]
expect   512: (w), res =   512 [Success]
expect   -14: (r), res =   -14 [Bad address]
expect   512: (r), res =   512 [Success]
expect   -14: (w), res =   512 [Success] -- FAILED
test cases/5.t completed FAILED.

Can you have a look if that test assumption is OK?

Thanks

Michal
