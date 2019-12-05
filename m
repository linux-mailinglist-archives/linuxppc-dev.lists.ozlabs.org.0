Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 048EC11432D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 16:00:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TJmn5v3wzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 02:00:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="T+F81I0I"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TJk50ddPzDqYt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 01:58:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575557881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4Y6P74GH7IDU2V73vo7hbpCkzrjgS1/yZhqCTFviqs=;
 b=T+F81I0ITK20McqNXBIoDX4CLSAaAAPwUmRZQyH+4RTt07LMPXApI6cD0hgdpoddazA+82
 oPHtaMB7onqKjz1YRaqNk7qu5TxBqQYkHTJ4gVC+gQxY0MrQ654h0b01UQvSjw4JfXSDA3
 FLj24qa8FqTg+TiL+tHQsGYRrOCPzws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-F6tFe3TQMyytJmLXdYW32g-1; Thu, 05 Dec 2019 09:57:57 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70272107B7F7;
 Thu,  5 Dec 2019 14:57:56 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-59.bos.redhat.com [10.18.17.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9683E5D9C9;
 Thu,  5 Dec 2019 14:57:55 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] powerpc/shared: Use static key to detect shared
 processor
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20191205083218.25824-1-srikar@linux.vnet.ibm.com>
 <20191205083218.25824-2-srikar@linux.vnet.ibm.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <86445ab1-d6de-ad51-e1de-bc769de59032@redhat.com>
Date: Thu, 5 Dec 2019 09:57:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191205083218.25824-2-srikar@linux.vnet.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: F6tFe3TQMyytJmLXdYW32g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Parth Shah <parth@linux.ibm.com>,
 Phil Auld <pauld@redhat.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/5/19 3:32 AM, Srikar Dronamraju wrote:
> With the static key shared processor available, is_shared_processor()
> can return without having to query the lppaca structure.
>
> Cc: Parth Shah <parth@linux.ibm.com>
> Cc: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Phil Auld <pauld@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
> Changelog v1 (https://patchwork.ozlabs.org/patch/1204192/) ->v2:
> Now that we no more refer to lppaca, remove the comment.
>
> Changelog v2->v3:
> Code is now under CONFIG_PPC_SPLPAR as it depends on CONFIG_PPC_PSERIES.
> This was suggested by Waiman Long.
>
>  arch/powerpc/include/asm/spinlock.h | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> index de817c25deff..e83d57f27566 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -111,13 +111,8 @@ static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
>  
>  static inline bool is_shared_processor(void)
>  {
> -/*
> - * LPPACA is only available on Pseries so guard anything LPPACA related to
> - * allow other platforms (which include this common header) to compile.
> - */
> -#ifdef CONFIG_PPC_PSERIES
> -	return (IS_ENABLED(CONFIG_PPC_SPLPAR) &&
> -		lppaca_shared_proc(local_paca->lppaca_ptr));
> +#ifdef CONFIG_PPC_SPLPAR
> +	return static_branch_unlikely(&shared_processor);
>  #else
>  	return false;
>  #endif

Acked-by: Waiman Long <longman@redhat.com>

