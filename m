Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E94CD125BA5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 07:54:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47djKm1DQLzDqpH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 17:54:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="SiBKFSWb"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47djHr3GkTzDqnG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 17:52:47 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id h9so3306576otj.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 22:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dhLbadWhXkT8uLUvoIQHEOPXZo986OHkQZmNW5JELSg=;
 b=SiBKFSWbGZ/DlTuqAeJWCQJfko4CpkONzPTdXHk5ITfn6wjNPKckEYMfWXVa2KjE/9
 EnvKM5uCkbPNuMcmnnmOIL13PX8cysvho7VLWXbG/qQdn+K7/fzi8Ww4DNnz531U3iaT
 ek1DixOnTmNKqPks25kBzv6fRlRYJb99R8rIhogy+n5/aKHmuRVk2bVwwFWgffjz3noA
 ZerH0bwQzplUBLkBL/JrHxP9P4K0mBWvBTnlliMpof9I4Sttm4IJTOIKoWl16jE3wTmG
 IAzt5ZvdYfPhwgyAVURwEUcOXBJqNdhdpF54lEQXTrtdeMxzkaBCmBvpJo6eizOwHL7A
 6gAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dhLbadWhXkT8uLUvoIQHEOPXZo986OHkQZmNW5JELSg=;
 b=ajNOtFkSbT9p3dnScXRZ37fZsxgK86cgRwVNuDhT0cowWZlVTKQK2WjK3xGBjjTBOa
 fhBA6h+WakWTLtfN1mjfNj4XlETxRalOvXBLnuuqUJ7AVhtYquFbYSQL/AgmqHTYEo0h
 WcWlU6Hk4ZM9a0QxakB7AJm3BgwC+vQtyqC0BbOEUHtZpNklVMVhd8FuqTrDo3Fkm3vf
 MM+C54D8L30kfmb5BKoAiEriI6VrAcZo76Bh8RD5uVDtMqnZGFywwhWI/avD5ogSeEap
 niqAun/bID5DRTMNTjrNhqhpmIM2sRAKQ7WQAlaREAy5EG9F9ZqSd3zzZFXEYZEwDsP1
 jqDg==
X-Gm-Message-State: APjAAAWLEX7DBODHy63jkCSpxGjr/kyL1WNbTBoj+0chviLk13lc4V75
 yhkguE3bIKaJRjyJ/6fS503tU2weWUuoBcfiOPUelA==
X-Google-Smtp-Source: APXvYqx2SQBCxtdPGsjOU3QNzNDjKuhpt1dAk9YJbVoUKqLIltD16iivCU1omckA5/EjvPPrP0sP5CVaNkhukyqv6+8=
X-Received: by 2002:a9d:6f11:: with SMTP id n17mr7085591otq.126.1576738365531; 
 Wed, 18 Dec 2019 22:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-5-jhubbard@nvidia.com>
 <CAPcyv4hQBMxYMurxG=Vwh0=FKWoT3z-Kf=dqES1-icRV5bLwKg@mail.gmail.com>
 <d0a99e75-0175-0f31-f176-8c37c18a4108@nvidia.com>
In-Reply-To: <d0a99e75-0175-0f31-f176-8c37c18a4108@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 18 Dec 2019 22:52:34 -0800
Message-ID: <CAPcyv4j+Zgom17UZ-6Njkij1R0UQ=vUQdnaEZj9qDezEUJSZGg@mail.gmail.com>
Subject: Re: [PATCH v11 04/25] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma <linux-rdma@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 18, 2019 at 9:51 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 12/18/19 9:27 PM, Dan Williams wrote:
> ...
> >> @@ -461,5 +449,5 @@ void __put_devmap_managed_page(struct page *page)
> >>          page->mapping = NULL;
> >>          page->pgmap->ops->page_free(page);
> >>   }
> >> -EXPORT_SYMBOL(__put_devmap_managed_page);
> >> +EXPORT_SYMBOL(free_devmap_managed_page);
> >
> > This patch does not have a module consumer for
> > free_devmap_managed_page(), so the export should move to the patch
> > that needs the new export.
>
> Hi Dan,
>
> OK, I know that's a policy--although it seems quite pointless here given
> that this is definitely going to need an EXPORT.
>
> At the moment, the series doesn't use it in any module at all, so I'll just
> delete the EXPORT for now.
>
> >
> > Also the only reason that put_devmap_managed_page() is EXPORT_SYMBOL
> > instead of EXPORT_SYMBOL_GPL is that there was no practical way to
> > hide the devmap details from evey module in the kernel that did
> > put_page(). I would expect free_devmap_managed_page() to
> > EXPORT_SYMBOL_GPL if it is not inlined into an existing exported
> > static inline api.
> >
>
> Sure, I'll change it to EXPORT_SYMBOL_GPL when the time comes. We do have
> to be careful that we don't shut out normal put_page() types of callers,
> but...glancing through the current callers, that doesn't look to be a problem.
> Good. So it should be OK to do EXPORT_SYMBOL_GPL here.
>
> Are you *sure* you don't want to just pre-emptively EXPORT now, and save
> looking at it again?

I'm positive. There is enough history for "trust me the consumer is
coming" turning out not to be true to justify the hassle in my mind. I
do trust you, but things happen.
