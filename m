Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 131F62876AB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 17:05:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6ZJ05Vf6zDqWj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 02:05:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=r22/Sm/g; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6ZG75xm2zDqGn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 02:03:27 +1100 (AEDT)
Received: from zn.tnic (p200300ec2f0a9000bfab7746bad7d6a7.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:9000:bfab:7746:bad7:d6a7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D4FE71EC047E;
 Thu,  8 Oct 2020 17:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1602169398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=H7LtysFbQs7PFQq4RWrYSce3ni7L2rAYoFE4zYkyzvU=;
 b=r22/Sm/gD7Lz5A+6cEIj8Ie9aJaqNuQDC08G/jWg3szjtFh7iwQM2+BVesit/IXWwFdSYi
 8T+tIhUQtvDrANDK2N0cmi5Vuoae28DQRzdhPvgrNM7mK+2GwX49d3Y6hiavaVcw7CjhBK
 tgdC4EioZOTpVZnT0sNu5spyAIJ27Iw=
Date: Thu, 8 Oct 2020 17:03:09 +0200
From: Borislav Petkov <bp@alien8.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt: Remove booting-without-of.rst
Message-ID: <20201008150309.GA5505@zn.tnic>
References: <20201008142420.2083861-1-robh@kernel.org>
 <20201008142420.2083861-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201008142420.2083861-2-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Rich Felker <dalias@libc.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Ingo Molnar <mingo@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 08, 2020 at 09:24:20AM -0500, Rob Herring wrote:
> booting-without-of.rstt is an ancient document that first outlined
> Flattened DeviceTree on PowerPC initially. The DT world has evolved a
> lot in the 15 years since and booting-without-of.rst is pretty stale.
> The name of the document itself is confusing if you don't understand the
> evolution from real 'OpenFirmware'. Most of what booting-without-of.rst
> contains is now in the DT specification (which evolved out of the
> ePAPR). The few things that weren't documented in the DT specification
> are now.
> 
> All that remains is the boot entry details, so let's move these to arch
> specific documents. The exception is arm which already has the same
> details documented.
> 
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: x86@kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/booting-without-of.rst         | 1585 -----------------
>  Documentation/devicetree/index.rst            |    1 -
>  Documentation/mips/booting.rst                |   28 +
>  Documentation/mips/index.rst                  |    1 +
>  Documentation/powerpc/booting.rst             |  110 ++
>  Documentation/powerpc/index.rst               |    1 +
>  Documentation/sh/booting.rst                  |   12 +
>  Documentation/sh/index.rst                    |    1 +
>  Documentation/x86/booting-dt.rst              |   21 +
>  Documentation/x86/index.rst                   |    1 +

For x86:

Acked-by: Borislav Petkov <bp@suse.de>

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
