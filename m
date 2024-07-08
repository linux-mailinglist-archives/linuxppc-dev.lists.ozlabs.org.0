Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C45792A878
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 19:53:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHsDp5C4Hz3dRD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 03:53:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHsDR0jdGz30VY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 03:53:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 984B2CE0EAA;
	Mon,  8 Jul 2024 17:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD02C116B1;
	Mon,  8 Jul 2024 17:53:20 +0000 (UTC)
Date: Mon, 8 Jul 2024 18:53:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Szabolcs Nagy <szabolcs.nagy@arm.com>
Subject: Re: [PATCH v4 17/29] arm64: implement PKEYS support
Message-ID: <ZownjvHbPI1anfpM@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-18-joey.gouly@arm.com>
 <ZlnlQ/avUAuSum5R@arm.com>
 <20240531152138.GA1805682@e124191.cambridge.arm.com>
 <Zln6ckvyktar8r0n@arm.com>
 <87a5jj4rhw.fsf@oldenburg.str.redhat.com>
 <ZnBNd51hVlaPTvn8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnBNd51hVlaPTvn8@arm.com>
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
Cc: dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, Florian Weimer <fweimer@redhat.com>, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Szabolcs,

On Mon, Jun 17, 2024 at 03:51:35PM +0100, Szabolcs Nagy wrote:
> The 06/17/2024 15:40, Florian Weimer wrote:
> > >> A user can still set it by interacting with the register directly, but I guess
> > >> we want something for the glibc interface..
> > >> 
> > >> Dave, any thoughts here?
> > >
> > > adding Florian too, since i found an old thread of his that tried
> > > to add separate PKEY_DISABLE_READ and PKEY_DISABLE_EXECUTE, but
> > > it did not seem to end up upstream. (this makes more sense to me
> > > as libc api than the weird disable access semantics)
> > 
> > I still think it makes sense to have a full complenent of PKEY_* flags
> > complementing the PROT_* flags, in a somewhat abstract fashion for
> > pkey_alloc only.  The internal protection mask register encoding will
> > differ from architecture to architecture, but the abstract glibc
> > functions pkey_set and pkey_get could use them (if we are a bit
> > careful).
> 
> to me it makes sense to have abstract
> 
> PKEY_DISABLE_READ
> PKEY_DISABLE_WRITE
> PKEY_DISABLE_EXECUTE
> PKEY_DISABLE_ACCESS
> 
> where access is handled like
> 
> if (flags&PKEY_DISABLE_ACCESS)
> 	flags |= PKEY_DISABLE_READ|PKEY_DISABLE_WRITE;
> disable_read = flags&PKEY_DISABLE_READ;
> disable_write = flags&PKEY_DISABLE_WRITE;
> disable_exec = flags&PKEY_DISABLE_EXECUTE;
> 
> if there are unsupported combinations like
> disable_read&&!disable_write then those are rejected
> by pkey_alloc and pkey_set.
> 
> this allows portable use of pkey apis.
> (the flags could be target specific, but don't have to be)

On powerpc, PKEY_DISABLE_ACCESS also disables execution. AFAICT, the
kernel doesn't define a PKEY_DISABLE_READ, only PKEY_DISABLE_ACCESS so
for powerpc there's no way to to set an execute-only permission via this
interface. I wouldn't like to diverge from powerpc.

However, does it matter much? That's only for the initial setup, the
user can then change the permissions directly via the sysreg. So maybe
we don't need all those combinations upfront. A PKEY_DISABLE_EXECUTE
together with the full PKEY_DISABLE_ACCESS would probably suffice.

Give that on x86 the PKEY_ACCESS_MASK will have to stay as
PKEY_DISABLE_ACCESS|PKEY_DISABLE_WRITE, we'll probably do the same as
powerpc and define an arm64 specific PKEY_DISABLE_EXECUTE with the
corresponding PKEY_ACCESS_MASK including it. We can generalise the masks
with some ARCH_HAS_PKEY_DISABLE_EXECUTE but it's probably more hassle
than just defining the arm64 PKEY_DISABLE_EXECUTE.

I assume you'd like PKEY_DISABLE_EXECUTE to be part of this series,
otherwise changing PKEY_ACCESS_MASK later will cause potential ABI
issues.

-- 
Catalin
