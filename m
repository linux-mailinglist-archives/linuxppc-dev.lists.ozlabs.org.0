Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A904F1B884F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 19:54:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498dwK05hMzDqhl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 03:54:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=R1myo23W; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498dtN2CqQzDqSl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 03:53:00 +1000 (AEST)
Received: from zn.tnic (p200300EC2F2A1100B46A3E12B0A6AFFD.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f2a:1100:b46a:3e12:b0a6:affd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D4BD71EC0CF3;
 Sat, 25 Apr 2020 19:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1587837177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=TpVMN9srSTRxzvdHGcL8+sKPNt7gpM//pRvQmGJNb+g=;
 b=R1myo23W52fNK5banUDGZAMqtoKEU/6DDqsccMiQpe/spVb9kuw+4clgkM6kJTQ4luTcjE
 uzvdFcE6YUUhVG3d5V+1sI9Tmua8HKBPjiQ7gREV6Hwe8YtF3IBCUgvz5V8OJC7itxgqx1
 IsoJeTOOta5x06C5ENaQc8aSDwAfBI0=
Date: Sat, 25 Apr 2020 19:52:49 +0200
From: Borislav Petkov <bp@alien8.de>
To: Arvind Sankar <nivedita@alum.mit.edu>
Subject: Re: [PATCH] x86: Fix early boot crash on gcc-10, next try
Message-ID: <20200425175249.GC24294@zn.tnic>
References: <20200422192113.GG26846@zn.tnic>
 <CAKwvOdkbcO8RzoafON2mGiSy5P96P5+aY8GySysF2my7q+nTqw@mail.gmail.com>
 <20200422212605.GI26846@zn.tnic>
 <CAKwvOd=exxhfb8N6=1Q=wBUaYcRDEq3L1+TiHDLz+pxWg8OuwQ@mail.gmail.com>
 <20200423125300.GC26021@zn.tnic> <20200423161126.GD26021@zn.tnic>
 <20200425014657.GA2191784@rani.riverdale.lan>
 <20200425085759.GA24294@zn.tnic>
 <20200425150440.GA470719@rani.riverdale.lan>
 <20200425173140.GB24294@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200425173140.GB24294@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jakub Jelinek <jakub@redhat.com>, jgross@suse.com, x86@kernel.org,
 Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, Michael Matz <matz@suse.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Sergei Trofimovich <slyfox@gentoo.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 =?utf-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Thomas Gleixner <tglx@linutronix.de>,
 Martin =?utf-8?B?TGnFoWth?= <mliska@suse.cz>, boris.ostrovsky@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 25, 2020 at 07:31:40PM +0200, Borislav Petkov wrote:
> Hmm, that's what I was afraid of - having to sprinkle this around. Yah, let's
> wait for compiler guys to have a look here and then maybe I'll convert that
> thing to a macro called
> 
> 	compiler_prevent_tail_call_opt()
> 
> or so, so that it can be sprinkled around. ;-\

IOW, something like this (ontop) which takes care of the xen case too.
If it needs to be used by all arches, then I'll split the patch:

---
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 73bf8450afa1..4f275ac7830b 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -273,7 +273,7 @@ static void notrace start_secondary(void *unused)
 	 * boot_init_stack_canary() and must not be checked before tail calling
 	 * another function.
 	 */
-	asm ("");
+	prevent_tail_call_optimization();
 }
 
 /**
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 8fb8a50a28b4..f2adb63b2d7c 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -93,6 +93,7 @@ asmlinkage __visible void cpu_bringup_and_idle(void)
 	cpu_bringup();
 	boot_init_stack_canary();
 	cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
+	prevent_tail_call_optimization();
 }
 
 void xen_smp_intr_free_pv(unsigned int cpu)
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 034b0a644efc..73f889f64513 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -356,4 +356,7 @@ static inline void *offset_to_ptr(const int *off)
 /* &a[0] degrades to a pointer: a different type from an array */
 #define __must_be_array(a)	BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
 
+
+#define prevent_tail_call_optimization()	asm("")
+
 #endif /* __LINUX_COMPILER_H */


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
