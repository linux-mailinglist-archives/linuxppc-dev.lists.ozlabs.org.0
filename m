Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BBB79F99D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 06:42:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IYDN3BuG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IYDN3BuG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmPml6Gwdz3cC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 14:41:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IYDN3BuG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IYDN3BuG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmPlp1S2xz3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 14:41:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694666464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e3bXAX87RWvBbot/wl4o5o2psWRwLqLOl+iTFzlKLtg=;
	b=IYDN3BuGReE3EbeO6Oc1Z21nLI3VxIDBTFvEnJiFUAvKcP93xzj1MWFUi8J2tqMUIz3CYx
	j39zMdg+incv3FUAGBlybYauKXs+QUUMwHpSbLQUKCoGyQZ49XWX8IBTJLsuV13sSoIzEh
	cDtSwiNDo51Elk5N0U8dpe7CHL+mTqE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694666464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e3bXAX87RWvBbot/wl4o5o2psWRwLqLOl+iTFzlKLtg=;
	b=IYDN3BuGReE3EbeO6Oc1Z21nLI3VxIDBTFvEnJiFUAvKcP93xzj1MWFUi8J2tqMUIz3CYx
	j39zMdg+incv3FUAGBlybYauKXs+QUUMwHpSbLQUKCoGyQZ49XWX8IBTJLsuV13sSoIzEh
	cDtSwiNDo51Elk5N0U8dpe7CHL+mTqE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-LS6BjVi7O8qDXux5J0weow-1; Thu, 14 Sep 2023 00:40:58 -0400
X-MC-Unique: LS6BjVi7O8qDXux5J0weow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF40280523C;
	Thu, 14 Sep 2023 04:40:57 +0000 (UTC)
Received: from localhost (unknown [10.72.112.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEFC240C6EA8;
	Thu, 14 Sep 2023 04:40:56 +0000 (UTC)
Date: Thu, 14 Sep 2023 12:40:53 +0800
From: Baoquan He <bhe@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] vmcore: remove dependency with is_kdump_kernel()
 for exporting vmcore
Message-ID: <ZQKO1ckVu0Xj1abW@MiWiFi-R3L-srv>
References: <20230912082950.856977-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912082950.856977-1-hbathini@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Kexec-ml <kexec@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Dave Young <dyoung@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/12/23 at 01:59pm, Hari Bathini wrote:
> Currently, is_kdump_kernel() returns true when elfcorehdr_addr is set.
> While elfcorehdr_addr is set for kexec based kernel dump mechanism,
> alternate dump capturing methods like fadump [1] also set it to export
> the vmcore. Since, is_kdump_kernel() is used to restrict resources in
> crash dump capture kernel and such restrictions may not be desirable
> for fadump, allow is_kdump_kernel() to be defined differently for such
> scenarios. With this, is_kdump_kernel() could be false while vmcore is
> usable. So, remove unnecessary dependency with is_kdump_kernel(), for
> exporting vmcore.
> 
> [1] https://docs.kernel.org/powerpc/firmware-assisted-dump.html
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> Changes in v3:
> * Decoupled is_vmcore_usable() & vmcore_unusable() from is_kdump_kernel()
>   as suggested here: 
>     https://lore.kernel.org/linuxppc-dev/ZP7si3UMVpPfYV+w@MiWiFi-R3L-srv/T/#m13ae5a7e4ba6f4d8397f0f66581832292eee3a85
> 
> 
>  include/linux/crash_dump.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

LGTM,

Acked-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
> index 0f3a656293b0..acc55626afdc 100644
> --- a/include/linux/crash_dump.h
> +++ b/include/linux/crash_dump.h
> @@ -50,6 +50,7 @@ void vmcore_cleanup(void);
>  #define vmcore_elf64_check_arch(x) (elf_check_arch(x) || vmcore_elf_check_arch_cross(x))
>  #endif
>  
> +#ifndef is_kdump_kernel
>  /*
>   * is_kdump_kernel() checks whether this kernel is booting after a panic of
>   * previous kernel or not. This is determined by checking if previous kernel
> @@ -64,6 +65,7 @@ static inline bool is_kdump_kernel(void)
>  {
>  	return elfcorehdr_addr != ELFCORE_ADDR_MAX;
>  }
> +#endif
>  
>  /* is_vmcore_usable() checks if the kernel is booting after a panic and
>   * the vmcore region is usable.
> @@ -75,7 +77,8 @@ static inline bool is_kdump_kernel(void)
>  
>  static inline int is_vmcore_usable(void)
>  {
> -	return is_kdump_kernel() && elfcorehdr_addr != ELFCORE_ADDR_ERR ? 1 : 0;
> +	return elfcorehdr_addr != ELFCORE_ADDR_ERR &&
> +		elfcorehdr_addr != ELFCORE_ADDR_MAX ? 1 : 0;
>  }
>  
>  /* vmcore_unusable() marks the vmcore as unusable,
> @@ -84,8 +87,7 @@ static inline int is_vmcore_usable(void)
>  
>  static inline void vmcore_unusable(void)
>  {
> -	if (is_kdump_kernel())
> -		elfcorehdr_addr = ELFCORE_ADDR_ERR;
> +	elfcorehdr_addr = ELFCORE_ADDR_ERR;
>  }
>  
>  /**
> -- 
> 2.41.0
> 

