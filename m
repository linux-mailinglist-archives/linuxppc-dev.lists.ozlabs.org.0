Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD5B1FDA5A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 02:42:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nNS64Hp0zDqvL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 10:42:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49nNQS54RCzDqvH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 10:40:48 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 2C6062073E;
 Wed, 17 Jun 2020 20:40:40 -0400 (EDT)
Date: Thu, 18 Jun 2020 10:40:37 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH] scsi: target/sbp: remove firewire SBP target driver
In-Reply-To: <yq1366ul8o4.fsf@ca-mkp.ca.oracle.com>
Message-ID: <alpine.LNX.2.22.394.2006180953320.8@nippy.intranet>
References: <01020172acd3d10f-3964f076-a820-43fc-9494-3f3946e9b7b5-000000@eu-west-1.amazonses.com>
 <alpine.LNX.2.22.394.2006140934520.15@nippy.intranet>
 <7ad14946-5c25-fc49-1e48-72d37a607832@boo.tc>
 <alpine.LNX.2.22.394.2006150919110.8@nippy.intranet>
 <8da0c285-d707-a3d2-063e-472af5cc560f@boo.tc>
 <alpine.LNX.2.22.394.2006161929380.8@nippy.intranet>
 <8cbab988-fba7-8e27-7faf-9f7aa36ca235@acm.org>
 <SN4PR0401MB35982D889857E3C03E96E49D9B9D0@SN4PR0401MB3598.namprd04.prod.outlook.com>
 <1592321667.4394.5.camel@HansenPartnership.com>
 <5e512185-45d1-61eb-9bec-91e9f9d53ea3@boo.tc>
 <yq1366ul8o4.fsf@ca-mkp.ca.oracle.com>
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 Chuhong Yuan <hslester96@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Bellinger <nab@linux-iscsi.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 Chris Boot <bootc@boo.tc>, "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Jun 2020, Martin K. Petersen wrote:

> 
> However, keeping code around is not free.

Right. And removing code isn't free either, if it forces people to find 
workarounds.

> Core interfaces change frequently.  Nobody enjoys having to tweak host 
> templates for 50 devices they have never even heard about.

And yet some people seem to enjoy writing patches that are as trivial as 
they are invasive...

You seem to be making an argument for more automation here, not an 
argument for less code. Or is there some upper bound to the size of the 
kernel, that might be lifted by adding maintainers? (Can you deliver a 
better product by adding more developers to your project?)

> Also, we now live in a reality where there is a constant barrage of 
> build bots and code analyzers sending mail. So the effective cost of 
> keeping code around in the tree is going up.

But if maintenance cost rises due to good analysis, the value of the code 
should rise too. So what's the problem? It seems to me that the real 
problem is too many analyses that generate pedantic noise and no tangible 
improvement in code quality or value.

> I get a substantial amount of code analysis mail about drivers nobody 
> have touched in a decade or more.
> 

When stable, mature code fails analysis, the analysis is also questionable 
(in the absence of real examples).

> Consequently, I am much more inclined to remove drivers than I have been 
> in the past. But I am also very happy to bring them back if somebody 
> uses them or - even better - are willing to step up and maintain them.
> 

You seem to be saying that 1) a driver should be removed when it no longer 
meets the present threshold for code quality and 2) that a low quality 
driver is eligible for re-addition because someone wants to use it.
I don't think you can have it both ways.

> I don't particularly like the notion of a driver being orphaned because 
> all that really means is that the driver transitions from being (at 
> least partially) somebody else's problem to being mine and mine alone.
> 

Yes it's your problem but only on a best-effort basis.

Many issues detected by automatic analyzers can be fixed with automatic 
code transformation tools. This kind of solution works tree-wide, so even 
if some defect in your driver is "yours and yours alone", the solution 
will probably come from others.

This email, like yours, is just hand-waving. So feel free to ignore it or 
(preferably) provide evidence of real defects.
