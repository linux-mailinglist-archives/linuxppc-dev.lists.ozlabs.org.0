Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id F2EF98D033E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 16:21:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b/3JO/Di;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ckg+mCz9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnyMm3MN3z78jC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 00:15:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b/3JO/Di;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ckg+mCz9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnyLz6p6xz3w82
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 00:14:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716819253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFzMZWvRCDrb7WkYa5wLatMYu1+RpvoRMJMjVnqZvBU=;
	b=b/3JO/DiCWuqT7mrNRNL72nKwG9RuveCwsU+yoyUDiZAKGoc/GkD8pIvLn2YIEnEltj9Sd
	vnxtWmH2XJhdoOHPpgS1lDt7vPULej2/ppwSU7CU9D7+hdiDPp9O75WSe/O8qON/hP2KsU
	9PyY/NXoO8QMbzlqRttfbqpI+SVtfYw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716819254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFzMZWvRCDrb7WkYa5wLatMYu1+RpvoRMJMjVnqZvBU=;
	b=Ckg+mCz9aPUbVRG4nBUD+55RP+1XFIrl3goIDgqgkLgK1T/QkvIb+oN6ojeaudjiOe/Acm
	guJ4cfL5jqUrX0dA4X/t9dNBb6QGfHiLNCvr63G3OE6E2ppPyXub+ey4kG2gkkIDsRIt6g
	l/+Xfzm7zxfkXJt3lPg2FBNG9BI0Gg8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-acoUMaMeMQeL52gBPK3xhw-1; Mon, 27 May 2024 10:14:10 -0400
X-MC-Unique: acoUMaMeMQeL52gBPK3xhw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ab960d4c84so28186d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2024 07:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716819250; x=1717424050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFzMZWvRCDrb7WkYa5wLatMYu1+RpvoRMJMjVnqZvBU=;
        b=IJ0CphLSOmTGYfO1IBvKZ0TfAHvMsQaALpfcdTaTE7hn3I1I9o+apwM35FAXe68YCM
         VSuT9AZ+HrUKjBexhVfpB/z0fP1NHoG+WTc0K8FzJcMF3cdLVj+LYTYLEvdUcGdDUSds
         QQYsj35xCh0bdlXeLP6Yt2RzN4uFn4Ui4zue1GSFJ6cWRSBHWI5MbX07WrF7HyQBNv3G
         hA8IoLYOw3392CP00ZlA1I4AXjYKXE95bDAb3xiKcrhqhhiREhFQn7I79BNU6VBV+WMR
         S46k9ioN2GyGW/r9lYJwtxMj+q0nr9rszMlMUgRQ3Fo//nWjZioUqQjEHA/bvf3PFzX6
         8MKw==
X-Forwarded-Encrypted: i=1; AJvYcCXqBgOzSCKZP+S43je96eK1JkAXA1Hury6Uk0MsXC0pSx4aizSqD4Rgz/YR/+lY0vM9xRaLZ345DFWcourkYSmatrRyp0AyGI7nUFg/vw==
X-Gm-Message-State: AOJu0YzgfV12E7xvSyZ//5jOqTz8muPJJMfZLMTxMt2jKW1GPZWdOwwp
	+02ppRRApC4EL0IVAV5phAAtLpHCsSTyBuS55vAl5xy5Psp0DwQS/3Cind07LKd3SIFug8J/8Hh
	yBnBllPWMv+XCAAUafOrh3Bm0ofEd4OR8+TrYEFTweGAQxy9w98NDNWJlBcd9YBU=
X-Received: by 2002:a05:622a:1a08:b0:439:ecc6:cdff with SMTP id d75a77b69052e-43fb0e50bbdmr106246841cf.1.1716819249866;
        Mon, 27 May 2024 07:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd8th8Wg469CYBTawHV9rsQeFuB8nclhehcyxMjGfWytXD5S2gp1EDIKK4hPSKKRLENR5EfA==
X-Received: by 2002:a05:622a:1a08:b0:439:ecc6:cdff with SMTP id d75a77b69052e-43fb0e50bbdmr106246401cf.1.1716819249131;
        Mon, 27 May 2024 07:14:09 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43fb16b97b5sm33974641cf.18.2024.05.27.07.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 07:14:08 -0700 (PDT)
Date: Mon, 27 May 2024 10:14:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC PATCH v2 00/20] Reimplement huge pages without hugepd on
 powerpc (8xx, e500, book3s/64)
Message-ID: <ZlSVLv2JlsZS4f3d@x1n>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <Zk-bpBZ_yjsj_B2z@x1n>
 <87jzjj4y0t.fsf@mail.lhotse>
MIME-Version: 1.0
In-Reply-To: <87jzjj4y0t.fsf@mail.lhotse>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 24, 2024 at 02:46:58PM +1000, Michael Ellerman wrote:
> Christophe is a powerpc developer :)

Yes, definitely. :)

> 
> I'll help where I can, but I don't know the hugepd code that well, I've
> never really worked on it before. Nick will hopefully also be able to
> help, he at least knows mm better than me, but he also has other work.
> 
> Hopefully we can make this series work, and replace hugepd. But if we
> can't make that work then there is the possibility of just dropping
> support for 16M/16G pages with HPT/4K pages.

Great, thank you!

-- 
Peter Xu

