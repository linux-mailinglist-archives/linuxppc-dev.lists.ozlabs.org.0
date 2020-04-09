Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C284C1A37AB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 18:02:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ym9g4vGfzDrLs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 02:01:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=minchan.kim@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sih21yyd; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ym7Z1zqJzDrCH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 02:00:06 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id b72so4289677pfb.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Apr 2020 09:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aQRKpekxDIbOTQGjAcEIQGsYobF8qM0SxjsCWTw2ZsI=;
 b=sih21yydVRFHZsFGgg59HNuBfeOLWxP9lrEPMN105FfVz58rnW/GDEcO4zsmsi+D4H
 wfVsCAsfHYhb74tml4QNYR7f9EYK10v4PgVx53AGyktrCWIvgakaRU3DkpUR+Lp5/V+G
 lLb/WOY+7lne5P6uJPBpxjiGqkkRjtOHRD+VYpIGgdyip5zJPYNfganUG5rlt+iX65Ia
 G+O1XkANhyv7aIffHK9DPrr3KKB0tuS8o3hYzz5dANw43pLgXhhewQpf8p3UQzu7jaUX
 vklovoYaq3tUs05JhS/KPyXwPS2z6JKDw0gxXTNpi9Odm5NtE18/784OJMXo1euPhq2F
 NSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=aQRKpekxDIbOTQGjAcEIQGsYobF8qM0SxjsCWTw2ZsI=;
 b=c1VpOKIwgnwyuAVCo3dIEWJiQ+CXtnEim8ap7DrIV4Dp+XmTSuWfBSQP8r/acUEteF
 5NEKvgJSadP/0tWaBWur6Pci6pP94odIMc8GWS0Ekixz8Y5bymt72wUhQYKlN/KyjtYZ
 36Woc19LkJl/YmE9GbgfggHgCPk9pxBiaz53zgfdfAOp0agwgmhlHXI9HB5JRt70u6C3
 MBBFyHt3NwKCoBFXoe04Hg4pynV+Uip1vtkg6flvvjOh1Zka7uavizSyOfyDHzupwv7R
 aVz3QOa5QBsJVLiLAAP8B44AUhjkDjgMj6V+RIWOvJx8gc+aToFNg+KOWbIXZJcOHrqO
 PTnQ==
X-Gm-Message-State: AGi0PubZO2nno/UjtV02qaO4UzpD+TmC3wkfh/VV3ZuEHjYJCvNDc32x
 nGwcfNXPMhVNiVuwjMX2b6E=
X-Google-Smtp-Source: APiQypJjp3TKUZfafGLvg6qEU9KISYf3/iG0IoFzAvoBFmETLO9Bl0QvCAR/K1DmpfYnyGtmiu0e2g==
X-Received: by 2002:a65:580d:: with SMTP id g13mr110923pgr.45.1586448003209;
 Thu, 09 Apr 2020 09:00:03 -0700 (PDT)
Received: from google.com ([2601:647:4001:3000::50e3])
 by smtp.gmail.com with ESMTPSA id a24sm10081726pgd.50.2020.04.09.09.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 09:00:01 -0700 (PDT)
Date: Thu, 9 Apr 2020 08:59:59 -0700
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/28] mm: rename CONFIG_PGTABLE_MAPPING to
 CONFIG_ZSMALLOC_PGTABLE_MAPPING
Message-ID: <20200409155959.GB247701@google.com>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-10-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408115926.1467567-10-hch@lst.de>
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
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 08, 2020 at 01:59:07PM +0200, Christoph Hellwig wrote:
> Rename the Kconfig variable to clarify the scope.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Minchan Kim <minchan@kernel.org>
