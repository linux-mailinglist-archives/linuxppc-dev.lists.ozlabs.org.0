Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 441D5679FF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 18:18:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1Yb75rylz3c9m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 04:18:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qkQVmWi7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qkQVmWi7;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1YZD2csgz3bZ4;
	Wed, 25 Jan 2023 04:17:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1E15EB815FC;
	Tue, 24 Jan 2023 17:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CF2C433EF;
	Tue, 24 Jan 2023 17:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674580653;
	bh=LCa2E8/jVUPBhEQJOos1nf13087EgA3kWouqC8M1bd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkQVmWi77Ps21jD4g32ZeUQVGNomNJ/Xoe7rqHKhJrccQ7NaBHHpf5MRwjcl9V+Ih
	 8kH3lnhrc8TzmXLDIzeTVAlSaNNBraJI2XdnwXUrk3WAyvLlLszqPZM8FZyt9AtgF0
	 RZZnQUzPrbpGtO5ZcqQrbLMFe1rMpWjAyQC0ndTA=
Date: Tue, 24 Jan 2023 18:17:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 0/5] dt-bindings: usb: Convert some more simple
 OHCI/EHCI bindings
Message-ID: <Y9ASq0VZ6G7Efe7s@kroah.com>
References: <20230110-dt-usb-v3-0-5af0541fcf8c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110-dt-usb-v3-0-5af0541fcf8c@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, openbmc@lists.ozlabs.org, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Nancy Yuen <yuenn@google.com>, Nicholas Piggin <npiggin@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Patrick Venture <venture@google.com>, linuxppc-dev@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 23, 2023 at 09:05:15PM -0600, Rob Herring wrote:
> The 'ohci-usb' compatible is another 'generic' compatible for OHCI, but 
> isn't documented with a schema. Let's add it to generic-ohci.yaml 
> schema. While looking at this, I found a few other USB host bindings 
> which are simple enough to use the 'generic' schemas.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Am I supposed to take these in my USB tree?

I'm still confused if you all want me to take these types of things or
not...

thanks,

greg k-h
