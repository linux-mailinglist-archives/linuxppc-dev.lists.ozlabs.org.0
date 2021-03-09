Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E45D7333126
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 22:43:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw7xL6n8xz3cXF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 08:43:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TBrhxPJb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gUG6BAPs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=hsiangkao@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=TBrhxPJb; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=gUG6BAPs; 
 dkim-atps=neutral
X-Greylist: delayed 67 seconds by postgrey-1.36 at boromir;
 Wed, 10 Mar 2021 06:36:10 AEDT
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw56f2BgXz3cJW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 06:36:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615318567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Efq/XdZADcIcPCwsZh2URVLR5lQJ44Ni5hT8xLHIW0=;
 b=TBrhxPJbn3LhnKBUS5XiTlG9Luptw0xi7Rswr94ufi8HEk3/yR7ee6esV4iOvTBpJLC6JP
 OINvOeJfR1+JqsIimT36sjhUUBxGyMUd7vpt+iLcvWoLRjHh3IazBdKzNrh1dX78/H2+4Z
 QFk6fiZVNtTjUXriv1yHrEeE90FOu40=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615318568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Efq/XdZADcIcPCwsZh2URVLR5lQJ44Ni5hT8xLHIW0=;
 b=gUG6BAPsFEMwQrDNj/iqSCbF2rZdpOR9/65qp4oLSQ5LC3xDkngXtswVXdtwerFMwV0JYy
 4ABvnpLoZ/alq6NMb0usysRv0WPLztpwP5MzKzN3hxpGfF8dVDmiXkEF73bPgDmhxExCBx
 PDvUjezcDTFlFFZ8PdVAT4TC+AbW+bk=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-lLVQ4-v8Owm2K4XnyTwJeA-1; Tue, 09 Mar 2021 14:34:57 -0500
X-MC-Unique: lLVQ4-v8Owm2K4XnyTwJeA-1
Received: by mail-pf1-f198.google.com with SMTP id f17so9076801pfj.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 11:34:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0Efq/XdZADcIcPCwsZh2URVLR5lQJ44Ni5hT8xLHIW0=;
 b=UTtRTJd0u/8JKyHS5gkZivsLoWJ0naZYHpTOdc/tIhjPm6ffJwFbcj+RiusCWAXKGx
 kGIIijM97EQQ+Dzd1+DXfMacPDaYgfnTZc3G311gavnRZ0fYZ2sO4n8TZnVK6NyfaPJF
 +ijgOpDNuJPKPpxhKE03sLkDuqvwlxdBbvVc+Wzytm899hIHh3qrh8ADEidwgIGLc8xX
 /T9k3ie2MsA4UoNgx5NXt1BvK8VVyFQKZmcqncWQkDMY4aEYmvvK5fwZDLqIuecV/Csj
 C8+UlIj8Qjfgsci051Ry8sAVYPEgKJZ1P8t4f/7/7BWqYdSAd5MoSUc3ZYCy8jFCPJbX
 5Qrw==
X-Gm-Message-State: AOAM533t24LLc8OwZOwDEv++SxS2rcxHbTZLzIDdupeAQGWjbplVfK0I
 N55IHAW6wopaap4uVUSHinx4zTEbcOD+WBOAWYoU1DEhwhlJhHIEYsoW394mxKGpTrOQPd01h24
 njYTY0kba0pUKs7xp2EP0D6DSJA==
X-Received: by 2002:aa7:9910:0:b029:1f1:b41b:f95c with SMTP id
 z16-20020aa799100000b02901f1b41bf95cmr16633085pff.5.1615318496490; 
 Tue, 09 Mar 2021 11:34:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEm2SCLdiAFQWg7SaJuVodSLt/bg3Ucx4zEwtP8tgO/rpA7knG+uMEuOT6zr7D47BEOpBgZw==
X-Received: by 2002:aa7:9910:0:b029:1f1:b41b:f95c with SMTP id
 z16-20020aa799100000b02901f1b41bf95cmr16633059pff.5.1615318496200; 
 Tue, 09 Mar 2021 11:34:56 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id gw20sm3591571pjb.3.2021.03.09.11.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 11:34:55 -0800 (PST)
Date: Wed, 10 Mar 2021 03:34:41 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/9] fs: add an argument-less alloc_anon_inode
Message-ID: <20210309193441.GB3958006@xiangao.remote.csb>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-3-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210309155348.974875-3-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 10 Mar 2021 08:42:20 +1100
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Minchan Kim <minchan@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Nadav Amit <namit@vmware.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Nitin Gupta <ngupta@vflare.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 09, 2021 at 04:53:41PM +0100, Christoph Hellwig wrote:
> Add a new alloc_anon_inode helper that allocates an inode on
> the anon_inode file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Gao Xiang <hsiangkao@redhat.com>

Thanks,
Gao Xiang

