Return-Path: <linuxppc-dev+bounces-10083-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D3EAF8C35
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 10:42:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYRvh2jyHz30MY;
	Fri,  4 Jul 2025 18:42:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.185
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751618528;
	cv=none; b=MQIYIN2Fnt/rQwRorw9tDMRpIAl2GFv22sFIIk8Dnx7It0x537VvShkY4MEUneLE0bA7x91AwcuCgcIegYYCS1grlMYT5vWV73w66qSSckYE42rMtEv+Pc1ZvoEc1uh4tmEcOV07d2lgK2zocUopsCPRFI1YPcKI6Ch2F4Cn3kqofKJH+hyhClYTpRLUcFPGV2U+q7j17A7Jg81St0mx7DpMDXmE5VjpyeOhEyHvdtrsjDG/MzYC0UiUyri39kNqnJmwgmFYBxL8meHGe1TkdEB48t3RZJoi9MbRKaCXV1ASbZKXBhjfMEI9ocj+FA6X3ZctS1XILc3Hp7ybJ+tL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751618528; c=relaxed/relaxed;
	bh=0nXKe78bJmwzJOAxzdkpWlH9hViLj7pZKD4QXBLZx/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7pMI1pz1R5UuFbMITTIGfvz8Qv+9xE2VLpZOBB7GoYliq4OhLjLUF3wYIRAsJsVNssC0exumyIbeFdjCSkeYvvzVwbbvwJKxWJGK3ZT/5VHtCRYPOreiJCF5glyYPLSx5KpOjqv3S5nBabewtV6q9NtFq9L1LVGGeAIzh0FpDpCmLGUgAOxLYl3mUKeqfMSLIeFc/xQ0GnKAC383wDQBdDd6FR7MZcbV2E3YDpOfG8XDDoLNtGPoo7x6ccL09Nar64RVr419LL8/TNKS6kjvkkez8Mqpl6FzGfpxGP21Ns8kbnYvGMLNhtejm0ZW8bLqI+X7tkQyZIRHlzqFIyc4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q7128TEG; dkim-atps=neutral; spf=pass (client-ip=91.218.175.185; helo=out-185.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q7128TEG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.185; helo=out-185.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYRvb51M5z2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 18:42:01 +1000 (AEST)
Date: Fri, 4 Jul 2025 10:41:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751618501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0nXKe78bJmwzJOAxzdkpWlH9hViLj7pZKD4QXBLZx/k=;
	b=Q7128TEGQ2hcKvCx4yEy1Ahh3+yoiOVqN3TXOpexskc2XR+3JlQvpFTMJORpSn787fKPIK
	ftl3NIwUqWE2TSzITeOG3myzVnDI9sE5cF3F1uacBZAaGUzzo9cNxASQ1HMVng2Mnk1DD0
	Sbajc7oU/LN3U5XrBduq3ev575Q8MoA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: kvm@vger.kernel.org, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, pbonzini@redhat.com, 
	eric.auger@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, david@redhat.com, linux-s390@vger.kernel.org
Subject: Re: [kvm-unit-tests PATCH 0/2] scripts: extra_params rework
Message-ID: <20250704-d2d19c247731e5252e9c700e@orel>
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

Merged. Thanks

