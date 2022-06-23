Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2683557122
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 04:37:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT4Cz3f30z3bl8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 12:37:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=qaKWc0Ic;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT4CH1wWNz305g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 12:36:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=db7NnTeCjfS9BKlQ0hulk5gOY3mV9QEguoXPLgKe2zw=; b=qaKWc0IcE5h2mxvXPnQZRK30zN
	wx/5x3BCCv1RW+DT/F+qaQExUVIZzt9lq1t5f8yhmO/Qc2smO4fvI1zOtXDJvtNLDNNK0Kx+ZfxUi
	ggZXoGIGZ08R+0+isyhtks8bLUmm6gEZQUOVB19SMxmOaHjHaHmJNt987S+pVdj7Msi3rSC2b5FJB
	E/NTG/RPjNKiqXv0VpgDjUNJ2LZcAe7ByLQt0qsQmQK8VMEOWVfTJv83DUcWoBmf5kBJwBo6iBfiO
	k4Vdz0PMWoXkc9mw67p7y+eA/kNZoUTiI+r57Yzop572GZ7qBvUq3RpgitNrPKe61BpPZl5YndSmO
	f5t0Db0A==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Ci2-007XGJ-Sd; Thu, 23 Jun 2022 02:36:43 +0000
Message-ID: <b769c0f6-76a8-2e80-f68b-4ada036c789a@infradead.org>
Date: Wed, 22 Jun 2022 19:36:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH v2 3/3] powerpc/pseries: expose authenticated
 variables stored in LPAR PKS
Content-Language: en-US
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org
References: <20220622215648.96723-1-nayna@linux.ibm.com>
 <20220622215648.96723-4-nayna@linux.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220622215648.96723-4-nayna@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>, Dave Hansen <dave.hansen@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, George Wilson <gcwilson@linux.ibm.com>, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/22/22 14:56, Nayna Jain wrote:
> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
> index 6c1ca487103f..9c52095e20c4 100644
> --- a/arch/powerpc/platforms/pseries/Kconfig
> +++ b/arch/powerpc/platforms/pseries/Kconfig
> @@ -152,6 +152,23 @@ config PSERIES_PLPKS
>  	  config to enable operating system interface to hypervisor to
>  	  access this space.
>  
> +config PSERIES_FWSECURITYFS_ARCH
> +	depends on FWSECURITYFS
> +	bool "Support fwsecurityfs for pseries"
> +	help
> +	  Enable fwsecuirtyfs arch specific code. This would initialize

	         fwsecurityfs                   . This initializes

> +	  the firmware security filesystem with initial platform specific
> +	  structure.
> +
> +config PSERIES_PLPKS_SECVARS
> +	depends on PSERIES_PLPKS
> +	select PSERIES_FWSECURITYFS_ARCH
> +	tristate "Support for secvars"
> +	help
> +	  This interface exposes authenticated variables stored in the LPAR
> +	  Platform KeyStore using fwsecurityfs interface.
> +	  If you are unsure how to use it, say N.

-- 
~Randy
