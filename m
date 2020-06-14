Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1561F85FE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 02:05:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kvqH4wXczDqlL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 10:05:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49kvnh0XGgzDqLV
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 10:03:51 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 4C7A927E75;
 Sat, 13 Jun 2020 20:03:43 -0400 (EDT)
Date: Sun, 14 Jun 2020 10:03:31 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Chris Boot <bootc@bootc.net>
Subject: Re: [PATCH] scsi: target/sbp: remove firewire SBP target driver
In-Reply-To: <01020172acd3d10f-3964f076-a820-43fc-9494-3f3946e9b7b5-000000@eu-west-1.amazonses.com>
Message-ID: <alpine.LNX.2.22.394.2006140934520.15@nippy.intranet>
References: <01020172acd3d10f-3964f076-a820-43fc-9494-3f3946e9b7b5-000000@eu-west-1.amazonses.com>
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
Cc: Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Bellinger <nab@linux-iscsi.org>, target-devel@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux1394-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 13 Jun 2020, Chris Boot wrote:

> I no longer have the time to maintain this subsystem nor the hardware to
> test patches with. 

Then why not patch MAINTAINERS, and orphan it, as per usual practice?

$ git log --oneline MAINTAINERS | grep -i orphan

> It also doesn't appear to have any active users so I doubt anyone will 
> miss it.
> 

It's not unusual that any Linux driver written more than 5 years ago 
"doesn't appear to have any active users".

If a driver has been orphaned and broken in the past, and no-one stepped 
up to fix it within a reasonable period, removal would make sense. But 
that's not the case here.

I haven't used this driver for a long time, but I still own PowerMacs with 
firewire, and I know I'm not the only one.

> Signed-off-by: Chris Boot <bootc@bootc.net>
> ---
>  MAINTAINERS                     |    9 -
>  drivers/target/Kconfig          |    1 -
>  drivers/target/Makefile         |    1 -
>  drivers/target/sbp/Kconfig      |   12 -
>  drivers/target/sbp/Makefile     |    2 -
>  drivers/target/sbp/sbp_target.c | 2350 -------------------------------
>  drivers/target/sbp/sbp_target.h |  243 ----
>  7 files changed, 2618 deletions(-)
>  delete mode 100644 drivers/target/sbp/Kconfig
>  delete mode 100644 drivers/target/sbp/Makefile
>  delete mode 100644 drivers/target/sbp/sbp_target.c
>  delete mode 100644 drivers/target/sbp/sbp_target.h
> 
