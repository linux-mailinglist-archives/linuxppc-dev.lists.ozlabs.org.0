Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 173A82FDB3D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 21:57:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLdC72xbpzDqnv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 07:57:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=miTTwPJ3; 
 dkim-atps=neutral
X-Greylist: delayed 30747 seconds by postgrey-1.36 at bilbo;
 Thu, 21 Jan 2021 06:25:58 AEDT
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLb924kqNzDqCY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 06:25:53 +1100 (AEDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 27EE622727;
 Wed, 20 Jan 2021 20:25:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611170746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Ob7KUwKuR0nwFPm6ISDKf74WkwKvOKiqWXqn3cjXq4=;
 b=miTTwPJ3DtMSDIJ557R+SQ07RWGLYMYbiHcOHy/FBwqEOPhREbpehfwHDCrQ1LUSLmRfIQ
 Gv/SFl3qrWmnvAEQl1eh+Mtx3U9pOR+3PjPlrugHpuLdvZxxeAhu0ZZNdKS317cRghifnO
 rcfP8XLVRxq17yPcSoiTiTE4L/tdBpY=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 20 Jan 2021 20:25:45 +0100
From: Michael Walle <michael@walle.cc>
To: undisclosed-recipients:;
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
In-Reply-To: <CAGETcx86HMo=gaDdXFyJ4QQ-pGXWzw2G0J=SjC-eq4K7B1zQHg@mail.gmail.com>
References: <20210120105246.23218-1-michael@walle.cc>
 <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
 <CAGETcx86HMo=gaDdXFyJ4QQ-pGXWzw2G0J=SjC-eq4K7B1zQHg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <66e4bf55b2809893ad9c87458c170f99@walle.cc>
X-Sender: michael@walle.cc
X-Mailman-Approved-At: Thu, 21 Jan 2021 07:49:58 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 2021-01-20 20:02, schrieb Saravana Kannan:
> On Wed, Jan 20, 2021 at 6:24 AM Rob Herring <robh@kernel.org> wrote:
>> 
>> On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc> 
>> wrote:
>> >
>> > fw_devlink will defer the probe until all suppliers are ready. We can't
>> > use builtin_platform_driver_probe() because it doesn't retry after probe
>> > deferral. Convert it to builtin_platform_driver().
>> 
>> If builtin_platform_driver_probe() doesn't work with fw_devlink, then
>> shouldn't it be fixed or removed?
> 
> I was actually thinking about this too. The problem with fixing
> builtin_platform_driver_probe() to behave like
> builtin_platform_driver() is that these probe functions could be
> marked with __init. But there are also only 20 instances of
> builtin_platform_driver_probe() in the kernel:
> $ git grep ^builtin_platform_driver_probe | wc -l
> 20
> 
> So it might be easier to just fix them to not use
> builtin_platform_driver_probe().
> 
> Michael,
> 
> Any chance you'd be willing to help me by converting all these to
> builtin_platform_driver() and delete builtin_platform_driver_probe()?

If it just moving the probe function to the _driver struct and
remove the __init annotations. I could look into that.

-michael
