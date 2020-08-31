Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D97D25719A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 03:43:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BftJL1RZgzDqSB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 11:43:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RatiUEcn; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BftGT5ZCXzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 11:41:36 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id w20so4376148iom.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 18:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsWEUhGlgiDJAF54NYaVAeB30fuO9F/oKoWOkrplvy4=;
 b=RatiUEcn1JdMBKse7zsRoAozxhkJ+S36q73xagPuL/s3DLl229e4YWhUTZSFM5MfK8
 YXB4pvb5XpLYf0pXWMsKfjUkbmHzgAWQjSE965hNOleXV/6MyJPGbske87EqOGl1p6NM
 D+XvsOhXOWy4UddUmSclNWaJCmJMyOUDbZYtIeZn9Ah9MRjJPG6WRlnUVHrFyPFbxvZ/
 ky5lmX6+7LLZwAuJPjWEWiVH1KmMQVYYSZEDSFTnX2gF2CxsUNHX+d25r4kruiaI+SPb
 e+r15KPAc+Ls0kF6bXbfOroHorVGbFWBwDW3l4uokD0A7h4ndJmAFswdCy0KetMXzmn4
 PPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsWEUhGlgiDJAF54NYaVAeB30fuO9F/oKoWOkrplvy4=;
 b=J9AAfUYfVMsV4iA9MCfUOgweNRqvhrI706CmGUgHioDNb6NQbV4qvTOlV1VUFqvk+w
 O+cOr+8co1ngv6WS1FlnOIEp3PQ+aWKxV4O08XfHTbTDItxvXCu6Wr1k67iYawuqC9E+
 Gh34fWqMG3sClRvDTdpyL2rTuQuLTxzZ2L+qOHpsQGnTDVkViv7A9IXDcJ3opwYSZI6x
 tMdD2uaxo+rCd6IqsiLynfvW4LYCgHawT+aKL+VMVdLUeAPbf+HRXvHP+ZUOJOZbSrkH
 2SiFoKIAPurf+XPKrnZUvbeelCAwEFcw3hSSohdU4V+SI/QAp6mDYYQ7Z2uGhxz4ZkCr
 OXHA==
X-Gm-Message-State: AOAM531bCrERdtCFaHmsV3O7YeZpo6164wkDbYhwLKulCS3RaWQlPF26
 eNHGASgn/UNgNSFsm/lOrjabMyhFVNT+ogRJvfs=
X-Google-Smtp-Source: ABdhPJyw64e5xJ/to+Ocus2wchEaS8D9C6LYCJtdOBiVIs3bq8Y0GkrK+zdLV5wpFvWX7G7ozFqTAVjTxJiz2C+7kp8=
X-Received: by 2002:a5d:80c9:: with SMTP id h9mr7017725ior.73.1598838093426;
 Sun, 30 Aug 2020 18:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-2-leobras.c@gmail.com>
 <6232948f-033d-8322-e656-544f12c5f784@ozlabs.ru>
 <31e913d842693b6e107cb2b8e51fd45118b1bd2c.camel@gmail.com>
 <1e77a3d9-dff9-f58b-45be-77be7cbea41a@ozlabs.ru>
 <93037398c7afaabc0411890998f3f29f741c8aff.camel@gmail.com>
 <aaaf993a-d233-f5be-b809-5911a6a9872d@ozlabs.ru>
In-Reply-To: <aaaf993a-d233-f5be-b809-5911a6a9872d@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 31 Aug 2020 11:41:22 +1000
Message-ID: <CAOSf1CG49ztvNoG43hcSHyLB9UY6Nc8maY_q6nvQmiyFQOAp3A@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] powerpc/pseries/iommu: Replace hard-coded page
 shift
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, David Dai <zdai@linux.vnet.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 31, 2020 at 10:08 AM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> On 29/08/2020 05:55, Leonardo Bras wrote:
> > On Fri, 2020-08-28 at 12:27 +1000, Alexey Kardashevskiy wrote:
> >>
> >> On 28/08/2020 01:32, Leonardo Bras wrote:
> >>> Hello Alexey, thank you for this feedback!
> >>>
> >>> On Sat, 2020-08-22 at 19:33 +1000, Alexey Kardashevskiy wrote:
> >>>>> +#define TCE_RPN_BITS             52              /* Bits 0-51 represent RPN on TCE */
> >>>>
> >>>> Ditch this one and use MAX_PHYSMEM_BITS instead? I am pretty sure this
> >>>> is the actual limit.
> >>>
> >>> I understand this MAX_PHYSMEM_BITS(51) comes from the maximum physical memory addressable in the machine. IIUC, it means we can access physical address up to (1ul << MAX_PHYSMEM_BITS).
> >>>
> >>> This 52 comes from PAPR "Table 9. TCE Definition" which defines bits
> >>> 0-51 as the RPN. By looking at code, I understand that it means we may input any address < (1ul << 52) to TCE.
> >>>
> >>> In practice, MAX_PHYSMEM_BITS should be enough as of today, because I suppose we can't ever pass a physical page address over
> >>> (1ul << 51), and TCE accepts up to (1ul << 52).
> >>> But if we ever increase MAX_PHYSMEM_BITS, it doesn't necessarily means that TCE_RPN_BITS will also be increased, so I think they are independent values.
> >>>
> >>> Does it make sense? Please let me know if I am missing something.
> >>
> >> The underlying hardware is PHB3/4 about which the IODA2 Version 2.4
> >> 6Apr2012.pdf spec says:
> >>
> >> "The number of most significant RPN bits implemented in the TCE is
> >> dependent on the max size of System Memory to be supported by the platform".
> >>
> >> IODA3 is the same on this matter.
> >>
> >> This is MAX_PHYSMEM_BITS and PHB itself does not have any other limits
> >> on top of that. So the only real limit comes from MAX_PHYSMEM_BITS and
> >> where TCE_RPN_BITS comes from exactly - I have no idea.
> >
> > Well, I created this TCE_RPN_BITS = 52 because the previous mask was a
> > hardcoded 40-bit mask (0xfffffffffful), for hard-coded 12-bit (4k)
> > pagesize, and on PAPR+/LoPAR also defines TCE as having bits 0-51
> > described as RPN, as described before.
> >
> > IODA3 Revision 3.0_prd1 (OpenPowerFoundation), Figure 3.4 and 3.5.
> > shows system memory mapping into a TCE, and the TCE also has bits 0-51
> > for the RPN (52 bits). "Table 3.6. TCE Definition" also shows it.
> >> In fact, by the looks of those figures, the RPN_MASK should always be a
> > 52-bit mask, and RPN = (page >> tceshift) & RPN_MASK.
>
> I suspect the mask is there in the first place for extra protection
> against too big addresses going to the TCE table (or/and for virtial vs
> physical addresses). Using 52bit mask makes no sense for anything, you
> could just drop the mask and let c compiler deal with 64bit "uint" as it
> is basically a 4K page address anywhere in the 64bit space. Thanks,

Assuming 4K pages you need 52 RPN bits to cover the whole 64bit
physical address space. The IODA3 spec does explicitly say the upper
bits are optional and the implementation only needs to support enough
to cover up to the physical address limit, which is 56bits of P9 /
PHB4. If you want to validate that the address will fit inside of
MAX_PHYSMEM_BITS then fine, but I think that should be done as a
WARN_ON or similar rather than just silently masking off the bits.
