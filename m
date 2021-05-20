Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3762738AEEE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 14:47:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm8dT0w5tz3bsN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 22:47:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d4QuOoug;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d4QuOoug;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=d4QuOoug; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=d4QuOoug; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm8d141Fjz2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 22:46:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621514801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e4Fywv1ENiQVYa4wbDxfInSTJhNzcF1YbxHx9cQFq/I=;
 b=d4QuOougWAhbhCRx2V2EGZmoEh8sL+QdswEkKYCFuwAxL/Wk/BsCJMDW04O+lK1qYpSANX
 WCjunSKn7tSJ6dC9nVweVtPs11yXtBE4T8WqAi/u1t/tuzoNddLjJD3rZSzGBv8lkeqehb
 //VyohoD5Fe4oiLBZIojw6AB9UtdL4Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621514801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e4Fywv1ENiQVYa4wbDxfInSTJhNzcF1YbxHx9cQFq/I=;
 b=d4QuOougWAhbhCRx2V2EGZmoEh8sL+QdswEkKYCFuwAxL/Wk/BsCJMDW04O+lK1qYpSANX
 WCjunSKn7tSJ6dC9nVweVtPs11yXtBE4T8WqAi/u1t/tuzoNddLjJD3rZSzGBv8lkeqehb
 //VyohoD5Fe4oiLBZIojw6AB9UtdL4Q=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-k8u03jr9NvmLjxr1H5XHwA-1; Thu, 20 May 2021 08:46:39 -0400
X-MC-Unique: k8u03jr9NvmLjxr1H5XHwA-1
Received: by mail-qk1-f198.google.com with SMTP id
 z12-20020a05620a08ccb02902ea1e4a963dso12338754qkz.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 05:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e4Fywv1ENiQVYa4wbDxfInSTJhNzcF1YbxHx9cQFq/I=;
 b=huo24eNlCc40D/VjnwHW4dz7jFctbnEToizso4nJqrZp7RnwwmMJ5UzG+a9K/ye+pL
 8QEBYwVAygBV5JSR/J0TUDtlWzd/enrGbLqHnGIDkjOEcMBhLPelt7soNwPoA1+g3Oul
 ziDiW4qd7bUjuuz+oFt8CCaPVfRKV/S3uX4mzSxAsHwJ6u6nr2UB7N5pt0k1Es8XwqQl
 ECw/+tWRwnRO0Y8KD0MvsPF5NP3noVz+3os8p/B1W62s3Jpcs/usdo8t2iLdjbhYi/oW
 4a3/Jf6HLRCDnjahKi5d41cveTKXn/4k9W0hf4wkb9GxCb+i61guZ3u9U+xu+A61OZMN
 /AjQ==
X-Gm-Message-State: AOAM5315ud2/2jQt6sogRJumzdxPwnNFwSrvqMJd36yxz5aHMEE4cMkN
 HGBWbTpWFFur7EmkOPG5s7f0T9NSKEXdoYvMCy5XZ+SKfXAw6WQVqEo1budr5jBWnU36Bpgej8l
 ulTXthG1vTOMCudsT7+bwhNh7ww==
X-Received: by 2002:a0c:a9db:: with SMTP id c27mr5484597qvb.50.1621514799222; 
 Thu, 20 May 2021 05:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykH36WPuvRGC1ihzQ0iEIBjEHESz262HbbXiVKUFg4El15AaxsQh3dm6Y8Q9wTut0JQgl2Mg==
X-Received: by 2002:a0c:a9db:: with SMTP id c27mr5484570qvb.50.1621514798898; 
 Thu, 20 May 2021 05:46:38 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id t17sm1690165qto.92.2021.05.20.05.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:46:38 -0700 (PDT)
Date: Thu, 20 May 2021 08:46:36 -0400
From: Peter Xu <peterx@redhat.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 3/9] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
Message-ID: <YKZaLHurH9nJWvbj@t490s>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-4-aneesh.kumar@linux.ibm.com>
 <YKQdxpHVYB9H0M0j@Ryzen-9-3900X.localdomain>
 <87mtsrqqk0.fsf@linux.ibm.com> <YKXHA8/HmP6HXngO@t490s>
 <6e0dbb76-2b33-53f1-246e-30cec2b871e2@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <6e0dbb76-2b33-53f1-246e-30cec2b871e2@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
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
Cc: npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 01:56:54PM +0530, Aneesh Kumar K.V wrote:
> > This seems to work at least for my userfaultfd test on shmem, however I don't
> > fully understand the commit message [1] on: How do we guarantee we're not
> > moving a thp pte?
> > 
> 
> move_page_tables() checks for pmd_trans_huge() and ends up calling
> move_huge_pmd if it is a THP entry.

Sorry to be unclear: what if a huge pud thp?

-- 
Peter Xu

