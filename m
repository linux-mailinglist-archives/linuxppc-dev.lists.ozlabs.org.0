Return-Path: <linuxppc-dev+bounces-5158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 187B3A0BB63
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 16:14:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWwlT4T2Sz30WJ;
	Tue, 14 Jan 2025 02:14:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736781253;
	cv=none; b=NwVa1h0wttB0N2oHk8JujcKuG7xK2zmPXEs3byGIU7Cj3KIANaDyeZ6AUcew/H9SlOcwkf4P1eQUye04E6tTh/UffbN6i88Gx5ZYISvgLKnNCq+ODWZcPYgk4A9MEqEmjB3r+RdLBuP9NxIBA7/0XIO3Xp6PX44r+62ZGpYw/DoE7w2wi1MaSegsOjI7I/fWIl0jw1dFBciH6HJAZF/cz0lCoGKi8b5ipUecwwhGjMaiyLCZv+vAIo7j9J+bYWDSCWiutjZK/1QSDtSO2dTM5sslA+sKQnh6AIRr3iDZ/fYWDn3UpoDnMoRrSPk1XnskiC7PHtknG0W20Y9GlVhKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736781253; c=relaxed/relaxed;
	bh=hdLeZjgsxpTEb/ESjCgEojXnaXa6y+7iB6h33/Z6dms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PILlEJjq8D8uqRQ41OsMi+kosCFX2WTv8IhSz35mTxIvt2NfMrwvQOG68wcN/y1+eETq1RzRJzsx0yxXx6k6wW2agw74g2VPLWChnYdRsae+owNcNnhVkvJTosghDbBqPsTb65WjFwrr/qZD4Efbr/94lNLQ9QKrmUU8rvj+Rp9AjqqI6LV+MXGuC2kFV3RxOQi2wOVDAOGn4umxQpxDsyxNaEykdUHjAkfoqiEZiOcMDkqtT9WgMI1Hytbioka2+zuiFQZsXhCAi30pSUoBrcKVhTehaWV8/c6dnMk9Reu8euaXjvHmg7AKNyatpeWxCgPyvJNXHHnBWZ21Iwy2wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=91.218.175.177; helo=out-177.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.177; helo=out-177.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWwlL3x7qz30TP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 02:14:06 +1100 (AEDT)
Date: Mon, 13 Jan 2025 16:13:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736781224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hdLeZjgsxpTEb/ESjCgEojXnaXa6y+7iB6h33/Z6dms=;
	b=fXT1uUBoKArx52tPaWyXs+o2K25Q1zXgNMni985Mil56OjK89u7UWgd4+JToG7xCNI5AOE
	ItO1kOrctTaGYtt54+Sl82Hm/4Z1q1QjFH4kYR9z8T+xyBgaxDW/Pt4j0PHEbPWFsvz45b
	yMhV/l3rnHfZB2C1X6EVTCpchLdp9PI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 3/5] arm64: Implement the ./configure
 --processor option
Message-ID: <20250113-095d3fc41114359b246608e0@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-4-alexandru.elisei@arm.com>
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
In-Reply-To: <20250110135848.35465-4-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 01:58:46PM +0000, Alexandru Elisei wrote:
> The help text for the ./configure --processor option says:
> 
>     --processor=PROCESSOR  processor to compile for (cortex-a57)
> 
> but, unlike arm, the build system does not pass a -mcpu argument to the
> compiler. Fix it, and bring arm64 at parity with arm.
> 
> Note that this introduces a regression, which is also present on arm: if
> the --processor argument is something that the compiler doesn't understand,
> but qemu does (like 'max'), then compilation fails. This will be fixed in a
> following patch; another fix is to specify a CPU model that gcc implements
> by using --cflags=-mcpu=<cpu>.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/Makefile.arm    | 1 -
>  arm/Makefile.common | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arm/Makefile.arm b/arm/Makefile.arm
> index 7fd39f3ada64..d6250b7fb686 100644
> --- a/arm/Makefile.arm
> +++ b/arm/Makefile.arm
> @@ -12,7 +12,6 @@ $(error Cannot build arm32 tests as EFI apps)
>  endif
>  
>  CFLAGS += $(machine)
> -CFLAGS += -mcpu=$(PROCESSOR)
>  CFLAGS += -mno-unaligned-access
>  
>  ifeq ($(TARGET),qemu)
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index f828dbe01d33..a5d97bcf477a 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -25,6 +25,7 @@ AUXFLAGS ?= 0x0
>  # stack.o relies on frame pointers.
>  KEEP_FRAME_POINTER := y
>  
> +CFLAGS += -mcpu=$(PROCESSOR)
>  CFLAGS += -std=gnu99
>  CFLAGS += -ffreestanding
>  CFLAGS += -O2
> -- 
> 2.47.1
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

