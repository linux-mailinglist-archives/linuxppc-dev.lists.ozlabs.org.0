Return-Path: <linuxppc-dev+bounces-4720-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D10A02E2E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 17:48:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRg9F0LMHz30V7;
	Tue,  7 Jan 2025 03:48:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736182096;
	cv=none; b=fhuPnTYbCupNQXZPh8PScujaCoy8MV0qnUsFa6Rhhbfo7bhnlreqYMnsm1EBa/v2TVOumrWSdm4mNVCZB24s8Oh/SE5lb4uTdB8Y8tbRXhOfXZ0l8bXq8UL5/yOTkLGUGCK5uh8FUOiFjtJ3MTN/ttlW+RtObQFnngA8VwS1mCA/FCXESv1+owLNbXhlpmeQj2sKPah2R2/HqbTTfSZoRo2vwkB/KIJqWL3/6gFA9W9T46ADFuSCTnaqkFJd2w9UBDCcSUYkak0a/yp/wHNSjm4Q9rVJlR63z9S2MmVBLlMWSZnk8W5j6ksZbqC6xhvbiMy6h8Gs0iAwRV0fG6PfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736182096; c=relaxed/relaxed;
	bh=FyJ5AfCFZjEgs/ThYKbNaUoqxERTMbozAAc583jmNxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwSI9FGyYoBdxA3pmcfvLblfp+g0E1kpEzzcZKaDSvoGR0hRfml5Ml+nS7s8fbt5wF0Yi5rWKrwDBMY/thk5/AmyV9NdY8NREfhEKpbBkYvV+/a5S1V5QVNLgQ4GIyrQw2TWYUwIxokcLYttXTdtN+NCgkel5SB2HK1jhsJV6vN+IksXvrJUSuPKcCqeGGMMwW4nP3EyT47QQQPkYcoe9y4KJOgXnEnt/hxaFjOeXBc6Xf6RKfQ5Tn+yNH65aq4lRAL4MG1C6wa4ztec5+1bhFsOCwDOnvxfHjm37Aih3VXkfdn1LQSzoGFUV7v0WkxcJCEWJN4PIcUgOrhManB7ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IsijK6UW; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IsijK6UW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRg9D018xz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 03:48:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6FB71A41B22;
	Mon,  6 Jan 2025 16:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDD3C4CED2;
	Mon,  6 Jan 2025 16:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736182089;
	bh=HEO2MLf1VHgRzbREgQgzMwKlNqe5Agqt4kRQTnCkfOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IsijK6UWM2KPMQJBfvl+vFx8bFrxXhTGRtzqTu1U2GAZFVUO1R/FJBcV18ZANjRcC
	 79g4z7UqwfAkLa7S41BW2+teSCP+ZIYOvvDEzSZxcH+vLnCV/J2IoXM4jk3IvKDLBf
	 zu++zuSzxQgAhJ0KmjLlPp2Vi/5h2VIe3LtNVEImtJ8t3KXkVu4FqE/Z27xA7sS2et
	 CYtIgvEMF2tm20TeugiUA6L8m3n4Lsfuo/Hdenv4NP7hoLTCSys9LUdUKAACMYF4iP
	 CfYhKGTpqBSWtli/1njZ/oNSHQS6ghcSospxSMXFD/xqHxEc/H/I31p0f17xEtsQsT
	 SCLecFPd/gdgA==
Date: Mon, 6 Jan 2025 08:48:05 -0800
From: Kees Cook <kees@kernel.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Eric Biederman <ebiederm@xmission.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, kexec@lists.infradead.org,
	devel@daynix.com
Subject: Re: [PATCH v2 1/5] elf: Define note name macros
Message-ID: <202501060830.B735C3A@keescook>
References: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
 <20250104-elf-v2-1-77dc2e06db4e@daynix.com>
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
In-Reply-To: <20250104-elf-v2-1-77dc2e06db4e@daynix.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Jan 04, 2025 at 11:38:34PM +0900, Akihiko Odaki wrote:
> elf.h had a comment saying:
> > Notes used in ET_CORE. Architectures export some of the arch register
> > sets using the corresponding note types via the PTRACE_GETREGSET and
> > PTRACE_SETREGSET requests.
> > The note name for these types is "LINUX", except NT_PRFPREG that is
> > named "CORE".
> 
> However, NT_PRSTATUS is also named "CORE". It is also unclear what
> "these types" refers to.
> 
> To fix these problems, define a name for each note type. The added
> definitions are macros so the kernel and userspace can directly refer to
> them.

While ELF is specified in the Tool Interface Standard[1], the core dump
format doesn't have an official specification. It does follow a lot of
agreed rules, though, and the "note name" is intended to help coredump
consumers distinguish between "common" things ("CORE") and Linux-specific
things ("LINUX").

I think this should be explicitly spelled out in the UAPI header,
even if we have "mistakes" for this mapping.

I'm not convinced we need these macros, though: everything is "LINUX"
expect the common types. And the GNU types are "GNU". There are only 7
types under the "CORE" name. :)

For the macros, I'd much prefer NN_CORE, NN_LINUX, and NN_GNU.

If you really want to be able to examine the name from the type, then
yeah, I guess we need something like the macros you have, but I'd much
prefer also adding a macro like Dave suggested[2], and then replace the
fill_note() with a macro that can unwrap it:

	fill_note(note, NT_SIGINFO, size..., data...);

The repetition of NN_type, NT_type doesn't feel robust if we have a
programmatic mapping: only the "type" is needed to determine both, so
why supply both?

-Kees

[1] https://refspecs.linuxfoundation.org/elf/elf.pdf
[2] https://lore.kernel.org/lkml/Z3vuBTiQvnRvv9DQ@e133380.arm.com/

-- 
Kees Cook

