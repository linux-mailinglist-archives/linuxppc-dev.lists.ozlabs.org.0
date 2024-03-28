Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A080188FD44
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 11:40:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=ZE4ko+rx;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=F5ZG3jPw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V50SQ2zXLz3vYH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 21:40:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=ZE4ko+rx;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=F5ZG3jPw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay6-1.pub.mailoutpod3-cph3.one.com (client-ip=2a02:2350:5:425::1; helo=mailrelay6-1.pub.mailoutpod3-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=lists.ozlabs.org)
Received: from mailrelay6-1.pub.mailoutpod3-cph3.one.com (mailrelay6-1.pub.mailoutpod3-cph3.one.com [IPv6:2a02:2350:5:425::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V50Rd46xhz3cML
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 21:40:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=gya7IPEuSu6MJQjEiIDquH7exohl6PUqhigJxnlATAE=;
	b=ZE4ko+rxCKWftwAo8NczSWsuqHjEGGfU6uUbSIvP9K7fRjmUyo4Xr6m3BNAQARjmG/LX8288MYqxa
	 qrdk8dPJqF9CYmvYKIuCC2KeC1KUOqccJBBkzOKfv28rtFurrRJni2BtWG1TH9wXZ4K99dnFf8V5MD
	 HZ1gA7bs8n86UELzO/3mtmm9tYEeJ1jNRSMFTH1fTc77A4UCALepeO491AxJF+4LLzM+MLxKLdACw9
	 4pMSRnDxAVYcWBUnWQrf3ZIk6pJCXrGR5H7uq2oOnDFOYI+oh/4/BJhyLEjVShZXd+FvQVzGTZFYI4
	 XSSV3BEarvEACwRvDNnbMC1B5JbFC8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=gya7IPEuSu6MJQjEiIDquH7exohl6PUqhigJxnlATAE=;
	b=F5ZG3jPwCujGHPqRnIkMdiF/ub3mtz9R1CndiSD3xivl8FAjmngZD0HN2Qu0BtwII0e2ZNTa1qmYb
	 0bYRExmAw==
X-HalOne-ID: 25d22949-ecd4-11ee-9cc7-bd80189f112a
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 25d22949-ecd4-11ee-9cc7-bd80189f112a;
	Thu, 28 Mar 2024 07:24:03 +0000 (UTC)
Date: Thu, 28 Mar 2024 08:24:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/3] arch: Select fbdev helpers with CONFIG_VIDEO
Message-ID: <20240328072401.GB1573630@ravnborg.org>
References: <20240327204450.14914-1-tzimmermann@suse.de>
 <20240327204450.14914-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327204450.14914-2-tzimmermann@suse.de>
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

On Wed, Mar 27, 2024 at 09:41:29PM +0100, Thomas Zimmermann wrote:
> Various Kconfig options selected the per-architecture helpers for
> fbdev. But none of the contained code depends on fbdev. Standardize
> on CONFIG_VIDEO, which will allow to add more general helpers for
> video functionality.
> 
> CONFIG_VIDEO protects each architecture's video/ directory. This
> allows for the use of more fine-grained control for each directory's
> files, such as the use of CONFIG_STI_CORE on parisc.
> 
> v2:
> - sparc: rebased onto Makefile changes
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
