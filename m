Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F71A8792
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 19:33:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491szB1tZ3zDqch
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 03:33:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491sR92zQNzDr1P
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 03:09:24 +1000 (AEST)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1jOOzY-0006Mp-5p; Tue, 14 Apr 2020 12:04:56 -0500
Message-ID: <9796bef636f2aabab6eaf44237b63bd94c01d26f.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Michael Ellerman <mpe@ellerman.id.au>, Nathan Chancellor
 <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
 clang-built-linux@googlegroups.com
Date: Tue, 14 Apr 2020 12:04:52 -0500
In-Reply-To: <87eesqjzc6.fsf@mpe.ellerman.id.au>
References: <20200413201034.GA18373@ubuntu-s3-xlarge-x86>
 <87eesqjzc6.fsf@mpe.ellerman.id.au>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: mpe@ellerman.id.au, natechancellor@gmail.com,
 linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
Subject: Re: -Wincompatible-pointer-types in
 arch/powerpc/platforms/embedded6xx/mvme5100.c
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-04-14 at 17:33 +1000, Michael Ellerman wrote:
> I'm not sure TBH. This is all ancient history as far as I can tell, none
> of it's been touched for ~7 years.
> 
> Your config has:
> 
> CONFIG_EMBEDDED6xx=y
> CONFIG_PPC_BOOK3S_32=y
> CONFIG_PPC_BOOK3S_6xx=y
> CONFIG_PPC_MPC52xx=y
> CONFIG_PPC_86xx=y
> 
> 
> Which I'm not sure really makes sense at all, ie. it's trying to build a
> kernel for multiple platforms at once (EMBEDDED6xx, MPC52xx, 86xx), but
> the Kconfig doesn't exclude that so I guess we have to live with it for
> now.

I thought supporting multiple platforms in a kernel was something we tried to
support when practical?

> So I'm going to guess it should have also excluded embedded6xx, and this
> seems to fix it:
> 
> diff --git a/arch/powerpc/platforms/Kconfig.cputype
> b/arch/powerpc/platforms/Kconfig.cputype
> index 0c3c1902135c..134fc383daf7 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -278,7 +278,7 @@ config PTE_64BIT
>  
>  config PHYS_64BIT
>  	bool 'Large physical address support' if E500 || PPC_86xx
> -	depends on (44x || E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx
> +	depends on (44x || E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx &&
> !EMBEDDED6xx
>  	select PHYS_ADDR_T_64BIT
>  	---help---
>  	  This option enables kernel support for larger than 32-bit physical
> 
> 
> So unless anyone can tell me otherwise I'm inclined to commit that ^

This could silently break someone's config who's depending on PHYS_64BIT (e.g.
an 86xx kernel that happens to include an embedded6xx target as well, even if
just by accident).  It'd be better to have the MVME500 depend on
!CONFIG_PHYS_ADDR_T_64BIT as Nathan suggested (if there's nobody around to
test a fix to the actual bug), which shouldn't break anyone since it already
didn't build.

-Scott


