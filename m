Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1390FA057
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 02:38:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CS1F5d5RzDqSk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 12:38:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="pgvm7B7M"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CRym0LcjzF5vt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 12:35:59 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id m15so193602otq.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 17:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tA9TOCxBga9LLC7wRjd3ONed6e5UCLIuIdqzN/pcWuk=;
 b=pgvm7B7MKRNHPnnm+UXqpNAxEKn59mgIkjpVIugT59Mu8TwvXIAzzyQhvDiVCxIl0p
 vI+Yj+13Wusmq5tADceFQlsKUjuwgmmDrjkNeYGEIUHh9w8tZNldmP6Q5WtjVpISdJ0i
 r3oVh4apWhwsDdj9Nw0bWAyVdq8zxIhXTRj/8PmhzFCoHQ/9X/Dg5B4Hj6Y0ruPyQaaR
 rEPfI8qEDLrnHlL1idX+oRviz/9wQZUiz6o40remYNFeKqLceiYDgbAXk1ppNt84zSqw
 zf+6WmCRWk7Wod/xBPOURyhyWoKZqScoLNTr5ASvgI3i5qH5c+mNJETCAbPrPmJU7Yqj
 fNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tA9TOCxBga9LLC7wRjd3ONed6e5UCLIuIdqzN/pcWuk=;
 b=JwGmuZ2hvbI7XqMdK496I2DENwDAU/2m+c9/+YQ6VfJA9cZ1HN/qNvLOtVVB6a8V2D
 MecOwF3zksKxcDny3shTZgzqt8XePZ6BGGRq6D969cn8b3QM5QNMfkbuHVjekF5pYF50
 pvgIvXJWFVYUIkazhwn80MtaUcPsddsCBDs/F6WWupQycl60K1Ld0MJ/MdlewXIpT0UM
 +6T5+z6kgtRHhfJ+j3M3oqbh3a7jbmxJlbhU9Wg3XlprLastRO2Ql+HYsrHoqWS+TrWI
 UzCzo5QPIyT5Fsac1fQYMoLZPbLhsd/473LlzkdsBsKl3mGk1sdkAWEcxkhldnaE688K
 RP4A==
X-Gm-Message-State: APjAAAUWFJwOwYp656yHJ0wmaN3CESstY03V1MN68TH2h/2AF2cBAt6b
 fmpDZe7m4EWNjldrKL6i95BcH7c0XrPgjejbFPZtPA==
X-Google-Smtp-Source: APXvYqzyV061KEXPKPAkyAkGRgXJ6fWU+P7KwNCWCXXtSomJ5IUaejCErE/o1rH0NBMapixozrDCWZBdHagrZr75cJE=
X-Received: by 2002:a05:6830:1b70:: with SMTP id
 d16mr411248ote.71.1573608957281; 
 Tue, 12 Nov 2019 17:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
 <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
 <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
 <20191112234250.GA19615@ziepe.ca>
 <CAPcyv4hwFKmsQpp04rS6diCmZwGtbnriCjfY2ofWV485qT9kzg@mail.gmail.com>
 <28355eb0-4ee5-3418-b430-59302d15b478@nvidia.com>
In-Reply-To: <28355eb0-4ee5-3418-b430-59302d15b478@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Nov 2019 17:35:46 -0800
Message-ID: <CAPcyv4hdYZ__3+KJHh+0uX--f-U=pLiZfdO0JDhyBE-nZ=i4FQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
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
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
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

On Tue, Nov 12, 2019 at 5:08 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 11/12/19 4:58 PM, Dan Williams wrote:
> ...
> >>> It's not redundant relative to upstream which does not do anything the
> >>> FOLL_LONGTERM in the gup-slow path... but I have not looked at patches
> >>> 1-7 to see if something there made it redundant.
> >>
> >> Oh, the hunk John had below for get_user_pages_remote() also needs to
> >> call __gup_longterm_locked() when FOLL_LONGTERM is specified, then
> >> that calls check_dax_vmas() which duplicates the vma_is_fsdax() check
> >> above.
> >
> > Oh true, good eye. It is redundant if it does additionally call
> > __gup_longterm_locked(), and it needs to do that otherwises it undoes
> > the CMA migration magic that Aneesh added.
> >
>
> OK. So just to be clear, I'll be removing this from the patch:
>
>         /*
>          * The lifetime of a vaddr_get_pfn() page pin is
>          * userspace-controlled. In the fs-dax case this could
>          * lead to indefinite stalls in filesystem operations.
>          * Disallow attempts to pin fs-dax pages via this
>          * interface.
>          */
>         if (ret > 0 && vma_is_fsdax(vmas[0])) {
>                 ret = -EOPNOTSUPP;
>                 put_page(page[0]);
>         }
>
> (and the declaration of "vmas", as well).

...and add a call to __gup_longterm_locked internal to
get_user_pages_remote(), right?
