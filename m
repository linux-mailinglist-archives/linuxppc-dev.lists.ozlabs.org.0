Return-Path: <linuxppc-dev+bounces-6035-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DF8A2EF07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 14:57:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys5jT0958z3039;
	Tue, 11 Feb 2025 00:57:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739195820;
	cv=none; b=YWzyCioWXVzStkkPd4eL9RFFDryQhSLliyShiMgN7yk+noHq73kNAlDxa2SZYcGkzVJg49Sk0GQHIx+q/zqDnS4m5rtQqT8BydCclbzX1KEMfKUmOm39f6BFV+lYyehy4Tc2tpHyqyK11RaqKSsrh5xqM3C3U10eCBTE+2YkSQxo2elsuqFexNxrIt1CFDoAqXBb4cWxTP5qEXP5dTSy1qup/i8J1NdaGKMU+wWH+9/NQmXSN3ae/W469E+A3FMg4UuzDK+wwPYuRli2GLiLpntjLSGUiwMLl343SgxlugJyI/RjSGiESRE3Mqc1fo9kMJZwZzT4b86ScaQirVIANg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739195820; c=relaxed/relaxed;
	bh=6QxzYCLsT1iF2vEH4te1D9LwJ9LeHeBIIOwbWx7d42w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQuHoCsc5OThNsMGJxvnkztqx7loWvUUShDdMyA7sWQFgxKxHbVuy6bs2ozdHrkciw+BfVc5ZQ8Gxf3pHUKa7eanf8mWRq9agOLlSTrRK+en5m5v5VmoCWoQc4EXJ1NNuLTv/ZGQ57Zx1qoRLfFscj7C6/Esv3jBnvg/SkDMiRUVML517YtjokZTdk8nzQWkGaBZJieqgjY3OON/nzWJS8AiMO4/Q5/JgErfkACnlgeOxq5JYhTdDXH2kVgUzF9rVovjLak6Xl2FYOISHJvOag+XH5De3y/EueqCl0tvJtq62ZOB9jK+VGbKeLN/O+UVZjBeq+stT2hha932cW6yAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dIuJ8mBP; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b1; helo=out-177.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dIuJ8mBP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b1; helo=out-177.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ys5jQ0V5Pz3011
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 00:56:56 +1100 (AEDT)
Date: Mon, 10 Feb 2025 14:56:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739195793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6QxzYCLsT1iF2vEH4te1D9LwJ9LeHeBIIOwbWx7d42w=;
	b=dIuJ8mBPN9XRylpd0pPPFZlnRPzIyaQDOvW0+7vWIUtPOd2ArfJa0ls/kBVEdV/3K7OzxY
	+z4sIcp3tfj6ipAoTidGAq1+R2gNDZyi7Hqj9GfQB/u73/sfLMykVg9BonbVXgeJjsK9Ck
	4n33sBQo2Qlb3R1Ld27i0JM9Q6o2hus=
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
Subject: Re: [kvm-unit-tests PATCH v2 03/18] scripts: Refuse to run the tests
 if not configured for qemu
Message-ID: <20250210-640ff37c16a0dbccb69f08ea@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-4-alexandru.elisei@arm.com>
 <20250121-45faf6a9a9681c7c9ece5f44@orel>
 <Z6nX8YC8ZX9jFiLb@arm.com>
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
In-Reply-To: <Z6nX8YC8ZX9jFiLb@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 10, 2025 at 10:41:53AM +0000, Alexandru Elisei wrote:
> Hi Drew,
> 
> On Tue, Jan 21, 2025 at 03:48:55PM +0100, Andrew Jones wrote:
> > On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
> <snip>
> > > ---
> > >  arm/efi/run             | 8 ++++++++
> > >  arm/run                 | 9 +++++++++
> > >  run_tests.sh            | 8 ++++++++
> > >  scripts/mkstandalone.sh | 8 ++++++++
> > >  4 files changed, 33 insertions(+)
> <snip>
> > > +case "$TARGET" in
> > > +qemu)
> > > +    ;;
> > > +*)
> > > +    echo "'$TARGET' not supported for standlone tests"
> > > +    exit 2
> > > +esac
> > 
> > I think we could put the check in a function in scripts/arch-run.bash and
> > just use the same error message for all cases.
> 
> Coming back to the series.
> 
> arm/efi/run and arm/run source scripts/arch-run.bash; run_tests.sh and
> scripts/mkstandalone.sh don't source scripts/arch-run.bash. There doesn't
> seem to be a common file that is sourced by all of them.

scripts/mkstandalone.sh uses arch-run.bash, see generate_test().
run_tests.sh doesn't, but I'm not sure it needs to validate TARGET
since it can leave that to the lower-level scripts.

> 
> How about creating a new file in scripts (vmm.bash?) with only this
> function?

If we need a new file, then we can add one, but I'd try using
arch-run.bash or common.bash first.

Thanks,
drew

