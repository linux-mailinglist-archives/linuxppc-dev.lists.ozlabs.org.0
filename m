Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB63720177
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 14:15:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXhmX0yRRz3f0N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 22:15:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=djzFovwD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=djzFovwD;
	dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXhlf517cz3dxX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 22:15:08 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-75b0b5c9eb8so192941085a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jun 2023 05:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1685708105; x=1688300105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E6fUqXWlJ7lOi6jGaXDr+3k1lI6v7YmcWJa5TzCsAfQ=;
        b=djzFovwDfDw/YWbNLlEkijaHy+/emg+qoFOhQt066k8y7eW0hTlMePfrnYmuQ/TT6l
         d70TUlIzOVtlyaZIA/kRvBZRW52TVi/fieL9Uv4tiaV3F1pWuXYr7FBQh9RfbRxnphIn
         nIOOpE05COs4CBgwbOrTscQAp+nS6Tk8Iv2UDHWeAHyeCW+fEyc3ctU7cgeLL3sBwLok
         ifN7Ap+HhdKODLWUosw9jkC+w1v/s/a6CGlG9Me6OF17ZaxzMYB4I1oIF5wWR3fHyTGr
         08q6Rpe08Gpj6mZ/RNU2DbMTQT+rS4iJPNpmpLyZGzEJB5e0jQtm57AIXlZP3QoFdL6G
         nNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685708105; x=1688300105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6fUqXWlJ7lOi6jGaXDr+3k1lI6v7YmcWJa5TzCsAfQ=;
        b=DbHMt5TJfpzO9+Iv7bnM7qDquxyj69+i/wZMbnYuz+oOzQDhNYUlis3Gx8a0Kr6MJf
         QhBAt2B7i4cOahtgIgHPuxiklNiaOAC/EaOXgDoJshWLffwtCLkjcyge+yaMjNyDQP+R
         tVC6oEx7uoizh1BZT/5CqboFvnxGjn2XF7PrdJjnVZyXUwz33E7djowqa/xyEsswBHys
         4H+TUfnfoe3w0YZze+z5QSBvZ/f+76GU3rFqSOcrf1tbT/SFN2h1uQJntLqmT7F96JtB
         0ZoqaCctyTONXTLINfANp/BCWF1/2iuCKEyOMMSaSojL9+aerogmvC1yRrPcN0DXb7RE
         IqgQ==
X-Gm-Message-State: AC+VfDxKcZ8Cq1T+ZTKcspquimmMWOTAIB2/koNl5pUqWbMS/3qYEqBJ
	OHV4f4n8wdmE3RZpQ+I0JLN+fQ==
X-Google-Smtp-Source: ACHHUZ6mKX5TGzVXplRRXyH/OZZR/wmHkSAtgpVVJf05zVAhB435FtzWVMzs8VPH+7iFQ08B9IrtzA==
X-Received: by 2002:a05:620a:4481:b0:75b:23a0:e7cc with SMTP id x1-20020a05620a448100b0075b23a0e7ccmr17244216qkp.45.1685708104769;
        Fri, 02 Jun 2023 05:15:04 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id p18-20020ae9f312000000b0075cad1e5907sm581918qkg.7.2023.06.02.05.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 05:15:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1q53gM-001uE9-W9;
	Fri, 02 Jun 2023 09:15:03 -0300
Date: Fri, 2 Jun 2023 09:15:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 08/12] mm/pgtable: add pte_free_defer() for pgtable as
 page
Message-ID: <ZHndRujtRhT6bhBs@ziepe.ca>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <739964d-c535-4db4-90ec-2166285b4d47@google.com>
 <ZHekpAKJ05cr/GLl@ziepe.ca>
 <a7f4722-8af2-f7be-eada-ff1e6e918da1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7f4722-8af2-f7be-eada-ff1e6e918da1@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Z
 heng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 01, 2023 at 11:03:11PM -0700, Hugh Dickins wrote:
> > I was hoping Mathew's folio conversion would help clarify this..
> 
> I doubt that: what we have for use today is pages, however they are
> dressed up.

I mean the part where Matthew is going and splitting the types and
making it much clearer and type safe how the memory is layed out. eg
no more guessing if the arch code is overlaying something else onto
the rcu_head.

Then the hope against hope is that after doing all this we can find
enough space for everything including the rcu heads..

Jason
