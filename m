Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F17EC897C04
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 01:25:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=xQ0RU73w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V917l56Zgz3d2N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 10:25:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=xQ0RU73w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=acm.org (client-ip=199.89.1.11; helo=008.lax.mailroute.net; envelope-from=bvanassche@acm.org; receiver=lists.ozlabs.org)
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V916x3Fszz30gK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 10:24:40 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4V916s06JBz6Cnk90;
	Wed,  3 Apr 2024 23:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1712186674; x=1714778675; bh=GaQ3wPBf1YSzPwOXZZP9FBPm
	vGGpXPI+orClqrHPrcc=; b=xQ0RU73w4BqPafKh/fPsEu8hQffToqmiLfI21YNR
	+Lsa0TPbjLGMNhhWLaGRtEsILMNnlBeS/jpfJT9USwAiD8sTllzpxCM7pPhEi8Us
	meXxi3CXg5IvPAb1bVh2jqy+aeJhNmdYTcRhQ7g8JsnXmpvuMrKfKaGgl33e6bp6
	32MPgxBqYz4GNrLrIW2f1nNxrtQAk/AlMvqf1blRY0Ls4uWBePPzt8MYFCWcu23e
	rjD4ZtMiH+Ex6Bbl4B2BQtOhZjNbmZaaMlShoDwQYBqw3RC7Hpi72/9d3QpXrO5n
	hTtFsytDveFU7cxZXQgPk2L1RLMg2YlmhCj0FZOkvzxZMA==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id KA4xZDbc_6iY; Wed,  3 Apr 2024 23:24:34 +0000 (UTC)
Received: from [192.168.3.219] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4V916m20SRz6Cnk8y;
	Wed,  3 Apr 2024 23:24:31 +0000 (UTC)
Message-ID: <bc800bdd-6563-40ba-bc8d-e98b87748c15@acm.org>
Date: Wed, 3 Apr 2024 16:24:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scsi: sg: Avoid race in error handling & drop bogus
 warn
To: Alexander Wetzel <Alexander@wetzel-home.de>, dgilbert@interlog.com
References: <81266270-42F4-48F9-9139-8F0C3F0A6553@linux.ibm.com>
 <20240401191038.18359-1-Alexander@wetzel-home.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240401191038.18359-1-Alexander@wetzel-home.de>
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

On 4/1/24 12:10 PM, Alexander Wetzel wrote:
> @@ -301,11 +302,12 @@ sg_open(struct inode *inode, struct file *filp)
>   
>   	/* This driver's module count bumped by fops_get in <linux/fs.h> */
>   	/* Prevent the device driver from vanishing while we sleep */
> -	retval = scsi_device_get(sdp->device);
> +	device = sdp->device;
> +	retval = scsi_device_get(device);
>   	if (retval)
>   		goto sg_put;

Are all the sdp->device -> device changes essential? Isn't there a
preference to minimize patches that will end up in the stable trees?

Thanks,

Bart.
