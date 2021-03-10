Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC633335FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 07:44:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwMxt6XnJz3cTK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 17:44:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hxg4SSMV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=minchan.kim@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hxg4SSMV; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwMxS0Zrlz3cL1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 17:44:11 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 16so4314898pgo.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 22:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/L+QoKkOaRmU+ASvLNzwIcYpCDJy7YDyKr/EVlNlog0=;
 b=hxg4SSMV7xEVGPAW+t4tjP+JM78kHwcrNk681W1WE7+p1kZ+xj/MAPeulJrQLfQ1gy
 MY78f9vcxT4ACEKQGyIeTjycuHdQ+upNs2h+l9ApfTQMwjzeo4xnXbO/yblNUCKz5aZx
 uED3zpD38W8XSVH3qz/7bY0vwOBbwEphFHXZ18/jS+mMFhAJD61ZEKe9OLlY1tIoLbzx
 Hm4FOHEJG1JyndZauPZufaRXdfPMrANl50bTCqfPxEwJVDso5EgwcoE1PKQ7NJ3gcWV8
 HL/+SHNCGzQD/5Kr1tBefd59ZIOJrtnWoY+1pz4BVbPDMk6q+AkjYCS7yvPX5a8RPezL
 f9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=/L+QoKkOaRmU+ASvLNzwIcYpCDJy7YDyKr/EVlNlog0=;
 b=m1coutQhtMVvnyD1LqHgIp6JY9eMIEqXO50Sd3yVgPPFEyaRaQd8eWOkjwyHRUBOMB
 lzlC6JXrjMyz+cerq1w16UcGT3RTYebM9gZ/fVhJkjSb7XCbN9EsW4laO4HRvtXqDL1o
 PhFgOrTeb+wcypmmS/sFKfiGy81BcSoTvPtJIZ3vgIFid6RKL2t1PXznWTukIcbv8RIw
 yQ4o4hXLPNU1joB9nP0l4S8j4aI8PbYhVfx94k3FJ9mS+Rxojhnyjor9Xby/QSPZihJ5
 dtBvmQfARrsyffcWm858VgkAZFWFUSY3WnhrDTMvXvUL4dwR0/PQ13gGjNAJ4I2mGD9q
 MYFw==
X-Gm-Message-State: AOAM533i0QPK8ahl1XRTPGVTcFACeb9kwIK7lSqWflvp8I9+YxdWJvp0
 U/ht8OhinrN0vY+8sdv6DA4=
X-Google-Smtp-Source: ABdhPJyE9h1PLlojbu2FEG7rbWy4ivd0UsQWUfjnGqJufCi7a81cp7kJM+Xb8r/K5gK+wLcal7iYSA==
X-Received: by 2002:a63:4850:: with SMTP id x16mr1517211pgk.176.1615358648951; 
 Tue, 09 Mar 2021 22:44:08 -0800 (PST)
Received: from google.com ([2620:15c:211:201:f896:d6be:86d4:a59b])
 by smtp.gmail.com with ESMTPSA id o1sm4933251pjp.4.2021.03.09.22.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 22:44:08 -0800 (PST)
Date: Tue, 9 Mar 2021 22:44:05 -0800
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 9/9] zsmalloc: remove the zsmalloc file system
Message-ID: <YEhqtTEhm3BnJ7hH@google.com>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-10-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309155348.974875-10-hch@lst.de>
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
 Alex Williamson <alex.williamson@redhat.com>, Nadav Amit <namit@vmware.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 09, 2021 at 04:53:48PM +0100, Christoph Hellwig wrote:
> Just use the generic anon_inode file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Minchan Kim <minchan@kernel.org>
