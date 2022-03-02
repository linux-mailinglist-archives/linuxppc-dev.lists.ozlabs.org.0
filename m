Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECA24CA30A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 12:15:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7s3J0nW6z3bry
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 22:15:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.169;
 helo=mail-vk1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7s2p45fCz2yQK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 22:14:41 +1100 (AEDT)
Received: by mail-vk1-f169.google.com with SMTP id c4so571040vkq.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Mar 2022 03:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b5YLd51/OcQl1EkdSJ+fFGs+svIOlCm01raLeRgdFtE=;
 b=S8ln4oiSgS5+3vWrLLJVRBMTDZ+Fuo8Gt+BmBesVSu7JxgGdY9D4UC+FBhRyeL5394
 i5Dniek7rMHgDTVg/VYC/fE39q6Zr9gbehlstE0syq/5hsalN0dbHdKVwZgu2VK6L5yT
 xDvLRNSZkOBie+aItNsyv/hS+RgHwWxNIh0cDsB93iGOUKKqnWI5LLIpqIaIkqwXJ5q+
 BWJHG46qMzqBBVPAIOkAkYe7DdPkjSXeg2TGzFL2pOmv3KU+IBkQw1vMnIkxJEvWOB2Q
 E+04+X+odwE2yJtBNbEgK+CC26iABtXbs2hRFHY5fbfnn34cKg1P56lnhHTCC33IgEBb
 cNzA==
X-Gm-Message-State: AOAM533akV/uhUGfWbDqf49lPeZxUPeJVl1UPv5rvk5aTOtN+AB+e8ld
 5Jwz2pMh1TAW8XN0MrRpzegjohqBR+qIXQ==
X-Google-Smtp-Source: ABdhPJyTp+HgRACh6T5rvLwIGjI3u6khWo1+pceIu1O9pq1gjWhYwfv6oz28LS2kQszo3G2TF/Kvbw==
X-Received: by 2002:a05:6122:17a6:b0:31e:d699:29e0 with SMTP id
 o38-20020a05612217a600b0031ed69929e0mr13174937vkf.1.1646219679280; 
 Wed, 02 Mar 2022 03:14:39 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com.
 [209.85.221.182]) by smtp.gmail.com with ESMTPSA id
 t123-20020a1f4681000000b00333ad3ec70dsm1035770vka.42.2022.03.02.03.14.38
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 03:14:39 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id j12so710863vkr.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Mar 2022 03:14:38 -0800 (PST)
X-Received: by 2002:a1f:6087:0:b0:328:e94a:54b3 with SMTP id
 u129-20020a1f6087000000b00328e94a54b3mr12285212vkb.20.1646219678545; Wed, 02
 Mar 2022 03:14:38 -0800 (PST)
MIME-Version: 1.0
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
 <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
 <Yh1pYAOiskEQes3p@shell.armlinux.org.uk>
 <dc3c95a4-de06-9889-ce1e-f660fc9fbb95@csgroup.eu>
 <c3b60de0-38cd-160a-aa15-831349e07e23@arm.com>
 <52866c88-59f9-2d1c-6f5a-5afcaf23f2bb@csgroup.eu>
 <9caa90f5-c10d-75dd-b403-1388b7a3d296@arm.com>
 <CAMuHMdU11kaOzanhHZRH+mLTJzaz-i=PnKdK7NF9V-qx6kp8wg@mail.gmail.com>
 <b1eca2cd-36e6-3a9a-9fe7-70fc0caed7a9@arm.com>
In-Reply-To: <b1eca2cd-36e6-3a9a-9fe7-70fc0caed7a9@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Mar 2022 12:14:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPw_yBMe9XxQHHuf40it3V5mGuOA10KnMpXt124Ay8Tw@mail.gmail.com>
Message-ID: <CAMuHMdUPw_yBMe9XxQHHuf40it3V5mGuOA10KnMpXt124Ay8Tw@mail.gmail.com>
Subject: Re: [PATCH V3 09/30] arm/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: Anshuman Khandual <anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anshuman,

