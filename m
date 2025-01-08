Return-Path: <linuxppc-dev+bounces-4848-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F397DA05D6A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 14:50:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSq7c3Svrz2yTy;
	Thu,  9 Jan 2025 00:50:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736344252;
	cv=none; b=O63lagEQ9WzM3YQIpd9K2NH/tBoz6L0CUHrx4XBEscMQyKEfDGE1MdZbyz8KSi0/VkR9rXRjJumw7nf7iXB5Td2lMPMTSwyZq4hvUl3FNAi7NYMcIblOlWZEt1hDoJtz/c3ldsHra7NnXdsibzmc3BYXS7BO2zh0q5CpyIgGGKnpNh/foImqG+4S+M8S0TFpMkAvcLu1+F5WoAxxofFX55ovjsuC59w1xo3Os1F6lRqhjgHz/14YlCvgZDZT+JESAtTf0M6avxta/OHpCRAzFDMet4brzN4OIfQmRxqsbqXrOSvFuw8mDwlWxrxgcEnZogvrtf0lFSUPlVpnQhEYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736344252; c=relaxed/relaxed;
	bh=kUnPsKgtfCLP8/mvdYAfN7xgpNnrdA4BcrGL+u8Fii4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcGGZNrC74G+isoWUJpsgokxbMyzIycevYZmWta074/MpDUN2f6ppAYGljxaau7Jtuzu9D8JWJjaP3R+ABilz/TG5GGI9bYtSpZwBHIKKlqA4Iz2y0X4BRWCl0MQRcpa+C6Am82QsHEBYae+B8f0beaB6H01RDwM7l/gAkU0LF7eGgfMRtF8HSjwQmKrV+RQz6wy+dvv3ACDojduDE0Ns5TyoymPIKU1awXx1I1s0hg5+Hwb7lmPJcB2NkAMQsiESV5KShZn1DGMHlqRj23R8vlmofn/uk5Mr/XSbkqx5CRrpzs1DV/j4YeljRlPGTE/elxZ02Li628JI/zEmZHlHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSq7b4GY3z2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 00:50:51 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82CFA13D5;
	Wed,  8 Jan 2025 05:50:48 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 179663F673;
	Wed,  8 Jan 2025 05:50:16 -0800 (PST)
Date: Wed, 8 Jan 2025 13:50:14 +0000
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
Message-ID: <Z36Cljsz2p0hYsFd@e133380.arm.com>
References: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
 <20250107-elf-v3-5-99cb505b1ab2@daynix.com>
 <Z31Tp0nMhb/ntUW0@e133380.arm.com>
 <965b73e7-d0a3-4fae-b0ec-70b5497cb6c4@daynix.com>
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
In-Reply-To: <965b73e7-d0a3-4fae-b0ec-70b5497cb6c4@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 08, 2025 at 01:53:51PM +0900, Akihiko Odaki wrote:
> On 2025/01/08 1:17, Dave Martin wrote:
> > Hi,
> > 
> > On Tue, Jan 07, 2025 at 09:45:56PM +0900, Akihiko Odaki wrote:
> > > Use note name macros to match with the userspace's expectation.
> > > 
> > > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > > ---
> > >   arch/s390/kernel/crash_dump.c | 62 ++++++++++++++++---------------------------
> > >   1 file changed, 23 insertions(+), 39 deletions(-)
> > > 
> > > diff --git a/arch/s390/kernel/crash_dump.c b/arch/s390/kernel/crash_dump.c
> > 
> > [...]

> > > +#define NT_INIT(buf, type, desc) \
> > > +	(nt_init_name((buf), NT_ ## type, &(desc), sizeof(desc), NN_ ## type))

[...]

> > (Note also, the outer parentheses and the parentheses around (buf)
> > appear redundant -- although harmless?)
> 
> They only make a difference in trivial corner cases and may look needlessly
> verbose.

(In case there was a misunderstanding here, I meant that some
parentheses can be removed without affecting correctness:

#define NT_INIT(buf, type, desc) \
	nt_init_name(buf, NT_ ## type, &(desc), sizeof(desc), NN_ ## type))

It still doesn't matter though -- and some people do prefer to be
defensive anyway and err on the side of having too many parentheses
rather than too few.)

[...]

Cheers
---Dave

