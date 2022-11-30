Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A3363CF77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 08:01:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMVVt67Pkz3bZQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 18:01:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cu9WFT5Y;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EJGHKBcc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=hare@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cu9WFT5Y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EJGHKBcc;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMVTx6WpNz2xZ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 18:00:53 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A2EF121B14;
	Wed, 30 Nov 2022 07:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1669791643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IHFFLaG042AloMIZvZwg14/Qaz6Gth7+htGeg8xKFvQ=;
	b=cu9WFT5YRSZYuXRBwdBJDukS2C2yHAXQ8NYsfzz7zCMSu0RfMASSF94jPY57KM7YS2/v3+
	4R8umgNe8YOydkodH1ie1PGOIWLCxEFKMQ9w05oYbzwkgt2ThJjTRsa3pJ6a5cM41E3L/D
	5RieLp2rgzzqe4Sy3LUFVY95uLSPyHU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1669791643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IHFFLaG042AloMIZvZwg14/Qaz6Gth7+htGeg8xKFvQ=;
	b=EJGHKBcc1YNgJaOuQR4zbbxoawFl/VMZn9w1tvPP3gc3EgRLxTe1gSpba+WzblIpe9qCv2
	qSLaD1UIrs6SD9BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 68D9213A70;
	Wed, 30 Nov 2022 07:00:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id q1HaGJv/hmN5FwAAMHmgww
	(envelope-from <hare@suse.de>); Wed, 30 Nov 2022 07:00:43 +0000
Message-ID: <c78edd60-b6ae-6ec0-9ce4-73b9a92b9b32@suse.de>
Date: Wed, 30 Nov 2022 08:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 3/3] block: sed-opal: keyring support for SED keys
Content-Language: en-US
To: gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
References: <20221129232506.3735672-1-gjoyce@linux.vnet.ibm.com>
 <20221129232506.3735672-4-gjoyce@linux.vnet.ibm.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20221129232506.3735672-4-gjoyce@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: axboe@kernel.dk, nayna@linux.ibm.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/30/22 00:25, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> Extend the SED block driver so it can alternatively
