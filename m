Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC61F661C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 13:00:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jLVn1BxkzDqr6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jun 2020 21:00:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=oleg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=B8EUJRx+; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=B8EUJRx+; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jLSn1K2CzDqnF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 20:58:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591873124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xsI8dawBpC+7XupP+pkPY6TXUqe3ihbrIjlqp72MMqs=;
 b=B8EUJRx+vLNJdxjHft82Gf/V07YDEuHEDHMpfO8Zft9Q/cOGR/ZEdo9vMLvcZZZplJn8Xh
 VNxXCR73vylXzvGgV5F6wHaDGIpv56vpviGKXgZu7r7mqgBFNrkKMXeBkGoZE4fpIJBruw
 6o0kop4dusQyZiEtYl8Xh+axioe9lp0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591873124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xsI8dawBpC+7XupP+pkPY6TXUqe3ihbrIjlqp72MMqs=;
 b=B8EUJRx+vLNJdxjHft82Gf/V07YDEuHEDHMpfO8Zft9Q/cOGR/ZEdo9vMLvcZZZplJn8Xh
 VNxXCR73vylXzvGgV5F6wHaDGIpv56vpviGKXgZu7r7mqgBFNrkKMXeBkGoZE4fpIJBruw
 6o0kop4dusQyZiEtYl8Xh+axioe9lp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-1u-74tPAPfGxpdUJpFtgzA-1; Thu, 11 Jun 2020 06:58:39 -0400
X-MC-Unique: 1u-74tPAPfGxpdUJpFtgzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAC24107ACF2;
 Thu, 11 Jun 2020 10:58:37 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.195.101])
 by smtp.corp.redhat.com (Postfix) with SMTP id 3D7167BE62;
 Thu, 11 Jun 2020 10:58:32 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Thu, 11 Jun 2020 12:58:37 +0200 (CEST)
Date: Thu, 11 Jun 2020 12:58:31 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH? v2] powerpc: Hard wire PT_SOFTE value to 1 in gpr_get()
 too
Message-ID: <20200611105830.GB12500@redhat.com>
References: <20190917121256.GA8659@redhat.com>
 <20190917143753.GA12300@redhat.com>
 <20200610150224.GA6793@redhat.com>
 <321e6865-1762-c459-56c4-0cc89c7c2a7e@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <321e6865-1762-c459-56c4-0cc89c7c2a7e@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Jan Kratochvil <jan.kratochvil@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/11, Madhavan Srinivasan wrote:
>
>
> On 6/10/20 8:37 PM, Oleg Nesterov wrote:
> >Hi,
> >
> >looks like this patch was forgotten.
>
> yep, I missed this. But mpe did have comments for the patch.
>
> https://lkml.org/lkml/2019/9/19/107

Yes, and I thought that I have replied... apparently not, sorry!

So let me repeat, I am fine either way, I do not understand this
ppc-specific code and I can't really test this change.

Let me quote that email from Michael:

	> We could do it like below. I'm 50/50 though on whether it's worth it, or
	> if we should just go with the big ifdef like in your patch.
	
up to you ;)

Hmm. And yes,

> >>This is not consistent and this breaks
> >>http://sourceware.org/systemtap/wiki/utrace/tests/user-regs-peekpoke

this is 404.

Jan, could correct the link above?

Oleg.

