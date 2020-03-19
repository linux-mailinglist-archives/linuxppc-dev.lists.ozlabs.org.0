Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD6218BE94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 18:45:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jvSC5DxYzDrNk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 04:44:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=BstyM5Fy; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jvPt6VydzDrNk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:42:56 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0A85008DCA7A58643289AE.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:8500:8dca:7a58:6432:89ae])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7F6271EC0CFA;
 Thu, 19 Mar 2020 18:42:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1584639768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=LJgEl6+GWpjWMprHgQdpvOsZPmZ9T4AgJaJ310Sp15A=;
 b=BstyM5FyzXd4gUjzYEKas19giaR3PryEQgqFuimsLBfSog5uMwWV2b0pL/Te/PSiFpUTow
 +JfuNn7O4THbFfI6nYX7gKJnJsqRVfieDh1pygDl8Ash+cUnvz3cwuI8wH5wfd5vmjqxSm
 qSP7WorzYL+KIIwiwVuKclKRo0SUmHk=
Date: Thu, 19 Mar 2020 18:42:54 +0100
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH -v2] treewide: Rename "unencrypted" to "decrypted"
Message-ID: <20200319174254.GE13073@zn.tnic>
References: <20200317111822.GA15609@zn.tnic> <20200319101657.GB13073@zn.tnic>
 <20200319102011.GA3617@lst.de> <20200319102834.GC13073@zn.tnic>
 <8d6d3b6c-7e4e-7d9e-3e19-38f7d4477c72@arm.com>
 <20200319112054.GD13073@zn.tnic>
 <878sjw5k9u.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878sjw5k9u.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Mar 19, 2020 at 06:25:49PM +0100, Thomas Gleixner wrote:
> TBH, I don't see how
> 
> 	if (force_dma_decrypted(dev))
> 		set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);
>
> makes more sense than the above. It's both non-sensical unless there is

9087c37584fb ("dma-direct: Force unencrypted DMA under SME for certain DMA masks")

> a big fat comment explaining what this is about.

ACK to that.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
