Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id B58FD8D069B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 17:51:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=He1fKpCW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=He1fKpCW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vp0MN1NnPz79Hv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 01:44:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=He1fKpCW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=He1fKpCW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vp0Lb6y6rz3g8S
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 01:44:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716824641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYZGz7F2HkN4H4qp3H29TFAfu9PHGhaYKuv4XtGKt7g=;
	b=He1fKpCWjfww1QGs5CGaQDL9+4X2Egrg+FtGzncu+IRpyJ88CSxpLPH0oxFNe/j+g/YLp2
	6fq7D8IUhpvhw97jmrizlMgQFqbNs+9N5ml2UO9xVyR4l43fa+WFvCTVfYxvbR8bZb/N+J
	IDms2FG8NBUfycJDn9ljJD5GLkUjhGY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716824641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jYZGz7F2HkN4H4qp3H29TFAfu9PHGhaYKuv4XtGKt7g=;
	b=He1fKpCWjfww1QGs5CGaQDL9+4X2Egrg+FtGzncu+IRpyJ88CSxpLPH0oxFNe/j+g/YLp2
	6fq7D8IUhpvhw97jmrizlMgQFqbNs+9N5ml2UO9xVyR4l43fa+WFvCTVfYxvbR8bZb/N+J
	IDms2FG8NBUfycJDn9ljJD5GLkUjhGY=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-81uDpoqWPXGPzSXE8ZL9Ew-1; Mon, 27 May 2024 11:43:59 -0400
X-MC-Unique: 81uDpoqWPXGPzSXE8ZL9Ew-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-24cb4e75ffcso15849fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2024 08:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716824638; x=1717429438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jYZGz7F2HkN4H4qp3H29TFAfu9PHGhaYKuv4XtGKt7g=;
        b=Z2B62kxhZNHJBzxoTzV22WY3h6gw8vAXBNZQl/zfvaFkw1LK3Ok8771FUc41Ikb39k
         RlL4iTsKF6IK1Jn1wFtRRtlc0+BI0ur+gJLZ1UMOgGjlv518HwS1VdbJVHrYoJWIp34L
         /6cKYwC0XcAUSI2z0/YBs8mUZjAcx75Hbff4159zCDuoBRTrE+j2P6/a9I3uCcIyMuzQ
         /EbYEXewSZP7P6NF/jUK3HBUO6cIKhPue+vL4pR6P5oCq7NvWVm0ddjwwGLs/jZACyKN
         kQR2tf8vOxmt7zVKnpjfSKgWiYm3oAO6kKHnqWU2955daoCgQxCUztwLaB1KI49CaKvi
         8y3A==
X-Forwarded-Encrypted: i=1; AJvYcCXPzW7qORn6o9WLZ0uN58ZRRDkPhkFT2BeVSfS2qEUdRGBs42NKWN9itBeCzxjws/LvCfmnSoX3V3jHeIUzHiYoeObcJ8vKFeQMSwXBqA==
X-Gm-Message-State: AOJu0Ywnrxs9yc+LCoaxUgAhQSedIQflaEnDPo41oLsuE6C0yeuMav+2
	G/qK3ktc2fPi3XA02nufMqvRYv8tBfXaCl7WSTE+R3wriLoPDNGpbTOYsR8/3lrMy88vSFyFyAo
	pPFpn/cvSkt18awaCFatLs9Kpl2tv7t7CtR4aPuCe/Ti60HbVunYNlEdiYyYNy3s=
X-Received: by 2002:a05:6358:716:b0:192:47fd:8be3 with SMTP id e5c5f4694b2df-197e5671b94mr1114624255d.3.1716824638173;
        Mon, 27 May 2024 08:43:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqu64yXCSH6zIgkGZqg9gyTi88XsJqX1EQqATRLKBAyQwdGY9SZpdiRPG6qy2xlzfZr724FA==
X-Received: by 2002:a05:6358:716:b0:192:47fd:8be3 with SMTP id e5c5f4694b2df-197e5671b94mr1114603355d.3.1716824636813;
        Mon, 27 May 2024 08:43:56 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac070c2eeasm35518706d6.19.2024.05.27.08.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 08:43:56 -0700 (PDT)
Date: Mon, 27 May 2024 11:43:54 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 12/14] mm/treewide: Remove pXd_huge()
Message-ID: <ZlSqOmvS9jkDwZub@x1n>
References: <20240318200404.448346-1-peterx@redhat.com>
 <20240318200404.448346-13-peterx@redhat.com>
 <60ea6d69-a5f8-4e7b-8c4c-e54488adfadb@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <60ea6d69-a5f8-4e7b-8c4c-e54488adfadb@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2024 at 06:03:30AM +0000, Christophe Leroy wrote:
> 
> 
> Le 18/03/2024 à 21:04, peterx@redhat.com a écrit :
> > From: Peter Xu <peterx@redhat.com>
> > 
> > This API is not used anymore, drop it for the whole tree.
> 
> Some documentation remain in v6.10-rc1:
> 
> $ git grep -w p.d_huge
> Documentation/mm/arch_pgtable_helpers.rst:| pmd_huge                  | 
> Tests a HugeTLB mapped PMD                       |
> Documentation/mm/arch_pgtable_helpers.rst:| pud_huge                  | 
> Tests a HugeTLB mapped PUD                       |
> arch/x86/mm/pat/set_memory.c:            * otherwise 
> pmd_present/pmd_huge will return true

True, I'll send a patch, thanks.

-- 
Peter Xu

