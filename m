Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 804535F8215
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 03:43:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MknyF2yDhz3dsv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 12:43:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aLLFxAIJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=94.23.1.103; helo=out0.migadu.com; envelope-from=jonathan.derrick@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aLLFxAIJ;
	dkim-atps=neutral
X-Greylist: delayed 142 seconds by postgrey-1.36 at boromir; Sat, 08 Oct 2022 05:09:27 AEDT
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkbtH27TQz3cBw
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 05:09:27 +1100 (AEDT)
Message-ID: <8a14cdb2-4de3-558f-e637-af80673c4cd9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1665166018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wf3d7elGycEZ3Im/7mAKPHXr8Iq8F86JvYzkavEYM70=;
	b=aLLFxAIJV42t4d243zaGIAr07Kb+NpU/kGK/mgL4YIRxQVQDkN9h6+xAS1ObQY0xAWrSrh
	7VN7KcoKlFZmV8pc81er7g65/tCYtr2hz+oTIwMLRPRorh61LI2PuH9Un44fAtSMgtRqgT
	VgFh/yfG0j4wE78ppQxtK4PYmgXORfM=
Date: Fri, 7 Oct 2022 12:06:53 -0600
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3 RESEND] block: sed-opal: Implement
 IOC_OPAL_DISCOVERY
Content-Language: en-US
To: gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
References: <20220818143045.680972-1-gjoyce@linux.vnet.ibm.com>
 <20220818143045.680972-2-gjoyce@linux.vnet.ibm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jonathan Derrick <jonathan.derrick@linux.dev>
In-Reply-To: <20220818143045.680972-2-gjoyce@linux.vnet.ibm.com>
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
Cc: axboe@kernel.dk, linux-efi@vger.kernel.org, nayna@linux.ibm.com, keyrings@vger.kernel.org, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Useful. Thank you

Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>

On 8/18/2022 8:30 AM, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> Add IOC_OPAL_DISCOVERY ioctl to return raw discovery data to a SED Opal
> application. This allows the application to display drive capabilities
> and state.
> 
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> ---
>  block/sed-opal.c              | 38 ++++++++++++++++++++++++++++++++---
>  include/linux/sed-opal.h      |  1 +
>  include/uapi/linux/sed-opal.h |  6 ++++++
>  3 files changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/block/sed-opal.c b/block/sed-opal.c
> index 9700197000f2..e4d8fbdc9dad 100644
> --- a/block/sed-opal.c
> +++ b/block/sed-opal.c
> @@ -426,8 +426,12 @@ static int execute_steps(struct opal_dev *dev,
>  	return error;
>  }
>  
> -static int opal_discovery0_end(struct opal_dev *dev)
> +static int opal_discovery0_end(struct opal_dev *dev, void *data)
>  {
> +	struct opal_discovery *discv_out = data; /* may be NULL */
> +	u8 __user *buf_out;
> +	u64 len_out;
> +
>  	bool found_com_id = false, supported = true, single_user = false;
>  	const struct d0_header *hdr = (struct d0_header *)dev->resp;
>  	const u8 *epos = dev->resp, *cpos = dev->resp;
> @@ -443,6 +447,15 @@ static int opal_discovery0_end(struct opal_dev *dev)
>  		return -EFAULT;
>  	}
>  
> +	if (discv_out) {
> +		buf_out = (u8 __user *)(uintptr_t)discv_out->data;
> +		len_out = min_t(u64, discv_out->size, hlen);
> +		if (buf_out && copy_to_user(buf_out, dev->resp, len_out))
> +			return -EFAULT;
> +
> +		discv_out->size = hlen; /* actual size of data */
> +	}
> +
>  	epos += hlen; /* end of buffer */
>  	cpos += sizeof(*hdr); /* current position on buffer */
>  
> @@ -517,13 +530,13 @@ static int opal_discovery0(struct opal_dev *dev, void *data)
>  	if (ret)
>  		return ret;
>  
> -	return opal_discovery0_end(dev);
> +	return opal_discovery0_end(dev, data);
>  }
>  
>  static int opal_discovery0_step(struct opal_dev *dev)
>  {
>  	const struct opal_step discovery0_step = {
> -		opal_discovery0,
> +		opal_discovery0, NULL
>  	};
>  
>  	return execute_step(dev, &discovery0_step, 0);
> @@ -2179,6 +2192,22 @@ static int opal_secure_erase_locking_range(struct opal_dev *dev,
>  	return ret;
>  }
>  
> +static int opal_get_discv(struct opal_dev *dev, struct opal_discovery *discv)
> +{
> +	const struct opal_step discovery0_step = {
> +		opal_discovery0, discv
> +	};
> +	int ret = 0;
> +
> +	mutex_lock(&dev->dev_lock);
> +	setup_opal_dev(dev);
> +	ret = execute_step(dev, &discovery0_step, 0);
> +	mutex_unlock(&dev->dev_lock);
> +	if (ret)
> +		return ret;
> +	return discv->size; /* modified to actual length of data */
> +}
> +
>  static int opal_erase_locking_range(struct opal_dev *dev,
>  				    struct opal_session_info *opal_session)
>  {
> @@ -2685,6 +2714,9 @@ int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
>  	case IOC_OPAL_GENERIC_TABLE_RW:
>  		ret = opal_generic_read_write_table(dev, p);
>  		break;
> +	case IOC_OPAL_DISCOVERY:
> +		ret = opal_get_discv(dev, p);
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/include/linux/sed-opal.h b/include/linux/sed-opal.h
> index 1ac0d712a9c3..9197b7a628f2 100644
> --- a/include/linux/sed-opal.h
> +++ b/include/linux/sed-opal.h
> @@ -43,6 +43,7 @@ static inline bool is_sed_ioctl(unsigned int cmd)
>  	case IOC_OPAL_MBR_DONE:
>  	case IOC_OPAL_WRITE_SHADOW_MBR:
>  	case IOC_OPAL_GENERIC_TABLE_RW:
> +	case IOC_OPAL_DISCOVERY:
>  		return true;
>  	}
>  	return false;
> diff --git a/include/uapi/linux/sed-opal.h b/include/uapi/linux/sed-opal.h
> index 6f5af1a84213..89dd108b426f 100644
> --- a/include/uapi/linux/sed-opal.h
> +++ b/include/uapi/linux/sed-opal.h
> @@ -132,6 +132,11 @@ struct opal_read_write_table {
>  	__u64 priv;
>  };
>  
> +struct opal_discovery {
> +	__u64 data;
> +	__u64 size;
> +};
> +
>  #define IOC_OPAL_SAVE		    _IOW('p', 220, struct opal_lock_unlock)
>  #define IOC_OPAL_LOCK_UNLOCK	    _IOW('p', 221, struct opal_lock_unlock)
>  #define IOC_OPAL_TAKE_OWNERSHIP	    _IOW('p', 222, struct opal_key)
> @@ -148,5 +153,6 @@ struct opal_read_write_table {
>  #define IOC_OPAL_MBR_DONE           _IOW('p', 233, struct opal_mbr_done)
>  #define IOC_OPAL_WRITE_SHADOW_MBR   _IOW('p', 234, struct opal_shadow_mbr)
>  #define IOC_OPAL_GENERIC_TABLE_RW   _IOW('p', 235, struct opal_read_write_table)
> +#define IOC_OPAL_DISCOVERY          _IOW('p', 236, struct opal_discovery)
>  
>  #endif /* _UAPI_SED_OPAL_H */
