Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C53FF848AD7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Feb 2024 04:27:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=My6IunYp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=My6IunYp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TSFLR5F0Fz3ccV
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Feb 2024 14:27:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=My6IunYp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=My6IunYp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSFKb3WJLz3bnx
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Feb 2024 14:26:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707017181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eysYxb9qJ6RxmbOxjXjjrpSobYnMDkjTn7GmoY0o3W4=;
	b=My6IunYp1gj/brtBTlliNRuvd3mj17Q/2g0TDqy8M0Nb7ACC7h6eSFtBstxMwLLIHFJOJ7
	rZTjSSxdgMMh62Fdy1Am3j74jw3S7u4aDOLEpjh6iZzc5sg3FrIWr0yNfR7kJyeaotWO4r
	DLZCU+HjbN9uk26nCGuBHJmyp5orOaU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707017181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eysYxb9qJ6RxmbOxjXjjrpSobYnMDkjTn7GmoY0o3W4=;
	b=My6IunYp1gj/brtBTlliNRuvd3mj17Q/2g0TDqy8M0Nb7ACC7h6eSFtBstxMwLLIHFJOJ7
	rZTjSSxdgMMh62Fdy1Am3j74jw3S7u4aDOLEpjh6iZzc5sg3FrIWr0yNfR7kJyeaotWO4r
	DLZCU+HjbN9uk26nCGuBHJmyp5orOaU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-x_mqoEOfNmSyHGbxxMyZPQ-1; Sat,
 03 Feb 2024 22:26:17 -0500
X-MC-Unique: x_mqoEOfNmSyHGbxxMyZPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9FBD1C0514F;
	Sun,  4 Feb 2024 03:26:16 +0000 (UTC)
Received: from localhost (unknown [10.72.116.13])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED10F2026F95;
	Sun,  4 Feb 2024 03:26:15 +0000 (UTC)
Date: Sun, 4 Feb 2024 11:26:12 +0800
From: Baoquan He <bhe@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v2 00/14] Split crash out from kexec and clean up related
 config items
Message-ID: <Zb8D1ASrgX0qVm9z@MiWiFi-R3L-srv>
References: <20240119145241.769622-1-bhe@redhat.com>
 <9101bb07-70f1-476c-bec9-ec67e9899744@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9101bb07-70f1-476c-bec9-ec67e9899744@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
Cc: linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/02/24 at 10:53am, Hari Bathini wrote:
> Hi Baoquan,
> 
> On 19/01/24 8:22 pm, Baoquan He wrote:
> > Motivation:
> > =============
> > Previously, LKP reported a building error. When investigating, it can't
> > be resolved reasonablly with the present messy kdump config items.
> > 
> >   https://lore.kernel.org/oe-kbuild-all/202312182200.Ka7MzifQ-lkp@intel.com/
> > 
> > The kdump (crash dumping) related config items could causes confusions:
> > 
> > Firstly,
> > ---
> > CRASH_CORE enables codes including
> >   - crashkernel reservation;
> >   - elfcorehdr updating;
> >   - vmcoreinfo exporting;
> >   - crash hotplug handling;
> > 
> > Now fadump of powerpc, kcore dynamic debugging and kdump all selects
> > CRASH_CORE, while fadump
> >   - fadump needs crashkernel parsing, vmcoreinfo exporting, and accessing
> >     global variable 'elfcorehdr_addr';
> >   - kcore only needs vmcoreinfo exporting;
> >   - kdump needs all of the current kernel/crash_core.c.
> > 
> > So only enabling PROC_CORE or FA_DUMP will enable CRASH_CORE, this
> > mislead people that we enable crash dumping, actual it's not.
> > 
> > Secondly,
> > ---
> > It's not reasonable to allow KEXEC_CORE select CRASH_CORE.
> > 
> > Because KEXEC_CORE enables codes which allocate control pages, copy
> > kexec/kdump segments, and prepare for switching. These codes are
> > shared by both kexec reboot and kdump. We could want kexec reboot,
> > but disable kdump. In that case, CRASH_CORE should not be selected.
> > 
> >   --------------------
> >   CONFIG_CRASH_CORE=y
> >   CONFIG_KEXEC_CORE=y
> >   CONFIG_KEXEC=y
> >   CONFIG_KEXEC_FILE=y
> >      ---------------------
> > 
> > Thirdly,
> > ---
> > It's not reasonable to allow CRASH_DUMP select KEXEC_CORE.
> > 
> > That could make KEXEC_CORE, CRASH_DUMP are enabled independently from
> > KEXEC or KEXEC_FILE. However, w/o KEXEC or KEXEC_FILE, the KEXEC_CORE
> > code built in doesn't make any sense because no kernel loading or
> > switching will happen to utilize the KEXEC_CORE code.
> >   ---------------------
> >   CONFIG_CRASH_CORE=y
> >   CONFIG_KEXEC_CORE=y
> >   CONFIG_CRASH_DUMP=y
> >   ---------------------
> > 
> > In this case, what is worse, on arch sh and arm, KEXEC relies on MMU,
> > while CRASH_DUMP can still be enabled when !MMU, then compiling error is
> > seen as the lkp test robot reported in above link.
> > 
> >   ------arch/sh/Kconfig------
> >   config ARCH_SUPPORTS_KEXEC
> >           def_bool MMU
> > 
> >   config ARCH_SUPPORTS_CRASH_DUMP
> >           def_bool BROKEN_ON_SMP
> >   ---------------------------
> > 
> > Changes:
> > ===========
> > 1, split out crash_reserve.c from crash_core.c;
> > 2, split out vmcore_infoc. from crash_core.c;
> > 3, move crash related codes in kexec_core.c into crash_core.c;
> > 4, remove dependency of FA_DUMP on CRASH_DUMP;
> > 5, clean up kdump related config items;
> > 6, wrap up crash codes in crash related ifdefs on all 9 arch-es
> >     which support crash dumping;
> > 
> > Achievement:
> > ===========
> > With above changes, I can rearrange the config item logic as below (the right
> > item depends on or is selected by the left item):
> > 
> >      PROC_KCORE -----------> VMCORE_INFO
> > 
> >                 |----------> VMCORE_INFO
> >      FA_DUMP----|
> >                 |----------> CRASH_RESERVE
> 
> FA_DUMP also needs PROC_VMCORE (CRASH_DUMP by dependency, I guess).
> So, the FA_DUMP related changes here will need a relook..

