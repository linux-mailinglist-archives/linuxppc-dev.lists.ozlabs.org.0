Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B299733312A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 22:43:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw7xq53wPz3cWP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 08:43:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W9CsffVL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W9CsffVL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=hsiangkao@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=W9CsffVL; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=W9CsffVL; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw5CV0HMPz2xYq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 06:40:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615318818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=avJtp16vLH3ysAvGNZjvdMJS5OXrs5RoA1exdXYwigY=;
 b=W9CsffVLmOyKgENVycv/PW2DRqIIOWFYTyQ5lyY54PkDrn7doVTVWoojz2WfSZ2T/MI5po
 CTr3kNu2/hcEoTs219/YjXmTAHejePy9nvwaQ+HhCsG4OQfAgQO7mMjErzViGwOAlV7Lgq
 9R/7hyRquQkVHGm4tN0ltyJSQnaKT8M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615318818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=avJtp16vLH3ysAvGNZjvdMJS5OXrs5RoA1exdXYwigY=;
 b=W9CsffVLmOyKgENVycv/PW2DRqIIOWFYTyQ5lyY54PkDrn7doVTVWoojz2WfSZ2T/MI5po
 CTr3kNu2/hcEoTs219/YjXmTAHejePy9nvwaQ+HhCsG4OQfAgQO7mMjErzViGwOAlV7Lgq
 9R/7hyRquQkVHGm4tN0ltyJSQnaKT8M=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-q7bC2X9GNIKnAnansfiZfA-1; Tue, 09 Mar 2021 14:33:57 -0500
X-MC-Unique: q7bC2X9GNIKnAnansfiZfA-1
Received: by mail-pj1-f69.google.com with SMTP id z21so2699568pjt.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 11:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=avJtp16vLH3ysAvGNZjvdMJS5OXrs5RoA1exdXYwigY=;
 b=fXDjUEAD6eKFYgX7Rkxew6d99padOjvSFgAO4idgkg3gVDaTAspkXNNP0PEuoOxm7N
 Rg1eXKEBIq3yisYSziSKu361QBzSZlRMrfKLBKFnlvv/PWbjTve6xKEzBdW2OrfXiUQm
 xK0WLCora/h6c7GIGVrflIcg+kS2vqO4um8zFaOwN+5644TGnt+l8fw27xPCWdMgl+sV
 iyxeZYer3kQkz3+fpjFbnRoDudUIY7VOabd3eZmdUNO4d6jzQyl1onPJ0vCiqIZCupFG
 3VFp6hZj8Bu7Y0oQ6AvAkCK0Huun8AhsRFGl0HtsPt8XhKUSs7ZMDv2zKQC3H40ytUEb
 A0Vw==
X-Gm-Message-State: AOAM5310NY/URokjO72C9EZz/hYvYGO7tXePssGaqCJQ/1Tc3l1YviZJ
 LzDgy/JRRUVD21vb7Tu7bxB+IAZR9UyjbW/Jo8yOo2slFKusQjnX4ftlZ5n2iOFQddaSb/ItUY8
 tdgJglQaE/WHIyd/QyWthw0akqw==
X-Received: by 2002:a17:90a:d0c4:: with SMTP id
 y4mr6388462pjw.233.1615318436755; 
 Tue, 09 Mar 2021 11:33:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRoheltWC3q/OlHwNvgRQikUup4a/cbSjffjIeSZP5QkLBGPEM1MUby0bF5Es4MSGuUmH/sg==
X-Received: by 2002:a17:90a:d0c4:: with SMTP id
 y4mr6388446pjw.233.1615318436540; 
 Tue, 09 Mar 2021 11:33:56 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id z3sm13835115pff.40.2021.03.09.11.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 11:33:56 -0800 (PST)
Date: Wed, 10 Mar 2021 03:33:42 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] fs: rename alloc_anon_inode to alloc_anon_inode_sb
Message-ID: <20210309193342.GA3958006@xiangao.remote.csb>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-2-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210309155348.974875-2-hch@lst.de>
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

On Tue, Mar 09, 2021 at 04:53:40PM +0100, Christoph Hellwig wrote:
> Rename alloc_inode to free the name for a new variant that does not
> need boilerplate to create a super_block first.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

That is a nice idea as well to avoid sb by introducing an unique
fs...

Reviewed-by: Gao Xiang <hsiangkao@redhat.com>

Thanks,
Gao Xiang

