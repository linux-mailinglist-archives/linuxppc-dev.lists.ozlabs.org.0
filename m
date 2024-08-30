Return-Path: <linuxppc-dev+bounces-790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFB59657A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 08:31:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww7Zd173hz303B;
	Fri, 30 Aug 2024 16:31:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724999465;
	cv=none; b=MSSnPKpCfoHrAy2Kg0eWo6XntNeHOgnC0AHnPeHWYNld6odJgdfRuHHmFOupmUz4v9C/+fz66q6ntDF89O79DQKQA0dNvmoY7+D2isyG7N/HgKVxbCsLeFJOJ7e2+1dvcXAedBiQo90yeFCr0klu9WNRb0bJO89/Baq/0qMhpQYJ0tu3VdcNSA06wlRRSsVZwkJsKo+7z3NFmcx6LfSc0RXDWqrj9dk/WQFrI3IHNTetz/nE88/qgDbeMT/Knbk9xI/wCbWC/RXrKxTqpCVLStLwUvHnlB2fooBwFM1ICReL7mE5pXB0mCv0ie3+oYLLvzymIoh37o5OHDOuhD0VBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724999465; c=relaxed/relaxed;
	bh=5rxQOV0U9jos/ewQUlBldN7ZSJbrE3k5eVCijlLXnUk=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Scanned-By; b=ozTyHxr+36Xdzou9yrRZODmnkgTzNDwA1ZfsjlhPjF6lnK1J36E3/kb7J+c//3MVMei6ysY+mUy0KwUKF4+8SVGT3SKk9YVSb8QumlR6959/ZkTf2q1cOYfXxZdqNu/KkO00kTLVT9prloe89W0xN8BQHZaGRdCkOEPpN8CAxy2tvZkVX0IxP2ibpDLXkNNJpW66aRb4KOLF2GSAiriFjRlKalu0qv+S4oQyOWXw8lTT19zMJdFIht4s2xB1M21/dhTYfLX0NSCCk7gZKE8SkDtQvTOjtmO5f187Xair+6L8k0q6ozEnHZeZVv1mxzDzXjyy/7z/+Vu9jnjd4NdSHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bpN9Li1t; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bpN9Li1t; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bpN9Li1t;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bpN9Li1t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww7Zc4YKqz302W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 16:31:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724999458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5rxQOV0U9jos/ewQUlBldN7ZSJbrE3k5eVCijlLXnUk=;
	b=bpN9Li1t7xMvRTpMqP0BBSRWa7VgakCU1hfgKDVxKX0pieF6T9H3Nu94NJYvvFRPI0CZq4
	O8tHQXfFIwpmLUDcVAz5MCWnMB7rJUHFLtTNq0wAQUbRVtNFeRv51tr6bz0ZS73eM3MPGE
	ERr2YW4NiWvjRLCg2arRkJJRJgPPr3U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724999458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5rxQOV0U9jos/ewQUlBldN7ZSJbrE3k5eVCijlLXnUk=;
	b=bpN9Li1t7xMvRTpMqP0BBSRWa7VgakCU1hfgKDVxKX0pieF6T9H3Nu94NJYvvFRPI0CZq4
	O8tHQXfFIwpmLUDcVAz5MCWnMB7rJUHFLtTNq0wAQUbRVtNFeRv51tr6bz0ZS73eM3MPGE
	ERr2YW4NiWvjRLCg2arRkJJRJgPPr3U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-u30SmAoyMdqFmu6gfgZuwQ-1; Fri,
 30 Aug 2024 02:30:53 -0400
X-MC-Unique: u30SmAoyMdqFmu6gfgZuwQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AC2E19560B1;
	Fri, 30 Aug 2024 06:30:51 +0000 (UTC)
Received: from localhost (unknown [10.72.112.42])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3990E1955F35;
	Fri, 30 Aug 2024 06:30:48 +0000 (UTC)
Date: Fri, 30 Aug 2024 14:30:45 +0800
From: Baoquan He <bhe@redhat.com>
To: Dave Vasilevsky <dave@vasilevsky.ca>
Cc: glaubitz@physik.fu-berlin.de, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, mpe@ellerman.id.au,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	Reimar =?iso-8859-1?Q?D=F6ffinger?= <Reimar.Doeffinger@gmx.de>
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
Message-ID: <ZtFnFaHfh09wOw6o@MiWiFi-R3L-srv>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
 <ZtE5Z/gDR1WixG9S@MiWiFi-R3L-srv>
 <1568b378-5592-4d23-a572-4e09f3996331@vasilevsky.ca>
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
In-Reply-To: <1568b378-5592-4d23-a572-4e09f3996331@vasilevsky.ca>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 08/29/24 at 11:37pm, Dave Vasilevsky wrote:
> On 2024-08-29 23:15, Baoquan He wrote:
> >> +config ARCH_DEFAULT_CRASH_DUMP
> >> +	def_bool n
> > 
> > If we don't add ARCH_DEFAULT_CRASH_DUMP at all in sh arch, the
> > CRASH_DUMP will be off by default according to the below new definition
> > of CRASH_DUMP?
> 
> Yes, that's true. But if we don't add it at all in sh arch, it looks confusing
> in the search feature of menuconfig:
> 
> > Symbol: ARCH_DEFAULT_CRASH_DUMP [=ARCH_DEFAULT_CRASH_DUMP]
> > Type  : unknown
> 
> So I thought it was better to explicitly set it to 'n'. What do you think?

If so, better adding it. Thanks.


