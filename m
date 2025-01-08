Return-Path: <linuxppc-dev+bounces-4847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9D9A05D2B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 14:45:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSq1r5jTMz2yD5;
	Thu,  9 Jan 2025 00:45:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736343952;
	cv=none; b=anms+nxBv7wKuZYzRp+NEBiltW9MYTwdtpcP1rgq8Gs8sY1HY8PMk0VWyD3usee73W7qPVthXPC4MZcP5vO19QbRZhMCV+cj1tsSHMIXXkmZ+61o8Q51EVNc0c6FOC4X7YYD3DCSzOltlDZ5eLBuHASaPVGeoCN71ALr+ZtoS2zzbeXr3wFvS4PHMN4GKFc+OgYqxhbly6AeW6IBhAgjvUeCSEbBlsU7eYjM4OSr6GjX1VI9dd1Jihu5Y1sck8Nz5YN9HqSUghTWm/jBHLIAp1EloSN7L44LeyT4H/O362F72P3SjIev1flS/2MLt4yFmFHJiDTrxVvCn0UlGU5sOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736343952; c=relaxed/relaxed;
	bh=Dp4YiVyk7VgThiWRacmuSQVvTMLuSAHIMMx/x3SLL+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNEkUjhwZrCGmjnGM+srBQ9VkQm3i689ylcwyuJMCX+6TSUVnywp3ivrE84J42Exluf3mkmGnZySpVoFBXlVbbVFxzXDq7yF4EVKGTAfnG3RJDK8hpioSNR4aQifZ/HdKuIucePW61dwtgfZoyqHPPdjWYPGzI7hRXVQvepLCtA5oygUTzEliPbb8EnOM0pj2q0ZtmiQhIY7WYSyCcBQxoFVW9/2RJHL0TATlJY1c9GlhNEGaVSfokiHWD0ZA2/UtLFbIvFfXVGLiBrN4wPSKqvOo2zahuAOkUYotTIeF/VgBxskxUXR0OwXuy976nA8K4H8JuSgUwG199wBSNQcXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSq1q0D5sz2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 00:45:49 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DC2C13D5;
	Wed,  8 Jan 2025 05:45:44 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3294C3F673;
	Wed,  8 Jan 2025 05:45:14 -0800 (PST)
Date: Wed, 8 Jan 2025 13:45:11 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kexec@lists.infradead.org, binutils@sourceware.org,
	devel@daynix.com
Subject: Re: [PATCH v3 2/6] binfmt_elf: Use note name macros
Message-ID: <Z36BZ8LytWJS9bFT@e133380.arm.com>
References: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
 <20250107-elf-v3-2-99cb505b1ab2@daynix.com>
 <Z31T0dMgMucke5KS@e133380.arm.com>
 <2c6f2c95-b2fc-46e0-91ce-1b9f14b28d3d@daynix.com>
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
In-Reply-To: <2c6f2c95-b2fc-46e0-91ce-1b9f14b28d3d@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Wed, Jan 08, 2025 at 01:34:24PM +0900, Akihiko Odaki wrote:
> On 2025/01/08 1:18, Dave Martin wrote:
> > On Tue, Jan 07, 2025 at 09:45:53PM +0900, Akihiko Odaki wrote:
> > > Use note name macros to match with the userspace's expectation.
> > 
> > Also (and more importantly) get rid of duplicated knowledge about the
> > mapping of note types to note names, so that elf.h is the authoritative
> > source of this information?
> > 
> > > 
> > > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > > Acked-by: Baoquan He <bhe@redhat.com>
> > > ---
> > >   fs/binfmt_elf.c       | 21 ++++++++++-----------
> > >   fs/binfmt_elf_fdpic.c |  8 ++++----
> > >   2 files changed, 14 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> > > index 106f0e8af177..5b4a92e5e508 100644
> > > --- a/fs/binfmt_elf.c
> > > +++ b/fs/binfmt_elf.c
> > 
> > [...]
> > 
> > > @@ -1538,7 +1538,7 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
> > >   	do
> > >   		i += 2;
> > >   	while (auxv[i - 2] != AT_NULL);
> > > -	fill_note(&auxv_note, "CORE", NT_AUXV, i * sizeof(elf_addr_t), auxv);
> > > +	fill_note(&auxv_note, NN_AUXV, NT_AUXV, i * sizeof(elf_addr_t), auxv);
> > >   	thread_status_size += notesize(&auxv_note);
> > >   	offset = sizeof(*elf);				/* ELF header */
> > 
> > Looking at this code, it appears that the right name is explicitly
> > taken from elf.h for a few specific notes, but for those that are
> > specified by the arch code (e.g., in struct user_regset entries) the
> > name is still guessed locally:
> > 
> > static int fill_thread_core_info(...) {
> > 
> > ...
> > 
> > 	fill_note(&t->notes[note_iter], is_fpreg ? "CORE" : "LINUX",
> > 		note_type, ret, data);
> > 
> > 
> > It would be preferable to clean this up if we want elf.h to be the
> > authoritative source for the names.
> 
> If we want elf.h to be the authoritative source, yes, but I like the current
> form as it ensures nobody adds a note with a name different from "LINUX" and
> it is also simpler. There is a trade-off so I'd like to keep the current
> form unless anyone has a strong preference for one option.
> 
> Regards,
> Akihiko Odaki

I can see where you're coming from here.

It would be nice to at least be able to check that elf.h is consistent
with the behaviour here, but you're right -- there is a tradeoff.

Maybe add a comment in elf.h at the end of the block of #defines saying
that new Linux-specific entries should use the name "LINUX"?

Either way, I don't think it's a huge deal.  If people are happy with
this code as-is, then I don't have an issue with it.


I might follow up with a separate patch if this series is merged, and
people can consider it on its own merits (or lack thereof).

Cheers
---Dave

