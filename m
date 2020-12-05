Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D332CF95A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 05:51:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cnxx91w3YzDqgr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 15:51:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gsJHXW8C; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cnxtb5PNXzDqXG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 15:49:11 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id l11so4296289plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 20:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Nb9T4leS4Okb7bkKk074tEGv/Gy3QayUZQ2lyWI+CyQ=;
 b=gsJHXW8CYsLyLTGSztE7txvh3vIMuAuI05hKOHlhR0HFrQBO6CTfJYEIeyx8ndojh1
 0FV2zvl0jvqa9Mnjdo8U9Tn4iteqER/YF57+OwBL3Oao94w7Fsy5uq1mr4qK3Di89Qm3
 zrgeYMS+VqwCFbZrM4vin8093CMu9ZrdafYMjQS75LMmG1L4BmOowHHo/TZeuFDDwfYX
 Td27wU3NTZ8hTWseuXT6puZdomZRynpZbhCGO2yimfIVAk5gaL6Gjrax2Ic6A0rjXeXb
 Rp4LeNAyAgUZO2fmQFhnksDdyz0pfUZA5AroTTuKFIjh0Ml/LbzvjNafCw0TvDfT8pkn
 OV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Nb9T4leS4Okb7bkKk074tEGv/Gy3QayUZQ2lyWI+CyQ=;
 b=gErcawTRcgiilDQ3N4g3z1rdfW1mwGqZC85W/ALf+kKF2xqcOlgSl/wmqCf3jZ/sWF
 N8GrFWwg7TtKrGVxQGOiaP4JPXB7dM1B9veNRAfmTGN5p5CIYDKvbbHfP12V2MN/M0Fi
 vXEs9WOr09lsq5JCyqBNpvCrsnYx/9W+yDpano5EfRT14PLqHNfOpc1ffuChOblaINWe
 wYuhlPkrerkOWLWzrmj+9rthP34GSsn7E0MaIvW5ECiOyN1MMOLiIH5bkCZN7DiwuvLn
 2AVMBO+ZV+J8yLzfuJqUFxIItzdfqtnGTOY3tbLn1c99z87cgTI4TSI2OZsg09lZS2vo
 RshQ==
X-Gm-Message-State: AOAM5331QcmQFiZvlTNqHWozvW4rjSCCSpR1/OJehwFP7YkywaH4nd+T
 vbxl7O2XDHgh2KC2y3EBnL8=
X-Google-Smtp-Source: ABdhPJyib/qkhvo5CnfZZZ++38N/B+omKeTLXjREaNcrLJrVPtGwsFQpMnAhzrFUjxmdaRS0GTqXjA==
X-Received: by 2002:a17:902:8309:b029:da:1140:df85 with SMTP id
 bd9-20020a1709028309b02900da1140df85mr6851672plb.46.1607143748095; 
 Fri, 04 Dec 2020 20:49:08 -0800 (PST)
Received: from localhost ([1.129.238.242])
 by smtp.gmail.com with ESMTPSA id q23sm6620406pfg.18.2020.12.04.20.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 20:49:07 -0800 (PST)
Date: Sat, 05 Dec 2020 14:49:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v8 11/12] mm/vmalloc: Hugepage vmalloc mappings
To: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Edgecombe, Rick P"
 <rick.p.edgecombe@intel.com>
References: <20201128152559.999540-1-npiggin@gmail.com>
 <20201128152559.999540-12-npiggin@gmail.com>
 <e9d3a50e1b18f9ea1cdfdc221bef75db19273417.camel@intel.com>
 <1607068679.lfd133za4h.astroid@bobo.none>
 <2e8e1f3e47736e8f5e749cee85b7036cbf9cb1b5.camel@intel.com>
In-Reply-To: <2e8e1f3e47736e8f5e749cee85b7036cbf9cb1b5.camel@intel.com>
MIME-Version: 1.0
Message-Id: <1607142139.ple4gyiix8.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "lizefan@huawei.com" <lizefan@huawei.com>,
 "Jonathan.Cameron@Huawei.com" <Jonathan.Cameron@Huawei.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Edgecombe, Rick P's message of December 5, 2020 4:33 am:
> On Fri, 2020-12-04 at 18:12 +1000, Nicholas Piggin wrote:
>> Excerpts from Edgecombe, Rick P's message of December 1, 2020 6:21
>> am:
>> > On Sun, 2020-11-29 at 01:25 +1000, Nicholas Piggin wrote:
>> > > Support huge page vmalloc mappings. Config option
>> > > HAVE_ARCH_HUGE_VMALLOC
>> > > enables support on architectures that define HAVE_ARCH_HUGE_VMAP
>> > > and
>> > > supports PMD sized vmap mappings.
>> > >=20
>> > > vmalloc will attempt to allocate PMD-sized pages if allocating
>> > > PMD
>> > > size
>> > > or larger, and fall back to small pages if that was unsuccessful.
>> > >=20
>> > > Allocations that do not use PAGE_KERNEL prot are not permitted to
>> > > use
>> > > huge pages, because not all callers expect this (e.g., module
>> > > allocations vs strict module rwx).
>> >=20
>> > Several architectures (x86, arm64, others?) allocate modules
>> > initially
>> > with PAGE_KERNEL and so I think this test will not exclude module
>> > allocations in those cases.
>>=20
>> Ah, thanks. I guess archs must additionally ensure that their
>> PAGE_KERNEL allocations are suitable for huge page mappings before
>> enabling the option.
>>=20
>> If there is interest from those archs to support this, I have an
>> early (un-posted) patch that adds an explicit VM_HUGE flag that could
>> override the pessemistic arch default. It's not much trouble to add
>> this=20
>> to the large system hash allocations. It's very out of date now but
>> I=20
>> can at least give what I have to anyone doing an arch support that
>> wants it.
>=20
> Ahh, sorry, I totally missed that this was only enabled for powerpc.
>=20
> That patch might be useful for me actually. Or maybe a VM_NOHUGE, since
> there are only a few places where executable vmallocs are created? I'm
> not sure what the other issues are.

Yeah good question, VM_HUGE might be safer but maybe it would be=20
possible there's only a few problems that have to be annotated with
VM_NOHUGE, good point. I'll dig it out and see.

> I am endeavoring to have small module allocations share large pages, so
> this infrastructure is a big help already.
> https://lore.kernel.org/lkml/20201120202426.18009-1-rick.p.edgecombe@inte=
l.com/

Oh nice that's what I wanted to do next! We should try get this work
for x86 as well then.

Thanks,
Nick
