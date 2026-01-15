Return-Path: <linuxppc-dev+bounces-15863-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4F0D27C39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 19:49:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsX883mKDz309H;
	Fri, 16 Jan 2026 05:49:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768502952;
	cv=none; b=jG7IDpXxMDNYFA4SKott+SxYRDjbLwp2EtzIuvwYtfeoDsPUvHwHy7IZx2Iu8uBFyRQpPKvuVdlZnHIdmFpfCJVfcBu4PLW2YyOZiLRIGVfNW9KTd8BFWwCUrUhOS25C9bnEYMyTMn/ViGg9FhNjn2ZIw8AeyZ/ondI7ZJ0/WhDcg6vwPYESciPKXcI+hb5W1/Cwm/QacWf824blJejXovZ5OQ2MKXpE+ufDcfcL2VeOV050ubsoaB0OYISBEqdUiTg7Q5Aa2uqKwNnq6BtbfJHLfo9bmYMW80ZXvxKvAOBdOKtvvHbYhBmH69sXftilsXvHkWtdxC+IdlQudB3smw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768502952; c=relaxed/relaxed;
	bh=ThW6vYvjdr3pPjrWFyNO5lbZkr9wIvw5pYgIyDBpjoM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jVBOlmLI/+5PWArn8p5vaDaIO75cczZDMBv48MFz+NNdtULVc8ILid9p8w1SDHtqASCvdmWsh7mvY86UOj35vlOy7i/PX/FC8NRJNnLoMM+m0i9jDpOpsHJ44h+Qzy9skELajEssL8jX8wWZpp5rMlGXOg5oTqI0P+U3FsJmrojc0b+ZutoSEU5PWDdZoSs+9nR3Ul1q8jFImZldkb5RSlyEWNrnT1WmbWJV3doDGAMNtwgI0hTJNPTO6piUEfl+LcZp5IN7hpVgknZz3hcrfWJBt3UOP1dmHvsTQvs25VFtiM/J1UoPsL7rkwQIhZNHKs9SAu1GSjNnaxVisrfOXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=OMPqv3Vb; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=OMPqv3Vb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsX870xr2z2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 05:49:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C92743462;
	Thu, 15 Jan 2026 18:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B856C16AAE;
	Thu, 15 Jan 2026 18:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768502948;
	bh=WCyzLTExsBoIYI4mj69MYgmS8ij3mWHLUriLEtCRl4Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OMPqv3Vb6igzQ6J6yeedeDADZNmSJcTS/NqTR8QuaY0arE+RdTkkZ/LG6Br1CzeEc
	 Mldf/qb9ciqHrV3QcrtBfcSw8RKoikT5GffwGbIKz9eJUZ4C9P9tbXXEIBzHqM4A/n
	 eT+/3C1vuKZsdshnSo1UGFdGeRhce11EHD9zLCSI=
Date: Thu, 15 Jan 2026 10:49:07 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-doc@vger.kernel.org,
 virtualization@lists.linux.dev, Oscar Salvador <osalvador@suse.de>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jerrin Shaji George
 <jerrin.shaji-george@broadcom.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eugenio =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>, Zi Yan
 <ziy@nvidia.com>
Subject: Re: [PATCH v2 00/23] mm: balloon infrastructure cleanups
Message-Id: <20260115104907.96d2aac4de42dce12d6064d9@linux-foundation.org>
In-Reply-To: <20260115092015.3928975-1-david@kernel.org>
References: <20260115092015.3928975-1-david@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 15 Jan 2026 10:19:50 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:

> I started with wanting to remove the dependency of the balloon
> infrastructure on the page lock, but ended up performing various other
> cleanups, some of which I had on my todo list for years.
> 
> This series heavily cleans up and simplifies our balloon infrastructure,
> including our balloon page migration functionality.

Thanks, I'll add this.  Again, I'll suppress the ensuing 528 emails.

Sigh, I do worry that the ongoing email deluge is training people to
ignore addition of things to mm.git.  Maybe more emails like this one
is the way to address this.

