Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DED05EFA6E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 11:07:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476lhR6r8YzF4cr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 21:07:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ffwll.ch header.i=@ffwll.ch header.b="KE3dP9Kv"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476lJ93LNxzF3tP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 20:49:44 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id z26so6899873wmi.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2019 01:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=oRi35sDRRYSuldGaopElz5IjGs2HKuOAcqpcVoq2wdY=;
 b=KE3dP9KvcLUq0hJbOhSYMXJr4Z1Cuc2Vc3sYtj3A588K1AxiPBhNRv2jLPVvg3HpiB
 asO9jGRsCrrAGrGXQuynbnaqIOtPdku/48txDbkC3jyEv0zbAYA99l9MmTsEF4lXmu4c
 UlGTi/e9P81uVhAoSbMh6OU7HFW5tO869wbeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=oRi35sDRRYSuldGaopElz5IjGs2HKuOAcqpcVoq2wdY=;
 b=ivouc8qBgBRfqLoqcGzHpdPwpowdp8ozNReAkYX4/TumS+e3+4esHP5jywwOKDB279
 ZuZLw5dVavKewq4prH6dSkuOFuCUZwBDSUocFa1vbHFRqoSNj+H46slKsCIMCD/Fwsgg
 CJzpl2YCJ2fiCng0fPyJDHob3z2sH1D5vZYUjV47167TYtA2Z/tVd1YfPuZsvaVFRtfu
 mxk34ZVdLTCA3ehESUDZrVvUvCc/yNDFMTckSdKdjnTHSuUwY76IRR5W78iVdTAwjT4D
 R4vmxGPwcK3S5SAgUiRzGAfThvLdyN7lUB3sJDbcfg+moRpmsrwfG9KRsiSym11ygrTB
 026w==
X-Gm-Message-State: APjAAAU24QkYIlFSL0Codm43C8Lo2FmL+aRK87DfMzzJhK77BydCIZDk
 m3Y/ohnFzEsoFOVt/D4YJGGUxw==
X-Google-Smtp-Source: APXvYqy+m+ZJ5zxOn/Dji3l65qB+TEfMmH5EiR/oP/iFPjGmYGokusjpTK+YoOlM7MNeuKLe8vHIRQ==
X-Received: by 2002:a7b:c925:: with SMTP id h5mr3591415wml.115.1572947379914; 
 Tue, 05 Nov 2019 01:49:39 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j19sm25704277wre.0.2019.11.05.01.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 01:49:39 -0800 (PST)
Date: Tue, 5 Nov 2019 10:49:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 09/19] drm/via: set FOLL_PIN via pin_user_pages_fast()
Message-ID: <20191105094936.GZ10326@phenom.ffwll.local>
Mail-Followup-To: John Hubbard <jhubbard@nvidia.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Alex Williamson <alex.williamson@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Chinner <david@fromorbit.com>, David Airlie <airlied@linux.ie>,
 "David S . Miller" <davem@davemloft.net>, Jan Kara <jack@suse.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
 Jonathan Corbet <corbet@lwn.net>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Paul Mackerras <paulus@samba.org>, Shuah Khan <shuah@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, bpf@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rdma@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-10-jhubbard@nvidia.com>
 <20191031233628.GI14771@iweiny-DESK2.sc.intel.com>
 <20191104181055.GP10326@phenom.ffwll.local>
 <48d22c77-c313-59ff-4847-bc9a9813b8a7@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48d22c77-c313-59ff-4847-bc9a9813b8a7@nvidia.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 04, 2019 at 11:20:38AM -0800, John Hubbard wrote:
> On 11/4/19 10:10 AM, Daniel Vetter wrote:
> > On Thu, Oct 31, 2019 at 04:36:28PM -0700, Ira Weiny wrote:
> >> On Wed, Oct 30, 2019 at 03:49:20PM -0700, John Hubbard wrote:
> >>> Convert drm/via to use the new pin_user_pages_fast() call, which sets
> >>> FOLL_PIN. Setting FOLL_PIN is now required for code that requires
> >>> tracking of pinned pages, and therefore for any code that calls
> >>> put_user_page().
> >>>
> >>
> >> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> > 
> > No one's touching the via driver anymore, so feel free to merge this
> > through whatever tree suits best (aka I'll drop this on the floor and
> > forget about it now).
> > 
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> 
> OK, great. Yes, in fact, I'm hoping Andrew can just push the whole series
> in through the mm tree, because that would allow it to be done in one 
> shot, in 5.5

btw is there more? We should have a bunch more userptr stuff in various
drivers, so was really surprised that drm/via is the only thing in your
series.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
