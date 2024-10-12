Return-Path: <linuxppc-dev+bounces-2155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB7199B551
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 16:09:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQljr0TC3z2yVb;
	Sun, 13 Oct 2024 01:09:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728742175;
	cv=none; b=KZ97NfzBZBLXHjwzh7YSOcSLYi++2tDdsYDvyTBrkTT5CG0uViYqAcyKqebKsXfa57t08DMa1np/CZSE4fzZ7MFLmjjahZUQfO3U9PN5svDrjBGB2H64Ulo/zegKElbmVu5H58LVW86/sp6+OOGFGc5Jrzg3GcnJ6wG2MtNJijHOHP0gNLB/tb0PVIoUh22kRkZPWkvp7WqWc++MuuNKOho5l/6X5Da5kDwSvaNGChtTEbpVwY/m5Fht85cD7LzMEggidhjiBCGIHnLjRpxA8t5sVy5bEPhWjsCxSuxXqL8fIdgx502tblhv0GHK30XZhQzcipULxUVZKC4OsQRV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728742175; c=relaxed/relaxed;
	bh=Cc9/p7ZMHIFR66pVbkffYpA2yy8MTp4mlXKR3LiOyL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ag60edxQ+u+Dfz7tYGSPCjN3mCrndrVd4y0fqfjqTHMmnS1aF4ixN2f8pEM7gDSmHLjTxW+sHJeE94occE4QVOpxJOoXfuEjlOXCS536rRV61CPK5Nh9b061TacsePDGK8aDcq6SSVOe9zzmpDlNy2Jt4bT3pugGCi3jwyaQ6GxNT3SgMnU3ZKlC67ERSFEuNEkKJzh17kClbD0nPlEf8PqSlo/JTr/XLBuy+QqCS8OCM11aU/e/p69Scjm2WDDwL3L/vnXSKDNuHoOg8q4qzwRabF4PgSVG2hYuaiz+fHtfPdod8j/1PMI9Zn9ncVi1smggpsrg8jQRL5jnOwwYmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FMV0VHn9; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FMV0VHn9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQljq0H4Gz2yVM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 01:09:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFE085C568E;
	Sat, 12 Oct 2024 14:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB64C4CEC6;
	Sat, 12 Oct 2024 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728742171;
	bh=wMgYhYIMjjNRl184Mdw+L/pEncvHcF5jFugwVz5XqwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FMV0VHn9gnJJRvyTHgnU1zLmy8Gb78WMLXE8ltGtJnUspQ1+lhho1hWiKYeTffQRe
	 BAL6YSfFU3t89evENRPO2bbh7qo3tFGW6Qg4VBLmQkYRZtbFpqAorczxT7Yqd0mYAw
	 L85+Ux6DQltkzFssPnghDC/mOFaM0SVEtW+WaLPhZRQ94w46MZcokr2Pk+I0p7Z4V9
	 p8LIOe98I2myMGgyY2EePCx9gQwM7DlRrzZyWvhn/WQ+uZOjAdKmMtwsQChDCDhAJu
	 7SWA5w4KlphTYnk3MTWx16rMpERR0jJc3hvh4fK6HPihQ8hQcDJkNQVueUzuHLFSCu
	 H8TVgwYlG0zVw==
Date: Sat, 12 Oct 2024 09:09:23 -0500
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Message-ID: <20241012140923.kl2evqb6aue2pzfs@treble>
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Oct 12, 2024 at 09:48:57AM +0100, Andrew Cooper wrote:
> On 12/10/2024 5:09 am, Josh Poimboeuf wrote:
> > For x86-64, the barrier_nospec() in copy_from_user() is overkill and
> > painfully slow.  Instead, use pointer masking to force the user pointer
> > to a non-kernel value even in speculative paths.
> >
> > Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> 
> You do realise mask_user_address() is unsafe under speculation on AMD
> systems?
> 
> Had the mask_user_address() patch been put for review, this feedback
> would have been given then.
> 
> 
> AMD needs to arrange for bit 47 (bit 58 with LA57) to be the one
> saturated by shifting, not bit 63.

Ok... why?

-- 
Josh

