Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91221E829
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 08:34:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5W2F2F6jzDqP5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 16:34:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Z1pIw6B6; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5VyB3LlxzDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 16:30:42 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id d27so12011490qtg.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 23:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=xKUdb+hbruWq3dXXh4qI/EjjmPYKUivuPGyohFu5Zdc=;
 b=Z1pIw6B6uzxLqjeiithtmBN//JH5zTwrontI9A0wpciJZKFIN2eVo5jw04Cvg/SIEa
 DRXXCUTDKiaKUpk8qO74/ajpvPqUKMuHdwYLWgyU3t2MMaNz+AvGVycKWGkE6XXqOakB
 qZ43yCZIQHokPk2kJhzB6p2AoN1s9Zqf8/+qiI8S8gN7qiQ3HbqYPLrk8mVYyF9q5Qpb
 ZooRm/AIhdoBzUSwF6np8p/PTjKI46LCIuATVqLZysGmuVIqskp+wRC6ybthvLwcAc02
 a6ohhKEpWV23JpphtPF0Z2yq0A+qp3gNhxXYFOuxE2aa+lyS5FdbQtud8ouqWPviOEdC
 nkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=xKUdb+hbruWq3dXXh4qI/EjjmPYKUivuPGyohFu5Zdc=;
 b=M/WoAXHjNfOTADOYvMOcjy/usx5EoyO0Pg66gV7USle+ByrqCRdcX/cMDzcGO1m4Wn
 0zcAxrEoRxqY/OtP7mDzFB/ZihnMqlV7FrMWuzBOaTp4FyynSyj2oXR7xFokiKmEK03t
 9neNVCVQunYHRn29PFNme0Laz6lcQpNOw5qxKbfhJvCKwg6We/48JJtz+2BFy2lp23Bo
 ROeamDvugEkHa0RFSawdFfFI9eKnFPGJHQuS4u03MpvLDYnaTcSbRWbNZGNqUIOzRR/B
 Gdm5/GNqvs4rSKiimXMbZ0N0O10wp/i+ckyMeaCIY84lbTadcEr6eNd+BfQ2kH7ytJBH
 cy/A==
X-Gm-Message-State: AOAM531w4OaE2qH3SriKAFpsXaw7GgxyxIn2pwMZyenWtUqxD+h2YkjN
 6tc1vZlBixOgL6fDj7DBYa4=
X-Google-Smtp-Source: ABdhPJwlWLsPlwpq0zR9i90Dp7GAyNtH+c8lDIpDUdf3iZJaVpOx6OwPIJVKfTthEH2GJjQzf/mINw==
X-Received: by 2002:ac8:3895:: with SMTP id f21mr3236543qtc.41.1594708238404; 
 Mon, 13 Jul 2020 23:30:38 -0700 (PDT)
Received: from LeoBras (179-125-193-229.dynamic.desktop.com.br.
 [179.125.193.229])
 by smtp.gmail.com with ESMTPSA id w1sm20098819qkf.73.2020.07.13.23.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 23:30:37 -0700 (PDT)
Message-ID: <eb357d42f5605a2b0234c04de477e171134c24f5.camel@gmail.com>
Subject: Re: [PATCH v3 4/6] powerpc/pseries/iommu: Remove default DMA window
 before creating DDW
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Tue, 14 Jul 2020 03:30:31 -0300
In-Reply-To: <18fd94d2-4365-16d1-7c85-af07d5c9a0f3@ozlabs.ru>
References: <20200703061844.111865-1-leobras.c@gmail.com>
 <20200703061844.111865-5-leobras.c@gmail.com>
 <cc15a81d-04d9-3ee4-4fdb-093618f6e635@ozlabs.ru>
 <8c29be499e8741e7d77d53ca005034a2ca0179ac.camel@gmail.com>
 <18fd94d2-4365-16d1-7c85-af07d5c9a0f3@ozlabs.ru>
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

On Tue, 2020-07-14 at 14:52 +1000, Alexey Kardashevskiy wrote:
> 
> On 14/07/2020 12:40, Leonardo Bras wrote:
> > Thank you for this feedback Alexey!
> > 
> > On Mon, 2020-07-13 at 17:33 +1000, Alexey Kardashevskiy wrote:
> > > [...]
> > > > -	int len, ret;
> > > > +	int len, ret, reset_win_ext;
> > > 
> > > Make it "reset_token".
> > 
> > Oh, it's not a token here, it just checks if the reset_win extension
> > exists. The token would be returned in *value, but since we did not
> > need it here, it's not copied.
> 
> ah right, so it is a bool actually.

In fact I did it a int, as it's the return value of ddw_read_ext(),
which can return 0 on success and -error otherwise.

