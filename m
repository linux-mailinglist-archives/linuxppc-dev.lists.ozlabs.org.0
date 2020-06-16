Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6BA1FBD79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 20:02:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mbd74sZczDqvY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 04:02:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=boo.tc
 (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com;
 envelope-from=bootc@boo.tc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=boo.tc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=boo.tc header.i=@boo.tc header.a=rsa-sha256 header.s=fm3
 header.b=aVKAofFt; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Vflw3gHW; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mbZc5P9BzDqrn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 04:00:07 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id BF51258027E;
 Tue, 16 Jun 2020 14:00:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 16 Jun 2020 14:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boo.tc; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=W
 K4JaLWYbo7txUBZY+FCSU3GLstd9cPvWcMBaGJr3nE=; b=aVKAofFtzCa5gI6mc
 Th0FzfvwxeMhpKkpgocaoFXWMcsKKUgFgYpGA88jW9s5PaDhGQe4GWzXd/vHmEua
 lT7pb2FdO6VBhiXRkjC6lleFdw//9+7arTNZf5YtGxPUY4pqdBhw6/lFNEeqGch8
 T+ZizTzfvJ7P146VPbRwJ/EGTR7rdxuZ7DVrW0jCmq1DSk5OhSITKuW0EHa9TezK
 2q1DVij7/VYoJOiQilRtIxznilDE39wCMG6mgmkYvJ6y6zm2LTFGzDCoApCFw/bU
 C8y9WzS67y8Mxn34ov8w2a3p9thBfXG/aSBMQcV5eKt5Ib2vufaz6szCNFfdKcNO
 KYqXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=WK4JaLWYbo7txUBZY+FCSU3GLstd9cPvWcMBaGJr3
 nE=; b=Vflw3gHWExDHUqNm9TIBMt9r9dXnWF1nw4gPi5V7YOTVx1ITtbh7GgDc+
 DAlvMwJ24dwV4n82ePizZn+NUwNMvj3LP1XToX52jWIt5nF/24wDC3qbLkzdbUti
 JKyUP2WTDvmatC6WYj8yV6GqJkvxQBo2eRZahLO7/tdkdoBQfUXD0h0WNTDcr1P0
 eAWNuRFBy5RihbQp4AJD3c3JF5sz7PpWQ1uoqMFbGJK0jQftO2BmFDJi3DU5+TI/
 B42rK0ncFb7+zJdUOCVy1K6WZ78vcdyWKD/B1TxGEWLF1T/f3hhCzLX+xKNFba4r
 tD8i+YlriVNwbeLkbw5QX5GjDbkDw==
X-ME-Sender: <xms:ogjpXkkoKnunkfd9JFWoIFvt67aMmfEilLqcNRC4dEGvV3tOGJjppQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejtddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculddvhedmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredt
 tdefjeenucfhrhhomhepvehhrhhishcuuehoohhtuceosghoohhttgessghoohdrthgtqe
 enucggtffrrghtthgvrhhnpeetuefgvefhhfdugeetveekvdelhffhledvhfeuvdekfedu
 hffhvdehgefffeduvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeekud
 drudekjedrheehrdelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpegsohhothgtsegsohhordhttg
X-ME-Proxy: <xmx:ogjpXj3ZZgqjj-SYUvp_AiGYnVP7rV_A2S44npTeCH9uXVa0dnFV1w>
 <xmx:ogjpXiqlk_aIyP35hP8w2jLot76p3QuQHdg1A00TZ82OZqARYiie6A>
 <xmx:ogjpXgl73JZYaOIHbwf8Qf1SKVfh-zHHk3M9t5sb1YhSQ4mRs7S1-A>
 <xmx:owjpXgxwGkSRNnQZjvuen7DQCuiOf57sCZ2fqC69v8jTiV-Vlfv0Og>
Received: from heen.boo.tc (heen.boo.tc [81.187.55.93])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4440730618C1;
 Tue, 16 Jun 2020 14:00:00 -0400 (EDT)
Subject: Re: [PATCH] scsi: target/sbp: remove firewire SBP target driver
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Finn Thain <fthain@telegraphics.com.au>
References: <01020172acd3d10f-3964f076-a820-43fc-9494-3f3946e9b7b5-000000@eu-west-1.amazonses.com>
 <alpine.LNX.2.22.394.2006140934520.15@nippy.intranet>
 <7ad14946-5c25-fc49-1e48-72d37a607832@boo.tc>
 <alpine.LNX.2.22.394.2006150919110.8@nippy.intranet>
 <8da0c285-d707-a3d2-063e-472af5cc560f@boo.tc>
 <alpine.LNX.2.22.394.2006161929380.8@nippy.intranet>
 <8cbab988-fba7-8e27-7faf-9f7aa36ca235@acm.org>
 <SN4PR0401MB35982D889857E3C03E96E49D9B9D0@SN4PR0401MB3598.namprd04.prod.outlook.com>
 <1592321667.4394.5.camel@HansenPartnership.com>
From: Chris Boot <bootc@boo.tc>
Autocrypt: addr=bootc@boo.tc; prefer-encrypt=mutual; keydata=
 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
 1QBDj3S+cCP/8Pe5l3n1B7V4SkVPBQs/H/ClB6o=
Message-ID: <5e512185-45d1-61eb-9bec-91e9f9d53ea3@boo.tc>
Date: Tue, 16 Jun 2020 18:59:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592321667.4394.5.camel@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Chuhong Yuan <hslester96@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Bellinger <nab@linux-iscsi.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/06/2020 16:34, James Bottomley wrote:
> On Tue, 2020-06-16 at 14:13 +0000, Johannes Thumshirn wrote:
>> On 16/06/2020 16:09, Bart Van Assche wrote:
>>> On 2020-06-16 02:42, Finn Thain wrote:
>>>> Martin said, "I'd appreciate a patch to remove it"
>>>>
>>>> And Bart said, "do you want to keep this driver in the kernel
>>>> tree?"
>>>>
>>>> AFAICT both comments are quite ambiguous. I don't see an
>>>> actionable request, just an expression of interest from people
>>>> doing their jobs.
>>>>
>>>> Note well: there is no pay check associated with having a
>>>> MAINTAINERS file 
>>>> entry.
>>>
>>> Hi Finn,
>>>
>>> As far as I know the sbp driver only has had one user ever and that
>>> user is no longer user the sbp driver. So why to keep it in the
>>> kernel tree? Restoring a kernel driver can be easy - the first step
>>> is a "git revert".
>>
>> Why not move the driver to drivers/staging for 2 or 3 kernel releases
>> and if noone steps up, delete it?
> 
> Because that's pretty much the worst of all worlds: If the driver is
> simply going orphaned it can stay where it is to avoid confusion.  If
> it's being removed, it's better to remove it from where it is because
> that makes the patch to restore it easy to find.
> 
> Chris, the thing is this: if this driver has just one user on a stable
> distro who complains about its removal six months to two years from
> now, Linus will descend on us from a great height (which won't matter
> to you, since you'll be long gone).  This makes everyone very wary of
> outright removal.  If you're really, really sure it has no users, it
> can be deleted, but if there's the slightest chance it has just one, it
> should get orphaned.

My patch to delete the driver was based on Martin's original request:
https://lore.kernel.org/lkml/yq1img99d4k.fsf@ca-mkp.ca.oracle.com/

I don't especially want it to be gone, nor can I be sure there are no
users of what is as far as I can tell a working piece of code. I can
tell you that I never hear about it (other than the odd patch), whereas
I do get emails out of the blue for some of my other (much smaller)
stuff which clearly has users. I'd be just as happy for this to be
orphaned or for nothing to happen to it.

Honestly, I am totally ambivalent as to what happens to this code.
Martin, however, clearly cares enough to have asked me to supply a patch
to remove it.

Cheers,
Chris

-- 
Chris Boot
bootc@boo.tc
