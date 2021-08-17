Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 214173EE673
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 08:01:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpgPs6ff2z3dBX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 16:01:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tzBr4THk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tzBr4THk; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpgNM3Sddz3bjK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 15:59:47 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id q2so23602353plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 22:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=L7y9S8as1vRrjVNxU5IKCvH3ncwWV+1w6HAlsrVK1eo=;
 b=tzBr4THklnuJy4h4p55iHV7+ylmRjPN6jgAgR5lglaNGrFRqwo8/3CIzEsNgTaEYL4
 syQBXXZrUXL2xoWce7cdpLd/Q3xPAacVbNM3n++AnpMEHy2EKKhrpn8IbMckjcJHtqkp
 G4WgPW3h4qKViuMjQtHrMNI7lt1mQgN8maoOMffqAF7+fJC937S5RCLUlcKm8w4h9c9O
 yQ+P2d3ES7Cei5FWquJNfoM2tc5rE0cqohPm52kU2SABsqP+TEYFKBA1bwOeyEl4gcHf
 cKCmyhhgGffqIh8KAWKpJylyococwAZi7ehmHBjKNId/XOMnkytNGwVKowCTvIGIVekn
 U9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=L7y9S8as1vRrjVNxU5IKCvH3ncwWV+1w6HAlsrVK1eo=;
 b=kkE8QkogsFYnGU41G43cK0ygM/PyqzRUVUAJYwGKteC69/IN2/LDMRAvPDPe/uzLpV
 WRvLKpcpCVukcsf8jEXlG7zH2CiUaN0U9Lt909zKK90MJEXa1peBYzsy47/ehTITJiut
 wgolf0i2gBddbL3nssDlXu82obCnz39ATwe7CKG99irBmtBT8/xCUY2oV9qxrtK47vjI
 KJBqmjuow7l1SSButEono35JCDNl7+solrIQ0o5bhjZknUqx4LevJ6SMtyRO8hEvd3dV
 79PTzXVUszB5XkhsVir0jATttWQ4UZ82FLiJ9OPjIxYuTzb6zPfhGlLORbgy2r8U12nW
 eMLQ==
X-Gm-Message-State: AOAM533UGn4vuMxKx+Q1pbS/GpNALgkd91dpa8PPLSrrc1i32q5rNNmc
 ej2d9kN4RFsEYgAubli04/c=
X-Google-Smtp-Source: ABdhPJwfsnEwi9eazaGBT5HSeAOnFGR93A5ZcOxwVXSZgkXT8QfPg60kTKLjSsUx/uwZPicEMz9ROg==
X-Received: by 2002:a17:90a:de04:: with SMTP id
 m4mr1878185pjv.187.1629179985022; 
 Mon, 16 Aug 2021 22:59:45 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f0:30b2:5c9e:50:88f3:269a?
 ([2804:431:c7f0:30b2:5c9e:50:88f3:269a])
 by smtp.gmail.com with ESMTPSA id c15sm920491pjr.22.2021.08.16.22.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 22:59:44 -0700 (PDT)
Message-ID: <2653ee3e582ba181651e4842821e64d3323fa566.camel@gmail.com>
Subject: Re: [PATCH v5 08/11] powerpc/pseries/iommu: Update
 remove_dma_window() to accept property name
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, kernel test robot
 <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Date: Tue, 17 Aug 2021 02:59:46 -0300
In-Reply-To: <8dbd08fb-375c-9f21-f8ab-bec163b157bf@linux.ibm.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-9-leobras.c@gmail.com>
 <8dbd08fb-375c-9f21-f8ab-bec163b157bf@linux.ibm.com>
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

Hello Fred, thanks for the feedback!

On Tue, 2021-07-20 at 19:51 +0200, Frederic Barrat wrote:
> 
> 
> On 16/07/2021 10:27, Leonardo Bras wrote:
> > Update remove_dma_window() so it can be used to remove DDW with a
> > given
> > property name.
> > 
> > This enables the creation of new property names for DDW, so we can
> > have different usage for it, like indirect mapping.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > ---
> >   arch/powerpc/platforms/pseries/iommu.c | 21 +++++++++++----------
> >   1 file changed, 11 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/iommu.c
> > b/arch/powerpc/platforms/pseries/iommu.c
> > index 108c3dcca686..17c6f4706e76 100644
> > --- a/arch/powerpc/platforms/pseries/iommu.c
> > +++ b/arch/powerpc/platforms/pseries/iommu.c
> > @@ -830,31 +830,32 @@ static void remove_dma_window(struct
> > device_node *np, u32 *ddw_avail,
> >                         np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN],
> > liobn);
> >   }
> >   
> > -static void remove_ddw(struct device_node *np, bool remove_prop)
> > +static int remove_ddw(struct device_node *np, bool remove_prop,
> > const char *win_name)
> >   {
> 
> 
> Why switch to returning an int? None of the callers check it.

IIRC, in a previous version it did make sense, which is not the case
anymore. I will revert this.

Thanks!

> 
>    Fred


