Return-Path: <linuxppc-dev+bounces-4787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92369A045DA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 17:19:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSGT21CVCz3bSc;
	Wed,  8 Jan 2025 03:19:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736266742;
	cv=none; b=jpq+qzhnZ7tE/GXE5vEMyskRB3SQt5NkfWTMPJl/j2BgcPll4J3BCLIp8CnLScV+vmVisU1KR7Cq1wyaM9RAZ3hHVDNW1SyClUsxB6liey6zp/EX4IivcisTMVYGWEg34CuuXxuzvcZftUYUtrwCPQF8Y/5NPsiu7Ly8/Lg8XcFCCuOSI4nI0ek+Y2wvCn5ESpwAjMFyqwi9JY9UM7/N3v6eUfU16553r4fxW51TXnh75Q+jl7joTBe+rXJhQ/xrb75rRADAmA97Z1qtwau5B6RfVasqXwfT7Y8fYj3JrV76uH08FYrWDO8HRlAPWU9YmqSYtrllrlHIS+PbEX/iCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736266742; c=relaxed/relaxed;
	bh=oJSphBGIariLO7Kt8bB27/WK7gPxbh/RSwAS9mn80rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VszRHTEXPrJmZDTAfiDvGzdsKcrrFrsWtjR2jpdkJ+ef4ilmyHuiKk7T/0T++XH+THfPBkoFbUDYM2djierWrHJrRkrII+QdikN/jfuVZktIRh6y3MU8XGC2coEdUuP4MwUxHcgBi3pg+zvtMq86ClnjKH9216jmCnwU3Tbweykn89rL2nWbi3GFiA2tfBGg5kO5g0p0U899N/I8vhSf5ZzO59kLrjCX5Zqmm+8XhrK8S2Hcs0tSDOsxlu+8AC1e05NJm08AWSbJX/bnNmidzXxQlRVnCpI/g1nE1x2DLEyv9fiU/wwOHfAxXSWzVQ9efInRlEWAUYkpWOMazF/xNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSGT10mTGz30gd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 03:19:00 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30929143D;
	Tue,  7 Jan 2025 08:18:58 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD3AA3F59E;
	Tue,  7 Jan 2025 08:18:27 -0800 (PST)
Date: Tue, 7 Jan 2025 16:18:25 +0000
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
Message-ID: <Z31T0dMgMucke5KS@e133380.arm.com>
References: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
 <20250107-elf-v3-2-99cb505b1ab2@daynix.com>
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
In-Reply-To: <20250107-elf-v3-2-99cb505b1ab2@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 07, 2025 at 09:45:53PM +0900, Akihiko Odaki wrote:
> Use note name macros to match with the userspace's expectation.

Also (and more importantly) get rid of duplicated knowledge about the
mapping of note types to note names, so that elf.h is the authoritative
source of this information?

> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: Baoquan He <bhe@redhat.com>
> ---
>  fs/binfmt_elf.c       | 21 ++++++++++-----------
>  fs/binfmt_elf_fdpic.c |  8 ++++----
>  2 files changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index 106f0e8af177..5b4a92e5e508 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c

[...]

> @@ -1538,7 +1538,7 @@ static int elf_fdpic_core_dump(struct coredump_params *cprm)
>  	do
>  		i += 2;
>  	while (auxv[i - 2] != AT_NULL);
> -	fill_note(&auxv_note, "CORE", NT_AUXV, i * sizeof(elf_addr_t), auxv);
> +	fill_note(&auxv_note, NN_AUXV, NT_AUXV, i * sizeof(elf_addr_t), auxv);
>  	thread_status_size += notesize(&auxv_note);
>  
>  	offset = sizeof(*elf);				/* ELF header */

Looking at this code, it appears that the right name is explicitly
taken from elf.h for a few specific notes, but for those that are
specified by the arch code (e.g., in struct user_regset entries) the
name is still guessed locally:

static int fill_thread_core_info(...) {

...

	fill_note(&t->notes[note_iter], is_fpreg ? "CORE" : "LINUX",
		note_type, ret, data);


It would be preferable to clean this up if we want elf.h to be the
authoritative source for the names.

It would be possible to add a .core_note_name entry in struct
user_regset, and define a helper macro to populate the note type and
name, something like the following:

struct user_regset {
	...
	unsigned int core_note_type;
+	unsigned int core_note_name;
};

#define USER_REGSET_NOTE_TYPE(type) \
	.core_note_type = NT_ ## type, \
	.core_note_name = NN_ ## name,

...and then replace every .core_note_type assignment with an invocation
of this macro.  A quick git grep should easily find all the affected
cases.


Alternatively, as discussed in the last review round, a helper could
be defined to get the name for a note type:

const char *elf_note_name(int Elf32_Word n_type)
{
	switch (n_type) {
	case NT_PRSTATUS:	return NN_PRSTATUS;
	case NT_PRFPREG:	return NN_PRFPREG;
	/* ...and all the rest..., then: */

	default:
		WARN();
		return "LINUX";
	}
}

This avoids the caller having to specify the name explicitly, but only
works if all the n_type values are unique for the note types that Linux
knows about (currently true).

Experimenting with this shows that GCC 11.4.0 (for example) doesn't do
a very good job with this switch, though, and it requires building
knowledge about irrelevant arch-specific note types into every kernel.
I think that extending struct user_regset is probably the better
approach -- though other people may disagree.

Cheers
---Dave

