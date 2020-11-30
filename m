Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8AC2C8083
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 10:04:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkznJ0MJCzDqTx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 20:04:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UeHEb5Bh; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkzhT103yzDr5L
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 20:00:07 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id s8so14953648wrw.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 01:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=UfG2bNla+H193S2roaGiiAOAkRdtKJ6N7UjdzcTnBWo=;
 b=UeHEb5BhuoU0KmWLSE5a7oS+jC3wR+MNje6cxnqJ7NWF+gkq9i9BUlSteOkzUeWEn9
 uMVcMGQQhL3Qx6OxwocPO9S5jI7eyRkaEYSCUgzSnwJM9GkMyEoAx6mKm9QLsuBKCAI0
 q6PvvuiJYfNOCPYTKg8gmNM6K505n86uGyto1sjmR80C+6yQwjQzBft7co7noaufzQsn
 +TD0HP1UYdAFBrrvVQhpFDiPB/y6FcqOY03XiD/6t85NizskJJWXUO5BYeXo8oFXOp80
 adY0SJQcb1v3rlVVSrHDgvpYJAisUJ1SicyTB1S25ItN/SS3MCKPSuk/MirD/XdvvWJr
 zguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UfG2bNla+H193S2roaGiiAOAkRdtKJ6N7UjdzcTnBWo=;
 b=fDP58ELdddF59h7QjHvfMzzpNotoxP2QSO5Bc7uh97LzaO0CNwRLRp809M1wVY2Ftu
 6rylbJL/Qxw6IuOTEyGaIunOx3FU9zUo5jnUlu7JeRvwJfxZQuGLh6BHuVdGOPy7uz3v
 JGBXhNzpKDaZNtzruF401pXpBoAHHVRbimzJqWu6/sLWKo7dthv1LLciOI9fmBMYZxlC
 WZzG2pYBaaqOL5WlEyj++PzLxKYHm0dvHfmBPX76Nhs6+aMe/kv+xVJ+VNSR9sCO9qtJ
 1EiApM2JFoO4tJLnpeD5Mby6sKDq4JGoIFKgdWNjXtolGWLLj25SoInWRM8j93OBRAfO
 w8AQ==
X-Gm-Message-State: AOAM532cVYlq0/UXB91+MBo3FlgrERT8bLVlTrHdhB25Qa3ukH0W2y00
 7n4ZTH/9IozHT+VenUzV51FF9Q==
X-Google-Smtp-Source: ABdhPJwjMD/K9L6q/u1v+6o0Xd7gQBKWZ31ZOPLI5GwYmNcIziyuHNZb8NaF/OUL90PKR/MIdqoYJg==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr27285736wrt.158.1606726801375; 
 Mon, 30 Nov 2020 01:00:01 -0800 (PST)
Received: from dell ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id c190sm18615729wme.19.2020.11.30.01.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 01:00:00 -0800 (PST)
Date: Mon, 30 Nov 2020 08:59:58 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 8/8] net: ethernet: ibm: ibmvnic: Fix some kernel-doc
 issues
Message-ID: <20201130085958.GC4801@dell>
References: <20201126133853.3213268-1-lee.jones@linaro.org>
 <20201126133853.3213268-9-lee.jones@linaro.org>
 <20201129191015.GO2234159@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201129191015.GO2234159@lunn.ch>
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
Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>,
 John Allen <jallen@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Santiago Leon <santi_leon@yahoo.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Lijun Pan <ljp@linux.ibm.com>,
 Dany Madden <drt@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 29 Nov 2020, Andrew Lunn wrote:

> On Thu, Nov 26, 2020 at 01:38:53PM +0000, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  from drivers/net/ethernet/ibm/ibmvnic.c:35:
> >  inlined from ‘handle_vpd_rsp’ at drivers/net/ethernet/ibm/ibmvnic.c:4124:3:
> >  drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Function parameter or member 'hdr_data' not described in 'build_hdr_data'
> >  drivers/net/ethernet/ibm/ibmvnic.c:1362: warning: Excess function parameter 'tot_len' description in 'build_hdr_data'
> >  drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Function parameter or member 'hdr_data' not described in 'create_hdr_descs'
> >  drivers/net/ethernet/ibm/ibmvnic.c:1423: warning: Excess function parameter 'data' description in 'create_hdr_descs'
> >  drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Function parameter or member 'txbuff' not described in 'build_hdr_descs_arr'
> >  drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Excess function parameter 'skb' description in 'build_hdr_descs_arr'
> >  drivers/net/ethernet/ibm/ibmvnic.c:1474: warning: Excess function parameter 'subcrq' description in 'build_hdr_descs_arr'
> 
> Hi Lee
> 
> It looks like this should be squashed into the previous patch to this
> file.

It certainly looks that way.  Will fix.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
