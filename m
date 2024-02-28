Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 621D786AC1E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 11:25:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RwxtWt0j;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RwxtWt0j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tl9TP6tPlz30gM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 21:24:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RwxtWt0j;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RwxtWt0j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tl9Sd3sqvz3vZ3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 21:24:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709115853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cuM8DzjfIvXog8Ktsli0EuxIlZtcxvx2KqthlbNhP2w=;
	b=RwxtWt0jIgChKa/KAsKEPikoI1HOnNo5ApDH03yyx7WINPjol00+9xWVOEWU69HcA7lYKW
	IS3mTixeN0Zsx2AFebcBFHa9y4pdRwaCCiHNsHj8rmePxQvZLJ/A/8qOKCxKs4NxfXN4jk
	e55k1Xn0iSfHPJnUYhr/XPqWc9TueT8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709115853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cuM8DzjfIvXog8Ktsli0EuxIlZtcxvx2KqthlbNhP2w=;
	b=RwxtWt0jIgChKa/KAsKEPikoI1HOnNo5ApDH03yyx7WINPjol00+9xWVOEWU69HcA7lYKW
	IS3mTixeN0Zsx2AFebcBFHa9y4pdRwaCCiHNsHj8rmePxQvZLJ/A/8qOKCxKs4NxfXN4jk
	e55k1Xn0iSfHPJnUYhr/XPqWc9TueT8=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-ycPR9HWFO4y-GyA2mf6QXg-1; Wed, 28 Feb 2024 05:24:11 -0500
X-MC-Unique: ycPR9HWFO4y-GyA2mf6QXg-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-29999b97b39so1803514a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 02:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709115851; x=1709720651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cuM8DzjfIvXog8Ktsli0EuxIlZtcxvx2KqthlbNhP2w=;
        b=cLnNztfEkYItq2OR4oz0fXuLiHYFRuiTEa0bc7vKOqGpvzlsUL3Q6ZRcJE64RYILWp
         UsNy9Bgk2d4tQJERVSi0tCKHLpx+fapE0wnS+QKVfoZ1fLwdkijl01O/8NXLZJjYRDeO
         775ZJRHueDNKwwIeOO2W9EbE4cotQrQSP886LGJhROSAgowtHu3ezIr/fQ1qpg87qL3X
         9SWaJyqujwW5cg8zVOt+hypGPIiYtIw919CT3i2t+ZqTaMnkA2/nPUMzg2t685N0hR35
         pdhVaKdJq4ybfGStEYhHDRhjUdB94q+HH8PRAEz3Y/Z4kfYRBUU/vT8wG15U8qnxayUy
         8SXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK8c3HtkQY/WhvYsHfdJVbZyeA1PkZ2njrgWb1+MsaQCL2RGHydLVnzhkKDqcQOMig/Iyj07CaF8pJ5uO0R5AUAeI91HOrR6mx+E6/8A==
X-Gm-Message-State: AOJu0YwLu8LPHQtruCpULQxtBbJZOGnzgtf9hdz28HUxJ0bhbYarQjtG
	0LfhNp6g48TMmEd0a2CO6wcEbIkA0HMRaSeQmUelxqQ6EQNJbtNwwdSgwh/aEYspnWbBWm3cXRY
	hY9COjCFUtwUnnyNvr4Sln1L+ZNmBt0hEbTePQfzGTvvT5CA8M2+sxgqcusv7FFY=
X-Received: by 2002:a17:903:41cb:b0:1db:a770:81a4 with SMTP id u11-20020a17090341cb00b001dba77081a4mr13185110ple.1.1709115850732;
        Wed, 28 Feb 2024 02:24:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQqydckRfZJZIaG/rRqPcgYNfTlA7NhghdSgVkZCgv1MurPpBWUZSA3ZuFWklgTD7WqfdhSQ==
X-Received: by 2002:a17:903:41cb:b0:1db:a770:81a4 with SMTP id u11-20020a17090341cb00b001dba77081a4mr13185086ple.1.1709115850287;
        Wed, 28 Feb 2024 02:24:10 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902854200b001dcc160a4ddsm2087740plo.169.2024.02.28.02.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 02:24:10 -0800 (PST)
Date: Wed, 28 Feb 2024 18:23:59 +0800
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 0/5] mm/treewide: Replace pXd_large() with pXd_leaf()
Message-ID: <Zd8Jv8hQdXejTnbU@x1n>
References: <20240228085350.520953-1-peterx@redhat.com>
 <93954095-4515-46ff-bdad-ad08439b4471@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <93954095-4515-46ff-bdad-ad08439b4471@csgroup.eu>
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 28, 2024 at 09:50:52AM +0000, Christophe Leroy wrote:
> Le 28/02/2024 à 09:53, peterx@redhat.com a écrit :
> > From: Peter Xu <peterx@redhat.com>
> > 
> > [based on latest akpm/mm-unstable, commit 1274e7646240]
> > 
> > These two APIs are mostly always the same.  It's confusing to have both of
> > them.  Merge them into one.  Here I used pXd_leaf() only because pXd_leaf()
> > is a global API which is always defined, while pXd_large() is not.
> > 
> > We have yet one more API that is similar which is pXd_huge(), but that's
> > even trickier, so let's do it step by step.
> > 
> > Some cautions are needed on either x86 or ppc: x86 is currently the only
> > user of p4d_large(), while ppc used to define pXd_large() only with THP,
> > while it is not the case for pXd_leaf().  For the rest archs, afaict
> > they're 100% identical.
> 
> Maybe would also be a good opportunity to replace pmd_is_leaf() by 
> pmd_leaf() and the same for pud_is_leaf()

Sure, while I'll wait for some more comments, I can add one on top when
repost.  Thanks,

-- 
Peter Xu

