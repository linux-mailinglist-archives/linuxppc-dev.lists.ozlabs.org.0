Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E476D188AEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 17:45:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hfDR2SLNzDqnF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 03:45:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=luc.vanoostenryck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bhJ9poWF; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hdPz38BqzDqhH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 03:08:39 +1100 (AEDT)
Received: by mail-ed1-x542.google.com with SMTP id a20so27280759edj.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i3/HhLR/O0/CbHZXM0VcSB7U8Xi1Wft1dlRFMRO02HY=;
 b=bhJ9poWFWMl3+oFEzoqGdFvuBFpm4liZ2xa75YGFftjCp27P/Rq5S9JgCJRzJeRhFp
 ET2jcWzJwcmzndjTjjgo4I3sJMcKP+zOFfJHkcmviLpx6GFMub044cfodyeDzvBTr5rz
 QdrlvCdm3eeXDmrKrYARcYEsRegY7+N/81F2BDIkvGaOUXh+IY+1mzKNynCPCRccwVWO
 p9wZAVHWeEtV8zdWfRvvT54cIDi65FYaftfEROjVkUCwMBrrLFZ3jnkcn40bfP8wrEy5
 bBmK5VKsrEKR0a4bhnsKqu8+qk/Tp35ox/MPtgBJghewi5xBETXjkq8jPZi6yKH4U4Wm
 9Big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i3/HhLR/O0/CbHZXM0VcSB7U8Xi1Wft1dlRFMRO02HY=;
 b=pCHb55O40Tua4/PTrW8x4D6FMOQAMLSl8U3aEtV3mtMTlcsj0z3Z9Q7gTUwiMIsrS1
 kC6vTKpoeRMbhDbrmYzGfyI6Zpgq8iuc/s3GN1zdBkCJb5Nq7ZJfHf9GwCadjDHjJSEi
 onMmFhFRrFzBegD9jNb0aPblmGCNXV77sotGBV0elPmq2Bit9f05RxhdZxIhAbo1vNAn
 /XS3dtjGgJ43QUDxJ23lqHigqnZrJUfqkyCp9QejsKEPU0wcTujBEszMcKBPbeGB8HL8
 K6UPHscqhJEs1UKtd87GC9V1spAIO2Kd5yhWTFJrxF87+assHV/mN9zdcg/OrcU51Grr
 k4kg==
X-Gm-Message-State: ANhLgQ24UbKZsV/qhXKY9JApnVA11yFgrYRwnQfasW2+sRCY+7IupGMZ
 t9PGTocS8KfhlqtchviaNa/qLVxh
X-Google-Smtp-Source: ADFU+vvpUZPkVKlGLkpmFLSH2ItwqGs0OIwlevrD4d2kPESi8laXU73YjAy22NfvrT4WFKHOjIAkXw==
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr6946877wro.386.1584460807500; 
 Tue, 17 Mar 2020 09:00:07 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:e00d:142c:5e21:c280])
 by smtp.gmail.com with ESMTPSA id a13sm5194418wrh.80.2020.03.17.09.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 09:00:06 -0700 (PDT)
Date: Tue, 17 Mar 2020 17:00:05 +0100
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v1 16/46] powerpc/mm: Allocate static page tables for
 fixmap
Message-ID: <20200317160005.imgtv3w62op4nm2t@ltop.local>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
 <d4bd46fe0103f8a8cb7e5affb2a7fcc3185be24e.1584360344.git.christophe.leroy@c-s.fr>
 <b9c92137-f757-1e6a-bca9-5c522e1083c5@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9c92137-f757-1e6a-bca9-5c522e1083c5@c-s.fr>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 17, 2020 at 03:38:46PM +0100, Christophe Leroy wrote:
> > diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
> > index f62de06e3d07..9934659cb871 100644
> > --- a/arch/powerpc/mm/pgtable_32.c
> > +++ b/arch/powerpc/mm/pgtable_32.c
> > @@ -29,11 +29,27 @@
> >   #include <asm/fixmap.h>
> >   #include <asm/setup.h>
> >   #include <asm/sections.h>
> > +#include <asm/early_ioremap.h>
> >   #include <mm/mmu_decl.h>
> >   extern char etext[], _stext[], _sinittext[], _einittext[];
> > +static u8 early_fixmap_pagetable[FIXMAP_PTE_SIZE] __page_aligned_data;
> 
> Sparse reports this as a variable size array. This is definitely not. Gcc
> properly sees it is an 8k table (2 pages).

Yes, thing is that FIXMAP_PTE_SIZE is not that constant since it uses
__builtin_ffs() (via PTE_SHIFT / PTE_T_LOG2).
Nevertheless, since Sparse v0.6.1 (released in October) accepts these
in constant expressions, like GCC does.

-- Luc
