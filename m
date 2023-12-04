Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87911803ACE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 17:49:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Il0kLUyM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LqC4/NAL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkV5B6q19z3d9G
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 03:49:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Il0kLUyM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LqC4/NAL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkV4J02zqz3cP5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 03:49:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701708537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DlFD7GhwLjb9S13yNsgkI3KXvw6iVqGQQvaiU30gBvU=;
	b=Il0kLUyM12rNafdXjZQvm82s/fpgXndxk/nOX7x4wEx9en6Yy9cXcYPsbZcAgj2GJmfJfm
	UeZFM+x1qbaVjLdye1j5QLqj/uHfmHJyhPi702sod4aWKdDrI8jNK/fp9uFFH+ys2zj1Sy
	IkjWYy7Gldug/+OOuGYG5CNDhinBAa0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701708538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DlFD7GhwLjb9S13yNsgkI3KXvw6iVqGQQvaiU30gBvU=;
	b=LqC4/NALtv6S7vYDl850GPGFioE2ZvV2J+VArhGk5kRceY7vXq6DI0/jb/TxtxSFHzp0Od
	llUXuSdwmUMliGpfuH6DQAJUWIKKMTUJxRt668kACfTFjMYUjZrqFNhY9h54wAcsTEbDZZ
	XjJNzWAnAKWR34u1mTf8DDd0onLHA9k=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-0NaOg-4aNXShESDRIGIDfw-1; Mon, 04 Dec 2023 11:48:56 -0500
X-MC-Unique: 0NaOg-4aNXShESDRIGIDfw-1
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7b395875bd0so114633439f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Dec 2023 08:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701708535; x=1702313335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlFD7GhwLjb9S13yNsgkI3KXvw6iVqGQQvaiU30gBvU=;
        b=jYrOacJNOzYRwxl1+7h9UkciUf2wSYh5ogOoq6Dpge22ZgI0GuCjXMLfnmDQt6+/IZ
         9aVo5NkU6mQdxXLL7WpwfVmpkaKlpOZ/P+a+Qb8QWbkeyvPEJAGDS5g75akqy/IuZFoJ
         p3NqlV+nGzc4Ef9tg5QyxUkwP6iOQWj1loMK4NP9j0Vogy1wZ/CrGAD9fOKGyrxSc13T
         EV6/aeOotV031DSMInfG0LpUa0af+wScwvSYRfBQ5nr3h3jaWeKWCPya62LbpbpTmuWS
         bacnXMVC3NyTxW8wZjWmd3U4W6vAJySZEK/8q5u7C2OYsUe2Ri5ZfOy/EeDEUC1n6OUC
         EO/w==
X-Gm-Message-State: AOJu0Yxkh32GY9mOD4PkFP2pF4Y7y411bEWN7PbPRpEmOLriUQehN+eK
	XIJyzVmB9M+HxG+u6dXu7wPyloe05bNOT81JTbR8TJ9P6pZmGMTgUZdR5iiHOmc7ZsZHFMfEExq
	DEzwKYRBCy15EcuJpSov+0oteug==
X-Received: by 2002:a05:6602:2245:b0:7b3:5be5:fa55 with SMTP id o5-20020a056602224500b007b35be5fa55mr32630794ioo.2.1701708535607;
        Mon, 04 Dec 2023 08:48:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMbZTTWxY8DAhdNOUcz7fb265lA/l2cJEQ3I487U8F0Nm42ahY5dHXJJc8+VpefYo3r7ArvA==
X-Received: by 2002:a05:6602:2245:b0:7b3:5be5:fa55 with SMTP id o5-20020a056602224500b007b35be5fa55mr32630779ioo.2.1701708535343;
        Mon, 04 Dec 2023 08:48:55 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id b10-20020a02a58a000000b00463fb5dd52dsm2637378jam.57.2023.12.04.08.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 08:48:55 -0800 (PST)
Date: Mon, 4 Dec 2023 11:48:52 -0500
From: Peter Xu <peterx@redhat.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Message-ID: <ZW4C9I2LHmZY-COM@x1n>
References: <ZV21GCbG48nTLDzn@infradead.org>
 <ZV90JcnQ1RGud/0R@casper.infradead.org>
 <ZV-KQ0e0y9BTsHGv@x1n>
 <d2313c1d-1e50-49b7-bed7-840431af799a@arm.com>
 <ZV-sJsdFfXiCkylv@x1n>
 <510adc26-9aed-4745-8807-dba071fadbbe@arm.com>
 <ZWDKV0XNjplc_vUP@x1n>
 <ZWj_EgljG3NwS5r1@x1n>
 <283da12c-14f1-4255-b3c4-ab933f3373c4@csgroup.eu>
 <01aad92f-b1e0-4f31-b905-8b1c2012ebab@arm.com>
MIME-Version: 1.0
In-Reply-To: <01aad92f-b1e0-4f31-b905-8b1c2012ebab@arm.com>
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 04, 2023 at 11:11:26AM +0000, Ryan Roberts wrote:
> To be honest, while I understand pte_cont() and friends, I don't understand
> their relevance (or at least potential future relevance) to GUP?

GUP in general can be smarter to recognize if a pte/pmd is a cont_pte and
fetch the whole pte/pmd range if the caller specified.  Now it loops over
each pte/pmd.

Fast-gup is better as it at least doesn't take pgtable lock, for cont_pte
it looks inside gup_pte_range() which is good enough, but it'll still do
folio checks for each sub-pte, even though the 2nd+ folio checks should be
mostly the same (if to ignore races when the folio changed within the time
of processing the cont_pte chunk).

Slow-gup (as of what this series is about so far) doesn't do that either,
for each cont_pte whole entry it'll loop N times, frequently taking and
releasing the pgtable lock.  A smarter slow-gup can fundamentallly setup
follow_page_context.page_mask if it sees a cont_pte.  There might be a
challenge on whether holding the head page's refcount would stablize the
whole folio, but that may be another question to ask.

I think I also overlooked that PPC_8XX also has cont_pte support, so we
actually have three users indeed, if not counting potential future archs
adding support to also get that same tlb benefit.

Thanks,

-- 
Peter Xu

