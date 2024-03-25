Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8384D8898C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 10:49:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FSxmuxYv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FSxmuxYv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V37Sj0GGQz3vZB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 20:49:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FSxmuxYv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FSxmuxYv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V37Rd3Gsdz3dX7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 20:48:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711360120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BzvHsR0swPhNezye8rUpRIe+AmkradciiszFVdBH2qI=;
	b=FSxmuxYvPrdDs8HMLQzeY8sSXAKYWv4QR1yZp4UN36bWow0Ors90vwH9arkjzN11rdXqw/
	ayOcVbPm6SGLAIG24KKyPVtqIx8a4b6hzSIQ/XE+5w2Lp/Xmdp3ExS53t2QQl9OrFj/4rX
	fF5qtAXTcXwZDBIhsql93t2MMJJyjFA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711360120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BzvHsR0swPhNezye8rUpRIe+AmkradciiszFVdBH2qI=;
	b=FSxmuxYvPrdDs8HMLQzeY8sSXAKYWv4QR1yZp4UN36bWow0Ors90vwH9arkjzN11rdXqw/
	ayOcVbPm6SGLAIG24KKyPVtqIx8a4b6hzSIQ/XE+5w2Lp/Xmdp3ExS53t2QQl9OrFj/4rX
	fF5qtAXTcXwZDBIhsql93t2MMJJyjFA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-81-sGBrjBOZPjWGzkRUL_JyGQ-1; Mon,
 25 Mar 2024 05:48:36 -0400
X-MC-Unique: sGBrjBOZPjWGzkRUL_JyGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B0273C0BE29;
	Mon, 25 Mar 2024 09:48:35 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4782E112131D;
	Mon, 25 Mar 2024 09:48:25 +0000 (UTC)
Date: Mon, 25 Mar 2024 17:48:18 +0800
From: Baoquan He <bhe@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH linux-next v3 02/14] crash: split vmcoreinfo exporting
 code out from crash_core.c
Message-ID: <ZgFIYuYULrgF1tFG@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-3-bhe@redhat.com>
 <CAMuHMdVxKEGYj9C1=P-493vcrN_HmLNx8gS6i1nheXO9gH46oA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVxKEGYj9C1=P-493vcrN_HmLNx8gS6i1nheXO9gH46oA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
Cc: linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, hbathini@linux.ibm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/25/24 at 09:24am, Geert Uytterhoeven wrote:
> Hi Baoquan,
> 
> On Wed, Jan 24, 2024 at 6:13 AM Baoquan He <bhe@redhat.com> wrote:
> > Now move the relevant codes into separate files:
> > kernel/crash_reserve.c, include/linux/crash_reserve.h.
> >
> > And add config item CRASH_RESERVE to control its enabling.
> >
> > And also update the old ifdeffery of CONFIG_CRASH_CORE, including of
> > <linux/crash_core.h> and config item dependency on CRASH_CORE
> > accordingly.
> >
> > And also do renaming as follows:
> >  - arch/xxx/kernel/{crash_core.c => vmcore_info.c}
> > because they are only related to vmcoreinfo exporting on x86, arm64,
> > riscv.
> >
> > And also Remove config item CRASH_CORE, and rely on CONFIG_KEXEC_CORE to
> > decide if build in crash_core.c.
> >
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> > v2->v3:
> > - There's conflict when rebasing to linux-next in kernel/crash_core.c
> >   because of below commits from Uladzislau:
> >   commit 699d9351822e ("mm: vmalloc: Fix a warning in the crash_save_vmcoreinfo_init()")
> >   commit 5f4c0c1e2a51 (:mm/vmalloc: remove vmap_area_list")
> 
> Thanks for your patch, which is now commit 443cbaf9e2fdbef7
> ("crash: split vmcoreinfo exporting code out from
> crash_core.c") in v6.9-rc1.
> 
> After this, there are still two references left to CRASH_CORE:
> 
>   1. Documentation/admin-guide/kdump/kdump.rst:
> 
>          Subsequently, CRASH_CORE is selected by KEXEC_CORE::
> 
>   2. arch/loongarch/Kconfig
> 
>          config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>              def_bool CRASH_CORE

Sure, will post patch to clean them up. Thanks a lot.

