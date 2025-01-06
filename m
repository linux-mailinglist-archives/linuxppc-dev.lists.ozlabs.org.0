Return-Path: <linuxppc-dev+bounces-4719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F534A0297B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 16:24:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRdJ76V0lz2xy2;
	Tue,  7 Jan 2025 02:24:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736177047;
	cv=none; b=CN97FZz+VF/gfti6NL6HJwcs3x8zHilucFtgTswj3uNH0U1EfJ3qA6rbxpu2I+Pl7Sd28pGgcfV+vgsJp9gcjPqPp+q9vvos2YFWRjAX/flYXHNpw5T6ETuFn6Fc1vwowxuJ7IAQHwn3GZua0Io8lLseIH4gaaEDh4MKH53TbATmzH3cE1tGhviPqSv2h+qkmbSHrCDZlG7RvuPghWicCRVy8qT4Ti+BS15Jpm6Q/yTThb1nZ18ktsqiucvyxusOBTcIe+HnfSiCuwPp+lZBlBceLAS7Mc4bETzzfGtDmRxP9ivXKn0nWVCjdG7i7+YE8WM0pvRTfwQM9arl7GVBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736177047; c=relaxed/relaxed;
	bh=L0cWKwesGUWu0kJbylqFSkdZr5QpTpSeBpe/e0xZI0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhFBW8shWP1+/1YHw9F9RYknPGNGcGxMOQnnX+60uuHFYq2UclS1WqqQf7/GkcoaPGlPuXWrfHC3nJl2TJx115Wg4rfiVAaphzAJg9QM5CRmsNrQIJlsvkvZk9w13kdJhaFB/yJmMWa1RzkTHCG/Fn2bqcZ+ZK9ex/j5sCJx8A5PXegmpLCYKRcAsb20FIOpZbbR1bs63jaW7mOVGTApNEhR1Bj09Hgp3o6DNaONRLJB9TsoLawEMTK0NRebA+Gw+BkHCp5EV9+DXv4ABs/yh/5+I3+TkWVXx1RxaWTiVMsbxBgV09syUGJR+3WvSehbzTEts/TNT41+YHn9DE5e4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRdJ701lPz2xpl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 02:24:06 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99914143D;
	Mon,  6 Jan 2025 07:24:03 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16DE23F59E;
	Mon,  6 Jan 2025 07:23:32 -0800 (PST)
Date: Mon, 6 Jan 2025 15:23:30 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kexec@lists.infradead.org, devel@daynix.com
Subject: Re: [PATCH v2 0/5] elf: Define note name macros
Message-ID: <Z3v1clew2t+XH5F5@e133380.arm.com>
References: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
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
In-Reply-To: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Sat, Jan 04, 2025 at 11:38:33PM +0900, Akihiko Odaki wrote:
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
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Should this be Cc'd at least to the GNU binutils or gdb folks?
Also the glibc and elfutils projects, both of which maintain a version
of elf.h.  They may have their own view on the best way to approach
this issue.

If cross-posting to other project mailing lists, it might make sense to
add a bit more background explaining the motivation for the change.

[...]

Cheers
---Dave

