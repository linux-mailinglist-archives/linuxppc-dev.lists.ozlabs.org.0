Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE92439C24
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 18:55:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdLgX0Lggz2yQK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 03:55:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ArdZ9P7f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=minchan.kim@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ArdZ9P7f; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdLfp4FVxz2xYX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 03:55:12 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id t21so8357690plr.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 09:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=34KqGsADswDnjonTJQq114bRqQgkKcPCrw08YN12k1U=;
 b=ArdZ9P7fyJ7zJHFYx1+AQE02HbDLJAUvr4erZl2mwbBhtH4+TimE4u+ugqvNFdwh8d
 3/k33Em4/TsoIsweBaglse1QZQgHs7wcFn8ECUkcngi4ODPtbQO4Nm9N6HsFFQgfLYjO
 RePbywXUgZ4jXqcZxI7CJfFNDy98/HjjX5D5DC2BF8G+I/IOB9VG5SIpJ3tDITv0dJRl
 sUJ6d+ibD4KBuChDdczeAcIBzNl30xwnxblX9PJBRPoGnixLoKyw7+/sPO6a5ErIzVMp
 go4JYUYLmAuef1oHBLR/IOfONu/74SlIlF3dwUs57Wqyht+Hr5rXw+CnNSGJhGpEkKIr
 iTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=34KqGsADswDnjonTJQq114bRqQgkKcPCrw08YN12k1U=;
 b=I/l6rU4x0uxf5A34Y22sGGvodOxe9T5sDqhxEM4yeWRduiat86MSpL6mw4EJ03eYfs
 Txn/FUsqeZxQeKf3wS6WyyCg48kmISqO2uA4Nn9gokZSNYkWroeal079ytakVjRRJEcE
 qITAsJn6OZaZTnInhsH4rwgKwZcLk005uhBWy3FQdBDpU3HG8OuqIBEMPxZzyKWGRJ6W
 QkwKytk61V5IhDZNmmmmxwhrPJSkfm7Mjq0kYC8M79C76iPyJ77eYptHMHRGUERy50x1
 Qk1X26JoL/5HF9gyrBs8n84/tAB5LO9A1J/8CjW2unJ+6gXno3xSDP8TKkMKCt/lquD5
 XhHg==
X-Gm-Message-State: AOAM532cRxKNTbmCNdiiQpx2Ap3zkytbyQIcIAL2VrkXKRPkkL+BLsDn
 bHOU3hr2u2iFMD56oehl75Q=
X-Google-Smtp-Source: ABdhPJwnOC5S77AdBEAZhaiGNLZ1LAMQYdWuNPBpW15141iALB0JrDnj2gFivuKTGQtzXuB/cou/UQ==
X-Received: by 2002:a17:90b:1b49:: with SMTP id
 nv9mr21773068pjb.134.1635180906379; 
 Mon, 25 Oct 2021 09:55:06 -0700 (PDT)
Received: from google.com ([2620:15c:211:201:676:677c:1b95:77a5])
 by smtp.gmail.com with ESMTPSA id c15sm9853456pfv.66.2021.10.25.09.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 09:55:05 -0700 (PDT)
Date: Mon, 25 Oct 2021 09:55:04 -0700
From: Minchan Kim <minchan@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 08/13] zram: add error handling support for add_disk()
Message-ID: <YXbhaO5QAOi96E8j@google.com>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-9-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015235219.2191207-9-mcgrof@kernel.org>
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
Cc: nvdimm@lists.linux.dev, vigneshr@ti.com, linux-nvme@lists.infradead.org,
 paulus@samba.org, miquel.raynal@bootlin.com, ira.weiny@intel.com, hch@lst.de,
 dave.jiang@intel.com, sagi@grimberg.me, vishal.l.verma@intel.com,
 ngupta@vflare.org, linux-block@vger.kernel.org, kbusch@kernel.org,
 dan.j.williams@intel.com, axboe@kernel.dk, geoff@infradead.org,
 linux-kernel@vger.kernel.org, jim@jtan.com, senozhatsky@chromium.org,
 richard@nod.at, linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 15, 2021 at 04:52:14PM -0700, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
Acked-by: Minchan Kim <minchan@kernel.org>
