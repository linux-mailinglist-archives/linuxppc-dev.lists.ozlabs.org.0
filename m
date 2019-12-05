Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 540F1114824
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 21:35:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TSBv5t6KzDqbY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 07:35:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=pauld@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="P16XpMux"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TMGD2DpczDqZS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 03:52:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575564753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anfDWVusi5N36MRztAUZYmAyYRGj+YufNIguVozKE5Q=;
 b=P16XpMuxF0+Xnx0vXk4vKOpvjZ4f6lyOpyih1NLPIYfyax0cwWs2swpsfjlCvzWeaJgKCz
 OKwVXFqMU/hzj4RW4h7QyEM+pi+T1TOfBV6TXdOakie+rcfjHcukZPTDiNp6o0RstVoifm
 gBZj+X2PWH0oGSDSFQbJ+wgeFs4TMMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-WE44cf5-PBKVKsVS8LET5g-1; Thu, 05 Dec 2019 08:51:33 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7171F107ACFB;
 Thu,  5 Dec 2019 13:51:31 +0000 (UTC)
Received: from lorien.usersys.redhat.com (ovpn-116-240.phx2.redhat.com
 [10.3.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73F4B5D6A5;
 Thu,  5 Dec 2019 13:51:25 +0000 (UTC)
Date: Thu, 5 Dec 2019 08:51:23 -0500
From: Phil Auld <pauld@redhat.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 2/2] powerpc/shared: Use static key to detect shared
 processor
Message-ID: <20191205135123.GB18693@lorien.usersys.redhat.com>
References: <20191205083218.25824-1-srikar@linux.vnet.ibm.com>
 <20191205083218.25824-2-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20191205083218.25824-2-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: WE44cf5-PBKVKsVS8LET5g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 06 Dec 2019 07:33:31 +1100
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
 Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>, Waiman Long <longman@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 05, 2019 at 02:02:18PM +0530 Srikar Dronamraju wrote:
> With the static key shared processor available, is_shared_processor()
> can return without having to query the lppaca structure.
>=20
> Cc: Parth Shah <parth@linux.ibm.com>
> Cc: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Phil Auld <pauld@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
> Changelog v1 (https://patchwork.ozlabs.org/patch/1204192/) ->v2:
> Now that we no more refer to lppaca, remove the comment.
>=20
> Changelog v2->v3:
> Code is now under CONFIG_PPC_SPLPAR as it depends on CONFIG_PPC_PSERIES.
> This was suggested by Waiman Long.
>=20
>  arch/powerpc/include/asm/spinlock.h | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/a=
sm/spinlock.h
> index de817c25deff..e83d57f27566 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -111,13 +111,8 @@ static inline void splpar_rw_yield(arch_rwlock_t *lo=
ck) {};
> =20
>  static inline bool is_shared_processor(void)
>  {
> -/*
> - * LPPACA is only available on Pseries so guard anything LPPACA related =
to
> - * allow other platforms (which include this common header) to compile.
> - */
> -#ifdef CONFIG_PPC_PSERIES
> -=09return (IS_ENABLED(CONFIG_PPC_SPLPAR) &&
> -=09=09lppaca_shared_proc(local_paca->lppaca_ptr));
> +#ifdef CONFIG_PPC_SPLPAR
> +=09return static_branch_unlikely(&shared_processor);
>  #else
>  =09return false;
>  #endif
> --=20
> 2.18.1
>=20

Fwiw,

Acked-by: Phil Auld <pauld@redhat.com>
--=20

