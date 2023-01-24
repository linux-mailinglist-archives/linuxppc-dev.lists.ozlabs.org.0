Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0AB678DA2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 02:42:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P18qC4vgrz3bNj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 12:42:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Sy5NNZHy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Sy5NNZHy;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P18pC60cnz2yw6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 12:41:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=1g8rJeVMlQ/HySUMtGPrVNB0AVWPc1UPUlwjLl3cAdM=; b=Sy5NNZHyXuEe14owLQ1OGzg5x3
	DIxOoJ0QtvWVGGOhiI1vhn8D5oYjnR2YEMwKAxquhpyfx1eLYjMVKYqEoptzL0ju8zDpQdltw/CA1
	gJ8bZCaZZOliHlpnkxEfk9/BHkYBwgn3NzdInqtZYcfui+aDyuFQjVlIEexo01Vr33id8796heQXM
	d/O4OPNtgCMRnPOPeKhhDOj/58XeV7JyEfVXAYdKAztN9fsXoxZ0hvLQnqk4e2pWG/6hbkdOxCWAT
	SCrim9G5GIrLg7EHc6K94AwaHQbrtilouBb+ilRDjUzmrJV0nSteYlSckRKpyFYWOeW2QeixCZMsY
	t4418MKw==;
Received: from 108-90-42-56.lightspeed.sntcca.sbcglobal.net ([108.90.42.56] helo=[192.168.1.80])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK8JM-004gKO-Tk; Tue, 24 Jan 2023 01:41:21 +0000
Message-ID: <aed3d64e-1209-0a28-2337-8d40b1a78d6c@infradead.org>
Date: Mon, 23 Jan 2023 17:41:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] ps3vram: remove bio splitting
To: Christoph Hellwig <hch@lst.de>, jim@jtan.com
References: <20230123074718.57951-1-hch@lst.de>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20230123074718.57951-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On 1/22/23 23:47, Christoph Hellwig wrote:
> ps3vram iterates over the bio one segment, that is page aligned and max
> page sized chunk, a time.  Because of that there is no point in
> calling bio_split_to_limits, or explicitly setting the default limits
> that are only used by bio_split_to_limits.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/ps3vram.c | 7 -------
>  1 file changed, 7 deletions(-)

I tested this patch applied to the ps3-queue branch (v6.2-rc5 based) of my
kernel.org ps3-linux repo.  I could format the ps3vram device with ext4,
copy files to it, run fsck, etc.

Thanks for your effort.

Tested-by: Geoff Levand <geoff@infradead.org>

