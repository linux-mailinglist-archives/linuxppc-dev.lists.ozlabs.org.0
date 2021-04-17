Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DB362FCE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 14:30:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMsqp4V2dz3brv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 22:30:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aCXQ421y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aCXQ421y; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMsqN5ccgz300S
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 22:30:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FMsqJ1ckGz9vG3;
 Sat, 17 Apr 2021 22:30:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618662620;
 bh=mtQXXNJfragy4YQoBiwVomNkLwmcNxRqSSFA0RO5LCo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aCXQ421yZApjtSXo4wDJS5qyT1JaMFSEi8NEckR1sYexHW87ktiqBKTQh9rp4jq4B
 b3RAJU5OL25nzAG9tJ/ylT8EjLNhIJeahLFUNn5ZaCnS6FES6iHeBq0pk4wPjiYnx6
 iNwXBy/HK60pJlzELKvX1eyq8QWlGZOMjxAB7XSamDg7JqbFawr9Is+d6i4jNvqKiP
 n41xrIzhRWrwW5XFQ6oobgw0u66Qz+LouPxrvvuv//RrfLT4aln0SI206UUVgWkTJs
 /RJ+8l7g6MGSVIxx8L0/odoo8YM041S2FV3bD4zfpnH4Zbl4JaEGK+9LPn0//nSdqH
 bSJUoxa3H5cGg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Add shutdown() to vio_driver and vio_bus
In-Reply-To: <f326def4-0db0-f924-1700-dd7be3154153@linux.ibm.com>
References: <20210402001325.939668-1-tyreld@linux.ibm.com>
 <f326def4-0db0-f924-1700-dd7be3154153@linux.ibm.com>
Date: Sat, 17 Apr 2021 22:30:14 +1000
Message-ID: <87im4ldrft.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 4/1/21 5:13 PM, Tyrel Datwyler wrote:
>> Currently, neither the vio_bus or vio_driver structures provide support
>> for a shutdown() routine.
>> 
>> Add support for shutdown() by allowing drivers to provide a
>> implementation via function pointer in their vio_driver struct and
>> provide a proper implementation in the driver template for the vio_bus
>> that calls a vio drivers shutdown() if defined.
>> 
>> In the case that no shutdown() is defined by a vio driver and a kexec is
>> in progress we implement a big hammer that calls remove() to ensure no
>> further DMA for the devices is possible.
>> 
>> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
>> ---
>
> Ping... any comments, problems with this approach?

The kexec part seems like a bit of a hack.

It also doesn't help for kdump, when none of the shutdown code is run.

How many drivers do we have? Can we just implement a proper shutdown for
them?

cheers
