Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4621C1C82E4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 08:57:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Hklx0LDQzDqxf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 16:57:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Hkjc01QgzDqq7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 16:54:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49HkjZ6tK1z8t70
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 16:54:58 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49HkjZ5Nqgz9sSm; Thu,  7 May 2020 16:54:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49HkjZ2Q6mz9sSc;
 Thu,  7 May 2020 16:54:57 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1010968B05; Thu,  7 May 2020 08:54:52 +0200 (CEST)
Date: Thu, 7 May 2020 08:54:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/spufs: Add rcu_read_lock() around fcheck()
Message-ID: <20200507065451.GA6185@lst.de>
References: <20200428114811.68436-1-mpe@ellerman.id.au>
 <20200428135245.GA2827@lst.de> <875zdifrgw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875zdifrgw.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, viro@zeniv.linux.org.uk, jk@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 29, 2020 at 09:42:39PM +1000, Michael Ellerman wrote:
> Christoph Hellwig <hch@lst.de> writes:
> > On Tue, Apr 28, 2020 at 09:48:11PM +1000, Michael Ellerman wrote:
> >> 
> >> This comes from fcheck_files() via fcheck().
> >> 
> >> It's pretty clearly documented that fcheck() must be wrapped with
> >> rcu_read_lock(), so fix it.
> >
> > But for this to actually be useful you'd need the rcu read lock until
> > your are done with the file (or got a reference).
> 
> Hmm OK. My reasoning was that we were done with the struct file, because
> we return the ctx that's hanging off the inode.
> 
> +	ctx = SPUFS_I(file_inode(file))->i_ctx;
> 
> But I guess the lifetime of the ctx is not guaranteed if the file goes
> away.
> 
> It looks like the only long lived reference on the ctx is the one
> taken in spufs_new_file() and dropped in spufs_evict_inode().
> 
> So if we take a reference to the ctx with the RCU lock held we should be
> safe, I think. But I've definitely exhausted my spufs/vfs knowledge at
> this point.
> 
> Something like below.

Looks reasonable.
