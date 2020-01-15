Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B6613CDA9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 21:04:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ydZr6933zDqQq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 07:04:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=swood@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=dt5/plw3; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ydWc2J4XzDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 07:01:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579118502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ULVcAFsDzQbnAOV/nYIJG5zkQI1S5pwiGA0O6Cbzs8g=;
 b=dt5/plw32RyzXrn2Q2WInOVEcDHIpKqTX1wI97z6kV+c4PPm9lym/ya6jAU5GwlN6ANjEy
 g+9aDoX4WVLS2JqJ3dv6AOg7PMKs1bpo7ZotT+g+D5HzY3LtCoM5Ov8u1lnRCdF05nE7MC
 q2Rh6P9wF9HvKIk8TbelHsSZzKtAe6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-bfw37kzCOy2nsPZxAgHQLg-1; Wed, 15 Jan 2020 15:01:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8199210054E3;
 Wed, 15 Jan 2020 20:01:37 +0000 (UTC)
Received: from ovpn-120-231.rdu2.redhat.com (ovpn-120-231.rdu2.redhat.com
 [10.10.120.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BE2A5DA70;
 Wed, 15 Jan 2020 20:01:36 +0000 (UTC)
Message-ID: <9f3311d12d418b87832ba5de1372bb76ffccbd45.camel@redhat.com>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
From: Scott Wood <swood@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Timur Tabi <timur@kernel.org>
Date: Wed, 15 Jan 2020 14:01:35 -0600
In-Reply-To: <20200116064234.7a139623@canb.auug.org.au>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <CAOZdJXXiKgz=hOoiaTrxgbnwzyvp1Zfn3aCz+0__i17vyFngRg@mail.gmail.com>
 <20200114072522.3cd57195@canb.auug.org.au>
 <6ec4bc30-0526-672c-4261-3ad2cf69dd94@kernel.org>
 <20200114173141.29564b25@canb.auug.org.au>
 <1d8f8ee6-65ac-de6c-0e0b-c9bb499c0e02@kernel.org>
 <20200116064234.7a139623@canb.auug.org.au>
Organization: Red Hat
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: bfw37kzCOy2nsPZxAgHQLg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 york sun <york.sun@nxp.com>, Jiri Slaby <jslaby@suse.com>,
 PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>, b08248@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-01-16 at 06:42 +1100, Stephen Rothwell wrote:
> Hi Timur,
> 
> On Wed, 15 Jan 2020 07:25:45 -0600 Timur Tabi <timur@kernel.org> wrote:
> > On 1/14/20 12:31 AM, Stephen Rothwell wrote:
> > > +/**
> > > + * ev_byte_channel_send - send characters to a byte stream
> > > + * @handle: byte stream handle
> > > + * @count: (input) num of chars to send, (output) num chars sent
> > > + * @bp: pointer to chars to send
> > > + *
> > > + * Returns 0 for success, or an error code.
> > > + */
> > > +static unsigned int ev_byte_channel_send(unsigned int handle,
> > > +	unsigned int *count, const char *bp)  
> > 
> > Well, now you've moved this into the .c file and it is no longer 
> > available to other callers.  Anything wrong with keeping it in the .h
> > file?
> 
> There are currently no other callers - are there likely to be in the
> future?  Even if there are, is it time critical enough that it needs to
> be inlined everywhere?

It's not performance critical and there aren't likely to be other users --
just a matter of what's cleaner.  FWIW I'd rather see the original patch,
that keeps the raw asm hcall stuff as simple wrappers in one place.

-Scott


