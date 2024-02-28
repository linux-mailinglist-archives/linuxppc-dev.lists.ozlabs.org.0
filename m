Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DDB86AEF2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 13:17:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pqQnPSIw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlCyt3kkhz3dfy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 23:17:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pqQnPSIw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.175; helo=out-175.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlCy93KVYz3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 23:16:33 +1100 (AEDT)
Date: Wed, 28 Feb 2024 13:16:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709122573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wM98DJQbhZYjRdplTBCkZEIdEO7RGCuW3V3a9owHybw=;
	b=pqQnPSIwB9gF/E/daD75fzl480laee7IEPIMXVOAUhpEWRm0533/KLZrWm3qI08axtxkER
	ZkGExNnn/5BZWQVoMjpBNO/qs8K24SHvhi8q+ucjaAmI32Ub9qORK6CgDJ287qnQDTuZ3v
	CeQabBnvIsovTkeSuhzl22zkC2DVmt0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 32/32] powerpc: gitlab CI update
Message-ID: <20240228-86aa66c910b91dfebb8afee8@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-33-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226101218.1472843-33-npiggin@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 08:12:18PM +1000, Nicholas Piggin wrote:
> This adds testing for the powernv machine, and adds a gitlab-ci test
> group instead of specifying all tests in .gitlab-ci.yml.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  .gitlab-ci.yml        | 16 ++++++----------
>  powerpc/unittests.cfg | 15 ++++++++-------
>  2 files changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 61f196d5d..51a593021 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -69,11 +69,9 @@ build-ppc64be:
>   - cd build
>   - ../configure --arch=ppc64 --endian=big --cross-prefix=powerpc64-linux-gnu-
>   - make -j2
> - - ACCEL=tcg ./run_tests.sh
> -     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
> -     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
> -     emulator
> -     | tee results.txt
> + - ACCEL=tcg MAX_SMP=8 ./run_tests.sh -g gitlab-ci | tee results.txt
> + - if grep -q FAIL results.txt ; then exit 1 ; fi
> + - ACCEL=tcg MAX_SMP=8 MACHINE=powernv ./run_tests.sh -g gitlab-ci | tee results.txt
>   - if grep -q FAIL results.txt ; then exit 1 ; fi
>  
>  build-ppc64le:
> @@ -82,11 +80,9 @@ build-ppc64le:
>   - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
>   - ./configure --arch=ppc64 --endian=little --cross-prefix=powerpc64-linux-gnu-
>   - make -j2
> - - ACCEL=tcg ./run_tests.sh
> -     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
> -     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
> -     emulator
> -     | tee results.txt
> + - ACCEL=tcg MAX_SMP=8 ./run_tests.sh -g gitlab-ci | tee results.txt
> + - if grep -q FAIL results.txt ; then exit 1 ; fi
> + - ACCEL=tcg MAX_SMP=8 MACHINE=powernv ./run_tests.sh -g gitlab-ci | tee results.txt
>   - if grep -q FAIL results.txt ; then exit 1 ; fi
>  

We're slowly migrating all tests like these to

 grep -q PASS results.txt && ! grep -q FAIL results.txt

Here's a good opportunity to change ppc's.

Thanks,
drew
