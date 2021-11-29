Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6394611C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 11:07:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2gyg3Vr8z3cWl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 21:07:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 457 seconds by postgrey-1.36 at boromir;
 Mon, 29 Nov 2021 21:07:32 AEDT
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2gyD3Hzbz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 21:07:32 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 45CB168AA6; Mon, 29 Nov 2021 10:59:47 +0100 (CET)
Date: Mon, 29 Nov 2021 10:59:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [linux-next] Read-only file system after boot (powerpc)
Message-ID: <20211129095947.GA32642@lst.de>
References: <87F94FF1-5D9D-475B-B083-C101DDB7A108@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87F94FF1-5D9D-475B-B083-C101DDB7A108@linux.vnet.ibm.com>
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
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Can you check if your tree already includes this commit:

https://git.kernel.dk/cgit/linux-block/commit/?h=for-5.17/block&id=3f39d47d7ad858c024bd777f5f2a86fa7f6a9f14

and if not see if that fixes the problem?
