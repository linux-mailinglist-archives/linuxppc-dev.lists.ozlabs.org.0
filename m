Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD057E9C15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 13:23:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STT8z3QGNz3bw9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 23:22:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.177; helo=mail-pl1-f177.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STT8L32pHz3clb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 23:22:25 +1100 (AEDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cc0d0a0355so30860005ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 04:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699878144; x=1700482944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0mX4oPtfqlWX2A6en/xocL7l8R1twfrToxxD0o8VRE=;
        b=GIbKXPn45JyiomNKl8eYZLO6lxFkbQ+b8gnRAOZsSqTP+aIJgwe/TK4F0+gDWrhZs2
         C6dMCjFgPIRBc5Mqf8a+MPToAoxaadYoU72RnPWN8T1ZpcTfU7WWcNl4D74dpA1ug6NA
         mwgQHJeBp64hr4Ye4v3OXBL+s82JLHAG+AkZn69RcrVQnDhb0nEjrRLL1WbeECOrKsKL
         u2YsP+jQ17xisC4lUMTSyvuxeLBlo/pa4/atloClvNR7XmWNenqCip1Fbaj0c5wDIXFq
         uensS9H9JXDsDw6wppvpcJFOZaKwtxTyQ0YsNCNgqlazpvRGOZUeeqRcWMUz+HNEHSuY
         Znrg==
X-Gm-Message-State: AOJu0Yw6n7mf9TgM97YD6Q+Po+VdZ3gdSR/GGrnCg0hDAlo7k5rYA0LI
	h/YRBXkMUiYCuaa/ev/I5Zg=
X-Google-Smtp-Source: AGHT+IGWpLrmgKRWjsbPw5HX8Nyq2WCnSKUO5gqjXwdKkNCnzubssqDt1Y3sWVjA5KfEsTOZRSmPHQ==
X-Received: by 2002:a17:902:dac9:b0:1cc:5dd4:7ce5 with SMTP id q9-20020a170902dac900b001cc5dd47ce5mr5939251plx.19.1699878143666;
        Mon, 13 Nov 2023 04:22:23 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id f3-20020a17090274c300b001cbf3824360sm3943376plt.95.2023.11.13.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:22:23 -0800 (PST)
Date: Mon, 13 Nov 2023 21:22:21 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/3] PCI: dwc: Improve code readability
Message-ID: <20231113122221.GA2418639@rocinante>
References: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
 <20231113100914.GB1583963@rocinante>
 <CAMuHMdVLmmf12KPQch7fT2iGjfDV--M2Wd0zsxSw6wfqYxUggQ@mail.gmail.com>
 <TYBPR01MB53411530E01A90CB525DF814D8B3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYBPR01MB53411530E01A90CB525DF814D8B3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
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
Cc: "robh@kernel.org" <robh@kernel.org>, "mani@kernel.org" <mani@kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "roy.zang@nxp.com" <roy.zang@nxp.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "minghuan.Lian@nxp.com" <minghuan.Lian@nxp.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "mingkai.hu@nxp.com" <mingkai.hu@nxp.com>, "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

[...]
> > > Now, while you are looking at things, can you also take care about the following:
> > >
> > >   drivers/pci/controller/dwc/pcie-rcar-gen4.c:439:15: warning: cast to smaller integer type 'enum dw_pcie_device_mode'
> > from 'const void *' [-Wvoid-pointer-to-enum-cast]
> 
> Thank you for the report!
> 
> > > This requires adding structs for each data member of the of_device_id type.
> > 
> > That sounds like overkill to me.
> > An intermediate cast to uintptr_t should fix the issue as well.
> 
> I confirmed that the uintptr_t fixed the issue.

We declined a similar fix in the past[1] ...

> I also think that adding a new struct with the mode is overkill.

... with the hopes that a driver could drop the switch statements in place
of using the other pattern.  Also, to be consistent with other drivers that
do this already.

> So, I would like to fix the issue by using the cast of uintptr_t.

Sure.  I appreciate that this would be more work.  When you send your
patch, can you include an update to the iproc driver (and credit the
original author from [1])?  I would appreciate it.

1. https://lore.kernel.org/linux-pci/20230814230008.GA196797@bhelgaas/

	Krzysztof
