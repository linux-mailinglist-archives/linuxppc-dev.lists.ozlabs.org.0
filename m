Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 622522388F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 15:46:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4570Xx4ZySzDqHj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 23:46:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=cz5i=tu=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4570Vm0RHpzDqFs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 23:44:15 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AED8720856;
 Mon, 20 May 2019 13:44:12 +0000 (UTC)
Date: Mon, 20 May 2019 09:44:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 2/4] x86/ftrace: Fix use of flags in
 ftrace_replace_code()
Message-ID: <20190520094410.772443df@gandalf.local.home>
In-Reply-To: <20190520091320.01cdcfb7@gandalf.local.home>
References: <cover.1558115654.git.naveen.n.rao@linux.vnet.ibm.com>
 <e1429923d9eda92a3cf5ee9e33c7eacce539781d.1558115654.git.naveen.n.rao@linux.vnet.ibm.com>
 <20190520091320.01cdcfb7@gandalf.local.home>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/pdR2VOW.5bP4U0J6Tdqr_j+"
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--MP_/pdR2VOW.5bP4U0J6Tdqr_j+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, 20 May 2019 09:13:20 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:


> > I haven't yet tested this patch on x86, but this looked wrong so sending 
> > this as a RFC.  
> 
> This code has been through a bit of updates, and I need to go through
> and clean it up. I'll have to take a look and convert "int" to "bool"
> so that "enable" is not confusing.
> 
> Thanks, I think I'll try to do a clean up first, and then this patch
> shouldn't "look wrong" after that.
> 

I'm going to apply the attached two patches. There may be some
conflicts between yours here and these, but nothing that Linus can't
figure out. Do you feel more comfortable with this code, if these
patches are applied?

-- Steve

--MP_/pdR2VOW.5bP4U0J6Tdqr_j+
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-ftrace-Make-enable-and-update-parameters-bool-when-a.patch

From d6b694e350e61259ad18fe2b912911b52ff4767a Mon Sep 17 00:00:00 2001
From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Date: Mon, 20 May 2019 09:26:24 -0400
Subject: [PATCH 1/2] ftrace: Make enable and update parameters bool when
 applicable

The code modification functions have "enable" and "update" variables that
are sometimes "int" but used as "bool". Remove the ambiguity and make them
"bool" when they are only used for true or false values.

Link: http://lkml.kernel.org/r/e1429923d9eda92a3cf5ee9e33c7eacce539781d.1558115654.git.naveen.n.rao@linux.vnet.ibm.com

Reported-by: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 include/linux/ftrace.h |  4 ++--
 kernel/trace/ftrace.c  | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 25e2995d4a4c..8a8cb3c401b2 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -427,8 +427,8 @@ struct dyn_ftrace *ftrace_rec_iter_record(struct ftrace_rec_iter *iter);
 	     iter = ftrace_rec_iter_next(iter))
 
 
-int ftrace_update_record(struct dyn_ftrace *rec, int enable);
-int ftrace_test_record(struct dyn_ftrace *rec, int enable);
+int ftrace_update_record(struct dyn_ftrace *rec, bool enable);
+int ftrace_test_record(struct dyn_ftrace *rec, bool enable);
 void ftrace_run_stop_machine(int command);
 unsigned long ftrace_location(unsigned long ip);
 unsigned long ftrace_location_range(unsigned long start, unsigned long end);
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index a12aff849c04..47b41502a24c 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1768,7 +1768,7 @@ static bool __ftrace_hash_rec_update(struct ftrace_ops *ops,
 		count++;
 
 		/* Must match FTRACE_UPDATE_CALLS in ftrace_modify_all_code() */
-		update |= ftrace_test_record(rec, 1) != FTRACE_UPDATE_IGNORE;
+		update |= ftrace_test_record(rec, true) != FTRACE_UPDATE_IGNORE;
 
 		/* Shortcut, if we handled all records, we are done. */
 		if (!all && count == hash->count)
@@ -2047,7 +2047,7 @@ void ftrace_bug(int failed, struct dyn_ftrace *rec)
 	}
 }
 
