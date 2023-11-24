Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7153A7F7897
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 17:08:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RlFsV7mZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RlFsV7mZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScKfT2YJsz3vdm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 03:08:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RlFsV7mZ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RlFsV7mZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScKdZ40YDz3d8p
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 03:08:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700842079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=suN3V9rM6JohMwlCsG7PmWxd2SZ7oRR+3sWHfaA95QU=;
	b=RlFsV7mZ9Lb9QzQIvEy/FOIlM7UbxltRo8lrVElA4dAoLlY7xBUVeRj6/82uNn1VHPgijM
	nJoMSL5rJiQVvCc9VGZlKbSLCD0zlI6oPN4jnITQs+H6qQuZ263Okd2PB9k/vBDcNchYnl
	BwVawC60N4elkIY2VKAcugRQpPEmxW0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700842079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=suN3V9rM6JohMwlCsG7PmWxd2SZ7oRR+3sWHfaA95QU=;
	b=RlFsV7mZ9Lb9QzQIvEy/FOIlM7UbxltRo8lrVElA4dAoLlY7xBUVeRj6/82uNn1VHPgijM
	nJoMSL5rJiQVvCc9VGZlKbSLCD0zlI6oPN4jnITQs+H6qQuZ263Okd2PB9k/vBDcNchYnl
	BwVawC60N4elkIY2VKAcugRQpPEmxW0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645--5K5v96uNCWBj_00SOZU9w-1; Fri, 24 Nov 2023 11:07:55 -0500
X-MC-Unique: -5K5v96uNCWBj_00SOZU9w-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4239693aebcso1211551cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 08:07:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700842075; x=1701446875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suN3V9rM6JohMwlCsG7PmWxd2SZ7oRR+3sWHfaA95QU=;
        b=CHdFG0gUFCsjbwKzRSfk7gC7qXW50nuIVOMKClFbWN5+UkudWltxetS929U/AcEAcE
         T4RtNO5JCmj7qCrmdg++qOIROVCnZbEv6Oc2xnJpgt09abQEdCmP+QsfPHkqse+sYwKj
         /LcKHCiUOoGfsKAAMM4sf/rpOY/tmd9nKuf0oGXqdzWbWgAVTHyDC+Xtpyvltr2c0ZkU
         k/YHADYLxIhYKgG9GOyWWiB8LXrsfwjsyM35gr4EX0nbVwINM4iIpy4rVQq51sRKjfzx
         PzIf/xbVjoGH+elUCFz8oC+nCtiCv8XyQNNmi1NiTxxl2IOP7OUDIlZ1RW90igpEpPqV
         4EvQ==
X-Gm-Message-State: AOJu0Yyw/WxlPb8ns6JC4pfcKTKU0zcH5I2Eywb4kYhF2HXH/X4sGP4t
	b6P9jm9jo9C0DhSPswPE+IfhKw2zFqH+2SlV3iJfSVfsgrDmzcGoyNWZG09fyBxdKROtRwGXxJt
	jVHxf2O21xrQVbC/m9SqQP+ofNw==
X-Received: by 2002:a05:622a:199a:b0:421:aed7:d588 with SMTP id u26-20020a05622a199a00b00421aed7d588mr3709088qtc.5.1700842075390;
        Fri, 24 Nov 2023 08:07:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOd7ZcfkjfEnW/YGYpjdepTXsBQmefBUFY1Iktas3x8VnzCdZbnMDFzkUAABAl6vehhFBtZg==
X-Received: by 2002:a05:622a:199a:b0:421:aed7:d588 with SMTP id u26-20020a05622a199a00b00421aed7d588mr3709008qtc.5.1700842074459;
        Fri, 24 Nov 2023 08:07:54 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id cf9-20020a05622a400900b0042380fb7ba0sm275601qtb.7.2023.11.24.08.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 08:07:54 -0800 (PST)
Date: Fri, 24 Nov 2023 11:07:51 -0500
From: Peter Xu <peterx@redhat.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZWDKV0XNjplc_vUP@x1n>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org>
 <ZV90JcnQ1RGud/0R@casper.infradead.org>
 <ZV-KQ0e0y9BTsHGv@x1n>
 <d2313c1d-1e50-49b7-bed7-840431af799a@arm.com>
 <ZV-sJsdFfXiCkylv@x1n>
 <510adc26-9aed-4745-8807-dba071fadbbe@arm.com>
MIME-Version: 1.0
In-Reply-To: <510adc26-9aed-4745-8807-dba071fadbbe@arm.com>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 24, 2023 at 09:06:01AM +0000, Ryan Roberts wrote:
> I don't have any micro-benchmarks for GUP though, if that's your question. Is
> there an easy-to-use test I can run to get some numbers? I'd be happy to try it out.

Thanks Ryan.  Then nothing is needed to be tested if gup is not yet touched
from your side, afaict.  I'll see whether I can provide some rough numbers
instead in the next post (I'll probably only be able to test it in a VM,
though, but hopefully that should still reflect mostly the truth).

-- 
Peter Xu

