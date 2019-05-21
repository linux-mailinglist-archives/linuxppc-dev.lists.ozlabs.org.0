Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0854D2589C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 22:01:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457mqx4Vz5zDqQT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 06:01:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457mpR153DzDqLC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 06:00:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2WyprSMw0XFiETzAPNoNDTntzyZkEUNNpfxivfnIFag=; b=QiopMVtd93jBeeZmGnTEUvoiY
 vTPJBvJYi5LOSLhmJkqq10H0GkG3Ybuyy2GgEBBiF6ACrbhxxgV/cxaVIjW/Rpjp1yKFHUZAv1Rzs
 o1M82BikP7PxF4SKNxlHxXnX3FiPFbC3GuT6o/Xx4fpryP3q4N96k+ORmXqwzQ/wBAmTBfLHHeQeL
 pscG03ZyLkH3VoNLwDaRa2+XwwmT02a/YpHBEuyfMmby5LJOqSKTeZ4/HIghH62m/WrVueaUx5gSn
 gGeLrAOgfYQfm1X7Wem5prlIJSsG2MzhdkQt9r9wKpMJDj01yDP86ICLz49twvNvu10nerPb/M0CU
 bnqNZlgRg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hTAv2-0006w6-9U; Tue, 21 May 2019 19:59:28 +0000
Date: Tue, 21 May 2019 12:59:28 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 1/2] open: add close_range()
Message-ID: <20190521195928.GB6738@bombadil.infradead.org>
References: <20190521150006.GJ17978@ZenIV.linux.org.uk>
 <20190521113448.20654-1-christian@brauner.io>
 <28114.1558456227@warthog.procyon.org.uk>
 <20190521192009.GK17978@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521192009.GK17978@ZenIV.linux.org.uk>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, oleg@redhat.com,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, shuah@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, miklos@szeredi.hu, x86@kernel.org,
 torvalds@linux-foundation.org, Christian Brauner <christian@brauner.io>,
 linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org, tkjos@android.com,
 arnd@arndb.de, jannh@google.com, linux-m68k@lists.linux-m68k.org,
 tglx@linutronix.de, ldv@altlinux.org, linux-arm-kernel@lists.infradead.org,
 fweimer@redhat.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 08:20:09PM +0100, Al Viro wrote:
> On Tue, May 21, 2019 at 05:30:27PM +0100, David Howells wrote:
> 
> > If we can live with close_from(int first) rather than close_range(), then this
> > can perhaps be done a lot more efficiently by:
> > 
> > 	new = alloc_fdtable(first);
> > 	spin_lock(&files->file_lock);
> > 	old = files_fdtable(files);
> > 	copy_fds(new, old, 0, first - 1);
> > 	rcu_assign_pointer(files->fdt, new);
> > 	spin_unlock(&files->file_lock);
> > 	clear_fds(old, 0, first - 1);
> > 	close_fdt_from(old, first);
> > 	kfree_rcu(old);
> 
> I really hate to think how that would interact with POSIX locks...

POSIX locks store current->files in fl_owner; David's resizing the
underlying files->fdt, just like growing from 64 to 256 fds.
