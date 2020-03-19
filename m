Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE15C18B246
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 12:24:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jl0m2g4pzDqkf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 22:24:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=XE6cHInW; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jkx25HDczDqSr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:20:52 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0A850065FC6DE3D46B17C3.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:8500:65fc:6de3:d46b:17c3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DCF9F1EC085F;
 Thu, 19 Mar 2020 12:20:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1584616849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=IlMyw2jWgHGOB/uFSKCAtl/3A39ugp/rgom8OdfSKmc=;
 b=XE6cHInWOykMJewXB+HpQ43S3ZQrlzEAhf//Ouf5Qimx2SKQA9/gvUhLWvplfK6878RP+v
 ZqLYTWIZthoqXO6tVrkIxYVE1pcVuGHGY61Fde74hzfcGiK9dOuneS2M+Jk5sfOhuyCzWq
 w4QHxgKVH2Zv2Ff20bGX9PTvSDxGf0s=
Date: Thu, 19 Mar 2020 12:20:54 +0100
From: Borislav Petkov <bp@alien8.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH -v2] treewide: Rename "unencrypted" to "decrypted"
Message-ID: <20200319112054.GD13073@zn.tnic>
References: <20200317111822.GA15609@zn.tnic> <20200319101657.GB13073@zn.tnic>
 <20200319102011.GA3617@lst.de> <20200319102834.GC13073@zn.tnic>
 <8d6d3b6c-7e4e-7d9e-3e19-38f7d4477c72@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d6d3b6c-7e4e-7d9e-3e19-38f7d4477c72@arm.com>
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
 Vasily Gorbik <gor@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 19, 2020 at 11:06:15AM +0000, Robin Murphy wrote:
> Let me add another vote from a native English speaker that "unencrypted" is
> the appropriate term to imply the *absence* of encryption, whereas
> "decrypted" implies the *reversal* of applied encryption.
> 
> Naming things is famously hard, for good reason - names are *important* for
> understanding. Just because a decision was already made one way doesn't mean
> that that decision was necessarily right. Churning one area to be
> consistently inaccurate just because it's less work than churning another
> area to be consistently accurate isn't really the best excuse.

Well, the reason we chose "decrypted" vs something else is so to be as
different from "encrypted" as possible. If we called it "unencrypted"
you'd have stuff like:

       if (force_dma_unencrypted(dev))
                set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);

and I *betcha* people will misread this and maybe even introduce bugs.

So I don't think renaming it to "unencrypted" is better. And yes, I'm
deliberately putting the language semantics here on a second place
because of readability examples like the one above.

But ok, since people don't want this, we can leave it as is. It's not
like I don't have anything better to do.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
