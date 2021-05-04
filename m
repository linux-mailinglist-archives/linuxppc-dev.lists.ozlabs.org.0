Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52400372E1D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 18:31:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZQMN2GDRz302c
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 02:31:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=PV7H9lwE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=PV7H9lwE; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZQLr0QsZz2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 02:30:41 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id l4so14114332ejc.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ctdlXSgA9WB8/LgWtL0CJavRE/GrXThnOTOG0Yn+j2M=;
 b=PV7H9lwE2fkMD9FY3zZI2IQ1LJUNNJi+MErHVDmQXkw7CP2xrU/TYHlHczAfDm5lVa
 KDiLaKQ00UK/IHHZuLCrQoUb6nNF2np0jdBgPOKnW02lTxjNCfGGcqjbWs0FnUqtA2bw
 4MCLLKv0oasjlveEwIDLg7pD/6kl+SgNCQ9ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ctdlXSgA9WB8/LgWtL0CJavRE/GrXThnOTOG0Yn+j2M=;
 b=qt8+nCUAriEHrAZ+t333xCJclQemdMqhUFZ14W0KUFQTODdfR874WoBmRotXjLmnb7
 c18g2Eb26WODHdL9cNRh2R1CLy2gN24OeXZ9NVOqmxvhZGRyu3j0MS8/HqwDGTiF01+Q
 dt8+L6hH2/k4xl2Yg+83qj0mDCu9ZBXkW+t9CWinQANFKu3EBsT01bNAx7Ia9MP8o957
 mdrDt7n6GsUdNIZu1Gu/No35b+Df1sEflZEJKyQ2TmrO8HhQuepYST66qs8A7y+FL3BW
 XLpf5tQtwa1XhVWuQsOI2F5OKqt9XAWK5v/zr+tTDUAeYjeVnlLPrwO6r+fNd/RwA85y
 Y5jQ==
X-Gm-Message-State: AOAM531OGC6GvXxlO4mjXz10wwvQMMJZUh1umbbrUAsEBXMKVrSQ8gUa
 B9K1N/iH1h6yl3+k7UgykQO6Kw==
X-Google-Smtp-Source: ABdhPJxnDxkwXkTAVEK/PThX9uS74sv8umtjiWwfjWMmVibtFA3GJeFZ5aOd5+yEYTEA4wsXOVzSiw==
X-Received: by 2002:a17:906:d145:: with SMTP id
 br5mr22140782ejb.452.1620145837348; 
 Tue, 04 May 2021 09:30:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id kt21sm1615904ejb.5.2021.05.04.09.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 09:30:36 -0700 (PDT)
Date: Tue, 4 May 2021 18:30:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <YJF2qm+voakTWq9M@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>, Greg Kurz <groug@kaod.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan> <YJFFG1tSP0dUCxcX@kroah.com>
 <20210504152034.18e41ec3@bahia.lan>
 <YJFY7NjEBtCSlJHw@phenom.ffwll.local>
 <20210504155327.GA94750@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504155327.GA94750@nvidia.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Greg Kurz <groug@kaod.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, qemu-ppc@nongnu.org,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 04, 2021 at 12:53:27PM -0300, Jason Gunthorpe wrote:
> On Tue, May 04, 2021 at 04:23:40PM +0200, Daniel Vetter wrote:
> 
> > Just my 2cents from drm (where we deprecate old gunk uapi quite often):
> > Imo it's best to keep the uapi headers as-is, but exchange the
> > documentation with a big "this is removed, never use again" warning:
> 
> We in RDMA have been doing the opposite, the uapi headers are supposed
> to reflect the current kernel. This helps make the kernel
> understandable.
> 
> When userspace needs backwards compat to ABI that the current kernel
> doesn't support then userspace has distinct copies of that information
> in some compat location. It has happened a few times over the last 15
> years.
> 
> We keep full copies of the current kernel headers in the userspace
> source tree, when the kernel headers change in a compile incompatible
> way we fix everything while updating to the new kernel headers.

Yeah we do the same since forever (it's either from libdrm package, or
directly in the corresponding userspace header). So largely include/uapi
is for documentation

> > - it's good to know which uapi numbers (like parameter extensions or
> >   whatever they are in this case) are defacto reserved, because there are
> >   binaries (qemu in this) that have code acting on them out there.
> 
> Numbers and things get marked reserved or the like
> 
> > Anyway feel free to ignore since this might be different than drivers/gpu.
> 
> AFAIK drives/gpu has a lot wider userspace, rdma manages this OK
> because we only have one library package that provides the user/kernel
> interface.

But since we have some many projects we've started asking all the userspace
projects to directly take the kernel ones (after the make step to filter
them) so that there's only one source of truth. And also to make sure they
don't merge stuff before the kernel side is reviewed&landed. Which also
means we can't ditch anything userspace might still need on older trees
and stuff.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
