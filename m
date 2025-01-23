Return-Path: <linuxppc-dev+bounces-5524-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82913A1A73E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 16:43:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf4wt07vnz2yYq;
	Fri, 24 Jan 2025 02:43:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b9"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737647021;
	cv=none; b=Di6X/LCrlrHKb+NabsYy10Qimjlen7bx9yRBcSF+sDr/Zw0638lqrNwfGZJqo07ZF0QYanc4p9NFFPMfW4EzvFwHvR1p5WLyr604q285Vn51CTlfGW4lOco7nW9EN+WPMg45lC+tEN59s7bkRF/vPlJLrRBQtFBiUCuz6IL9Gc02n9pvAXqwVGlOpUq1lbKcOi1aabax50ukJK32a+3FHsAOgjIfplNjQW/wodgh2a3rDhfZ4T7VMKzrtG7EAZ9B04VSVj0SbZOYy+xnd2juDGOhzyve/+SuIGEIVSKc9TaLry4UTf3JFGY5dXzT/2Z6K4FYV/KqgjZ69Hqro8xiow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737647021; c=relaxed/relaxed;
	bh=dk8ApH0cAFI0UZWZTyTEsgDS1l6elNezuUyetdqvFcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7qYWPoQbHq6GHC7wdlEmXsqeEERVcgpPgx6BWpUEleLeEMpbvWHA7qP1/MoI3FKkN6kULB3FPkp6URUJaf99akMkXwBfFirlOSUWU8W+uqWToTa10yI6Vtct9X6cPduGht2jZE9tst3UAWr0ki9Jp0qL+SK3a2mT4PHsNr45tKqfyaWZNiGomBapxhPDxtJ7tGcv6q5OHE9KObmU4p/qriT8bZvXbgDr0wTUf9Ulzb2ILJHbEwoBBOmw91WcY5YXYDEB6KLq1H0Pv3fxRDXxlJszpTFzcj7v6mClyvHWvUQdwzqLlpsyfKuxL+poQvw+54d/ltksPuFNh4mdOn8mA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:203:375::b9; helo=out-185.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b9; helo=out-185.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [IPv6:2001:41d0:203:375::b9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yf4wm0263z2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 02:43:35 +1100 (AEDT)
Date: Thu, 23 Jan 2025 16:43:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737646996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dk8ApH0cAFI0UZWZTyTEsgDS1l6elNezuUyetdqvFcU=;
	b=hl6Hcs/Wpq3qPazpHiKpHaE1Zxs3LexvXlU6sL69OB1v0FLTd8edx3TSReHSivNzX0HTmt
	TFFEJPiSREeaIeHIPaIiaNabx1gopzHVPybyZKkXyx1r8bamvo0FgP/U8QytmSi83UcrMb
	LVC+c6eOrY7PAWx/QKJUTfzUgtmmeoY=
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
Subject: Re: [kvm-unit-tests PATCH v2 14/18] run_tests: Add KVMTOOL
 environment variable for kvmtool binary path
Message-ID: <20250123-e805b8b162fd2dfbd54b0541@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-15-alexandru.elisei@arm.com>
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
In-Reply-To: <20250120164316.31473-15-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 04:43:12PM +0000, Alexandru Elisei wrote:
> kvmtool is often used for prototyping new features, and a developer might
> not want to install it system-wide. Add a KVMTOOL environment variable to
> make it easier for tests to use a binary not in $PATH.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  run_tests.sh          | 1 +
>  scripts/arch-run.bash | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index acaaadbb879b..d38954be9093 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -36,6 +36,7 @@ The following environment variables are used:
>      TIMEOUT         Timeout duration for the timeout(1) command
>      CHECK           Overwrites the 'check' unit test parameter (see
>                      docs/unittests.txt)
> +    KVMTOOL         Path to kvmtool binary for ARCH-run
>  EOF
>  }
>  
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 34f633cade01..5d840b72f8cb 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -457,7 +457,7 @@ search_kvmtool_binary ()
>  {
>  	local kvmtoolcmd kvmtool
>  
> -	for kvmtoolcmd in lkvm vm lkvm-static; do
> +	for kvmtoolcmd in ${KVMTOOL:-lkvm vm lkvm-static}; do
>  		if $kvmtoolcmd --help 2>/dev/null| grep -q 'The most commonly used'; then
>  			kvmtool="$kvmtoolcmd"
>  			break

Let's had the help text that search_qemu_binary() has with this patch
pointing out that a binary can be specified with KVMTOOL.

Thanks,
drew

> -- 
> 2.47.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

