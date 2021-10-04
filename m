Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35FD42189A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 22:43:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNXk94Kfsz2yp6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 07:43:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FY8tIni/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FY8tIni/; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNXjS5VbNz2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 07:43:06 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id e15so76995617lfr.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 13:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=me0z+ME7EPFb6ZEEoqdQdGy5VTWw4ckYvRJPBouWGig=;
 b=FY8tIni/Znx8Ji/q6Z7oei+cFOnMvUl/8NwIUDj9x6Qnxm3se6ToBRMhAi43rG2HT+
 UlorbUBm1R/P68pVUnnOpcvS6TMthydily2pUvupAQJd4T+zHQOXsVO7y/XV4p935qmN
 vVN7Vlqb0weZ0XqofDIYp4sENj4Hez4EMgeZnrdctdv9YF/SY7NbgQ0b2AtKIuKxhD/R
 R1SOL+qRSZjFHgTRcl6GZTAXTJQ2fsuhBSCZzDFNFq0ZOmZf0oDXjFyLOqVHwSRsRg3m
 7Nu5Y+bVJA/7UZTtWJvBE0Zy/KBQS+7CGHdsaJJgd4SM6gg9141nLa9orSoiw3uD6Fs6
 4liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=me0z+ME7EPFb6ZEEoqdQdGy5VTWw4ckYvRJPBouWGig=;
 b=7ocjvZls7fUZniLxFr0ZCnhpI6PiI0hZXy+SVO4mAsT6k9bFq9AJ++x1PsQQhrYSwL
 7XKmZ1ZV8Ux0iEn5Rd6lXkO2NhhD7scQUtO/fcVIZtTPqi37F3b8+xnSMlLfchh7vNuj
 tvox7Ri5Meu6Qi5pOuxapou8aXN4u7DwEScAZiZe2z4WR0Y8Fn3/EmL3/V/FDO/JFxiz
 pGz1Gh8VU4dp+GTH1uWl3Eo0FDa+151tOCIt3ShRd5tciYtELxMDOLfT+CQbcyS7WkqK
 DnRoJ44YfNk64CS4XwQlewklJr2S9CzkqOjePGsxcWEsrhvlhdDa0D3BanONNq/pOxEL
 2XqA==
X-Gm-Message-State: AOAM530hfMNGUsDH3b0Csm3WwQIT3kSzWgOB2zXViuK5rSFDaj6lHaH6
 A5UoOaDFgFm+1ODgBQgOqC0UHX4uHwx/WepVNsLBeg==
X-Google-Smtp-Source: ABdhPJwoN+NxJ/fGV7inPNKtUbAVhVuzzxdipfKm/E4oc24DxLBb4XL4OQmZ5Rmgzij431nwk23QZOChQjMyVuUGSCM=
X-Received: by 2002:a05:6512:10cc:: with SMTP id
 k12mr17303158lfg.72.1633380176925; 
 Mon, 04 Oct 2021 13:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210929163847.2807812-1-maz@kernel.org>
 <20211004083845.GA22336@lpieralisi>
 <CAL_Jsq+4FF9QYy87aYhJ-AS78qyHp0NkLrL492+WmdyWj-NKaw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+4FF9QYy87aYhJ-AS78qyHp0NkLrL492+WmdyWj-NKaw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Oct 2021 22:42:45 +0200
Message-ID: <CACRpkdaL=YEfqSmAogLcP0Gn2gUqSaEXZQrJD1GR5QU+DyuyDQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] PCI: Add support for Apple M1
To: Rob Herring <robh+dt@kernel.org>, 
 "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>,
 opensuse-ppc@opensuse.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Sven Peter <sven@svenpeter.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Hector Martin <marcan@marcan.st>,
 PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Android Kernel Team <kernel-team@android.com>,
 Robin Murphy <Robin.Murphy@arm.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 4, 2021 at 9:52 PM Rob Herring <robh+dt@kernel.org> wrote:

> FYI, I pushed patches 1-3 to kernelCI and didn't see any regressions.
> I am a bit worried about changes to the DT interrupt parsing and
> ancient platforms (such as PowerMacs). Most likely there wouldn't be
> any report until -rc1 or months later on those old systems.

Lets page the PPC lists to see if someone can test on some powermac.

Linus Walleij
