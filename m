Return-Path: <linuxppc-dev+bounces-10043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D61E3AF58A0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 15:24:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXLGX5Ffyz30Tf;
	Wed,  2 Jul 2025 23:24:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.180
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751462676;
	cv=none; b=mQrX8XICoMBGju4Y95/pV/U7JhU3chLy/FbM71mVQklBbqN0yloPhD6tIYU+DnWULfrlLYr7OGj7v2lBG6vMeDqWySHpRl/bIiYwBdNnitJh7cVGOdV13g2YxjnBZ8FISNSNKD43moVHg1IMrB4PHim7qM8iadzhZy0AOnzk9Pp/xooPDSv2/UxnvU9cLcnH3kmYWN83DMKOJKPmN7Ouzf2k/biLPFypfM3krJGGMIJfvT1u7k1ZAoVLTFQRcB7QbUQPlxBQFDEORSGD7iFo1Rt3mKOWsE7oK9FpzKaF9OC/eGkyvCrL8soaoLnsySX8BAL1Lng759nqRWhyDGzlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751462676; c=relaxed/relaxed;
	bh=NawVbpSzRrmU/5OP7w4Gd875xIZHo3tZ7VQMBiyqhsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GI061JyZH7CDXbhL4V23/gjD4uefD4gTkuQ4uvar0HWWka4cqghKqkUJUzfSJw1s7ibZvWwaHtdtCtJTOA47LzqP662RRoZRUiJUr8r078MhxKRUMTioFkw1pNcn3HBF2fl2M/WK9f5rYlPhD9ysaiRqTnKcbS2n0vUcNmq0PbOUC7WhHwaNfgS0YIvyLoQKYeTi7dRymXofwwoF2trlxI/lAOeuvd4B0Mnpi62cFZneAhdpfAYycE9L7eYzCNysfHvWYmdytDA5mSNho/lpBxGqJS8QCjDxPm/Ze4q66y5LnypMVgOFnr6LMVUBVBm+euTQ9OArWH6tnLw0LV9ppg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=njUl/S1J; dkim-atps=neutral; spf=pass (client-ip=95.215.58.180; helo=out-180.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=njUl/S1J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.180; helo=out-180.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXLGT46B6z30LS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jul 2025 23:24:33 +1000 (AEST)
Date: Wed, 2 Jul 2025 15:23:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751462643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NawVbpSzRrmU/5OP7w4Gd875xIZHo3tZ7VQMBiyqhsU=;
	b=njUl/S1J5KSb4kx5muBTkGIWSbXrroDfp86PXT14WPw5N7Hu/x/hpj7G9kte4LDcww6tj1
	sLFenV29ksanu71IRWzpzXNj3kRSc4qywDU4NFLZJM7H9cWGJsHjGlArX7DoAw9afh/IVk
	ghR3vKM0KttIIQr6AY6akrhIyQ1vgu4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: kvm@vger.kernel.org, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, pbonzini@redhat.com, 
	eric.auger@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, david@redhat.com, linux-s390@vger.kernel.org
Subject: Re: [kvm-unit-tests PATCH 0/2] scripts: extra_params rework
Message-ID: <20250702-4e182ba58316d478d49a1ee3@orel>
References: <20250625154354.27015-1-alexandru.elisei@arm.com>
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
In-Reply-To: <20250625154354.27015-1-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Paolo, Thomas, and others,

Can I get an ack on this? I'd like to merge it.

Thanks,
drew

On Wed, Jun 25, 2025 at 04:43:52PM +0100, Alexandru Elisei wrote:
> This series was split from the series that adds support to use kvmtool when
> using the scripts to run the tests [1]. kvmtool will be supported only for arm
> and arm64, as they are the only architectures that compile the tests to run with
> kvmtool.
> 
> The justification for these changes is to be able to introduce
> kvmtool_params for kvmtool specific command line options, and to make a
> clear distinction between the qemu options and the kvmtool options. This is
> why qemu_params was added as a replacement for extra_params. extra_params
> was kept for compatibility purposes for user's custom test definitions.
> 
> To avoid duplication of the arguments that are passed to a test's main()
> function, test_args has been split from qemu_params. The same test_args
> will be used by both qemu and kvmtool.
> 
> [1] https://lore.kernel.org/kvm/20250507151256.167769-1-alexandru.elisei@arm.com/
> 
> Alexandru Elisei (2):
>   scripts: unittests.cfg: Rename 'extra_params' to 'qemu_params'
>   scripts: Add 'test_args' test definition parameter
> 
>  arm/unittests.cfg     |  94 ++++++++++++++----------
>  docs/unittests.txt    |  30 +++++---
>  powerpc/unittests.cfg |  21 +++---
>  riscv/unittests.cfg   |   2 +-
>  s390x/unittests.cfg   |  53 +++++++-------
>  scripts/common.bash   |  16 +++--
>  scripts/runtime.bash  |  24 ++++---
>  x86/unittests.cfg     | 164 ++++++++++++++++++++++++------------------
>  8 files changed, 237 insertions(+), 167 deletions(-)
> 
> 
> base-commit: 507612326c9417b6330b91f7931678a4c6866395
> -- 
> 2.50.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