On Wed, Mar 2, 2022 at 12:07 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> On 3/2/22 3:35 PM, Geert Uytterhoeven wrote:
> > On Wed, Mar 2, 2022 at 10:51 AM Anshuman Khandual
> > <anshuman.khandual@arm.com> wrote:
> >> On 3/2/22 12:35 PM, Christophe Leroy wrote:
> >>> Le 02/03/2022 =C3=A0 04:22, Anshuman Khandual a =C3=A9crit :
> >>>> On 3/1/22 1:46 PM, Christophe Leroy wrote:
> >>>>> Le 01/03/2022 =C3=A0 01:31, Russell King (Oracle) a =C3=A9crit :
> >>>>>> On Tue, Mar 01, 2022 at 05:30:41AM +0530, Anshuman Khandual wrote:
> >>>>>>> On 2/28/22 4:27 PM, Russell King (Oracle) wrote:
> >>>>>>>> On Mon, Feb 28, 2022 at 04:17:32PM +0530, Anshuman Khandual wrot=
e:
> >>>>>>>>> This defines and exports a platform specific custom vm_get_page=
_prot() via
> >>>>>>>>> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX =
and __PXXX
> >>>>>>>>> macros can be dropped which are no longer needed.
> >>>>>>>>
> >>>>>>>> What I would really like to know is why having to run _code_ to =
work out
> >>>>>>>> what the page protections need to be is better than looking it u=
p in a
> >>>>>>>> table.
> >>>>>>>>
> >>>>>>>> Not only is this more expensive in terms of CPU cycles, it also =
brings
> >>>>>>>> additional code size with it.
> >>>>>>>>
> >>>>>>>> I'm struggling to see what the benefit is.
> >>>>>>>
> >>>>>>> Currently vm_get_page_prot() is also being _run_ to fetch require=
d page
> >>>>>>> protection values. Although that is being run in the core MM and =
from a
> >>>>>>> platform perspective __SXXX, __PXXX are just being exported for a=
 table.
> >>>>>>> Looking it up in a table (and applying more constructs there afte=
r) is
> >>>>>>> not much different than a clean switch case statement in terms of=
 CPU
