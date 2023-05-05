Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CD06F7ADA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 04:22:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCDwV4b0zz3cdr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 12:22:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QIzyRWHm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCDvc5R11z3c71
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 12:21:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QIzyRWHm;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QCDvV5LG0z4x1f;
	Fri,  5 May 2023 12:21:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683253287;
	bh=PRWr2jzBAOM4SmLwA45dcCKLL0ud4e3OTXsAGiSVblU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QIzyRWHmtC2i7j0FDhvXUnSoXyuBOPwMQw1bhm1y3NPOn3buKdPtkHSh1HFiISIbb
	 ap8ZawhuT5+acwI8vRmsMpJqVEZB/vm4jzTmeEnTMddaj6ZsOWfGABOTC9a5V0AbPK
	 OZN2FzeQ/hkYdSZOsCy1YQEAaclkbsFPeMaE4e2xnsEmwIRcICtWLoxt00iWg3vFZ5
	 orQUfmHcz7sR1+ZdUo0whn0rq3fL2egccYlyivKdm7lpdKteLmuTenwUb1BSkXIKBX
	 JsCa2kUEIbz0MwUHhx58V/AH0+x/8dsR5QUIjQkM2IGeSk0KwLAMr5r1jYd5uyvgGW
	 dvl5L9askEAuQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/iommu: DMA address offset is incorrectly
 calculated with 2MB TCEs
In-Reply-To: <307aae51-1619-79d6-5743-be828e62ccba@linux.vnet.ibm.com>
References: <20230419152623.26439-1-gbatra@linux.vnet.ibm.com>
 <87leimfuk0.fsf@mail.concordia>
 <1ce16c05-b492-fed8-06af-0bbba9de9053@linux.vnet.ibm.com>
 <87354c8yx5.fsf@mail.lhotse>
 <307aae51-1619-79d6-5743-be828e62ccba@linux.vnet.ibm.com>
Date: Fri, 05 May 2023 12:21:24 +1000
Message-ID: <87y1m3bjrv.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Greg Joyce <gjoyce@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
> Hello Michael,
>
> I agree with your concerns regarding a device been able to access memory 
> that doesn't belong to it. That exposure we have today with 2MB TCEs. 
> With 2MB TCEs, DMA window size will be big enough, for dedicated 
> adapters, that whole memory is going to be mapped "direct". Which 
> essentially means, that a "rogue" device/driver has the potential to 
> corrupt LPAR wide memory.

Yes that's always been a trade-off between performance and robustness,
and performance is generally the winner.

There have been various command line flags in the past to configure
stricter behaviour, disable bypass etc. Some of those are now generic,
iommu.strict/passthrough, it would be good to get them wired up to work
on powerpc at some point.

> I have sent you v3.

Thanks.

cheers
