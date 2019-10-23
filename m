Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5709AE1901
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 13:27:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yp5B1BWRzDqRy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 22:27:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ynxh31PVzDqGW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 22:21:10 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x9NBL4kp032285;
 Wed, 23 Oct 2019 06:21:04 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x9NBL27C032274;
 Wed, 23 Oct 2019 06:21:02 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 23 Oct 2019 06:21:02 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/boot: Fix the initrd being overwritten under qemu
Message-ID: <20191023112102.GN28442@gate.crashing.org>
References: <20191023013635.2512-1-oohall@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023013635.2512-1-oohall@gmail.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 12:36:35PM +1100, Oliver O'Halloran wrote:
> When booting under OF the zImage expects the initrd address and size to be
> passed to it using registers r3 and r4. SLOF (guest firmware used by QEMU)
> currently doesn't do this so the zImage is not aware of the initrd
> location.  This can result in initrd corruption either though the zImage
> extracting the vmlinux over the initrd, or by the vmlinux overwriting the
> initrd when relocating itself.
> 
> QEMU does put the linux,initrd-start and linux,initrd-end properties into
> the devicetree to vmlinux to find the initrd. We can work around the SLOF
> bug by also looking those properties in the zImage.

This is not a bug.  What boot protocol requires passing the initrd start
and size in GPR3, GPR4?

The CHRP binding (what SLOF implements) requires passing two zeroes here.
And ePAPR requires passing the address of a device tree and a zero, plus
something in GPR6 to allow distinguishing what it does.

As Alexey says, initramfs works just fine, so please use that?  initrd was
deprecated when this code was written already.


Segher
