Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1063A1D78F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 14:49:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qf395VKXzDqKK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 22:49:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qf0z0W6bzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 22:47:14 +1000 (AEST)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 04ICktr9019310
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 18 May 2020 07:46:58 -0500
Message-ID: <9ea9bd468fbce85b666991cde4196b88c7929e1d.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Emil Velikov <emil.l.velikov@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Date: Mon, 18 May 2020 22:46:54 +1000
In-Reply-To: <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com>
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <87d071aedu.fsf@mpe.ellerman.id.au>
 <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Antonino Daplas <adaplas@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-05-18 at 12:19 +0100, Emil Velikov wrote:
> 
>  - attempted out-of-bound attempts to read the vbios

So on these things, the actual ROM doesn't contain what you want, but
the device-tree has a property "NVDA,BMP" that contains some kind of
mini-BIOS (around 2.4KB) which should contain the necessary tables the
driver is looking for.

I think nouveau has code to find these in nvkm/subdev/bios/shadowof.c,
so at least that should have been working, but maybe some
debugging/instrumentation would be useful there.

> Genuine concern or noise? Likely using the bios from open firmware,
> check any of the other options - see NvBios in [1]
>  - cannot figure out the timer input frequency
> No idea
>  - the TV1 EDID is empty
> Is there an actual TV connected to the device, check with another cable

Probaby not.

> Regardless of the patches, reporting [2] the above would be a nice move.
> 
> Thanks
> Emil
> [1] https://nouveau.freedesktop.org/wiki/KernelModuleParameters/
> [2] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues

