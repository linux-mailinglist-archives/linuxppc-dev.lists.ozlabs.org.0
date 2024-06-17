Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D85B90BFD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 01:40:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=UeXh3GzG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W35vx2PLrz3c5Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 09:39:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=UeXh3GzG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yeah.net (client-ip=123.58.177.132; helo=mail-177132.yeah.net; envelope-from=shawnguo2@yeah.net; receiver=lists.ozlabs.org)
Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2ZxN485gz3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 13:24:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=dWGjkuPaopuifvZBoMGZ2u+MVNe8w42W4DHJBlXPkNk=;
	b=UeXh3GzGAqMSmuA1TsOlFOh2AOb01dcMblHx7+df+KKCwK89GzjIbKil1BJT7k
	Qyp2eDUxT9gw88gA8kHUSXjnjTL9vIeG984PDQlN58JyPcQqu/xIgU8KhpgGyPDW
	OWRRXebJsG9t3PMW19ftWsML9Jxn9ZN1ZFwzJxWWsCuck=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrADn7xBXrG9msOjOCA--.52564S3;
	Mon, 17 Jun 2024 11:24:08 +0800 (CST)
Date: Mon, 17 Jun 2024 11:24:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC PATCH 2/2] dt-bindings: memory: fsl: replace maintainer
Message-ID: <Zm+sV8dJ+oCOwatg@dragon>
References: <20240604142249.1957762-1-mwalle@kernel.org>
 <20240604142249.1957762-2-mwalle@kernel.org>
 <364dc212-71dc-4bc9-b4fa-97ba2f92d679@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <364dc212-71dc-4bc9-b4fa-97ba2f92d679@kernel.org>
X-CM-TRANSID: C1UQrADn7xBXrG9msOjOCA--.52564S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWxWF1UCrW5Jw17Wr1Utrb_yoWxZrc_G3
	W0v3Z3uwnxXFZ7GF4kKF15XrW3Kw1v9ry5X34Fq34fXr90yr9xAwn5tr1fXan5ZFWjgFsr
	Cay3A34vk347WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8dcTJUUUUU==
X-Originating-IP: [114.216.76.201]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGBgBZV6Nn47Q6AAAse
X-Mailman-Approved-At: Tue, 18 Jun 2024 09:37:51 +1000
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 10:49:36AM +0200, Krzysztof Kozlowski wrote:
> On 04/06/2024 16:22, Michael Walle wrote:
> > Li Yang's mail address is bouncing, replace it with Shawn Guo's one.
> > 
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> > This is marked as an RFC because it is more of a question for Shawn if
> > he is willing to take over the maintainership.
> > ---
> 
> I suppose this could go via IMX SoC tree, so:
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

A second thought on this one.

Hi Krzysztof,

Since you are the maintainer for drivers/memory, would it be more
reasonable to put you instead of me in there?

Patch dropped for now.

Shawn

