Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ED7228BDC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 00:15:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBCb036nhzDqjn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 08:15:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HI4DG4Ol; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBCYF4l91zDq9G
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 08:13:52 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id a32so394733qtb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 15:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=kalVxG8ANnjjy1Dw3YQgCDZ3CtnSjchvQLTtFWwGZEI=;
 b=HI4DG4OlYWFjQ61OejwTOZ7oTYLG7hjW1DsiY3koJJZ8BKbWFzFLCdDota/JQWSQMg
 5RSHdXAyc62g8Z6RiwbcjsW1QsCnWfAYao7+sX3Tn6e1k56NU+qS10UmEcbR3WAnU/5c
 lUVY9P0VC5T1cPJdjm48ChMbUwGlhqtikkZ2x9DCwLGte83hXvlC0PjNGk8zpVzIq5XY
 mwm2cZfmcjMXuqOgY1ut0BXI3nV3HQwwRQr7l0D7uYqY/xB+h3aDVxTIICyRbOpmlyuy
 P+LcjWw5Eo168umDZpGtAXcF7iHXSLgEmwUty7BPuqtntmRIPeXsLqWVvTg42iaQCjqW
 ux/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=kalVxG8ANnjjy1Dw3YQgCDZ3CtnSjchvQLTtFWwGZEI=;
 b=cpTyUZ1pnUTPvMlm5s6So4975bNKXy9wAoJh4/lPmbyHV5TujpqeHu1byk1vOK7trC
 MDkbQfaFetImrKXTexfz2BtobqG5bXjY2MqudgqUBZvqZ7dGKyS3ea/DlKLWgHa2DthD
 IGZJqzsAOu0OooK5ePDMdAvlnak5A3wwd4Q7XSNWBjqHPo1y4OiTsJLmIV2PqrSwtIxl
 MCcvs8VRlUNEDrqT3CleUylmukwg0cSaJZvUl78KFQdu4PvrBzHJwJL5A5pFSpeWNWs1
 3A64l6dnkt6+ebd38LUZ8rxHyh+t83Si86oFYWdH1EdE0XFFYU9GNHLgUUUxKWazh/Ub
 RmiQ==
X-Gm-Message-State: AOAM5311bnSt5OhuH2OUUunqPKmOm/TPZVxodkDl/EKiNMqVaShmy3RL
 EldW+RKC+RkE4xkt2C0HP9k=
X-Google-Smtp-Source: ABdhPJx0yMa8t58yf/qnLF46Y5HIlOeGBFaAKUODUY+XylBgXMuqyo16Q2hhte1VcrtBV2DZouIbCA==
X-Received: by 2002:ac8:32b8:: with SMTP id z53mr31042917qta.273.1595369629394; 
 Tue, 21 Jul 2020 15:13:49 -0700 (PDT)
Received: from LeoBras (179-125-153-225.dynamic.desktop.com.br.
 [179.125.153.225])
 by smtp.gmail.com with ESMTPSA id g4sm22116489qtp.89.2020.07.21.15.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 15:13:48 -0700 (PDT)
Message-ID: <0f4c2d84d0958e98e7ada53c25750fe548cadf0b.camel@gmail.com>
Subject: Re: [PATCH v4 5/7] powerpc/iommu: Move iommu_table cleaning routine
 to iommu_table_clean
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>
Date: Tue, 21 Jul 2020 19:13:42 -0300
In-Reply-To: <51235292-a571-8792-c693-d0dc6faeb21c@ozlabs.ru>
References: <20200716071658.467820-1-leobras.c@gmail.com>
 <20200716071658.467820-6-leobras.c@gmail.com>
 <51235292-a571-8792-c693-d0dc6faeb21c@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-07-21 at 14:59 +1000, Alexey Kardashevskiy wrote:
> 
> On 16/07/2020 17:16, Leonardo Bras wrote:
> > Move the part of iommu_table_free() that does struct iommu_table cleaning
> > into iommu_table_clean, so we can invoke it separately.
> > 
> > This new function is useful for cleaning struct iommu_table before
> > initializing it again with a new DMA window, without having it freed and
> > allocated again.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  arch/powerpc/kernel/iommu.c | 30 ++++++++++++++++++------------
> >  1 file changed, 18 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> > index 9704f3f76e63..c3242253a4e7 100644
> > --- a/arch/powerpc/kernel/iommu.c
> > +++ b/arch/powerpc/kernel/iommu.c
> > @@ -735,21 +735,10 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
> >  	return tbl;
> >  }
> >  
> > -static void iommu_table_free(struct kref *kref)
> > +static void iommu_table_clean(struct iommu_table *tbl)
> 
> iommu_table_free() + iommu_init_table() + set_iommu_table_base() should
> work too, why new helper?

iommu_table_free() also frees the tbl, which would need allocate it
again (new address) and to fill it up again, unnecessarily. 
I think it's a better approach to only change what is needed.

> There is also iommu_table_clear() which does a different thing so you
> need a better name.

I agree.
I had not noticed this other function before sending the patchset. What
would be a better name though? __iommu_table_free()? 

> Second, iommu_table_free
> use and it would be ok as we would only see this when hot-unplugging a
> PE because we always kept the default window.
> Btw you must be seeing these warnings now every time you create DDW with
> these patches as at least the first page is reserved, do not you?

It does not print a warning.
I noticed other warnings, but not this one from iommu_table_free():
/* verify that table contains no entries */
if (!bitmap_empty(tbl->it_ma
p, tbl->it_size))
	pr_warn("%s: Unexpected TCEs\n", __func__);

Before that, iommu_table_release_pages(tbl) is supposed to clear the 
bitmap, so this only tests for a tce that is created in this short period.

> Since we are replacing a table for a device which is still in the
> system, we should not try messing with its DMA if it already has
> mappings so the warning should become an error preventing DDW. It is
> rather hard to trigger in practice but I could hack a driver to ask for
> 32bit DMA mask first, map few pages and then ask for 64bit DMA mask, it
> is not illegal, I think. So this needs a new helper - "bool
> iommu_table_in_use(tbl)" - to use in enable_ddw(). Or I am overthinking
> this?... Thanks,

As of today, there seems to be nothing like that happening in the
driver I am testing. 
I spoke to Brian King on slack, and he mentioned that at the point DDW
is created there should be no allocations in place.

But I suppose some driver could try to do this.

Maybe a better approach would be removing the mapping only if the
default window is removed (at the end of enable_ddw, as an else to
resetting the default DMA window), and having a way to add more
mappings to those pools. But this last part doesn't look so simple, and
it would be better to understand if it's necessary investing work in
this.

What do you think?

Best regards,


