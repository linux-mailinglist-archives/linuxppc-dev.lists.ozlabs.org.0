Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63679573876
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 16:11:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjfgP26SHz3c6p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 00:11:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=ogzxYLvo;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=n53SJw4a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kroah.com (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=greg@kroah.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=ogzxYLvo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=n53SJw4a;
	dkim-atps=neutral
X-Greylist: delayed 447 seconds by postgrey-1.36 at boromir; Thu, 14 Jul 2022 00:10:51 AEST
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ljffg5mwxz3c2G
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 00:10:51 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 496753200962;
	Wed, 13 Jul 2022 10:03:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 13 Jul 2022 10:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1657720997; x=1657807397; bh=L3ybPyzca4
	nzTBAjBDD3y8s9vn3LOipcGuuEt3Q0f60=; b=ogzxYLvoDajdsTmQ3Jdh/OneP6
	82anTfsFp9ig1wApHyLFo0ZfgxyjzSvdDuQw1mcgAgimetVb74fWdIwd7jKTesDP
	S5hBqprYWmK6pEK9fc2pYHmmuAzloX24NtDlDH4wFmbbgAKkyGM3tINYrGSmiGk0
	7JFBGAjBdG6lcDKIwuHqHndZbS6LR0SlteK5qmPzpZXETW76mId5ZVJJvNWkrgHd
	MooSD7zOv5DShL7icGUChSvVkoDhtSYwUzRbLgBAWodw54lMPoEWsIygRm6AX8II
	4c0slTAsg9ISxBvgX83Vgu0HJ5cNmzoxJ8hdnq5km+Ugce1Bdd0pjtRxbcgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657720997; x=1657807397; bh=L3ybPyzca4nzTBAjBDD3y8s9vn3L
	OipcGuuEt3Q0f60=; b=n53SJw4axe3Pd1UanXaP5XMciIXaPkbJdbITZzSNq3cL
	S7mQWRB6W0JVMCq7lHGC5oeQ0ZDGiGSnovNjxvt8cVV6jj5AZeZ/wATt9BrC/bFC
	Pi12CyaGM6F1KvRM/yn98U0tkqs4yZZ1gVHwQGbjxjIHYr0aAcyPE5Dh7Tic2380
	g4a3BFF8sujBEGNz5UDnWfrTHWUft+G9IRkf8n65tULU0D+AtTcbb13OUKcgH6ml
	b3WUlDeDoYpI9Yopv8Fr4If6ZfDsl0ECU/z7K1egRgO02zvMlF0g16nen/+RbZWe
	wFLMrMgRNT/mJjCmyDCafAUB2v02aTaDIhF8WWhbag==
X-ME-Sender: <xms:pNDOYpK7RsVrK4Ptb2yavROP3DvJwRnjtw_4bgbGYa4tSa5WAM4eGA>
    <xme:pNDOYlIlMVrfXlHDPrE9NkUbGXbd0RqnGBz9nM4QvCF6T-Tdbv_fnbZPtR8vNjNti
    MFJPWd_Y0bPwg>
X-ME-Received: <xmr:pNDOYhvobAlTHfgS93RRi_BVq78WqIs-qiWqK2RkZ_ypn5KDkHV16W-l4zh2-XB8x8lMQkThXcB7bMdEm_pUrHTngF1dPeJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejjedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekje
    euhfdtueefhffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:pNDOYqaBroOnZBr7nPqDOkkStSIxskAmsRlDyhVAlXPBigqk-i-TVA>
    <xmx:pNDOYgYcFI8hrkYsGHjP8XGm2P2pwjGHiPGMDf2llyWWfhGYrVSQGw>
    <xmx:pNDOYuDuK4eAjCtYoOoJI9g_vEzxuj7T8G1dIaR-ceRPKsC_8k6eCQ>
    <xmx:pdDOYlMpAg4jyUQeJGCc-BtU0o9QW7rfhU0FVpUc2_vYIMu4FGjL7Q>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Jul 2022 10:03:15 -0400 (EDT)
Date: Wed, 13 Jul 2022 16:03:11 +0200
From: Greg KH <greg@kroah.com>
To: NAME <sohu0106@126.com>
Subject: Re: [PATCH] macintosh:fix oob read in do_adb_query function
Message-ID: <Ys7Qn8dlIbkH/2O0@kroah.com>
References: <20220713134037.2331-1-sohu0106@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713134037.2331-1-sohu0106@126.com>
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
Cc: security@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 13, 2022 at 09:40:37PM +0800, NAME wrote:
> From: sohu0106 <sohu0106@126.com>

For obvious reasons, we need a real name here, and in the signed-off-by
line.

> In do_adb_query function of drivers/macintosh/adb.c,
> req->data is copy form userland. The parameter
> "req->data[2]" is Missing check, the array size of
> adb_handler[] is 16, so "adb_handler[req->data[2]].
> original_address" and "adb_handler[req->data[2]].
> handler_id" will lead to oob read.

You can use all 72 columns, if you want to re-wrap these lines when you
resend.

> 
> Signed-off-by: sohu0106 <sohu0106@126.com>
> ---
>  drivers/macintosh/adb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/macintosh/adb.c b/drivers/macintosh/adb.c
> index 439fab4eaa85..1bbb9ca08d40 100644
> --- a/drivers/macintosh/adb.c
> +++ b/drivers/macintosh/adb.c
> @@ -647,7 +647,7 @@ do_adb_query(struct adb_request *req)
>  
>  	switch(req->data[1]) {
>  	case ADB_QUERY_GETDEVINFO:
> -		if (req->nbytes < 3)
> +		if (req->nbytes < 3 || req->data[2] >= 16)

Shouldn't 16 be the array size instead of having this hard coded to a
magic number?

Something like "sizeof(adb_handler) / sizeof(struct adb_handler)"?

Maybe not, that's messy, your choice.

thanks,

greg k-h
