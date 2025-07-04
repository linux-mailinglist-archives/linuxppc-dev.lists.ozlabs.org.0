Return-Path: <linuxppc-dev+bounces-10084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E886DAF8C37
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 10:42:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYRvz5pMcz30Tm;
	Fri,  4 Jul 2025 18:42:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b7"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751618543;
	cv=none; b=N59gqK/IX+V2Jp8iYv0oEllogejiO9UIcFvN2vZjP/kEtoQxXKODMBePGZIItcZSgjNzea9gtNlubchVtRWhRYWPNdd0s/3ldFavj2/bSVKMG9TM7nJLl4Ig/Rm8Zfzol7zyCFiUnFriPQS5+3Z4L+oiOj0AoWsSfxtYI6T6KDHRTXER3xqYsSX6IsqgN3q3T6qN2GtIp+gTtU/yHzxfDepVxiaC8/TQjQbaetvm7yPkWG8pIngEFtgt2De8uYNp1kkuHxfG/zrR1W/+mjXXeEBX3bY5Z3hJpb00lqpOL7HyW/N2E0mrFAGZdzvzSz8R/xLJ+6Eh6nqwBiigcfHcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751618543; c=relaxed/relaxed;
	bh=3PnaSGtLpzW5dir2K2BrEyMD5UpUXb/WyC+H8PujG7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+bCCjWRH1oRYUk5Zdv2YPTAPtJKJmzxerzU8ulT8Ll6XJABOmlmvVKPAvQaBNoYu4jWHZKGaP8XpK1jSdTNOgH2iHMD7J9kIjA5RVgYSy7SZyiTkIu9PwyM+Y+YWAAkR54TspXgnCQtohakNarfv0sqQ/H/wPoAl7+4zPM9s/nlM89q48YUMxOqfKGrq7ttIC8tHNxrAL4Yr22TnIH9ooErWoOrqSm1gWIeILa2uD2FjY8NamRiaKs1hPu9ZkModguIshMCcw0nDEfrRv9csJrwE1eRYdrjW3AibDvyT9nVfFr8SXn2eIN+0wLnat82CT6C3KHqoFpixt6qS0daSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=urgOd1aZ; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b7; helo=out-183.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=urgOd1aZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b7; helo=out-183.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 155873 seconds by postgrey-1.37 at boromir; Fri, 04 Jul 2025 18:42:23 AEST
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [IPv6:2001:41d0:203:375::b7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYRvz12xtz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 18:42:22 +1000 (AEST)
Date: Fri, 4 Jul 2025 10:41:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751618521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3PnaSGtLpzW5dir2K2BrEyMD5UpUXb/WyC+H8PujG7Q=;
	b=urgOd1aZHEwU+HOxLQWi5GvXP2k5P56SbDD8NDOc49RcISR8mr1EFZbcesPVRdbN1m7oAh
	kUPg88LuxHtjy2dAyNloPJXePywzyt89TRKSuW8cK4SqhYp1NAMI2dsOwHn9bbuihdkScS
	hMJrMblwswPleTxW+/PJzf6Xl6mDONM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, shahuang@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 00/13] arm/arm64: Add kvmtool to the
 runner script
Message-ID: <20250704-ca0e2f54c803b35428c13e0d@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
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
In-Reply-To: <20250625154813.27254-1-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 25, 2025 at 04:48:00PM +0100, Alexandru Elisei wrote:
> v3 can be found here [1]. Based on top of the series that add qemu_params and
> test_args [2].
> 
> To goal is to allow the user to do:
> 
> $ ./configure --target=kvmtool
> $ make clean && make
> $ ./run_tests.sh
> 
> to run all the tests automatically with kvmtool.
> 
> Reasons to use kvmtool:
> 
> * kvmtool is smaller and a lot easier to modify compared to qemu, which
> means developers may prefer it when adding or prototyping new features to
> KVM, and being able to run all the tests reliably and automatically is very
> useful.
> 
> * kvmtool is faster to run the tests (a couple of times faster on
> my rockpro64), making for a quick turnaround. But do keep in mind that not
> all tests work on kvmtool because of missing features compared to qemu.
> 
> * kvmtool does things differently than qemu: different memory layout,
> different uart, PMU emulation is disabled by default, etc. This makes it a
> good testing vehicule for kvm-unit-tests itself.
>

Merged. Thanks

