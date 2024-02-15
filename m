Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A46856DA1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 20:24:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=n5jF2kOw;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LNYC7ovG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=n5jF2kOw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LNYC7ovG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbQ3n0Lpnz3vfN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 06:24:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=n5jF2kOw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LNYC7ovG;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=n5jF2kOw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LNYC7ovG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbQ3424JRz3dVm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 06:23:44 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9BE6E1F8C5;
	Thu, 15 Feb 2024 19:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708025015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fa6fwskS/XeiRHwRWUxIzXg8lpFOjokK1ZaMlxoJ2Js=;
	b=n5jF2kOwc96NXtoFvQ1Hkh5Mh9MbyJm7BrMp6hp76bEoK8o/S4LqzLkHiyIhIEVMNzXUFE
	Eb/Im8zINT9e1syoklSHnFRaYWvyaIZhsPI3q6pvMa3WE7L94HAIVaK48VGnnbgC4X0Bbe
	JRwG8uVPISOsNDaIPHr3Y4BTpxbFi2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708025015;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fa6fwskS/XeiRHwRWUxIzXg8lpFOjokK1ZaMlxoJ2Js=;
	b=LNYC7ovG2ARcRpqnpuw0r2PZgT8nAQqOgtZ39N0lUO4LMO3/EH/MNGCYdmsfbaUrBbyQ2M
	O+ABg1wn8TZxNiBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708025015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fa6fwskS/XeiRHwRWUxIzXg8lpFOjokK1ZaMlxoJ2Js=;
	b=n5jF2kOwc96NXtoFvQ1Hkh5Mh9MbyJm7BrMp6hp76bEoK8o/S4LqzLkHiyIhIEVMNzXUFE
	Eb/Im8zINT9e1syoklSHnFRaYWvyaIZhsPI3q6pvMa3WE7L94HAIVaK48VGnnbgC4X0Bbe
	JRwG8uVPISOsNDaIPHr3Y4BTpxbFi2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708025015;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fa6fwskS/XeiRHwRWUxIzXg8lpFOjokK1ZaMlxoJ2Js=;
	b=LNYC7ovG2ARcRpqnpuw0r2PZgT8nAQqOgtZ39N0lUO4LMO3/EH/MNGCYdmsfbaUrBbyQ2M
	O+ABg1wn8TZxNiBA==
Date: Thu, 15 Feb 2024 20:23:34 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] selftests: powerpc: Add header symlinks for building
 papr character device tests
Message-ID: <20240215192334.GT9696@kitsune.suse.cz>
References: <20240215165527.23684-1-msuchanek@suse.de>
 <87cysxilr5.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cysxilr5.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.10 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[lists.ozlabs.org,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com,vger.kernel.org];
	 BAYES_HAM(-0.00)[30.55%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.10
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
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kselftest@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 15, 2024 at 01:13:34PM -0600, Nathan Lynch wrote:
> Michal Suchanek <msuchanek@suse.de> writes:
> >
> > Without the headers the tests don't build.
> >
> > Fixes: 9118c5d32bdd ("powerpc/selftests: Add test for papr-vpd")
> > Fixes: 76b2ec3faeaa ("powerpc/selftests: Add test for papr-sysparm")
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> >  tools/testing/selftests/powerpc/include/asm/papr-miscdev.h | 1 +
> >  tools/testing/selftests/powerpc/include/asm/papr-sysparm.h | 1 +
> >  tools/testing/selftests/powerpc/include/asm/papr-vpd.h     | 1 +
> >  3 files changed, 3 insertions(+)
> >  create mode 120000 tools/testing/selftests/powerpc/include/asm/papr-miscdev.h
> >  create mode 120000 tools/testing/selftests/powerpc/include/asm/papr-sysparm.h
> >  create mode 120000
> > tools/testing/selftests/powerpc/include/asm/papr-vpd.h
> 
> I really hope making symlinks into the kernel source isn't necessary. I
> haven't experienced build failures with these tests. How are you
> building them?
> 
> I usually do something like (on a x86 build host):
> 
> $ make ARCH=powerpc CROSS_COMPILE=powerpc64le-linux- ppc64le_defconfig
> $ make ARCH=powerpc CROSS_COMPILE=powerpc64le-linux- headers
> $ make ARCH=powerpc CROSS_COMPILE=powerpc64le-linux- -C tools/testing/selftests/powerpc/
> 
> without issue.

I am not configuring the kernel, only building the tests, and certainly
not installing headers on the system.

Apparently this is what people aim to do, and report bugs when it does
not work: build the kselftests as self-contained testsuite that relies
only on standard libc, and whatever it brought in the sources.

That said, the target to install headers is headers_install, not
headers. The headers target is not documented, it's probably meant to be
internal to the build system. Yet it is not enforced that it is built
before building the selftests.

Thanks

Michal
