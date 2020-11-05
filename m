Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A072A810A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 15:36:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRmKW28LLzDqwN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 01:35:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ksj0dq0U; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmGw09ZwzDqy6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 01:33:42 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id h62so1819919wme.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 06:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dJrVaW1T2oqpkxUTn13D+eeWU5ppupk4o6g18zEvuLo=;
 b=Ksj0dq0UzyN7Jj74oPgk6k0dAC9gBuHoTgbone2hjziNphMDu+OswYTfHnSMYtjuF7
 OfY5XdYUnCKbvT6sljLGEPxooFYtdSf3gQuaiZZQQmA2JpU1929ZDqU0lXufWjaCrbW6
 ToXn+W+k6d12cnFkpxj9ebkw6+5sDS0AhMV+mbP6ewPzSKyLAs93W252QSrd1S/7+goD
 LRh1zK4Wu4AvEWeSI0ce2VV4DWygS4eCERsj7vEzvxatY3Q6jgPfXmuc1HqxygHw8g5T
 r7mknGG1sbCUHla2ZAgxaJlznNQgwHwYHHj7ZAYw5t71eVh/FgTaBDyUWLH9Zz8+mc0w
 sdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dJrVaW1T2oqpkxUTn13D+eeWU5ppupk4o6g18zEvuLo=;
 b=OuPHw57Y34VY7q784LMUf+0RH0RezVeuHCgrmInDz4K7M0NrspXoWNZcouH+rIEvIg
 VmbOZPA1GBmwMpt+kB/kXnd8HqXRrl1oBUnvosCLeXRXv1NKyzCbQ6S7berE8LUufMSl
 FZoGfghxPQEOxfz1cgMW4P0w22th5RFhoiq+pCxdu75hvcQpBzT5YEXJ/d4TRPGsNNY2
 9bYmORtDnW7sE8BUMe9zR2IOhhKr+YodPaYdxleOU5tbRs1x1GohjDM2lE+H+h5DlSoy
 thsbs9iC6kDyn/FnZYicq+nonkFsdHNJqkItmVPUjOqnkVhj0y1oOj2XMqd8/bWCIM14
 3pcQ==
X-Gm-Message-State: AOAM532t2ubXXIibjJ0L6/F0+2zT5iiEyD5Oeirny6yoEFYS26XEbPQe
 8H2ZypIks/4gvmFXOigcBwVFZQ==
X-Google-Smtp-Source: ABdhPJxiE8pTNw+xY3JenO1QKY/gJddrZr/lbM8WZ97wn9cRXPS2YZPmnfGMo03i1HPm/gBGymd4XA==
X-Received: by 2002:a1c:b346:: with SMTP id c67mr3025956wmf.105.1604586817976; 
 Thu, 05 Nov 2020 06:33:37 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id y185sm2997644wmb.29.2020.11.05.06.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:33:37 -0800 (PST)
Date: Thu, 5 Nov 2020 14:33:35 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 0/2] tty: Remove obsolete drivers
Message-ID: <20201105143335.GL4488@dell>
References: <20201105123357.708813-1-lee.jones@linaro.org>
 <aa82ff49-8090-dcb8-7e96-6a92b189d302@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa82ff49-8090-dcb8-7e96-6a92b189d302@csgroup.eu>
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
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 05 Nov 2020, Christophe Leroy wrote:

> Hi,
> 
> Le 05/11/2020 à 13:33, Lee Jones a écrit :
> > As per the vendor's request.
> 
> Is the vendor in copy of the patch ?

Not directly.  Only interested parties as indicated by
`get_maintainer.pl` were included.  My assumption is that he'd
pick this set up in the same manner he picked up the last one
(filters?).

> What about the other synclink adapters, namely the synclink_gt ? And the
> synclink_cs in the drivers/char/pcmcia/ ?

Ref *_cs:

  If it wasn't directly mentioned, I've left it in place.

Ref *_gt:

 "synclink_gt.c is still in production and the driver still actively
  used."

> > Lee Jones (2):
> >    tty: Remove redundant synclink driver
> >    tty: Remove redundant synclinkmp driver
> > 
> >   arch/powerpc/configs/ppc6xx_defconfig |    2 -
> >   drivers/tty/Kconfig                   |   27 -
> >   drivers/tty/Makefile                  |    2 -
> >   drivers/tty/synclink.c                | 7899 -------------------------
> >   drivers/tty/synclinkmp.c              | 5580 -----------------
> >   5 files changed, 13510 deletions(-)
> >   delete mode 100644 drivers/tty/synclink.c
> >   delete mode 100644 drivers/tty/synclinkmp.c
> > 
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Jiri Slaby <jirislaby@kernel.org>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Paul Mackerras <paulus@samba.org>
> > 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
