Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F18F294875
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 08:47:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGLdM1lw5zDqkT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 17:47:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab+huawei@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=yIfZmq8t; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGLbb0BmWzDqfr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 17:45:30 +1100 (AEDT)
Received: from coco.lan (ip5f5ad5a8.dynamic.kabel-deutschland.de
 [95.90.213.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B8222075B;
 Wed, 21 Oct 2020 06:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603262726;
 bh=Wyw5We1ji398r6jEKsyOv1d233CBQmez+NyANTjly/w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=yIfZmq8tDOVAVBY0McNrJzGl5Swv/H/EpWWIBkmQCxhCiH+eVKyXKJITzMWcvTRlt
 SmbXzzl3/YB4iZjdBJJj4+VO6ZOmzpbh1EfiQSS6N4VjPgEog4Pf0qQpWpKGc0NLA4
 OJsKcl8Z86Ihu0x+0Kjf/jw7WNL/2KnPTV0d5f9Y=
Date: Wed, 21 Oct 2020 08:45:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt: Remove booting-without-of.rst
Message-ID: <20201021084518.1eab6481@coco.lan>
In-Reply-To: <20201008142420.2083861-2-robh@kernel.org>
References: <20201008142420.2083861-1-robh@kernel.org>
 <20201008142420.2083861-2-robh@kernel.org>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Rich Felker <dalias@libc.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Frank Rowand <frowand.list@gmail.com>, Ingo Molnar <mingo@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,

Em Thu,  8 Oct 2020 09:24:20 -0500
Rob Herring <robh@kernel.org> escreveu:

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

Removing this document caused a warning at Documentation/arm/booting.rst:

	$ ./scripts/documentation-file-ref-check 
	Documentation/arm/booting.rst: Documentation/devicetree/booting-without-of.rst

as it mentions that the DTB format is described on booting-without-of.rst:

	4b. Setup the device tree
	-------------------------

	The boot loader must load a device tree image (dtb) into system ram
	at a 64bit aligned address and initialize it with the boot data.  The
	dtb format is documented in Documentation/devicetree/booting-without-of.rst.
	The kernel will look for the dtb magic value of 0xd00dfeed at the dtb
	physical address to determine if a dtb has been passed instead of a
	tagged list.

So, I guess that such part of the document needs to be moved to booting.rst.

Thanks,
Mauro
