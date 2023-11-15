Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6D27EBAA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 01:41:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HOSmQT5r;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HOSmQT5r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVPW31YMTz3dH2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 11:41:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HOSmQT5r;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HOSmQT5r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVPV83x95z3cNT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 11:41:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700008859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=STT+ATW57rth6ZYo472RqzwfiLTSlBKOqun91LfAKSQ=;
	b=HOSmQT5rZB77zafsXwiE9hilFxgBEPtW9WLurPoDIH3KEvBUixBjqL/iSWJESMSbh7vvsN
	8EO0LEPWDOkhpy/lmPl/Tlh5CXIZJxW/BMeHC6ZX1npN/uEBPiNGjRa5pSc/3PdYwE0h2A
	Zagk+X5SZKrXff29UFEMMC/lLdnzQiY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700008859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=STT+ATW57rth6ZYo472RqzwfiLTSlBKOqun91LfAKSQ=;
	b=HOSmQT5rZB77zafsXwiE9hilFxgBEPtW9WLurPoDIH3KEvBUixBjqL/iSWJESMSbh7vvsN
	8EO0LEPWDOkhpy/lmPl/Tlh5CXIZJxW/BMeHC6ZX1npN/uEBPiNGjRa5pSc/3PdYwE0h2A
	Zagk+X5SZKrXff29UFEMMC/lLdnzQiY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-77tfofzDNhCK4KwggBC1CQ-1; Tue, 14 Nov 2023 19:40:55 -0500
X-MC-Unique: 77tfofzDNhCK4KwggBC1CQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04645185A780;
	Wed, 15 Nov 2023 00:40:55 +0000 (UTC)
Received: from localhost (unknown [10.72.112.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0446112130B;
	Wed, 15 Nov 2023 00:40:53 +0000 (UTC)
Date: Wed, 15 Nov 2023 08:40:50 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/2] resource: add walk_system_ram_res_rev()
Message-ID: <ZVQTkqSa4FA6b6iH@MiWiFi-R3L-srv>
References: <20231114091658.228030-1-bhe@redhat.com>
 <20231114091658.228030-2-bhe@redhat.com>
 <20231114151745.e77ed504b3fce325f54ec08e@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114151745.e77ed504b3fce325f54ec08e@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
Cc: linux-s390@vger.kernel.org, linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, takahiro.akashi@linaro.org, ebiederm@xmission.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/14/23 at 03:17pm, Andrew Morton wrote:
> On Tue, 14 Nov 2023 17:16:57 +0800 Baoquan He <bhe@redhat.com> wrote:
> 
> > This function, being a variant of walk_system_ram_res() introduced in
> > commit 8c86e70acead ("resource: provide new functions to walk through
> > resources"), walks through a list of all the resources of System RAM
> > in reversed order, i.e., from higher to lower.
> > 
> > It will be used in kexec_file code to load kernel, initrd etc when
> > preparing kexec reboot.
> >
> > ...
> >
> > +/*
> > + * This function, being a variant of walk_system_ram_res(), calls the @func
> > + * callback against all memory ranges of type System RAM which are marked as
> > + * IORESOURCE_SYSTEM_RAM and IORESOUCE_BUSY in reversed order, i.e., from
> > + * higher to lower.
> > + */
> > +int walk_system_ram_res_rev(u64 start, u64 end, void *arg,
> > +				int (*func)(struct resource *, void *))
> > +{
> > +	struct resource res, *rams;
> > +	int rams_size = 16, i;
> > +	unsigned long flags;
> > +	int ret = -1;
> > +
> > +	/* create a list */
> > +	rams = kvcalloc(rams_size, sizeof(struct resource), GFP_KERNEL);
> > +	if (!rams)
> > +		return ret;
> > +
> > +	flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> > +	i = 0;
> > +	while ((start < end) &&
> > +		(!find_next_iomem_res(start, end, flags, IORES_DESC_NONE, &res))) {
> > +		if (i >= rams_size) {
> > +			/* re-alloc */
> > +			struct resource *rams_new;
> > +			int rams_new_size;
> > +
> > +			rams_new_size = rams_size + 16;
> > +			rams_new = kvcalloc(rams_new_size, sizeof(struct resource),
> > +					    GFP_KERNEL);
> 
> kvrealloc()?

Exactly. Will udpate. Thanks for the great suggestion.

> 
> > +			if (!rams_new)
> > +				goto out;
> > +
> > +			memcpy(rams_new, rams,
> > +					sizeof(struct resource) * rams_size);
> > +			kvfree(rams);
> > +			rams = rams_new;
> > +			rams_size = rams_new_size;
> > +		}
> > +
> > +		rams[i].start = res.start;
> > +		rams[i++].end = res.end;
> > +
> > +		start = res.end + 1;
> > +	}
> > +
> > +	/* go reverse */
> > +	for (i--; i >= 0; i--) {
> > +		ret = (*func)(&rams[i], arg);
> > +		if (ret)
> > +			break;
> > +	}
> > +
> > +out:
> > +	kvfree(rams);
> > +	return ret;
> > +}
> > +
> >  /*
> >   * This function calls the @func callback against all memory ranges, which
> >   * are ranges marked as IORESOURCE_MEM and IORESOUCE_BUSY.
> > -- 
> > 2.41.0
> 

