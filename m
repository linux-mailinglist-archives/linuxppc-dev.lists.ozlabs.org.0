Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194E07E9CF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 14:19:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STVPw0jXzz3dC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 00:19:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.182; helo=mail-pf1-f182.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STVPR2rkcz2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 00:18:51 +1100 (AEDT)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6b709048d8eso3746771b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 05:18:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699881529; x=1700486329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOlnxYdURNzc3S19TzZzd39YvfCLB1voUOe65YcS7qY=;
        b=srf2SUgREzGn7iuAj2XYi3Lo2NjFH8Ej1OFlC2oV2p7WwuGHlIN9ABVAFz9pnMMHGv
         l0XXanWpa09rS2Q22oljxsVAfGPqSVfyg10IDMSo5JSKptRVjMvCbbDLY/99lQrfomD0
         Qbce6FCBiMmnosIEpe5Vbi9NZytyCjiQA2qilSZP00OAldOlRsA7NeXxmepDDjZa96Ao
         nbq9Y+hwOFfvm47HvsVL4m0hmKR33GYdplMy46iXbjS7FNWDQkCCy9rD20VHaZHiB3pI
         qviJwfGVP2A3xFXLyqcu0zjTvUXXgewHS6fw3oQXBisGr5BkeJIFq/8FC79lmFRqjLlI
         U76Q==
X-Gm-Message-State: AOJu0YyzDixqXT6FoGbWnCTuv0m/h4xO+97a9h3x3akDbRRplMdmVA5W
	781+JWigk9pBdSDD3wtkXVx9GCKgtwPrz2cB
X-Google-Smtp-Source: AGHT+IHMCfixw5bNBz1Dj6MA0FhzNL3vrHsarIlhlyW3PX8qo5TRXyf05wKSf3No7EALGSIr80uDRw==
X-Received: by 2002:a05:6a20:1612:b0:16b:7602:15b1 with SMTP id l18-20020a056a20161200b0016b760215b1mr4472277pzj.12.1699881529157;
        Mon, 13 Nov 2023 05:18:49 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id f8-20020a170902684800b001cc46240491sm4116669pln.136.2023.11.13.05.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 05:18:48 -0800 (PST)
Date: Mon, 13 Nov 2023 22:18:47 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/3] PCI: dwc: Improve code readability
Message-ID: <20231113131847.GA2770646@rocinante>
References: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
 <20231113100914.GB1583963@rocinante>
 <CAMuHMdVLmmf12KPQch7fT2iGjfDV--M2Wd0zsxSw6wfqYxUggQ@mail.gmail.com>
 <TYBPR01MB53411530E01A90CB525DF814D8B3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <20231113122221.GA2418639@rocinante>
 <CAMuHMdX2D-Ui=6Xt_x_yDAYQYoooP51ZwZTmoASwcUeZTcME4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX2D-Ui=6Xt_x_yDAYQYoooP51ZwZTmoASwcUeZTcME4g@mail.gmail.com>
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
Cc: "robh@kernel.org" <robh@kernel.org>, "mani@kernel.org" <mani@kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "roy.zang@nxp.com" <roy.zang@nxp.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "minghuan.Lian@nxp.com" <minghuan.Lian@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "mingkai.hu@nxp.com" <mingkai.hu@nxp.com>, "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

[...]
> > > I confirmed that the uintptr_t fixed the issue.
> >
> > We declined a similar fix in the past[1] ...
> >
> > > I also think that adding a new struct with the mode is overkill.
> >
> > ... with the hopes that a driver could drop the switch statements in place
> > of using the other pattern.  Also, to be consistent with other drivers that
> > do this already.
> 
> Note that the issue of casting is something we cannot fix easily:
> some *_device_id structs use "kernel_ulong_t" for the "data" member,
> others use "void *".
> 
> git grep -W "_device_id" -- include/linux/mod_devicetable.h | grep data
> 
> In addition, several drivers use multiple types of device IDs, so you
> cannot settle on one type to avoid casts.
> 
> Also, putting enum values in instances of that struct, as suggested,
> increases kernel size, for IMHO no additional gain.

All good points!  Thank you for taking the time to get back to me.  Appreciated. :)

> If there is more data to put in the struct, I agree it makes sense to use
> a struct.

Yeah.  Perhaps if there is such a need in the future, indeed.

	Krzysztof
