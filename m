Return-Path: <linuxppc-dev+bounces-8439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD13FAAF768
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 12:06:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtST20Tjgz30WF;
	Thu,  8 May 2025 20:06:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746698773;
	cv=none; b=gSZvFJ/UK799ZqiBjBuS2PHNS5HrzC4Kua7qGk+DrRQbSA1W8KlOzFrEg2wkR9mg9ljjE6aqVZE18wkKHFzuIfyBFPCN1e2MCZMEYBQXnNml+m13PaOVvdk/VzES7HmIbL/nMZuhkPx5LHJ7BDxplvl/jLRwRuttVHII6jsPQiW2CXfZOujcpe9VDWKVrGowL/o8x/SLxmTEEYSk5PFwbD8s67RqlbGfwlRvSodFuJnh8xX+7w/gO6DN/zmUOUVs+KCtOus/PTE17JHxFneHhoxAf8EMD8XumtzY2ov5gnoDPW+98WpBEFnzhCkOuTJV4pqI9KNsz4nQWSj2b+6lrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746698773; c=relaxed/relaxed;
	bh=BE8ePng5gqXvt8aerpwskUA2QESu/a9wFpnYXdZheqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAKUPeNokFV58y435bIgoKrXHaPJRWTlkyZ/UMPcoA3opBV4OgM3fyeyAT3PWD6yJjsKLEabbq5+JF4yparp1jdvZkEeypPrfc0pDFxxi6wEEGtIgtAqEoiXuo8jJoHfdcl8M68/JhR4YXWC9rod2pfs0NNKGpHIXDkNH4DFwWnJlB/KUecrXACPrk22ygsrOXAIo5FxCgTt4U6G5eiN4gR6zQr3S/U+9lS7GMuyx/GX2wzJM9rreC/xo267wVZw1EOkEprt04XykQh2ACy7J2zWqqSzmzkKIJx57kM4bLlFQIZbwyYpfjTEX6ZrdwS7qWVZljEhAxqQIiK9dV/6mA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtSSz55Rvz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 20:06:10 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C206106F;
	Thu,  8 May 2025 03:05:27 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5EA23F5A1;
	Thu,  8 May 2025 03:05:34 -0700 (PDT)
Date: Thu, 8 May 2025 11:05:32 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 03/16] configure: Export TARGET
 unconditionally
Message-ID: <aByB7IphzIq61BMN@raptor>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-4-alexandru.elisei@arm.com>
 <20250507-78bbc45f50ea8867b4fa7e74@orel>
 <aBxw1uaO1FZQ15VR@raptor>
 <20250508-0227212b80950becb999ad30@orel>
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
In-Reply-To: <20250508-0227212b80950becb999ad30@orel>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Drew,

On Thu, May 08, 2025 at 11:39:54AM +0200, Andrew Jones wrote:
> On Thu, May 08, 2025 at 09:52:38AM +0100, Alexandru Elisei wrote:
> > Hi Drew,
> > 
> > On Wed, May 07, 2025 at 06:02:31PM +0200, Andrew Jones wrote:
> > > On Wed, May 07, 2025 at 04:12:43PM +0100, Alexandru Elisei wrote:
> > > > Only arm and arm64 are allowed to set --target to kvmtool; the rest of the
> > > > architectures can only set --target to 'qemu', which is also the default.
> > > > 
> > > > Needed to make the changes necessary to add support for kvmtool to the test
> > > > runner.
> > > > 
> > > > kvmtool also supports running the riscv tests, so it's not outside of the
> > > > realm of the possibily for the riscv tests to get support for kvmtool.
> > > > 
> > > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > > > ---
> > > >  configure | 36 ++++++++++++++++++++++++------------
> > > >  1 file changed, 24 insertions(+), 12 deletions(-)
> > > >
> > > 
> > > Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> > 
> > Thank you for the review!
> > 
> > Just to be clear, you are ok with this happening because of the patch:
> > 
> > $ git pull
> > $ make clean && make
> > $ ./run_tests.sh
> > scripts/runtime.bash: line 24: scripts/arch-run.bash: line 444: [: =: unary operator expected
> > timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel _NO_FILE_4Uhere_ 2 #  /tmp/tmp.bME9I2BZRG
> > qemu-system-x86_64: 2: Could not open '2': No such file or directory
> > scripts/arch-run.bash: line 19: 1: command not found: No such file or directory
> > FAIL apic-split
> > scripts/runtime.bash: line 24: scripts/arch-run.bash: line 444: [: =: unary operator expected
> > timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel _NO_FILE_4Uhere_ 1 #  /tmp/tmp.11und6qZbL
> > qemu-system-x86_64: 1: Could not open '1': No such file or directory
> > scripts/arch-run.bash: line 19: 1: command not found: No such file or directory
> > FAIL ioapic-split
> > [..]
> > 
> > That's because TARGET is missing from config.mak. If you're ok with the
> > error, I'll make it clear in the commit message why this is happening.
> >
> 
> It's not ideal, but I think it's pretty common to run configure before
> make after an update to the git repo, so it's not horrible. However,
> as you pointed out in your cover letter, this can be mitigated if we
> use function wrappers for the associative array accesses, allowing
> $TARGET to be checked before it's used. I'd prefer the function wrappers
> anyway for readability reasons, so let's do that.

I'm all for the function wrappers, I was planning to reply to that comment
later.

As to this patch, is this what you're thinking:

function vmm_optname_nr_cpus()
{
	if [ -z $TARGET ]; then
		echo vmm_opts[qemu:nr_cpus]
	else
		echo vmm_opts[$TARGET:nr_cpus]
	fi
}

But checking if $TARGET is defined makes this patch useless, and I would
rather drop it if that's the case.

Thanks,
Alex

> 
> Thanks,
> drew
> 