Thanks for checking this.

So FA_DUMP needs vmcoreinfo exporting, crashkernel reservation,
/proc/vmcore. Then it's easy to adjust the kernel config item of FA_DUMP
to make it select CRASH_DUMP. Except of this, do you have concern about
the current code and Kconfig refactorying?


                           ---->VMCORE_INFO
                         /|
FA_DUMP--> CRASH_DUMP-->/-|---->CRASH_RESERVE
                        \ |
                          \---->PROC_VMCORE


> 
> 
> >                                                      ---->VMCORE_INFO
> >                                                     /
> >                                                     |---->CRASH_RESERVE
> >      KEXEC      --|                                /|
> >                   |--> KEXEC_CORE--> CRASH_DUMP-->/-|---->PROC_VMCORE
> >      KEXEC_FILE --|                               \ |
> >                                                     \---->CRASH_HOTPLUG
> > 
> > 
> >      KEXEC      --|
> >                   |--> KEXEC_CORE (for kexec reboot only)
> >      KEXEC_FILE --|
> > 
> > Test
> > ========
> > On all 8 architectures, including x86_64, arm64, s390x, sh, arm, mips,
> > riscv, loongarch, I did below three cases of config item setting and
> > building all passed. Let me take configs on x86_64 as exampmle here:
> > 
> > (1) Both CONFIG_KEXEC and KEXEC_FILE is unset, then all kexec/kdump
> > items are unset automatically:
> > # Kexec and crash features
> > # CONFIG_KEXEC is not set
> > # CONFIG_KEXEC_FILE is not set
> > # end of Kexec and crash features
> > 
> > (2) set CONFIG_KEXEC_FILE and 'make olddefconfig':
> > ---------------
> > # Kexec and crash features
> > CONFIG_CRASH_RESERVE=y
> > CONFIG_VMCORE_INFO=y
> > CONFIG_KEXEC_CORE=y
> > CONFIG_KEXEC_FILE=y
> > CONFIG_CRASH_DUMP=y
> > CONFIG_CRASH_HOTPLUG=y
> > CONFIG_CRASH_MAX_MEMORY_RANGES=8192
> > # end of Kexec and crash features
> > ---------------
> > 
> > (3) unset CONFIG_CRASH_DUMP in case 2 and execute 'make olddefconfig':
> > ------------------------
> > # Kexec and crash features
> > CONFIG_KEXEC_CORE=y
> > CONFIG_KEXEC_FILE=y
> > # end of Kexec and crash features
> > ------------------------
> > 
> > Note:
> > For ppc, it needs investigation to make clear how to split out crash
> > code in arch folder.
> 
> On powerpc, both kdump and fadump need PROC_VMCORE & CRASH_DUMP.
> Hope that clears things. So, patch 3/14 breaks things for FA_DUMP..

I see it now. We can easily fix that with below patch. What do you
think?

By the way, do you have chance to help test these on powerpc system?
I can find ppc64le machine, while I don't know how to operate to test
fadump.

From fa8e6c3930d4f22f2b3768399c5bf0523c17adde Mon Sep 17 00:00:00 2001
From: Baoquan He <bhe@redhat.com>
Date: Sun, 4 Feb 2024 11:06:54 +0800
Subject: [PATCH] power/fadump: make FA_DUMP select CRASH_DUMP
Content-type: text/plain

FA_DUMP which is similar with kdump needs vmcoreinfo exporting,
crashkernel reservation and /proc/vmcore file . After refactoring crash
related codes and Kconfig items, make FA_DUMP select CRASH_DUMP. Now
the dependency layout is like below:

                           ---->VMCORE_INFO
                         /|
FA_DUMP--> CRASH_DUMP-->/-|---->CRASH_RESERVE
                        \ |
                          \---->PROC_VMCORE

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/powerpc/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f182fb354bef..d5d4c890f010 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -695,8 +695,7 @@ config ARCH_SELECTS_CRASH_DUMP
 config FA_DUMP
 	bool "Firmware-assisted dump"
 	depends on PPC64 && (PPC_RTAS || PPC_POWERNV)
-	select VMCORE_INFO
-	select CRASH_RESERVE
+	select CRASH_DUMP
 	help
 	  A robust mechanism to get reliable kernel crash dump with
 	  assistance from firmware. This approach does not use kexec,
-- 
2.41.0


> 
> > Hope Hari and Pingfan can help have a look, see if
> > it's doable. Now, I make it either have both kexec and crash enabled, or
> > disable both of them altogether.
> 
> 
> Sure. I will take a closer look...

Thanks a lot. Please feel free to post patches to make that, or I can do
it with your support or suggestion.