> >>>>>>> usage. So this is not more expensive in terms of CPU cycles.
> >>>>>>
> >>>>>> I disagree.
> >>>>>
> >>>>> So do I.
> >>>>>
> >>>>>>
> >>>>>> However, let's base this disagreement on some evidence. Here is th=
e
> >>>>>> present 32-bit ARM implementation:
> >>>>>>
> >>>>>> 00000048 <vm_get_page_prot>:
> >>>>>>         48:       e200000f        and     r0, r0, #15
> >>>>>>         4c:       e3003000        movw    r3, #0
> >>>>>>                           4c: R_ARM_MOVW_ABS_NC   .LANCHOR1
> >>>>>>         50:       e3403000        movt    r3, #0
> >>>>>>                           50: R_ARM_MOVT_ABS      .LANCHOR1
> >>>>>>         54:       e7930100        ldr     r0, [r3, r0, lsl #2]
> >>>>>>         58:       e12fff1e        bx      lr
> >>>>>>
> >>>>>> That is five instructions long.
> >>>>>
> >>>>> On ppc32 I get:
> >>>>>
> >>>>> 00000094 <vm_get_page_prot>:
> >>>>>         94: 3d 20 00 00     lis     r9,0
> >>>>>                     96: R_PPC_ADDR16_HA     .data..ro_after_init
> >>>>>         98: 54 84 16 ba     rlwinm  r4,r4,2,26,29
> >>>>>         9c: 39 29 00 00     addi    r9,r9,0
> >>>>>                     9e: R_PPC_ADDR16_LO     .data..ro_after_init
> >>>>>         a0: 7d 29 20 2e     lwzx    r9,r9,r4
> >>>>>         a4: 91 23 00 00     stw     r9,0(r3)
> >>>>>         a8: 4e 80 00 20     blr
> >>>>>
> >>>>>
> >>>>>>
> >>>>>> Please show that your new implementation is not more expensive on
> >>>>>> 32-bit ARM. Please do so by building a 32-bit kernel, and providin=
g
> >>>>>> the disassembly.
> >>>>>
> >>>>> With your series I get:
> >>>>>
> >>>>> 00000000 <vm_get_page_prot>:
> >>>>>      0:     3d 20 00 00     lis     r9,0
> >>>>>                     2: R_PPC_ADDR16_HA      .rodata
> >>>>>      4:     39 29 00 00     addi    r9,r9,0
> >>>>>                     6: R_PPC_ADDR16_LO      .rodata
> >>>>>      8:     54 84 16 ba     rlwinm  r4,r4,2,26,29
> >>>>>      c:     7d 49 20 2e     lwzx    r10,r9,r4
> >>>>>     10:     7d 4a 4a 14     add     r10,r10,r9
> >>>>>     14:     7d 49 03 a6     mtctr   r10
> >>>>>     18:     4e 80 04 20     bctr
> >>>>>     1c:     39 20 03 15     li      r9,789
> >>>>>     20:     91 23 00 00     stw     r9,0(r3)
> >>>>>     24:     4e 80 00 20     blr
> >>>>>     28:     39 20 01 15     li      r9,277
> >>>>>     2c:     91 23 00 00     stw     r9,0(r3)
> >>>>>     30:     4e 80 00 20     blr
> >>>>>     34:     39 20 07 15     li      r9,1813
> >>>>>     38:     91 23 00 00     stw     r9,0(r3)
> >>>>>     3c:     4e 80 00 20     blr
> >>>>>     40:     39 20 05 15     li      r9,1301
> >>>>>     44:     91 23 00 00     stw     r9,0(r3)
> >>>>>     48:     4e 80 00 20     blr
> >>>>>     4c:     39 20 01 11     li      r9,273
> >>>>>     50:     4b ff ff d0     b       20 <vm_get_page_prot+0x20>
> >>>>>
> >>>>>
> >>>>> That is definitely more expensive, it implements a table of branche=
s.
> >>>>
> >>>> Okay, will split out the PPC32 implementation that retains existing
> >>>> table look up method. Also planning to keep that inside same file
> >>>> (arch/powerpc/mm/mmap.c), unless you have a difference preference.
> >>>
> >>> My point was not to get something specific for PPC32, but to amplify =
on
> >>> Russell's objection.
> >>>
> >>> As this is bad for ARM and bad for PPC32, do we have any evidence tha=
t
> >>> your change is good for any other architecture ?
> >>>
> >>> I checked PPC64 and there is exactly the same drawback. With the curr=
ent
> >>> implementation it is a small function performing table read then a fe=
w
> >>> adjustment. After your change it is a bigger function implementing a
> >>> table of branches.
> >>
> >> I am wondering if this would not be the case for any other switch case
> >> statement on the platform ? Is there something specific/different just
> >> on vm_get_page_prot() implementation ? Are you suggesting that switch
> >> case statements should just be avoided instead ?
> >>
> >>>
> >>> So, as requested by Russell, could you look at the disassembly for ot=
her
> >>> architectures and show us that ARM and POWERPC are the only ones for
> >>> which your change is not optimal ?
> >>
> >> But the primary purpose of this series is not to guarantee optimized
> >> code on platform by platform basis, while migrating from a table based
> >> look up method into a switch case statement.
> >>
> >> But instead, the purposes is to remove current levels of unnecessary
> >> abstraction while converting a vm_flags access combination into page
> >> protection. The switch case statement for platform implementation of
> >> vm_get_page_prot() just seemed logical enough. Christoph's original
> >> suggestion patch for x86 had the same implementation as well.
> >>
> >> But if the table look up is still better/preferred method on certain
> >> platforms like arm or ppc32, will be happy to preserve that.
> >
> > I doubt the switch() variant would give better code on any platform.
> >
> > What about using tables everywhere, using designated initializers
> > to improve readability?
>
> Designated initializers ? Could you please be more specific. A table look
> up on arm platform would be something like this and arm_protection_map[]
> needs to be updated with user_pgprot like before. Just wondering how a
> designated initializer will help here.

It's more readable than the original:

    pgprot_t protection_map[16] __ro_after_init =3D {
            __P000, __P001, __P010, __P011, __P100, __P101, __P110, __P111,
            __S000, __S001, __S010, __S011, __S100, __S101, __S110, __S111
    };

>
> static pgprot_t arm_protection_map[16] __ro_after_init =3D {
>        [VM_NONE]                                       =3D __PAGE_NONE,
>        [VM_READ]                                       =3D __PAGE_READONL=
Y,
>        [VM_WRITE]                                      =3D __PAGE_COPY,
>        [VM_WRITE | VM_READ]                            =3D __PAGE_COPY,
>        [VM_EXEC]                                       =3D __PAGE_READONL=
Y_EXEC,
>        [VM_EXEC | VM_READ]                             =3D __PAGE_READONL=
Y_EXEC,
>        [VM_EXEC | VM_WRITE]                            =3D __PAGE_COPY_EX=
EC,
>        [VM_EXEC | VM_WRITE | VM_READ]                  =3D __PAGE_COPY_EX=
EC,
>        [VM_SHARED]                                     =3D __PAGE_NONE,
>        [VM_SHARED | VM_READ]                           =3D __PAGE_READONL=
Y,
>        [VM_SHARED | VM_WRITE]                          =3D __PAGE_SHARED,
>        [VM_SHARED | VM_WRITE | VM_READ]                =3D __PAGE_SHARED,
>        [VM_SHARED | VM_EXEC]                           =3D __PAGE_READONL=
Y_EXEC,
>        [VM_SHARED | VM_EXEC | VM_READ]                 =3D __PAGE_READONL=
Y_EXEC,
>        [VM_SHARED | VM_EXEC | VM_WRITE]                =3D __PAGE_SHARED_=
EXEC,
>        [VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]      =3D __PAGE_SHARED_=
EXEC
> };

Yeah, like that.

Seems like you already made such a conversion in
https://lore.kernel.org/all/1645425519-9034-3-git-send-email-anshuman.khand=
ual@arm.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
