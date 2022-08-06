Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFA558B57D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 14:30:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M0MHJ5wT8z3bln
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 22:30:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=apNzvozy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=apNzvozy;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M0MGh6xCMz2xGn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Aug 2022 22:29:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1659788969;
	bh=lELR8WYbBOTLMAY/ROaaXRuZyiwAFpzcRRcD1yGmR+U=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=apNzvozypDvfl+MSvi7KV4U35S2+iYLdE7MHwBnhQu76G6FAXT8jIOqLdQoXlxjvW
	 fdL5ir/WUxiQ3HDn2WsG8zw6rYaofqeVUK5AREuOJpej8my//MV8RxGBv3ZfDDfAgg
	 8wZg7xp3c8QSXyzjurThvivQxeZxk56W4O899kPs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.170.46]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKDe-1nUe3m3znY-00ygrT; Sat, 06
 Aug 2022 14:23:51 +0200
From: Helge Deller <deller@gmx.de>
To: linux-s390@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Josh Triplett <josh@joshtriplett.org>,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 2/3] lib/dump_stack: Add dump_stack_print_cmdline() and wire up in dump_stack_print_info()
Date: Sat,  6 Aug 2022 14:23:47 +0200
Message-Id: <20220806122348.82584-3-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220806122348.82584-1-deller@gmx.de>
References: <20220806122348.82584-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BialK5Gr6LY7i1wCJNhco7oXVVXlstreH3iQsxuzTtOakZOQe2F
 vaS/im2YcOCpaEPRnRhbwznsplhtoaQSv9+CnR8fhlHCyatnsnlA0W+ZsXyuLT3WuOa8/1s
 Je6ndthUB5LhqHBWmvC9Bs0YLneOfnYNLV77EF8VVLuieKytfZKrNg70+qqTKD8YXHgCVzQ
 /Op2Ok+TusjWlOroTn0dQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G0iN3smw0qI=:ym1I7aavjrz1RtWqYtRBpV
 vO9m2BBIb3SVdgpzyg0469An/ypaUkX4k8mNsr8DSTBOwaqmjMNiYSBz+ZFhvM8tGHKQ7Z8KT
 HiUmD87Bd7FYv/W70I7RgYYJ8vLHunXVeyuoDvNwOnqm9r5fRhM9r31Fwku82LMwXtonFl75Q
 GXhG/nkXkwIjO8h+x03BVPowzziD5UPDLXL0NoKhltLBLdKyZ69KB15Gx/z0c2FiS982zlNCo
 vwTpuDk0wBJ4VdJlTWyBc29GWGuWydDDrQSok1Qc7BRtct3sPzW8LB2ffiPpDH4rRxFKABpW4
 fGhgreK3JZ0JmihCl+PC3Q9YKYAbWz5BfgjnECUBVO7ickw700ZdrTCSgh7UKu1COjfFM1aUT
 XKcDyZ1O5D6KS1z0FIwFPwDTJ+sV5Mxj0rY9OOXOON6RPUV9s+IuHnn1t3ApmFDu+yc05QISs
 gYv0LKPB+aW6B3jtLRlTX5p0amPuxtyQI9rZwAzCgj71Pn3XUxbI8OrxD9iGcLKKupbnyrgV5
 GL+0A8sW5kJ+c9uux0DXhEQGiMIbGa+QP9MD1hJRlXd12e+VxTucoGkTenkHQ2mdi/rHVpj+T
 FznbbLP+K6XnVJvt/N2Qbx50/S/CPRKCxiGsljMOlZqVEOiAxFf1AhVBKyrUsPht4FQHIB1Wp
 m7JccXFhhKmChDWxNfI6xETbhQbo8vP7iyIkOrUVZes5DMWtKrKDRr1E8wmdCq3nfYkSZ9Ee7
 1uyTuEbbehK/o78HdS+fk1b/ejQnvUuZGzDxCAe7LEv6Vkq3mQ6WdHyfNVYPn5cHmxhiPzTRU
 eGiNzIKeC45wOeP7zm63Ajr3ZczEmyVIumdQv+kwngnJzSm066mZ+S1n5m3kN+YuUeYSRXr1h
 fR3ARdqCFK0UCnBbC1RCQMwwOWJNF1RSt2xzYB3M/qD16K5bp8PLCZjUvSr/qBTyEUtxVJmO/
 tnMnJHwdXfNIhdZXm4xONFsnqMAlW+iJILL9/FsrVy0BvtwbMAErauHiO1Xwuec4IcSxEJetT
 6ytKw/l2QITetIAIIVBauKdkw9er0ROMbEidOgqngjDk2Osrey5Hw8Q11d88LNdWBIVkfWKPc
 KGi/eGuupfrh60BewRO7xiEhtpPUu90UVmhNHWUvwWrVJk4eiksK8SRzg==
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

