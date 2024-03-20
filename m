Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845B588188E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 21:25:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T5pkGtFI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T5pkGtFI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0KpQ2Cq8z3vXd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 07:25:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T5pkGtFI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T5pkGtFI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0Knd05Vdz3cT2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 07:24:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710966272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCFXpjAzH80ioMiekBjHvVKOxv2INAL7O3pqSOfLGCE=;
	b=T5pkGtFIl621uhQfqIzPxre3Mkp9q0/CeKQ7/jV11aF418URT/ZT8dmcol+X3MX64Ho1A3
	WBFNYEEw2lHilLhyYYDvqAQXrOcxrg8GJv61zNp/kUcmm+x7Jeq/7i2Nq51mBywKvf3tao
	Sp/xRvErEwAe0Ve/XsoO1MgGZumnP1w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710966272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCFXpjAzH80ioMiekBjHvVKOxv2INAL7O3pqSOfLGCE=;
	b=T5pkGtFIl621uhQfqIzPxre3Mkp9q0/CeKQ7/jV11aF418URT/ZT8dmcol+X3MX64Ho1A3
	WBFNYEEw2lHilLhyYYDvqAQXrOcxrg8GJv61zNp/kUcmm+x7Jeq/7i2Nq51mBywKvf3tao
	Sp/xRvErEwAe0Ve/XsoO1MgGZumnP1w=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-BT5v8mFmMn-6HLG7XfqDUQ-1; Wed, 20 Mar 2024 16:24:29 -0400
X-MC-Unique: BT5v8mFmMn-6HLG7XfqDUQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7830635331bso5280185a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 13:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710966269; x=1711571069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eCFXpjAzH80ioMiekBjHvVKOxv2INAL7O3pqSOfLGCE=;
        b=h2jywCtW//dGcqW0y8jIQPBt+Ij28IFSwkoDY6Sr7nGGl+GmkqHNqzWvT8Drlqrrmv
         TVxSeh0p5qE7bjCKQr2OtQbGgOyFGd7E1s8psMxrJAVANs1gBGrwMy1P+YX7f/wPAxO3
         A4PCJXclVwfoq7wZq6LQD5O5lAjqqFKNDm4I2n4ja3C/SPh/SETZRleChn0LVACVJ30V
         sk/Zi6g88w8yHKCO36YWQjEsFVYFhGoNW0day9nonzxI7B5dWTFaPUNf/+wiL0evo+4O
         ci24E1Trv4X0QznTc0rnOCMD9Zp16xCxr6UlcKgkhnxEGeux2GV6W1BhNbIWe7Ct0Ok6
         fl7g==
X-Forwarded-Encrypted: i=1; AJvYcCVfbGGU/fznSmrgKWnfvjQVKIjyxh8W3whEqrOuHAve/s1E4cp1ZWuSF12xXTEZHuYKRfa515MOoahQlLiVuzUJvvOMxf/kopsOwRtsUw==
X-Gm-Message-State: AOJu0YxUoLhNfnXWaYfK+c2asvBKxOaGAluWbAsJ5ThD1O/ctaTlhHgj
	xikRRHX3i/OVJJd12jHym6SR/Hbfgl2q2owuvZKHTYAkZ/WRFrjmeG+IL9TFT2i9w4ljA9Y4R6p
	pj/JbhXUsvDvVXXwq91sdjKEBjbBYgXXC2Y4zh1ND1Yc+Weyqat3HKWxLLt+biyk=
X-Received: by 2002:a05:6214:4285:b0:68f:e779:70f2 with SMTP id og5-20020a056214428500b0068fe77970f2mr3011041qvb.3.1710966268732;
        Wed, 20 Mar 2024 13:24:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC7ZXjclbG6h5wFeCIdBAt5YTulJwCv/uK86AiBxheygftq1ifha1EzMNeKJfkJ4R9dQ9Xpg==
X-Received: by 2002:a05:6214:4285:b0:68f:e779:70f2 with SMTP id og5-20020a056214428500b0068fe77970f2mr3011015qvb.3.1710966268333;
        Wed, 20 Mar 2024 13:24:28 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id im14-20020a056214246e00b0069049298fccsm8155728qvb.65.2024.03.20.13.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 13:24:27 -0700 (PDT)
Date: Wed, 20 Mar 2024 16:24:25 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Message-ID: <ZftF-Qn46aV7rjD1@x1n>
References: <20240313214719.253873-10-peterx@redhat.com>
 <7b7d6ce1-4a3f-4392-951d-a9bd146c954c@csgroup.eu>
 <ZfLzZekFBp3J6JUy@x1n>
 <1f6ad500-3ff7-44d4-8223-067bd2ed9ffe@csgroup.eu>
 <20240318161519.GA5825@nvidia.com>
 <e0417c2a-2ef1-4435-b5a7-aadfe90ff8f1@csgroup.eu>
 <20240319232656.GC159172@nvidia.com>
 <7ca8f19e-7517-404a-b7bb-92ac516d87c8@csgroup.eu>
 <ZfsKIResY4YcxkxK@x1n>
 <2e632389-eb4e-42af-adee-36d5ba6c3d0f@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <2e632389-eb4e-42af-adee-36d5ba6c3d0f@csgroup.eu>
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
Cc: Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, "x86@kernel.org" <x86@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 20, 2024 at 05:40:39PM +0000, Christophe Leroy wrote:
> 
> 
> Le 20/03/2024 à 17:09, Peter Xu a écrit :
> > On Wed, Mar 20, 2024 at 06:16:43AM +0000, Christophe Leroy wrote:
> >> At the first place that was to get a close fit between hardware
> >> pagetable topology and linux pagetable topology. But obviously we
> >> already stepped back for 512k pages, so let's go one more step aside and
> >> do similar with 8M pages.
> >>
> >> I'll give it a try and see how it goes.
> > 
> > So you're talking about 8M only for 8xx, am I right?
> 
> Yes I am.
> 
> > 
> > There seem to be other PowerPC systems use hugepd.  Is it possible that we
> > convert all hugepd into cont_pte form?
> 
> Indeed.
> 
> Seems like we have hugepd for book3s/64 and for nohash.
> 
> For book3s I don't know, may Aneesh can answer.
> 
> For nohash I think it should be possible because TLB misses are handled 
> by software. Even the e6500 which has a hardware tablewalk falls back on 
> software walk when it is a hugepage IIUC.

It'll be great if I can get some answer here, and then I know the path for
hugepd in general.  I don't want to add any new code into core mm to
something destined to fade away soon.

One option for me is I can check a macro of hugepd existance, so all new
code will only work when hugepd is not supported on such arch.  However
that'll start to make some PowerPC systems special (which I still tried
hard to avoid, if that wasn't proved in the past..), meanwhile we'll also
need to keep some generic-mm paths (that I can already remove along with
the new code) only for these hugepd systems.  But it's still okay to me,
it'll be just a matter of when to drop those codes, sooner or later.

Thanks,

-- 
Peter Xu

