Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805B33EE67E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 08:13:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gpgh02JmXz3bjX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 16:13:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BBCXvOXw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BBCXvOXw; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpggH0Ntqz2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 16:12:42 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id t16so16266256qta.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 23:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=G5q2kw4t+Ye13oI9DBMvvqvug6wc8CKiiXAR6p+W89I=;
 b=BBCXvOXw4li2gIL9kkbvJ5ZcdZ+itbeWzg1qIECAHIFLOfIX2XSQzcKwfXQTU/IqWt
 0btORgGye8PrIQUXPygvdchbdYCaQyo1Q4GcGhYSSzziVV8bTFIgxygtUDIcpe2aDVp4
 Ov2YFEmfPew8Zm21hM8gN6zOq6CR4/7HL5YLQuJcHgHM4TBgJSCHH3D6NtnqekbbjINL
 6TCJgs9NbqCw9HqgEa8hR4bHgGT7MSpU8rwwB+Gwu8dsD7lWtUre0X0uyZyzW4gI7gR0
 M6mjWK2nRH6HVtCKI9chJv5JQUDsjo2GIvvXVjANDGjxbPFQyV+cUAD/Eg6sWgk7wfkM
 8W0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=G5q2kw4t+Ye13oI9DBMvvqvug6wc8CKiiXAR6p+W89I=;
 b=Zoy5m3RmOFT9L3/xLjF1RMpHFy8dKvaLrLSz2Igymw2BYEqwswUQqQZAhchEl5ZGRd
 QJLhB6xoWkwPKPW0loI2S5jVBf5QVseqXyXENyj9VZ3B92BPnghsRpe1t8QY+XQMJhnY
 WSC1KRIWrfMNVavQuGy6ak64ClfHEQ06v/MbabkZfmXObJIsmjQIYHG8P90swgldA/Yl
 vcJJpJ02KomLpK8Isn2GYP+pHeI8Wmf+3U1v06NCLVYHOEs8bcP9XqPxluIxnHvmuV09
 jQJ1YEZyH2b98gfTqzESMVC3/KE774L4DkkwQq4gdXa4ysQw/6FLnJoCEGe0L53PtPDe
 M/XQ==
X-Gm-Message-State: AOAM532c3xyM7GnV8r4K3WsPevZ88FXdRguww2RjCbqT5OdSzDTDDi/Q
 7RQxp/T22o1rGq5bm8nNHaQ=
X-Google-Smtp-Source: ABdhPJyol1AUFCOLYakvjk8k/FnQSFqpYVx52TWd46ga3LUw/FtBCvvKbLt20uNE3CMvS+SRsEfk+Q==
X-Received: by 2002:a05:622a:612:: with SMTP id
 z18mr1635720qta.330.1629180756978; 
 Mon, 16 Aug 2021 23:12:36 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f0:30b2:5c9e:50:88f3:269a?
 ([2804:431:c7f0:30b2:5c9e:50:88f3:269a])
 by smtp.gmail.com with ESMTPSA id w6sm750513qkf.95.2021.08.16.23.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 23:12:36 -0700 (PDT)
Message-ID: <f9f7bcd75d534ebde7cc83c4138176da4680e30f.camel@gmail.com>
Subject: Re: [PATCH v5 08/11] powerpc/pseries/iommu: Update
 remove_dma_window() to accept property name
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Date: Tue, 17 Aug 2021 03:12:38 -0300
In-Reply-To: <2653ee3e582ba181651e4842821e64d3323fa566.camel@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-9-leobras.c@gmail.com>
 <8dbd08fb-375c-9f21-f8ab-bec163b157bf@linux.ibm.com>
 <2653ee3e582ba181651e4842821e64d3323fa566.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-08-17 at 02:59 -0300, Leonardo Brás wrote:
> Hello Fred, thanks for the feedback!
> 
> On Tue, 2021-07-20 at 19:51 +0200, Frederic Barrat wrote:
> > 
> > 
> > On 16/07/2021 10:27, Leonardo Bras wrote:
> > > Update remove_dma_window() so it can be used to remove DDW with a
> > > given
> > > property name.
> > > 
> > > This enables the creation of new property names for DDW, so we
> > > can
> > > have different usage for it, like indirect mapping.
> > > 
> > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > > ---
> > >   arch/powerpc/platforms/pseries/iommu.c | 21 +++++++++++--------
> > > --
> > >   1 file changed, 11 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/platforms/pseries/iommu.c
> > > b/arch/powerpc/platforms/pseries/iommu.c
> > > index 108c3dcca686..17c6f4706e76 100644
> > > --- a/arch/powerpc/platforms/pseries/iommu.c
> > > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > > @@ -830,31 +830,32 @@ static void remove_dma_window(struct
> > > device_node *np, u32 *ddw_avail,
> > >                         np, ret,
> > > ddw_avail[DDW_REMOVE_PE_DMA_WIN],
> > > liobn);
> > >   }
> > >   
> > > -static void remove_ddw(struct device_node *np, bool remove_prop)
> > > +static int remove_ddw(struct device_node *np, bool remove_prop,
> > > const char *win_name)
> > >   {
> > 
> > 
> > Why switch to returning an int? None of the callers check it.
> 
> IIRC, in a previous version it did make sense, which is not the case
> anymore. I will revert this.
> 
> Thanks!

Oh, sorry about that, it is in fact still needed:

It will make sense in patch v5 10/11:
On iommu_reconfig_notifier(), if (action == OF_RECONFIG_DETACH_NODE),
we need to remove a DDW if it exists.

As there may be different window names, it tests for DIRECT64_PROPNAME,
and if it's not found, it tests for DMA64_PROPNAME.

This approach will skip scanning for DMA64_PROPNAME if
DIRECT64_PROPNAME was found, as both may not exist in the same node.
But for this approach to work we need remove_ddw() to return error if
the property is not found.

Does it make sense? or should I just test for both?

Best regards,
Leonardo Bras



