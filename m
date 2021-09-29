Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9F441BF56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 08:52:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK6WR1F85z30BM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 16:52:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK6Vx6K2Gz2xXh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 16:52:08 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E4F6567357; Wed, 29 Sep 2021 08:52:02 +0200 (CEST)
Date: Wed, 29 Sep 2021 08:52:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [next-20210827][ppc][multipathd] INFO: task hung in
 dm_table_add_target
Message-ID: <20210929065202.GA31534@lst.de>
References: <68dde454-965a-0c44-374a-a0ca277150ee@linux.vnet.ibm.com>
 <20210901133618.GA16687@lst.de>
 <86f8e47b-84ca-4cc3-5d5b-f5f11c1d4d1a@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86f8e47b-84ca-4cc3-5d5b-f5f11c1d4d1a@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: axboe@kernel.dk, sachinp <sachinp@linux.vnet.ibm.com>, jack@suse.cz,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, dm-devel@redhat.com,
 linux-next <linux-next@vger.kernel.org>, dougmill@us.ibm.com,
 Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 28, 2021 at 03:53:47PM +0530, Abdul Haleem wrote:
>
> On 9/1/21 7:06 PM, Christoph Hellwig wrote:
>> On Wed, Sep 01, 2021 at 04:47:26PM +0530, Abdul Haleem wrote:
>>> Greeting's
>>>
>>> multiple task hung while adding the vfc disk back to the multipath on my
>>> powerpc box running linux-next kernel
>> Can you retry to reproduce this with lockdep enabled to see if there
>> is anything interesting holding this lock?
>
> LOCKDEP was earlier enabled by default
>
> # cat .config | grep LOCKDEP
> CONFIG_LOCKDEP_SUPPORT=y
>
> BTW, Recreated again on 5.15.0-rc2 mainline kernel and attaching the logs

It seems the reinstate is blocking on the close which is blocking on
flushing dirty data.  In other words it looks like the link blocking
looks like the symptom and not the cause.
