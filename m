Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 226BF5F8218
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 03:46:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mkp1H06Ftz3f2C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 12:46:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kP0ZFmqO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=188.165.223.204; helo=out2.migadu.com; envelope-from=jonathan.derrick@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kP0ZFmqO;
	dkim-atps=neutral
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mkc8s5lPWz30R7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 05:22:05 +1100 (AEDT)
Message-ID: <9b68f825-675c-ff78-cd83-fb4f9428940b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1665166923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q+lz343jwwipYjASYwNev7eIZ97Yfa1rMEADurNp9b4=;
	b=kP0ZFmqOKScWo9yQha6VG6gvahDX/c+RChSRU2I/X9B0YpUR0a0osfU/D5WxwZbvbebBmw
	q8vGRoaIq2zaffcp3MJ2i3JS1WcnKOgmXkd4imstzALD8VPv6CAWrocOrFs86ryOIyM9Rh
	UG8P+47XwCfDJ20r1vucbH74Zptzj8E=
Date: Fri, 7 Oct 2022 12:21:57 -0600
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/3] block: sed-opal: keystore access for SED Opal keys
Content-Language: en-US
To: gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
References: <20220819223138.1457091-1-gjoyce@linux.vnet.ibm.com>
 <20220819223138.1457091-4-gjoyce@linux.vnet.ibm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jonathan Derrick <jonathan.derrick@linux.dev>
In-Reply-To: <20220819223138.1457091-4-gjoyce@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 08 Oct 2022 12:28:34 +1100
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
Cc: axboe@kernel.dk, linux-efi@vger.kernel.org, nayna@linux.ibm.com, dhowells@redhat.com, jarkko@kernel.org, keyrings@vger.kernel.org, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LGTM besides comment below

Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>

On 8/19/2022 4:31 PM, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> Allow for permanent SED authentication keys by
> reading/writing to the SED Opal non-volatile keystore.
> 
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> ---
>  block/sed-opal.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/block/sed-opal.c b/block/sed-opal.c
> index 3bdb31cf3e7c..11b0eb3a656b 100644
> --- a/block/sed-opal.c
> +++ b/block/sed-opal.c
> @@ -18,6 +18,7 @@
>  #include <linux/uaccess.h>
>  #include <uapi/linux/sed-opal.h>
>  #include <linux/sed-opal.h>
> +#include <linux/sed-opal-key.h>
>  #include <linux/string.h>
>  #include <linux/kdev_t.h>
>  #include <linux/key.h>
> @@ -2697,7 +2698,13 @@ static int opal_set_new_pw(struct opal_dev *dev, struct opal_new_pw *opal_pw)
>  	if (ret)
>  		return ret;
>  
> -	/* update keyring with new password */
> +	/* update keyring and arch var with new password */
> +	ret = sed_write_key(OPAL_AUTH_KEY,
> +			    opal_pw->new_user_pw.opal_key.key,
> +			    opal_pw->new_user_pw.opal_key.key_len);
> +	if (ret != -EOPNOTSUPP)
> +		pr_warn("error updating SED key: %d\n", ret);
I cant see any reason this would fail and make the keys inconsistent, but it seems
like update_sed_opal_key() should be dependent on sed_write_key() succeeding

> +
>  	ret = update_sed_opal_key(OPAL_AUTH_KEY,
>  				  opal_pw->new_user_pw.opal_key.key,
>  				  opal_pw->new_user_pw.opal_key.key_len);
> @@ -2920,6 +2927,8 @@ EXPORT_SYMBOL_GPL(sed_ioctl);
>  static int __init sed_opal_init(void)
>  {
>  	struct key *kr;
> +	char init_sed_key[OPAL_KEY_MAX];
> +	int keylen = OPAL_KEY_MAX;
>  
>  	kr = keyring_alloc(".sed_opal",
>  			   GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
> @@ -2932,6 +2941,11 @@ static int __init sed_opal_init(void)
>  
>  	sed_opal_keyring = kr;
>  
> -	return 0;
> +	if (sed_read_key(OPAL_AUTH_KEY, init_sed_key, &keylen) < 0) {
> +		memset(init_sed_key, '\0', sizeof(init_sed_key));
> +		keylen = OPAL_KEY_MAX;
> +	}
> +
> +	return update_sed_opal_key(OPAL_AUTH_KEY, init_sed_key, keylen);
>  }
>  late_initcall(sed_opal_init);
