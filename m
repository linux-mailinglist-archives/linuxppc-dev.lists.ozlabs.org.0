Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 697652FD2C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 15:37:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLSlY6xlRzDr5Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 01:36:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=WZaDu7hc; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLSjS6PJHzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 01:35:02 +1100 (AEDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B4D2322727;
 Wed, 20 Jan 2021 15:34:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611153295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ErNlhMUQaNtjrr+RiOGSDOM6D+LTE0johCMOlQNCxY=;
 b=WZaDu7hc4Vc3km9qkbg5toDFDmKXGV2ULtxLkNgUTqUeQksL5QLILdCzjwaKqPU37mjFts
 8nkwzttm2IkgaoRrEts68UksVlkzgav3IlfVzn3JjHLGZ+MLCABqDLAdW9+aRhIVqHyAre
 OU6INGrNNP7V5NiFIjrW0ZcLuJwERv8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 20 Jan 2021 15:34:54 +0100
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
In-Reply-To: <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
References: <20210120105246.23218-1-michael@walle.cc>
 <CAL_JsqLSJCLtgPyAdKSqsy=JoHSLYef_0s-stTbiJ+VCq2qaSA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <2495e985839f3b05ef5e00b58a05ecb7@walle.cc>
X-Sender: michael@walle.cc
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
Cc: Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Saravana Kannan <saravanak@google.com>, PCI <linux-pci@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 2021-01-20 15:23, schrieb Rob Herring:
> On Wed, Jan 20, 2021 at 4:53 AM Michael Walle <michael@walle.cc> wrote:
>> 
>> fw_devlink will defer the probe until all suppliers are ready. We 
>> can't
>> use builtin_platform_driver_probe() because it doesn't retry after 
>> probe
>> deferral. Convert it to builtin_platform_driver().
> 
> If builtin_platform_driver_probe() doesn't work with fw_devlink, then
> shouldn't it be fixed or removed? Then we're not fixing drivers later
> when folks start caring about deferred probe and devlink.
> 
> I'd really prefer if we convert this to a module instead. (And all the
> other PCI host drivers.)

I briefly looked into adding a remove() op. But I don't know what will
have to be undo of the ls_pcie_host_init(). That would be up to the
maintainers of this driver.

_But_ I'd really like to see PCI working on my board again ;) At
least until the end of this development cycle.

-michael

>> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> 
> This happened!?
> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  drivers/pci/controller/dwc/pci-layerscape.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c 
>> b/drivers/pci/controller/dwc/pci-layerscape.c
>> index 44ad34cdc3bc..5b9c625df7b8 100644
>> --- a/drivers/pci/controller/dwc/pci-layerscape.c
>> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
>> @@ -232,7 +232,7 @@ static const struct of_device_id 
>> ls_pcie_of_match[] = {
>>         { },
>>  };
>> 
>> -static int __init ls_pcie_probe(struct platform_device *pdev)
>> +static int ls_pcie_probe(struct platform_device *pdev)
>>  {
>>         struct device *dev = &pdev->dev;
>>         struct dw_pcie *pci;
>> @@ -271,10 +271,11 @@ static int __init ls_pcie_probe(struct 
>> platform_device *pdev)
>>  }
>> 
>>  static struct platform_driver ls_pcie_driver = {
>> +       .probe = ls_pcie_probe,
>>         .driver = {
>>                 .name = "layerscape-pcie",
>>                 .of_match_table = ls_pcie_of_match,
>>                 .suppress_bind_attrs = true,
>>         },
>>  };
>> -builtin_platform_driver_probe(ls_pcie_driver, ls_pcie_probe);
>> +builtin_platform_driver(ls_pcie_driver);
>> --
>> 2.20.1
>> 
