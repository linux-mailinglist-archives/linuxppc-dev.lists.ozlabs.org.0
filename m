Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC164F9FC4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 02:01:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CRCR1vLLzF5yG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 12:01:55 +1100 (AEDT)
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
 header.i=@intel-com.20150623.gappssmtp.com header.b="aNNgsrA5"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CR8J4bXSzF456
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 11:59:10 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id n23so105558otr.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 16:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bbhHvXUlpKSBxAaen2slRAaR7FABAWW5b4ZHt5uDQAs=;
 b=aNNgsrA5EIFA9nVSCXy/uyenu1ifAR2ZxMR/sDW6HqK6vSTYpxIpmBrjP/vDjDaVnk
 l4xh/AHHGyooUHFp1c42LTwLTpwdgtUaJfWvN3Y7CFSVzmwzvxLUaHQBl+Ibev8TBoid
 2FUFgDLM8vD2vOwzS+IEshtyE4Y+b3ieXpqqo3Mxdly/m4ak6FnwfnCLEy5DGwsI7qq9
 7rFre8WIcpfUZvKl+y7wQa6yOvynR61ZdKROoMobKwRLP3lkc2bkhgPK6DIYIEcGXZ4p
 WUPwy1pR33Kp+/7N+4r5VmPuWnlSLsuN14iR6BROP5kh/8NTzRoeUzJllo7I56/tNtvu
 ttpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bbhHvXUlpKSBxAaen2slRAaR7FABAWW5b4ZHt5uDQAs=;
 b=hDqm2nzjN2f7hFP3Vr7LK8QuN4F0g3IzOQrnPtvTgbDnYR5y1ScXRZQibe7H5ZnVN/
 uQk4os+6u6YWoeN6PJ3CNNUFK2las/VqD3bNHv9X9iIYk4uFaveU8cWqZ2EVmTa0rkHQ
 9upU0yAi2gM9dzS6J82nO66xPw51lfHaBDdX+l6ILZ+vPsAmnb2206j5ZNSgzoq2zEX7
 rEqQixwBeNJn9aKD5rZEpQ710J+KOBd6+s5pe9P/uTQpmF6lgwxooQAIzINd0J7+ZOZP
 6G9Ed5R7H5q90A2ClBy65/iEEW7i4QxhNQ4oCQf4sTFmq+7lGb+qUrKRj9/b5ru7dBLP
 +uKQ==
X-Gm-Message-State: APjAAAWPfoEuvqHHxxjmB2cOCrotZ8SkRIjlwf2rS9JZFw/DTK8VAnHF
 2Npr5+6h5+xkxKWx/3F/QiBTmX5Fv9zBghXW36GSauHyYlY=
X-Google-Smtp-Source: APXvYqwE5wMeaGSIvNyY2BTy28AxuQMGsjlQOMQJ/g9Nuz73c9JXx/mbsafhYfzhqVldWgO1VAvXOO9/vT+g3CHkLek=
X-Received: by 2002:a05:6830:1b70:: with SMTP id
 d16mr300372ote.71.1573606748988; 
 Tue, 12 Nov 2019 16:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
 <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
 <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
 <20191112234250.GA19615@ziepe.ca>
In-Reply-To: <20191112234250.GA19615@ziepe.ca>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Nov 2019 16:58:57 -0800
Message-ID: <CAPcyv4hwFKmsQpp04rS6diCmZwGtbnriCjfY2ofWV485qT9kzg@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>
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
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org,
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

On Tue, Nov 12, 2019 at 3:43 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Nov 12, 2019 at 02:45:51PM -0800, Dan Williams wrote:
> > On Tue, Nov 12, 2019 at 2:43 PM John Hubbard <jhubbard@nvidia.com> wrote:
> > >
> > > On 11/12/19 12:43 PM, Jason Gunthorpe wrote:
> > > ...
> > > >> -            }
> > > >> +    ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
> > > >> +                                page, vmas, NULL);
> > > >> +    /*
> > > >> +     * The lifetime of a vaddr_get_pfn() page pin is
> > > >> +     * userspace-controlled. In the fs-dax case this could
> > > >> +     * lead to indefinite stalls in filesystem operations.
> > > >> +     * Disallow attempts to pin fs-dax pages via this
> > > >> +     * interface.
> > > >> +     */
> > > >> +    if (ret > 0 && vma_is_fsdax(vmas[0])) {
> > > >> +            ret = -EOPNOTSUPP;
> > > >> +            put_page(page[0]);
> > > >>      }
> > > >
> > > > AFAIK this chunk is redundant now as it is some hack to emulate
> > > > FOLL_LONGTERM? So vmas can be deleted too.
> > >
> > > Let me first make sure I understand what Dan has in mind for the vma
> > > checking, in the other thread...
> >
> > It's not redundant relative to upstream which does not do anything the
> > FOLL_LONGTERM in the gup-slow path... but I have not looked at patches
> > 1-7 to see if something there made it redundant.
>
> Oh, the hunk John had below for get_user_pages_remote() also needs to
> call __gup_longterm_locked() when FOLL_LONGTERM is specified, then
> that calls check_dax_vmas() which duplicates the vma_is_fsdax() check
> above.

Oh true, good eye. It is redundant if it does additionally call
__gup_longterm_locked(), and it needs to do that otherwises it undoes
the CMA migration magic that Aneesh added.

>
> Certainly no caller of FOLL_LONGTERM should have to do dax specific
> VMA checking.

Agree, that was my comment about cleaning up the vma_is_fsdax() check
to be internal to the gup core.
