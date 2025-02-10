Return-Path: <linuxppc-dev+bounces-6027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D672FA2E9CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 11:42:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys1PC3xx3z2yvv;
	Mon, 10 Feb 2025 21:42:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739184159;
	cv=none; b=AipE+NJEIBC5fWCFOxn1KAqBAz30YLRo6N0PajkzWCQDBRvlpI+vkMIXzSlfI0AcT4tNF2fsnLHfei2+nx9fkdNqbfhdMV7NhLaAkVylsLzlTQkRCKn2Su8Z4IMuqNkOqyIeB2I1zlUF2uAmuro+RgVfCd9RINB1Wu6iQCK6jTvFxdAtpGYdHMWAuC9M5Oy96G1UTYidaXoLsy19MpQRa6wPN56iKgGZD63lFmMTSQDqhpKkcX3t43GVhxV55B7lItJAORlWAGiNlpSC1nKzlUzREdjPP3UFwNK81ubC9KIfzAtzp1QKnZdQUZCcqLr2l5KUQsm2WelGji4m62ZjyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739184159; c=relaxed/relaxed;
	bh=D58ITBFHfzc8vxgriQAfZFb/HH8jJxVxINvWSsTKHzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/Jl64wV6YZrWzk24dKVb87Mr4W4WWU6IeJBf5cPzjAPGXPE4HCwXVjADj83UX0BkeaQ+Ygj3fHZwpdT8BDW+cnqs9fyhGB5xH2SRShPd4nOk1arMBV/47iU77BovCxDE3y1YI47nWXPpG2OPQgRFOIprQkCIStblazdrnqDY2Rl2HUq/W0ec0mcOaaLLz+y3/f+mjyeI4nYCLIvB0DBguIGsJXFHCeXRUa/nKZVi8j11nGjcg3H7d4lbjbR/M7RXZ0j3Bmo65PJCJOt+7ZrQ0yBHSIMjn79S5511eI3vq0QcRh4EspzO+WE55izVfPCARzM6Chn9aMi3BO5WZsWBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys1PB0sLtz2ysf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 21:42:36 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35AA11BA8;
	Mon, 10 Feb 2025 02:42:27 -0800 (PST)
Received: from arm.com (unknown [10.57.76.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 510A33F58B;
	Mon, 10 Feb 2025 02:41:58 -0800 (PST)
Date: Mon, 10 Feb 2025 10:41:53 +0000
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
Message-ID: <Z6nX8YC8ZX9jFiLb@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-4-alexandru.elisei@arm.com>
 <20250121-45faf6a9a9681c7c9ece5f44@orel>
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
In-Reply-To: <20250121-45faf6a9a9681c7c9ece5f44@orel>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Drew,

On Tue, Jan 21, 2025 at 03:48:55PM +0100, Andrew Jones wrote:
> On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
<snip>
> > ---
> >  arm/efi/run             | 8 ++++++++
> >  arm/run                 | 9 +++++++++
> >  run_tests.sh            | 8 ++++++++
> >  scripts/mkstandalone.sh | 8 ++++++++
> >  4 files changed, 33 insertions(+)
<snip>
> > +case "$TARGET" in
> > +qemu)
> > +    ;;
> > +*)
> > +    echo "'$TARGET' not supported for standlone tests"
> > +    exit 2
> > +esac
> 
> I think we could put the check in a function in scripts/arch-run.bash and
> just use the same error message for all cases.

Coming back to the series.

arm/efi/run and arm/run source scripts/arch-run.bash; run_tests.sh and
scripts/mkstandalone.sh don't source scripts/arch-run.bash. There doesn't
seem to be a common file that is sourced by all of them.

How about creating a new file in scripts (vmm.bash?) with only this
function?

Thanks,
Alex

> 
> Thanks,
> drew
> 
> > 
> > -- 
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv

