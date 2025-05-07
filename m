Return-Path: <linuxppc-dev+bounces-8406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A537DAAE649
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 18:15:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt0jk2p7Qz2yS6;
	Thu,  8 May 2025 02:15:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746634538;
	cv=none; b=MQVWJCv8ij98iCDvVgsfL1ICohifjbET7FaJQT9ENWipBk02n7Uvf9tswRCmzYhY4bduAj/R3LkPCqg+Ui0uN9dwH0V0a7rBI92YntlgqvCotIdP8Qa4dxj66KdRBRRnSAdoIbeq8ygCgR82oVAab3RcQCTiePxh1WURpOXjosm22V6zewiDteKDgF6HfnLC20lIeEUcknSirwoLyQ1EUkVb2MlaXFCDD+48xlipEDxyAWVvY3Yw2mnGkn1/pQQyLGsSwt8bQ6y9yEdB+efTpjbbLVM/jx6MbC9PIx7INQzvHEIkR5zMTAteQ6nLF2HvRmWzUv+ohTEaD62/1iZvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746634538; c=relaxed/relaxed;
	bh=mIpRexvH1m0L3S2cszGXiwb7jguNUciLehBoI9ZI01c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACwgkiuLEIOcDf6FOhLnGCcInORnsN2lMS1O8NxdKK+fCCYS3XaqpFvvAKRcYtQvTnNDXP2umXeREUfcxyXBdeu0qPJeol9CsQT5Q+y70RQ/m5Nf/c327l3gObQJgptrYbh8xe5VMbknk+WDEvMLuuXVyGQewQgZLeHZ3QilsnzvHf/29EQo107ggSPaFAJP5U4zcnlubLjVjLTOft3E7bQD1cnTXtNO9dQODbzkD3GSNt6ZSyqYykG2kkV2J4hMJYPojW7MPWpAYZe2Afcu0B2spRgk1J83+0DmbipWn6QBrVtMNKpwhM6vaHzfkpVEVMHHVofwqAhlp9tWS1BA/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt0jd4pbVz307K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 02:15:31 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9296F16F2;
	Wed,  7 May 2025 09:14:49 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8307E3F58B;
	Wed,  7 May 2025 09:14:56 -0700 (PDT)
Date: Wed, 7 May 2025 17:14:53 +0100
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
Subject: Re: [kvm-unit-tests PATCH v3 06/16] scripts: Refuse to run the tests
 if not configured for qemu
Message-ID: <aBuG_fx2dc99mXCU@raptor>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-7-alexandru.elisei@arm.com>
 <20250507-9143a202e9745535dd43b5a8@orel>
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
In-Reply-To: <20250507-9143a202e9745535dd43b5a8@orel>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Drew,

On Wed, May 07, 2025 at 06:10:08PM +0200, Andrew Jones wrote:
> On Wed, May 07, 2025 at 04:12:46PM +0100, Alexandru Elisei wrote:
> > Arm and arm64 support running the tests under kvmtool. kvmtool has a
> > different command line syntax for configuring and running a virtual
> > machine, and the automated scripts know only how to use qemu.
> > 
> > One issue with that is even though the tests have been configured for
> > kvmtool (with ./configure --target=kvmtool), the scripts will use qemu to
> > run the tests, and without looking at the logs there is no indication that
> > the tests haven't been run with kvmtool, as configured.
> > 
> > Another issue is that kvmtool uses a different address for the UART and
> > when running the tests with qemu via the scripts, this warning is
> > displayed:
> > 
> > WARNING: early print support may not work. Found uart at 0x9000000, but early base is 0x1000000.
> > 
> > which might trip up an unsuspected user.
> > 
> > There are four different ways to run a test using the test infrastructure:
> > with run_tests.sh, by invoking arm/run or arm/efi/run with the correct
> > parameters (only the arm directory is mentioned here because the tests can
> > be configured for kvmtool only on arm and arm64), and by creating
> > standalone tests.
> > 
> > run_tests.sh ends up execuing either arm/run or arm/efi/run, so add a check
> 
> executing

Ack.

> 
> > to these two scripts for the test target, and refuse to run the test if
> > kvm-unit-tests has been configured for kvmtool.
> > 
> > mkstandalone.sh also executes arm/run or arm/efi run, but the usual use
> > case for standalone tests is to compile them on one machine, and then to
> > run them on a different machine. This two step process can be time
> > consuming, so save the user time (and frustration!) and add a check
> > directly to mkstandalone.sh.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  arm/efi/run             |  3 +++
> >  arm/run                 |  4 ++++
> >  scripts/mkstandalone.sh |  3 +++
> >  scripts/vmm.bash        | 14 ++++++++++++++
> >  4 files changed, 24 insertions(+)
> >  create mode 100644 scripts/vmm.bash
> > 
> > diff --git a/arm/efi/run b/arm/efi/run
> > index 8f41fc02df31..53d71297cc52 100755
> > --- a/arm/efi/run
> > +++ b/arm/efi/run
> > @@ -11,6 +11,9 @@ if [ ! -f config.mak ]; then
> >  fi
> >  source config.mak
> >  source scripts/arch-run.bash
> > +source scripts/vmm.bash
> > +
> > +check_vmm_supported
> >  
> >  if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
> >  	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
> > diff --git a/arm/run b/arm/run
> > index ef58558231b7..56562ed1628f 100755
> > --- a/arm/run
> > +++ b/arm/run
> > @@ -7,7 +7,11 @@ if [ -z "$KUT_STANDALONE" ]; then
> >  	fi
> >  	source config.mak
> >  	source scripts/arch-run.bash
> > +	source scripts/vmm.bash
> >  fi
> > +
> > +check_vmm_supported
> > +
> >  qemu_cpu="$TARGET_CPU"
> >  
> >  if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> > diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> > index c4ba81f18935..4f666cefe076 100755
> > --- a/scripts/mkstandalone.sh
> > +++ b/scripts/mkstandalone.sh
> > @@ -6,6 +6,9 @@ if [ ! -f config.mak ]; then
> >  fi
> >  source config.mak
> >  source scripts/common.bash
> > +source scripts/vmm.bash
> > +
> > +check_vmm_supported
> >  
> >  temp_file ()
> >  {
> > diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> > new file mode 100644
> > index 000000000000..39325858c6b3
> > --- /dev/null
> > +++ b/scripts/vmm.bash
> > @@ -0,0 +1,14 @@
> > +source config.mak
> > +
> > +function check_vmm_supported()
> > +{
> > +	case "$TARGET" in
> > +	qemu)
> > +		return 0
> > +		;;
> > +	*)
> > +		echo "$0 does not support target '$TARGET'"
> > +		exit 2
> > +		;;
> > +	esac
> > +}
> 
> Hmm. We now have configure saying one thing for arm/arm64 and this
> function saying another. Assuming this is just temporary and will
> be resolved in the next patches, then that's probably OK, though.

This is resolved in the last patch. Wanted to add this in case someone doesn't
apply the entire series and they end up with partial kvmtool support.

And thanks for having a look so fast!

Alex

> 
> Thanks,
> drew

