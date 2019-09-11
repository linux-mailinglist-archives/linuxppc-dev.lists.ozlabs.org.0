Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0FBAFEC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 16:35:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T4FJ3RS4zF116
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 00:35:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux-foundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="kaWGEzpE"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T49C2bTmzF34r
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:31:58 +1000 (AEST)
Received: from X1 (110.8.30.213.rev.vodafone.pt [213.30.8.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A59F620872;
 Wed, 11 Sep 2019 14:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568212316;
 bh=/drgJXkv8kbv289r58cL8NRLzUQK4lt8QF8RDME9a9s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kaWGEzpE5LBOKJv7pUwd1MyCufZPJq4bSKfewzyCdWlfuCFEuNEm75uwI9XxIwn6G
 NFJzpVWcj1LDmSPYrtPNjBokS9N/3Zb2AFu4A1AkJjseXelgVb7W8cw66HgQEnyvA0
 rCV9o6TcefsP32qbMd6OX1k6GXKtFJ7kuFjn/Et0=
Date: Wed, 11 Sep 2019 07:31:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: cam@neo-zeon.de
Subject: Re: [Bug 204789] New: Boot failure with more than 256G of memory
Message-Id: <20190911073153.9df4d4618d7f99752cd18edd@linux-foundation.org>
In-Reply-To: <bug-204789-27@https.bugzilla.kernel.org/>
References: <bug-204789-27@https.bugzilla.kernel.org/>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(switched to email.  Please respond via emailed reply-to-all, not via the
bugzilla web interface).

On Sun, 08 Sep 2019 00:04:26 +0000 bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=204789
> 
>             Bug ID: 204789
>            Summary: Boot failure with more than 256G of memory
>            Product: Memory Management
>            Version: 2.5
>     Kernel Version: 5.2.x
>           Hardware: PPC-64
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: high
>           Priority: P1
>          Component: Other
>           Assignee: akpm@linux-foundation.org
>           Reporter: cam@neo-zeon.de
>         Regression: No

"Yes" :)

> Kernel series 5.2.x will not boot on my Talos II workstation with dual POWER9
> 18 core processors and 512G of physical memory with disable_radix=yes and 4k
> pages.
> 
> 5.3-rc6 did not work either.
> 
> 5.1 and earlier boot fine. 

Thanks.  It's probably best to report this on the powerpc list, cc'ed here.

> I can get the system to boot IF I leave the Radix MMU enabled or if I boot a
> kernel with 64k pages. I haven't yet tested enabling the Radix MMU with 64k
> pages at the same time, but I suspect this would work. This is a system I
> cannot take down TOO frequently.
> 
> The system will also boot with the Radix MMU disabled and 4k pages with 256G or
> less memory. Setting mem on the kernel CLI to 256G or less results in a
> successful boot. Setting mem=257G or higher no Radix MMU and 4k pages and the
> kernel will not boot.
> 
> Petitboot comes up, but the system fails VERY early in boot in the serial
> console with:
> SIGTERM received, booting...
> [   23.838858] kexec_core: Starting new kernel
> 
> Early printk is enabled, and it never progresses any further.
> 
> 5.1 boots just fine with the Radix MMU disabled and 4k pages.
> 
> Unfortunately, I currently need 4k pages for bcache to work, and Radix MMU
> disabled in order for FreeBSD 12.x to work under KVM so I'm sticking with
> 5.1.21 for now.
> 
> I have been unable to reproduce this issue in KVM.
> 
> Here are my PCIe peripherals:
> 1. Microsemi/Adaptec HBA 1100-4i SAS controller
> 2. Megaraid 9316-16i SAS RAID controller.
> 
> I've only tried little endian as this is a little endian install.
> 
> -- 
> You are receiving this mail because:
> You are the assignee for the bug.
