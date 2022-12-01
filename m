Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6B363FC33
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 00:44:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNXjf3xZpz3c9x
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 10:44:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.49; helo=mail-oa1-f49.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNXj154wWz30RN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 10:44:04 +1100 (AEDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1433ef3b61fso3942145fac.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Dec 2022 15:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBjMeuRLVfB0Q1K91g+RhzJYDgpvITGQ3Wa0hVWnVFA=;
        b=w4SIvEx5fCnAEdiwm5vGbnUgQda2JG6zAdvvYBPE+hHXIwjCELX9FEPbYgxwRiNnTf
         85w+3ADZPbSUPPNW0VtDFy/A39aMOgKw3o3MPkqN16eUP9hcE6AXa1W7c68+2y2M8xK2
         WSxJ62jp/tR7iGGwH1wAHSC5B0VYL/v5CA2GcPdCY/Ynq5yhlDhDzb3YvvaupM8P4nEZ
         ddf2rFku20ngEXhOvGzgnabA4aeo0jPsVZTautP/7gBF0PNR9ZYGqkFMmjceHMKSgs+h
         E7HS/RFqwBrktQjwEKkUFE+xr6/xYthFin7EZiAHNv+Velxd6dUL/fjCemdQyBJgYxPX
         pQOA==
X-Gm-Message-State: ANoB5plXk2JDTuALWEyjdsYRb9a0HkhGr/Y5OxIJIv46Dw+spl5A9Tnb
	is0/P9o7bWgW9smzKsK/9A==
X-Google-Smtp-Source: AA0mqf4pknopJGrWOequ2EqipgdRgXWSNsM2LgM3UzqF3aEUNXODvGWLmMXX/V+42xajku68ybLwaA==
X-Received: by 2002:a05:6870:3c0f:b0:143:53aa:5813 with SMTP id gk15-20020a0568703c0f00b0014353aa5813mr21218698oab.161.1669938241401;
        Thu, 01 Dec 2022 15:44:01 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r81-20020aca5d54000000b0035b99bbe30bsm2344462oib.54.2022.12.01.15.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:44:00 -0800 (PST)
Received: (nullmailer pid 1700884 invoked by uid 1000);
	Thu, 01 Dec 2022 23:44:00 -0000
Date: Thu, 1 Dec 2022 17:44:00 -0600
From: Rob Herring <robh@kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH 5/5] powerpc: dts: remove label = "cpu" from DSA
 dt-binding
Message-ID: <20221201234400.GA1692656-robh@kernel.org>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <20221130141040.32447-6-arinc.unal@arinc9.com>
 <87a647s8zg.fsf@mpe.ellerman.id.au>
 <20221201173902.zrtpeq4mkk3i3vpk@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221201173902.zrtpeq4mkk3i3vpk@pali>
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
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>, devicetree@vger.kernel.org, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 01, 2022 at 06:39:02PM +0100, Pali Rohár wrote:
> On Thursday 01 December 2022 21:40:03 Michael Ellerman wrote:
> > Arınç ÜNAL <arinc.unal@arinc9.com> writes:
> > > This is not used by the DSA dt-binding, so remove it from all devicetrees.
> > >
> > > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > ---
> > >  arch/powerpc/boot/dts/turris1x.dts | 2 --
> > >  1 file changed, 2 deletions(-)
> > 
> > Adding Pali to Cc.
> > 
> > These were only recently updated in commit:
> > 
> >   8bf056f57f1d ("powerpc: dts: turris1x.dts: Fix labels in DSA cpu port nodes")
> > 
> > Which said:
> > 
> >   DSA cpu port node has to be marked with "cpu" label.
> > 
> > But if the binding doesn't use them then I'm confused why they needed to
> > be updated.
> > 
> > cheers
> 
> I was told by Marek (CCed) that DSA port connected to CPU should have
> label "cpu" and not "cpu<number>". Modern way for specifying CPU port is
> by defining reference to network device, which there is already (&enet1
> and &enet0). So that change just "fixed" incorrect naming cpu0 and cpu1.
> 
> So probably linux kernel does not need label = "cpu" in DTS anymore. But
> this is not the reason to remove this property. Linux kernel does not
> use lot of other nodes and properties too... Device tree should describe
> hardware and not its usage in Linux. "label" property is valid in device
> tree and it exactly describes what or where is this node connected. And
> it may be used for other systems.
> 
> So I do not see a point in removing "label" properties from turris1x.dts
> file, nor from any other dts file.

Well, it seems like a bit of an abuse of 'label' to me. 'label' should 
be aligned with a sticker or other identifier identifying something to a 
human. Software should never care what the value of 'label' is.

Rob
