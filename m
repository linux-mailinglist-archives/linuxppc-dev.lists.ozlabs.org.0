Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D13E41B2FBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 21:03:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496Cf418lgzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 05:03:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 496Cbl09nDzDqyk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 05:01:53 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4A51B68C4E; Tue, 21 Apr 2020 21:01:48 +0200 (CEST)
Date: Tue, 21 Apr 2020 21:01:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 1/7] powerpc/spufs: simplify spufs core dumping
Message-ID: <20200421190148.GA26071@lst.de>
References: <20200421154204.252921-1-hch@lst.de>
 <20200421154204.252921-2-hch@lst.de>
 <20200421184941.GD23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421184941.GD23230@ZenIV.linux.org.uk>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 "Eric W . Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 21, 2020 at 07:49:41PM +0100, Al Viro wrote:
> >  	spin_lock(&ctx->csa.register_lock);
> > -	ret = __spufs_proxydma_info_read(ctx, buf, len, pos);
> > +	__spufs_proxydma_info_read(ctx, &info);
> > +	ret = simple_read_from_buffer(buf, len, pos, &info, sizeof(info));
> 
> IDGI...  What's that access_ok() for?  If you are using simple_read_from_buffer(),
> the damn thing goes through copy_to_user().  Why bother with separate access_ok()
> here?

I have no idea at all, this just refactors the code.
