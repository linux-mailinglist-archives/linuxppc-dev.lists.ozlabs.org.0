Return-Path: <linuxppc-dev+bounces-15858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8183D25D96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 17:51:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsTWp0DJLz309H;
	Fri, 16 Jan 2026 03:51:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768495861;
	cv=none; b=UO2MK9hvUFhAUlZqZeEmzIyAOrPEec1h8NwMQ6kp83WkOmLHVXU3/8L+QlGbqX71hl94lkcvqYVHTYLWM+bkJp8tgdYWcld+RgSq2taw/P1CNmIARR7kZa5w7oR33Jxsulb2Xr1GtqXNN0gTe5qiJOXkpT6xmU4XKWx24YJkp5Pzvp3bSCvkVi3KhuX5gCiJgF8x3fTXKUD7uJkoPyKCUXQqis38Jz9fHVhu4Vi/JoJ9bdCtVx4OROH1m05pXNqRwzJKQv4HfwtG3eoeQ98s+G+pTOHWZ5yDEjEerD6gaWIH45X0PgmNdjzDdZeqNdXiRYTAr5GG6EO1M5tHdgI+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768495861; c=relaxed/relaxed;
	bh=SljNJ9ya7guEeZDCesmPS6qTlCZIDBdh9EBAuJaiH00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=V1u7WILu46MMwph5vL3GjYuTWdz5m/OqnvGj2tGAom/4cGXbqnQfhVTBD/L2LNqbXwZhhyq3I6zOtVrlvC3SDOtorExwTluFH3EMdLah5EeXiJoj1fCaXlbqzMAn1rd28kHWXN3Ru/KUxC1n26GMMAi1jIGQ7pBv7wsm2arUjh9bM7M/pkF8+Pq3fqU4AnwlyKqwIWq9WTWByTn2CAaNntWMPYg0ahv8/0DJJrzO/n3NOu3p64hCeW3czEfk3KSKSkcWPiwX2OTfezoLFIoQ3C7AULYLE47JR3FC2LDCFkCQW1z24q5EZn1rXJdfbCUHwEZGeT67vDh0HcX8NK2DvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TtEZLzUJ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TtEZLzUJ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TtEZLzUJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TtEZLzUJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 26270 seconds by postgrey-1.37 at boromir; Fri, 16 Jan 2026 03:51:00 AEDT
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsTWm4fTDz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 03:50:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768495856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SljNJ9ya7guEeZDCesmPS6qTlCZIDBdh9EBAuJaiH00=;
	b=TtEZLzUJzYdbntBFelEETr1uPU9ZJAgdQMmiMytznQNjg/a/aeqG8RIv8vXiEELctZwevv
	D2bZuAa4Ngbz9W18Ckv0GzPNLaoz4TifQp9QNXLv54wfFgHQaxv+LO+frXImFEuJAFH9Np
	FK2kBtIw5Jak27xy31g5Y4U8+jzuG/M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768495856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SljNJ9ya7guEeZDCesmPS6qTlCZIDBdh9EBAuJaiH00=;
	b=TtEZLzUJzYdbntBFelEETr1uPU9ZJAgdQMmiMytznQNjg/a/aeqG8RIv8vXiEELctZwevv
	D2bZuAa4Ngbz9W18Ckv0GzPNLaoz4TifQp9QNXLv54wfFgHQaxv+LO+frXImFEuJAFH9Np
	FK2kBtIw5Jak27xy31g5Y4U8+jzuG/M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-KlSfVYAuOGiAKpGsG4Rd6w-1; Thu, 15 Jan 2026 11:50:54 -0500
X-MC-Unique: KlSfVYAuOGiAKpGsG4Rd6w-1
X-Mimecast-MFC-AGG-ID: KlSfVYAuOGiAKpGsG4Rd6w_1768495853
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47d3c9b8c56so12594245e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 08:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768495853; x=1769100653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SljNJ9ya7guEeZDCesmPS6qTlCZIDBdh9EBAuJaiH00=;
        b=tcTr9EyrpbLiiZ0LxMy0xYhaoeEN/AjMiOI5yvY5LF8BITEP82KqLZxnUctSXtW5oa
         0unVA8I1mrQgajuWzgADMJ/Ny0A0/cGR4+bVT6i3sypH9i9OOqhDZwkkedkEppEhXZx6
         gaRQPqwrdP4oEpLYlOTNz/oLHxBHvSHLtWLU5LLqYDHuTwGALNjSu6hcAudwncU2gddZ
         ZvXxuMuuZHH266bbT1D2fUT9FXpw6V9vfxb3GFE4ocehrMhZsK/jnwxWC/eraAhnmB5n
         N404IyOEtJiuu48z7OwzOcEEGc/+8qOw1tw6FxBfeRnzXtmS1T2gP38jzrnwRVKh5ZLW
         LVTw==
