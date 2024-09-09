Return-Path: <linuxppc-dev+bounces-1157-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC834970BDC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 04:35:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X29tT1R5Pz2xsK;
	Mon,  9 Sep 2024 12:35:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725849345;
	cv=none; b=Og9vIeMTbc+n5GCJ9GBhSWWGwGjMlcvMJPIO25MHM99uV8IyL7Lu3fSmXOUwHl6JLyCBoIY19NtXHMozC7RFJMA/62ku4U3YKejqWxy6gXGyf2j1ibj44+J7VpfA5Q2JFvKbBw8ja8XpLNq+kH2QD8ybet4Qm8XCFiK2EuV0LVPJ/aOO97YQYFHWoiWAZKxbk/MuDPhNrR11ImoiSrPyw800tGfhWdQK+haF4A/njnjBPa/DMEWdoDU9uiZh7nU+3XQL9mTyYLp3kBD0QTQjEu1dTrLamHFx/n4MllW2bpa2zGEMDvagbCPJGACl6kXBAgmzCAMVWIeUjFUkT7g7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725849345; c=relaxed/relaxed;
	bh=ZjtEHt8bSvmRde39BXklX+Lti/JhyV/GdXZeYzGRgUo=;
	h=DKIM-Signature:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=nrGf5LwuocYu4qdXMcEXfVmSuhPRPGOtryEDOPR9zii6qKrn+UguzJejur7B+lEw7a/ERAVfs4SsZaLQtRTEqXg19p0UqecEJ5n8dLJACd7IdwRxLVk64oIvWzqqF7WTOB4FbMgBQcIrOj2KzEDN7amwYenqmb5StMi+0kJoEfy7+ADPrlil6xc0f3JOzu8/s/B3tf3avx9EALs1d0tmMUxIvrGVGdonFnXI3u3TthU+RzxYp/mxnqArQW3d40Q+MQXHs55clpnKMHltsglNB54unM21o32EZz0tE11CxllbD7ZGSJywBE0b2bCI0KKRWk0MUrVpnOjUPQDPRqUXUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e9UYE6GE; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e9UYE6GE; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e9UYE6GE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e9UYE6GE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X29tS50tLz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 12:35:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725849339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjtEHt8bSvmRde39BXklX+Lti/JhyV/GdXZeYzGRgUo=;
	b=e9UYE6GEqpm9bYB5qDcvBlLjMB0i4ZET+ji2xlowXXlBTnydu7JR/uKX0a7ONXfuJGwI3n
	Tp+u2czsEZB6HGKZSMKPklcfztSHt5oYG1yIEww/oQJ2AttJNYIfyIcLVbrQA6aJYpx8EN
	TkujswjrzXs5Dtv/4U8gEW9X+gMMgls=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725849339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjtEHt8bSvmRde39BXklX+Lti/JhyV/GdXZeYzGRgUo=;
	b=e9UYE6GEqpm9bYB5qDcvBlLjMB0i4ZET+ji2xlowXXlBTnydu7JR/uKX0a7ONXfuJGwI3n
	Tp+u2czsEZB6HGKZSMKPklcfztSHt5oYG1yIEww/oQJ2AttJNYIfyIcLVbrQA6aJYpx8EN
	TkujswjrzXs5Dtv/4U8gEW9X+gMMgls=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-608-stwFWWh1NuS5XhhFDaflqA-1; Sun,
 08 Sep 2024 22:35:37 -0400
X-MC-Unique: stwFWWh1NuS5XhhFDaflqA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24C7119560A5;
	Mon,  9 Sep 2024 02:35:35 +0000 (UTC)
Received: from localhost (unknown [10.72.112.58])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0DB3C1956086;
	Mon,  9 Sep 2024 02:35:32 +0000 (UTC)
Date: Mon, 9 Sep 2024 10:35:27 +0800
From: Baoquan He <bhe@redhat.com>
To: Dave Vasilevsky <dave@vasilevsky.ca>
Cc: glaubitz@physik.fu-berlin.de, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, mpe@ellerman.id.au,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	Reimar =?iso-8859-1?Q?D=F6ffinger?= <Reimar.Doeffinger@gmx.de>
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
Message-ID: <Zt5e72DEl0K8cQe9@MiWiFi-R3L-srv>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
 <c04fe24a-26e6-44b5-a2dd-00eac589e36b@vasilevsky.ca>
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
In-Reply-To: <c04fe24a-26e6-44b5-a2dd-00eac589e36b@vasilevsky.ca>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 09/08/24 at 03:57pm, Dave Vasilevsky wrote:
> I received a notification from Patchwork that my patch is now in the state "Handled Elsewhere".[0] Does that mean someone merged it somewhere? Or that I should be using a different mailing list? Or something else?

I guess it's powerpc dev's patchwork which automatically grabs this
patch to do some testing? Becuase ppc list is added in the CC. I don't
think this patch has been picked by people because this is an old v1 and
there's concern about it.


