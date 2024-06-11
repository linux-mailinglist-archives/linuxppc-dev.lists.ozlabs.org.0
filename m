Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27AC903FDA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 17:20:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QhCvkfww;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QhCvkfww;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzC6v48QBz3cZn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 01:20:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QhCvkfww;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QhCvkfww;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzC694hpTz3cV5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 01:20:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718119213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T5mvQKuhxaeQQofAs6C4gb9DRnHzKICw8L5tE3p1+hQ=;
	b=QhCvkfwwH38jyY/Vk+82Kvu/nOQLw+zQ9y6gHZPxDgJwgM+t2biH7Zi4HLGHJ2G/zpumdI
	gIDlDQudSE8Bw31Sgtg+pHF7vzVm4mgEWTYlnyA1k2OXTCheRaoTmX5K1n4YCqI44Mlf5J
	d4Zmn8Fm0mnv5PdwtofP2+MgjoB0E+c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718119213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T5mvQKuhxaeQQofAs6C4gb9DRnHzKICw8L5tE3p1+hQ=;
	b=QhCvkfwwH38jyY/Vk+82Kvu/nOQLw+zQ9y6gHZPxDgJwgM+t2biH7Zi4HLGHJ2G/zpumdI
	gIDlDQudSE8Bw31Sgtg+pHF7vzVm4mgEWTYlnyA1k2OXTCheRaoTmX5K1n4YCqI44Mlf5J
	d4Zmn8Fm0mnv5PdwtofP2+MgjoB0E+c=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-1VE3SulgOU-_mRja8lVkBQ-1; Tue, 11 Jun 2024 11:20:11 -0400
X-MC-Unique: 1VE3SulgOU-_mRja8lVkBQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6b068d0a398so7818126d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 08:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718119211; x=1718724011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5mvQKuhxaeQQofAs6C4gb9DRnHzKICw8L5tE3p1+hQ=;
        b=T+w6Rj0rVQ/rT9PW11PzzgkuY9cVUU52oHZfYSbpET37DqMLv1NJ5JnkpXuQXNbkXD
         +92be31e9gnu9FyooAP7q5vCZ6uGrgUCW3UlzKtu/7s3h3ZkQOY6Te2S70oFPljh3Tpm
         e2tnznVh+AgK4X1W0fwULPYr6qBj5rUz6dgiIGzFTeWIW+TdwYl8Og5ymRRRAhW/Il6Y
         y0MIVC8qubhbiI/VIFgJWbZIB/3iX5mPiTGobFvs0IeGDUkzM6gy9T+XUmwREn0/1vV/
         qyJFIc2zlpNDAAgY0MjXX9osH3Ueqh3Y3o0oXS+oGxbDflWRjiSDVMz7DDOC4dr1Nhkc
         HMRA==
X-Forwarded-Encrypted: i=1; AJvYcCVlk0Uec9cSjDMnIV3jn1NNFpR7fSWpngy3SGypfnXggZrT7DlYaZrOemK5DzRnqR1I5OLBi8DNAGmVTm+KlBvWfii90JN4JNTUzwkiow==
X-Gm-Message-State: AOJu0Yy7CbOxFIe8bhoTB+3QcmciewmhEjwUyYUifVmuyWGD3v2npgfN
	Guk7tewYjcuz6+6U7c9f5Pbynxeu58bBApjB+Vr/kdHEgtShJC0wjI4po5oo7eAlrADiL5Eg0bu
	Sb9COk6F0R8ULfSD7eYuXC3mf87AKTKMTWxhB4/CtaKi3APTFG1bFZ4UedeZmkm4=
X-Received: by 2002:a0c:f2c4:0:b0:6b0:6a38:e01d with SMTP id 6a1803df08f44-6b06a38e41dmr101257506d6.0.1718119211074;
        Tue, 11 Jun 2024 08:20:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp29M2m3Z9CcVJeoqe5Y30dylVGZ7dKwW4YVbu6zPqN2ZAsi/IG1oHRYe8ljnYJ2xhhs21CQ==
X-Received: by 2002:a0c:f2c4:0:b0:6b0:6a38:e01d with SMTP id 6a1803df08f44-6b06a38e41dmr101257016d6.0.1718119210384;
        Tue, 11 Jun 2024 08:20:10 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4406203775bsm25557621cf.72.2024.06.11.08.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 08:20:09 -0700 (PDT)
Date: Tue, 11 Jun 2024 11:20:01 -0400
From: Peter Xu <peterx@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Message-ID: <ZmhrIdh3PLzvZU07@x1n>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
 <172b11c93e0de7a84937af2da9f80bd17c56b8c9.1717955558.git.christophe.leroy@csgroup.eu>
 <ZmgaHyS0izhtKbx6@localhost.localdomain>
 <ZmhcepJrkDpJ7mSC@x1n>
 <ZmhofWIiMC3I0aMF@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <ZmhofWIiMC3I0aMF@localhost.localdomain>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 05:08:45PM +0200, Oscar Salvador wrote:
> The problem is that we do not have spare bits for 8xx to mark these ptes
> as cont-ptes or mark them pte as 8MB, so I do not see a clear path on how
> we could remove huge_ptep_get for 8xx.

Right, I remember I thought about this too when I initially looked at one
previous version of the series, I didn't come up yet with a good solution,
but I guess we probably need to get rid of hugepd first anyway.  We may
somehow still need to identify this is a 8M large leaf, and I guess this is
again the only special case where contpte can go over >1 pmds.

> 
> I am really curious though how we handle that for THP? Or THP on 8xx
> does not support that size?

I'll leave this to Christophe, but IIUC thp is only PMD_ORDER sized, so
shouldn't apply to the 8MB pages.

Thanks,

-- 
Peter Xu

