Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D00D9879C88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 21:02:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZUjP/D6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZKQ3snpr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvPgN4wDHz3dXC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 07:02:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hZUjP/D6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZKQ3snpr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvPfb4YKHz3cV5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 07:01:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710273681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sq8Q7APw4DcVkqWc+oejv1fuFkz+jT1GPn/e6E4W0Yk=;
	b=hZUjP/D6J9pwOvjbXWl/TnnGrlwZOagSjLsshCH2LeYVshMTIYUmknyoagJorD1uvevAfF
	a4nng9HJSzz+frcTyPIb6Rpc0GujIDxIIj10rjzImhujng22bOa8AktSwu7TrDvbJT3xlO
	BbO5RM739tlIkETH9sPjBcrtdeoDA6w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710273682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sq8Q7APw4DcVkqWc+oejv1fuFkz+jT1GPn/e6E4W0Yk=;
	b=ZKQ3snpri8r+3q9plO5BJ7tIv5PnKEWn3i3GPhYPbD1Yezz1guiDCuECvT/2aeu6l1Cq/T
	lRek4cHQVG7OZb3kGzf/Laa8z+EYkjyvJ3MtT6zB5v2JYZc945iz532YRsbS1IqHabq1cw
	nSNUtG2aW+Cehope1/h1EuE9mPvAS8s=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-QrdOiWhhPe-eFx_NUA9wQg-1; Tue, 12 Mar 2024 16:01:18 -0400
X-MC-Unique: QrdOiWhhPe-eFx_NUA9wQg-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42ed8fb8ce0so5362891cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 13:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710273677; x=1710878477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sq8Q7APw4DcVkqWc+oejv1fuFkz+jT1GPn/e6E4W0Yk=;
        b=sYq8+nTbIFBMrwgd+52vllIFweuUmvWBYECfBwJyo9yjxr8uMDBnVzNB225kJ7pL9A
         0lRuAFgXeXGssByjfQdIKiAnNFYLbY3Iza4SJD34lrtH5qnTxRl9RYNc0qbyT/kNbknF
         U5dcZDPWXuH9rBns6wFbtj6KUWLd4/UM0zloTOvtpBTUia5QQFLLTMMFB03/hLpU+z4T
         tdaVNEdxvQRyUu0I3/VHrtZJhmKUmx/JRrmTQjES6CZi+39GttAO4CNgF/iuyqq5Rfxb
         Eu8Vv3e8G7x+IGJNkOTNmwQmc0Kegi6zXbRA63jq5gUbH1HmCRvIkJgrgOTCVaRvTAUr
         GA/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1CEzqmEh+ecPDiso08uQwbQjcy2mpzkQ7ae8Ul0r+v4CoKY0WkXWWTJH+5+JebQbvOD15p4j7pt/Rq0a3kpBA+FJp8rcmtbzMSKyT8g==
X-Gm-Message-State: AOJu0YwJv58Bak8K5L8kOwC6URGzUErksqo5EQyHInqL9Hk5kftFRcwB
	UXXZ3mJ2swvug6QU0AQC4+Z4AiEglJNIkxJf2Mbs9tsQhic63HoKQm9xM57YHsx3wOuTPNtNQ0X
	NZnqX/bs37bRi+5iYy3nXFAwPoiv+BWSR1a1KIneBzWyVUcks8zhQ0DzU/aibTSM=
X-Received: by 2002:a05:620a:2715:b0:788:79d3:402e with SMTP id b21-20020a05620a271500b0078879d3402emr3492050qkp.7.1710273677510;
        Tue, 12 Mar 2024 13:01:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFci8LJ7emFKeNaMhqM4be32i5qK2b8ngNE0xIpit/UyC+7KzN+KAk6ieS3wmiUOL3/zXkrQ==
X-Received: by 2002:a05:620a:2715:b0:788:79d3:402e with SMTP id b21-20020a05620a271500b0078879d3402emr3492030qkp.7.1710273677131;
        Tue, 12 Mar 2024 13:01:17 -0700 (PDT)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id f18-20020a05620a12f200b007882915ca34sm3977850qkl.40.2024.03.12.13.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 13:01:16 -0700 (PDT)
Date: Tue, 12 Mar 2024 16:01:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH RFC 00/13] mm/treewide: Remove pXd_huge() API
Message-ID: <ZfC0ioxUrCK5sX1k@x1n>
References: <20240306104147.193052-1-peterx@redhat.com>
 <f9b786bf-27d9-4e16-b8d2-2a2666d917df@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <f9b786bf-27d9-4e16-b8d2-2a2666d917df@csgroup.eu>
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
Cc: "x86@kernel.org" <x86@kernel.org>, Muchun Song <muchun.song@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Christophe,

On Mon, Mar 11, 2024 at 09:58:47AM +0000, Christophe Leroy wrote:
> Hi Peter, and nice job you are doing in cleaning up things around _huge 
> stuff.

Thanks.  I appreciate your help along the way on Power.

> 
> One thing that might be worth looking at also at some point is the mess 
> around pmd_clear_huge() and pud_clear_huge().
> 
> I tried to clean things up with commit c742199a014d ("mm/pgtable: add 
> stubs for {pmd/pub}_{set/clear}_huge") but it was reverted because of 
> arm64 by commit d8a719059b9d ("Revert "mm/pgtable: add stubs for 
> {pmd/pub}_{set/clear}_huge"")
> 
> So now powerpc/8xx has to implement pmd_clear_huge() and 
> pud_clear_huge() allthough 8xx page hierarchy only has 2 levels.

Those are so far out of my radar, as my focus right now is still more on
hugetlbfs relevant side of things, while kernel mappings are not yet
directly involved in hugetlbfs, even though they're still huge mappings.

It's a pity to know that broke arm and got reverted, as that looks like a
good thing to clean it up if ever possible.  I tend to agree with you that
it seems for 3lvl we should define pgd_huge*() instead of pud_huge*(), so
that it looks like the only way to provide such a treewide clean API is to
properly define those APIs for aarch64, and define different pud helpers
for either 3/4 levels.  But I confess I don't think I fully digested all
the bits.

Thanks,

-- 
Peter Xu

