Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B65218C3FD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 00:56:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k3hF4ZJxzDrRr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 10:55:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k3fV2L6YzDrHt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 10:54:26 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jF4z5-0002E7-Dg; Fri, 20 Mar 2020 00:53:56 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 4DD6B100375; Fri, 20 Mar 2020 00:53:49 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH -v2] treewide: Rename "unencrypted" to "decrypted"
In-Reply-To: <20200319174254.GE13073@zn.tnic>
References: <20200317111822.GA15609@zn.tnic> <20200319101657.GB13073@zn.tnic>
 <20200319102011.GA3617@lst.de> <20200319102834.GC13073@zn.tnic>
 <8d6d3b6c-7e4e-7d9e-3e19-38f7d4477c72@arm.com>
 <20200319112054.GD13073@zn.tnic> <878sjw5k9u.fsf@nanos.tec.linutronix.de>
 <20200319174254.GE13073@zn.tnic>
Date: Fri, 20 Mar 2020 00:53:49 +0100
Message-ID: <87pnd752b6.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
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
Cc: linux-s390@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Borislav Petkov <bp@alien8.de> writes:
> On Thu, Mar 19, 2020 at 06:25:49PM +0100, Thomas Gleixner wrote:
>> TBH, I don't see how
>> 
>> 	if (force_dma_decrypted(dev))
>> 		set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);
>>
>> makes more sense than the above. It's both non-sensical unless there is
>
> 9087c37584fb ("dma-direct: Force unencrypted DMA under SME for certain DMA masks")

Reading the changelog again...

I have to say that force_dma_unencrypted() makes way more sense in that
context than force_dma_decrypted(). It still wants a comment.

Linguistical semantics and correctness matters a lot. Consistency is
required as well, but not for the price of ambiguous wording.

Thanks,

        tglx


