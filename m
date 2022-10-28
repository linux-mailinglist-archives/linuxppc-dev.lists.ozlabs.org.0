Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D96611E13
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 01:25:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mzdv53s0sz3cNb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 10:25:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ezCbbW+f;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KBQtyrOM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ezCbbW+f;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KBQtyrOM;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mzdt55Jtdz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 10:24:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666999462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cRyNGp9vBF4GSRr09z30VvDe1naMezW0SypBh95qjuw=;
	b=ezCbbW+fUw6C/btLTjIcrDPmsx0pesNlWLId9pf/bM+PeNukgR+lMJvL9LNjZFgiuVfvHJ
	fM9zYLWkyTFst1G+vmqczc2t3UON9r6rBvvjYIPw1GKxZ4vvKG5jiup7XOSEhHyDtTzJCd
	DVn99c0Qd3TvdoqdOltn4elHXXIZihA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666999463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cRyNGp9vBF4GSRr09z30VvDe1naMezW0SypBh95qjuw=;
	b=KBQtyrOMaiNh2KH+8L0izv7IxIz1GjiaSp8ELAEDIkjoEMtnQkb/4SucEiqF3a+JLp4Lue
	6Mg+J8s/X5hSSnosxNyWSY12oboo6dyhSqg5hyV2I0BzQToEvK8ezULw0ziPbtF67u7fNX
	wu5B3fie/laaF5WDQoxatdyOzQmqSJk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-0lbqSbBaPs6u23WYOSpjjg-1; Fri, 28 Oct 2022 19:24:21 -0400
X-MC-Unique: 0lbqSbBaPs6u23WYOSpjjg-1
Received: by mail-qv1-f71.google.com with SMTP id e13-20020ad450cd000000b004bb49d98da4so3699128qvq.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 16:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRyNGp9vBF4GSRr09z30VvDe1naMezW0SypBh95qjuw=;
        b=4Y8iaZDRFpHpmSMCVHQKXnixOrcmoGaC5J7H6Yq2XErSmLHlZ+xQS4bwXP49vVXBeK
         Wx/HL/qDRpUPp+n453PDFLOBu+PEIteOK8E9tmxXV3UknQP4QsQBCQvcUTY0BUHy07UL
         ZAnbIZTeLELV5Yld7J/7YtyIHs3tkO4oPLl0un7jRd/aVfBm4K8xNR2r5YzIPZPZ7G8K
         /gJudPAFYEonmQ3nn3GdgT/8SufEgbXYqPL2GC/eRPzVHa2UXO3mruHxPyuiM918ifu7
         60DDi/Okor/CVGykRIxJHsOWnqyZw7WckwygCMLI6KScBeeG3YqlMUfrzFMUjF9c6wdY
         DVcg==
X-Gm-Message-State: ACrzQf2h14dgaLo/UMumXfSDyxlX07F5RJl+B/GD7+b4Tx/shiqDlheD
	P9Ky04bUS7KA4KYWWoWsWB0ycyJo7BoXQxXN223+nUvw81E9UXRcOcHVsLiUfwvZ00TiZ+7Hxzs
	r7B2Rv7nSGn80/88m6Kdo1u3IqA==
X-Received: by 2002:ad4:4ea2:0:b0:4b7:e8a3:e043 with SMTP id ed2-20020ad44ea2000000b004b7e8a3e043mr1727893qvb.34.1666999460768;
        Fri, 28 Oct 2022 16:24:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5O9D8mCa0VSNsJWqYFF4hzhXh38xZVkwpvXIFKcJlS4quyWCJ+vSPpcEiNhIciaQuZzCKa1g==
X-Received: by 2002:ad4:4ea2:0:b0:4b7:e8a3:e043 with SMTP id ed2-20020ad44ea2000000b004b7e8a3e043mr1727871qvb.34.1666999460480;
        Fri, 28 Oct 2022 16:24:20 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id d9-20020a05620a240900b006b8e8c657ccsm3976351qkn.117.2022.10.28.16.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 16:24:19 -0700 (PDT)
Date: Fri, 28 Oct 2022 19:24:18 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v4] hugetlb: simplify hugetlb handling in follow_page_mask
Message-ID: <Y1xkonJ2DkQQbAaT@x1n>
References: <20221028181108.119432-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20221028181108.119432-1-mike.kravetz@oracle.com>
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
Cc: Naoya Horiguchi <naoya.horiguchi@linux.dev>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 28, 2022 at 11:11:08AM -0700, Mike Kravetz wrote:
> v4 -    Remove vma (pmd sharing) locking as this can be called with
> 	FOLL_NOWAIT. Peter

Thanks, Mike.  For the gup safety on pmd unshare, I'll prepare a few small
patches and post hopefully early next week (will be off-work on Mon & Tue,
but maybe I'll still try).

-- 
Peter Xu

