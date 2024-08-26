Return-Path: <linuxppc-dev+bounces-538-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABC495F3F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 16:34:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WstVh0YzNz2yGT;
	Tue, 27 Aug 2024 00:34:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724682892;
	cv=none; b=ZFd6SuIerNhq7wuUd3h1tZvHARQZRQ/aepogf8OKEoKAANksfZQONYgKRnSxH7MX2fI9eVR2JVXk+Pw5nrCAXK56SzjImWNguiKND9RYrr3XjSElx5wE1rrexFIoo5swtQBkZZguPtN3cCUdotXMCGeGGiRMw5qCDmlm45ESCk/ATTbkjZMBR44S9nRqBy+WwdFcHakP/l20EuK62kTD+poJet/UzN7GJxDQmgW28QBVi/gBUyr924Llq31A4G2H247mh7i+u7Ge7To2fBK5GxaQXd2/rjWR+FnbHJOuj70A2hTmGkax2RiY9EyOnaKYK0BJByWaJ9atJn4TEtGeBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724682892; c=relaxed/relaxed;
	bh=VW+HIHEhMAo3/O8qS6yn7a/M9Jq5ewUkNW1oEWQ5L3A=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Received:X-Google-Smtp-Source:X-Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-Originator:Content-Type:
	 Content-Disposition; b=KU2C+BevDa+ECj8pcHLBauJfilISnu/Dr4tDxUOVXOa76gPs24OLXgBDDYSaELX/4EUqFuXZMRLgxGZvQdD3ww16qO8vavwCzI+BvlFa2pnED+9un1p4ch1JO+C9SraaoMD7FuWa6OF/onnj+Y2f+M84S+16Xg73S/oDid++8cBSpQQHWk9YlngZuCWiM2Y6etmezFFQ/fmf0Lc1BSnk2TYxkxzEFdlrDDRzTM9mRbqBgbbAVLlPXWcySlCs3BIoTsIhBZi7dho0GVELVdqJv/NaMAEPO+v4Tlb+rmA/8X2gqrYAu1bkTXHWrN1zK3ukgg7FFEh6zURWMIjJFN/sTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ASjHTVpI; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ASjHTVpI; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ASjHTVpI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ASjHTVpI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WstVg3wjZz2yDj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 00:34:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724682885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VW+HIHEhMAo3/O8qS6yn7a/M9Jq5ewUkNW1oEWQ5L3A=;
	b=ASjHTVpIeCTSeGgid4jlaNZjwZpjL+AIUsYYQe5rFo8Ccg1aVGo926oYYaCdf0NLoixEKc
	7nJW68+t/lfkrJ5qwRyVujGWSaIuHl4rVe2qa18knxDIAmm3VlpJ6JdyDhxFpxtI6sOPAw
	Tk7UNpy+kRTmOh1n7vfE+og5BBon4fE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724682885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VW+HIHEhMAo3/O8qS6yn7a/M9Jq5ewUkNW1oEWQ5L3A=;
	b=ASjHTVpIeCTSeGgid4jlaNZjwZpjL+AIUsYYQe5rFo8Ccg1aVGo926oYYaCdf0NLoixEKc
	7nJW68+t/lfkrJ5qwRyVujGWSaIuHl4rVe2qa18knxDIAmm3VlpJ6JdyDhxFpxtI6sOPAw
	Tk7UNpy+kRTmOh1n7vfE+og5BBon4fE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-GYMIqmHkN5WoXQbn4jJuJw-1; Mon, 26 Aug 2024 10:34:44 -0400
X-MC-Unique: GYMIqmHkN5WoXQbn4jJuJw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6c181e15e90so17578296d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 07:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724682884; x=1725287684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VW+HIHEhMAo3/O8qS6yn7a/M9Jq5ewUkNW1oEWQ5L3A=;
        b=RPBtezY6+GBbrF/qqwDwmGIcavfB/ymGyZvXeh0TxZGSfMMwiLc9GSNFEr/PogGdqj
         N73vPTnzfhskSWkXoviIvwehl1XeQRaYXVEZtWb87j6t+TVPF6Wo51yqKOl7EkW9xMX2
         16vbnafxaJTCaym0450XffRMmRCvlqHuqmvk8XbY7U/A/c9BKZO81K5qNFWkQWV9/jOy
         MXENSPOiqbbnWSXqLDmVSgghBWwaaUAtraSlDzqZx0dcpyeCufoLTDG+VNO2btcB6lIs
         7EIMi837D6QhUcZxI4dPhk9r3yZGfilxXqVyXQcVXZ1hl/U71GVoL8rB5TGBx22FYeba
         E9Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVluhyswDtsdULrhvZqmqfmDgnz2WYD3HfCE52vvyOzIwB4mON+QG7zdnEAcB8JBac9j0iKAVHwoL8DUYI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6yibtABPWjnHxP0NqC2j3/7wJNRwcg48ytgzLQkgb/mLXDIM1
	3CYblOMlHdwmQFiYPXqL6eKDtADg5DSlUMStqnX/Pyg2+kopRcPC7CzxFc7l4lAscYm0EGwgArZ
	6BdjToATp6+EcqNaygQU0w4k34qIqk+vKRr3AV2uOtdFdbmzMTqEfoV/G81oph78=
X-Received: by 2002:a05:6214:4304:b0:6bb:a16d:279f with SMTP id 6a1803df08f44-6c16dcb7b2amr123089046d6.38.1724682883708;
        Mon, 26 Aug 2024 07:34:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJyXhGmqDSVXXp1D+XITrKt9Uq9T5JuT4lUbtmj8ua5Df7FPqa8sCBxKyCSdGvctdo+BxBQQ==
X-Received: by 2002:a05:6214:4304:b0:6bb:a16d:279f with SMTP id 6a1803df08f44-6c16dcb7b2amr123088766d6.38.1724682883376;
        Mon, 26 Aug 2024 07:34:43 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c184ce9034sm10939096d6.73.2024.08.26.07.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 07:34:42 -0700 (PDT)
Date: Mon, 26 Aug 2024 10:34:39 -0400
From: Peter Xu <peterx@redhat.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>, "x86@kernel.org" <x86@kernel.org>,
	Alistair Popple <apopple@nvidia.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH RFC 2/6] mm: PGTABLE_HAS_P[MU]D_LEAVES config options
Message-ID: <ZsySf2F9djR5YVOr@x1n>
References: <20240717220219.3743374-1-peterx@redhat.com>
 <20240717220219.3743374-3-peterx@redhat.com>
 <dcdde9fc-7e7c-45a8-8dc7-7f7ed13b81ec@cs-soprasteria.com>
 <ZseOp7M9AmZtW4jw@x1n>
 <d3e4256f-253a-4a61-a83b-93f50ebabed8@cs-soprasteria.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
In-Reply-To: <d3e4256f-253a-4a61-a83b-93f50ebabed8@cs-soprasteria.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 23, 2024 at 06:19:52AM +0000, LEROY Christophe wrote:
> Why is an option needed for that ? If pmd_leaf() returns always false, 
> it means the arch doesn't support pmd mappings and if properly used all 
> related code should fold away without a config option, shouldn't it ?

It's not always easy to leverage an "if" clause there, IIUC.  Take the case
of when a driver wants to inject a pmd pfnmap, we may want something like:

  if (pmd_leaf_supported())
      inject_pmd_leaf(&pmd);

We don't have a pmd entry to reference at the point of pmd_leaf_supported()
when making the decision.

Thanks,

-- 
Peter Xu


