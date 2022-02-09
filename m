Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8CA4AE66E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 03:21:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtkCg1Fd5z3cPT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 13:21:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=relay.hostedemail.com (client-ip=64.99.140.26;
 helo=relay.hostedemail.com; envelope-from=joe@perches.com; receiver=<UNKNOWN>)
X-Greylist: delayed 899 seconds by postgrey-1.36 at boromir;
 Wed, 09 Feb 2022 13:21:25 AEDT
Received: from relay.hostedemail.com (relay.hostedemail.com [64.99.140.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtkC90ZPzz2xs2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 13:21:23 +1100 (AEDT)
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay08.hostedemail.com (Postfix) with ESMTP id DEAAE20F12;
 Wed,  9 Feb 2022 02:06:18 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf10.hostedemail.com (Postfix) with ESMTPA id BEC4042; 
 Wed,  9 Feb 2022 02:06:16 +0000 (UTC)
Message-ID: <40357c19f7cddcba1b7ef748a07ca9bb6320d823.camel@perches.com>
Subject: Re: [PATCH] scsi: ibmvfc: replace snprintf with sysfs_emit
From: Joe Perches <joe@perches.com>
To: davidcomponentone@gmail.com, tyreld@linux.ibm.com
Date: Tue, 08 Feb 2022 18:06:16 -0800
In-Reply-To: <b4c150c86f539d3bac3fc8885252adb9f24ee48f.1644286482.git.yang.guang5@zte.com.cn>
References: <b4c150c86f539d3bac3fc8885252adb9f24ee48f.1644286482.git.yang.guang5@zte.com.cn>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: BEC4042
X-Spam-Status: No, score=-4.85
X-Stat-Signature: h7dkrnjg4zurbfdrpr6cuuyjaef7g58a
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/GCkXaG8SQhB17CmOLPHUSi45bg1t5q1M=
X-HE-Tag: 1644372376-298488
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

On Wed, 2022-02-09 at 08:43 +0800, davidcomponentone@gmail.com wrote:
> From: Yang Guang <yang.guang5@zte.com.cn>
[]
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
[]
> @@ -3403,7 +3403,7 @@ static ssize_t ibmvfc_show_host_partition_name(struct device *dev,
>  	struct Scsi_Host *shost = class_to_shost(dev);
>  	struct ibmvfc_host *vhost = shost_priv(shost);
>  
> -	return snprintf(buf, PAGE_SIZE, "%s\n",
> +	return sysfs_emit(buf, "%s\n",
>  			vhost->login_buf->resp.partition_name);

Rewrap please

	return sysfs_emit(buf, "%s\n", vhost->login_buf->resp.partition_name);

>  }
>  
> @@ -3413,7 +3413,7 @@ static ssize_t ibmvfc_show_host_device_name(struct device *dev,
>  	struct Scsi_Host *shost = class_to_shost(dev);
>  	struct ibmvfc_host *vhost = shost_priv(shost);
>  
> -	return snprintf(buf, PAGE_SIZE, "%s\n",
> +	return sysfs_emit(buf, "%s\n",
>  			vhost->login_buf->resp.device_name);

etc...


