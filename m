Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 427A25B2D9B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 06:41:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP3GV1pw4z3c5w
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:41:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=meNsPfiL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=meNsPfiL;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP3Fs2tzhz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 14:40:31 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id r17so1221817ejy.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 21:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NOESYgoK2wMPdnD2YfaTrguO/djOwdOuUJuGX9ov7n8=;
        b=meNsPfiLywKgKFDDvhtxftkHvuDh/WiZHX2Z1dmBwtfDHgO36Nj1yVuy1IKmGlDU49
         /az6NEjYB5gLRkND+3l1hVhavoH/n1JLic50JLRBihmfW8Qi3mejmU83jCiGVNYTXZBZ
         DcSXrVGjF76nSlgBjF2/aAIzDp6/8NIKUJpdz5oSuA/vwh4qvBod/9sQIn/SAcRgtl48
         8bR1uYYfCukDI84yqsDymw8gY07hjgNoNCP8dBqcXbv3db1pwLkm1vmjeubjDVatD387
         cn+5BLjxfeBVd7JSUQrQg/ccKzX/tCZGEU7KIrXL3QKhlFTDUwFpg+YgVdZUQmtNWiPk
         vBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NOESYgoK2wMPdnD2YfaTrguO/djOwdOuUJuGX9ov7n8=;
        b=hmgYWisuFlVY9ELj1WwV6psLZgNZVXzf6Lig/y1qDUaov8rC/v3+NY6PPLaByyuFdm
         TD9YjywbyH5Cge2VuhxTVWLqe4zUSBU1KRbGKvEuChy5aB7P0brbRA/wI/Kl7jpy39kh
         sdxDwgIdiRlSRBBHcsSUjOu2rXV/3RlmN0LQdjNam3lLcWlvswTfQRAG/UyHKjZi/l1/
         OumdzB1160eylfjflH2gR1nMiGNlETYcVeAJ/lE7hCGcr8CoOjdxwQzXMaiuks4+hD02
         YKLPP9EwmWu/Yu9wmqss48IurqO6iMmETysP3qA4eJBOldhfnGhrcuMNcoHAt094YbCf
         veoQ==
X-Gm-Message-State: ACgBeo2QSdF77KzlpIWJS6dcXJoTDl8i4Wx6Pn6PVu/ERQGxm5z/sByg
	WiAJnBQ2VKCOFOXXj98IepaoPtsYPF+aUjopLyI=
X-Google-Smtp-Source: AA6agR5ik0/CfPVi5GdwZMYYyFQwzDdtK6EYklLEoOGvER0iKkdIFE9toRIRoQmVP45iGah3ph7Sf46nDTUSkJyhO8o=
X-Received: by 2002:a17:906:8b81:b0:733:183b:988e with SMTP id
 nr1-20020a1709068b8100b00733183b988emr8401446ejc.457.1662698423278; Thu, 08
 Sep 2022 21:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com> <20220822082120.8347-2-yangyicong@huawei.com>
 <cc68c8c0-0db1-1678-2095-54383c1383ad@arm.com>
In-Reply-To: <cc68c8c0-0db1-1678-2095-54383c1383ad@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 Sep 2022 16:40:11 +1200
Message-ID: <CAGsJ_4zajhnbt47HQHCyu7fL5Y-b3BOb8MSCb2kr2CfW+gC5gg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] Revert "Documentation/features: mark
 BATCHED_UNMAP_TLB_FLUSH doesn't apply to ARM64"
To: Anshuman Khandual <anshuman.khandual@arm.com>
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, yangyicong@hisilicon.com, linux-mm@kvack.org, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 9, 2022 at 4:26 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 8/22/22 13:51, Yicong Yang wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > This reverts commit 6bfef171d0d74cb050112e0e49feb20bfddf7f42.
> >
> > I was wrong. Though ARM64 has hardware TLB flush, but it is not free
> > and it is still expensive.
> > We still have a good chance to enable batched and deferred TLB flush
> > on ARM64 for memory reclamation. A possible way is that we only queue
> > tlbi instructions in hardware's queue. When we have to broadcast TLB,
> > we broadcast it by dsb. We just need to get adapted the existing
> > BATCHED_UNMAP_TLB_FLUSH.
> >
> > Tested-by: Xin Hao <xhao@linux.alibaba.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > ---
> >  Documentation/features/arch-support.txt        | 1 -
> >  Documentation/features/vm/TLB/arch-support.txt | 2 +-
> >  2 files changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/Documentation/features/arch-support.txt b/Documentation/features/arch-support.txt
> > index 118ae031840b..d22a1095e661 100644
> > --- a/Documentation/features/arch-support.txt
> > +++ b/Documentation/features/arch-support.txt
> > @@ -8,5 +8,4 @@ The meaning of entries in the tables is:
> >      | ok |  # feature supported by the architecture
> >      |TODO|  # feature not yet supported by the architecture
> >      | .. |  # feature cannot be supported by the hardware
> > -    | N/A|  # feature doesn't apply to the architecture
> >
> > diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
> > index 039e4e91ada3..1c009312b9c1 100644
> > --- a/Documentation/features/vm/TLB/arch-support.txt
> > +++ b/Documentation/features/vm/TLB/arch-support.txt
> > @@ -9,7 +9,7 @@
> >      |       alpha: | TODO |
> >      |         arc: | TODO |
> >      |         arm: | TODO |
> > -    |       arm64: | N/A  |
> > +    |       arm64: | TODO |
> >      |        csky: | TODO |
> >      |     hexagon: | TODO |
> >      |        ia64: | TODO |
>
> I believe this patch is not needed, which explicitly reverts an
> older commit. Instead when ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> framework gets enabled on arm64, the same patch could just drop
> 'NA' as possible values for arch support for a give feature in
> file Documentation/features/arch-support.txt.

Sure. it is certainly ok to fix this in
arm64: support batched/deferred tlb shootdown during page reclamation

By a separate patch, I was trying to highlight that my previous patch was
wrong. but, yes. it is not fundamentally necessary.

Thanks
Barry
