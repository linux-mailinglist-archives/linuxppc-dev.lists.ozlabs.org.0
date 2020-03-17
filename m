Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 162C41890AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 22:38:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hmk214SbzDqsX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 08:38:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.75; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0075.hostedemail.com
 [216.40.44.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hmhD1mjfzDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 08:36:26 +1100 (AEDT)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 0B53645A8;
 Tue, 17 Mar 2020 21:36:22 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3167:3353:3622:3865:3866:3867:3868:3871:3872:3873:3874:4250:4321:5007:6742:6743:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14096:14097:14659:14721:21080:21433:21451:21627:30012:30029:30045:30054:30079:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: tax31_8e64a60b0ff18
X-Filterd-Recvd-Size: 3175
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Tue, 17 Mar 2020 21:36:18 +0000 (UTC)
Message-ID: <1e52a8441a319e55b913376ad47c6b18843742cd.camel@perches.com>
Subject: Re: [PATCH] treewide: Rename "unencrypted" to "decrypted"
From: Joe Perches <joe@perches.com>
To: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>
Date: Tue, 17 Mar 2020 14:34:30 -0700
In-Reply-To: <f3e520c6-f455-9c82-abfc-d014ca63eeb5@intel.com>
References: <20200317111822.GA15609@zn.tnic>
 <2cb4a8ae-3b13-67bd-c021-aee47fdf58c5@intel.com>
 <20200317210602.GG15609@zn.tnic>
 <f3e520c6-f455-9c82-abfc-d014ca63eeb5@intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
Cc: "Schofield, Alison" <alison.schofield@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390@vger.kernel.org, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Vasily Gorbik <gor@linux.ibm.com>, "Shutemov,
 Kirill" <kirill.shutemov@intel.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Robin Murphy <robin.murphy@arm.com>,
 lkml <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-03-17 at 14:24 -0700, Dave Hansen wrote:
> On 3/17/20 2:06 PM, Borislav Petkov wrote:
> > On Tue, Mar 17, 2020 at 01:35:12PM -0700, Dave Hansen wrote:
> > > On 3/17/20 4:18 AM, Borislav Petkov wrote:
> > > > Back then when the whole SME machinery started getting mainlined, it
> > > > was agreed that for simplicity, clarity and sanity's sake, the terms
> > > > denoting encrypted and not-encrypted memory should be "encrypted" and
> > > > "decrypted". And the majority of the code sticks to that convention
> > > > except those two. So rename them.
> > > Don't "unencrypted" and "decrypted" mean different things?
> > > 
> > > Unencrypted to me means "encryption was never used for this data".
> > > 
> > > Decrypted means "this was/is encrypted but here is a plaintext copy".
> > Maybe but linguistical semantics is not the point here.
> > 
> > The idea is to represent a "binary" concept of memory being encrypted
> > or memory being not encrypted. And at the time we decided to use
> > "encrypted" and "decrypted" for those two things.
> 
> Yeah, agreed.  We're basically trying to name "!encrypted".
> 
> > Do you see the need to differentiate a third "state", so to speak, of
> > memory which was never encrypted?
> 
> No, there are just two states.  I just think the "!encrypted" case
> should not be called "decrypted".

Nor do I, it's completely misleading.


