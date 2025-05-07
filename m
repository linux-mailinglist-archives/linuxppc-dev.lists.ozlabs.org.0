Return-Path: <linuxppc-dev+bounces-8416-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81598AAE745
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 19:00:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt1jJ6d8Jz30PF;
	Thu,  8 May 2025 03:00:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746637220;
	cv=none; b=aQwdLApUJbZZeulGXPoqAL58g38AHVvFDVJHhd8MaxZthF5TJpJpRsqt+xRDMxEBWLjWIAf7IgGP4PrERPZEnN/aXVZFHJV+yvQepD1wNptNBMJOyG8hfmmFnujcV538yuSyODhfCL0rMHSFBD3KZmteuKiazssCgwify3gIt+g7dkoPDgewIBAzLVlk8c69fmXvOisLZIHMMjxEvkUBJ6ktgo2+qoNB6VvxUgt0V0IHaTIeSbRpYsrQv3pUaAsF/Tm+boDR7+dibEw3g5CDyd8zMKIXRGXdDuZVBXgr8gXS7xBYiPvU/va9E7fs5Qp1ifpMoMQs4peO8C1x6MQrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746637220; c=relaxed/relaxed;
	bh=W7RbClqZDTLPIsrG1S6Ef3Cx9TH5IxacJLeHcWQor0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWUL5MnUvR2YJ+naRjcmliWfwXcz4F83fmz0+QLsJ99PpjimOa3oozLq7AHTUySr6kfebtpNb2Ybf2aPmW5mrg1UVB41TqFGA6iHXUAlckwE970cOb6AktvVd0q94tyM7II9Qm0B1S49Pf3kFlF4IbYzWHhG96L41/Tu8VYJCT0rbj1fpZ8SIGnkRs+3eY9JtYrcC9fLIobotPCVTmvPEMNp1GeXt/07p00rKZWoqa/1IcIkRPs/TSOkex4/9Z+FmXJxr3Wqwo991/+3QfxsrwxCoIollnz/kpbcjSmpou2ecUW3/UXEvAwAi4WieZNDjcIMfSJaopegJT1hpnOFsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iPQgkEJ+; dkim-atps=neutral; spf=pass (client-ip=95.215.58.182; helo=out-182.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iPQgkEJ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.182; helo=out-182.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt1jH1LM0z30Nl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 03:00:18 +1000 (AEST)
Date: Wed, 7 May 2025 18:59:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746637199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W7RbClqZDTLPIsrG1S6Ef3Cx9TH5IxacJLeHcWQor0Q=;
	b=iPQgkEJ+LZyyl/HYCCjGx+TlqTyj6+oXTCTr2iCCajrejVHdrHtoSUQVkfrZVnDUIOQHug
	4GyuA2SK4xRhYb5L+TI1iB+OvEMac6eC/bhzcaI40imZ2TaCvfZ6j1ie7uTbqZXV4Rlg+R
	AWMOBZDFdZBSB15+VhsrVqDGy7MjiKQ=
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
Subject: Re: [kvm-unit-tests PATCH v3 16/16] scripts: Enable kvmtool
Message-ID: <20250507-41058efcb1f4f05fd98d8deb@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-17-alexandru.elisei@arm.com>
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
In-Reply-To: <20250507151256.167769-17-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 04:12:56PM +0100, Alexandru Elisei wrote:
> Everything is in place to run the tests using kvmtool:
> 
> $ ./configure --target=kvmtool
> $ make clean && make
> $ KVMTOOL=<path/to/kvmtool> ./run_tests.sh
> 
> so enable it, and remove ERRATA_FORCE=y when configuring for kvmtool,
> because the runner will generate and pass the correct environment to
> kvmtool.
> 
> Missing is support for EFI tests. That's because distros don't ship a
> EDK2 binary compiled for kvmtool, and on top of that kvm-unit-tests as
> an EFI app hasn't been tested to work with kvmtool.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  README.md        | 18 +++++++++++++++++-
>  arm/efi/run      |  5 +++++
>  configure        |  1 -
>  scripts/vmm.bash |  2 +-
>  4 files changed, 23 insertions(+), 3 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

