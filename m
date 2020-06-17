Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B7C1FC50A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 06:23:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49msPT5KnczDqsp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 14:23:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49msMt4TJ6zDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 14:21:46 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 020AA27F1F;
 Wed, 17 Jun 2020 00:21:37 -0400 (EDT)
Date: Wed, 17 Jun 2020 14:21:39 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH] scsi: target/sbp: remove firewire SBP target driver
In-Reply-To: <yq18sgml9ds.fsf@ca-mkp.ca.oracle.com>
Message-ID: <alpine.LNX.2.22.394.2006171310520.11@nippy.intranet>
References: <01020172acd3d10f-3964f076-a820-43fc-9494-3f3946e9b7b5-000000@eu-west-1.amazonses.com>
 <alpine.LNX.2.22.394.2006140934520.15@nippy.intranet>
 <yq18sgml9ds.fsf@ca-mkp.ca.oracle.com>
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
 target-devel@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org, Stefan Richter <stefanr@s5r6.in-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Jun 2020, Martin K. Petersen wrote:

> > I haven't used this driver for a long time, but I still own PowerMacs 
> > with firewire, and I know I'm not the only one.
> 

I need to correct what I wrote above. I recall that years ago, when I 
needed to share storage from my Linux box to my PowerBook pismo, I used 
ethernet and the globalSAN iSCSI initiator for Mac OS X (which is no 
longer freely available AFAICS). When I said that I had used the SBP 
target driver before, I misremembered that iSCSI target setup. I've 
actually never used the SBP target driver.

> I also have old 1394 hardware kicking around in the basement. But having 
> worked with FireWire shared storage targets in the past, I have zero 
> desire to ever touch any of that again.
> 
> I could understand an objection if we were to entertain removing sbp2. 
> But really, how many people are setting up FireWire targets?
> 

It's a good question. I don't know the answer.

I have successfully used the Linux sbp2 host driver in the past, and will 
probably need to use it again. Likewise, I can see myself using the sbp 
target driver in the future because that might interoperate with MacOS 9, 
and might provide a bootable device to the PowerMac ROM. iSCSI cannot do 
those things.
