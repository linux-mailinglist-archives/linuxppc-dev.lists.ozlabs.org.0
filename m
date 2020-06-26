Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C5E20B5B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 18:15:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49thnh29mtzDqt3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 02:15:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net
 (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwn.net
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49thlf5zYzzDqt3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 02:14:05 +1000 (AEST)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id DCE73374;
 Fri, 26 Jun 2020 16:13:59 +0000 (UTC)
Date: Fri, 26 Jun 2020 10:13:58 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 00/15] Documentation fixes
Message-ID: <20200626101358.6efc4f8f@lwn.net>
In-Reply-To: <cover.1592895969.git.mchehab+huawei@kernel.org>
References: <cover.1592895969.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
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
Cc: linux-ia64@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, "Peter
 Zijlstra \(Intel\)" <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Ram Pai <linuxram@us.ibm.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Jan Kara <jack@suse.cz>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Will Deacon <will@kernel.org>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Haren Myneni <haren@linux.ibm.com>, Russell King <linux@armlinux.org.uk>,
 kasan-dev@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, linux-media@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dmitry Vyukov <dvyukov@google.com>, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 Akira Shimahara <akira215corp@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S.
 Miller" <davem@davemloft.net>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Jun 2020 09:08:56 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> As requested, this is a rebase of a previous series posted on Jan, 15.
> 
> Since then, several patches got merged via other trees or became
> obsolete. There were also 2 patches before that fits better at the
> ReST conversion patchset. So, I'll be sending it on another patch
> series together with the remaining ReST conversions.
> 
> I also added reviews/acks received.
> 
> So, the series reduced from 29 to 15 patches.
> 
> Let's hope b4 would be able to properly handle this one.

Nope.  I don't know what it is about your patch series, but b4 is never
able to put them together.

I've applied the series except for #1, which already went through the -mm
tree.

Thanks,

jon
