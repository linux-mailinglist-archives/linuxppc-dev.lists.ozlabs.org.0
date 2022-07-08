Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD2156BA4F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 15:08:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfYWR6nRHz3cDR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 23:08:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=DEY/pPyi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=DEY/pPyi;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfYVn5dR0z3c1l
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 23:08:15 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id w24so18026138pjg.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Jul 2022 06:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YX0GXIRGwrdV+uldKViTwGHPwQS8yZ0tHe4j59MVvtQ=;
        b=DEY/pPyi+VWfsqX8uOHchEyZqQFLDtLlgTSiONJuZaYtrzz57fiBLgg2Z4yskRD6h0
         pYWaY1twEgGSx+5C5E56IGfsebWU7wpOmLQ9C6T7q/W+EYj7KIHDewAaUS0gifxCQvxc
         Y4UhyYhWR7gOz4cQHI5iBCcLcidGpsnWvEm56UHEYBAegmcg5xcbxTlNCGfNtdSkNX2a
         x1YADMkRdHWk4zOGnZBzFyaPKEGgNTPGiT1zE7EwdCvgAPeOEIyi9xvJqGH3p1JuUcO1
         nRzzwe366RKB+wQkYWBDQrZWFr0LtZGd/IgHyDfLiV7cEsfJ/zSWZW6lW0e7hlccWtFu
         PuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YX0GXIRGwrdV+uldKViTwGHPwQS8yZ0tHe4j59MVvtQ=;
        b=FRbFwuGuexSFsT8sZgtGj8OfmhehfKXSghW2wZQKHrjjB1Jdy33LPiCltl02h0TE3q
         9b5BbpSpk7HxXQ8p792Vi9ZtrkrycMxWQ6yMTMXcepdh+WtbL6kf4XHG02TNVYXq7w2H
         w9MCCF59yHS6fnpqB7u8hzYa2BP831zV/ovyrrIesdkS8zbEOcloUucCJOlBx53bX6lL
         SPPuNk5z3DJYR9M/q8wmxkEqjs4yheXogEM5ZJLoXsB4ml6g/+Zm8PuOdJKbN7h/Uzjs
         4SkXUUd9SJywQxqrzrgyDcHNXzF36qGkDCJwGImoa089VegcmYPAj/4mMJ201pJpDsp6
         pQ7w==
X-Gm-Message-State: AJIora8ObiwvSO/P+JFGElszTyyT9oG4iG35+vXiJFhw/yDeI+PXAStV
	WKYS5POvX7C4iQmaj2Bud/ysvA==
X-Google-Smtp-Source: AGRyM1tIuwtgC87J64k+xqlvM6tTmdIe635uk72+ahanJtLXUEnXZxxc4ICJdBfra3AtS9Fz4aG8Pg==
X-Received: by 2002:a17:902:ba8a:b0:16b:988f:9279 with SMTP id k10-20020a170902ba8a00b0016b988f9279mr3681225pls.114.1657285690543;
        Fri, 08 Jul 2022 06:08:10 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id y62-20020a626441000000b0050dc76281d3sm2755672pfb.173.2022.07.08.06.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 06:08:09 -0700 (PDT)
Message-ID: <e24d91fb-3da9-d60a-3792-bca0fe550cc7@ozlabs.ru>
Date: Fri, 8 Jul 2022 23:10:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <20220708115522.GD1705032@nvidia.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220708115522.GD1705032@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/07/2022 21:55, Jason Gunthorpe wrote:
> On Fri, Jul 08, 2022 at 04:34:55PM +1000, Alexey Kardashevskiy wrote:
> 
>> For now I'll add a comment in spapr_tce_iommu_attach_dev() that it is fine
>> to do nothing as tce_iommu_take_ownership() and
>> tce_iommu_take_ownership_ddw() take care of not having active DMA mappings.
> 
> That will still cause a security problem because
> tce_iommu_take_ownership()/etc are called too late. This is the moment
> in the flow when the ownershift must change away from the DMA API that
> power implements and to VFIO, not later.

It is getting better and better :)

On POWERNV, at the boot time the platforms sets up PHBs, enables bypass, 
creates groups and attaches devices. As for now attaching devices to the 
default domain (which is BLOCKED) fails the not-being-use check as 
enabled bypass means "everything is mapped for DMA". So at this point 
the default domain has to be IOMMU_DOMAIN_IDENTITY or 
IOMMU_DOMAIN_UNMANAGED so later on VFIO can move devices to 
IOMMU_DOMAIN_BLOCKED. Am I missing something?


> 
> Jason

-- 
Alexey
