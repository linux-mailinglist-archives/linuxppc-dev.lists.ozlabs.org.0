Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A95192B1640
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 08:18:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXVDS4nf9zDr58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 18:18:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kvtcmdhl; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXVBD6mc0zDr2s
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 18:15:59 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id d142so7174148wmd.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 23:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=v5xpZZr95U5JcUyneXlTWfa5jYw6TW2I29KACwDy7/U=;
 b=kvtcmdhlqz7UMLzTgMUn7ufIw8j1SC0BKmAoEGkwqexV2VtVEzQ4q70qLer5fJNhO/
 KRYIg8az2cfRJtDl2HajNP43GTesqVAGQLDMz93fMTw+fgcp3ZCY5pK3g4JRkGKfzq5J
 fuNFckoITLgVgSZNG2tcJn2VSekmwierizldM1wSftdNy/+VTGdcemjfOISsLq0zvx91
 fpyrQVQDJl4YYPYgFuJsiW6ynpIaVTOp+Dvt8QgTxX1Ksl5qnQ7+8qEFL8B3ZqTihP/R
 L/HJiEDNU6K1SyNX+t9qYcc8RnTKdFvQ9U2LQXrFWq1oD6zs+1MovnF5/BDCxflZavwc
 6NAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=v5xpZZr95U5JcUyneXlTWfa5jYw6TW2I29KACwDy7/U=;
 b=dic84tndCTUeSFgPaKSRKMmWASKGNxR4paWUuyxbEpSmeHhDvRFF7ULylLw1IuPeTn
 y8P8hahoHP5u52OahI6UBjtnWgIKDXH+11755XgrijTkDt3CYnkcxXi0er4VReP+jrd0
 Q58et7q6ZtdGUHxstKR6xTZALE24I6vApZit7FRchigqqIzJJCjTmFb3AVyyCMgL6YSV
 7zZo+pKZOvjg2nu5PmtWkZ2NZ/gidX+U9ZKRWlJRWnlkBddpdcy7NFQgr8qvw/Jx1JcJ
 VkVnrMn9OIXm7cYghEx8//bocuTEMET9Xwgsw7IGDeW/EH8GdBe24OWnk4TkHRtUOUtP
 wiKQ==
X-Gm-Message-State: AOAM532zqXQ3/P1JIJQZPzr0Onrz9Z4PcG2OOrM+Yfs2M6eCHyPX5gMn
 /4j2Oon9armqGPV4sqkyOlEdNA==
X-Google-Smtp-Source: ABdhPJwANxxAuFddE/nEKA1cnVEynUQs1Ak0olerHfl2oMWA1DVa3Nfx+DQu1OPxm/H+CYdi+M3EhA==
X-Received: by 2002:a7b:c157:: with SMTP id z23mr1028245wmi.70.1605251755205; 
 Thu, 12 Nov 2020 23:15:55 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id s4sm9939306wro.10.2020.11.12.23.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 23:15:54 -0800 (PST)
Date: Fri, 13 Nov 2020 07:15:52 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Leo Li <leoyang.li@nxp.com>
Subject: Re: [PATCH 11/25] soc: fsl: qe: qe_common: Fix misnamed function
 attribute 'addr'
Message-ID: <20201113071552.GE2787115@dell>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
 <20201103152838.1290217-12-lee.jones@linaro.org>
 <20201112103300.GE1997862@dell>
 <VE1PR04MB66877659A67152AE02CF443F8FE70@VE1PR04MB6687.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VE1PR04MB66877659A67152AE02CF443F8FE70@VE1PR04MB6687.eurprd04.prod.outlook.com>
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
Cc: "Software, Inc" <source@mvista.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 act <dmalek@jlc.net>, Dan Malek <dan@embeddedalley.com>,
 Vitaly Bordug <vbordug@ru.mvista.com>, Scott Wood <scottwood@freescale.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 12 Nov 2020, Leo Li wrote:

> 
> 
> > -----Original Message-----
> > From: Lee Jones <lee.jones@linaro.org>
> > Sent: Thursday, November 12, 2020 4:33 AM
> > To: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > Qiang Zhao <qiang.zhao@nxp.com>; Leo Li <leoyang.li@nxp.com>; Scott
> > Wood <scottwood@freescale.com>; act <dmalek@jlc.net>; Dan Malek
> > <dan@embeddedalley.com>; Software, Inc <source@mvista.com>; Vitaly
> > Bordug <vbordug@ru.mvista.com>; linuxppc-dev@lists.ozlabs.org
> > Subject: Re: [PATCH 11/25] soc: fsl: qe: qe_common: Fix misnamed function
> > attribute 'addr'
> > 
> > On Tue, 03 Nov 2020, Lee Jones wrote:
> > 
> > > Fixes the following W=1 kernel build warning(s):
> > >
> > >  drivers/soc/fsl/qe/qe_common.c:237: warning: Function parameter or
> > member 'addr' not described in 'cpm_muram_dma'
> > >  drivers/soc/fsl/qe/qe_common.c:237: warning: Excess function parameter
> > 'offset' description in 'cpm_muram_dma'
> > >
> > > Cc: Qiang Zhao <qiang.zhao@nxp.com>
> > > Cc: Li Yang <leoyang.li@nxp.com>
> > > Cc: Scott Wood <scottwood@freescale.com>
> > > Cc: act <dmalek@jlc.net>
> > > Cc: Dan Malek <dan@embeddedalley.com>
> > > Cc: "Software, Inc" <source@mvista.com>
> > > Cc: Vitaly Bordug <vbordug@ru.mvista.com>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/soc/fsl/qe/qe_common.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/soc/fsl/qe/qe_common.c
> > > b/drivers/soc/fsl/qe/qe_common.c index 75075591f6308..497a7e0fd0272
> > > 100644
> > > --- a/drivers/soc/fsl/qe/qe_common.c
> > > +++ b/drivers/soc/fsl/qe/qe_common.c
> > > @@ -231,7 +231,7 @@ EXPORT_SYMBOL(cpm_muram_offset);
> > >
> > >  /**
> > >   * cpm_muram_dma - turn a muram virtual address into a DMA address
> > > - * @offset: virtual address from cpm_muram_addr() to convert
> > > + * @addr: virtual address from cpm_muram_addr() to convert
> > >   */
> > >  dma_addr_t cpm_muram_dma(void __iomem *addr)  {
> > 
> > Any idea who will pick this up?
> 
> I can pick them up through my tree, but I haven't created the
> for-next branch for the next kernel yet.  Will look through this
> series soon.  Thanks.

Thank you Leo.

There's not rush.  Just trying to ensure they don't get forgotten.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
