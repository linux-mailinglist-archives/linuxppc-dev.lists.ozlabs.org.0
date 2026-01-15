Return-Path: <linuxppc-dev+bounces-15859-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9A6D25E32
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 17:53:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsTb520cnz309H;
	Fri, 16 Jan 2026 03:53:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768496033;
	cv=none; b=mVTz7BrKKw+kRl4TxyxM3oAmxRFLgcnGuVqPXTk6Ho5z/6Wci5gWZVhRb1+dMIgbiWwo1SKF+X0kEoDh3e/ko3BFJyfyblGJCEYUbvhKXjGF249NqHaU6/E/KWrmz9ZDsbYYP7FE9HGTe70EYpIGlUOHl9JPIAWtG4PpBMec1M+/HJyoVp/e7G004OP18r10MziyohYV7rP4uskqN2sS7rV233fzWaC+DhbO6CC4NJ/6KVTcLguSPx+uGQroo68RX6kQ50T06jtVcpqQ2YObwSVhdkCwG0Q/5cTh/7X4vnQZYRo023wyuX2unyt/aoagjnBVCbcWjHOF7nFahtkeog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768496033; c=relaxed/relaxed;
	bh=5su/nAHmwHcmkA811BDe3v/5JJsozj0l7oyd1uJGuPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=NSMltQmxPHikMbtMdUxY2U9zSO8CyY3cOBlA5j25AzRuHtELbWLZB5d7WwLTn4TKLxbBlZUFvUIhLj938PsBI5W6vPmSUFrLuxb7SJPr7Ge+6fHY0JP3v7yZG9ux0ZHMwn4v8mBJt338KUjXRd3upaYCSyMytbu7hcyxS36TW4PAr4BrMrV8wvHeEO7I4Rjn4ag+sw+IgD3OxHC98WOtgBbM8uQUIXaj+pMllz4dOrG80cXgf2AfTCj9UirQieoBoVocPFjRtTqa2UonuLqAxj6wupjX8qnJqDtEI8RjzWTplETZezxwDw6WE8iKsKvMfysuQA5nkxlSBJKTk76/wQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oblod9Ii; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d1bcc+KJ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Oblod9Ii;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d1bcc+KJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsTb428q0z2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 03:53:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768496028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5su/nAHmwHcmkA811BDe3v/5JJsozj0l7oyd1uJGuPg=;
	b=Oblod9IiJogxeYADiNgkkExsd8ae/DQMuct8KNvton5h+4eo84CQ0sGbddy3lyF119mZbw
	lTWDBymtNoLKtSC0JWOr7os/H8AVkYEEyb0foS4nhwOsy97IH/PU+1bUZnZA53FH+G/y4r
	G2XZndvQoDZK0kmS3/CH4LAH0TjKo5Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768496029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5su/nAHmwHcmkA811BDe3v/5JJsozj0l7oyd1uJGuPg=;
	b=d1bcc+KJ81T91DDb5BGu7PIOaHJ16aRVguTStS3AsTgVSHyK3P8McNoestTmjUw2syqyZQ
	52FtRuCAKKmZFQSQhCKy3VWcO8oQ2gXuDqv2KVtV+OaBrz2L/pen+C22BQkHbu/O5KcnUA
	hmjNZXx1SaQBl9VNpAkMDHNPV7kpsao=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-d-Sr3nuGPhCQWfBL7-PVCA-1; Thu, 15 Jan 2026 11:53:45 -0500
