Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC8A1B57F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 14:06:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452fg72XjPzDqGx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 22:06:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=newverein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452fdR4ZkGzDqFv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 22:04:57 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 4D9D868AFE; Mon, 13 May 2019 14:04:35 +0200 (CEST)
Date: Mon, 13 May 2019 14:04:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH, RFC] byteorder: sanity check toolchain vs kernel endianess
Message-ID: <20190513120435.GB22993@lst.de>
References: <20190412143538.11780-1-hch@lst.de>
 <CAK8P3a2bg9YkbNpAb9uZkXLFZ3juCmmbF7cRw+Dm9ZiLFno2OQ@mail.gmail.com>
 <fd59e6e22594f740eaf86abad76ee04d@mailhost.ics.forth.gr>
 <CACT4Y+aKGKm9Wbc1owBr51adkbesHP_Z81pBAoZ5HmJ+uZdsaw@mail.gmail.com>
 <CAK8P3a3xRBZrgv16sSigJhY0vGmb=qF9o=6dC_5DqAJtW3qPGQ@mail.gmail.com>
 <CACT4Y+ad5z6z0Dweh5hGwYcUUebPEtqsznmX9enPvYB20J16aA@mail.gmail.com>
 <87woiutwq4.fsf@concordia.ellerman.id.au>
 <CACT4Y+YT52wGuARxe9RqUsMYGNZTwaBowWWUUawyqTBq4G1NDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+YT52wGuARxe9RqUsMYGNZTwaBowWWUUawyqTBq4G1NDg@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 13, 2019 at 01:50:19PM +0200, Dmitry Vyukov wrote:
> > We did have some bugs in the past (~1-2 y/ago) but AFAIK they are all
> > fixed now. These days I build most of my kernels with a bi-endian 64-bit
> > toolchain, and switching endian without running `make clean` also works.
> 
> For the record, yes, it turn out to be a problem in our code (a latent
> bug). We actually used host (x86) gcc to build as-if ppc code that can
> run on the host, so it defined neither LE no BE macros. It just
> happened to work in the past :)

So Nick was right and these checks actually are useful..
