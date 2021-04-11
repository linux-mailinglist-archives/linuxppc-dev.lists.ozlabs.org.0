Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B4435B264
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 10:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJ4V15djdz3c1W
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 18:17:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=u3yg98IG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u3yg98IG; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJ4TY1SSvz2ywy
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 18:16:46 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id v70so10221622qkb.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 01:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=LBTbhlbI3gR7YBi8CwnN+IypMwG7Ih4pzHKlk2GGs4E=;
 b=u3yg98IG1KqvFR3hBDvkVsUR46e6hVfFCl8Ep5VoeDNptVvAewGr1NZ5CfwbF0pc2F
 SmPS4g3l4MIuAXmYrO3qdrQ1a7VaF00rTBDmqPI4Dtw/GX50nji79XI57yWX2DNPJT2N
 JGVL0AN/coZh5DohTkeFOjT0T+IRn3602Jb2W6lxCkAbrIRlpDZNETwa907SHkx2a79K
 U7EUzOfRXZM263Oa0RAP0zIkWyGcenSkUoGptqsUGjjSXrdX732LfgvdtlFwJU0PRwxY
 q+GqiXXX2HPTZGpnjALL0rBburNemIPzYU9xzl3W6j4wVU9PsfCFwkAz1bchxXbcseuj
 JU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=LBTbhlbI3gR7YBi8CwnN+IypMwG7Ih4pzHKlk2GGs4E=;
 b=IXFAPUmnffAuIw+pRIUk6wL8udA7bbdpTqI2NUSF3UVicV6sCXRRm3Q4qaRGXvgp7A
 AzeRoqf7HI6wOdu7UDOHmB1kr9bN2P5PDQauiufKuV7ND4EkEmm0Fd9PmtlxSew2gHF2
 d5d/3Q7UxXaqZ3/0VqVcSBd9Q0tre68FQrrATbsHDxQSFlvrmSRrG60szyE2FVoj5Yhi
 xnpqW7nPffIS0B/4rD3wSPMzYA93oGJS43fBtQPzRdfl+DAI3/QuacaPQFwGPn1qfwdr
 r/yech3EzlquVczyp5CgLZMyXqywBPEKujQN2RDlYWqYaYtv69sG/QiGw9bqbZMduWVX
 iHRw==
X-Gm-Message-State: AOAM532y5jQ01MVUfHv0V+V1gFXJX2/N4y9xRmYiuyV4z800moItOz23
 aqxAb2bzVsJ7DLZ2gPr3QUA=
X-Google-Smtp-Source: ABdhPJwFzCjIF2HkvtqKvC+q+XOJZv00HQ2WhZ2Mo74DATV7Ry17cMTpeh930bPCIIG4MJZ7uEyGgw==
X-Received: by 2002:a05:620a:102c:: with SMTP id
 a12mr21686073qkk.450.1618129003052; 
 Sun, 11 Apr 2021 01:16:43 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04:96f:ab4a:4867:2cb5])
 by smtp.gmail.com with ESMTPSA id s17sm5371872qta.44.2021.04.11.01.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 01:16:42 -0700 (PDT)
Message-ID: <bb8db841d614d676b7463627a61e654dfa0ab440.camel@gmail.com>
Subject: Re: [PATCH v2 10/14] powerpc/pseries/iommu: Reorganize
 iommu_table_setparms*() with new helper
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>, Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Date: Sun, 11 Apr 2021 05:16:37 -0300
In-Reply-To: <aecd317f-ba69-5676-ba30-c51cf5d4ed44@ozlabs.ru>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-11-leobras.c@gmail.com>
 <aecd317f-ba69-5676-ba30-c51cf5d4ed44@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-09-29 at 13:56 +1000, Alexey Kardashevskiy wrote:
> 
> On 12/09/2020 03:07, Leonardo Bras wrote:
> > Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
> > 
> > Add a new helper _iommu_table_setparms(), and use it in
> > iommu_table_setparms() and iommu_table_setparms_lpar() to avoid duplicated
> > code.
> > 
> > Also, setting tbl->it_ops was happening outsite iommu_table_setparms*(),
> > so move it to the new helper. Since we need the iommu_table_ops to be
> > declared before used, move iommu_table_lpar_multi_ops and
> > iommu_table_pseries_ops to before their respective iommu_table_setparms*().
> > 
> > The tce_exchange_pseries() also had to be moved up, since it's used in
> > iommu_table_lpar_multi_ops.xchg_no_kill.
> 
> 
> Use forward declarations (preferred) or make a separate patch for moving 
> chunks (I do not see much point).

Fixed :)

> > @@ -509,8 +559,13 @@ static void iommu_table_setparms(struct pci_controller *phb,
> >   	const unsigned long *basep;
> >   	const u32 *sizep;

> > -	node = phb->dn;
> > +	/* Test if we are going over 2GB of DMA space */
> > 
> > 
> > 
> > +	if (phb->dma_window_base_cur + phb->dma_window_size > 0x80000000ul) {
> > +		udbg_printf("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
> > +		panic("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
> > +	}
> 
> 
> s/0x80000000ul/2*SZ_1G/

Done!

> 
> but more to the point - why this check? QEMU can create windows at 0 and 
> as big as the VM requested. And I am pretty sure I can construct QEMU 
> command line such as it won't have MMIO32 at all and a 4GB default DMA 
> window.
> 

Oh, the diff was a little strange here. I did not add this snippet, it
was already in that function, but since I created the helper, the diff
made it look like I introduced this piece of code.
Please take a look in the diff snippet bellow. (This same lines were
there.)

> > @@ -519,33 +574,25 @@ static void iommu_table_setparms(struct pci_controller *phb,
> >   		return;
> >   	}
> >   
> > -	tbl->it_base = (unsigned long)__va(*basep);
> > 
> > 
> > 
> > +	_iommu_table_setparms(tbl, phb->bus->number, 0, phb->dma_window_base_cur,
> > +			      phb->dma_window_size, IOMMU_PAGE_SHIFT_4K,
> > +			      (unsigned long)__va(*basep), &iommu_table_pseries_ops);
> >     	if (!is_kdump_kernel())
> > 
> > 
> > 
> >   		memset((void *)tbl->it_base, 0, *sizep);
> > 
> > -	tbl->it_busno = phb->bus->number;
> > -	tbl->it_page_shift = IOMMU_PAGE_SHIFT_4K;
> > -
> > -	/* Units of tce entries */
> > -	tbl->it_offset = phb->dma_window_base_cur >> tbl->it_page_shift;
> > -
> > -	/* Test if we are going over 2GB of DMA space */
> > -	if (phb->dma_window_base_cur + phb->dma_window_size > 0x80000000ul) {
> > -		udbg_printf("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
> > -		panic("PCI_DMA: Unexpected number of IOAs under this PHB.\n");
> > -	}
> > -
> >   	phb->dma_window_base_cur += phb->dma_window_size;
> > -
> > -	/* Set the tce table size - measured in entries */
> > -	tbl->it_size = phb->dma_window_size >> tbl->it_page_shift;
> > -
> > -	tbl->it_index = 0;
> > -	tbl->it_blocksize = 16;
> > -	tbl->it_type = TCE_PCI;
> >   }
> >   

Thanks for reviewing, Alexey!


