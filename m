Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79630856F95
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 22:51:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tVtTbNfR;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tZPljd1N;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tVtTbNfR;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tZPljd1N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbTKb2xBRz3vYn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 08:51:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tVtTbNfR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tZPljd1N;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tVtTbNfR;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tZPljd1N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 17714 seconds by postgrey-1.37 at boromir; Fri, 16 Feb 2024 08:50:50 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbTJp3s1Rz3c2C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 08:50:50 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 783AF22056;
	Thu, 15 Feb 2024 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708033846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O8vOtgPGN8KarkiUSv9tkZ442Q2uoVcZR5ZzpfSk2J8=;
	b=tVtTbNfR2gczusynP3FlmOwd3jeTBTgFpYvLQmDBfMTSPJZp3ZkG00DUmCUiu0uqDnmEam
	LSS1TMaWG6sCFGMQE6fCJ6PQazrirE1OOWFXStFWtjLSkaRL6Sv8NZhQWasf6F/xT/MomH
	dWFbxePSmV2QzHqyWg/gcyqEDg9uKNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708033846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O8vOtgPGN8KarkiUSv9tkZ442Q2uoVcZR5ZzpfSk2J8=;
	b=tZPljd1Noigoc3Od96osNrNXdRHbvlLZVShmeKIkUZNFxC7btrFqgx22IlzlgevnemIoGe
	Fmy65eCgTECw8jCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708033846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O8vOtgPGN8KarkiUSv9tkZ442Q2uoVcZR5ZzpfSk2J8=;
	b=tVtTbNfR2gczusynP3FlmOwd3jeTBTgFpYvLQmDBfMTSPJZp3ZkG00DUmCUiu0uqDnmEam
	LSS1TMaWG6sCFGMQE6fCJ6PQazrirE1OOWFXStFWtjLSkaRL6Sv8NZhQWasf6F/xT/MomH
	dWFbxePSmV2QzHqyWg/gcyqEDg9uKNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708033846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O8vOtgPGN8KarkiUSv9tkZ442Q2uoVcZR5ZzpfSk2J8=;
	b=tZPljd1Noigoc3Od96osNrNXdRHbvlLZVShmeKIkUZNFxC7btrFqgx22IlzlgevnemIoGe
	Fmy65eCgTECw8jCw==
Date: Thu, 15 Feb 2024 22:50:45 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] selftests: powerpc: Add header symlinks for building
 papr character device tests
Message-ID: <20240215215045.GU9696@kitsune.suse.cz>
References: <20240215165527.23684-1-msuchanek@suse.de>
 <87cysxilr5.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <20240215192334.GT9696@kitsune.suse.cz>
 <87a5o1ikk0.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a5o1ikk0.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-3.10 / 50.00];
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
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.10
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

On Thu, Feb 15, 2024 at 01:39:27PM -0600, Nathan Lynch wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> > On Thu, Feb 15, 2024 at 01:13:34PM -0600, Nathan Lynch wrote:
> >> Michal Suchanek <msuchanek@suse.de> writes:
> >> >
> >> > Without the headers the tests don't build.
> >> >
> >> > Fixes: 9118c5d32bdd ("powerpc/selftests: Add test for papr-vpd")
> >> > Fixes: 76b2ec3faeaa ("powerpc/selftests: Add test for papr-sysparm")
> >> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> >> > ---
> >> >  tools/testing/selftests/powerpc/include/asm/papr-miscdev.h | 1 +
> >> >  tools/testing/selftests/powerpc/include/asm/papr-sysparm.h | 1 +
> >> >  tools/testing/selftests/powerpc/include/asm/papr-vpd.h     | 1 +
> >> >  3 files changed, 3 insertions(+)
> >> >  create mode 120000 tools/testing/selftests/powerpc/include/asm/papr-miscdev.h
> >> >  create mode 120000 tools/testing/selftests/powerpc/include/asm/papr-sysparm.h
> >> >  create mode 120000
> >> > tools/testing/selftests/powerpc/include/asm/papr-vpd.h
> >> 
> >> I really hope making symlinks into the kernel source isn't necessary. I
> >> haven't experienced build failures with these tests. How are you
> >> building them?
> >> 
> >> I usually do something like (on a x86 build host):
> >> 
> >> $ make ARCH=powerpc CROSS_COMPILE=powerpc64le-linux- ppc64le_defconfig
> >> $ make ARCH=powerpc CROSS_COMPILE=powerpc64le-linux- headers
> >> $ make ARCH=powerpc CROSS_COMPILE=powerpc64le-linux- -C tools/testing/selftests/powerpc/
> >> 
> >> without issue.
> >
> > I am not configuring the kernel, only building the tests, and certainly
> > not installing headers on the system.
> 
> OK, but again: how do you provoke the build errors, exactly? Don't make
> us guess please.

cd tools/testing/selftests/powerpc/

make -k

> > Apparently this is what people aim to do, and report bugs when it does
> > not work: build the kselftests as self-contained testsuite that relies
> > only on standard libc, and whatever it brought in the sources.
> >
> > That said, the target to install headers is headers_install, not
> > headers. The headers target is not documented, it's probably meant to be
> > internal to the build system. Yet it is not enforced that it is built
> > before building the selftests.
> 
> <shrug> the headers target is used in Documentation/dev-tools/kselftest.rst:
> 
> """
> To build the tests::
> 
>   $ make headers
>   $ make -C tools/testing/selftests
> """

Indeed so it's not supposed to work otherwise. It would be nice if it
did but might be difficult to achieve with plain makefiles.

'headers' is not in 'make help' output but whatever.

Thanks

Michal
