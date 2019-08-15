Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF468F2F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 20:13:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468ZLh130wzDqYp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 04:13:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="refM5sSM"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468ZHX3T2szDr8C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 04:10:15 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id e11so1631692pga.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 11:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YGZciRmFKywos7phtHka3BMLOjJ5GD0teHhlJqhmVkk=;
 b=refM5sSMD7XaWN2cBYtXuBqQL++UFaQwWAlfDTzJPByqFlruWjmG6Yh089jW7TdpbD
 NrxNm0s2FZstcIYgXU/1OVsLWK+FGl/oYQP7+rTaMZkVBgGR23anbQo8oXgra9wTo9FE
 j2SPBqMOEPNcKZuxqfPe/Pg1VNQm0EO34QutZQTrQlKL2cYjCOVrLe8Oxo+zJZteOQlu
 B8hMLNBQEAo1UHIr3ABYn9iPuYxpRN+b0Z+J5xpbw/J0aCqSamjWusXlwPIWC+3YINI7
 nT835bJJdCLvSjcjCqTDzc+ntlidStA5Dl6+CgzdON8g1MYQ6qhhFDs0HvmQv88M+BJb
 dCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=YGZciRmFKywos7phtHka3BMLOjJ5GD0teHhlJqhmVkk=;
 b=WYHeENhyNubB/IM/FQ/o5lzyhUJvqN8FwdnqjiqJHLNF5NliNHQbT3TY7htLxeLz25
 ccRkBu5Uaf2w9k9enGDgw4FHJM4QcK+/BTnM2CC3lam/oS7ArL8Qg7pO+WK5Z86uLHEN
 EAcEIpyonknUC8KtZfLnb4RFPAWZbI4K5zmAIygZf4aim1ba2xlLJPsUIVh3QdEsD2xX
 65XfCEdEewxik4kr6EcflSYGI1cF3r+faT7o2PbqKbQbvLWaKuOe35WXEI0fYmDZ9W6O
 wZABcabds2rQPmFBxXWrOrcBQDANJE0emfG2mTFGDVQGtDBV3Y+Z2K90EZPJSfSn3RAK
 dAHA==
X-Gm-Message-State: APjAAAWc0Op5fDEc7Kh3o//mMh4sLima1MzYOVyReMoDqKCs6X1jRQno
 R+U5n6TUWDkktzsq8qoitVw=
X-Google-Smtp-Source: APXvYqxIDdyy6by/HwcLogs24nzI99cv+AM8Nkc5yJYlPuae0cwXsF1pvVTorAHFvjBOwQbrOwQiZw==
X-Received: by 2002:a62:38d7:: with SMTP id f206mr6797850pfa.102.1565892612133; 
 Thu, 15 Aug 2019 11:10:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id n98sm1927437pjc.26.2019.08.15.11.10.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 11:10:11 -0700 (PDT)
Date: Thu, 15 Aug 2019 11:10:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 06/18] compat_ioctl: move WDIOC handling into wdt
 drivers
Message-ID: <20190815181010.GA28580@roeck-us.net>
References: <20190814204259.120942-1-arnd@arndb.de>
 <20190814205245.121691-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814205245.121691-1-arnd@arndb.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Anatolij Gustschin <agust@denx.de>,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 14, 2019 at 10:49:18PM +0200, Arnd Bergmann wrote:
> All watchdog drivers implement the same set of ioctl commands, and
> fortunately all of them are compatible between 32-bit and 64-bit
> architectures.
> 
> Modern drivers always go through drivers/watchdog/wdt.c as an abstraction
> layer, but older ones implement their own file_operations on a character
> device for this.
> 
> Move the handling from fs/compat_ioctl.c into the individual drivers.
> 
> Note that most of the legacy drivers will never be used on 64-bit
> hardware, because they are for an old 32-bit SoC implementation, but
> doing them all at once is safer than trying to guess which ones do
> or do not need the compat_ioctl handling.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

This patch doesn't seem to have a useful base (or at least git says so).
It does not apply to mainline nor to my own watchdog-next branch.
I assume you plan to apply the entire series together. Please not
that there will be conflicts against watchdog-next when you do so.

Guenter
