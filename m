Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960B2EA6E8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 10:05:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D966L2WwZzDqXJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jan 2021 20:05:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm2 header.b=QUkfYFO0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=GYVfhsTf; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D964V5LS6zDqW0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jan 2021 20:04:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BFE11666;
 Tue,  5 Jan 2021 04:04:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 05 Jan 2021 04:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=TUtgNPoXuUOXJrOKmvGYB7SWZxy
 RvgbHZr1AL8pLDcQ=; b=QUkfYFO0QyjEPrDpLPAEkcaL5ojVa+jsyZOfIV8wRVU
 n799CYY6dGOf0YiWZEL8dgsZiAt/L9LteY8ZAsR232NaC/p1KGF1Q9bfJEQ4Q5u3
 DUsqoxQpdq6+DQZBMQVomxvLUDUGzKcZ1sW3rCNd8HijJIgn8FqC/I/M2ms+opLO
 dJKVmSs8R0EtGeA4dBt5g7neNlaqjS1wXNWOUskXxKIFdmFLeHL3Vt65OahcL2ao
 giGLasN0AqlDRU0t5n5FrkuwXhdJDnyQxYaO3JfapURovMdkj8Xxg5SY/yvHw3JA
 1E4KcPmxkZC/PnPCwKhAg/EZ+AaNRqkZlO1sc7sVLYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TUtgNP
 oXuUOXJrOKmvGYB7SWZxyRvgbHZr1AL8pLDcQ=; b=GYVfhsTff/cHx0SG/Z3Rui
 KQn97aw8kfYEb0LCegAGDZgIuy4I1PTTsc1sXGc48RreKGba2ua9KHRGAN4wz9HH
 YugeF898+PKV19Mn8KAgqSyxiCCLauy+Eea/fBAmJKhtid1VIhViJ6ijWrGUF2+W
 YPDnoIG1LBPln8QFK1D2+CTh6MfXieTlOX2dqc6kRx66H8gmPXFDb+buNihCKEnj
 6ILwcG6mltnQ4bJczGMqkZF1n7MN5nDDmeYimd/UZ3X0UCOJcU1WO407x9bRShV2
 7fdAbSRZfFA9SfiRDiRIEoB+VowU44D5dgVV4c0asF8CYLmYlPzuGuESHM3nCbuw
 ==
X-ME-Sender: <xms:gyv0X-S6jQbYrcGUCxJz51H6Q8rJrjlIDoQ-JTa_qpmdTeAetboGAg>
 <xme:gyv0XzyHZ2oEQebqSKIKEEbQM43AEDksGPiX4Tc_pfjlLz9E9zarcPfGIiq3lLau6
 A6K9ZqIaBLsBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefgedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepueelle
 dtheekleethfeludduvdfhffeuvdffudevgeehkeegieffveehgeeftefgnecuffhomhgr
 ihhnpehkvghrnhgvlhdrohhrghenucfkphepkeefrdekiedrjeegrdeigeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgr
 hhdrtghomh
X-ME-Proxy: <xmx:gyv0X73URPx0fSGfQsHGvldZ-nzGtjBO7g96IPRBbwaI9bnFTbqABw>
 <xmx:gyv0X6DOj4mf0AgB6EZ9JOwMMcuJ4EtZ3G0ZZAlZoXaSr9JuiMOZlA>
 <xmx:gyv0X3h-oj2QrHqcqLmPazTriarzbXnTJSt8ueDl7cR94clwltN1Lg>
 <xmx:hSv0X3e3YO9Xh4gu0bit7oTbL2fe0aKGtn98MVlOIcmvEdohzTfOig>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 037AC1080057;
 Tue,  5 Jan 2021 04:04:02 -0500 (EST)
Date: Tue, 5 Jan 2021 10:05:28 +0100
From: Greg KH <greg@kroah.com>
To: Santosh Sivaraj <santosh@fossix.org>
Subject: Re: [PATCH v3 5/6] mm/mmu_gather: invalidate TLB correctly on batch
 allocation failure and flush
Message-ID: <X/Qr2Om3vW+4XdnI@kroah.com>
References: <20200312132740.225241-1-santosh@fossix.org>
 <20200312132740.225241-6-santosh@fossix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312132740.225241-6-santosh@fossix.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 stable@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 12, 2020 at 06:57:39PM +0530, Santosh Sivaraj wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> commit 0ed1325967ab5f7a4549a2641c6ebe115f76e228 upstream.
> 
> Architectures for which we have hardware walkers of Linux page table
> should flush TLB on mmu gather batch allocation failures and batch flush.
> Some architectures like POWER supports multiple translation modes (hash
> and radix) and in the case of POWER only radix translation mode needs the
> above TLBI.  This is because for hash translation mode kernel wants to
> avoid this extra flush since there are no hardware walkers of linux page
> table.  With radix translation, the hardware also walks linux page table
> and with that, kernel needs to make sure to TLB invalidate page walk cache
> before page table pages are freed.
> 
> More details in commit d86564a2f085 ("mm/tlb, x86/mm: Support invalidating
> TLB caches for RCU_TABLE_FREE")
> 
> The changes to sparc are to make sure we keep the old behavior since we
> are now removing HAVE_RCU_TABLE_NO_INVALIDATE.  The default value for
> tlb_needs_table_invalidate is to always force an invalidate and sparc can
> avoid the table invalidate.  Hence we define tlb_needs_table_invalidate to
> false for sparc architecture.
> 
> Link: http://lkml.kernel.org/r/20200116064531.483522-3-aneesh.kumar@linux.ibm.com
> Fixes: a46cc7a90fd8 ("powerpc/mm/radix: Improve TLB/PWC flushes")
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: <stable@vger.kernel.org>  # 4.19
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> [santosh: backported to 4.19 stable]
> ---
>  arch/Kconfig                    |  3 ---
>  arch/powerpc/Kconfig            |  1 -
>  arch/powerpc/include/asm/tlb.h  | 11 +++++++++++
>  arch/sparc/Kconfig              |  1 -
>  arch/sparc/include/asm/tlb_64.h |  9 +++++++++
>  include/asm-generic/tlb.h       | 15 +++++++++++++++
>  mm/memory.c                     | 16 ++++++++--------
>  7 files changed, 43 insertions(+), 13 deletions(-)

As the testing pointed out, this breaks the build on lots of arches:
	https://lore.kernel.org/r/CAEUSe78+F1Q9LFjpf8SQzQa6+Ak4wcPiiNcUVxEcv+KPdrYvBw@mail.gmail.com
	https://lore.kernel.org/r/cff87cd2-8cd5-241e-3a05-a817b1a56b8c@roeck-us.net

so I'm going to drop this whole series and do a -rc2.

If you still want/need this series in 4.19, please make sure it really
works for everyone :)

thanks,

greg k-h
