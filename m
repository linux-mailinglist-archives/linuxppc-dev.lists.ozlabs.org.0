Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74C95E8B18
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 11:46:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZPKY4TkYz3cDk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 19:46:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=P3Jq6HqO;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KTkOyriF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=P3Jq6HqO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KTkOyriF;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MZPJw0jpbz3bkn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 19:45:35 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id F35621F88E;
	Sat, 24 Sep 2022 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1664012729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X+31A8c9OfnUMfxPv1Vio1hLtPmcDuwGTIjcRm3tKEs=;
	b=P3Jq6HqOy5gS7m6FJDMINZyRR8CzuNUbJKkzyYtwRnM1R6DvQu2CQdR/Gu7CeEdmQQPJAw
	eikEp/i1ZBjrdwZ6P8CoMJZBKJIqkRRRCvTDJG/R09FprsSWTCkTi80jVyNXKlEHackQvb
	bvTZPj63OV+ovtHhsrQC4iiLXdkpCiU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1664012729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X+31A8c9OfnUMfxPv1Vio1hLtPmcDuwGTIjcRm3tKEs=;
	b=KTkOyriFJKJx9Ejq1tpe5tI5kJSiUXMkJzZuFFrtte0p785wK6VotBiKdeVD1Tkp8h9r2k
	0jOgM+O9oS7vA3Aw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id E91CC2C166;
	Sat, 24 Sep 2022 09:45:22 +0000 (UTC)
Date: Sat, 24 Sep 2022 11:45:21 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5.15 0/6] arm64: kexec_file: use more system keyrings to
 verify kernel image signature + dependencies
Message-ID: <20220924094521.GY28810@kitsune.suse.cz>
References: <cover.1663951201.git.msuchanek@suse.de>
 <Yy7Ll1QJ+u+nkic9@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yy7Ll1QJ+u+nkic9@kroah.com>
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

On Sat, Sep 24, 2022 at 11:19:19AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Sep 23, 2022 at 07:10:28PM +0200, Michal Suchanek wrote:
> > Hello,
> > 
> > this is backport of commit 0d519cadf751
> > ("arm64: kexec_file: use more system keyrings to verify kernel image signature")
> > to table 5.15 tree including the preparatory patches.
> 
> This feels to me like a new feature for arm64, one that has never worked
> before and you are just making it feature-parity with x86, right?
> 
> Or is this a regression fix somewhere?  Why is this needed in 5.15.y and
> why can't people who need this new feature just use a newer kernel
> version (5.19?)

It's half-broken implementation of the kexec kernel verification. At the time
it was implemented for arm64 we had the platform and secondary keyrings
and x86 was using them but on arm64 the initial implementation ignores
them.

Thanks

Michal
