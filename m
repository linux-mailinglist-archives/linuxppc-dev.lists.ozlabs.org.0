Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D55C01BB718
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 08:58:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BCCm2gvFzDr0f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 16:58:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BCBG2RjdzDqvg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 16:57:08 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8A16E68C7B; Tue, 28 Apr 2020 08:57:03 +0200 (CEST)
Date: Tue, 28 Apr 2020 08:57:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [PATCH 1/5] powerpc/spufs: simplify spufs core dumping
Message-ID: <20200428065703.GB18754@lst.de>
References: <20200427200626.1622060-1-hch@lst.de>
 <20200427200626.1622060-2-hch@lst.de>
 <20200427204953.GY23230@ZenIV.linux.org.uk>
 <fc3b45c91e5cd50baa1fec7710f1e64cbe616f77.camel@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc3b45c91e5cd50baa1fec7710f1e64cbe616f77.camel@ozlabs.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Eric W . Biederman" <ebiederm@xmission.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 28, 2020 at 10:51:56AM +0800, Jeremy Kerr wrote:
> Hi Al & Christoph,
> 
> > Again, this really needs fixing.  Preferably - as a separate commit
> > preceding this series, so that it could be
> > backported.  simple_read_from_buffer() is a blocking operation.
> 
> I'll put together a patch that fixes this.
> 
> Christoph: I'll do it in a way that matches your changes to the _read
> functions, so hopefully those hunks would just drop from your change,
> leaving only the _dump additions. Would that work?

Sure.
