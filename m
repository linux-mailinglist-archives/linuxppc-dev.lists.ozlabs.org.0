Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D93E7893BA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 05:55:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YxGLOPca;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXjfF5DRWz3cnC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 13:55:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YxGLOPca;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=schmitzmic@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXZlH75p3z2yt6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 08:44:42 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bdbbede5d4so11971125ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 15:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693003477; x=1693608277;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:cc:to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EfHZKV5Rs50FUqRYXClC9vzZD5WlxrYeYbs3IamXT4=;
        b=YxGLOPcaOZR604IVjJRcGcoKnB33IZ0CTfYuHyWKXt+0pInUOQSMoNyJ0dS6B1KmgY
         cxaBOMvor3UlQ6MZnz8hco99YltIQ+TVGTfUiOj3M6EtIom4aLy5Ogu10qSlU6URXk+W
         RnRGmXEhLIg0POh+PDKptxk33OVTKsM2/52zz5494dr8R8CSNGpoqbrRI3gpmS9Q+cTN
         hJYUsHOFyiz+AcMtmJLq8rt6PHOWgX+jhYTNJt4ghkMZ1YZYHd+UADqGIVtKxfSRzrdW
         eHx1TWLsT9QLE3Re7SH9KzLMTXlxKvezJrH+R76CylIu77symnMHbROv+J2zJ4UP/BTK
         7yuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693003477; x=1693608277;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:cc:to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+EfHZKV5Rs50FUqRYXClC9vzZD5WlxrYeYbs3IamXT4=;
        b=V164HZ1h+PiimRRJQv445b+HbTC3bz2b6GiZZykgBLvphHmZxpjqLpILNwS2p2sX/y
         A1qzi1azF+2dzHwR1NdanfdJiD6meGFnTpZjDub0kFvqP1TtfN9oeM3LB72xHkNeTlLO
         1/xh1tqKGBIsFLDWmvTc5WP4okVgoumTYtz1nOpVn4QlJeacMsNrUtZpb7ORVrxLbnr1
         EJ0yv7mjkweOfxDcPHupjPbyPTnTQxR4DChUkEUT55tDuOc7lGmuq+cD6cspOVMReC8M
         2CvGcblf9ESKDgI8vcxfu7o7JtLWAqb0U8+xk04jdjWfygTOkIAJLaR6R5zQU1pMGyDe
         wGiA==
X-Gm-Message-State: AOJu0YwkmvI5RVmPLY/ZWPQQw5O/LjihC7GShPUmXwMxVwS/YFgcKqUF
	TWHsfGnzEaFqFhLX4E6sPlU=
X-Google-Smtp-Source: AGHT+IHfISCtSa05UGz9PT6tDA2qtVyoG70cJPjb2fBEQ6/U+mzxDHROeZB/hJ4FR5D+DwWhbVxiGA==
X-Received: by 2002:a17:903:25d4:b0:1bd:bbc3:c87b with SMTP id jc20-20020a17090325d400b001bdbbc3c87bmr18047490plb.41.1693003477133;
        Fri, 25 Aug 2023 15:44:37 -0700 (PDT)
Received: from Schmitz-MacBook-Pro.local (125-236-136-221-fibre.sparkbb.co.nz. [125.236.136.221])
        by smtp.googlemail.com with ESMTPSA id b1-20020a170902d50100b001adf6b21c77sm2280761plg.107.2023.08.25.15.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 15:44:36 -0700 (PDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
 <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
Message-ID: <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
Date: Sat, 26 Aug 2023 10:44:13 +1200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 26 Aug 2023 13:54:38 +1000
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
Cc: x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-block@vger.kernel.org, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-snps-arc@lists.infradead.org, linux-scsi@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-next@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Guenter Roeck <linux@roeck-us.net>, linux-trace-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>
 , Heiko Carstens <hca@linux.ibm.com>, linux-alpha@vger.kernel.org, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-openrisc@vger.kernel.org, linux-pci@vger.kernel.org, linux-s390@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Andrew Morton <ak
 pm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geert,

Am 25.08.23 um 19:39 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> On Fri, Aug 25, 2023 at 3:31=E2=80=AFAM Michael Schmitz <schmitzmic@gma=
il.com> wrote:
>> On 25/08/23 13:12, Martin K. Petersen wrote:
>>> [11/17] scsi: gvp11: remove unused gvp11_setup() function
>>>          https://git.kernel.org/mkp/scsi/c/bfaa4a0ce1bb
>> I somehow missed that one ...
>>
>> The gvp11_setup() function was probably a relic from the times before
>> module parameters.
>>
>> Since gvp11_xfer_mask appears to be required for some Amiga systems to=

>> set the DMA mask, I'd best send a patch to add such a module parameter=
 ...
>>
>> Do you know any details around the use of DMA masks for Amiga WD33C93
>> drivers, Geert?
> Doh, it's been a while, and I never had an affected system.
> Probably it's needed on A2000 with an accelerator card and GVP II SCSI,=

> to prevent DMA to RAM banks that do not support fast DMA cycles.

Thanks, that's good enough for me.

Linux 2.0 had this comment:

|/* * DMA transfer mask for GVP Series II SCSI controller. * Some
versions can only DMA into the 24 bit address space * (0->16M). Others
can DMA into the full 32 bit address * space. The default is to only
allow DMA into the 24 bit * address space. The "gvp11=3D0xFFFFFFFE" setup=

parameter can * be supplied to force an alternate (32 bit) mask. */ |

|We now handle that (since 2.6.35) through masks defined in
gvp11_zorro_tbl[] (though I note these don't account for unaligned
addresses such as implied by the example in the comment. Are unaligned
DMA buffers still possible today?). Would that cover the 'A2000 with
accelerator' case?
|

||

I'm happy to send a patch if an override to the device default DMA mask
is still necessary.

(Incidentally - did you ever publish the m68k full history tree anywhere
in git?)

Cheers,

=C2=A0=C2=A0=C2=A0 Michael


>
> Gr{oetje,eeting}s,
>
>                         Geert
>

