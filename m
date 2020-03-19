Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C56BD18C2AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 23:02:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k18w085YzDrQl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 09:02:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k16W2TJ1zDqlh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 09:00:02 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59322ADAD;
 Thu, 19 Mar 2020 21:59:57 +0000 (UTC)
Date: Thu, 19 Mar 2020 22:59:55 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH -v2] treewide: Rename "unencrypted" to "decrypted"
Message-ID: <20200319215955.GN25468@kitsune.suse.cz>
References: <20200317111822.GA15609@zn.tnic> <20200319101657.GB13073@zn.tnic>
 <20200319102011.GA3617@lst.de> <20200319102834.GC13073@zn.tnic>
 <8d6d3b6c-7e4e-7d9e-3e19-38f7d4477c72@arm.com>
 <20200319112054.GD13073@zn.tnic>
 <878sjw5k9u.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 19, 2020 at 06:25:49PM +0100, Thomas Gleixner wrote:
> Borislav Petkov <bp@alien8.de> writes:
> 
> > On Thu, Mar 19, 2020 at 11:06:15AM +0000, Robin Murphy wrote:
> >> Let me add another vote from a native English speaker that "unencrypted" is
> >> the appropriate term to imply the *absence* of encryption, whereas
> >> "decrypted" implies the *reversal* of applied encryption.
Even as a non-native speaker I can clearly see the distinction.
> >> 
> >> Naming things is famously hard, for good reason - names are *important* for
> >> understanding. Just because a decision was already made one way doesn't mean
> >> that that decision was necessarily right. Churning one area to be
> >> consistently inaccurate just because it's less work than churning another
> >> area to be consistently accurate isn't really the best excuse.
> >
> > Well, the reason we chose "decrypted" vs something else is so to be as
> > different from "encrypted" as possible. If we called it "unencrypted"
> > you'd have stuff like:
> >
> >        if (force_dma_unencrypted(dev))
> >                 set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);

If you want something with high edit distance from 'encrypted' meaning
the opposite there is already 'cleartext' which was designed for this
exact purpose.

Thanks

Michal