X-Forwarded-Encrypted: i=1; AJvYcCXqf1yzI3poZq5nTHtieUszpnUnW0NbYyxQe3puN2+5oIQ/TSUKDSiBnVXtKMIwLZ07v1kORdS9IA+tjx8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywza7oMCEJsqn1X51y5URXaVO5rtfwcenm4X5LYKCwCVIEBY3yN
	lwcw81h5KsFpexAGuZu2ArzHhxJQ9vCU5nY51s///cb18LJb/UEL9jdqlZwnUcnbmQxbrAtj/0H
	n2C/jY90dEE0bELzO5VEy9PDCl/XTzo3RmYBMIo5cx961GapD5Xt0wO4X92n4Df3oepY=
X-Gm-Gg: AY/fxX45bIjggUh58C0ImgwVKtOGP3jBm6qVb4EIbiczLhXi+VlYaqfKLn/NP5RmG/8
	gBHA871ij8kx6S4eY3Q6VgnxQNbSDpwfNsY89QbzwcM0oBDNrEs9qXCwsT1v8nwKncirONFZnWg
	+R/9loS1A6EyLIBThR+HcMJfS3CqIO3VXtrFhzmS3Rjrr73UA40c/mEq7tE7pTR8kZaNbKivEHA
	6ElPxM/YyNv3S4eKSHiw1MzEaTSnsSzI2D2Q3PSpaTqinXSU5uwD3+i43MOQnQbOHw4FzFvkgxB
	ynpgY42gefyBGk9ZjMCi6fBEbEBik3mGI43IVGuT6TJiK15UBXJ0cHAkNbkS7S4uS885ryh+bN6
	7t3csrsY7XfGe8/nhJMHnAQAyQeN09g==
X-Received: by 2002:a05:600c:45d5:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-4801e30aecbmr4637475e9.13.1768495853207;
        Thu, 15 Jan 2026 08:50:53 -0800 (PST)
X-Received: by 2002:a05:600c:45d5:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-4801e30aecbmr4636905e9.13.1768495852632;
        Thu, 15 Jan 2026 08:50:52 -0800 (PST)
Received: from redhat.com (IGLD-80-230-35-22.inter.net.il. [80.230.35.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b7aasm57337815e9.2.2026.01.15.08.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:50:51 -0800 (PST)
Date: Thu, 15 Jan 2026 11:50:47 -0500
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
Message-ID: <20260115114849-mutt-send-email-mst@kernel.org>
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
X-Mimecast-MFC-PROC-ID: wDZx57BvJZFC3mkZZ6MWhQvS2OqPssdKYK6Ozxw6jB8_1768495853
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 05:33:56PM +0100, David Hildenbrand (Red Hat) wrote:
> On 1/15/26 14:55, Lorenzo Stoakes wrote:
> > On Thu, Jan 15, 2026 at 10:20:12AM +0100, David Hildenbrand (Red Hat) wrote:
> > > Let's make it consistent with the naming of the files but also with the
> > > naming of CONFIG_BALLOON_MIGRATION.
> > > 
> > > While at it, add a "/* CONFIG_BALLOON */".
> > 
> > Probably not relevant but cheap for me to share :) so grepped for
> > 'memory_balloon' and saw:
> > 
> > include/uapi/linux/virtio_ids.h
> > 44:#define VIRTIO_ID_MEMORY_BALLOON	13 /* virtio memory balloon */
> > 
> > This maybe relevant (I guess this isn't actually used anywhere?) though
> > interesting there is also VIRTIO_ID_BALLOON... hmm :)
> 
> Yeah, we want to leave the virtio stuff alone.
> 
> Now you'll learn something you probably wish you wouldn't know:
> 
> As you spotted, there is
> 
> 	#define VIRTIO_ID_BALLOON               5 /* virtio balloon */
> 
> And
> 
> 	#define VIRTIO_ID_MEMORY_BALLOON        13 /* virtio memory balloon */
> 
> 
> The virtio-spec [1] defines ID 5 to be the "Traditional Memory Balloon Device".
> 
> And in there, we document that
> 
> "This is the traditional balloon device. The device number 13 is reserved for
> a new memory balloon interface, with different semantics, which is expected
> in a future version of the standard. "
> 
> That's in the spec already like, forever. Likely, at some point someone wanted to implement a
> new version (for whatever reason) and defined ID 13. But that never happened.

yea Rusty wanted to do that. balloon has lots of weird bugs like it does
not really works with large guests. We really need to get around to
fixing this, and maybe it's cleaner to do that with a new ID
than trying and failing to use the old one, was the thinking.

> So now we have these beautiful two device IDs.
> 
> I'll note that the spec also defines a "DEVICE ID of Virtio Cpu balloon device as 47". But
> no changes really happened in the spec with that for the last two years (only the
> id is reserved).
> 
> 
> [1] https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.4.html#x1-4260001
> 
> -- 
> Cheers
> 
> David


