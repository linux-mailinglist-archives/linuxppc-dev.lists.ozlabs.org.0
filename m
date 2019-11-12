Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5905F9D78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 23:50:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CNHR22H3zF5mq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 09:50:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="g+shynx9"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CNBj2srRzF5l0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 09:46:05 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id l20so16417650oie.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 14:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7VZux41I9l8WsaFw4dnSKoQ+DL1POYbdTwXxPgsqOD8=;
 b=g+shynx9wA4O7/ZPSOmOhvhdFUBcChFyBb7EYzal20VNZRr14tSC8CEEu8RhYVOSKP
 ujUV0PqIhIH36zKviPook+HnkIHuRG88nmkcJhEvO3dJXo36vkvTp3d/Rv5+wpQSmOnU
 bQU0r/Fslk/8pH+0JUylPowC6D4ZnT5PrmHiZ30JXUbKpZ1rMZQ7kmT50jl8KfJoHp7m
 VvEK+ooBIm3vYED6+FUL9oFvr5SRhfXOEafMoAbLZrqHGNUi1aW7WiDjR5Rr2M+YKo5Q
 1bTGao6fq7ZjCHqOdYHjYnxFv2rb5XbPoQBWE0A1WALsbQq7HL4C3F5HipXsfgbDt8Vf
 nWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7VZux41I9l8WsaFw4dnSKoQ+DL1POYbdTwXxPgsqOD8=;
 b=opFfR5YImZZ8lcusQcej7VXPXSq0klTyxBGSADvJsRMHdC/0+hxj11dQgW2MuLjyB+
 uj0Esh+yXGJ9C/Cao1TpVuky52Q7vXRE85bo5RcRgRln98t28gHTM//pnbc4J0LTdtlG
 dc5ETOv+MT4qntvoJF66LajboiuOygej1Gm0Sua3RYOBMIsjpXfq/Bip9Ke8y9xCMWsW
 H1lpOOZttG2qUScoEqw62a1YxHo/PMXSknvP8uRa7y28fiLLAlcyeqGPqVS2ZNLlZnzt
 F/RWRFInOzFUFBa2szDvFwjTuboxJx9VOygIc/5qubW49PzmfvKZ34nnl7LFxknVj5fI
 flUA==
X-Gm-Message-State: APjAAAWGmMPe9gRpuq3QCdVTM4NNEJUqcnmhVla3nBkWeaAB/SlyMkY9
 8tLbfM8UBJr9j1JY5KQ2bGySnlyKHd2WGvSw0XRmmw==
X-Google-Smtp-Source: APXvYqwYMdEjXlo/ZXkQ25Q7OqLij5wE38qfmFx+c4Kh6ETnZQ80hOGe2SgdovvfY1Nwmo4LDa9vLeLDcR91Ofxlyck=
X-Received: by 2002:aca:ea57:: with SMTP id i84mr83905oih.73.1573598761920;
 Tue, 12 Nov 2019 14:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
 <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
In-Reply-To: <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Nov 2019 14:45:51 -0800
Message-ID: <CAPcyv4hAEgw6ySNS+EFRS4yNRVGz9A3Fu1vOk=XtpjYC64kQJw@mail.gmail.com>
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

On Tue, Nov 12, 2019 at 2:43 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 11/12/19 12:43 PM, Jason Gunthorpe wrote:
> ...
> >> -            }
> >> +    ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
> >> +                                page, vmas, NULL);
> >> +    /*
> >> +     * The lifetime of a vaddr_get_pfn() page pin is
> >> +     * userspace-controlled. In the fs-dax case this could
> >> +     * lead to indefinite stalls in filesystem operations.
> >> +     * Disallow attempts to pin fs-dax pages via this
> >> +     * interface.
> >> +     */
> >> +    if (ret > 0 && vma_is_fsdax(vmas[0])) {
> >> +            ret = -EOPNOTSUPP;
> >> +            put_page(page[0]);
> >>      }
> >
> > AFAIK this chunk is redundant now as it is some hack to emulate
> > FOLL_LONGTERM? So vmas can be deleted too.
>
> Let me first make sure I understand what Dan has in mind for the vma
> checking, in the other thread...

It's not redundant relative to upstream which does not do anything the
FOLL_LONGTERM in the gup-slow path... but I have not looked at patches
1-7 to see if something there made it redundant.
