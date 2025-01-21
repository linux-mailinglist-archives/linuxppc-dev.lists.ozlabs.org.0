Return-Path: <linuxppc-dev+bounces-5462-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05349A181EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 17:21:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcssR2sXCz30VX;
	Wed, 22 Jan 2025 03:21:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737476491;
	cv=none; b=OLVP4euy8e3TJMGrK59msLWeczV7cWMf/5gp2UTM+O06i2oGmWU92C02JQ277aWtHgrabfCzdpLfjstshdXbsZzyM1p5tasnDUNW+I+ClStmAme/tXGeJ+dfKhAIbGeNKARjQhnTGbf4q/MFNtc8V97Z5LiU/Csd3rwULTfjEv7zSVPTYxaOwOzkkhPpXuQsqDV6EeJAhEjB/MH2JBb/nE8VWEhhlhPAQIBmoBX6ALlvx2FCqHBLfWm8t81xb7bXFK2+adVQt79zbllNuJJM9M2l+CvlJWGBZ4zUqhkBhDtWQcvizw7ZGemuu8F2ebfs7vM76sMTVlTDmi+KaNQSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737476491; c=relaxed/relaxed;
	bh=ykmUw+UwvXSE+Q9t7xo9Ir2gW3OYD7TQ1H1ZSY8o5yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2bGCWG4LyT5jDQXFFTXCTo/vivA9fCLe047rAW71no/2sAIYUKTQPVJY6Tm7oRLtNAmTQJCT404uwrZIJVT2FguSwHtrHR5LzmP5okPKJNQY+p8v0k1RwtVtWti35TSvItAopGukpMSXF/Ro8tY8RCvFMWGAull/xFoHd1GhypcNyNwWpusFtEuehKZB9Dpy4SSEhQtdYdj06o8UI8bzEj7NcATvbgth2v2EGE5yfMFbrm9D0uCN0E5RvB/mKH5d2jKpnDD7ZkEx6qP32vsB/itUlxFQYebIWHeaoJovV922YJuLbl9J5ZSrrZrueiJzKnwNWAPeBjCoG7dwIVYEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcssQ3zrbz30Tm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 03:21:30 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A531106F;
	Tue, 21 Jan 2025 08:21:27 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFD103F738;
	Tue, 21 Jan 2025 08:20:55 -0800 (PST)
Date: Tue, 21 Jan 2025 16:20:53 +0000
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
Subject: Re: [kvm-unit-tests PATCH v2 03/18] scripts: Refuse to run the tests
 if not configured for qemu
Message-ID: <Z4_JZUYtQciBnnzd@raptor>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-4-alexandru.elisei@arm.com>
 <20250121-45faf6a9a9681c7c9ece5f44@orel>
 <Z4_DKTMeDQqsqV_6@raptor>
 <20250121-c7f5ba2a25ccbfe793da07f6@orel>
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
In-Reply-To: <20250121-c7f5ba2a25ccbfe793da07f6@orel>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Drew,

On Tue, Jan 21, 2025 at 05:17:22PM +0100, Andrew Jones wrote:
> On Tue, Jan 21, 2025 at 03:54:17PM +0000, Alexandru Elisei wrote:
> > Hi Drew,
> > 
> > On Tue, Jan 21, 2025 at 03:48:55PM +0100, Andrew Jones wrote:
> > > On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
> > > > Arm and arm64 support running the tests under kvmtool. Unsurprisingly,
> > > > kvmtool and qemu have a different command line syntax for configuring and
> > > > running a virtual machine.
> > > > 
> > > > On top of that, when kvm-unit-tests has been configured to run under
> > > > kvmtool (via ./configure --target=kvmtool), the early UART address changes,
> > > > and if then the tests are run with qemu, this warning is displayed:
> > > > 
> > > > WARNING: early print support may not work. Found uart at 0x9000000, but early base is 0x1000000.
> > > > 
> > > > At the moment, the only way to run a test under kvmtool is manually, as no
> > > > script has any knowledge of how to invoke kvmtool. Also, unless one looks
> > > > at the logs, it's not obvious that the test runner is using qemu to run the
> > > > tests, and not kvmtool.
> > > > 
> > > > To avoid any confusion for unsuspecting users, refuse to run a test via the
> > > > testing scripts when kvm-unit-tests has been configured for kvmtool.
> > > > 
> > > > There are four different ways to run a test using the test infrastructure:
> > > > with run_tests.sh, by invoking arm/run or arm/efi/run with the correct
> > > > parameters (only the arm directory is mentioned here because the tests can
> > > > be configured for kvmtool only on arm and arm64), and by creating
> > > > standalone tests. Add a check in each of these locations for the supported
> > > > virtual machine manager.
> > > > 
> > > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > > > ---
> > > >  arm/efi/run             | 8 ++++++++
> > > >  arm/run                 | 9 +++++++++
> > > >  run_tests.sh            | 8 ++++++++
> > > >  scripts/mkstandalone.sh | 8 ++++++++
> > > >  4 files changed, 33 insertions(+)
> > > > 
> > > > diff --git a/arm/efi/run b/arm/efi/run
> > > > index 8f41fc02df31..916f4c4deef6 100755
> > > > --- a/arm/efi/run
> > > > +++ b/arm/efi/run
> > > > @@ -12,6 +12,14 @@ fi
> > > >  source config.mak
> > > >  source scripts/arch-run.bash
> > > >  
> > > > +case "$TARGET" in
> > > > +qemu)
> > > > +    ;;
> > > > +*)
> > > > +    echo "$0 does not support '$TARGET'"
> > > > +    exit 2
> > > > +esac
> > > > +
> > > >  if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
> > > >  	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
> > > >  elif [ -f /usr/share/edk2/aarch64/QEMU_EFI.silent.fd ]; then
> > > > diff --git a/arm/run b/arm/run
> > > > index efdd44ce86a7..6db32cf09c88 100755
> > > > --- a/arm/run
> > > > +++ b/arm/run
> > > > @@ -8,6 +8,15 @@ if [ -z "$KUT_STANDALONE" ]; then
> > > >  	source config.mak
> > > >  	source scripts/arch-run.bash
> > > >  fi
> > > > +
> > > > +case "$TARGET" in
> > > > +qemu)
> > > > +    ;;
> > > > +*)
> > > > +   echo "'$TARGET' not supported"
> > > > +   exit 3
> > > 
> > > I think we want exit code 2 here.
> > 
> > Exit code 2 is already in use in arm/run. Now that I'm looking more closely
> > at it, exit code 2 is already in use in run_tests.sh, same for
> > mkstandalone.sh and arm/efi/run.
> > 
> > How about using 3 everywhere as the exit code?
> >
> 
> In kvm-unit-tests, exit code 2 is what we use for "most likely a run
> script failed" (see the comment above run_qemu() in
> scripts/arch-run.bash). We don't try to create a new error code for each
> type of error, but we do have the error message as well. So if there's a
> higher level runner, which runs this runner, it only needs to learn that
> 2 is likely a script failure and that an error message will hopefully
> point the way to the problem.
> 

I see, I missed the comment. Will change so it returns 2 everywhere.

Thanks,
Alex

