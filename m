Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9881F8B53
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 01:30:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lW0x0NQGzDqRG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 09:30:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49lVz242zLzDqBy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 09:29:02 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id BFEE1272D7;
 Sun, 14 Jun 2020 19:28:56 -0400 (EDT)
Date: Mon, 15 Jun 2020 09:28:56 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Chris Boot <bootc@boo.tc>
Subject: Re: [PATCH] scsi: target/sbp: remove firewire SBP target driver
In-Reply-To: <7ad14946-5c25-fc49-1e48-72d37a607832@boo.tc>
Message-ID: <alpine.LNX.2.22.394.2006150919110.8@nippy.intranet>
References: <01020172acd3d10f-3964f076-a820-43fc-9494-3f3946e9b7b5-000000@eu-west-1.amazonses.com>
 <alpine.LNX.2.22.394.2006140934520.15@nippy.intranet>
 <7ad14946-5c25-fc49-1e48-72d37a607832@boo.tc>
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
Cc: Chris Boot <bootc@bootc.net>, Bart Van Assche <bvanassche@acm.org>,
 linux-scsi@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Bellinger <nab@linux-iscsi.org>,
 target-devel@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux1394-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 14 Jun 2020, Chris Boot wrote:

> I expect that if someone finds this useful it can stick around (but 
> that's not my call).

Who's call is that? If the patch had said "From: Martin K. Petersen" and 
"This driver is being removed because it has the following defects..." 
that would be some indication of a good-faith willingness to accept users 
as developers in the spirit of the GPL, which is what you seem to be 
alluding to (?).

> I just don't have the time or inclination or hardware to be able to 
> maintain it anymore, so someone else would have to pick it up.
> 

Which is why most drivers get orphaned, right?
