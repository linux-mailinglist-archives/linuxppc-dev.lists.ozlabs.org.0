Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C294BC2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 19:31:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C1DW48TfzDqcF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 03:31:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="YjowJ7bq";
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C1BW6BFzzDqc6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 03:29:23 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id n4so1605241pgv.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 10:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pJnlN3GB3LCiX8n8Yu41vDyMDj7KwwMgL5n+env2IDs=;
 b=YjowJ7bqBnkG3ACdy3mw+/EopodCPwwQnhh3I+wToU24N+gVvG7CygB/iuXrcZIxAV
 af+fCCmCwgSCffL8K2lcaNLK8qbCpLFPlzYxyNnAvQDVgYTMe8gs4dRnUk5RHl4kf9Wn
 uDUs6MqYbH05O4eJ7jOa2ZnY6c+26JeuyUTvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pJnlN3GB3LCiX8n8Yu41vDyMDj7KwwMgL5n+env2IDs=;
 b=DN4MPs9Cv6wNGkn7/MZzAjaQHUgkZDI76P40WHyOeHMvx3J7sKiSneSocEBjll2gJs
 bwalD83aJx3LsNs6IrNVOrMBf3tn/jcRxBOw2xzp5WzJ03uaPE8IFAt3KYAOBN6NlTtK
 tKDQ6U5Q1qG6s/jSB0CXGJltmwubHAps804FrJKDG0VstxIkAsa6b9h4cvF5mUPZ80IW
 UWFcQlq+++0zFfcIFf+KuZ0sIC/FBQON0hO4nAWDTcF1gwsJqBO/0riIb3eDF/LbcwN2
 eoq/Sw1FIaPYJUVnWAmOnz2rGKAYNQB036MUePAStJEnxUUbpNmYr/+KfksxH3y/Sgz9
 6Ztw==
X-Gm-Message-State: APjAAAUas1TaS2z8be6kFA7T1LKUHU2Eupm/ixuMWFiBW7ovV2is4LEW
 ELXruqza8KHp9I5T7WKzidaufg==
X-Google-Smtp-Source: APXvYqyfLX6cumQO5rokvmiY8eb0/XCJfsC40kC95OZ/yMJvz1DLeS67pJU3m6lXTsnFXz6dHyqtyg==
X-Received: by 2002:a17:90a:800a:: with SMTP id
 b10mr21197273pjn.23.1566235760184; 
 Mon, 19 Aug 2019 10:29:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a1sm21455579pgh.61.2019.08.19.10.29.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 19 Aug 2019 10:29:19 -0700 (PDT)
Date: Mon, 19 Aug 2019 10:29:18 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Clean up cut-here even harder (was Re: [PATCH 1/3] powerpc: don't
 use __WARN() for WARN_ON())
Message-ID: <201908191026.831850CDB@keescook>
References: <a6781075192afe0c909ce7d091de7931183a5d93.1566219503.git.christophe.leroy@c-s.fr>
 <201908190917.9C65E23D6A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201908190917.9C65E23D6A@keescook>
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
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Drew Davenport <ddavenport@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 19, 2019 at 09:28:03AM -0700, Kees Cook wrote:
> On Mon, Aug 19, 2019 at 01:06:28PM +0000, Christophe Leroy wrote:
> > __WARN() used to just call __WARN_TAINT(TAINT_WARN)
> > 
> > But a call to printk() has been added in the commit identified below
> > to print a "---- cut here ----" line.
> > 
> > This change only applies to warnings using __WARN(), which means
> > WARN_ON() where the condition is constant at compile time.
> > For WARN_ON() with a non constant condition, the additional line is
> > not printed.
> > 
> > In addition, adding a call to printk() forces GCC to add a stack frame
> > and save volatile registers. Powerpc has been using traps to implement
> > warnings in order to avoid that.
> > 
> > So, call __WARN_TAINT(TAINT_WARN) directly instead of using __WARN()
> > in order to restore the previous behaviour.
> > 
> > If one day powerpc wants the decorative "---- cut here ----" line, it
> > has to be done in the trap handler, not in the WARN_ON() macro.
> > 
> > Fixes: 6b15f678fb7d ("include/asm-generic/bug.h: fix "cut here" for WARN_ON for __WARN_TAINT architectures")
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> Ah! Hmpf. Yeah, that wasn't an intended side-effect of this fix.
> 
> It seems PPC is not alone in this situation of making this code much
> noisier. It looks like there needs to be a way to indicate to the trap
> handler that a message was delivered or not. Perhaps we can add another
> taint flag?

I meant "bug flag" here, not taint. Here's a stab at it. This tries to
remove redundant defines, and moves the "cut here" up into the slow path
explicitly (out of _warn()) and creates a flag so the trap handler can
actually detect if things were already reported...

Thoughts?


diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index aa6c093d9ce9..c2b79878f24c 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -10,6 +10,7 @@
 #define BUGFLAG_WARNING		(1 << 0)
 #define BUGFLAG_ONCE		(1 << 1)
 #define BUGFLAG_DONE		(1 << 2)
+#define BUGFLAG_PRINTK		(1 << 3)
 #define BUGFLAG_TAINT(taint)	((taint) << 8)
 #define BUG_GET_TAINT(bug)	((bug)->flags >> 8)
 #endif
@@ -62,13 +63,11 @@ struct bug_entry {
 #endif
 
 #ifdef __WARN_FLAGS
-#define __WARN_TAINT(taint)		__WARN_FLAGS(BUGFLAG_TAINT(taint))
-#define __WARN_ONCE_TAINT(taint)	__WARN_FLAGS(BUGFLAG_ONCE|BUGFLAG_TAINT(taint))
-
 #define WARN_ON_ONCE(condition) ({				\
 	int __ret_warn_on = !!(condition);			\
 	if (unlikely(__ret_warn_on))				\
-		__WARN_ONCE_TAINT(TAINT_WARN);			\
+		__WARN_FLAGS(BUGFLAG_ONCE |			\
+			     BUGFLAG_TAINT(TAINT_WARN));	\
 	unlikely(__ret_warn_on);				\
 })
 #endif
@@ -89,7 +88,7 @@ struct bug_entry {
  *
  * Use the versions with printk format strings to provide better diagnostics.
  */
-#ifndef __WARN_TAINT
+#ifndef __WARN_FLAGS
 extern __printf(3, 4)
 void warn_slowpath_fmt(const char *file, const int line,
 		       const char *fmt, ...);
@@ -104,12 +103,12 @@ extern void warn_slowpath_null(const char *file, const int line);
 	warn_slowpath_fmt_taint(__FILE__, __LINE__, taint, arg)
 #else
 extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
-#define __WARN() do { \
-	printk(KERN_WARNING CUT_HERE); __WARN_TAINT(TAINT_WARN); \
-} while (0)
+#define __WARN()		__WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
 #define __WARN_printf(arg...)	__WARN_printf_taint(TAINT_WARN, arg)
-#define __WARN_printf_taint(taint, arg...)				\
-	do { __warn_printk(arg); __WARN_TAINT(taint); } while (0)
+#define __WARN_printf_taint(taint, arg...)	do {			\
+		__warn_printk(arg); __WARN_FLAGS(BUGFLAG_PRINTK |	\
+						 BUGFLAG_TAINT(taint));	\
+	} while (0)
 #endif
 
 /* used internally by panic.c */
diff --git a/kernel/panic.c b/kernel/panic.c
index 057540b6eee9..03c98da6e3f7 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -551,9 +551,6 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
 {
 	disable_trace_on_warning();
 
-	if (args)
-		pr_warn(CUT_HERE);
-
 	if (file)
 		pr_warn("WARNING: CPU: %d PID: %d at %s:%d %pS\n",
 			raw_smp_processor_id(), current->pid, file, line,
@@ -596,6 +593,7 @@ void warn_slowpath_fmt(const char *file, int line, const char *fmt, ...)
 {
 	struct warn_args args;
 
+	pr_warn(CUT_HERE);
 	args.fmt = fmt;
 	va_start(args.args, fmt);
 	__warn(file, line, __builtin_return_address(0), TAINT_WARN, NULL,
@@ -609,6 +607,7 @@ void warn_slowpath_fmt_taint(const char *file, int line,
 {
 	struct warn_args args;
 
+	pr_warn(CUT_HERE);
 	args.fmt = fmt;
 	va_start(args.args, fmt);
 	__warn(file, line, __builtin_return_address(0), taint, NULL, &args);
diff --git a/lib/bug.c b/lib/bug.c
index 1077366f496b..73ce8f9d9eff 100644
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -181,6 +181,10 @@ enum bug_trap_type report_bug(unsigned long bugaddr, struct pt_regs *regs)
 		}
 	}
 
+	/* Did this trap already report a printk line with "cut here"? */
+	if ((bug->flags & BUGFLAG_PRINTK) == 0)
+		printk(KERN_DEFAULT CUT_HERE);
+
 	if (warning) {
 		/* this is a WARN_ON rather than BUG/BUG_ON */
 		__warn(file, line, (void *)bugaddr, BUG_GET_TAINT(bug), regs,
@@ -188,8 +192,6 @@ enum bug_trap_type report_bug(unsigned long bugaddr, struct pt_regs *regs)
 		return BUG_TRAP_TYPE_WARN;
 	}
 
-	printk(KERN_DEFAULT CUT_HERE);
-
 	if (file)
 		pr_crit("kernel BUG at %s:%u!\n", file, line);
 	else


-- 
Kees Cook
