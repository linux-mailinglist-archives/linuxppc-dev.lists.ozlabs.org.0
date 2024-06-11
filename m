Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A306590465A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 23:44:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xy5AzKOw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NzgrW2Bp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzMdd4yPdz3gDK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 07:44:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xy5AzKOw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NzgrW2Bp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzMcs3b6kz3dS9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 07:43:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718142229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hTou1qm81TgVNA2Djt+o16mxlwm2tQTw5dfTSjdkG/I=;
	b=Xy5AzKOwcRto83bhZi11MuyEqv2a6xuWF5UhzhobZSQUhl3HC8XzSeHN9PMIupzH2GXEUn
	N7zGAWicqg35VdOXeAJn7sKu6+2rosWYxctx2tVNSgAZSI7VH07vyAjr1oCcEa6zlcnf3x
	IEU7hApo+I3NP9EeTvggsb+osdarkYM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718142230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hTou1qm81TgVNA2Djt+o16mxlwm2tQTw5dfTSjdkG/I=;
	b=NzgrW2BpcviHqPGm3MqQIVWMwmno3zoI439OGb1DdA1lofZjHqzETYSBrhw4Bm/fEMwqin
	rLqN2w48/faSy/o8AiKMY7DGQmB39pxCu0r8IY421+5ljjqpTP/SLj6271rvweLj0m0UfL
	wreEOtyeKXu4H0u6LDqNPETAsSi25zs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-thiagCA0PYq3xePZnu13HA-1; Tue, 11 Jun 2024 17:43:47 -0400
X-MC-Unique: thiagCA0PYq3xePZnu13HA-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6b06c786b64so3824936d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 14:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718142227; x=1718747027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTou1qm81TgVNA2Djt+o16mxlwm2tQTw5dfTSjdkG/I=;
        b=VF5trzR0pZjV/PP1Z93OIkFYLCdrPqgG+3eQmWEdNJZ8xAW07t8l6RLbEoaRuhdi1x
         6L3sHUJ9D//Yixu5AxEXBITTWWFMlAeDup9AGxhoK/8CjoJFtxKar2vmAYdDJF9cLOPQ
         9txDf3Ud0S7rGyy1aiZrhB39JueXdNNBay1pIvbjS6VN3SJBqNy5XNOR/sUVjTt61OG9
         Cjxm3K7pOSqNmZLsSxLCeiuupG4B8fen3vwAu6ld2QPVxLq6pq8iCpHEzaw75ayLCL4r
         8Uw7EKQis0F81K9+wurakwrZABYADW/70UsaGV9tJJZZZsUty2PkSlgK1J+nX0ckqbx2
         lixA==
X-Forwarded-Encrypted: i=1; AJvYcCXTp5DdamVxu/L/W1DiLrQQMWBtbBqGkRLsciQzUjSHbme1AsqgROYLCxSuevX7ZE4taDVshpvUN3gXiLO8sFGfri0XfYAVrppDq6H3kg==
X-Gm-Message-State: AOJu0YyqhkrA7jqxf+qFganN/m4uMrO7PkQ6O+9+XZpIWgg8prx3sl5E
	KP6gSVn9pylrTszuSAuMmUkh+hnVeBlNpW5/hv6PJhlkpP7vCnNvIsxAH1rjOhXujcn8JIt9Y+x
	GjmQlPFzxUQNBSsDh+sF3SULZ4yT3d5Ys4Zz0WBAYJj8V5wCuDX7z+iFjc1cr94A=
X-Received: by 2002:a05:6214:1c84:b0:6af:f955:3a92 with SMTP id 6a1803df08f44-6b05985d61dmr145506626d6.0.1718142227183;
        Tue, 11 Jun 2024 14:43:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOa0/b65UqaWampbYi2ciS5tODEVjHDgAJKDJEJxgPSIVwH0ULUwrYdhk3hQqSpzGqunDNJA==
X-Received: by 2002:a05:6214:1c84:b0:6af:f955:3a92 with SMTP id 6a1803df08f44-6b05985d61dmr145506356d6.0.1718142226586;
        Tue, 11 Jun 2024 14:43:46 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f984940sm61002196d6.89.2024.06.11.14.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 14:43:46 -0700 (PDT)
Date: Tue, 11 Jun 2024 17:43:43 -0400
From: Peter Xu <peterx@redhat.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Subject: Re: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Message-ID: <ZmjFD8jRt4JkKbxN@x1n>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
 <172b11c93e0de7a84937af2da9f80bd17c56b8c9.1717955558.git.christophe.leroy@csgroup.eu>
 <ZmgaHyS0izhtKbx6@localhost.localdomain>
 <ZmhcepJrkDpJ7mSC@x1n>
 <ZmhofWIiMC3I0aMF@localhost.localdomain>
 <ZmhrIdh3PLzvZU07@x1n>
 <Zmh282yJjxc7zqbL@localhost.localdomain>
 <e9583aa5-4ad7-4bcf-b3ff-f42b983231f5@cs-soprasteria.com>
MIME-Version: 1.0
In-Reply-To: <e9583aa5-4ad7-4bcf-b3ff-f42b983231f5@cs-soprasteria.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 07:00:14PM +0000, LEROY Christophe wrote:
> But what about something like
> 
> static inline pte_t pmd_pte(pmd_t pmd)
> {
> 	return *(pte_t *)pmd_page_vaddr(pmd);
> }
> 
> Would it do the trick ?
> 
> Of course it would require to carefully make sure all accesses are done 
> through pmd_pte().
> 
> Would that work ?

Looks possible to me. It's just that we may miss some spots, and it can
hide in the details.

I'm looking at Power's pmd_access_permitted() right below pmd_write(),
which indeed uses pmd_pte() already. However before that there's also the
other call to pmd_is_serializing(), which doesn't look alright to work on
pgtable pages..  In this case maybe it's easy, as I assume pgtable page is
stable.  Didn't further look, though.

Said that, this doesn't look like a blocker. So maybe worth trying if we're
careful and with some good testing coverages.

Thanks,

-- 
Peter Xu

