Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369724BF48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 15:47:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXQtq5wSYzDqml
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 23:47:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXQXr5Nr2zDr1V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 23:31:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BXQXm2B0lz9sV5; Thu, 20 Aug 2020 23:31:36 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
In-Reply-To: <20200820061844.306460-1-hegdevasant@linux.vnet.ibm.com>
References: <20200820061844.306460-1-hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries: Do not initiate shutdown when system
 is running on UPS
Message-Id: <159793027467.2366922.12802265066694495629.b4-ty@ellerman.id.au>
Date: Thu, 20 Aug 2020 23:31:36 +1000 (AEST)
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 Aug 2020 11:48:44 +0530, Vasant Hegde wrote:
> As per PAPR we have to look for both EPOW sensor value and event modifier to
> identify type of event and take appropriate action.
> 
> Sensor value = 3 (EPOW_SYSTEM_SHUTDOWN) schedule system to be shutdown after
>                   OS defined delay (default 10 mins).
> 
> EPOW Event Modifier for sensor value = 3:
>    We have to initiate immediate shutdown for most of the event modifier except
>    value = 2 (system running on UPS).
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries: Do not initiate shutdown when system is running on UPS
      https://git.kernel.org/powerpc/c/90a9b102eddf6a3f987d15f4454e26a2532c1c98

cheers
