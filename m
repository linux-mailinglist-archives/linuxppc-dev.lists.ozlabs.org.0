Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FFD58C926
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 15:11:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1c6G1V81z3ds5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 23:11:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=YARkRCk+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=YARkRCk+;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1c4L1MnPz2xkS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 23:09:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1659964158;
	bh=lELR8WYbBOTLMAY/ROaaXRuZyiwAFpzcRRcD1yGmR+U=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=YARkRCk+edkIn5nZtTwbKK3+c5x4yjVNPDa9GujrX2humxefMcP6U/5piDtobCt91
	 mE894Vzo2J/rqBnP+M/O9/i+Xrz22svt5Szx2tjzGcOVwE4jcCJ2O4SXL1SGq5zwmx
	 OcJCGuVzeFwDEtHtoszNgMaJ+SvMji6yr7O7AwqE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.169.184]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGyxN-1o8AKD2zDf-00E4Zm; Mon, 08
 Aug 2022 15:09:18 +0200
From: Helge Deller <deller@gmx.de>
To: linux-s390@vger.kernel.org,
	Josh Triplett <josh@joshtriplett.org>,
	x86@kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/4] lib/dump_stack: Add dump_stack_print_cmdline() and wire up in dump_stack_print_info()
Date: Mon,  8 Aug 2022 15:09:15 +0200
Message-Id: <20220808130917.30760-3-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808130917.30760-1-deller@gmx.de>
References: <20220808130917.30760-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dyv38+4Ugz+oNJYhEqwA1WGPLQMQCHxH7gYA9DzhxE1ZyTHPUeX
 lgD4MbyXnzij2je0A21JveizFDJ0RysmHlBxi1vdTStYEm+RmHzoUuMstEW+hD9FO33SxJr
 oP2WdouS9nQ1WcoKEklsuUfDBg9/nB9mx5tSBtp94vcEnDi6cGYPDjwHjZ/7PA8qYfqxH+H
 F9wPqtQXlYJ80YG68DQag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RpW0RFU0Z6E=:vHBeUsc70DYciJo0r3uauF
 MGJOW+2JX5iPyl7bzACYuZzcsgE0KOuDtO1K2Bppk4muzBADa/0UwkNWZnhnxq9gctbdzfM2F
 CjYlu/8hoQK8Rp2oi6uDjx0cvEw7fMo5WqUcUNzy/eq+XjoGQFk9oFfC6s4hJjWMIRGQtNjNM
 QcPSX8jSs3qP0DmNaFDGPankZ4Q+5EQr/+5SXjaSpwz59qzcyhuXKBV56vrYGFvdclmephBIq
 B7oxtrb2uaCWI+kvsoNLs/zrQv1fWspOyVBYQASk4fWO7nDttW8eUVv+FGqWNewFLKdxYj1Cx
 17xFxjhqi6jg4+258yvMd3QGes7U/5INRI5An1vrAxJH5fzxnwNa5zPcFWDdXr6824deE2ODO
 OnIvUA2lLkfbK+8WKDyeLKZvsnoifbZDBBXzHpy94LePbuI+4LeFGkvBQAXgWh89djmnICx+I
 bklL2SCdn6+Dj4mOle7BQzRhIdtZGFKKjmcbGFkOQ9mhbF/AEA0+p6vxkBh3l+Sg7YCaET3rX
 Cvn6uoFNHsLPmIGhUZ9naF1Tg1Utleqnayp70ND3Y/8G6eYDBwrdmJ09KCKMJLksREGa9gCLw
 QGLTi8C+auExK41IXHRYB1YmxVCytlyQkZpRSoEB0K4iKVRvdBlP1PMJMsR2YfYUG807KDgnx
 vytnyNGsCYDOSI8kcQLPdUWHRcUehw5OAt9bVZBM09KlvsDZOafd89xsjR8n+hQLQDgQXIv79
 EVl4Fwge064DHAD7FCCY1/yuzwgRafYs3caT3EgYOx0FP9ExsGBPef5/Xjz4gUcxhQ7xEAvEG
 1Yq4ZjOoSQ+WCbrKx2ftLQmfGPZLqor0mdgKBg/sfVEHQs6h0Qs8QYWVvlhaQIbWLavN+/5uV
 5FQmjRtWTcUL1tqvnWnOjjYl+4E41TpDG/r1W4ZyXt6usjTpUUKxzAbU1plRO4KLbMjfe6iGo
 OAVHd7w4z5xUq0GYnj0ApSE32SJ0q2AEhGU1eprIAN5I2PHSYdUvVzglD8DT1HnByn9qhqba9
 GfWGIRaNOFib7OQV8Uetfbqt4SniAEFZaEgLv2Vtvka4Z3i1FSZNu7FnWZKiSg3tCWc1Z0Rw1
 twVCPi6Gum3G2ewQ5/3id79oC2uC0VmtWK+w4iwrz3W4P9YWwp/BHym5w==
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the function dump_stack_print_cmdline() which can be used by arch
code to print the command line of the current processs.  This function
is useful in arch code when dumping information for a faulting process.

