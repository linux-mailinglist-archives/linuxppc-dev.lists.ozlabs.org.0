Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F26B41BD88B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 11:43:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Btr361HvzDqyx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 19:43:47 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Btp8042qzDqyk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 19:42:06 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8CE8668BFE; Wed, 29 Apr 2020 11:42:01 +0200 (CEST)
Date: Wed, 29 Apr 2020 11:42:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] fixup! signal: factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
Message-ID: <20200429094201.GA2557@lst.de>
References: <20200428074827.GA19846@lst.de>
 <20200428195645.1365019-1-arnd@arndb.de> <20200429064458.GA31717@lst.de>
 <CAK8P3a1YD3RitSLLRsM+e+LwAxg+NS6F071B4zokwEpiL0WvrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1YD3RitSLLRsM+e+LwAxg+NS6F071B4zokwEpiL0WvrA@mail.gmail.com>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jeremy Kerr <jk@ozlabs.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 "Eric W . Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 29, 2020 at 10:07:11AM +0200, Arnd Bergmann wrote:
> > What do you think of this version?  This one always overrides
> > copy_siginfo_to_user32 for the x86 compat case to keep the churn down,
> > and improves the copy_siginfo_to_external32 documentation a bit.
> 
> Looks good to me. I preferred checking for X32 explicitly (so we can
> find and kill off the #ifdef if we ever remove X32 for good), but there is
> little difference in the end.

Is there any realistic chance we'll get rid of x32?
