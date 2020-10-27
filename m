Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52D29A9D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 11:39:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CL7W54QRczDqQD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 21:39:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhowells@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aGg/qZd8; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=aGg/qZd8; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CL7Td1sBvzDqNW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 21:38:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603795106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CCFkL5YPwZhrmFegn8R+P6Gr+wPqzLjyH+PKfuNRXxY=;
 b=aGg/qZd8duSzJ8OcvoNw9Pe8uHtg0UkMqhfqlNKadThrMW/Xl47mv4n1v7qTICY8EzCy7K
 oU+FlTBepRju3oi+XjSjGFzSeeG7THct00U582f2cMAS8XvHUGhIU4vKEs09INKnsP7+61
 T5r8kcwwuya+dmQPUCvQWeYPDeg9M9o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603795106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CCFkL5YPwZhrmFegn8R+P6Gr+wPqzLjyH+PKfuNRXxY=;
 b=aGg/qZd8duSzJ8OcvoNw9Pe8uHtg0UkMqhfqlNKadThrMW/Xl47mv4n1v7qTICY8EzCy7K
 oU+FlTBepRju3oi+XjSjGFzSeeG7THct00U582f2cMAS8XvHUGhIU4vKEs09INKnsP7+61
 T5r8kcwwuya+dmQPUCvQWeYPDeg9M9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-Tghq4TRVMxClG5BzL4_sXw-1; Tue, 27 Oct 2020 06:38:22 -0400
X-MC-Unique: Tghq4TRVMxClG5BzL4_sXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB843100F967;
 Tue, 27 Oct 2020 10:38:20 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-70.rdu2.redhat.com
 [10.10.120.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD8176EF57;
 Tue, 27 Oct 2020 10:38:18 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20201027095455.GA30298@lst.de>
References: <20201027095455.GA30298@lst.de>
 <3088368.1603790984@warthog.procyon.org.uk>
 <20200827150030.282762-3-hch@lst.de> <20200827150030.282762-1-hch@lst.de>
 <3155818.1603792294@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/10] fs: don't allow splice read/write without explicit
 ops
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3161302.1603795098.1@warthog.procyon.org.uk>
Date: Tue, 27 Oct 2020 10:38:18 +0000
Message-ID: <3161303.1603795098@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@lst.de> wrote:

> > That said, for afs at least, the fix seems to be just this:
> 
> And that is the correct fix, I was about to send it to you.

Thanks.

David