> > > > [...]
> > > > -out_failed:
> > > > +out_restore_defwin:
> > > > +	if (default_win && reset_win_ext == 0)
> > > 
> > > reset_win_ext potentially may be uninitialized here. Yeah I know it is
> > > tied to default_win but still.
> > 
> > I can't see it being used uninitialized here, as you said it's tied to
> > default_win. 
> 
> Where it is declared - it is not initialized so in theory it can skip
> "if (query.windows_available == 0)".

Humm, I thought doing if (default_win && reset_win_ext == 0) would
guarantee default_win to be tested before reset_win_ext is ever tested,
so I could control it using default_win. 

> 
> 
> > Could you please tell me how it can be used uninitialized here, or what
> > is bad by doing this way?
> > 
> > > After looking at this function for a few minutes, it could use some
> > > refactoring (way too many gotos)  such as:
> > 
> > Yes, I agree.
> > 
> > > 1. move (query.page_size & xx) checks before "if
> > > (query.windows_available == 0)"
> > 
> > Moving 'page_size selection' above 'checking windows available' will
> > need us to duplicate the 'page_size selection' after the new query,
> > inside the if.
> 
> page_size selection is not going to change, why?

In theory, a query after freeing the default DMA window could have a
different (bigger) page size, so we should test again.

> 
> 
> > I mean, as query will be done again, it will need to get the (new) page
> > size.
> > 
> > > 2. move "win64 = kzalloc(sizeof(struct property), GFP_KERNEL)" before
> > > "if (query.windows_available == 0)"
> > > 3. call "reset_dma_window(dev, pdn)" inside the "if
> > > (query.windows_available == 0)" branch.
> > > Then you can drop all "goto out_restore_defwin" and move default_win and
> > > reset_win_ext inside "if (query.windows_available == 0)".
> > 
> > I did all changes suggested locally and did some analysis in the
> > result:
> > 
> > I did not see a way to put default_win and reset_win_ext inside 
> > "if (query.windows_available == 0)", because if we still need a way to
> > know if the default window was removed, and if so, restore in case
> > anything ever fails ahead (like creating the node property). 
> 
> Ah, I missed that new out_restore_defwin label is between other exit
> labels. Sorry :-/
> 
> 
> >                 reset_win_ext = ddw_read_ext(pdn,
> > DDW_EXT_RESET_DMA_WIN, NULL);
> > -               if (reset_win_ext)
> > +               if (reset_win_ext){
> > +                       default_win = NULL;
> >                         goto out_failed;
> > +               }
> 
> This says "if we can reset, then we fail", no?

Here ddw_read_ext() should return 0 if extension was found, and 
(-EINVAL, -ENODATA or -EOVERFLOW) otherwise.
So it should return nonzero if we can't find the extension, in which
case we should fail.

> 
> >                 remove_dma_window(pdn, ddw_avail, default_win);
> 
> I think you can do "default_win=NULL" here and later at
> out_restore_defwin check if it is NULL - then call reset.

Currently I initialize 'default_win = NULL', and it only changes when I
read the default DMA window. If reset is not available I restore it to
NULL, so it will be not-NULL only when the have removed the default DMA
window. 

If I make it NULL here, we either never reset the default DMA window
(as it is now "if (default_win)" ) or we may always reset it (in case
 "if (default_win == NULL)"). 

If you think it's better, I can create a bool variable like
"default_win_removed", initialized with 'false', which can be assigned
here with 'true' and test in the end if(default_win_removed) reset();

This would allow to move default_win inside this 'if block'.

What do you think?

> > [...]
> >  
> > -out_restore_defwin:
> > -       if (default_win && reset_win_ext == 0)
> > +out_failed:
> > +       if (default_win)
> >                 reset_dma_window(dev, pdn);
> >  
> > -out_failed:
> >         fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
> >         if (!fpdn)
> >                 goto out_unlock;
> > 
> > #####
> > 
> > What do you think?
> > 
> > 
> > 
> > > The rest of the series is good as it is,
> > 
> > Thank you :)
> > 
> > >  however it may conflict with
> > > https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200713062348.100552-1-aik@ozlabs.ru/
> > > and the patchset it is made on top of -
> > > https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=188385 .
> > 
> > <From the message of the first link>
> > > (do not rush, let me finish reviewing this first) 
> > 
> > Ok, I have no problem rebasing on top of those patchsets, but what
> > would you suggest to be done?
> 
> Polish this patch one more time and if by the time when you reposted it
> the other patchset is not in upstream, I'll ask Michael to take yours first.

Ok :)

> 
> > Would it be ok doing a big multi-author patchset, so we guarantee it
> > being applied in the correct order?
> > > (You probably want me to rebase my patchset on top of Hellwig + yours,
> > right?) 
> 
> Nah, at least not yet.

Thank you!

