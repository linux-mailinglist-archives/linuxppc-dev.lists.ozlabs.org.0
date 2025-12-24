Return-Path: <linuxppc-dev+bounces-14986-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52450CDBA22
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 08:55:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbkhN5v2Pz2xqf;
	Wed, 24 Dec 2025 18:55:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766562948;
	cv=none; b=UqSkEJiBPU97B1U2z2G7+/M9/AfHkRx+cbL0AlOxR69pj+u2/qnp5hlJNyEM5FaQniW8tDB3v6yufDg+hCDi1PST9Z7T+SpC+fCAiRdiojgeS7BAkou5vybxgYRcG98sdWcM+zb8pDqZkW3CQBTCEiWBvWj/Jjo+N9r90/3Kx4erZwybyuThEjK4Mke4TQNXm4TP1sfeDei93AgBHwC5jGSXjfQDMx8bJgH/ULxKf6xhxMt2CqbtT7wbcVbMAJr4n0xotMcJFbCDrfqvE53U42kgChg6mESjbpfbGLAW8BgYgEILpG5xSbDszSzG53ajykx5CtoOYnr8uCgJnIQJRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766562948; c=relaxed/relaxed;
	bh=WZrIGbDjUMc3J6sIbF34jJNhsrhnGJpTC/Mf9dBpW/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXv9q1K6Jvi3gnjISlk0pbcySUxRDm6waudSkwBU6HT0+gpz/ZT1gLHC56R7zo8J0EYmxDLDs1NhUikMoVtKNnoj+sbcK2kYNgqPyeGNhpumuOMWOLexkZwMrLU+l6kcrWjZCt8FXVh4++YSfrlbQQbVKLAGmZ5Fzp44AM+ig27WVlfhPXtJAJCdJWQtcZRT1ClclQguj/5XKrenihwWkgWTJVh2DCl+MT9BVK+djPzxwHKv0Pd5bWRD7ngRkgTxugL/OBDsOwstivr4xgXpwau5tXED4hBX0Cjo/zXa21M0UFrF12F+DtHsoqOlctRuWsTUv7SPMwo4TjAloS7UGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H+O+xDuF; dkim-atps=neutral; spf=pass (client-ip=209.85.221.48; helo=mail-wr1-f48.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H+O+xDuF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=209.85.221.48; helo=mail-wr1-f48.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbkhM1qCXz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 18:55:45 +1100 (AEDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so4849372f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 23:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766562883; x=1767167683; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZrIGbDjUMc3J6sIbF34jJNhsrhnGJpTC/Mf9dBpW/Q=;
        b=H+O+xDuFpaARn0DW0DMKokpU1w5jzM65e8RsrvjL/+wmiDh1e2EtlWvqSUDFISi8Ye
         tCWzUXXEBg7/+gE/rHHeT1qk/sH1drE9Fgzw0jwXNX8p0lSoYxo+WnylWGcpthAoRZY4
         bfc8m/fV+YIdBhqXc6lU7VOamKiiI75rvy/MWwSNr0zoEPDkZB+9rUaa23y2fTnJVJvJ
         e6lnvdK/4fuv12nPYWrXXlvNobxumM6fjPsabyiBDbBtvbz96wSvon/7a4WS7W+LWV4H
         tdzsWUWbvt6iPIM/kIsz2FqCM/JZCoEv9aeu/D4lkp+dx5TUbJDZ7V3pYpTMbLmbiGN2
         ElfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766562883; x=1767167683;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZrIGbDjUMc3J6sIbF34jJNhsrhnGJpTC/Mf9dBpW/Q=;
        b=mtrf72G0k/AhF3P6C9ezjxVha1lOLuFidtOPgCNAKxp8NeSPpRTPCHLa3afM1J6AL6
         nc8o4p50Sx0S/i27fsfCpnmwK4OPD0ZhOrUO9W+VUNKFzVdRoLNY7uwCwDMb6YOoiF4N
         H6o2hHjdwH5no1m0aw0g4Sd5kimXdYueLQpkr1Gs67+k6CyNAKGjWr7qWMaHVni1nVh3
         WR1op71JuHN4RW3TDMv9hZKVFi6DRECC72tT64GgdSil95dEkYRgTCUfpNV3Pv5GowMt
         uffKLp7RnYOW6p4jTNzh79sxZZP+nYRX/Boc9sNLVC04Pv2/70tzcg3VTvlCDPGrZmh7
         qjSA==
X-Forwarded-Encrypted: i=1; AJvYcCX/3lqBMXPSCVEBAqvg1tS/+6CZ1N2qy4pFz9t91UHXwEnaErqJ5jH16eQg7ZEA1YhWQddqu3ilbdJpay4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz0oCqMEE/y45ctj20q7giKcjUGGT5INDivPp7e94mQrP2FjWcw
	WdGHu5kmKQY2D9+xIjfLDa0jEbzsivTf/2SulUvPJQnDW6E1MSAtJaVQWDjlrRKVarg=
X-Gm-Gg: AY/fxX7dsthk8QljxDouarc/m8fV20p4s2vYCLjV9LZeFt+sjbmOG/AbW+PwchQLMkx
	choKD71IuDL6v9cFNhep7+66PQF+CFbDvP/nHsx85xhwmlflJNshS0oQt4UQnLePCWr1QOsS8Zt
	oeIZRRLxxAYM2XDN2QGV/eBo5sOMNliXOw3U3fIjl3CnxKucCXVF2MYgLvicv7FEcLRXlNeWwe3
	7OERMgv+8pBln8HMH5wVKt2LEB66jLPqvBNB+s+0o54AWH/RkcC4HlI5ayfPnFChE0KcNsqwIRL
	gRR/arOXOSniH4kGVFgUZKiRB5EOna2oFWwe1X3ECyP1moKfNr3/yNbAGjs8I3IxFbiGP/hrg3u
	jvgdFTVzDM2H6SaVAYO6X+7zkJ2IPjYGKg6ukM5GydDahMp36+57NWxDASo0kOZmPIvCSIFDPla
	8W3kD1zuel8yTRi2Tn
X-Google-Smtp-Source: AGHT+IECNLFLhXkd5CDpgr63GCQOyj7vf3ddOYc1QU6NGh9n1MI1zpPSZMz6dgba6MyyIQX9ZAgPJg==
X-Received: by 2002:a05:6000:25ca:b0:431:5d2:4526 with SMTP id ffacd0b85a97d-4324e4c9df3mr19740323f8f.19.1766562882584;
        Tue, 23 Dec 2025 23:54:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm32714761f8f.7.2025.12.23.23.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 23:54:42 -0800 (PST)
Date: Wed, 24 Dec 2025 10:54:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, ioana.ciornei@nxp.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
Message-ID: <aUucPsDoPQJE5Ucj@stanley.mountain>
References: <20251222074958.992911-1-lihaoxiang@isrc.iscas.ac.cn>
 <cce0a0ca-9ea1-437a-a857-17a2bfa28791@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cce0a0ca-9ea1-437a-a857-17a2bfa28791@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 23, 2025 at 04:34:44PM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 22/12/2025 à 08:49, Haoxiang Li a écrit :
> > If device_add() fails, call put_device() to drop the device
> > reference and do the cleanp.
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/all/b767348e-d89c-416e-acea-1ebbff3bea20@stanley.mountain/
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> > ---
> >   drivers/bus/fsl-mc/fsl-mc-bus.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> > index 25845c04e562..90a2107a9905 100644
> > --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> > +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> > @@ -896,7 +896,8 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
> >   		dev_err(parent_dev,
> >   			"device_add() failed for device %s: %d\n",
> >   			dev_name(&mc_dev->dev), error);
> > -		goto error_cleanup_dev;
> > +		put_device(&mc_dev->dev)
> 
> This change has obviously not been tested, not even built.
> 

Yeah, it doesn't build.

> And by droping the goto, the kfree() are not done anymore, leaking
> mc_bus/mc_dev p kzalloced areas.
> 

Calling put_device() triggers fsl_mc_device_release() which does the
free.

regards,
dan carpenter

> > +		return error;
> >   	}
> >   	dev_dbg(parent_dev, "added %s\n", dev_name(&mc_dev->dev));

