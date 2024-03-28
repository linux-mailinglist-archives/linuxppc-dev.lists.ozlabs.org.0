Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E00E88F8F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 08:42:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=FO3avDbt;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=tWmWJ3ND;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4wV51GpGz3vgs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 18:42:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=FO3avDbt;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=tWmWJ3ND;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay5-1.pub.mailoutpod3-cph3.one.com (client-ip=46.30.211.244; helo=mailrelay5-1.pub.mailoutpod3-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 84 seconds by postgrey-1.37 at boromir; Thu, 28 Mar 2024 18:41:21 AEDT
Received: from mailrelay5-1.pub.mailoutpod3-cph3.one.com (mailrelay5-1.pub.mailoutpod3-cph3.one.com [46.30.211.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4wTF5LJsz3bnk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 18:41:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=dyKv5n7Yl7LRdH+1tEzFGNQHD1DRdGd99PJrS6/p+zs=;
	b=FO3avDbtCVJhZmbtPb25Z7M92okwL42Lwzwk0Xt1eFKNFfW85ebYPD1a4Iz7nbfQa1BVxuB2fck3t
	 dV01QiC6wivs5sf4FR4Dwcj/7zxIoo8LiqS5TizyDmf/zwISEz8XHoo+q0YBAqS+W/jFG4FUQ44kvh
	 t0uaYwTBtz7fuc9aKHnSrFR3GY32xONVYLJIM0g3hDiXwbLR9BD/o3eEuUuj3l3UwYm6F6muVvvj3L
	 eaFcKcGJK55ShMf9yqSyFAGh9is77eUJyw3RtIOaPW++JhkBvC7HK4Ge1s3CMNfQOfP48o4EmSO883
	 mKHiYwbBSpWF7oBq3uTpz9wEoyMQoiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=dyKv5n7Yl7LRdH+1tEzFGNQHD1DRdGd99PJrS6/p+zs=;
	b=tWmWJ3NDZTn8BTwQyoXUT6BJQOWPfdg24c2VPAtEdn8oRObE4JrU9XMtFz3jWr/w4xs53mowsZ7/3
	 oWNGr4OCg==
X-HalOne-ID: 4ddcab29-ecd4-11ee-9a1b-9fce02cdf4bb
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 4ddcab29-ecd4-11ee-9a1b-9fce02cdf4bb;
	Thu, 28 Mar 2024 07:25:09 +0000 (UTC)
Date: Thu, 28 Mar 2024 08:25:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/3] arch: Remove struct fb_info from video helpers
Message-ID: <20240328072507.GC1573630@ravnborg.org>
References: <20240327204450.14914-1-tzimmermann@suse.de>
 <20240327204450.14914-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327204450.14914-3-tzimmermann@suse.de>
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
Cc: sui.jingfeng@linux.dev, x86@kernel.org, linux-sh@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, deller@gmx.de, Andreas Larsson <andreas@gaisler.com>, javierm@redhat.com, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, arnd@arndb.de, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,
On Wed, Mar 27, 2024 at 09:41:30PM +0100, Thomas Zimmermann wrote:
> The per-architecture video helpers do not depend on struct fb_info
> or anything else from fbdev. Remove it from the interface and replace
> fb_is_primary_device() with video_is_primary_device(). The new helper
> is similar in functionality, but can operate on non-fbdev devices.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
