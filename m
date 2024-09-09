Return-Path: <linuxppc-dev+bounces-1189-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F75C971F53
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 18:34:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2XTs0Ql3z2yQn;
	Tue, 10 Sep 2024 02:34:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725899649;
	cv=none; b=bG6rvTErVQni9jg6SatYXTBiaRlAYiH3PgLQl62VlUdd1a/s7PmjQT5xHPbUPjNCUnY1PvOz2l6yhe0226QPj7gfcNBF93s2j7IBn4SBOIHp9BP3BvAXYiUB05PUtVPoK7NySVG8+OfGZqnzw+w7kZHmw4YAcZf/HYogIix71dIzg22kBACQ1NUO5sqTMx+zTjbjhyj+3E+Mn+nkLQAyhO4prVYKGJrMmiZpuhN2rO7NPI3HyPcwcxkdrMgcVKiJCismLqm6cy9EO/aJ/RYBbvm3o/BE9oZtKhX53t+EsGoT52WhRRm8Yw/4wipDo/vJqPU7Eg2GxlJDV9jBvuMCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725899649; c=relaxed/relaxed;
	bh=njyAw6Qco0Epfex9ue5oV/2XA/8xT3xiq9OESk/+LPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lufV+f9GhRfFG4aHliiDb8YbYEnWzy2Qjm3dDfH8tUMumnwnEnipxmmO3QezwCaSREInhq/f2ljFgVpBaJWzIcpNdciarTm6c8x+tPjfZ2e+1NcDOUUwO+wK0rDNU0Y8JBmu25Zx0SFWYsnjwgMmV+Zpke0aJsoMXmFmN/x0DiTKKP78AoIya4IUM809lRZA4958Y+21KduoMED8STvOTEG0kihb0+w2rUkhNvre8WNiP9DKJkdS8eqZM8C0bwmWMCftzoT3MTdZiVQSvFh8ZHlHn4XZRPXh2ROXInHLyciJhlIzLGDn2pJsB+ske5qsFCG+GpL3uW7n7LsK+hRgFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ShHXBck1; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ShHXBck1; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rysulliv@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ShHXBck1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ShHXBck1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rysulliv@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2XTr2mczz2yPR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 02:34:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725899640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=njyAw6Qco0Epfex9ue5oV/2XA/8xT3xiq9OESk/+LPA=;
	b=ShHXBck1Nw7arHbmgMIgOIVa0YMRSMARMPb2iYq6ffhBDbNIrmKsDcbLzhy2+C40qTDBuP
	8u/XNvBKtju+KAbkZfW8/NLKKiEpSyl0onvgznNDDwvD/iqO+IC+GkiCZI4ai9c/QHnnqy
	bwnYdgE8HuAfOIMCzTm6APWITZFlans=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725899640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=njyAw6Qco0Epfex9ue5oV/2XA/8xT3xiq9OESk/+LPA=;
	b=ShHXBck1Nw7arHbmgMIgOIVa0YMRSMARMPb2iYq6ffhBDbNIrmKsDcbLzhy2+C40qTDBuP
	8u/XNvBKtju+KAbkZfW8/NLKKiEpSyl0onvgznNDDwvD/iqO+IC+GkiCZI4ai9c/QHnnqy
	bwnYdgE8HuAfOIMCzTm6APWITZFlans=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-2N4Dzd8JN7-keabLSWWOHw-1; Mon,
 09 Sep 2024 12:33:54 -0400
X-MC-Unique: 2N4Dzd8JN7-keabLSWWOHw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E39A51955DCE;
	Mon,  9 Sep 2024 16:33:51 +0000 (UTC)
Received: from sullivan-work (unknown [10.22.65.158])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D591195608A;
	Mon,  9 Sep 2024 16:33:47 +0000 (UTC)
Date: Mon, 9 Sep 2024 12:33:45 -0400
From: "Ryan B. Sullivan" <rysulliv@redhat.com>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	pmladek@suse.com, mbenes@suse.cz, jikos@kernel.org,
	jpoimboe@kernel.org, naveen.n.rao@linux.ibm.com,
	christophe.leroy@csgroup.eu, mpe@ellerman.id.au, npiggin@gmail.com
Subject: Re: [PATCH] powerpc/ftrace: restore r2 to caller's stack on
 livepatch sibling call
Message-ID: <Zt8jaSQjpwtfJaVx@sullivan-work>
References: <87ed6q13xk.fsf@mail.lhotse>
 <20240815160712.4689-1-rysulliv@redhat.com>
 <9ec85e72-85dd-e9bc-6531-996413014629@redhat.com>
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
In-Reply-To: <9ec85e72-85dd-e9bc-6531-996413014629@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hello all,

Just wanted to ping and see if there was any further feedback or
questions regarding the patch?

--
Ryan


