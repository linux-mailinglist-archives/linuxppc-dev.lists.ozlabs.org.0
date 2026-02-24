Return-Path: <linuxppc-dev+bounces-17092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOgGJnxhnWksPQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 09:29:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C15C8183AED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 09:29:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKrVt6kWYz3cJW;
	Tue, 24 Feb 2026 19:29:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771921782;
	cv=none; b=VkEDoSUXf98Yt4hCzHY5PG4U07Ekzazs1WCwlb8vmQn5VVjg7mhhWPeo9LgsyjjEShEVz6YWtWmUBXfDdlzggykFJ3MAX2w0bEvQco216MvRqbOONA1OKm6hWLvOP68x90uDNl/P27vKqmtTu6hqiYVP0VGNcnUYW0GO8W+RrR4GBmoslBVe9zvkvFzZhj+9ab4NXE6Pzbxfz45WG4ZEgoK6o+uqNph2y6JqS9KH9zR0Nm0DM8Q0UgkcUyCAjCIGHrBdpiC88KF2dXu+Q1GjCkcOS0kMO+Q3/eJeYh43GoJQU1wv0H7m0kE+Czd9BmIV0u1jf6lQfkza0kDGycQECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771921782; c=relaxed/relaxed;
	bh=BPTyswEAWcYBdxG+lq8T+yaWTvmllBTsbkuk0kDdtsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EI50z9w1x3IRG6KFsth5UgwPoeZulPhBhFC++H7Pox1iIw7btqAjoU8q1FDEGGgMIzHA5nG/RAhhEGZctnmQ5XsMEqkTBMckaM/w/RDerLKn00g9aqlpFyy8ri2BO4IVfsrikQG4zOPUroM3LjX0jFh8r3+Yi7SaJ8HTdA3BqN21fJOtGD8f8WtbDwnga1Znudq3Im4JhSBRlavwO2NkWr2Pp73DNHJhgjVDgUetUV/fjkpJVKA/SDgrFXiTBaezLLp0tOoiXxj07jBucLUbtm5X5NPyH5Vbt9hTQmisDUTmYhV5YgKrab4YJ+bDDQY/eU74SNb5HQghFVNJod5jOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SNHr9FXZ; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SNHr9FXZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKrVs5cT2z3cHf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 19:29:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE5F64336F;
	Tue, 24 Feb 2026 08:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C05C116D0;
	Tue, 24 Feb 2026 08:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771921779;
	bh=s889kssXllyZaSNT87Eq7q+8jDDE7Yxpqk+iIio+e2U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SNHr9FXZ68PnehoZL3L7xEXBRGUdm+0EhLsocHU+9tirzHDCoLqN3V2QCmwM00mFp
	 56eX4kO7yFSccVeMpCCHciajM3Exp8jX0CTK437GW390X7hsqkFXgOMqHpzSo9dwOr
	 gAWupmJ7IajiuRhF2F2wvCsyzFNkCXYWPJYSqlW0sxBoOO7rXoeWr/Lrd7Pi+rlqaN
	 uBwxTs8OpkFlRcTp7R8Fk4g1NXn7uLLvkQySG7lSr0UvbIGBeeebslLmBC16yR0B+K
	 ypauaUdj+Vw7FA8SQSuJZm+95Wy19zR4mLaCokOhS0Hp6PJmuRilzyiPWckoq9+kgV
	 Czu3m3TQWWTwA==
Message-ID: <ff1c77b9-bb29-48f8-b942-6ace8ea31dd1@kernel.org>
Date: Tue, 24 Feb 2026 09:29:33 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: fs_enet: allow nvmem to override MAC
 address
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260224014607.353378-1-rosenp@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260224014607.353378-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17092-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:netdev@vger.kernel.org,m:pantelis.antoniou@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:pantelisantoniou@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,lists.ozlabs.org,vger.kernel.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C15C8183AED
X-Rspamd-Action: no action



Le 24/02/2026 à 02:46, Rosen Penev a écrit :
> NVMEM typically loads after the ethernet driver and
> of_get_ethdev_address returns -EPROBE_DEFER. return in such a case to
> allow NVMEM to work.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> index 2cbcc29408e3..d3c772ed5fc9 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
> @@ -951,7 +951,9 @@ static int fs_enet_probe(struct platform_device *ofdev)
>   	spin_lock_init(&fep->lock);
>   	spin_lock_init(&fep->tx_lock);
> 
> -	of_get_ethdev_address(ofdev->dev.of_node, ndev);
> +	ret = of_get_ethdev_address(ofdev->dev.of_node, ndev);
> +	if (ret == -EPROBE_DEFER)
> +		goto out_cleanup_data;

What about other error cases ? Shouldn't it exit on all types of errors ?

> 
>   	ret = fep->ops->allocate_bd(ndev);
>   	if (ret)
> --
> 2.53.0
> 
> 


