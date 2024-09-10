Return-Path: <linuxppc-dev+bounces-1219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55485973AE6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2024 17:03:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X36QV6d7Lz2xJJ;
	Wed, 11 Sep 2024 01:03:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725980594;
	cv=none; b=oC9s1RmqYtoCluDwkIEVJ0OqnggodEQNpbdYIUGsI8yibmaYCktYXW2ijIn0ZCyG689zKPqM4ovIo9JgsV4nTX7KVsyAYu9IWMd8uhDpMD/iawNQKXt/nXAuVBsVp5x28xM78ljXt+X9FaMjBYpP5cRYg0l3npBcNN9KddWCQBDAk6YMeUIAOFwjsGhJ33XFTBUFkfi2iGt0emTUHIkF/0euVwW6k3oAk5BV0LpYJam7+7fTjo+b8uIVkdfX1hLQkYbKuv/ysoQbly9ExPxnyrUykJ3dP98/4HVpT5cEtpyeV6192gdiXRZ03isQY3YEk/R8DDyS9uxP1vgZgK08bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725980594; c=relaxed/relaxed;
	bh=NOLWN6oOPgomGiBhn0K1y3N/9IV4oAwOhduq7A0XQxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dr+jzESHbemkjE2RTdIlTM/c0hCASb/7oAS8KA+t5yLKtZKFklVGlET7uJ1YzNOmswGjVsofb3YAaLOeC7QelBH/NPWV1q1q5/LLfxb0FKseO741wZa9bRjLyD7JTclQeAXkrEgf5uFAl0t4liVHmmPn+puQbpeWvzVfL4JCVJw/UzvADymnxvJpE6PFK9uU37Y3ZLnh+bUHjGeJOb/TlXDU6+iXoQQ5b0L5Ro4R5fLfya4xflUHIN4VuH4f6BIRBLC/2MR/KM1o+jxNuQkR2MtTOWRAQ6nXeU1omWAmHGB0G6p8dtUOt/CaQRpIdEWylDTyWdetobsbNV+PBCi07w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kap4T4qZ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kap4T4qZ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rysulliv@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kap4T4qZ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kap4T4qZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rysulliv@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X36QV35Rgz2xHl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 01:03:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725980588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NOLWN6oOPgomGiBhn0K1y3N/9IV4oAwOhduq7A0XQxo=;
	b=Kap4T4qZityrcdV9X/gyOw1rzZq5YjxjYzM02tqZqy5xsgtUOzNLYLi50knZRWk7Suvq9Q
	fwLwRlYisdTE2FzhnPRJc5y4esanQMVYQ9U33ssOCNv27jBeXih44oOkBw7RfiA6yyhqyV
	h5+lZlaEOXiK6UiHG1YHJhWfmI24fQA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725980588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NOLWN6oOPgomGiBhn0K1y3N/9IV4oAwOhduq7A0XQxo=;
	b=Kap4T4qZityrcdV9X/gyOw1rzZq5YjxjYzM02tqZqy5xsgtUOzNLYLi50knZRWk7Suvq9Q
	fwLwRlYisdTE2FzhnPRJc5y4esanQMVYQ9U33ssOCNv27jBeXih44oOkBw7RfiA6yyhqyV
	h5+lZlaEOXiK6UiHG1YHJhWfmI24fQA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-434-v5mO4rvmMZWgMKfgizrC4w-1; Tue,
 10 Sep 2024 11:03:04 -0400
X-MC-Unique: v5mO4rvmMZWgMKfgizrC4w-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4CFEA195395E;
	Tue, 10 Sep 2024 15:03:02 +0000 (UTC)
Received: from sullivan-work (unknown [10.22.65.47])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E439830001A1;
	Tue, 10 Sep 2024 15:02:58 +0000 (UTC)
Date: Tue, 10 Sep 2024 11:02:56 -0400
From: "Ryan B. Sullivan" <rysulliv@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Joe Lawrence <joe.lawrence@redhat.com>, live-patching@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, pmladek@suse.com, mbenes@suse.cz,
	jikos@kernel.org, jpoimboe@kernel.org, naveen.n.rao@linux.ibm.com,
	christophe.leroy@csgroup.eu, npiggin@gmail.com
Subject: Re: [PATCH] powerpc/ftrace: restore r2 to caller's stack on
 livepatch sibling call
Message-ID: <ZuBfoBKUejKLlV5c@sullivan-work>
References: <87ed6q13xk.fsf@mail.lhotse>
 <20240815160712.4689-1-rysulliv@redhat.com>
 <9ec85e72-85dd-e9bc-6531-996413014629@redhat.com>
 <Zt8jaSQjpwtfJaVx@sullivan-work>
 <87bk0wrn1m.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bk0wrn1m.fsf@mail.lhotse>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Tue, Sep 10, 2024 at 05:21:57PM +1000, Michael Ellerman wrote:
> "Ryan B. Sullivan" <rysulliv@redhat.com> writes:
> > Hello all,
> >
> > Just wanted to ping and see if there was any further feedback or
> > questions regarding the patch?
> 

Hi Michael,

Thank you for the update.

> Hi Ryan,
> 
> I'd really like a selftest that triggers the sibling call behaviour.
> 
> As I said upthread I tried writing one but failed. Which you later
> explained is because the cross-module sibling call is not generated by
> the compiler but rather by the code being objcopy'ed (or similar).
> 
> I think it should be possible to trick the compiler into letting us do a
> cross-module sibling call by doing it in an inline asm block. Obviously
> that's non-standard, but I think it might work well enough for a test?
> 
> We have an example of calling a function within an inline asm block in
> call_do_irq().

If you think that that would be a welcome addition to the patch I can
look into adding it, especially if you are busy at the moment.

> 
> I'll try to find time to get that done, but I can't promise when.
> 
> cheers
> 

Cheers,

Ryan


