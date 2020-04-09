Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5600C1A3C6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 00:34:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ywt94sq2zDqf3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 08:34:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.65; helo=mail-wr1-f65.google.com;
 envelope-from=wei.liu.linux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ylyY0PCGzDrCB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 01:52:15 +1000 (AEST)
Received: by mail-wr1-f65.google.com with SMTP id k1so12537385wrm.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Apr 2020 08:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eqkR8PSND6qViZd9vmRT63/nOL3pGElbecF9kS9AV5s=;
 b=ezz7AjJ9ppFAJRgBjN5LK8BkDh+5SP6SizZ5I0EhX/DHASUbmK0VfQ6P8D0XdmZvHp
 YKf4t8DC3KDg6sSzUXGW/ZFrKN35xeSpAFkCCCWmITwowCuY7tWZ17lXvdGJE2JcSqF1
 LVfMj7AXxLNAYL1IQDaixwFaAP5/oYQ9uGQT8ryJp9lAZuPwpuVaIQ08IwykbEmO+xkM
 jC8+1cVKrDp9UbMwxnA0+TrZO7yE+7ftYMVrLBwMLRncLu7/pioo3D6u2AfNQMhhmd8/
 N5xbFiloQJ0oSxQblxivxXpZf7U2GgVwv9/v3A+lBRnTYabwbhI5LKm8QjAbZY11IZW8
 N6Lw==
X-Gm-Message-State: AGi0Pua4M6HTYfmy8WukoGV2J+Dib4EnWhLf4mGcX+jJlSEXHMt0Kxyy
 xYMD5BWgMmarUWStd62QZN4=
X-Google-Smtp-Source: APiQypKMJHF6OiHO4wdgZ4uGElDczTXQUdaiFhgSzp0EipiSdhIJoRoqAA6vF3j45RxLstvXaIP8Cw==
X-Received: by 2002:adf:8b5c:: with SMTP id v28mr13870834wra.98.1586447532733; 
 Thu, 09 Apr 2020 08:52:12 -0700 (PDT)
Received: from debian (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id o13sm18258592wrm.74.2020.04.09.08.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 08:52:11 -0700 (PDT)
Date: Thu, 9 Apr 2020 16:52:09 +0100
From: Wei Liu <wei.liu@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/28] x86/hyperv: use vmalloc_exec for the hypercall page
Message-ID: <20200409155209.4tqaipnwifcsrmda@debian>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408115926.1467567-2-hch@lst.de>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Fri, 10 Apr 2020 08:32:37 +1000
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Daniel Vetter <daniel@ffwll.ch>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 iommu@lists.linux-foundation.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 08, 2020 at 01:58:59PM +0200, Christoph Hellwig wrote:
> Use the designated helper for allocating executable kernel memory, and
> remove the now unused PAGE_KERNEL_RX define.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Wei Liu <wei.liu@kernel.org>
