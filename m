Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A89787EB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 05:39:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Tmlz4s2O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX5LK1G3yz3c8L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 13:39:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Tmlz4s2O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=schmitzmic@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RX2Td2BYSz2ysC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 11:31:00 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68bed28cb22so364252b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 18:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692927057; x=1693531857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7ELdHtTL5wYh7Mk37fDEn5rWUjAm0EdSJQg/6HWPPQ=;
        b=Tmlz4s2OgK58rZBzZOqQBOTKsewJsSbr0lEcw148TWgipwzPC4h3leu6DHGlT2r85/
         Uip0aLw7OTRJ61MyT/fB+2M0fG4g6LWvilyhBIrARSkzuGacd0puWelGLD8sQFEorTQR
         iWM9dveRRwtXAAMgsQ1/wPN9YLRbtznx8UH3GB/Gc6Kl2jKJWnRhPY+VLZrWbWEKV9yS
         nafEaqYDFpVR5/DPJmFBDt9xOQCxtCGGHTqymDFSbzyjxleu1nAu7M/vlGloF4CFWAV1
         1Mn9tQCCGOF3Z8ZylRnT1zAlhIOy4YB5/0u2bxeQjx03+CoamjdoA+ECCtWPkVPf8KF0
         7rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692927057; x=1693531857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7ELdHtTL5wYh7Mk37fDEn5rWUjAm0EdSJQg/6HWPPQ=;
        b=Y3CVTqM2CHocl/EC01GzTIk3cOXUMi8OVC1f6a6i9V3nnJrWLxR57cWfC7bZsO2hUV
         Uv51eOmUmTTG6EKGLQ/0vnM5soJAE8QUGyUiqWQo9vBNIirkpNGKk1yGXexYrbLQTSbt
         jgMwETRwzK/vedfxWLtI6UDGZjv4spvH1rIKx65iIXDzcspaRKrhYnNPtXCI1rqctor7
         6RVcb6rNOWQacYG21Ve6c9B0ITtmkuzhINjNoorDXqkmxZPbFCMBhVoKSQo8KOcKpEPj
         B4grXzNqPEldYwDHHMdocmaX3ztxVkS2nERDzE+KOjCJ5MBUzER0MrwXhpQHsZeTVJbE
         FMfQ==
X-Gm-Message-State: AOJu0YyLAv4yRKhFe1SZv+0Ofp1mbaWmaseDIWN4itdIfR1NYHulMwjy
	sYQ1j6ARj+shweStq6rMTiA=
X-Google-Smtp-Source: AGHT+IGkdO3IAVMt9b8NA6cgzJYFAF5G39z8+OmHSySwOLhyKezYRWYjT2VqAbDb9GTS6Db8Rjs5TA==
X-Received: by 2002:a05:6a00:1a13:b0:68a:49bc:9be3 with SMTP id g19-20020a056a001a1300b0068a49bc9be3mr14483212pfv.29.1692927057420;
        Thu, 24 Aug 2023 18:30:57 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:cd10:2fec:7ce0:fe0a? ([2001:df0:0:200c:cd10:2fec:7ce0:fe0a])
        by smtp.gmail.com with ESMTPSA id y19-20020aa78553000000b00682af93093dsm367550pfn.45.2023.08.24.18.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 18:30:57 -0700 (PDT)
Message-ID: <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
Date: Fri, 25 Aug 2023 13:30:32 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
Content-Language: en-US
To: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Aug 2023 13:39:10 +1000
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
Cc: x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-block@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-snps-arc@lists.infradead.org, linux-scsi@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Guenter Roeck <linux@roeck-us.net>, linux-trace-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger
 .kernel.org, Heiko Carstens <hca@linux.ibm.com>, linux-alpha@vger.kernel.org, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-pci@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Martin, Arnd,

On 25/08/23 13:12, Martin K. Petersen wrote:
> On Thu, 10 Aug 2023 16:19:18 +0200, Arnd Bergmann wrote:
>
>> Most of the patches I sent so far for the -Wmissing-prototype warnings
>> have made it into linux-next now. There are a few that I'm resending
>> now as nobody has picked them up, and then a number of fixes that I
>> found while test-building across all architectures rather than just the
>> ones I usually test.
>>
>> The first 15 patches in this series should be uncontroversial, so
>> I expect that either a subsystem maintainer or Andrew Morton can
>> apply these directly.
>>
>> [...]
> Applied to 6.6/scsi-queue, thanks!
>
> [07/17] scsi: qlogicpti: mark qlogicpti_info() static
>          https://git.kernel.org/mkp/scsi/c/71cc486335c4
> [11/17] scsi: gvp11: remove unused gvp11_setup() function
>          https://git.kernel.org/mkp/scsi/c/bfaa4a0ce1bb

I somehow missed that one ...

The gvp11_setup() function was probably a relic from the times before 
module parameters.

Since gvp11_xfer_mask appears to be required for some Amiga systems to 
set the DMA mask, I'd best send a patch to add such a module parameter ...

Do you know any details around the use of DMA masks for Amiga WD33C93 
drivers, Geert?

Cheers,

     Michael


>
