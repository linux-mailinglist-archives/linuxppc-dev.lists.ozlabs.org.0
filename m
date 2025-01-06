Return-Path: <linuxppc-dev+bounces-4721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F14A02EDC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 18:24:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRgzK10Xnz30Vv;
	Tue,  7 Jan 2025 04:24:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736184285;
	cv=none; b=HysI9aJkdoHNwT4e7TfGNNrgiuG8wd7x3JDow1JoHJLJBckA4IjNHLQlQBShLZOQZQxhU6Af+24V3kVTHgclqnjdqk5jNV+rH/qyR5BHMzDcGJGxBFIsF0Zt2dl18FMa8k9cq7tT8F4yu3BzOXQeEgfy+tvK/aFHG8HKMEtXW+fWmW2qitVL+y0hiJeFIVqNRUegfjlNlMGWlQLOXhltr/YnF//ZaBYUBPrS26y7j/9OmK7ewYXoUn3hYByVxlaUNj5p6rH+yIkMBYyXfYmKx+ABPXrFC510XFRdm340V0vk4OQ0pqnI9w8vBiAOP5ezY/pM5WmCMIPBtdEMJqu4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736184285; c=relaxed/relaxed;
	bh=rRA2mT1FDJLw9rDAL19zAy8V1ZZTmoCMlSJNj6lQNi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvBs5cq4+KK16cQUqC00ei14gG8r+8WBClrSlm3Z2ADkGBZ2MrMy2Frkr6MCgTADun8qXR1Y/rnGTkbKeQQx3D3GgJD0vE1j8IQq72YZ5MczkUY/7Lg+E/ZkZhr155dNXAA7qfQittzT6G13qBS14cA5S8xkJAq/AXehXoChflj3TJaQZUB0t8/7p6yc1iLAEj2WtrjcPtSgHlzHMQSscjHIONuE9dIwlS0S9uncSpDMbqrNkCRTmjKkiVkb1UhY7dGWOEiToYGl17QuVeqCu5dG2Tl/TR817/2zOj3FwH0MHSTxEbgnXV/JnHAgPEjiAZbeLTSJhOIx42SCk2TPFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRgzH2XsNz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 04:24:41 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33A32143D;
	Mon,  6 Jan 2025 09:24:37 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F35C43F673;
	Mon,  6 Jan 2025 09:24:06 -0800 (PST)
Date: Mon, 6 Jan 2025 17:23:50 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kexec@lists.infradead.org, devel@daynix.com
Subject: Re: [PATCH v2 1/5] elf: Define note name macros
Message-ID: <Z3wRnX4RHg7KDYDT@e133380.arm.com>
References: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
 <20250104-elf-v2-1-77dc2e06db4e@daynix.com>
 <202501060830.B735C3A@keescook>
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
In-Reply-To: <202501060830.B735C3A@keescook>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi all,

On Mon, Jan 06, 2025 at 08:48:05AM -0800, Kees Cook wrote:
> On Sat, Jan 04, 2025 at 11:38:34PM +0900, Akihiko Odaki wrote:
> > elf.h had a comment saying:
> > > Notes used in ET_CORE. Architectures export some of the arch register
> > > sets using the corresponding note types via the PTRACE_GETREGSET and
> > > PTRACE_SETREGSET requests.
> > > The note name for these types is "LINUX", except NT_PRFPREG that is
> > > named "CORE".
> > 
> > However, NT_PRSTATUS is also named "CORE". It is also unclear what
> > "these types" refers to.
> > 
> > To fix these problems, define a name for each note type. The added
> > definitions are macros so the kernel and userspace can directly refer to
> > them.
> 
> While ELF is specified in the Tool Interface Standard[1], the core dump
> format doesn't have an official specification. It does follow a lot of
> agreed rules, though, and the "note name" is intended to help coredump
> consumers distinguish between "common" things ("CORE") and Linux-specific
> things ("LINUX").
> 
> I think this should be explicitly spelled out in the UAPI header,
> even if we have "mistakes" for this mapping.

This seems reasonable.

> I'm not convinced we need these macros, though: everything is "LINUX"
> expect the common types. And the GNU types are "GNU". There are only 7
> types under the "CORE" name. :)

My starting point for suggesting the new macros was that the current
usage seems to be a historical accident; there doesn't seem to be an
underlying logic to it, except that arch-independent core note types
defined by Linux are named "CORE" ... except when they aren't.

Although the number of exceptional cases is small today, this doesn't
make for a robust rule -- nothing really prevents more unintentional
anomalies being added in future, so it seems prone to bitrot.

If the names are arbitrary, having a table rather than trying to
describe a rule seems the best way to avoid confusion.

Documenting these in a regular way may also encourage people to treat
the name as a formal part of the identifier, rather than a sort of
"comment" that nobody is quite sure what to do with (even if [1] makes
it clear).

That said, software does cope with the situation today; it's just a bit
gross.

> 
> For the macros, I'd much prefer NN_CORE, NN_LINUX, and NN_GNU.

What would be the point of these?

#define NN_CORE "CORE" doesn't convey any information at all, though I
suppose it does provide a layer of typo-resistance.

> If you really want to be able to examine the name from the type, then
> yeah, I guess we need something like the macros you have, but I'd much
> prefer also adding a macro like Dave suggested[2], and then replace the
> fill_note() with a macro that can unwrap it:
> 
> 	fill_note(note, NT_SIGINFO, size..., data...);
> 
> The repetition of NN_type, NT_type doesn't feel robust if we have a
> programmatic mapping: only the "type" is needed to determine both, so
> why supply both?
> 
> -Kees
> 
> [1] https://refspecs.linuxfoundation.org/elf/elf.pdf
> [2] https://lore.kernel.org/lkml/Z3vuBTiQvnRvv9DQ@e133380.arm.com/

Although not "robust", it should at least be obvious to the eye of
anyone pasting and repurposing an existing snippet of code that the
"type" is probably supposed to match in a single call.

I suppose we could have a kernel helper function containing a big
switch that gives you the name for each recognised note type though.
At the source code level, that would avoid specifying the "NN_"
arguments explicitly.  But if we still want a canonical way to describe
this mapping in elf.h, the "NN_" macros still serve a purpose.


With a literal string instead, I would expect then when adapting

	fill_note(note, NT_SIGINFO, "CORE", ...)

to

	fill_note(note, NT_WIZZFOO, ???, ...)

it's not clear what ??? should be.  I think people have tended to shrug
and just leave it unchanged -- so, it depends on which bit of code was
randomly chosen to serve as a template.  I could be guessing wrongly
about that, but if that's how the name gets chosen for new notes then
it doesn't feel ideal.

Cheers
---Dave