X-MC-Unique: d-Sr3nuGPhCQWfBL7-PVCA-1
X-Mimecast-MFC-AGG-ID: d-Sr3nuGPhCQWfBL7-PVCA_1768496024
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47d28e7960fso13247135e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 08:53:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768496024; x=1769100824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5su/nAHmwHcmkA811BDe3v/5JJsozj0l7oyd1uJGuPg=;
        b=WrGOc/Rpe3MoXfs8o5B7yD9OKhHWYyb2KHPyy6202d+hf2h8ZpYtonh4ItTMJxwp5+
         XFV5rEqPIQr8JjoQdYK78bFO1x8Bz6VJSxkQ1Jrc8qVbz18+H1Fo+muS5DM2oNVa9tLW
         gNdE2r9DFkjeTykL6M0N5BFrhW6PjbrmAN3GwgZcdTLsvnBG3RQvyxqD/laFqtpkD5zy
         6mNprxLqKJXj57enFdphmiGi7PhL0Fqdgrhcc4GyTdx1nJaV8N2CTXUdW3E53WbuY18H
         5Mu016gApfRsxh7eslmkfITd9ykL4JUEUvsG8C2F61PsJnTDC4x3VbpLx0MlXevIAP1W
         Ib6A==
X-Forwarded-Encrypted: i=1; AJvYcCU5MkdjPOZtX5vOwnxypfNxT7ev6JoAK4/8FnLt5xWVdTtd5IMeUS3+jRj/SRPf+ZxLms76o8atExy9qZc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz9fqC+tsjxVmbVRwj/97UREQ4qWxum7kC9oJO9nazxhxmCGMEd
	Am71tncssDZEsskuG1fwQdKNhIJPBu4prvJlZ/aQBDrZhgpzo41JcIrr3APKGqTotgb3LKtVewy
	abo8WIO27KLnH4PAl5E1Wcsa6GMkfxYYWxlDS/THKzaDiv130gxhKx6VHfO/4wZB1P/I=
X-Gm-Gg: AY/fxX52LHunxBZfhBUr7FGDJ6pkDPvqyzAFHaZI6Bwma30Zr85JPPsG2V1wPoTGcxv
	7pmXa6bCQmZRk0tvRpCj3oXyDGrttkJvcw64BCCCY7ky/qC3yLlJOV/eTntAIl40P0arvXnvRPl
	tUEHPAmjHtGD5YXEOrRlOXj3tjaSERNqt2j31MQyN0PSVuQdZRaNXMeGKJeaz3x07AFsB/xlfYm
	WYPzBUbEUUJhNBBkWir+Ml/Y8QYs6kKyad83UxaUczDw65nYduT988KBR5zrJ3UPcvStEkvhq4a
	8OIiXXHEKik2Rl7R3enZ2Dkc0+AZ3djkqV6N/h3ld1bjmnR7Pj+8XaQLriCxbCio5m7OU83l0hA
	NGBkvwoXLlg4r9DmwVT061uirBT7gzQ==
X-Received: by 2002:a05:600c:5487:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4801e30d482mr5165455e9.13.1768496024076;
        Thu, 15 Jan 2026 08:53:44 -0800 (PST)
X-Received: by 2002:a05:600c:5487:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4801e30d482mr5165105e9.13.1768496023585;
        Thu, 15 Jan 2026 08:53:43 -0800 (PST)
Received: from redhat.com (IGLD-80-230-35-22.inter.net.il. [80.230.35.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992681esm58497f8f.11.2026.01.15.08.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:53:42 -0800 (PST)
Date: Thu, 15 Jan 2026 11:53:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 22/23] mm: rename CONFIG_MEMORY_BALLOON ->
 CONFIG_BALLOON
Message-ID: <20260115115228-mutt-send-email-mst@kernel.org>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-23-david@kernel.org>
 <219f7be4-8355-4376-bf97-3410c6e23867@lucifer.local>
 <37fdb994-59d1-4196-b377-f3f749148b19@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <37fdb994-59d1-4196-b377-f3f749148b19@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uk-3PaoBHGEu_Qt-K-nDRtozbc5DMhtNQJFWuINMIBA_1768496024
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 05:33:56PM +0100, David Hildenbrand (Red Hat) wrote:
> I'll note that the spec also defines a "DEVICE ID of Virtio Cpu balloon device as 47". But
> no changes really happened in the spec with that for the last two years (only the
> id is reserved).
> 
> 
> [1] https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.4.html#x1-4260001


Maybe that's a good reason to keep calling it "memory balloon".

And hey, there's also the floating, pops easily kind and maybe someone
will use those with linux in some way :)


> -- 
> Cheers
> 
> David


