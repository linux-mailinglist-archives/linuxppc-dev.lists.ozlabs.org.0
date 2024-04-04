Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A6C898C37
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 18:35:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=091+neT1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9Rzy6Bfcz3vY8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 03:35:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=091+neT1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=acm.org (client-ip=199.89.1.12; helo=009.lax.mailroute.net; envelope-from=bvanassche@acm.org; receiver=lists.ozlabs.org)
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9RzC6RCVz3dTm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 03:34:31 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4V9Rz82lVqzlgTGW;
	Thu,  4 Apr 2024 16:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1712248465; x=1714840466; bh=gtgsa6hJPcd82Maymu91LBcQ
	ldrh83j7UrAsr0LevII=; b=091+neT1o3mekbMq718chh9bKsxwE0wkn+CCOZYG
	S6fl1APE+r3rTwwS0xvPO8UCgzrEHBLgfTYh30/4zh3cR+zIxwqiHd5GVycF0zqA
	5/ZCpyTG+KYqdwztkGR9Nv+e4hBGMZFdN4YTYN9dHPt1e8BwGSmxtMf/QQVbG9oj
	rIxbM0PkdVbKCOKDjI7fwAf504qlshL9dnvwKBBkQgjkgtdqBoTwxeXeTyXtpcQy
	UPtcWDPYWFUoo/Qoi+/5qfJ1UDCHuYQeYxbqxqpfanty3BGOvNOd1Pr2G/cW3cmd
	/9CqjatN++lg2ZRM3mVSk3mWcU9oSF5zD5jt/AsA8LPnDA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 8dDNJUMNhI2V; Thu,  4 Apr 2024 16:34:25 +0000 (UTC)
Received: from [100.96.154.173] (unknown [104.132.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4V9Rz44ZJxzlgTHp;
	Thu,  4 Apr 2024 16:34:24 +0000 (UTC)
Message-ID: <063d9b04-facd-4399-bf50-40452bd2c42f@acm.org>
Date: Thu, 4 Apr 2024 09:34:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scsi: sg: Avoid race in error handling & drop bogus
 warn
Content-Language: en-US
To: Alexander Wetzel <Alexander@wetzel-home.de>, dgilbert@interlog.com
References: <81266270-42F4-48F9-9139-8F0C3F0A6553@linux.ibm.com>
 <20240401191038.18359-1-Alexander@wetzel-home.de>
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

On 4/1/24 12:10, Alexander Wetzel wrote:
> commit 27f58c04a8f4 ("scsi: sg: Avoid sg device teardown race")
> introduced an incorrect WARN_ON_ONCE() and missed a sequence where
> sg_device_destroy() was used after scsi_device_put().
> 
> sg_device_destroy() is accessing the parent scsi_device request_queue which
> will already be set to NULL when the preceding call to scsi_device_put()
> removed the last reference to the parent scsi_device.
> 
> Drop the incorrect WARN_ON_ONCE() - allowing more than one concurrent
> access to the sg device - and make sure sg_device_destroy() is not used
> after scsi_device_put() in the error handling.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
