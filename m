Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08F9928E5A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 22:49:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WG5HN2c6Hz3fTv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 06:49:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WG5H01NWSz3cWc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2024 06:49:30 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 465KjtGq002299;
	Fri, 5 Jul 2024 15:45:56 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 465KjrP6002290;
	Fri, 5 Jul 2024 15:45:53 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 5 Jul 2024 15:45:52 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives after the of/irq updates 2024-05-29
Message-ID: <20240705204552.GD19790@gate.crashing.org>
References: <3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de> <86zfqzhgys.wl-maz@kernel.org> <ccf14173-9818-44ef-8610-db2900c67ae8@xenosoft.de> <874j95jrur.fsf@mail.lhotse> <3baff554-e8f6-42b0-b931-207175a4d8fd@xenosoft.de> <dfc7ec00-5216-4590-9347-ee10cd1e8380@xenosoft.de> <87o77ciqj8.fsf@mail.lhotse>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o77ciqj8.fsf@mail.lhotse>
User-Agent: Mutt/1.4.2.3i
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <chzigotzky@xenosoft.de>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 05, 2024 at 11:19:39AM +1000, Michael Ellerman wrote:
> +	prom_printf("nemo: deleting interrupt-map properties\n");
> +	rc = call_prom("interpret", 1, 1,
> +		      " s\" /pxp@0,e0000000\" find-device"
> +		      " s\" interrupt-map\" delete-property"
> +		      " s\" interrupt-map-mask\" delete-property"
> +		      " device-end");
> +	prom_printf("nemo: interpret returned %d\n", rc);

It's very fragile no matter what.

If some scriupt does something bad, just add something better for it?
You can replace anything by just adding something with the same name!


Segher
