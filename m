Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B203881544
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 17:09:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QsIi2vwT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QsIi2vwT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0D7n1LJzz3dXF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 03:09:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QsIi2vwT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QsIi2vwT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0D702kFcz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 03:09:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710950953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/kVb2OPEa9Hz3NlGswxjF/cBh1c8MnT1EuBR8prPYIM=;
	b=QsIi2vwT+LhoPRMSUeJLBku4CKZX4DITytSc3EgmIjO/NoOSEGCuMzXaLRHlxdJiRTzdUa
	dtY5cyxrzy4QRiGm9vEkRPT1ZLy4UetLaVmEB+nBBh7tmxUXK2YAp/2Z+24/6Ln7Cvn/Iv
	ar6x4pOsWuQIxjqES20bz7z83SfcArA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710950953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/kVb2OPEa9Hz3NlGswxjF/cBh1c8MnT1EuBR8prPYIM=;
	b=QsIi2vwT+LhoPRMSUeJLBku4CKZX4DITytSc3EgmIjO/NoOSEGCuMzXaLRHlxdJiRTzdUa
	dtY5cyxrzy4QRiGm9vEkRPT1ZLy4UetLaVmEB+nBBh7tmxUXK2YAp/2Z+24/6Ln7Cvn/Iv
	ar6x4pOsWuQIxjqES20bz7z83SfcArA=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-lp9jw5uzM9KUBd9POpTm1g-1; Wed, 20 Mar 2024 12:09:09 -0400
X-MC-Unique: lp9jw5uzM9KUBd9POpTm1g-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6dea8b7e74aso2465508a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 09:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710950948; x=1711555748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kVb2OPEa9Hz3NlGswxjF/cBh1c8MnT1EuBR8prPYIM=;
        b=inghbOdVQUOXyWYppn4Ssf2TpyFdsZyKRpQTbdtAL3NVvhMB4xinNQQcVqgmeC930c
         Flv3Juqzm7nv3we38W7cAS3rTtf+2soJLdxNcHe4FzhyvL72jsfSyPxroNMzHHsDbSn2
         KZYra9L9SJD0LH3ZyfRCX3r+r1ZUG4ZO34XP/qNV52amAd4jSGwy0O5/0GPRVtfIJp05
         w0d/FnQGDxrKMEm2KNb1B2DcCLAiLOoN+cN0FBdtU6gyRab1Rx8YBuEn0yYkDxR0pssS
         tihchv0UurnE0E+li0WODZAw9vhJj7qgUzv0AjqCYwgYQYN7t7DvC0/BO3jLV6Su0pjZ
         +M4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQy7MQId5g8GSDxYzg1PZxR8jdDIBUwYCQAC1MHf6EIImlgoegKd5Q+9oA5a5z2lcTCQY0kS+fcEq4i1YUPdCrF46sV8CAtpsxa+BOHQ==
X-Gm-Message-State: AOJu0Yzn+BZIppOrPyeFcfFeaYB/SvS15ujFlPPwh2aPtZI9E4v1OUok
	/sueN+VaKJlIbQeoEbVi6bZgRf4bLhigaReCTsV1ZM1suA2QGGmjloSeC4Z+2XNF4l8537UCNum
	mVFR8lB1R0WVMhbfheeNiJ5D59LGE0y+STjJ0a+leHjTXGxt0q3TVqTM5GEYGLNM=
X-Received: by 2002:a9d:7ad9:0:b0:6e6:a1a4:d6ec with SMTP id m25-20020a9d7ad9000000b006e6a1a4d6ecmr5509633otn.3.1710950948523;
        Wed, 20 Mar 2024 09:09:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUPcSOgWRtuZK7x7eAKmfFnaS1NKw8N142/BtimLIrxti/cRS6mu+CLtqkpSIoYmn0o6zxkQ==
X-Received: by 2002:a9d:7ad9:0:b0:6e6:a1a4:d6ec with SMTP id m25-20020a9d7ad9000000b006e6a1a4d6ecmr5509595otn.3.1710950948100;
        Wed, 20 Mar 2024 09:09:08 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id fn12-20020ad45d6c000000b00690fed3da61sm7963317qvb.109.2024.03.20.09.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:09:07 -0700 (PDT)
Date: Wed, 20 Mar 2024 12:09:05 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Message-ID: <ZfsKIResY4YcxkxK@x1n>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-10-peterx@redhat.com>
 <7b7d6ce1-4a3f-4392-951d-a9bd146c954c@csgroup.eu>
 <ZfLzZekFBp3J6JUy@x1n>
 <1f6ad500-3ff7-44d4-8223-067bd2ed9ffe@csgroup.eu>
 <20240318161519.GA5825@nvidia.com>
 <e0417c2a-2ef1-4435-b5a7-aadfe90ff8f1@csgroup.eu>
 <20240319232656.GC159172@nvidia.com>
 <7ca8f19e-7517-404a-b7bb-92ac516d87c8@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <7ca8f19e-7517-404a-b7bb-92ac516d87c8@csgroup.eu>
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 20, 2024 at 06:16:43AM +0000, Christophe Leroy wrote:
> At the first place that was to get a close fit between hardware 
> pagetable topology and linux pagetable topology. But obviously we 
> already stepped back for 512k pages, so let's go one more step aside and 
> do similar with 8M pages.
> 
> I'll give it a try and see how it goes.

So you're talking about 8M only for 8xx, am I right?

There seem to be other PowerPC systems use hugepd.  Is it possible that we
convert all hugepd into cont_pte form?

Thanks,

-- 
Peter Xu

