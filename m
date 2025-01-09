Return-Path: <linuxppc-dev+bounces-4907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C994A0754C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 13:08:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTNqK5vSWz3bTN;
	Thu,  9 Jan 2025 23:08:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736424525;
	cv=none; b=XnxqnvT44YRnqu4R1Zteua3w5eXSYg8CxHfmgVbRahKU0vq+gXlxg13M98JzkcqIEi58vlV03wsBadpKv7QZgYmHDCEUWV2vgO+z3oQWBzMJmG1qXO1BmEorfkA42RO02xdVvZ/oMlUKIHgRKe9Vli5hOl/jkFlflVUvsdIfQBo0PhWhl0AoKXWQKpLrOYrVl1+9b4az7NbRMjp4M5WT9wS9hbzt9YQQ9EFFBenxIRm/D3ROs1tUY1FwmtEkwK79pxRlqJdKzyZdBrOtjH7b6ZaeYOBKKgsDrFNN7YZ4Y+mvi1IgocVt/nxAuaQrjqtSD+/jKCKo+dYHNc9jhB2LyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736424525; c=relaxed/relaxed;
	bh=4YVgIS/5ZlAwoAZTi+PHEKdEfNzJGY2kEocFY8AfogE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUwe7qlxIDKtBmZlUuW10Qs0bkel0Th39BpCK3/nWqWi3B9lAJv954SPtjg8aQFk1HcL5T5CAR/BLxIYaBpM0kDKoINodlpQhVsVphGXPBcU7BXu+bxxXms/VwbBin5GM8NS44cW6NlfWPwKL4CA9dUjHaZu015frBzEAzuKBcEPHiOzaVxqskbw0ptLPAZ6GU6v1TAQKoCNyjrUG0S21lvZsiMSl278hkO1yk+Pcymx0KFH9RGsN9qAL9avxOrpmdRDgkWJBymYX2pMCGgoDWIAzc5qZZgQ1Yp6iemaadIN1uvvIvOUBox4Cjl+ux/QlnsSJE8zSBJvYmIImKQpVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTNqJ1w4nz30fK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 23:08:42 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ABC712FC;
	Thu,  9 Jan 2025 04:08:37 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBD483F673;
	Thu,  9 Jan 2025 04:08:06 -0800 (PST)
Date: Thu, 9 Jan 2025 12:08:04 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kexec@lists.infradead.org, binutils@sourceware.org,
	devel@daynix.com
Subject: Re: [PATCH v3 5/6] s390/crash: Use note name macros
Message-ID: <Z3+8JGoiUyPFYGE8@e133380.arm.com>
References: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
 <20250107-elf-v3-5-99cb505b1ab2@daynix.com>
 <Z31Tp0nMhb/ntUW0@e133380.arm.com>
 <965b73e7-d0a3-4fae-b0ec-70b5497cb6c4@daynix.com>
 <Z36Cljsz2p0hYsFd@e133380.arm.com>
 <2ad7234d-bfc5-49e3-abe6-7a85d992329d@daynix.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ad7234d-bfc5-49e3-abe6-7a85d992329d@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Thu, Jan 09, 2025 at 02:29:19PM +0900, Akihiko Odaki wrote:
> On 2025/01/08 22:50, Dave Martin wrote:
> > On Wed, Jan 08, 2025 at 01:53:51PM +0900, Akihiko Odaki wrote:
> > > On 2025/01/08 1:17, Dave Martin wrote:
> > > > Hi,
> > > > 
> > > > On Tue, Jan 07, 2025 at 09:45:56PM +0900, Akihiko Odaki wrote:
> > > > > Use note name macros to match with the userspace's expectation.
> > > > > 
> > > > > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > > > > ---
> > > > >    arch/s390/kernel/crash_dump.c | 62 ++++++++++++++++---------------------------
> > > > >    1 file changed, 23 insertions(+), 39 deletions(-)
> > > > > 
> > > > > diff --git a/arch/s390/kernel/crash_dump.c b/arch/s390/kernel/crash_dump.c
> > > > 
> > > > [...]
> > 
> > > > > +#define NT_INIT(buf, type, desc) \
> > > > > +	(nt_init_name((buf), NT_ ## type, &(desc), sizeof(desc), NN_ ## type))
> > 
> > [...]
> > 
> > > > (Note also, the outer parentheses and the parentheses around (buf)
> > > > appear redundant -- although harmless?)
> > > 
> > > They only make a difference in trivial corner cases and may look needlessly
> > > verbose.
> > 
> > (In case there was a misunderstanding here, I meant that some
> > parentheses can be removed without affecting correctness:
> > 
> > #define NT_INIT(buf, type, desc) \
> > 	nt_init_name(buf, NT_ ## type, &(desc), sizeof(desc), NN_ ## type))
> > 
> > It still doesn't matter though -- and some people do prefer to be
> > defensive anyway and err on the side of having too many parentheses
> > rather than too few.)
> 
> Well, being very pedantic, there are some cases where these parentheses have
> some effect.
> 
> If you omit the outer parentheses, the following code will have different
> consequences:
> a->NT_INIT(buf, PRSTATUS, desc)
> 
> The parentheses around buf will make difference for the following code:
> #define COMMA ,
> NT_INIT(NULL COMMA buf, PRSTATUS, desc)
> 
> But nobody will write such code.

Ah, it looks like you're right on both!

Apologies for the noise.

(I must try find a neat use for these...)

Cheers
---Dave

