Return-Path: <linuxppc-dev+bounces-5454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 720CAA18024
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 15:42:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ycqg61V1fz30TQ;
	Wed, 22 Jan 2025 01:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737470546;
	cv=none; b=Z4a5wYCEjW6Lvf9gtenVXE//8s5I0cjD1ZS4IYj+luvxaQ0IbjVbM8tkQqLFBO2jc4jQI7vb8Ux6lvrWBeht2xekwLKxxzHPFukdBEqDJM9pN3EqRLuLA+7xOZDhkpLhXxXHOT3zQUP/Sp4FaFPadAgcRcxXXCYmyhCKQB37m+abbNfcDNitJ0TLj5kvSNhyyxIQa0HT95QmCN6a7UZqkoUcFI3rzgwjjmqlfMRX372qVmPuUIwhxfJLCOjbL9sBFP9y6yKNepqDXrbPd/XygBs0MQynzynOy7YPWULs17H7WfJCIHkQKcg2JDHNqXmGNHnh78mFBIDjhrnCLjVjyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737470546; c=relaxed/relaxed;
	bh=1pZPMNacqT3FWVN3+5IJh+1Gn4JDnmbN6slSSMAGWNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMao62a72xYq9T95h0hixMs3EniLb9M7F5KhQTT/fDgO/jU1DBsEVXWq8AVB0XAT8JdopzmNwaJzZGM67mpdPivCO1T3gVz0Lg/+BZdtAEXMW1FffRnZ0ZwiUjBRumt/AJS7dtmXORh/eO9U8CwzfwNzB7twh9XWz2tUkgXenZbr5xDa5p6al3Cu8ecWLeKirH1xkmJQuYj21Ss+DWqMK1E0devjPhH3SNAAF8/8WsgxuOm2csG9vYus4bWeANGzJUNb1SeoBMDL/S4sL2DCXcEGKdTVE53r+usd1kxDRPxqeNiDV8Nb+OYrCe37d5leUvmA6RdrZAh7O3W2SYR91g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=91.218.175.179; helo=out-179.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.179; helo=out-179.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycqg03h6kz2ytQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 01:42:20 +1100 (AEDT)
Date: Tue, 21 Jan 2025 15:41:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737470515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1pZPMNacqT3FWVN3+5IJh+1Gn4JDnmbN6slSSMAGWNY=;
	b=U1g6GiVVnnNvwjlefCbkSGE9rYkiSotU1DJDhhlacz830AQCJY+x+BSFIgBHEdBEjF7whh
	1iOobHh0VB/5gCqnxexgn5mMeNeHTTP/ErMJNus8Z3laTIH16QEgG4GETVntCJkH13UDVC
	pd8HDOrWvDQOqi0jJZ75AGa0Tmxygpo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, Andrew Jones <drjones@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v2 02/18] Document environment variables
Message-ID: <20250121-005ff84295df2dd87b8329b3@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-3-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-3-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:00PM +0000, Alexandru Elisei wrote:
> Document the environment variables that influence how a test is executed
> by the run_tests.sh test runner.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  docs/unittests.txt |  5 ++++-
>  run_tests.sh       | 12 +++++++++---
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index c4269f6230c8..dbc2c11e3b59 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -88,7 +88,8 @@ timeout
>  -------
>  timeout = <duration>
>  
> -Optional timeout in seconds, after which the test will be killed and fail.
> +Optional timeout in seconds, after which the test will be killed and fail. Can
> +be overwritten with the TIMEOUT=<duration> environment variable.
>  
>  check
>  -----
> @@ -99,3 +100,5 @@ can contain multiple files to check separated by a space, but each check
>  parameter needs to be of the form <path>=<value>
>  
>  The path and value cannot contain space, =, or shell wildcard characters.
> +
> +Can be overwritten with the CHECK environment variable with the same syntax.
> diff --git a/run_tests.sh b/run_tests.sh
> index f30b6dbd131c..23d81b2caaa1 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -27,9 +27,15 @@ Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-l]
>      -l, --list          Only output all tests list
>          --probe-maxsmp  Update the maximum number of VCPUs supported by host
>  
> -Set the environment variable QEMU=/path/to/qemu-system-ARCH to
> -specify the appropriate qemu binary for ARCH-run.
> -
> +The following environment variables are used:
> +
> +    QEMU            Path to QEMU binary for ARCH-run
> +    ACCEL           QEMU accelerator to use, e.g. 'kvm', 'hvf' or 'tcg'
> +    ACCEL_PROPS     Extra argument to ACCEL
> +    MACHINE         QEMU machine type
> +    TIMEOUT         Timeout duration for the timeout(1) command
> +    CHECK           Overwrites the 'check' unit test parameter (see
> +                    docs/unittests.txt)
>  EOF
>  }
>  
> -- 
> 2.47.1
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

