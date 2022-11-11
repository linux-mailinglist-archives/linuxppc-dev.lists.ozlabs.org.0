Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B61D9626115
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 19:28:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N86f64jntz2xZp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 05:28:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bn606Xi8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bn606Xi8;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N86d83S2lz2xGD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 05:27:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 09519B826C4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 18:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F8FC433D6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 18:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668191254;
	bh=r2cI09RUXuELqRiuQS5kKQ79PQPgCuGaFw4FvQy4K9w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bn606Xi8F0jx27buuhj9XwSONaHLGZzzcIotUYXv4ZKWBQeeUDyfRoNmj2JFkndd/
	 4GIp4ngPAWf2LF184mjQo29YdjxybzAGlKmAO4UYd8tL6hDLuktD1SfEBXUvoUFaom
	 ltrxbltUqo5iJcClAQG4PnmPmYGhuBiQd3PlxoV8JF6GGnyBonr3LsB8B9jQ+RHbow
	 GorUBHsmsaLEKbMk5A0qMAvES5X7ifMVGSSjygOiqI42xDskcQbZXFBqY1HBZS7/ZZ
	 9j5W4TIP75bvJcf3j37BS1T0Ygffu/VOfPQs006iPYcfjPes/FIHeY1ih8kWlVkmPl
	 K0JJoVRcOFZgA==
Received: by mail-lf1-f51.google.com with SMTP id b3so9506883lfv.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 10:27:34 -0800 (PST)
X-Gm-Message-State: ANoB5pkjaoiH57JCQZKw3SfXL/2jVfWRIsbK/VIkyhLAosG4lAIhIy8J
	dUxBZYJi+VBQkZhvaLGHfaRCRhUqWH081eW7EQ==
X-Google-Smtp-Source: AA0mqf5AsfopZSW40P5z5SuakKi9gWyzraY7YgC+syc1XRIXJFwAM0ajx5uLiWLRMjx1lWptwFOAR2YFY1YIdK1z7HM=
X-Received: by 2002:a05:6512:b1a:b0:4b0:3e46:2b75 with SMTP id
 w26-20020a0565120b1a00b004b03e462b75mr1111916lfu.368.1668191252668; Fri, 11
 Nov 2022 10:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20221031153954.1163623-1-helgaas@kernel.org>
In-Reply-To: <20221031153954.1163623-1-helgaas@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 11 Nov 2022 12:27:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKt81KKopsGML7k3mvBqFCQ5VkKx31eCdjntpsHBkTMkw@mail.gmail.com>
Message-ID: <CAL_JsqKt81KKopsGML7k3mvBqFCQ5VkKx31eCdjntpsHBkTMkw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] PCI: Remove unnecessary <linux/of_irq.h> includes
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Toan Le <toan@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Michal Simek <michal.simek@amd.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, Scott B
 randen <sbranden@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 31, 2022 at 10:40 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Many host controller drivers #include <linux/of_irq.h> even though they
> don't need it.  Remove the unnecessary #includes.

Note that the same is often true of the other of_*.h headers.

of_device.h and of_platform.h are tricky though as one includes the
other (with a decade old comment to fix). I started down that rabbit
hole once...

Rob
