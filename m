Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E575F293C19
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 14:45:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFtdW4RV0zDqNn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 23:45:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFtTg64j3zDqKs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 23:38:47 +1100 (AEDT)
Received: by mail-wm1-f68.google.com with SMTP id k21so1093211wmi.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 05:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VTv2TqWQaefwCIoRzRKnAaaiLi/7OL3sa2J56yTprLs=;
 b=j+L0GCeDZOSUhID6im71Cw6DPMZvnG2kk5r6EoujTR4aYPW2dsRo5QCrZQgl2ugHMs
 pAEJzk999yzA43qLduxUTNU5lXs5ra7X1mHu1zVIe5VlFDhNckcoRrqTqhzXms1tDaVk
 DN8XpoKO1sc2pLcJ2dk3OjSci0gjrVwf7+DHvPpiZEfn4BiSCyLMuLBYhGRanuuN0Qwb
 B0SY9OcruHx+x2s+rCoHOI6DzJK9PGLqoiVp+EXnBFVGA+pcL0Vv/NINN2jMqVAwBxsE
 9uFKSweXXJoySyXrkUX3pMoVnsY4e1+S4qGZphvwL+nswOIqBwtCLmDUPc3gFIIRQ2Vp
 kiGQ==
X-Gm-Message-State: AOAM532MxB1yUd0ON8eZp2OcfWjRxmpqxOVx2bpmFC/6H8wRAmJhIDVA
 mZDg2Hf4rZro1qsIjTvWTrA=
X-Google-Smtp-Source: ABdhPJxYWnby37gGUJzkP8a+m+DcxULHlq2Ju5ioF7EFg4aW+NMlchfDdOXWGCt5a67pdNl3vfjobw==
X-Received: by 2002:a7b:c250:: with SMTP id b16mr2860427wmj.161.1603197523212; 
 Tue, 20 Oct 2020 05:38:43 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
 by smtp.googlemail.com with ESMTPSA id k6sm2575353wmk.16.2020.10.20.05.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 05:38:41 -0700 (PDT)
Date: Tue, 20 Oct 2020 14:38:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 15/29] powerpc: dts: akebono: Harmonize EHCI/OHCI DT
 nodes name
Message-ID: <20201020123833.GL127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-16-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-16-Sergey.Semin@baikalelectronics.ru>
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
Cc: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 20, 2020 at 02:59:45PM +0300, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  arch/powerpc/boot/dts/akebono.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
