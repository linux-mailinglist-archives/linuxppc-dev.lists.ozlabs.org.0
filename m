Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80621248F63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 22:09:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWMSP5hPdzDqsd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 06:09:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWMQT53K2zDq8x
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 06:07:29 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7B5EB68AFE; Tue, 18 Aug 2020 22:07:25 +0200 (CEST)
Date: Tue, 18 Aug 2020 22:07:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 03/11] fs: don't allow splice read/write without
 explicit ops
Message-ID: <20200818200725.GA1081@lst.de>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-4-hch@lst.de> <202008181239.E51B80265@keescook>
 <20200818195446.GA32691@lst.de> <202008181256.CABD56782@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202008181256.CABD56782@keescook>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 18, 2020 at 12:58:07PM -0700, Kees Cook wrote:
> On Tue, Aug 18, 2020 at 09:54:46PM +0200, Christoph Hellwig wrote:
> > On Tue, Aug 18, 2020 at 12:39:34PM -0700, Kees Cook wrote:
> > > On Mon, Aug 17, 2020 at 09:32:04AM +0200, Christoph Hellwig wrote:
> > > > default_file_splice_write is the last piece of generic code that uses
> > > > set_fs to make the uaccess routines operate on kernel pointers.  It
> > > > implements a "fallback loop" for splicing from files that do not actually
> > > > provide a proper splice_read method.  The usual file systems and other
> > > > high bandwith instances all provide a ->splice_read, so this just removes
> > > > support for various device drivers and procfs/debugfs files.  If splice
> > > > support for any of those turns out to be important it can be added back
> > > > by switching them to the iter ops and using generic_file_splice_read.
> > > > 
> > > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > 
> > > This seems a bit disruptive? I feel like this is going to make fuzzers
> > > really noisy (e.g. trinity likes to splice random stuff out of /sys and
> > > /proc).
> > 
> > Noisy in the sence of triggering the pr_debug or because they can't
> > handle -EINVAL?
> 
> Well, maybe both? I doubt much _expects_ to be using splice, so I'm fine
> with that, but it seems weird not to have a fall-back, especially if
> something would like to splice a file out of there. But, I'm not opposed
> to the change, it just seems like it might cause pain down the road.

The problem is that without pretending a buffer is in user space when
it actually isn't, we can't have a generic fallback.  So we'll have to
have specific support - I wrote generic support for seq_file, and
willy did for /proc/sys, but at least the first caused a few problems
and a fair amount of churn, so I'd rather see first if we can get
away without it.

> 
> -- 
> Kees Cook
---end quoted text---
