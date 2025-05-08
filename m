Return-Path: <linuxppc-dev+bounces-8438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62981AAF6EC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 11:40:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtRvN4ytnz30TY;
	Thu,  8 May 2025 19:40:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746697232;
	cv=none; b=GNyu2YR9fr5i80+xzOVZMqFYDHmpO0XsiV2Ad0Nssx3ZmxvRk/drw5LMVz8RD5BiKrLlWD+Mj9U9kxTGxCgos/CwVp9DeVgNZlYRcHHA73PJJ0l2OWpC4G0eS7Xw4R/kPqm7C7XvQks4MPqSOfnBZkyN5AsQsGqsRyeK7W7RyGvLCNthxZWw9dB0etBoRfs2NB9Ho5gAgSYOrjZc+Koelkt/yJIIOVG/VhVnS+BYIZlBdJjNBunVhnFE+NszYP9JadGywzUZJFFy/HIQIz/SNj2qTL+VBq4nsdm09UkRUblgO0uMZwVas+W2d8P8dFxKeLmDuDl+EAoK+t81CF+quQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746697232; c=relaxed/relaxed;
	bh=rd4X9VJub0p8Z48NlXuvNR1+VIxbKa4gUctZklcxAAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVGbR2E7zIS9G6pC4KsfugiyKM2EdrbDYpfmddOfdc4EbR74G8jvSELw0IvbTNU4DHIipvDOw8xO8xP0SEAZzUDcYtY9jihcFX+8aMfPnmE8ppnipQo/SeET9pnWG0UHUxgr8VnEEoNwQwZ53gImhhzmjAS6gwfBuYP03dt0V4KG7BppGhhMr0q1wh6V4OMESaYfRbfzaklnqF4rRItCGC1pIGT9jO+VsHGOg6UQte7eIt3BFVomL5J/lALpyaLFGqjGK3QfgiKAcHP3IF3ASv+TKUKh9JwTpZv0wSwKbHaPYSSmbpXT9ozSmcL7y3+4DZWEFTzxxRYSQfWKFunIOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jLBeEIJe; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b3; helo=out-179.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jLBeEIJe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b3; helo=out-179.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [IPv6:2001:41d0:203:375::b3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtRvK6NcJz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 19:40:23 +1000 (AEST)
Date: Thu, 8 May 2025 11:39:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746697201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rd4X9VJub0p8Z48NlXuvNR1+VIxbKa4gUctZklcxAAU=;
	b=jLBeEIJeOs0a7cKKkC/3kmj0tYlNG1kh/EykuU2zvp/el6AjEn9I0nJ/oYuSPya996hXJ7
	0BY3GuiOuGEJdPcMm0C6wo/G5NP9fGfOXApSp8xqVFUfH48j1Gp3KfpXnJYN4kMETZhjR9
	YW9/YoXzBRvzfQWGf1w/pvq9/l2FV80=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 03/16] configure: Export TARGET
 unconditionally
Message-ID: <20250508-0227212b80950becb999ad30@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-4-alexandru.elisei@arm.com>
 <20250507-78bbc45f50ea8867b4fa7e74@orel>
 <aBxw1uaO1FZQ15VR@raptor>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBxw1uaO1FZQ15VR@raptor>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 08, 2025 at 09:52:38AM +0100, Alexandru Elisei wrote:
> Hi Drew,
> 
> On Wed, May 07, 2025 at 06:02:31PM +0200, Andrew Jones wrote:
> > On Wed, May 07, 2025 at 04:12:43PM +0100, Alexandru Elisei wrote:
> > > Only arm and arm64 are allowed to set --target to kvmtool; the rest of the
> > > architectures can only set --target to 'qemu', which is also the default.
> > > 
> > > Needed to make the changes necessary to add support for kvmtool to the test
> > > runner.
> > > 
> > > kvmtool also supports running the riscv tests, so it's not outside of the
> > > realm of the possibily for the riscv tests to get support for kvmtool.
> > > 
> > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > > ---
> > >  configure | 36 ++++++++++++++++++++++++------------
> > >  1 file changed, 24 insertions(+), 12 deletions(-)
> > >
> > 
> > Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> 
> Thank you for the review!
> 
> Just to be clear, you are ok with this happening because of the patch:
> 
> $ git pull
> $ make clean && make
> $ ./run_tests.sh
> scripts/runtime.bash: line 24: scripts/arch-run.bash: line 444: [: =: unary operator expected
> timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel _NO_FILE_4Uhere_ 2 #  /tmp/tmp.bME9I2BZRG
> qemu-system-x86_64: 2: Could not open '2': No such file or directory
> scripts/arch-run.bash: line 19: 1: command not found: No such file or directory
> FAIL apic-split
> scripts/runtime.bash: line 24: scripts/arch-run.bash: line 444: [: =: unary operator expected
> timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel _NO_FILE_4Uhere_ 1 #  /tmp/tmp.11und6qZbL
> qemu-system-x86_64: 1: Could not open '1': No such file or directory
> scripts/arch-run.bash: line 19: 1: command not found: No such file or directory
> FAIL ioapic-split
> [..]
> 
> That's because TARGET is missing from config.mak. If you're ok with the
> error, I'll make it clear in the commit message why this is happening.
>

It's not ideal, but I think it's pretty common to run configure before
make after an update to the git repo, so it's not horrible. However,
as you pointed out in your cover letter, this can be mitigated if we
use function wrappers for the associative array accesses, allowing
$TARGET to be checked before it's used. I'd prefer the function wrappers
anyway for readability reasons, so let's do that.

Thanks,
drew

