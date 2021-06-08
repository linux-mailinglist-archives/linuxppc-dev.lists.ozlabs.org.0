Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD1139F902
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 16:25:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzsw30vKZz3bs8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 00:25:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bt10VUzT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QGgGaya7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Bt10VUzT; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=QGgGaya7; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzsvX1c7dz2yX3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 00:24:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623162289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tEi3Rd6QEWk4RIuQqPyKGWZpdRlhfTcltszbR5N5ITU=;
 b=Bt10VUzTt0d6wyTm0XjppoNvjzup2ivj40LKStfjODzYyPkcZYk6+ilt69KRbF4hQiDTcx
 IEHBCDE9SLilgno0VBk7WncD/s4Mp6+wWwIiAW70ZR6vzQm5DT2fyEzbWUMeY9/7qmB6p7
 Vy6lE8E4inDkNqwnCv0/JpfrrcRFip0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623162290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tEi3Rd6QEWk4RIuQqPyKGWZpdRlhfTcltszbR5N5ITU=;
 b=QGgGaya7Pv8YreNare6n8nBibHP3P+3Do3xCcgZ9Zh40Z/cSA++r/qSuEf99M7iQZBdTYH
 RyXyk3s9rUJnVdFQWhe9Q+W6La/DuzV7lSvB0LyppgZ86pouR3hUcTI1mNF1sgdiPFWh3k
 u57bWPK3J06NXpPiJTKbX5Pmi/BZ35o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-d84TgJEiNruct7uiXptoiA-1; Tue, 08 Jun 2021 10:24:47 -0400
X-MC-Unique: d84TgJEiNruct7uiXptoiA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A5208049CB;
 Tue,  8 Jun 2021 14:24:44 +0000 (UTC)
Received: from localhost (ovpn-12-148.pek2.redhat.com [10.72.12.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4704F19C45;
 Tue,  8 Jun 2021 14:24:35 +0000 (UTC)
Date: Tue, 8 Jun 2021 22:24:32 +0800
From: Baoquan He <bhe@redhat.com>
To: Pingfan Liu <kernelfans@gmail.com>
Subject: Re: [PATCH] crash_core, vmcoreinfo: Append 'SECTION_SIZE_BITS' to
 vmcoreinfo
Message-ID: <20210608142432.GA587883@MiWiFi-R3L-srv>
References: <20210608103359.84907-1-kernelfans@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608103359.84907-1-kernelfans@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>, Thomas Gleixner <tglx@linutronix.de>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org,
 Dave Anderson <anderson@redhat.com>, linux-kernel@vger.kernel.org,
 Boris Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 James Morse <james.morse@arm.com>, akpm@linux-foundation.org,
 Dave Young <dyoung@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/08/21 at 06:33am, Pingfan Liu wrote:
> As mentioned in kernel commit 1d50e5d0c505 ("crash_core, vmcoreinfo:
> Append 'MAX_PHYSMEM_BITS' to vmcoreinfo"), SECTION_SIZE_BITS in the
> formula:
>     #define SECTIONS_SHIFT    (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
> 
> Besides SECTIONS_SHIFT, SECTION_SIZE_BITS is also used to calculate
> PAGES_PER_SECTION in makedumpfile just like kernel.
> 
> Unfortunately, this arch-dependent macro SECTION_SIZE_BITS changes, e.g.
> recently in kernel commit f0b13ee23241 ("arm64/sparsemem: reduce
> SECTION_SIZE_BITS"). But user space wants a stable interface to get this
> info. Such info is impossible to be deduced from a crashdump vmcore.
> Hence append SECTION_SIZE_BITS to vmcoreinfo.

> 
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Boris Petkov <bp@alien8.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: James Morse <james.morse@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Dave Anderson <anderson@redhat.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kexec@lists.infradead.org
> Cc: x86@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org


Add the discussion of the original thread in kexec ML for reference:
http://lists.infradead.org/pipermail/kexec/2021-June/022676.html

This looks good to me.

Acked-by: Baoquan He <bhe@redhat.com>

> ---
>  kernel/crash_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 825284baaf46..684a6061a13a 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -464,6 +464,7 @@ static int __init crash_save_vmcoreinfo_init(void)
>  	VMCOREINFO_LENGTH(mem_section, NR_SECTION_ROOTS);
>  	VMCOREINFO_STRUCT_SIZE(mem_section);
>  	VMCOREINFO_OFFSET(mem_section, section_mem_map);
> +	VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
>  	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
>  #endif
>  	VMCOREINFO_STRUCT_SIZE(page);
> -- 
> 2.29.2
> 

