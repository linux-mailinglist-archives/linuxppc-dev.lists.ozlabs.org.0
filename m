Return-Path: <linuxppc-dev+bounces-5255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB24EA10D80
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 18:21:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbWt54mnz3bcp;
	Wed, 15 Jan 2025 04:21:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736875290;
	cv=none; b=Kp13ia1bFN4AbBmyXyjomo4SKERFEm0PwkvyqKPzOXk2hYNlVuvNKnvHWn/j4p+x6SkgAO++/ivtYnwdU1w5JOPIaEcasRiJFvFpzelIZ5l+8SCaA+WxC3OX+YMzd8/UMAnAOVfc2KMOGG58YdRDwHd9p4Z3fckuMNJeWy98RRHAMrorXbA+qj0YKCQ9u5rU9e/VPcbeDaXUG1uq5/6Qp3qhnV1mguPBsPEfQh1wT+8lk4pNh4kX0bdNUtPycjpOE7JXrOqLKHRXpFiUP2fkMOAMzPKO7nfc+SIQU8iUGUVi6JgiPxh/7KH8YT2kpOh4QMaKvgXAADIWHdIYB8HpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736875290; c=relaxed/relaxed;
	bh=DAaLPPV83zzmtDhv+uIUM1iJOvVDXU9liNKtwJnm6mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3P6A69bk1WimT3im+pISm+a2SbU4lWgv95KIaVMIutPlDwT6dFFE821hAIbsOGSbAwLY0UQjYr8oyN8yqOuOd7X41zwHQC/qGwxWor4fcyR9FCnufLZ9IyI/sqVo6kNlL2o9EZIvtqofBxeU+33H+ttx4lSRWHRnD5WkRCJgllNjzOPGa1K6crt0JvR8xTuepoDUOGXRXnLkhlmA2RwGqX2QrQmDQXGxyI1PL9V18Obyw31kNANamXgwqwrGsIkkoGxc4pRokEgctwDZXrwk5xiOTjWYl2uZ546qrr+RBXcp9Nyrjf1V7V95j5OrX9Z9zS5gDg6UrImQb0JdpGz5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXbWs63xjz3bbR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:21:29 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C27D12FC;
	Tue, 14 Jan 2025 09:21:27 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.32.102.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6FEA3F673;
	Tue, 14 Jan 2025 09:20:55 -0800 (PST)
Date: Tue, 14 Jan 2025 17:20:52 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 5/5] configure: arm64: Make 'max' the
 default for --processor
Message-ID: <Z4ac9BcP2iHldv/L@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-6-alexandru.elisei@arm.com>
 <20250113-f6e1c55d5200410161aa61b5@orel>
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
In-Reply-To: <20250113-f6e1c55d5200410161aa61b5@orel>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Drew,

On Mon, Jan 13, 2025 at 04:29:21PM +0100, Andrew Jones wrote:
> On Fri, Jan 10, 2025 at 01:58:48PM +0000, Alexandru Elisei wrote:
> > Newer architecture features are supported by qemu TCG on newer CPUs. When
> > writing a test for such architecture features, it is necessary to pass the
> > correct -cpu argument to qemu. Make it easier on users and test authors
> > alike by making 'max' the default value for --processor. The 'max' CPU
> > model contains all the features of the cortex-a57 CPU (the old default), so
> > no regression should be possible.
> > 
> > A side effect is that, by default, the compiler will not receive a -mcpu
> > argument for compiling the code. The expectation is that this is fine,
> > since support for -mcpu=$PROCESSOR has only been added for arm64 in the
> > last commit.
> > 
> > The default for arm (cortex-a15) has been kept unchanged, because passing
> > --processor=max will cause compilation to break. If the user wants the qemu
> > CPU model to be 'max', the user will also have to supply a suitable compile
> > CPU target via --cflags=-mcpu=<cpu> configure option.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  configure | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/configure b/configure
> > index 46964d36a7d8..3ab0ec208e10 100755
> > --- a/configure
> > +++ b/configure
> > @@ -14,7 +14,7 @@ function get_default_processor()
> >          default_processor="cortex-a15"
> >          ;;
> >      "arm64" | "aarch64")
> > -        default_processor="cortex-a57"
> > +        default_processor="max"
> >          ;;
> >      *)
> >          default_processor=$arch
> > -- 
> > 2.47.1
> >
> 
> Another reason to introduce a new parameter (qemu_cpu) is that we can also
> change arm32 to 'max', reducing divergence between arm32 and arm64.

That sounds very sensible, I'll do that for the next iteration.

Thanks,
Alex

