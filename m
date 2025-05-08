Return-Path: <linuxppc-dev+bounces-8437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E55AAF610
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 10:53:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtQrv5D5jz30W1;
	Thu,  8 May 2025 18:53:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746694399;
	cv=none; b=nG4+KZDdFBBDNLUc1s3NOseAmcmsUGXcxJZLugSoyjPvWpho4oXBODCAMD/NkjxXz6wUjdsdfrG8eLq1G2/CBelcCGRwuRSwFHK14zYFfkQknQNshjPdr1uFny7kDLjlqMKXbPmu0CVUi6EzbCMl7rtB8H3XCVKD9JBT+SmlMZ2axO7R65eQhEKEFDpoW3d6yWCcKBOEOlmjZvnyeDb7PxenjBJy2w0dgkIAJNk55XbkelwDAXgJMWHIukmSJXXk06aEkhEoiPJJqxhzbnKtbtRluT+OK19Bozi9Gp6Bpj3IJiqtSBIrmCk38wwgn/LsadIhycsTFoNOmYs7PT01Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746694399; c=relaxed/relaxed;
	bh=8LWjhudCBwUdQUDMQ39azmED/JqpvU0VNf7bLtASm3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaEZ2Vi6qzEcoTx0I3Glyh+9ILsy78hDrNP0NBR4v8H6mxypqNLtX+zgAEpXD4Bc8GhyQt5cHYwgq57nfnJDXZonOJ8rm4IUrcK5Qrqp85qamz0QilzabbRSycxw2AQTGE7kY1aDagfIf1wvdiN+fRo1NvGc63u6pNNCfL3+dtHPw/hBxzRI908sFCIRAQh5E16BQTgb0kHd77N7rNQc1ygKsgejSC/WkVJVGnnDehooi3hRywmzKzqLLVl9/Y+RZez3cjZLcVktgTorjA4XMwB3hyEMH5xyOeGgA+xzN0Y6K7OHFfDPYCTXW8Yyif/rsSm7ZFjpIVPi9XG/5NQpeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtQrt3TGCz307K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 18:53:16 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4BB81688;
	Thu,  8 May 2025 01:52:33 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15DB03F673;
	Thu,  8 May 2025 01:52:40 -0700 (PDT)
Date: Thu, 8 May 2025 09:52:38 +0100
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
Message-ID: <aBxw1uaO1FZQ15VR@raptor>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-4-alexandru.elisei@arm.com>
 <20250507-78bbc45f50ea8867b4fa7e74@orel>
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
In-Reply-To: <20250507-78bbc45f50ea8867b4fa7e74@orel>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Drew,

On Wed, May 07, 2025 at 06:02:31PM +0200, Andrew Jones wrote:
> On Wed, May 07, 2025 at 04:12:43PM +0100, Alexandru Elisei wrote:
> > Only arm and arm64 are allowed to set --target to kvmtool; the rest of the
> > architectures can only set --target to 'qemu', which is also the default.
> > 
> > Needed to make the changes necessary to add support for kvmtool to the test
> > runner.
> > 
> > kvmtool also supports running the riscv tests, so it's not outside of the
> > realm of the possibily for the riscv tests to get support for kvmtool.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  configure | 36 ++++++++++++++++++++++++------------
> >  1 file changed, 24 insertions(+), 12 deletions(-)
> >
> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Thank you for the review!

Just to be clear, you are ok with this happening because of the patch:

$ git pull
$ make clean && make
$ ./run_tests.sh
scripts/runtime.bash: line 24: scripts/arch-run.bash: line 444: [: =: unary operator expected
timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel _NO_FILE_4Uhere_ 2 #  /tmp/tmp.bME9I2BZRG
qemu-system-x86_64: 2: Could not open '2': No such file or directory
scripts/arch-run.bash: line 19: 1: command not found: No such file or directory
FAIL apic-split
scripts/runtime.bash: line 24: scripts/arch-run.bash: line 444: [: =: unary operator expected
timeout -k 1s --foreground 90s /usr/bin/qemu-system-x86_64 --no-reboot -nodefaults -device pc-testdev -device isa-debug-exit,iobase=0xf4,iosize=0x4 -vnc none -serial stdio -device pci-testdev -machine accel=kvm -kernel _NO_FILE_4Uhere_ 1 #  /tmp/tmp.11und6qZbL
qemu-system-x86_64: 1: Could not open '1': No such file or directory
scripts/arch-run.bash: line 19: 1: command not found: No such file or directory
FAIL ioapic-split
[..]

That's because TARGET is missing from config.mak. If you're ok with the
error, I'll make it clear in the commit message why this is happening.

Thanks,
Alex

