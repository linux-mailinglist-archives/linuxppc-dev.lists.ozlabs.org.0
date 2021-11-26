Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E8145F288
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 17:55:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J118G6ZrHz3cRy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 03:55:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=XBWUv1BE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=XBWUv1BE; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J117f4k2Qz2xrP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 03:54:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EFA8622C6;
 Fri, 26 Nov 2021 16:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C749C93056;
 Fri, 26 Nov 2021 16:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1637945689;
 bh=1PCvk2DH5u3SLpbi5pVnYhcvH/Q/+cP55AdCX0C5mjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XBWUv1BEPpNclpWJ7rMiE/azLyXortkDHaFyEjLW0ZeSEMcU9LDlmXETIVRP7MIOr
 VtrNUstDVvLsXW/2alD27U3oPENJEuTw4kvWKPA8EkS+N6ZYM5ugAnlB/pYtcFcP7P
 2Y1ArzujMAwo2T3rNZtl6+R5OjMnW4K09ai4Qiow=
Date: Fri, 26 Nov 2021 17:54:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] w1: Misuse of get_user()/put_user() reported by sparse
Message-ID: <YaERVtyYpJ+BTQ/f@kroah.com>
References: <926b572075a26835f4e39d05710cd1b75fd4d5a4.1637945194.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <926b572075a26835f4e39d05710cd1b75fd4d5a4.1637945194.git.christophe.leroy@csgroup.eu>
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
Cc: Evgeniy Polyakov <zbr@ioremap.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 26, 2021 at 05:47:58PM +0100, Christophe Leroy wrote:
> sparse warnings: (new ones prefixed by >>)
> >> drivers/w1/slaves/w1_ds28e04.c:342:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char [noderef] __user *_pu_addr @@     got char *buf @@
>    drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     expected char [noderef] __user *_pu_addr
>    drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     got char *buf
> >> drivers/w1/slaves/w1_ds28e04.c:356:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __user *_gu_addr @@     got char const *buf @@
>    drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     expected char const [noderef] __user *_gu_addr
>    drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     got char const *buf
> 
> The buffer buf is a failsafe buffer in kernel space, it's not user
> memory hence doesn't deserve the use of get_user() or put_user().
> 
> Access 'buf' content directly.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/lkml/202111190526.K5vb7NWC-lkp@intel.com/T/
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Use sysfs_emit() and kstrtobool()
> ---
>  drivers/w1/slaves/w1_ds28e04.c | 25 +++----------------------
>  1 file changed, 3 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/w1/slaves/w1_ds28e04.c b/drivers/w1/slaves/w1_ds28e04.c
> index e4f336111edc..98f80f412cfd 100644
> --- a/drivers/w1/slaves/w1_ds28e04.c
> +++ b/drivers/w1/slaves/w1_ds28e04.c
> @@ -32,7 +32,7 @@ static int w1_strong_pullup = 1;
>  module_param_named(strong_pullup, w1_strong_pullup, int, 0);
>  
>  /* enable/disable CRC checking on DS28E04-100 memory accesses */
> -static char w1_enable_crccheck = 1;
> +static bool w1_enable_crccheck = true;
>  
>  #define W1_EEPROM_SIZE		512
>  #define W1_PAGE_COUNT		16
> @@ -339,32 +339,13 @@ static BIN_ATTR_RW(pio, 1);
>  static ssize_t crccheck_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf)
>  {
> -	if (put_user(w1_enable_crccheck + 0x30, buf))
> -		return -EFAULT;
> -
> -	return sizeof(w1_enable_crccheck);
> +	return sysfs_emit(buf, "%d\n", w1_enable_crccheck);
>  }
>  
>  static ssize_t crccheck_store(struct device *dev, struct device_attribute *attr,
>  			      const char *buf, size_t count)
>  {
> -	char val;
> -
> -	if (count != 1 || !buf)
> -		return -EINVAL;
> -
> -	if (get_user(val, buf))
> -		return -EFAULT;
> -
> -	/* convert to decimal */
> -	val = val - 0x30;
> -	if (val != 0 && val != 1)
> -		return -EINVAL;
> -
> -	/* set the new value */
> -	w1_enable_crccheck = val;
> -
> -	return sizeof(w1_enable_crccheck);
> +	return kstrtobool(buf, &w1_enable_crccheck) ? : count;

Please spell this line out, using ? : is unreadable at times.

thanks,

greg k-h
