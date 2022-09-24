Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B482F5E8B63
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 12:14:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZPy30wFmz3chV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 20:14:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0Tw9HH0a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0Tw9HH0a;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MZPxP1hWQz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 20:13:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 475A7B8087F;
	Sat, 24 Sep 2022 10:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72082C433D6;
	Sat, 24 Sep 2022 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664014417;
	bh=2RR7JCSle62Ctd7cdprNFNuNTmoMwLRSHoPcjFErasY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0Tw9HH0agvwO440m5y/HJwPfr43xzzV/VsRm39t4dsn1npdKjHy/MWDuw98bFO7By
	 GjNvO3dj6iZIKCfpff0NcgYBbtzrc/OrVikuPqjLdFZ1nHLbmg7Gc2kzRXsGwJH9m9
	 O6xsyQEpCNlaEC3jkmNwX42igf+xwaYVyoGMYcLw=
Date: Sat, 24 Sep 2022 12:13:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH 5.15 0/6] arm64: kexec_file: use more system keyrings to
 verify kernel image signature + dependencies
Message-ID: <Yy7YTnJKkv1UtvWF@kroah.com>
References: <cover.1663951201.git.msuchanek@suse.de>
 <Yy7Ll1QJ+u+nkic9@kroah.com>
 <20220924094521.GY28810@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220924094521.GY28810@kitsune.suse.cz>
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

On Sat, Sep 24, 2022 at 11:45:21AM +0200, Michal Suchánek wrote:
> On Sat, Sep 24, 2022 at 11:19:19AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Sep 23, 2022 at 07:10:28PM +0200, Michal Suchanek wrote:
> > > Hello,
> > > 
> > > this is backport of commit 0d519cadf751
> > > ("arm64: kexec_file: use more system keyrings to verify kernel image signature")
> > > to table 5.15 tree including the preparatory patches.
> > 
> > This feels to me like a new feature for arm64, one that has never worked
> > before and you are just making it feature-parity with x86, right?
> > 
> > Or is this a regression fix somewhere?  Why is this needed in 5.15.y and
> > why can't people who need this new feature just use a newer kernel
> > version (5.19?)
> 
> It's half-broken implementation of the kexec kernel verification. At the time
> it was implemented for arm64 we had the platform and secondary keyrings
> and x86 was using them but on arm64 the initial implementation ignores
> them.

Ok, so it's something that never worked.  Adding support to get it to
work doesn't really fall into the stable kernel rules, right?

Again, what's wrong with 5.19 for anyone who wants this?  Who does want
this?

thanks,

greg k-h
