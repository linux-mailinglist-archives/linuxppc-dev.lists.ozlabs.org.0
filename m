Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6278332B9C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 19:19:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrMhz2nKkz3d2L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 05:19:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UsC2fbS9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UsC2fbS9; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrMhb5jbrz3cHx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 05:19:11 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3362B64EE4;
 Wed,  3 Mar 2021 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614795549;
 bh=NjwTlWy1k6yXupvkqZegpDvzpV/TRs/7ew8URhwgtUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UsC2fbS9rQAO2hD2Z/yCr9LuMJtbm2bfCzYX97TI419zAr/flPuPAHHc64agNY2ZB
 SV7PwlrUO/QiP1YrVCG82VfY2l5QBHA+eEDd3pR0LyfhdZsDZRCVwM1t+co/ujs0+s
 mgSXtct53qUHbmjbdVTh/nYOf9Iur+vqVP0tKD3PNSCpPp1r3pblTfALc9QJINy5Q8
 vM3nwe1p8O/oXPMt2mSb3NIxR3NDk8ZvGdnZ5OMkmdsXY544Aca10kMIH9UmaJks+p
 nYhxICCrjCWSjTn/fS2QGHONjATwtnRMakOfVvffjl3MJFYzAmJRXoLbvTGDjjWAYF
 YQcyyS57yAf6w==
Date: Wed, 3 Mar 2021 18:19:04 +0000
From: Will Deacon <will@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 4/7] cmdline: Add capability to prepend the command line
Message-ID: <20210303181903.GF19713@willie-the-truck>
References: <cover.1614705851.git.christophe.leroy@csgroup.eu>
 <e1a498d02d47ec2420b404bd5f3e4a00fc628532.1614705851.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a498d02d47ec2420b404bd5f3e4a00fc628532.1614705851.git.christophe.leroy@csgroup.eu>
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

On Tue, Mar 02, 2021 at 05:25:20PM +0000, Christophe Leroy wrote:
> This patchs adds an option of prepend a text to the command
> line instead of appending it.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/linux/cmdline.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
> index ae3610bb0ee2..144346051e01 100644
> --- a/include/linux/cmdline.h
> +++ b/include/linux/cmdline.h
> @@ -31,7 +31,7 @@ static __always_inline size_t cmdline_strlcat(char *dest, const char *src, size_
>  }
>  
>  /*
> - * This function will append a builtin command line to the command
> + * This function will append or prepend a builtin command line to the command
>   * line provided by the bootloader. Kconfig options can be used to alter
>   * the behavior of this builtin command line.
>   * @dest: The destination of the final appended/prepended string.
> @@ -50,6 +50,9 @@ static __always_inline void cmdline_build(char *dest, const char *src, size_t le
>  		cmdline_strlcat(dest, CONFIG_CMDLINE, length);
>  		return;
>  	}
> +
> +	if (IS_ENABLED(CONFIG_CMDLINE_PREPEND) && sizeof(CONFIG_CMDLINE) > 1)
> +		cmdline_strlcat(dest, CONFIG_CMDLINE " ", length);

Same comment as the other patch: I don't think we need to worry about the
sizeof() here.

Will
