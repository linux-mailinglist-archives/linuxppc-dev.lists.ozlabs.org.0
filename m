Return-Path: <linuxppc-dev+bounces-6043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D75A2F65C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 19:05:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsCCr3YwSz2yG9;
	Tue, 11 Feb 2025 05:05:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739210712;
	cv=none; b=QJO9+V/ZFqxgVLhVeo3M5yv44HTn3zif0R9DrBMabu1gU4neY6gOGAfTLdjrGDYNboNes4AsHxa++dV7DlsW498T1DTJZlL0cD8pCy1QORdYlFm6qIcPaS6l+YPvwfAkveTVcBW9E3jmyGN8A+X0ZGzLRiUYropLWKQjR5KiUO8azLOpDBDg5xBzHTWJq70xaQFVqA/uVEwsU8fgPG4JA09B2gVl29D5fCMTki0YcUNefdAwkfEKo2N/DCR+wDG7gPCecNs4wdwO4uL5BegT6r6pajjWzEKdig7ONu2Qi46WdUFXqv8xWruGxyeS5PlRyPFenf2A1FXHbvjnTy1fHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739210712; c=relaxed/relaxed;
	bh=4pyJyv38s7QVArbc9PpAQ1FGuknHhnhu04O/9fFPaTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHLOYiSHRD4fxRQLDSDPMbZqCB3XH2v/6FLFC4YvmUs4jbtrdTCKKE0asVsYuQ3FEYDO3F8uQ4/sp7R2rvokWyBuGYzhoFBrY7PeGmfyZTpOimhENn8gJQjSHUF4S72uDL6Dn2OwfDh6iDcvghRlSg88V0BuBChhcXQL8LCqtrWkYzr0SEEXsrFQyfRR+gP2u+orGPnlyhBbrvfzdBjIorlhAb8qWRkiA7I3mlScpeIoWcvytER1L8snY56Qnx4HhLhM4OYPTrEzjxF65iFcW/iw72swZqz9Htf1XyHc5R9Bd7dP7AEcqE40QLhVfC/kZKd/b9ZwnnScJoQgwLVc5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsCCq28l1z2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 05:05:09 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D671B1477;
	Mon, 10 Feb 2025 10:04:58 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.1.26.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58DAB3F58B;
	Mon, 10 Feb 2025 10:04:32 -0800 (PST)
Date: Mon, 10 Feb 2025 18:04:29 +0000
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
Message-ID: <Z6o/rbweZttGReir@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-4-alexandru.elisei@arm.com>
 <20250121-45faf6a9a9681c7c9ece5f44@orel>
 <Z6nX8YC8ZX9jFiLb@arm.com>
 <20250210-640ff37c16a0dbccb69f08ea@orel>
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
In-Reply-To: <20250210-640ff37c16a0dbccb69f08ea@orel>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Drew,

On Mon, Feb 10, 2025 at 02:56:25PM +0100, Andrew Jones wrote:
> On Mon, Feb 10, 2025 at 10:41:53AM +0000, Alexandru Elisei wrote:
> > Hi Drew,
> > 
> > On Tue, Jan 21, 2025 at 03:48:55PM +0100, Andrew Jones wrote:
> > > On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
> > <snip>
> > > > ---
> > > >  arm/efi/run             | 8 ++++++++
> > > >  arm/run                 | 9 +++++++++
> > > >  run_tests.sh            | 8 ++++++++
> > > >  scripts/mkstandalone.sh | 8 ++++++++
> > > >  4 files changed, 33 insertions(+)
> > <snip>
> > > > +case "$TARGET" in
> > > > +qemu)
> > > > +    ;;
> > > > +*)
> > > > +    echo "'$TARGET' not supported for standlone tests"
> > > > +    exit 2
> > > > +esac
> > > 
> > > I think we could put the check in a function in scripts/arch-run.bash and
> > > just use the same error message for all cases.
> > 
> > Coming back to the series.
> > 
> > arm/efi/run and arm/run source scripts/arch-run.bash; run_tests.sh and
> > scripts/mkstandalone.sh don't source scripts/arch-run.bash. There doesn't
> > seem to be a common file that is sourced by all of them.
> 
> scripts/mkstandalone.sh uses arch-run.bash, see generate_test().

Are you referring to this bit:

generate_test ()
{
	<snip>
        (echo "#!/usr/bin/env bash"
         cat scripts/arch-run.bash "$TEST_DIR/run")

I think scripts/arch-run.bash would need to be sourced for any functions defined
there to be usable in mkstandalone.sh.

What I was thinking is something like this:

if ! vmm_supported $TARGET; then
	echo "$0 does not support '$TARGET'"
	exit 2
fi

Were you thinking of something else?

I think mkstandalone should error at the top level (when you do make
standalone), and not rely on the individual scripts to error if the VMM is
not supported. That's because I think creating the test files, booting a
machine and copying the files only to find out that kvm-unit-tests was
misconfigured is a pretty suboptimal experience.

> run_tests.sh doesn't, but I'm not sure it needs to validate TARGET
> since it can leave that to the lower-level scripts.

I put the check in arm/run, and removed it from run_tests.sh, and this is
what I got:

$ ./run_tests.sh selftest-setup
SKIP selftest-setup (./arm/run does not supported 'kvmtool')

which looks good to me.

> 
> > 
> > How about creating a new file in scripts (vmm.bash?) with only this
> > function?
> 
> If we need a new file, then we can add one, but I'd try using
> arch-run.bash or common.bash first.

common.bash seems to work (and the name fits), so I'll give that a go.

Thanks,
Alex

