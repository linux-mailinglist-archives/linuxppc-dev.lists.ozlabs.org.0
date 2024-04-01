Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A50894413
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Apr 2024 19:14:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=p6lG2fJP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7d0W59pdz3dXh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 04:14:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=p6lG2fJP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=acm.org (client-ip=199.89.1.12; helo=009.lax.mailroute.net; envelope-from=bvanassche@acm.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 211 seconds by postgrey-1.37 at boromir; Tue, 02 Apr 2024 04:13:39 AEDT
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7czl2S9Nz30fp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 04:13:39 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4V7cvb1rNyzlgTGW;
	Mon,  1 Apr 2024 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1711991399; x=1714583400; bh=1o92p1iKBdPwfQBISSmyjUU6
	GZIxSKmRhiV8vXyFFZ4=; b=p6lG2fJP23uiQWdoS1ZScT3P/vz53S3CxFGmauwX
	oF9cRXI0lSm9Ov4Lgf2TboIScLi2BviC2rn1nbjsXPxaZ8MdtCKnNAnLqbfW6hh/
	c/uaoFuZ7Mws98IHyVm5zJa+4caGwJsshCFU/Vt+pgmZvQ4JoxOpgJRWiErZYVG0
	+2Gfo2kJFcfIV8F9yE/ZcS8v8SL+JhJ5L5+fPyNCSoxqp+D7cZKTM8OonA0iWjWG
	jPpCaHl9tfZ8xq6YO74wFcMb1qFCd0CXaWgNuFK0+B/XvyrssVWFFQPcNhWMx5xa
	QfU2+PUGAysY6nPHeqZesz9l/8FnaghI9dw/VHx4Md/crA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id AmvmDwiwV-Af; Mon,  1 Apr 2024 17:09:59 +0000 (UTC)
Received: from [100.96.154.173] (unknown [104.132.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4V7cvV68vmzlgTHp;
	Mon,  1 Apr 2024 17:09:58 +0000 (UTC)
Message-ID: <a8b8aabf-250d-46c0-a9b8-fba414e3cfcc@acm.org>
Date: Mon, 1 Apr 2024 10:09:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: sg: Avoid race in error handling & drop bogus
 warn
Content-Language: en-US
To: Alexander Wetzel <Alexander@wetzel-home.de>, dgilbert@interlog.com
References: <81266270-42F4-48F9-9139-8F0C3F0A6553@linux.ibm.com>
 <20240401100317.5395-1-Alexander@wetzel-home.de>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240401100317.5395-1-Alexander@wetzel-home.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org, gregkh@linuxfoundation.org, stable@vger.kernel.org, sachinp@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/1/24 03:03, Alexander Wetzel wrote:
> commit 27f58c04a8f4 ("scsi: sg: Avoid sg device teardown race")
> introduced an incorrect WARN_ON_ONCE() and missed a sequence where
> sg_device_destroy() was used after scsi_device_put().

Isn't that too negative? I think that the WARN_ON_ONCE() mentioned above
has proven to be useful: it helped to catch a bug.

> sg_device_destroy() is accessing the parent scsi_device request_queue which
> will already be set to NULL when the preceding call to scsi_device_put()
> removed the last reference to the parent scsi_device.
> 
> Drop the incorrect WARN_ON_ONCE() - allowing more than one concurrent
> access to the sg device - and make sure sg_device_destroy() is not used
> after scsi_device_put() in the error handling.
> 
> Link: https://lore.kernel.org/all/5375B275-D137-4D5F-BE25-6AF8ACAE41EF@linux.ibm.com
> Fixes: 27f58c04a8f4 ("scsi: sg: Avoid sg device teardown race")

The "goto sg_put" removed by this patch was introduced by commit
cc833acbee9d ("sg: O_EXCL and other lock handling"). Since the latter
commit is older than the one mentioned above, shouldn't the Fixes tag
refer to the latter commit?

> diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
> index 386981c6976a..833c9277419b 100644
> --- a/drivers/scsi/sg.c
> +++ b/drivers/scsi/sg.c
> @@ -372,8 +372,9 @@ sg_open(struct inode *inode, struct file *filp)
>   error_out:
>   	scsi_autopm_put_device(sdp->device);
>   sdp_put:
> +	kref_put(&sdp->d_ref, sg_device_destroy);
>   	scsi_device_put(sdp->device);
> -	goto sg_put;
> +	return retval;
>   }

Please add a comment above "return retval" that explains which code will
drop the sg reference.

Thanks,

Bart.
