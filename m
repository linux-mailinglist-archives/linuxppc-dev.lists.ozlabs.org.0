Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8FFD70AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 10:03:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46snx56kqxzDqyZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 19:03:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+55b1b98096d206da203c+5896+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="L6p5C1wC"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sntf3VtFzDqwF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 19:01:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QQ9QN/iK5ai9ajNOdo+9OkqRPuRUL2eL7TDow4sjeu4=; b=L6p5C1wC28xb4xV/ytStImi/n
 SV2iv4Hjrb+zQYIjHC5OIRoQt2FCR3rotBnYGdihUInJs5Y+lXexNKAZKw1XhTXXTzxcqSL5L86hZ
 kKgdo28rNBbi+hPf8BlLlY9trWgIHMU7EaYEgNuVg6jq/rwQBiZ3mmyUVqJHmJd7/TJG3voH/jXr+
 zoR3ladcSEOvo1Z1l2E1eXyZ7+edNMBda6a9KuH0FIWk2RjvsWzNKuNbegHEMx+3j6EHdx7SwAMUH
 NmdlCkggWdeE6ObgGfQ8L6DYKa0sYuW7P5cGl/Snou5v4lh8+gKAe1LIaN5lLQ6IffEfoucjqR71U
 /kODYccaA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iKHlO-0002Ht-4T; Tue, 15 Oct 2019 08:01:02 +0000
Date: Tue, 15 Oct 2019 01:01:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Sandeen <sandeen@sandeen.net>
Subject: Re: [PATCH] xfs: introduce "metasync" api to sync metadata to fsblock
Message-ID: <20191015080102.GB3055@infradead.org>
References: <1570977420-3944-1-git-send-email-kernelfans@gmail.com>
 <20191013163417.GQ13108@magnolia> <20191014083315.GA10091@mypc>
 <20191014094311.GD5939@quack2.suse.cz>
 <d3ffa114-8b73-90dc-8ba6-3f44f47135d7@sandeen.net>
 <20191014200303.GF5939@quack2.suse.cz>
 <5796090e-6206-1bd7-174e-58798c9af052@sandeen.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5796090e-6206-1bd7-174e-58798c9af052@sandeen.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Jan Kara <jack@suse.cz>, Eric Sandeen <esandeen@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jan Kara <jack@suse.com>,
 Pingfan Liu <kernelfans@gmail.com>, linux-xfs@vger.kernel.org,
 Dave Chinner <dchinner@redhat.com>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 14, 2019 at 03:09:48PM -0500, Eric Sandeen wrote:
> We're in agreement here.  ;)  I only worry about implementing things like this
> which sound like guarantees, but aren't, and end up encouraging bad behavior
> or promoting misconceptions.
> 
> More and more, I think we should reconsider Darrick's "bootfs" (ext2 by another
> name, but with extra-sync-iness) proposal...

Having a separate simple file system for the boot loader makes a lot of
sense.  Note that vfat of EFI is the best choice, but at least it is
something.  SysV Unix from the 90s actually had a special file system just
for that, and fs/bfs/ in Linux supports that.  So this isn't really a new
thing either.
