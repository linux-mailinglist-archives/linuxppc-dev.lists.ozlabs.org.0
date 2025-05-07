Return-Path: <linuxppc-dev+bounces-8400-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1FCAAE50E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 17:40:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zszxc6rKTz2xjQ;
	Thu,  8 May 2025 01:40:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ac"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746632452;
	cv=none; b=WQDiuAR0wuFDKOlWypH+rYpmUQZ+JmRNTzKy3yUXMM6PAsTLqqLCC3cnQBvU9uC5Ir0sko0MFAzP9HH6fmfYGoZO4L4SZBgrwZD39Cgtb1tkTrxXJmwFL9axdaGJn1myGi1eexwvmCxALwOnvW4RTyks1uCDNENYxYytzRk5JhDFxqwCF4uQnLAhMfaxNIPHXeUMyt2ZEr6WrM6D5xbdsILjOAYqEaQDK1sg/Vp6Ar9OUh0J0g4xnHs4um6OrS1SgD0irylXUlW8A2W/q6oLuldID1Sad8IM68jPLiAkXB5QVSrurJ0IEVYlcqoQoOAFqgY6S6G/my7gfb73ZeZc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746632452; c=relaxed/relaxed;
	bh=co1RakSltze73RhSdPe5+tIxebPBqHB81ZkmAHOcpdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ht6epT9AoxS6QCGfHz8gNIFCkRvboeYpz/UwFK7Tw5tqlRC8oIkQpzMiDsAMGeZBfMHRwUQIK+15HNlDJWhkYtQkKeHDfLi10xOr8fdQ/5/6Qs2pm9iThKUA4Fr9WrNAKrquCnbeVZkdgafUJ8esoy3PsNdgTQx63/EoZd0RRFIXZgt0m2NawgMjSVhbt0JRPkmDMTmFEpjNjMHPRsw+xgaYcOFtdMmEGGwiSIH7DIHBTQjanc+gEUzassRVdUziayrmnUn5xvTYBHy1+9tsEhO7UOqCu5yHIvCFzPevllqk02Mxl1PqgjFDTqedGaDpYxaXmw9geh0h6GqJP6uu3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m+ZnvXRq; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::ac; helo=out-172.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m+ZnvXRq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ac; helo=out-172.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [IPv6:2001:41d0:203:375::ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZszxY4zdcz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 01:40:49 +1000 (AEST)
Date: Wed, 7 May 2025 17:40:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746632421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=co1RakSltze73RhSdPe5+tIxebPBqHB81ZkmAHOcpdM=;
	b=m+ZnvXRqSSY+K2f52Ea3a1FVRh25m7NSG5ScE7WOkOyjZiNL+rdunFIZHB6LKaYcrDNdR+
	YkWRy/GrECWURW27zLbn9OGhYuj5Dlku3tkYdTOBfmQBW4ZUZl2gZ1MRtzhPQB4bTsAPmP
	bMppl4LQ7OBTi5T6yUWL3oN+mgEz6DI=
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
Subject: Re: [kvm-unit-tests PATCH v3 01/16] scripts: unittests.cfg: Rename
 'extra_params' to 'qemu_params'
Message-ID: <20250507-97151633d3faefe9bd41b7f0@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-2-alexandru.elisei@arm.com>
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
In-Reply-To: <20250507151256.167769-2-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 04:12:41PM +0100, Alexandru Elisei wrote:
> The arm and arm64 architectures can also be run with kvmtool, and work is
> under way to have it supported by the run_tests.sh test runner. Not
> suprisingly, kvmtool's syntax for running a virtual machine is different to
> qemu's.
> 
> Add a new unittest parameter, 'qemu_params', with the goal to add a similar
> parameter for kvmtool, when that's supported.
> 
> 'extra_params' has been kept in the scripts as an alias for 'qemu_params'
> to preserve compatibility with custom test definition, but it is expected
> that going forward new tests will use 'qemu_params'.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/unittests.cfg     |  76 +++++++++++------------
>  docs/unittests.txt    |  15 +++--
>  powerpc/unittests.cfg |  18 +++---
>  riscv/unittests.cfg   |   2 +-
>  s390x/unittests.cfg   |  50 +++++++--------
>  scripts/common.bash   |   8 +--
>  scripts/runtime.bash  |   6 +-
>  x86/unittests.cfg     | 140 +++++++++++++++++++++---------------------
>  8 files changed, 160 insertions(+), 155 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