> obtain a key from a sed-opal kernel keyring. The SED
> ioctls will indicate the source of the key, either
> directly in the ioctl data or from the keyring.
> 
> This allows the use of SED commands in scripts such as
> udev scripts so that drives may be automatically unlocked
> as they become available.
> 
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> ---
>   block/Kconfig                 |   1 +
>   block/sed-opal.c              | 174 +++++++++++++++++++++++++++++++++-
>   include/linux/sed-opal.h      |   3 +
>   include/uapi/linux/sed-opal.h |   8 +-
>   4 files changed, 183 insertions(+), 3 deletions(-)
> 
> diff --git a/block/Kconfig b/block/Kconfig
> index 444c5ab3b67e..b46f93ac8405 100644
> --- a/block/Kconfig
> +++ b/block/Kconfig
> @@ -181,6 +181,7 @@ config BLK_DEBUG_FS_ZONED
>   
>   config BLK_SED_OPAL
>   	bool "Logic for interfacing with Opal enabled SEDs"
> +	depends on KEYS
>   	help
>   	Builds Logic for interfacing with Opal enabled controllers.
>   	Enabling this option enables users to setup/unlock/lock
> diff --git a/block/sed-opal.c b/block/sed-opal.c
> index 993b2b7cc4c2..a8729892178b 100644
> --- a/block/sed-opal.c
> +++ b/block/sed-opal.c
> @@ -20,6 +20,9 @@
>   #include <linux/sed-opal.h>
>   #include <linux/string.h>
>   #include <linux/kdev_t.h>
> +#include <linux/key.h>
> +#include <linux/key-type.h>
> +#include <keys/user-type.h>
>   
>   #include "opal_proto.h"
>   
> @@ -29,6 +32,8 @@
>   /* Number of bytes needed by cmd_finalize. */
>   #define CMD_FINALIZE_BYTES_NEEDED 7
>   
> +static struct key *sed_opal_keyring;
> +
>   struct opal_step {
>   	int (*fn)(struct opal_dev *dev, void *data);
>   	void *data;
> @@ -265,6 +270,101 @@ static void print_buffer(const u8 *ptr, u32 length)
>   #endif
>   }
>   
> +/*
> + * Allocate/update a SED Opal key and add it to the SED Opal keyring.
> + */
> +static int update_sed_opal_key(const char *desc, u_char *key_data, int keylen)
> +{
> +	key_ref_t kr;
> +
> +	if (!sed_opal_keyring)
> +		return -ENOKEY;
> +
> +	kr = key_create_or_update(make_key_ref(sed_opal_keyring, true), "user",
> +				  desc, (const void *)key_data, keylen,
> +				  KEY_USR_VIEW | KEY_USR_SEARCH | KEY_USR_WRITE,
> +				  KEY_ALLOC_NOT_IN_QUOTA | KEY_ALLOC_BUILT_IN |
> +					KEY_ALLOC_BYPASS_RESTRICTION);
> +	if (IS_ERR(kr)) {
> +		pr_err("Error adding SED key (%ld)\n", PTR_ERR(kr));
> +		return PTR_ERR(kr);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Read a SED Opal key from the SED Opal keyring.
> + */
> +static int read_sed_opal_key(const char *key_name, u_char *buffer, int buflen)
> +{
> +	int ret;
> +	key_ref_t kref;
> +	struct key *key;
> +
> +	if (!sed_opal_keyring)
> +		return -ENOKEY;
> +
> +	kref = keyring_search(make_key_ref(sed_opal_keyring, true),
> +			      &key_type_user, key_name, true);
> +
> +	if (IS_ERR(kref))
> +		ret = PTR_ERR(kref);
> +
> +	key = key_ref_to_ptr(kref);
> +	down_read(&key->sem);
> +	ret = key_validate(key);
> +	if (ret == 0) {
> +		if (buflen > key->datalen)
> +			buflen = key->datalen;
> +
> +		ret = key->type->read(key, (char *)buffer, buflen);
> +	}
> +	up_read(&key->sem);
> +
> +	key_ref_put(kref);
> +
> +	return ret;
> +}
> +
> +static int opal_get_key(struct opal_dev *dev, struct opal_key *key)
> +{
> +	int ret = 0;
> +
> +	switch (key->key_type) {
> +	case OPAL_INCLUDED:
> +		/* the key is ready to use */
> +		break;
> +	case OPAL_KEYRING:
> +		/* the key is in the keyring */
> +		ret = read_sed_opal_key(OPAL_AUTH_KEY, key->key, OPAL_KEY_MAX);
> +		if (ret > 0) {
> +			if (ret > 255) {

Why is a key longer than 255 an error?
If this is a requirement, why not move the check into
read_sed_opal_key() such that one only has to check for
ret < 0 on errors?

> +				ret = -ENOSPC;
> +				goto error;
> +			}
> +			key->key_len = ret;
> +			key->key_type = OPAL_INCLUDED;
> +		}
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +	if (ret < 0)
> +		goto error;
> +
> +	/* must have a PEK by now or it's an error */
> +	if (key->key_type != OPAL_INCLUDED || key->key_len == 0) {
> +		ret = -EINVAL;
> +		goto error;
> +	}
> +	return 0;
> +error:
> +	pr_debug("Error getting password: %d\n", ret);
> +	return ret;
> +}
> +
>   static bool check_tper(const void *data)
>   {
>   	const struct d0_tper_features *tper = data;
> @@ -2269,6 +2369,9 @@ static int opal_secure_erase_locking_range(struct opal_dev *dev,
>   	};
>   	int ret;
>   
> +	ret = opal_get_key(dev, &opal_session->opal_key);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   	ret = execute_steps(dev, erase_steps, ARRAY_SIZE(erase_steps));
> @@ -2302,6 +2405,9 @@ static int opal_revertlsp(struct opal_dev *dev, struct opal_revert_lsp *rev)
>   	};
>   	int ret;
>   
> +	ret = opal_get_key(dev, &rev->key);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   	ret = execute_steps(dev, steps, ARRAY_SIZE(steps));
> @@ -2320,6 +2426,9 @@ static int opal_erase_locking_range(struct opal_dev *dev,
>   	};
>   	int ret;
>   
> +	ret = opal_get_key(dev, &opal_session->opal_key);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   	ret = execute_steps(dev, erase_steps, ARRAY_SIZE(erase_steps));
> @@ -2348,6 +2457,9 @@ static int opal_enable_disable_shadow_mbr(struct opal_dev *dev,
>   	    opal_mbr->enable_disable != OPAL_MBR_DISABLE)
>   		return -EINVAL;
>   
> +	ret = opal_get_key(dev, &opal_mbr->key);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   	ret = execute_steps(dev, mbr_steps, ARRAY_SIZE(mbr_steps));
> @@ -2373,6 +2485,9 @@ static int opal_set_mbr_done(struct opal_dev *dev,
>   	    mbr_done->done_flag != OPAL_MBR_NOT_DONE)
>   		return -EINVAL;
>   
> +	ret = opal_get_key(dev, &mbr_done->key);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   	ret = execute_steps(dev, mbr_steps, ARRAY_SIZE(mbr_steps));
> @@ -2394,6 +2509,9 @@ static int opal_write_shadow_mbr(struct opal_dev *dev,
>   	if (info->size == 0)
>   		return 0;
>   
> +	ret = opal_get_key(dev, &info->key);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   	ret = execute_steps(dev, mbr_steps, ARRAY_SIZE(mbr_steps));
> @@ -2450,6 +2568,9 @@ static int opal_add_user_to_lr(struct opal_dev *dev,
>   		return -EINVAL;
>   	}
>   
> +	ret = opal_get_key(dev, &lk_unlk->session.opal_key);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   	ret = execute_steps(dev, steps, ARRAY_SIZE(steps));
> @@ -2472,6 +2593,10 @@ static int opal_reverttper(struct opal_dev *dev, struct opal_key *opal, bool psi
>   
>   	int ret;
>   
> +	ret = opal_get_key(dev, opal);
> +
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   	if (psid)
> @@ -2534,6 +2659,9 @@ static int opal_lock_unlock(struct opal_dev *dev,
>   	if (lk_unlk->session.who > OPAL_USER9)
>   		return -EINVAL;
>   
> +	ret = opal_get_key(dev, &lk_unlk->session.opal_key);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	ret = __opal_lock_unlock(dev, lk_unlk);
>   	mutex_unlock(&dev->dev_lock);
> @@ -2556,6 +2684,9 @@ static int opal_take_ownership(struct opal_dev *dev, struct opal_key *opal)
>   	if (!dev)
>   		return -ENODEV;
>   
> +	ret = opal_get_key(dev, opal);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   	ret = execute_steps(dev, owner_steps, ARRAY_SIZE(owner_steps));
> @@ -2578,6 +2709,9 @@ static int opal_activate_lsp(struct opal_dev *dev,
>   	if (!opal_lr_act->num_lrs || opal_lr_act->num_lrs > OPAL_MAX_LRS)
>   		return -EINVAL;
>   
> +	ret = opal_get_key(dev, &opal_lr_act->key);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   	ret = execute_steps(dev, active_steps, ARRAY_SIZE(active_steps));
> @@ -2596,6 +2730,9 @@ static int opal_setup_locking_range(struct opal_dev *dev,
>   	};
>   	int ret;
>   
> +	ret = opal_get_key(dev, &opal_lrs->session.opal_key);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   	ret = execute_steps(dev, lr_steps, ARRAY_SIZE(lr_steps));
> @@ -2622,6 +2759,14 @@ static int opal_set_new_pw(struct opal_dev *dev, struct opal_new_pw *opal_pw)
>   	ret = execute_steps(dev, pw_steps, ARRAY_SIZE(pw_steps));
>   	mutex_unlock(&dev->dev_lock);
>   
> +	if (ret)
> +		return ret;
> +
> +	/* update keyring with new password */
> +	ret = update_sed_opal_key(OPAL_AUTH_KEY,
> +				  opal_pw->new_user_pw.opal_key.key,
> +				  opal_pw->new_user_pw.opal_key.key_len);
> +
>   	return ret;
>   }
>   
What about key revocation?
You only allow to set a new key, but what happens with the old ones?

> @@ -2642,6 +2787,9 @@ static int opal_activate_user(struct opal_dev *dev,
>   		return -EINVAL;
>   	}
>   
> +	ret = opal_get_key(dev, &opal_session->opal_key);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   	ret = execute_steps(dev, act_steps, ARRAY_SIZE(act_steps));
> @@ -2728,6 +2876,9 @@ static int opal_generic_read_write_table(struct opal_dev *dev,
>   {
>   	int ret, bit_set;
>   
> +	ret = opal_get_key(dev, &rw_tbl->key);
> +	if (ret)
> +		return ret;
>   	mutex_lock(&dev->dev_lock);
>   	setup_opal_dev(dev);
>   
> @@ -2776,9 +2927,9 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
>   	if (!capable(CAP_SYS_ADMIN))
>   		return -EACCES;
>   	if (!dev)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>   	if (!(dev->flags & OPAL_FL_SUPPORTED))
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>   
>   	if (cmd & IOC_IN) {
>   		p = memdup_user(arg, _IOC_SIZE(cmd));
> @@ -2854,3 +3005,22 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(sed_ioctl);
> +
> +static int __init sed_opal_init(void)
> +{
> +	struct key *kr;
> +
> +	kr = keyring_alloc(".sed_opal",
> +			   GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
> +			   (KEY_POS_ALL & ~KEY_POS_SETATTR) | KEY_USR_VIEW |
> +			   KEY_USR_READ | KEY_USR_SEARCH | KEY_USR_WRITE,
> +			   KEY_ALLOC_NOT_IN_QUOTA,
> +			   NULL, NULL);
> +	if (IS_ERR(kr))
> +		return PTR_ERR(kr);
> +
> +	sed_opal_keyring = kr;
> +
> +	return 0;
> +}
> +late_initcall(sed_opal_init);

Shouldn't you free the keyring on exit?

> diff --git a/include/linux/sed-opal.h b/include/linux/sed-opal.h
> index 7131d7f0eec2..57d483506b4a 100644
> --- a/include/linux/sed-opal.h
> +++ b/include/linux/sed-opal.h
> @@ -24,6 +24,9 @@ bool opal_unlock_from_suspend(struct opal_dev *dev);
>   struct opal_dev *init_opal_dev(void *data, sec_send_recv *send_recv);
>   int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *ioctl_ptr);
>   
> +#define	OPAL_AUTH_KEY           "opal-boot-pin"
> +#define	OPAL_AUTH_KEY_PREV      "opal-boot-pin-prev"
> +
>   static inline bool is_sed_ioctl(unsigned int cmd)
>   {
>   	switch (cmd) {
> diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal.h
> index fccde168e90c..6b79cdcf9518 100644
> --- a/include/uapi/linux/sed-opal.h
> +++ b/include/uapi/linux/sed-opal.h
> @@ -44,10 +44,16 @@ enum opal_lock_state {
>   	OPAL_LK = 0x04, /* 0100 */
>   };
>   
> +enum opal_key_type {
> +	OPAL_INCLUDED = 0,	/* key[] is the key */
> +	OPAL_KEYRING,		/* key is in keyring */
> +};
> +
>   struct opal_key {
>   	__u8 lr;
>   	__u8 key_len;
> -	__u8 __align[6];
> +	__u8 key_type;
> +	__u8 __align[5];
>   	__u8 key[OPAL_KEY_MAX];
>   };
>   

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

