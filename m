Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F113A083
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 06:23:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xf4B5cFQzDqNV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 16:23:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=swood@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=SRil7agZ; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xf2W16qlzDqJj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 16:21:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578979293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CP3JmddbXvQv1k+0a5E//Tv08qc4ZbZCNB805rOsr3Y=;
 b=SRil7agZaZWI+xpT75UXNa36YYPPGvPLAycGchIHlHK7+enzC74dDZqMfuzmARO2lB+brb
 RZ5IvyFnCwx0UIsCvHkj/6cC3gDUPstBot96KhEMxxMDA/7o2CkCBWSEVFOhcD9aS6yR/F
 4WInA1Oe/0BxuxKv358X0M53AE0VLKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-qjvvrBKvOuCVr3Cimjtgug-1; Mon, 13 Jan 2020 20:17:54 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DCE2107ACC5;
 Tue, 14 Jan 2020 01:17:52 +0000 (UTC)
Received: from ovpn-120-231.rdu2.redhat.com (ovpn-120-231.rdu2.redhat.com
 [10.10.120.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BED925DA7B;
 Tue, 14 Jan 2020 01:17:50 +0000 (UTC)
Message-ID: <e5b585dffdaf0608e6d5d1cfac288d02e09d384d.camel@redhat.com>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
From: Scott Wood <swood@redhat.com>
To: Timur Tabi <timur@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 13 Jan 2020 19:17:49 -0600
In-Reply-To: <726a71ce-b9e6-cec4-a4d0-ec6a8c604989@kernel.org>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <CAOZdJXXiKgz=hOoiaTrxgbnwzyvp1Zfn3aCz+0__i17vyFngRg@mail.gmail.com>
 <20200114072522.3cd57195@canb.auug.org.au>
 <6ec4bc30-0526-672c-4261-3ad2cf69dd94@kernel.org>
 <726a71ce-b9e6-cec4-a4d0-ec6a8c604989@kernel.org>
Organization: Red Hat
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: qjvvrBKvOuCVr3Cimjtgug-1
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

On Mon, 2020-01-13 at 19:13 -0600, Timur Tabi wrote:
> On 1/13/20 7:10 PM, Timur Tabi wrote:
> > I would prefer that ev_byte_channel_send() is updated to access only 
> > 'count' bytes.  If that means adding a memcpy to the 
> > ev_byte_channel_send() itself, then so be it.  Trying to figure out how 
> > to stuff n bytes into 4 32-
> > bit registers is probably not worth the effort.
> 
> Looks like ev_byte_channel_receive() has the same bug, but in reverse.

It only has one user, which always passes in a 16-byte buffer.

-Scott


