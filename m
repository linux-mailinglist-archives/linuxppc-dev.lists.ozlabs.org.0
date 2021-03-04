Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8459E32D389
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 13:49:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrrKb42X6z3d5r
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 23:49:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=mXbcH1kP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=mXbcH1kP; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrrK92Vfrz3cZ8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 23:48:58 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id l22so7947601wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 04:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=tLUSBdXqsZoskjTYTdXu1BqIlUPP/WrZ7mFGxUMCU0I=;
 b=mXbcH1kPTs6JSHEVOCy+0mhZ4P4dTLu3meBMOJGoaRR86OVwKoIBEKCXpkpD/fKAyP
 2YTSqNf5sIcN/Bonf5jzBjXTpf+/t8mv4btXE2YKTLgDBO/KBosKQmcyQzKOyrn3sAhZ
 Fu+KmncqhtIScyDzHF5PTydi49B7l8m4+vwN/Va3F/+GzumhXvZWobD/NFPIVKS7RS4b
 WlND1d/P86vFRjwPOaHf75Ci0W3EKZzqtL6J2KhdxF96pIZ434+ZhGxyg+weUbuT54ic
 xHR6sjhoH0aky5jd2frAokdyQ+cVLvXZvY5hYKdCJdGGaJ3vskr5RrLDh3YljgD9pFEe
 U9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=tLUSBdXqsZoskjTYTdXu1BqIlUPP/WrZ7mFGxUMCU0I=;
 b=mq/Aw/O/VLdZJ5psCdJ42nS3vm5J6K5ADgQg0N4TzhOoRcpnyU+LCGwFWWGwTEs0UL
 71tesPdUG/IVoD5YdMW73B+cTwKWsWwYvbDJEQOu9hGHbusuifNtqrgqMfukGLDcmvQd
 GmxBJUc9AcMQQoyRjbY2CXjfiDDB6KZJL1elqXjeUpRR53pEsNAtbZMzPEIyPZS65DyJ
 bBzXh8cmO3PfG1uiUgMt5MO1Uk4k3dka5g5pK16Nh/xx7bMJVWWhb+WJ63XsrIc/cZHD
 UgMRWJpRcTadStoYOhDtDFH39SrunZqUulPgN7Dgs/sdsC+gpl2W83blfhsKMkE4qFwO
 QqFQ==
X-Gm-Message-State: AOAM532EGo+JJygA9JKb2rOfYs61omYlDebQxuHXi+FOqgLngcGXZ3cL
 A+PwIvYApiFt0X1KHOaIqE28cA==
X-Google-Smtp-Source: ABdhPJx42ffsx6t3vXywl/vSnKIFFNJx9RXE5JrQUOddSStzLAxgkV7PNsyFoqZKNBC70+T2V/e7LQ==
X-Received: by 2002:a7b:cf2f:: with SMTP id m15mr3718425wmg.177.1614862132881; 
 Thu, 04 Mar 2021 04:48:52 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:15:13:e426:34b7:f237:f8d3])
 by smtp.gmail.com with ESMTPSA id z21sm9778125wma.29.2021.03.04.04.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 04:48:52 -0800 (PST)
Date: Thu, 4 Mar 2021 13:48:39 +0100
From: Marco Elver <elver@google.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
Message-ID: <YEDXJ5JNkgvDFehc@elver.google.com>
References: <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
 <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
 <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
 <CANpmjNPYEmLtQEu5G=zJLUzOBaGoqNKwLyipDCxvytdKDKb7mg@mail.gmail.com>
 <ad61cb3a-2b4a-3754-5761-832a1dd0c34e@csgroup.eu>
 <CANpmjNOnVzei7frKcMzMHxaDXh5NvTA-Wpa29C2YC1GUxyKfhQ@mail.gmail.com>
 <f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu>
 <CANpmjNMn_CUrgeSqBgiKx4+J8a+XcxkaLPWoDMUvUEXk8+-jxg@mail.gmail.com>
 <7270e1cc-bb6b-99ee-0043-08a027b8d83a@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7270e1cc-bb6b-99ee-0043-08a027b8d83a@csgroup.eu>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
