Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F37A189011
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 22:07:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hm3G2PV9zDqrF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 08:07:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=A1+8yNm1; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hm1N3w3qzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 08:06:16 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0C960029779DE4AAC583E4.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0c:9600:2977:9de4:aac5:83e4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 15F2D1EC0BFD;
 Tue, 17 Mar 2020 22:05:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1584479158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=HFR+t8qs+BETW/cIOn04p67zo0Dmc/q+y8ZzD5mYjgU=;
 b=A1+8yNm1sVm9L2XdYDq9Jn9i3fFQiAY+YK18Dd3iHshwbAShdu/tGs0xXWZNWZ4toGozad
 WRDRFAIPfqS7qTVWEWkoeWh8j7BphzvIGaZ0eWhpSnaSeeyB5oCxzdp9v3VCs7feFCMwzm
 4txEsQKLkI1UDSFIlhaJHoqHMbyNKbI=
Date: Tue, 17 Mar 2020 22:06:02 +0100
From: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH] treewide: Rename "unencrypted" to "decrypted"
Message-ID: <20200317210602.GG15609@zn.tnic>
References: <20200317111822.GA15609@zn.tnic>
 <2cb4a8ae-3b13-67bd-c021-aee47fdf58c5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2cb4a8ae-3b13-67bd-c021-aee47fdf58c5@intel.com>
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

On Tue, Mar 17, 2020 at 01:35:12PM -0700, Dave Hansen wrote:
> On 3/17/20 4:18 AM, Borislav Petkov wrote:
> > Back then when the whole SME machinery started getting mainlined, it
> > was agreed that for simplicity, clarity and sanity's sake, the terms
> > denoting encrypted and not-encrypted memory should be "encrypted" and
> > "decrypted". And the majority of the code sticks to that convention
> > except those two. So rename them.
> 
> Don't "unencrypted" and "decrypted" mean different things?
> 
> Unencrypted to me means "encryption was never used for this data".
> 
> Decrypted means "this was/is encrypted but here is a plaintext copy".

Maybe but linguistical semantics is not the point here.

The idea is to represent a "binary" concept of memory being encrypted
or memory being not encrypted. And at the time we decided to use
"encrypted" and "decrypted" for those two things.

Do you see the need to differentiate a third "state", so to speak, of
memory which was never encrypted?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
