Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBF2792008
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 04:31:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z86WUUda;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z86WUUda;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfqJV0278z3c6c
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 12:31:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z86WUUda;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z86WUUda;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfqHW2ZLdz2y1f
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 12:30:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693881041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+TD6AqqZEhek/ZfRieu/bQVlET4Mzq9l0FIdUCSmPvI=;
	b=Z86WUUdazRMvUSNe3oHkgPYLsXCQP3otIytT2Apuh7MCzMeq+N625+QFKPdfWQ2w5PpC+/
	02Uqdqh5FxLK4IbbMAAdfJiprHso5fk8NvRSS9Cqm8fHU0cRicGstQg4ahTHdF7CZH8GVk
	Q9ej90SVmrHiVlSTGBcUMiV6L2eLuIg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693881041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+TD6AqqZEhek/ZfRieu/bQVlET4Mzq9l0FIdUCSmPvI=;
	b=Z86WUUdazRMvUSNe3oHkgPYLsXCQP3otIytT2Apuh7MCzMeq+N625+QFKPdfWQ2w5PpC+/
	02Uqdqh5FxLK4IbbMAAdfJiprHso5fk8NvRSS9Cqm8fHU0cRicGstQg4ahTHdF7CZH8GVk
	Q9ej90SVmrHiVlSTGBcUMiV6L2eLuIg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-1_odNUnyN7S2l__P_hDscg-1; Mon, 04 Sep 2023 22:30:37 -0400
X-MC-Unique: 1_odNUnyN7S2l__P_hDscg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C626B8CB2D7;
	Tue,  5 Sep 2023 02:30:36 +0000 (UTC)
Received: from localhost (unknown [10.72.113.126])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 171AD200BAA9;
	Tue,  5 Sep 2023 02:30:35 +0000 (UTC)
Date: Tue, 5 Sep 2023 10:30:32 +0800
From: Baoquan He <bhe@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH 1/2] vmcore: allow alternate dump capturing methods to
 export vmcore without is_kdump_kernel()
Message-ID: <ZPaSyMuPa466sEPz@MiWiFi-R3L-srv>
References: <20230901190438.375678-1-hbathini@linux.ibm.com>
 <ZPP/UeP1zUbGPzrt@MiWiFi-R3L-srv>
 <8fcd7ba7-0f27-7bbc-676f-7e13c8bf00d7@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fcd7ba7-0f27-7bbc-676f-7e13c8bf00d7@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On 09/04/23 at 08:04pm, Hari Bathini wrote:
> Hi Baoquan,
> 
> Thanks for the review...
> 
> On 03/09/23 9:06 am, Baoquan He wrote:
> > Hi Hari,
> > 
> > On 09/02/23 at 12:34am, Hari Bathini wrote:
> > > Currently, is_kdump_kernel() returns true when elfcorehdr_addr is set.
> > > While elfcorehdr_addr is set for kexec based kernel dump mechanism,
> > > alternate dump capturing methods like fadump [1] also set it to export
> > > the vmcore. is_kdump_kernel() is used to restrict resources in crash
> > > dump capture kernel but such restrictions may not be desirable for
> > > fadump. Allow is_kdump_kernel() to be defined differently for such
> > > scenarios. With this, is_kdump_kernel() could be false while vmcore
> > > is usable. So, introduce is_crashdump_kernel() to return true when
> > > elfcorehdr_addr is set and use it for vmcore related checks.
> > 
> > I got what is done in these two patches, but didn't get why they need be
> > done. vmcore_unusable()/is_vmcore_usable() are only unitilized in ia64.
> > Why do you care if it's is_crashdump_kernel() or is_kdump_kernel()?
> > If you want to override the generic is_kdump_kernel() with powerpc's own
> > is_kdump_kernel(), your below change is enough to allow you to do that.
> > I can't see why is_crashdump_kernel() is needed. Could you explain that
> > specifically?
> 
> You mean to just remove is_kdump_kernel() check in is_vmcore_usable() &
> vmcore_unusable() functions? Replaced generic is_crashdump_kernel()
> function instead, that returns true for any dump capturing method,
> irrespective of whether is_kdump_kernel() returns true or false.
> For fadump case, is_kdump_kernel() will return false after patch 2/2.

OK, I could understand what you want to achieve. You want to make
is_kdump_kernel() only return true for kdump, while is_vmcore_usable()
returns true for both kdump and fadump.

IIUC, can we change as below? It could make code clearer and more
straightforward. I don't think adding another is_crashdump_kernel()
is a good idea, that would be a torture for non-powerpc people reading
code when they need differentiate between kdump and crashdump.

diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
index 0f3a656293b0..102a8b710b38 100644
--- a/include/linux/crash_dump.h
+++ b/include/linux/crash_dump.h
@@ -50,6 +50,7 @@ void vmcore_cleanup(void);
 #define vmcore_elf64_check_arch(x) (elf_check_arch(x) || vmcore_elf_check_arch_cross(x))
 #endif
 
+#ifndef is_kdump_active
 /*
  * is_kdump_kernel() checks whether this kernel is booting after a panic of
  * previous kernel or not. This is determined by checking if previous kernel
@@ -64,6 +65,14 @@ static inline bool is_kdump_kernel(void)
 {
 	return elfcorehdr_addr != ELFCORE_ADDR_MAX;
 }
+#endif
+
+#ifndef is_fadump_active
+static inline bool is_fadump_active(void)
+{
+	return false;
+}
+#endif
 
 /* is_vmcore_usable() checks if the kernel is booting after a panic and
  * the vmcore region is usable.
@@ -75,7 +84,8 @@ static inline bool is_kdump_kernel(void)
 
 static inline int is_vmcore_usable(void)
 {
-	return is_kdump_kernel() && elfcorehdr_addr != ELFCORE_ADDR_ERR ? 1 : 0;
+	return (is_kdump_kernel() || is_fadump_active())
+		&& elfcorehdr_addr != ELFCORE_ADDR_ERR ? 1 : 0;
 }
 
 /* vmcore_unusable() marks the vmcore as unusable,
@@ -84,7 +94,7 @@ static inline int is_vmcore_usable(void)
 
 static inline void vmcore_unusable(void)
 {
-	if (is_kdump_kernel())
+	if (is_kdump_kernel() || is_fadump_active())
 		elfcorehdr_addr = ELFCORE_ADDR_ERR;
 }
 

