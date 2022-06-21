Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD665538A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 19:16:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSCpQ1rGlz3c8X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 03:15:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lxmPLgun;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lxmPLgun;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSCnn4gYrz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 03:15:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C93C615AD;
	Tue, 21 Jun 2022 17:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E560EC3411C;
	Tue, 21 Jun 2022 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655831721;
	bh=Cv2jhgl2RqU9z4AA4Ivxf+DUW488m0ULCBWrVcbwDiM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lxmPLgunPScWcwtiTFiaI3zOIlYOWfRJNyNTRdfPyLFg7/qqH9kEva0rDNddbq4Pj
	 KlQ5+vJy4cTXaytSWr/DYHyL7OV7e7QeyuCrzHgpGxhqSIi4eyyN+Hy6hJmpEVN5XJ
	 EO36wT4AR1V4QMUuu5IgIuETQ0/+kkCLnTy2uAhcRkIyAEtH+1HKNUhoTrK7V5vbD5
	 nz/DBnrwdJiTlwluscrrp82feWIRMAVVyEBjRT72yOsoWgOM0rSK7p2Z6HCiieSZBW
	 XYVRYcQ/j5MdrJ5MXc6S1xc6ehy0ME1dAhXGEArsQ417gH4aeroD6tuRCC5UsDGLyT
	 ydcU7/H36xtqA==
Date: Tue, 21 Jun 2022 12:15:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Subject: Re: [PATCH v3 2/5] of: remove __of_node_dup() allocflags parameter
Message-ID: <20220621171517.GA1315139@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220620104123.341054-3-clement.leger@bootlin.com>
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
Cc: David Hildenbrand <david@redhat.com>, Paul Mackerras <paulus@samba.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ohhoon Kwon <ohoono.kwon@samsung.com>, Frank Rowand <frowand.list@gmail.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, YueHaibing <yuehaibing@huawei.com>, Nathan Lynch <nathanl@linux.ibm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Allan Nielsen <allan.nielsen@microchip.com>, Laurent Dufour <ldufour@linux.ibm.com>, David Gibson <david@gibson.dropbear.id.au>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Lizhi Hou <lizhi.hou@xilinx.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 20, 2022 at 12:41:20PM +0200, Clément Léger wrote:
> The alloclags are always set to GFP_KERNEL so remove this specific flag.
> Moreover, this function is going to be based on one that does not
> provides passing gfp flags, so be prepared for this.

s/alloclags/allocflags/

s/provides passing/supports passing/