Wire this function up in the dump_stack_print_info() function to include
the dumping of the command line for architectures which use
dump_stack_print_info().

As an example, with this patch a failing glibc testcase (which uses
ld.so.1 as starting program) up to now reported just "ld.so.1" failing:

 do_page_fault() command=3D'ld.so.1' type=3D15 address=3D0x565921d8 in lib=
c.so[f7339000+1bb000]
 trap #15: Data TLB miss fault, vm_start =3D 0x0001a000, vm_end =3D 0x0001=
b000

and now it reports in addition:

 ld.so.1[1151] cmdline: /home/gnu/glibc/objdir/elf/ld.so.1 --library-path =
/home/gnu/glibc/objdir:/home/gnu/glibc/objdir/math:/home/gnu/
    /home/gnu/glibc/objdir/malloc/tst-safe-linking-malloc-hugetlb1

Josh Triplett noted that dumping such command line parameters into
syslog may theoretically lead to information disclosure.
That's why this patch checks the value of the kptr_restrict sysctl
variable and will not print any information if kptr_restrict=3D=3D2, and
will not show the program parameters if kptr_restrict=3D=3D1.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 include/linux/printk.h |  5 +++++
 lib/dump_stack.c       | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index cf7d666ab1f8..5290a32a197d 100644
=2D-- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -191,6 +191,7 @@ u32 log_buf_len_get(void);
 void log_buf_vmcoreinfo_setup(void);
 void __init setup_log_buf(int early);
 __printf(1, 2) void dump_stack_set_arch_desc(const char *fmt, ...);
+void dump_stack_print_cmdline(const char *log_lvl);
 void dump_stack_print_info(const char *log_lvl);
 void show_regs_print_info(const char *log_lvl);
 extern asmlinkage void dump_stack_lvl(const char *log_lvl) __cold;
@@ -262,6 +263,10 @@ static inline __printf(1, 2) void dump_stack_set_arch=
_desc(const char *fmt, ...)
 {
 }

+static inline void dump_stack_print_cmdline(const char *log_lvl)
+{
+}
+
 static inline void dump_stack_print_info(const char *log_lvl)
 {
 }
diff --git a/lib/dump_stack.c b/lib/dump_stack.c
index 83471e81501a..38ef1067c7eb 100644
=2D-- a/lib/dump_stack.c
+++ b/lib/dump_stack.c
@@ -14,6 +14,7 @@
 #include <linux/kexec.h>
 #include <linux/utsname.h>
 #include <linux/stop_machine.h>
+#include <linux/proc_fs.h>

 static char dump_stack_arch_desc_str[128];

@@ -45,6 +46,37 @@ void __init dump_stack_set_arch_desc(const char *fmt, .=
..)
 #define BUILD_ID_VAL ""
 #endif

+/**
+ * dump_stack_print_cmdline - print the command line of current process
+ * @log_lvl: log level
+ */
+void dump_stack_print_cmdline(const char *log_lvl)
+{
+	char cmdline[256];
+
+	if (kptr_restrict >=3D 2)
+		return; /* never show command line */
+
+	/* get command line */
+	get_task_cmdline_kernel(current, cmdline, sizeof(cmdline));
+
+	if (kptr_restrict =3D=3D 1) {
+		char *p;
+
+		/* if restricted show program path only */
+		p =3D strchr(cmdline, ' ');
+		if (p) {
+			*p =3D 0;
+			strlcat(cmdline,
+				" ... [parameters hidden due to kptr_restrict]",
+				sizeof(cmdline));
+		}
+	}
+
+	printk("%s%s[%d] cmdline: %s\n", log_lvl, current->comm,
+		current->pid, cmdline);
+}
+
 /**
  * dump_stack_print_info - print generic debug info for dump_stack()
  * @log_lvl: log level
@@ -62,6 +94,8 @@ void dump_stack_print_info(const char *log_lvl)
 	       (int)strcspn(init_utsname()->version, " "),
 	       init_utsname()->version, BUILD_ID_VAL);

+	dump_stack_print_cmdline(log_lvl);
+
 	if (dump_stack_arch_desc_str[0] !=3D '\0')
 		printk("%sHardware name: %s\n",
 		       log_lvl, dump_stack_arch_desc_str);
=2D-
2.37.1

