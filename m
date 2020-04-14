Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD60B1A753B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 09:54:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491d6s58C6zDq6y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:54:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kTF+QJAp; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491d554GWXzDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 17:52:55 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id i22so2471875otp.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 00:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=D6QT/rm13y/hSPEdiFNRQzoj//hI3QF0DgCdL+Hvi3s=;
 b=kTF+QJApo+OBHoXT4kuOnZypfG+qYXO1+scFYXhqRG7QeW4ZiaycuPWJwcmvflfhF4
 2rciOM7qTU8AvwV8Gye6ZZR+Z4w2nNtcQzdYvAiclWSng6TfOvDdK6EKonL0iW7fSw+0
 LalD5MWOmmEfp5QdEd7hnC8Zwr9HUNr2Q9i48FiHLiJbA5VA0sdfbmN43WHPNLH1ldHI
 ZKhAC7bla4yWLfnnVwybE3QpLpRTyIZUuATDMfduWFyEbtR6KbHj1u3F8HkS7L6tHTie
 poWurhfmd1QjWci10qFrmd+ByUkDalBokJkCtv4udrLPMBdQZ4iBPB0MH+U3uJ19lB0L
 uJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D6QT/rm13y/hSPEdiFNRQzoj//hI3QF0DgCdL+Hvi3s=;
 b=XL7Pb2+1Rw4b2fu+F4Z+8bThsqrxSjtd5nBpXqa5spxNktAHKLIV7O7MBtsBsdUdld
 34Mn2JZqZBTayjuSGEjVuZM0ggg5B7wA4e/ErrtWn+N+iNtno5EIzNg2z7BP+HuGS+96
 ffq2ESmnsOtRfIm7SPlXQXmeLevpF85vPPAOFfkvHe7bUVohPua5Yz0pcJE0M4Da6V/s
 qaTUf2BsuSeN0n5H14k39ryIsLQaiFRsGRhfXb0IeOEswlYbZNGhy48tubpBYk7Vd3NH
 4qWig4YexlZosalFO+R6wS2cY+4e4NxYXFjGWThOjoTZaGBcq2NnB5o8Q3C4r/wf9toR
 Bsow==
X-Gm-Message-State: AGi0PuaPTJCGZKVVBRr3eii3rPwokzuNuafU+BXmXovKFdfnHODTVq4Q
 854N0zhC3z4yUaW/I4bi8Qo=
X-Google-Smtp-Source: APiQypLYjGVFQ31cGlSi0Bq+PeGk11oSfs89NFavHgMEMhDlNof10Ks4YhYBM2kqdhtyCwtHY74QCw==
X-Received: by 2002:a4a:b489:: with SMTP id b9mr13563ooo.71.1586850770598;
 Tue, 14 Apr 2020 00:52:50 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id v2sm3016355oiv.56.2020.04.14.00.52.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Apr 2020 00:52:48 -0700 (PDT)
Date: Tue, 14 Apr 2020 00:52:47 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: -Wincompatible-pointer-types in
 arch/powerpc/platforms/embedded6xx/mvme5100.c
Message-ID: <20200414075247.GA23026@ubuntu-s3-xlarge-x86>
References: <20200413201034.GA18373@ubuntu-s3-xlarge-x86>
 <87eesqjzc6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eesqjzc6.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Scott Wood <oss@buserror.net>, clang-built-linux@googlegroups.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Tue, Apr 14, 2020 at 05:33:45PM +1000, Michael Ellerman wrote:
> Hi Nathan,
> 
> Thanks for the report.
> 
> Nathan Chancellor <natechancellor@gmail.com> writes:
> > Hi all,
> >
> > 0day reported a build error in arch/powerpc/platforms/embedded6xx/mvme5100.c
> > when building with clang [1]. This is not a clang specific issue since
> > it also happens with gcc:
> >
> > $ curl -LSs https://lore.kernel.org/lkml/202004131704.6MH1jcq3%25lkp@intel.com/2-a.bin | gzip -d > .config
> > $ make -j$(nproc) -s ARCH=powerpc CROSS_COMPILE=powerpc-linux- olddefconfig arch/powerpc/platforms/embedded6xx/mvme5100.o
> > arch/powerpc/platforms/embedded6xx/mvme5100.c: In function 'mvme5100_add_bridge':
> > arch/powerpc/platforms/embedded6xx/mvme5100.c:135:58: error: passing argument 5 of 'early_read_config_dword' from incompatible pointer type [-Werror=incompatible-pointer-types]
> >   135 |  early_read_config_dword(hose, 0, 0, PCI_BASE_ADDRESS_1, &pci_membase);
> >       |                                                          ^~~~~~~~~~~~
> >       |                                                          |
> >       |                                                          phys_addr_t * {aka long long unsigned int *}
> 
> 
> Yuck.
> 
> > ...
> > I am not sure how exactly this should be fixed. Should this driver just
> > not be selectable when CONFIG_PHYS_ADDR_T_64BIT is selected or is there
> > something else that I am missing?
> 
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

c'est la randconfig :)

> Then Kconfig has:
> 
> config PHYS_64BIT
> 	bool 'Large physical address support' if E500 || PPC_86xx
> 	depends on (44x || E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx
> 	select PHYS_ADDR_T_64BIT
> 
> 
> So it's PPC_86xx that allows 64-bit phys_addr_t.
> 
> That was added in:
> 
>   4ee7084eb11e ("POWERPC: Allow 32-bit hashed pgtable code to support 36-bit physical")
> 
> Which did:
> 
> config PHYS_64BIT
> -	bool 'Large physical address support' if E500
> -	depends on 44x || E500
> +	bool 'Large physical address support' if E500 || PPC_86xx
> +	depends on (44x || E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx
> 
> 
> ie. it wanted to add support for PPC_86xx but had to deliberately
> exclude some of the other BOOK3S_32 based platforms.
> 
> So I'm going to guess it should have also excluded embedded6xx, and this
> seems to fix it:

This is what I was thinking as well; I agree with your analysis. Feel
free to slap the following tags on:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build

> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 0c3c1902135c..134fc383daf7 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -278,7 +278,7 @@ config PTE_64BIT
>  
>  config PHYS_64BIT
>  	bool 'Large physical address support' if E500 || PPC_86xx
> -	depends on (44x || E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx
> +	depends on (44x || E500 || PPC_86xx) && !PPC_83xx && !PPC_82xx && !EMBEDDED6xx
>  	select PHYS_ADDR_T_64BIT
>  	---help---
>  	  This option enables kernel support for larger than 32-bit physical
> 
> 
> So unless anyone can tell me otherwise I'm inclined to commit that ^
> 
> cheers

Cheers,
Nathan
