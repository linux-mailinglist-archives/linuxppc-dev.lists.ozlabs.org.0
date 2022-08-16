Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9430595AFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 13:57:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6V4m6DhFz3bhF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 21:57:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=v8PP2Y7z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=v8PP2Y7z;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6V4C0V5Hz3bbQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 21:56:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8D263B816AA;
	Tue, 16 Aug 2022 11:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACE5C433D6;
	Tue, 16 Aug 2022 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1660650995;
	bh=FVUSKZvyxeYHla7DAI1S7uQ9b45W1lFMmWt54ll5JlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v8PP2Y7zNU+FVQizPga9MODb0WFzHKVad+1VohxTjTDc+95kRo6+FlTlwZiET+gOj
	 rI3kpk1WipL/kLv/6gv0XXNK+NrFFcDJFwt2vngBa+mVLRX7m5i+DafP+blpINyKqM
	 iF0Qnt+XnOywNTiwwOBU918gkxWz6UVgzOTVIBMA=
Date: Tue, 16 Aug 2022 13:56:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
Subject: Re: [PATCH v2 1/4] Make place for common balloon code
Message-ID: <YvuF8CsP0M1TAK1a@kroah.com>
References: <20220816094117.3144881-1-alexander.atanasov@virtuozzo.com>
 <20220816094117.3144881-2-alexander.atanasov@virtuozzo.com>
 <YvtoDxvefWUJBfAS@kroah.com>
 <f88fe469-d4a4-3240-b325-a745255bf01c@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f88fe469-d4a4-3240-b325-a745255bf01c@virtuozzo.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, kernel@openvz.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 16, 2022 at 02:47:22PM +0300, Alexander Atanasov wrote:
> Hello,
> 
> On 16.08.22 12:49, Greg Kroah-Hartman wrote:
> > On Tue, Aug 16, 2022 at 12:41:14PM +0300, Alexander Atanasov wrote:
> 
> > >   rename include/linux/{balloon_compaction.h => balloon_common.h} (99%)
> > 
> > Why rename the .h file?  It still handles the "balloon compaction"
> > logic.
> 
> File contains code that is common to balloon drivers,
> compaction is only part of it. Series add more code to it.
> Since it was suggested to use it for such common code.
> I find that common becomes a better name for it so the rename.
> I can drop the rename easy on next iteration if you suggest to.

"balloon_common.h" is very vague, you should only need one balloon.h
file in the include/linux/ directory, right, so of course it is "common"
:)

thanks,

greg "naming is hard" k-h