-static int ftrace_check_record(struct dyn_ftrace *rec, int enable, int update)
+static int ftrace_check_record(struct dyn_ftrace *rec, bool enable, bool update)
 {
 	unsigned long flag = 0UL;
 
@@ -2146,12 +2146,12 @@ static int ftrace_check_record(struct dyn_ftrace *rec, int enable, int update)
 /**
  * ftrace_update_record, set a record that now is tracing or not
  * @rec: the record to update
- * @enable: set to 1 if the record is tracing, zero to force disable
+ * @enable: set to true if the record is tracing, false to force disable
  *
  * The records that represent all functions that can be traced need
  * to be updated when tracing has been enabled.
  */
-int ftrace_update_record(struct dyn_ftrace *rec, int enable)
+int ftrace_update_record(struct dyn_ftrace *rec, bool enable)
 {
 	return ftrace_check_record(rec, enable, 1);
 }
@@ -2159,13 +2159,13 @@ int ftrace_update_record(struct dyn_ftrace *rec, int enable)
 /**
  * ftrace_test_record, check if the record has been enabled or not
  * @rec: the record to test
- * @enable: set to 1 to check if enabled, 0 if it is disabled
+ * @enable: set to true to check if enabled, false if it is disabled
  *
  * The arch code may need to test if a record is already set to
  * tracing to determine how to modify the function code that it
  * represents.
  */
-int ftrace_test_record(struct dyn_ftrace *rec, int enable)
+int ftrace_test_record(struct dyn_ftrace *rec, bool enable)
 {
 	return ftrace_check_record(rec, enable, 0);
 }
@@ -2356,7 +2356,7 @@ unsigned long ftrace_get_addr_curr(struct dyn_ftrace *rec)
 }
 
 static int
-__ftrace_replace_code(struct dyn_ftrace *rec, int enable)
+__ftrace_replace_code(struct dyn_ftrace *rec, bool enable)
 {
 	unsigned long ftrace_old_addr;
 	unsigned long ftrace_addr;
@@ -2395,7 +2395,7 @@ void __weak ftrace_replace_code(int mod_flags)
 {
 	struct dyn_ftrace *rec;
 	struct ftrace_page *pg;
-	int enable = mod_flags & FTRACE_MODIFY_ENABLE_FL;
+	bool enable = mod_flags & FTRACE_MODIFY_ENABLE_FL;
 	int schedulable = mod_flags & FTRACE_MODIFY_MAY_SLEEP_FL;
 	int failed;
 
-- 
2.20.1


--MP_/pdR2VOW.5bP4U0J6Tdqr_j+
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0002-x86-ftrace-Make-enable-parameter-bool-where-applicab.patch

From a15f59dc19e1fdf7eda74e7aec386975740d1515 Mon Sep 17 00:00:00 2001
From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Date: Mon, 20 May 2019 09:38:11 -0400
Subject: [PATCH 2/2] x86/ftrace: Make enable parameter bool where applicable

The code modification functions have an "enable" parameter that is an "int"
but used as a boolean. Switch its type to "bool" to remove the ambiguity
that "int" causes.

Link: http://lkml.kernel.org/r/e1429923d9eda92a3cf5ee9e33c7eacce539781d.1558115654.git.naveen.n.rao@linux.vnet.ibm.com

Reported-by: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 arch/x86/kernel/ftrace.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 0927bb158ffc..ba37bcb7f92b 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -370,7 +370,7 @@ static int add_brk_on_nop(struct dyn_ftrace *rec)
 	return add_break(rec->ip, old);
 }
 
-static int add_breakpoints(struct dyn_ftrace *rec, int enable)
+static int add_breakpoints(struct dyn_ftrace *rec, bool enable)
 {
 	unsigned long ftrace_addr;
 	int ret;
@@ -478,7 +478,7 @@ static int add_update_nop(struct dyn_ftrace *rec)
 	return add_update_code(ip, new);
 }
 
-static int add_update(struct dyn_ftrace *rec, int enable)
+static int add_update(struct dyn_ftrace *rec, bool enable)
 {
 	unsigned long ftrace_addr;
 	int ret;
@@ -524,7 +524,7 @@ static int finish_update_nop(struct dyn_ftrace *rec)
 	return ftrace_write(ip, new, 1);
 }
 
-static int finish_update(struct dyn_ftrace *rec, int enable)
+static int finish_update(struct dyn_ftrace *rec, bool enable)
 {
 	unsigned long ftrace_addr;
 	int ret;
-- 
2.20.1


--MP_/pdR2VOW.5bP4U0J6Tdqr_j+--
