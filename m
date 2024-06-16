Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 760BB90BFD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 01:38:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=VDJWUUvO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W35tF1jWKz3gHF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 09:38:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=VDJWUUvO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yeah.net (client-ip=123.58.177.132; helo=mail-177132.yeah.net; envelope-from=shawnguo2@yeah.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 615 seconds by postgrey-1.37 at boromir; Sun, 16 Jun 2024 22:37:42 AEST
Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2CGG16CGz30T3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2024 22:37:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=JnRMwwFkdoEc5/NCW6kftWAir30cVbQ0j2y/PvQ3WvM=;
	b=VDJWUUvO8q6Wy3ZDQ/po1/sppVWySiCJqpCFFPsrRIuzxaF3gZ5dRKu2wza3qZ
	dd8K93C7eVedoZnKRLihFPPpD0NO0SnINDCpkjngrGQqoP7wiHb0+H2ZUs2vsVyB
	wOkOtINMFYJWN/hvGSVCc90wkuvkf8yHptG5deXyZSWEs=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrADnL2kT2m5mUY7ECA--.11632S3;
	Sun, 16 Jun 2024 20:27:00 +0800 (CST)
Date: Sun, 16 Jun 2024 20:26:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Drop Li Yang as maintainer for all
 bindings
Message-ID: <Zm7aE5+1KONVCi1i@dragon>
References: <20240604142249.1957762-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604142249.1957762-1-mwalle@kernel.org>
X-CM-TRANSID: C1UQrADnL2kT2m5mUY7ECA--.11632S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVwIDUUUUU
X-Originating-IP: [114.216.76.201]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDRQAZVszXmJAYgAAsK
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 04, 2024 at 04:22:48PM +0200, Michael Walle wrote:
> Remove Li Yang from all device tree bindings because mails to this
> address are bouncing.
> 
> Commit fbdd90334a62 ("MAINTAINERS: Drop Li Yang as their email address
> stopped working") already removed the entry from the MAINTAINERS but
> didn't address all the in-file entries of the device tree bindings.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Applied both, thanks!

