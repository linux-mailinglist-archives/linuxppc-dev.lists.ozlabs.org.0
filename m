Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 179C4389D51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 07:48:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlzLH0cn4z2yxx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:48:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FYbTINiD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=FYbTINiD; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlzKr51Bqz2xfw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 15:48:00 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97ACD6108D;
 Thu, 20 May 2021 05:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621489678;
 bh=1Cf5cc1LRNKo+zO8NlQy2hSrIB+APVWfdL5tadPG43w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FYbTINiDv635zTC9y5P26D/jwXf8i18ov+MHjO8zJWYD8c5nBtTqA6mJB3RO5MM3/
 BDkd9HCdPYK5wVgVVxhJs8yTxaiCwdDzDlV4Jsvf0p9HmR3JwBbihmPGgbD9Bp/9uJ
 DAkgvGC+6YQbauNTzD9aZ1G3fT8y/IFlv+9xSKMk=
Date: Thu, 20 May 2021 07:47:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Conflict between arch/powerpc/include/asm/disassemble.h and
 drivers/staging/rtl8723bs/include/wifi.h
Message-ID: <YKX4ChOvYjPjOwco@kroah.com>
References: <6954e633-3908-d175-3030-3e913980af78@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6954e633-3908-d175-3030-3e913980af78@csgroup.eu>
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, fabioaiuto83@gmail.com,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 07:30:49AM +0200, Christophe Leroy wrote:
> Hello,
> 
> I was trying to include powerpc asm/disassemble.h in some more widely used
> headers in order to reduce open coding, and I'm facing the following
> problem:
> 
> drivers/staging/rtl8723bs/include/wifi.h:237:30: error: conflicting types for 'get_ra'
> drivers/staging/rtl8723bs/include/wifi.h:237:30: error: conflicting types for 'get_ra'
> make[4]: *** [scripts/Makefile.build:272: drivers/staging/rtl8723bs/core/rtw_btcoex.o] Error 1
> make[4]: *** [scripts/Makefile.build:272: drivers/staging/rtl8723bs/core/rtw_ap.o] Error 1
> make[3]: *** [scripts/Makefile.build:515: drivers/staging/rtl8723bs] Error 2
> 
> (More details at http://kisskb.ellerman.id.au/kisskb/head/ee2dedcaaf3fe176e68498018632767d02639d03/)
> 
> Taking into account that asm/disassemble.h has been existing since 2008
> while rtl8723bs/include/wifi.h was created in 2017, and that the get_ra()
> defined in the later is used at exactly one place only, would it be possible
> to change it there ?
> (https://elixir.bootlin.com/linux/v5.13-rc2/A/ident/get_ra)

Yes, the staging code can change, I'll make a patch for it after
coffee...

