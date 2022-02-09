Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7484AE6F4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 03:42:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jtkfy00Jhz3bV8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 13:42:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=aWVKPobJ;
	dkim=pass (2048-bit key; unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim header.b=b5vxNOXo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=opensource.wdc.com (client-ip=216.71.154.42;
 helo=esa4.hgst.iphmx.com;
 envelope-from=prvs=032e362c4=damien.lemoal@opensource.wdc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=aWVKPobJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com
 header.a=rsa-sha256 header.s=dkim header.b=b5vxNOXo; 
 dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir;
 Wed, 09 Feb 2022 13:41:21 AEDT
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jtkf952JDz2xDv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 13:41:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644374481; x=1675910481;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5jGen3hKuAqmZCUZesezMs0C28vFlrjgrYakLwisLjM=;
 b=aWVKPobJXdzVRBrfRYLciphqApALyFN0GO/DizxhYkun/MZ8c35thd9L
 fCz3ZX6QLYTXf0oimkiN8kg2uuHV/Jva7PdRGv9zwIg4kcvE0ORbWuKQz
 dFniMZGGtr5Npv7Ahw9cQM4lXKnK0q2BSddlWT3KeorSWkaz79CNwfoy3
 38Uw6b5YWTpnLup2K+It3imy+q++VvTIacR1QXbuaYuuRcArXsgjcn506
 Y2ToVFflmTCIDj8v6X9v/b9Kk/Cc5hGqAgbPnGHstUi7JN+zX5qhHIeP6
 9fryPyVIvvJQIrRSn7YplbW68uAteif1nOdvp/LJ8pNBTDqu8fe8WlVAd A==;
X-IronPort-AV: E=Sophos;i="5.88,354,1635177600"; d="scan'208";a="191407154"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2022 10:40:12 +0800
IronPort-SDR: xPrSOuvHb4GIapX4OtHqiDryIuieooakTISfU27ao9kGewLuD4x73Zc2bJPaQF7E1Lfi6HwcmP
 AI/ZGglsBWjOv89AQ1rJ3Q3AcJU7r3sUzxbTVKd9HePnx7R2MqNf5OTwLw4zyuf+PTRJabYOf2
 HPOanSkOhqI0flb61X858VKTtkaWfjFMFODmm0qWrPjbTzvPC73dSOCXdinqwePQk99eQ4opwE
 dWiP13EnGRO2RXplLFJEK9+pxm+x8joOqUWgWA2+bp0YCu3QESo7L7iIIiX+rXQPs64LiLMz5x
 kBVW2yxLfFchuKjpQMWpXTlj
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 18:12:01 -0800
IronPort-SDR: a7u+28SzgMkbvnZGJMhyboKx6F3gV4jMDZmH+2WvAOjx46qmoPBSpqm3wIp/9GZP+BsuW0At67
 qwZFG/BTKwZ5o4F3ULzI9pEbIawlw45diZS1RD3942ziwrQMFFAcIfGT66uCoTTI4rmbq358Nc
 rOG4BKDwTUwwy6eN+Hh0zDf6VhYuFYw+h9UtrbOFTnsTGcCjGe84rZh2+1DCSk4gGKhKtsIkz+
 GjnJWgqzBMj5ecv++Mo4vW0SH+SD2k4XUfGlSzKz3VbneM8NKSt6jCXSb+CwLGsb4qn/rB+7ks
 2bE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 18:40:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jtkcq5TLQz1SVp5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 18:40:11 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1644374410; x=1646966411; bh=5jGen3hKuAqmZCUZesezMs0C28vFlrjgrYa
 kLwisLjM=; b=b5vxNOXovYZpnITGpEvJ4Vr4BmUY9xkeyqQubYzQRSo317/KyUx
 XdqsSzfDK8Nppd2BEZFG0GgvRyJHrNfJ/Jn0FHKxMYgogDO/51MVmU5qYYNebiSz
 fzTZqxmcCdxYg/GRmLWpK04k4p1Slk1tg+J7oE9AAL7z1LE5xl9euMB2Co3JOVfQ
 4OZW/Qi3ANlf2SOp4RT4SQdlt2Say/QfNQeA3lcEacEhpA2nVRI8tJXiYtNoHKvi
 /PsjX5Stam2mDF25DsD8C6et4KnZ+tM5BfU58nH+p3FU70GHv8grXJXxxuBLSW3Y
 ioeJz0mLZB0eM3ik1VWHfiz85WSzbMWkmRg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id qpQGju7sNI2C for <linuxppc-dev@lists.ozlabs.org>;
 Tue,  8 Feb 2022 18:40:10 -0800 (PST)
Received: from [10.225.163.67] (unknown [10.225.163.67])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jtkcm6B4Xz1Rwrw;
 Tue,  8 Feb 2022 18:40:08 -0800 (PST)
Message-ID: <a0ec0411-6388-197f-abaa-08b2dc9dac4d@opensource.wdc.com>
Date: Wed, 9 Feb 2022 11:40:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] scsi: ibmvfc: replace snprintf with sysfs_emit
Content-Language: en-US
To: davidcomponentone@gmail.com, tyreld@linux.ibm.com
References: <b4c150c86f539d3bac3fc8885252adb9f24ee48f.1644286482.git.yang.guang5@zte.com.cn>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <b4c150c86f539d3bac3fc8885252adb9f24ee48f.1644286482.git.yang.guang5@zte.com.cn>
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com,
 linux-kernel@vger.kernel.org, Yang Guang <yang.guang5@zte.com.cn>,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 Zeal Robot <zealci@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/9/22 09:43, davidcomponentone@gmail.com wrote:
> From: Yang Guang <yang.guang5@zte.com.cn>
> 
> coccinelle report:
> ./drivers/scsi/ibmvscsi/ibmvfc.c:3453:8-16:
> WARNING: use scnprintf or sprintf
> ./drivers/scsi/ibmvscsi/ibmvfc.c:3416:8-16:
> WARNING: use scnprintf or sprintf
> ./drivers/scsi/ibmvscsi/ibmvfc.c:3436:8-16:
> WARNING: use scnprintf or sprintf
> ./drivers/scsi/ibmvscsi/ibmvfc.c:3426:8-16:
> WARNING: use scnprintf or sprintf
> ./drivers/scsi/ibmvscsi/ibmvfc.c:3445:8-16:
> WARNING: use scnprintf or sprintf
> ./drivers/scsi/ibmvscsi/ibmvfc.c:3406:8-16:
> WARNING: use scnprintf or sprintf
> 
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
> Signed-off-by: David Yang <davidcomponentone@gmail.com>
> ---
>  drivers/scsi/ibmvscsi/ibmvfc.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
> index d0eab5700dc5..d5a197d17e0a 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.c
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.c
> @@ -3403,7 +3403,7 @@ static ssize_t ibmvfc_show_host_partition_name(struct device *dev,
>  	struct Scsi_Host *shost = class_to_shost(dev);
>  	struct ibmvfc_host *vhost = shost_priv(shost);
>  
> -	return snprintf(buf, PAGE_SIZE, "%s\n",
> +	return sysfs_emit(buf, "%s\n",
>  			vhost->login_buf->resp.partition_name);
>  }
>  
> @@ -3413,7 +3413,7 @@ static ssize_t ibmvfc_show_host_device_name(struct device *dev,
>  	struct Scsi_Host *shost = class_to_shost(dev);
>  	struct ibmvfc_host *vhost = shost_priv(shost);
>  
> -	return snprintf(buf, PAGE_SIZE, "%s\n",
> +	return sysfs_emit(buf, "%s\n",
>  			vhost->login_buf->resp.device_name);
>  }
>  
> @@ -3423,7 +3423,7 @@ static ssize_t ibmvfc_show_host_loc_code(struct device *dev,
>  	struct Scsi_Host *shost = class_to_shost(dev);
>  	struct ibmvfc_host *vhost = shost_priv(shost);
>  
> -	return snprintf(buf, PAGE_SIZE, "%s\n",
> +	return sysfs_emit(buf, "%s\n",
>  			vhost->login_buf->resp.port_loc_code);
>  }
>  
> @@ -3433,7 +3433,7 @@ static ssize_t ibmvfc_show_host_drc_name(struct device *dev,
>  	struct Scsi_Host *shost = class_to_shost(dev);
>  	struct ibmvfc_host *vhost = shost_priv(shost);
>  
> -	return snprintf(buf, PAGE_SIZE, "%s\n",
> +	return sysfs_emit(buf, "%s\n",
>  			vhost->login_buf->resp.drc_name);
>  }
>  
> @@ -3442,7 +3442,7 @@ static ssize_t ibmvfc_show_host_npiv_version(struct device *dev,
>  {
>  	struct Scsi_Host *shost = class_to_shost(dev);
>  	struct ibmvfc_host *vhost = shost_priv(shost);
> -	return snprintf(buf, PAGE_SIZE, "%d\n", be32_to_cpu(vhost->login_buf->resp.version));
> +	return sysfs_emit(buf, "%d\n", be32_to_cpu(vhost->login_buf->resp.version));

The format should be %u, not %d. And while at it, please add a blank
line after the declarations.

>  }
>  
>  static ssize_t ibmvfc_show_host_capabilities(struct device *dev,
> @@ -3450,7 +3450,7 @@ static ssize_t ibmvfc_show_host_capabilities(struct device *dev,
>  {
>  	struct Scsi_Host *shost = class_to_shost(dev);
>  	struct ibmvfc_host *vhost = shost_priv(shost);
> -	return snprintf(buf, PAGE_SIZE, "%llx\n", be64_to_cpu(vhost->login_buf->resp.capabilities));
> +	return sysfs_emit(buf, "%llx\n", be64_to_cpu(vhost->login_buf->resp.capabilities));
>  }

Ditto for the blank line.

>  
>  /**
> @@ -3471,7 +3471,7 @@ static ssize_t ibmvfc_show_log_level(struct device *dev,
>  	int len;
>  
>  	spin_lock_irqsave(shost->host_lock, flags);
> -	len = snprintf(buf, PAGE_SIZE, "%d\n", vhost->log_level);
> +	len = sysfs_emit(buf, "%d\n", vhost->log_level);
>  	spin_unlock_irqrestore(shost->host_lock, flags);
>  	return len;
>  }
> @@ -3509,7 +3509,7 @@ static ssize_t ibmvfc_show_scsi_channels(struct device *dev,
>  	int len;
>  
>  	spin_lock_irqsave(shost->host_lock, flags);
> -	len = snprintf(buf, PAGE_SIZE, "%d\n", vhost->client_scsi_channels);
> +	len = sysfs_emit(buf, "%d\n", vhost->client_scsi_channels);
>  	spin_unlock_irqrestore(shost->host_lock, flags);
>  	return len;
>  }


-- 
Damien Le Moal
Western Digital Research
