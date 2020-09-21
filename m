Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC02272F27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 18:55:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw9Y43jZ0zDqsJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 02:55:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw8bh28nbzDqrC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 02:12:30 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AF5CF68B02; Mon, 21 Sep 2020 18:12:24 +0200 (CEST)
Date: Mon, 21 Sep 2020 18:12:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 02/11] mm: call import_iovec() instead of
 rw_copy_check_uvector() in process_vm_rw()
Message-ID: <20200921161224.GA24807@lst.de>
References: <20200921143434.707844-1-hch@lst.de>
 <20200921143434.707844-3-hch@lst.de>
 <20200921150211.GS3421308@ZenIV.linux.org.uk>
 <ef67787edb2f48548d69caaaff6997ba@AcuMS.aculab.com>
 <20200921152937.GX3421308@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921152937.GX3421308@ZenIV.linux.org.uk>
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
Cc: "linux-aio@kvack.org" <linux-aio@kvack.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 21, 2020 at 04:29:37PM +0100, Al Viro wrote:
> On Mon, Sep 21, 2020 at 03:21:35PM +0000, David Laight wrote:
> 
> > You really don't want to be looping through the array twice.
> 
> Profiles, please.

Given that the iov array should be cache hot I'd be surprised to
see a huge difference.  
