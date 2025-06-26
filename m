Return-Path: <linuxppc-dev+bounces-9837-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB63AEA3AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 18:42:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSkxm5BS9z30WQ;
	Fri, 27 Jun 2025 02:42:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750956156;
	cv=none; b=Qb89exKlF6P8zHta4vClnkdSys24mWi6OgK79Jy6ktvYHIk31ZyIm3oHWsaouh2dyeIfA/AlHIagvqA6MhZd7Bop/gJdq9X8fUYturAYn7KnFdCHvIh8sEYGTZbgmYLjro5e3ViCVY1tpkEzmmwVij6RFjgIgHPYgl0ncIt3ts2SDRtfXMVbDGw2TTc0d27n1i/8FdteFKqlNtDTAusCJXHNjJCCKOYshpvK65qiK94ELrR1kQ7B4IIiGCrpjxVp9javm/o0xUBkEdTXLQaRijO/+3JYL3ABv5VU/70ORs18k5n75d2BLZ/z6/oS01jVfxBwPGMn7DHJDxc4Su9ppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750956156; c=relaxed/relaxed;
	bh=GZvWWn55QpukuTVv7Bqo3ivQLuTYYdxjF7fi6NCPLEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEZ20H1dBjhAr3qHkBdbOXtTHPLJEWEN9eqdf54Vjq2xtGnDOZNLzUW5YsHtI9QBkC/p/ZObOW8inAWk9wTNUfxLOMZ4G9kwn0083zuQti4oC/PEPbjCGwUrSQPYghQzg5jRkozff1YdXkz2Y3aKFs+7/a+v+3jBRa8EtSLG36SF4r+02cX5J4SKie+RxgCTXzfhIg2faBmH1DcnFOUDGhw8+K66a6PZaucmAFphU9/hzIHuaD7PElVnzhTVLPU70VUsynPTnw7+rY/PeMCBQBzY0A6e23x3jcRH+ohYNDXZ2ykOKKL18/06Do4yCEe9h0SMhb2aaCH1YuqG18E/4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSkxl5n8Hz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 02:42:34 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C4361758;
	Thu, 26 Jun 2025 09:41:44 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90A683F66E;
	Thu, 26 Jun 2025 09:41:57 -0700 (PDT)
Date: Thu, 26 Jun 2025 17:41:54 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com,
	shahuang@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 05/13] scripts: Add 'kvmtool_params' to
 test definition
Message-ID: <aF14UnQYBR9Knv4-@raptor>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-6-alexandru.elisei@arm.com>
 <20250626-536c0af00aa655d6e647df44@orel>
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
In-Reply-To: <20250626-536c0af00aa655d6e647df44@orel>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Drew,

On Thu, Jun 26, 2025 at 05:34:05PM +0200, Andrew Jones wrote:
> On Wed, Jun 25, 2025 at 04:48:05PM +0100, Alexandru Elisei wrote:
> > arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> > running and configuring a virtual machine is different to qemu. To run
> > tests using the automated test infrastructure, add a new test parameter,
> > 'kvmtool_params'. The parameter serves the exact purpose as 'qemu_params',
> > but using kvmtool's syntax.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> > 
> > Changes v3->v4:
> > 
> > * Added params_name in scripts/common.bash::for_each_unittest() to avoid
> > checking for $TARGET when deciding to parse kvmtool_params or
> > {qemu,extra}_params.
> > * Dropped factoring out parse_opts() in for_each_unittest().
> > 
> >  arm/unittests.cfg   | 24 ++++++++++++++++++++++++
> >  docs/unittests.txt  |  8 ++++++++
> >  scripts/common.bash | 11 +++++++----
> >  scripts/vmm.bash    | 16 ++++++++++++++++
> >  4 files changed, 55 insertions(+), 4 deletions(-)
[..]
> > +function vmm_unittest_params_name()
> > +{
> > +	# shellcheck disable=SC2155
> > +	local target=$(vmm_get_target)
> > +
> > +	case "$target" in
> > +	qemu)
> > +		echo "extra_params|qemu_params"
> > +		;;
> > +	*)
> > +		echo "$0 does not support '$target'"
> > +		exit 2
> > +		;;
> 
> It seems a bit odd that we've introduced kvmtool_params and applied it to
> arm in this patch, but we still don't support it. Not a huge deal, though.

Originally it was part of a huge patch that added everything in one go, it
was this patch and the next 6 or 7 patches combined. The feedback I got at
the time was to split it into more manageable chunks, which is very
understandable. So this is how I ended up with this patch, to make the
series easier to digest.

> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Thanks for the review!

Alex

