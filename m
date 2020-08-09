Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA0524005A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 01:00:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BPvhY1xyFzDqT6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 09:00:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BPvfR0shszDqL0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 08:58:54 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 07F1129B87;
 Sun,  9 Aug 2020 18:58:44 -0400 (EDT)
Date: Mon, 10 Aug 2020 08:58:43 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/9] macintosh/via-macii: Poll the device most likely to
 respond
In-Reply-To: <20200809185541.GA133779@roeck-us.net>
Message-ID: <alpine.LNX.2.23.453.2008100844450.8@nippy.intranet>
References: <cover.1593318192.git.fthain@telegraphics.com.au>
 <5836f80886ebcfbe5be5fb7e0dc49feed6469712.1593318192.git.fthain@telegraphics.com.au>
 <20200809185541.GA133779@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 9 Aug 2020, Guenter Roeck wrote:

> Hi,
> 
> On Sun, Jun 28, 2020 at 02:23:12PM +1000, Finn Thain wrote:
> > Poll the most recently polled device by default, rather than the lowest
> > device address that happens to be enabled in autopoll_devs. This improves
> > input latency. Re-use macii_queue_poll() rather than duplicate that logic.
> > This eliminates a static struct and function.
> > 
> > Fixes: d95fd5fce88f0 ("m68k: Mac II ADB fixes") # v5.0+
> > Tested-by: Stan Johnson <userm57@yahoo.com>
> > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> 
> With this patch applied, the qemu "q800" emulation no longer works and 
> is stuck in early boot. Any idea why that might be the case, and/or how 
> to debug it ?
> 

The problem you're seeing was mentioned in the cover letter,
https://lore.kernel.org/linux-m68k/cover.1593318192.git.fthain@telegraphics.com.au/

Since this series was merged, Linus' tree is no longer compatible with 
long-standing QEMU bugs.

The best way to fix this is to upgrade QEMU (latest is 5.1.0-rc3). Or use 
the serial console instead of the framebuffer console.

I regret the inconvenience but the alternative was worse: adding code to 
Linux to get compatibility with QEMU bugs (which were added to QEMU due to 
Linux bugs).

My main concern is correct operation on actual hardware, as always. But 
some QEMU developers are working on support for operating systems besides 
Linux.

Therefore, I believe that both QEMU and Linux should aim for compatibility 
with actual hardware and not bug compatibility with each other.
