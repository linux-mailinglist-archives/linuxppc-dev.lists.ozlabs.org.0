Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 213B01F346C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:53:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1781GZbzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:53:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzG42HHhzDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFx0nsDz9sVM; Tue,  9 Jun 2020 15:29:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200421081539.7485-1-oohall@gmail.com>
References: <20200421081539.7485-1-oohall@gmail.com>
Subject: Re: [PATCH v2] powerpc/pseries: Make vio and ibmebus initcalls
 pseries specific
Message-Id: <159168035695.1381411.10896696979740885287.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:40 +1000 (AEST)
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Apr 2020 18:15:39 +1000, Oliver O'Halloran wrote:
> The vio and ibmebus buses are used for pseries specific paravirtualised
> devices and currently they're initialised by the generic initcall types.
> This is mostly fine, but it can result in some nuisance errors in dmesg
> when booting on PowerNV on some OSes, e.g.
> 
> [    2.984439] synth uevent: /devices/vio: failed to send uevent
> [    2.984442] vio vio: uevent: failed to send synthetic uevent
> [   17.968551] synth uevent: /devices/vio: failed to send uevent
> [   17.968554] vio vio: uevent: failed to send synthetic uevent
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: Make vio and ibmebus initcalls pseries specific
      https://git.kernel.org/powerpc/c/4336b9337824a60a0b10013c622caeee99460db5

cheers
