Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D755E8BF7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 13:56:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZSCh6hNMz3cfY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 21:56:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YGEJD2Fn;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nzWakO9k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YGEJD2Fn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nzWakO9k;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MZSBz23V4z3bhy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 21:55:38 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id B8C341F901;
	Sat, 24 Sep 2022 11:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1664020527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=79a8D2Ac7u6BFH11MTZyHbw/7iUCqU/F8iDUx62qwgI=;
	b=YGEJD2FnZ9chHMjXQmq8tdyuK381YZ49y8Fwu6+QAESAODmoRFO6jaBrLA+UNJOD74ZXgU
	hRqDPRKM+aBa9zhQ/rw0ACFs90S1D1jpjzgf4mysd+w97EHzqCfYBn+ncLZekTVmq7ELnj
	5l7eXJMwaYodicCd6KkAfOLiw6C7qbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1664020527;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=79a8D2Ac7u6BFH11MTZyHbw/7iUCqU/F8iDUx62qwgI=;
	b=nzWakO9kDNhf03FBvsJdphgf1O0ls25eU8ml4O7M7wQRDydBm7NdZbDWeYkgsiPNOJC78F
	Y/Fua/kXHZSDahCg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id D8EC22C16E;
	Sat, 24 Sep 2022 11:55:24 +0000 (UTC)
Date: Sat, 24 Sep 2022 13:55:23 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5.15 0/6] arm64: kexec_file: use more system keyrings to
 verify kernel image signature + dependencies
Message-ID: <20220924115523.GZ28810@kitsune.suse.cz>
References: <cover.1663951201.git.msuchanek@suse.de>
 <Yy7Ll1QJ+u+nkic9@kroah.com>
 <20220924094521.GY28810@kitsune.suse.cz>
 <Yy7YTnJKkv1UtvWF@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yy7YTnJKkv1UtvWF@kroah.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Alexander Egorenkov <egorenar@linux.ibm.com>, keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Sasha Levin <sashal@kernel.org>, "open list:S390" <linux-s390@vger.kernel.org>, Coiby Xu <coxu@redhat.com>, Baoquan He <bhe@redhat.com>, AKASHI Takahiro <takahiro.akashi@linaro.org>, "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Eric Biederman <ebiederm@xmission.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, Mimi Zohar <zohar@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)" <linux-arm-kernel@lists.infradead.org>, 
 Philipp Rudo <prudo@redhat.com>, "open list:KEXEC" <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-security-module@vger.kernel.org, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 24, 2022 at 12:13:34PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Sep 24, 2022 at 11:45:21AM +0200, Michal Suchánek wrote:
> > On Sat, Sep 24, 2022 at 11:19:19AM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Sep 23, 2022 at 07:10:28PM +0200, Michal Suchanek wrote:
> > > > Hello,
> > > > 
> > > > this is backport of commit 0d519cadf751
> > > > ("arm64: kexec_file: use more system keyrings to verify kernel image signature")
> > > > to table 5.15 tree including the preparatory patches.
> > > 
> > > This feels to me like a new feature for arm64, one that has never worked
> > > before and you are just making it feature-parity with x86, right?
> > > 
> > > Or is this a regression fix somewhere?  Why is this needed in 5.15.y and
> > > why can't people who need this new feature just use a newer kernel
> > > version (5.19?)
> > 
> > It's half-broken implementation of the kexec kernel verification. At the time
> > it was implemented for arm64 we had the platform and secondary keyrings
> > and x86 was using them but on arm64 the initial implementation ignores
> > them.
> 
> Ok, so it's something that never worked.  Adding support to get it to
> work doesn't really fall into the stable kernel rules, right?

Not sure. It was defective, not using the facilities available at the
time correctly. Which translates to kernels that can be kexec'd on x86
failing to kexec on arm64 without any explanation (signed with same key,
built for the appropriate arch).

> Again, what's wrong with 5.19 for anyone who wants this?  Who does want
> this?

Not sure, really.

The final patch was repeatedly backported to stable and failed to build
because the prerequisites were missing.

So this is a backport that includes the prerequisites for it to build.

If nobody wanted this why is it repeatedly backported generating the
failure messages?

Thanks

Michal
