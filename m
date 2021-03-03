Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A708532B984
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 18:40:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrLqg4v4Nz3d7Q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 04:40:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XENxLR/0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XENxLR/0; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrLpr2bpcz3cV7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 04:39:32 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7A1064EDC;
 Wed,  3 Mar 2021 17:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614793169;
 bh=7MVw5UDEd1Xvs+II9tNU1UACiyEi/PQdUEbmoIFcK6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XENxLR/0Wum5UkY2MnJTucpt2FDgT/0cITCxXkBT1SmguNemOxTJR7z3vpRT6GexG
 OhkxkpgSVSkw1mCsleAFoNDbOldAVdI7hFx9PvgkglRoBOKJtYo6ASvgGk0fB/H6N4
 QGP3PIB7sd+LG6lmPmjjPk1F6feMc5NGQrKdjfKaCeUmIE4cR5G1LFE9aLMJIDZzGu
 Xie+YDBcOIes+S0L1l+fg1XYmkzNmN1Zzc7eazCNYYfjjySr5vjPbdn5CbRRKb8CXX
 zwGV34z/YzVLb79eujME7s3rxBqfmwn24opeawzXD2+BpwLT3RJYewNl+nK9WSHC5X
 wgQ9dTUwA5Fng==
Date: Wed, 3 Mar 2021 17:39:24 +0000
From: Will Deacon <will@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/7] cmdline: Add generic function to build command
 line.
Message-ID: <20210303173923.GB19713@willie-the-truck>
References: <cover.1614705851.git.christophe.leroy@csgroup.eu>
 <d8cf7979ad986de45301b39a757c268d9df19f35.1614705851.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8cf7979ad986de45301b39a757c268d9df19f35.1614705851.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, danielwa@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 02, 2021 at 05:25:17PM +0000, Christophe Leroy wrote:
> This code provides architectures with a way to build command line
> based on what is built in the kernel and what is handed over by the
> bootloader, based on selected compile-time options.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/linux/cmdline.h | 62 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 include/linux/cmdline.h

Sorry, spotted a couple of other things...

> +/*
> + * This function will append a builtin command line to the command
> + * line provided by the bootloader. Kconfig options can be used to alter
> + * the behavior of this builtin command line.
> + * @dest: The destination of the final appended/prepended string.
> + * @src: The starting string or NULL if there isn't one. Must not equal dest.
> + * @length: the length of dest buffer.
> + */
> +static __always_inline void cmdline_build(char *dest, const char *src, size_t length)
> +{
> +	if (length <= 0)
> +		return;

length is unsigned

> +
> +	dest[0] = 0;
> +
> +#ifdef CONFIG_CMDLINE
> +	if (IS_ENABLED(CONFIG_CMDLINE_FORCE) || !src || !src[0]) {
> +		cmdline_strlcat(dest, CONFIG_CMDLINE, length);
> +		return;
> +	}
> +#endif
> +	if (dest != src)

The kernel-doc says that @src "Must not equal dest".

Will
