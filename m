Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BED1866AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 09:39:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gqVd1m5QzDqDT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 19:39:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZR73x073; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gqSj4P8kzDqLB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 19:38:13 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id f28so24661119qkk.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GBIKtQ/ulbcDtdh6PxMvU1viERIQc6Vgg9GWcGvGlv0=;
 b=ZR73x073nxRSldQepsy/4rpi77Odw7Ua1MPLeNAObTcsBO4SekYhz5/bcaeG8WfZJ0
 +LpxDDWOqJjQTlhPmolTcBnatJ2Vn7i84gAiyGnXMd6x+uW2eTTiBvE967lhoezcSuny
 i+/Ekzakk1Lc9dS+W1Vb490tA/VbTPYFG7W5yRLku8cwKpsDa2gcVvaopKThahDncPE6
 +LTd37NRlPNFzUrlRk3JbU5jdX5x6cSg9wlQbl7+Xwmg1FfHtkXLXIEb02e22tvMh6Tv
 g10fUXAtqI+HdgK2uH8ECEQ5emDaJ3quLBLnl5teK3ycbC2Ha9sAI1/4v7XRJfe+Q0N7
 YqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GBIKtQ/ulbcDtdh6PxMvU1viERIQc6Vgg9GWcGvGlv0=;
 b=TEi7QoA1KQhHIpDh5PaRQXXy47czgVux1zKzhZ6L3unUmKi3FfUclR0wmrPsx0/MLg
 07FYpxjZaU/3sC4uNb5miueWsonDqLjNeCpFGcowIDC1B4s0obvmNZEDkbD94pIID5xK
 7jhpwD2aBN72bkLKE6OXJ3ex4YMugvMA/vPq0R4APwI+2yMwqSHNHgc2k3YIxmTNfmx2
 Zf8iBeDX9cTzzoTsBfaymrbe7FIRkO7Sl0slYiv8Uywow74TwpPNuMt8KCvohxLuAmMU
 /2KrwldePG3AuYUmI9syA5/X7U2Ov29SNKDbIJrohimfahWhHLEXqUynq9EwcKuoXecV
 yClQ==
X-Gm-Message-State: ANhLgQ3ykdWmVQEae9P1PfRoFmsPv/1l93SsK0M8nM4R3TSihHdjGieA
 ne2T4MWe5n0GzUS5Waq5hwXEO5+GP2FgclsuWQ==
X-Google-Smtp-Source: ADFU+vv+UzMC/vzWOR9wQVlK0+UMo9V0HpGdOJbXuEB8HSTCb40fYMnTh0rKQzoOCNyIsWrTvP0cDK7yOKJIP4nWAVw=
X-Received: by 2002:a37:404f:: with SMTP id n76mr283707qka.442.1584347889961; 
 Mon, 16 Mar 2020 01:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <1582882895-3142-1-git-send-email-kernelfans@gmail.com>
 <1583311651-29310-1-git-send-email-kernelfans@gmail.com>
 <1583311651-29310-3-git-send-email-kernelfans@gmail.com>
 <41abb04e-d481-040f-827b-c04ad7d2abb9@linux.ibm.com>
In-Reply-To: <41abb04e-d481-040f-827b-c04ad7d2abb9@linux.ibm.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Mon, 16 Mar 2020 16:37:58 +0800
Message-ID: <CAFgQCTvsKaP34_v-P0x_RNDZ2Jne82DMS33LpC5EE819EjhJHg@mail.gmail.com>
Subject: Re: [PATCHv3 2/2] pseries/scm: buffer pmem's bound addr in dt for
 kexec kernel
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Frank Rowand <frowand.list@gmail.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 16, 2020 at 10:53 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 3/4/20 2:17 PM, Pingfan Liu wrote:
> > At present, plpar_hcall(H_SCM_BIND_MEM, ...) takes a very long time, so
> > if dumping to fsdax, it will take a very long time.
> >
>
>
> that should be fixed by
>
> faa6d21153fd11e139dd880044521389b34a24f2
> Author:       Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> AuthorDate:   Tue Sep 3 18:04:52 2019 +0530
> Commit:       Michael Ellerman <mpe@ellerman.id.au>
> CommitDate:   Wed Sep 25 08:32:59 2019 +1000
>
> powerpc/nvdimm: use H_SCM_QUERY hcall on H_OVERLAP error
>
> Right now we force an unbind of SCM memory at drcindex on H_OVERLAP error.
> This really slows down operations like kexec where we get the H_OVERLAP
> error because we don't go through a full hypervisor re init.
>
> H_OVERLAP error for a H_SCM_BIND_MEM hcall indicates that SCM memory at
> drc index is already bound. Since we don't specify a logical memory
> address for bind hcall, we can use the H_SCM_QUERY hcall to query
> the already bound logical address.
Good to know it.

Thanks,
Pingfan
>
>
>
>
> > Take a closer look, during the papr_scm initialization, the only
> > configuration is through drc_pmem_bind()-> plpar_hcall(H_SCM_BIND_MEM,
> > ...), which helps to set up the bound address.
> >
> > On pseries, for kexec -l/-p kernel, there is no reset of hardware, and this
> > step can be stepped around to save times.  So the pmem bound address can be
> > passed to the 2nd kernel through a dynamic added property "bound-addr" in
> > dt node 'ibm,pmemory'.
> >
>
> -aneesh
>
