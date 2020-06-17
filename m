Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAAA1FC401
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 04:09:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mpR34NhvzDqxg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 12:09:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49mpPK0WgJzDq9R
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 12:07:48 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 08FB82787E;
 Tue, 16 Jun 2020 22:07:38 -0400 (EDT)
Date: Wed, 17 Jun 2020 12:07:40 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH] scsi: target/sbp: remove firewire SBP target driver
In-Reply-To: <8cbab988-fba7-8e27-7faf-9f7aa36ca235@acm.org>
Message-ID: <alpine.LNX.2.22.394.2006171104540.11@nippy.intranet>
References: <01020172acd3d10f-3964f076-a820-43fc-9494-3f3946e9b7b5-000000@eu-west-1.amazonses.com>
 <alpine.LNX.2.22.394.2006140934520.15@nippy.intranet>
 <7ad14946-5c25-fc49-1e48-72d37a607832@boo.tc>
 <alpine.LNX.2.22.394.2006150919110.8@nippy.intranet>
 <8da0c285-d707-a3d2-063e-472af5cc560f@boo.tc>
 <alpine.LNX.2.22.394.2006161929380.8@nippy.intranet>
 <8cbab988-fba7-8e27-7faf-9f7aa36ca235@acm.org>
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
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Bellinger <nab@linux-iscsi.org>,
 target-devel@vger.kernel.org, Chris Boot <bootc@boo.tc>,
 linux1394-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Jun 2020, Bart Van Assche wrote:

> 
> As far as I know the sbp driver only has had one user ever and that user 
> is no longer user the sbp driver.

So, you estimate the userbase at zero. Can you give a confidence level? 
Actual measurement is hard because when end users encounter breakage, they 
look for quick workarounds before they undertake post mortem, log 
collection, bug reporting, mailing list discussions, analysis etc.

> So why to keep it in the kernel tree?

Answer: for the same reason it was added to the tree.

Here's a different question: "Why remove it from the kernel tree?"

If maintaining this code is a burden, is it not the kind of tax that all 
developers/users pay to all developers/users? Does this driver impose an 
unreasonably high burden for some reason?

The growth of a maintenance burden in general has lead to the invention of 
design patterns and tooling to minize it. So a good argument for removal 
would describe the nature of the problem, because some driver deficiencies 
can be fixed automatically, and some tooling deficiencies can compound an 
otherwise insignificant or common driver deficiency.

There are spin-off benefits from legacy code besides process improvements. 
Building and testing this sort of code has regularly revealed erroneous 
corner cases in commits elsewhere like API changes and refactoring.

Also, legacy code is used by new developers get experience in code 
modernization. And it provides more training material for neural networks 
that need to be taught to recognize patches that raise quality.

Ten or twenty years ago, I doubt that anyone predicted these (and other) 
spin-off benefits. If we can't predict the benefit, how will we project 
the cost, and use that to justify deletion?

Please see also,
http://www.mac.linux-m68k.org/docs/obsolete.php
