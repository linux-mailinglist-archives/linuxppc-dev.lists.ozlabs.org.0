Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FBA42E461
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 00:46:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVkz23sSQz3c4x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 09:46:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256 header.s=phobos-20191101 header.b=jScZEwA/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=denx.de
 (client-ip=2a01:238:438b:c500:173d:9f52:ddab:ee01; helo=phobos.denx.de;
 envelope-from=agust@denx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=jScZEwA/; 
 dkim-atps=neutral
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVkyQ1tQ2z2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 09:45:50 +1100 (AEDT)
Received: from crub (pd95f1d7c.dip0.t-ipconnect.de [217.95.29.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1085F8362E;
 Fri, 15 Oct 2021 00:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634251538;
 bh=1ET+geriuu8L+Dmd2g3Rt+4fFHnoen8mF94NyL50W5M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jScZEwA/u78jDWaFuFhdO78tBzD/Tw5jNP4JCaFoWmX/SjkoH6RNfJGTOP+4ppROL
 aq+21kESBzW6zjMFydHhteggEeQwWyotywloQUnrsEKQFmRkZsOqv+IW2tU3f956Lp
 suurMEEZd4ld0jwIdARjOwOKZRGEFqkB5EoXlVE3NqlpwZgjh5q9VrwgUbdUJ+/iaz
 DwLL3z33h/nnOjY+3SSoRZT5suQ1D849oSPQF8E4+yFA3AjFB+HSTPKg4DUFFZZOzB
 6X/RjjBxVnHfDw30aO3JHr6n4XIezZG89VeT/g0QyDHtW+CVn7emgmjdm6SRCrljV/
 1eeUI1SIC+X5w==
Date: Fri, 15 Oct 2021 00:45:37 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] powerpc/mpc512x: dts: fix PSC node warnings
Message-ID: <20211015004537.7afde240@crub>
In-Reply-To: <CAL_JsqJQ8_3+pwT0a-gj5iSUSo3kYZXFraejjBGObNHpB+xcTg@mail.gmail.com>
References: <20211014113123.2358-1-agust@denx.de>
 <CAL_JsqJQ8_3+pwT0a-gj5iSUSo3kYZXFraejjBGObNHpB+xcTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Oct 2021 07:33:26 -0500
Rob Herring robh+dt@kernel.org wrote:
...
>> +++ b/arch/powerpc/boot/dts/ac14xx.dts
>> @@ -301,13 +301,21 @@
>>                         fsl,tx-fifo-size = <512>;
>>                 };
>>
>> +               /delete-node/ psc@11400;
>> +               /delete-node/ psc@11500;  
>
>That's an odd way to fix this, and means every user of the .dtsi file
>with these nodes will have to repeat the same thing.

okay, in v2 patch I've extracted the psc nodes to files which
can be included and extended individually.

Anatolij