Cc: LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 04, 2021 at 12:48PM +0100, Christophe Leroy wrote:
> Le 04/03/2021 à 12:31, Marco Elver a écrit :
> > On Thu, 4 Mar 2021 at 12:23, Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> > > Le 03/03/2021 à 11:56, Marco Elver a écrit :
> > > > 
> > > > Somewhat tangentially, I also note that e.g. show_regs(regs) (which
> > > > was printed along the KFENCE report above) didn't include the top
> > > > frame in the "Call Trace", so this assumption is definitely not
> > > > isolated to KFENCE.
> > > > 
> > > 
> > > Now, I have tested PPC64 (with the patch I sent yesterday to modify save_stack_trace_regs()
> > > applied), and I get many failures. Any idea ?
> > > 
> > > [   17.653751][   T58] ==================================================================
> > > [   17.654379][   T58] BUG: KFENCE: invalid free in .kfence_guarded_free+0x2e4/0x530
> > > [   17.654379][   T58]
> > > [   17.654831][   T58] Invalid free of 0xc00000003c9c0000 (in kfence-#77):
> > > [   17.655358][   T58]  .kfence_guarded_free+0x2e4/0x530
> > > [   17.655775][   T58]  .__slab_free+0x320/0x5a0
> > > [   17.656039][   T58]  .test_double_free+0xe0/0x198
> > > [   17.656308][   T58]  .kunit_try_run_case+0x80/0x110
> > > [   17.656523][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0x50
> > > [   17.657161][   T58]  .kthread+0x18c/0x1a0
> > > [   17.659148][   T58]  .ret_from_kernel_thread+0x58/0x70
> > > [   17.659869][   T58]
[...]
> > 
> > Looks like something is prepending '.' to function names. We expect
> > the function name to appear as-is, e.g. "kfence_guarded_free",
> > "test_double_free", etc.
> > 
> > Is there something special on ppc64, where the '.' is some convention?
> > 
> 
> I think so, see https://refspecs.linuxfoundation.org/ELF/ppc64/PPC-elf64abi.html#FUNC-DES
> 
> Also see commit https://github.com/linuxppc/linux/commit/02424d896

Thanks -- could you try the below patch? You'll need to define
ARCH_FUNC_PREFIX accordingly.

We think, since there are only very few architectures that add a prefix,
requiring <asm/kfence.h> to define something like ARCH_FUNC_PREFIX is
the simplest option. Let me know if this works for you.

There an alternative option, which is to dynamically figure out the
prefix, but if this simpler option is fine with you, we'd prefer it.

Thanks,
-- Marco

------ >8 ------

From d118080eb9552073f5dcf1f86198f3d86d5ea850 Mon Sep 17 00:00:00 2001
From: Marco Elver <elver@google.com>
Date: Thu, 4 Mar 2021 13:15:51 +0100
Subject: [PATCH] kfence: fix reports if constant function prefixes exist

Some architectures prefix all functions with a constant string ('.' on
ppc64). Add ARCH_FUNC_PREFIX, which may optionally be defined in
<asm/kfence.h>, so that get_stack_skipnr() can work properly.

Link: https://lkml.kernel.org/r/f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Marco Elver <elver@google.com>
---
 mm/kfence/report.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/mm/kfence/report.c b/mm/kfence/report.c
index 519f037720f5..e3f71451ad9e 100644
--- a/mm/kfence/report.c
+++ b/mm/kfence/report.c
@@ -20,6 +20,11 @@
 
 #include "kfence.h"
 
+/* May be overridden by <asm/kfence.h>. */
+#ifndef ARCH_FUNC_PREFIX
+#define ARCH_FUNC_PREFIX ""
+#endif
+
 extern bool no_hash_pointers;
 
 /* Helper function to either print to a seq_file or to console. */
@@ -67,8 +72,9 @@ static int get_stack_skipnr(const unsigned long stack_entries[], int num_entries
 	for (skipnr = 0; skipnr < num_entries; skipnr++) {
 		int len = scnprintf(buf, sizeof(buf), "%ps", (void *)stack_entries[skipnr]);
 
-		if (str_has_prefix(buf, "kfence_") || str_has_prefix(buf, "__kfence_") ||
-		    !strncmp(buf, "__slab_free", len)) {
+		if (str_has_prefix(buf, ARCH_FUNC_PREFIX "kfence_") ||
+		    str_has_prefix(buf, ARCH_FUNC_PREFIX "__kfence_") ||
+		    !strncmp(buf, ARCH_FUNC_PREFIX "__slab_free", len)) {
 			/*
 			 * In case of tail calls from any of the below
 			 * to any of the above.
@@ -77,10 +83,10 @@ static int get_stack_skipnr(const unsigned long stack_entries[], int num_entries
 		}
 
 		/* Also the *_bulk() variants by only checking prefixes. */
-		if (str_has_prefix(buf, "kfree") ||
-		    str_has_prefix(buf, "kmem_cache_free") ||
-		    str_has_prefix(buf, "__kmalloc") ||
-		    str_has_prefix(buf, "kmem_cache_alloc"))
+		if (str_has_prefix(buf, ARCH_FUNC_PREFIX "kfree") ||
+		    str_has_prefix(buf, ARCH_FUNC_PREFIX "kmem_cache_free") ||
+		    str_has_prefix(buf, ARCH_FUNC_PREFIX "__kmalloc") ||
+		    str_has_prefix(buf, ARCH_FUNC_PREFIX "kmem_cache_alloc"))
 			goto found;
 	}
 	if (fallback < num_entries)
-- 
2.30.1.766.gb4fecdf3b7-goog
