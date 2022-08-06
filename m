Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B4358B57F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 14:31:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M0MJb5VhKz3dt5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 22:31:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=INBvJ+bQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=INBvJ+bQ;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M0MGj0Cljz2xr8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Aug 2022 22:29:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1659788970;
	bh=EmdUhqjuBaZoiK7nIBlB85Ojty7fJP5lc36LTjVWwVI=;
	h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
	b=INBvJ+bQUFTFz0lcSeGRgV6m1kaX6nAoKGYYByVdRDYxsSrpRe/+T3ysXO1Nlbb6T
	 rbeMcROex7Mj11pA5nqtpIg9c1rukcUr6poZRBB9q9E/hPGcPKsjNZGfl3+685NPeG
	 bUCkpzB0/gwFmxVIMZZSwh0n4EBrlgd/58JdC7O0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.170.46]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFsZ3-1oCKlN2yp5-00HPpY; Sat, 06
 Aug 2022 14:23:50 +0200
From: Helge Deller <deller@gmx.de>
To: linux-s390@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Josh Triplett <josh@joshtriplett.org>,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 1/3] proc: Add get_task_cmdline_kernel() function
Date: Sat,  6 Aug 2022 14:23:46 +0200
Message-Id: <20220806122348.82584-2-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220806122348.82584-1-deller@gmx.de>
References: <20220806122348.82584-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KkbEYe0kghWlFwQzjNuZb5/phQrAfDs2/UGiW7nK7hjXneYtmzA
 Tcmc4lEn26oFet83nGaNCsUOemp/lO74ocP4iy6dotsrngi6iHJIBhVQCe0Ex75F4MuvMIo
 6wQo7U57hTdwN+EY+AMxpSbEsO2XQI+9BGBdiWoby5I3yP7hu0hEybBTdkkJqLNQ/RUI5B/
 FAQ5+TXjSTjV/7By+RY8g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A1Vk0kCc0cY=:+dTXNsvd9tEMjddN63Paq8
 kZc0nP8/l/P2MLmTBttT3gWnrCc4De9JMhtbBwYN7VBeEmnv8hoEHUoQN/TWCSkS5TU7fk2Kz
 aHu0/S81PsGX5AyC9BWvJmYhXz2UJaAmFgPPSugoYYboVWW7miGgGplJq410bF6TSn+v6KzGV
 iW01uhX87nBhHCx//CCR+EU3txGfgJZOZZa7agZthJFG4TcWvG+ZiTxUENlVUlZl+HR94++3Z
 UYVhjtM62DgCGdt1Wms2X5GIFknj4YmQX/J5KzQUHPQgtOEdur2gV5W0mO+j6vGx+lruYYlLq
 V8qMYup0uvY7UKOzxCkpdnV3pjvrJi1BHV2APqkK78iDNr0khigfow8I8tN1G451CDRcZijBh
 u5IZNa/RbTLkVN0GsLDFz1uTj1ONSF43k+MkNLpl/W0u3o+0HLyylclHw0J0k/msGFaMFeYyN
 pl0expXDBROlSEF2dgSuNBoa//b0Ku/40EwHTj6kApJNRo40c82IgLtTuWU55aPBiEDvzA995
 K0g6Ax2RMMRilF9ZjNVGB7lac4q8Ufg2J5gB3eSZWl8jf0hErSz4cyp1aK9kcPf712449H2i1
 08BAdvNaVKW13YOkjLJLR8+tCR0ldhW50ad7phjqz02c0x99PegkmujpLpikHCBYwp4nroWdG
 RUiBUxCUucpu+WlQGdjv7mIo60AsTlQ48o/JeQ570COqJo/ZIWKyzqZvj/KVxDsg98G48ZUTn
 p7PnU2DYb8Ip0BWhrYHWDo3MFql7QcDMpz5GUZxHFR4ntg3Dy8Gk3UJHI2b8F2Jc42Rwi6oDA
 wbMzaErJ4Woxg3gjY8vr/rpIrYSQ2EHivHwzb8MNnsZc4EllFoKFDRY7J2+PmvgMqZ2Xt3yc8
 r+DxWi0l7z9Hd+ImerzAU8LXzzePgm43SjXtSgj5rw8oV7AoV98MkVcaKizuAgokxjcN71vPU
 Bc0TFKo2xRexX9Do6+TYJ/+K7p3wz+mmRXB339e4tXrutBXMKA+cmReDtzi0O/jp7g3BD4MUI
 PdTBUaqTg3K8IMksyns+zthtoFTb4gvQmwSg04+2o9zy7wBU22SuR+p0HExX1MA5YPduyKe2n
 fKVbf3/sf05CN2bOV5dRAIEtMvj/VG2AJVr6szTx+OGWGd9I5NpY9/RsA==
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

Add a new function get_task_cmdline_kernel() which reads the command
line of a process into a kernel buffer. This command line can then be
dumped by arch code to give additional debug info via the parameters
with which a faulting process was started.

The new function re-uses the existing code which provides the cmdline
for the procfs. For that the existing functions were modified so that
the buffer page is allocated outside of get_mm_proctitle() and
get_mm_cmdline() and instead provided as parameter.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 fs/proc/base.c          | 68 +++++++++++++++++++++++++++--------------
 include/linux/proc_fs.h |  5 +++
 2 files changed, 50 insertions(+), 23 deletions(-)

diff --git a/fs/proc/base.c b/fs/proc/base.c
index 8dfa36a99c74..4da9a8b3c7d1 100644
=2D-- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -217,20 +217,17 @@ static int proc_root_link(struct dentry *dentry, str=
uct path *path)
  */
 static ssize_t get_mm_proctitle(struct mm_struct *mm, char __user *buf,
 				size_t count, unsigned long pos,
-				unsigned long arg_start)
+				unsigned long arg_start, char *page)
 {
-	char *page;
 	int ret, got;
+	size_t size;

-	if (pos >=3D PAGE_SIZE)
+	size =3D min_t(size_t, PAGE_SIZE, count);
+	if (pos >=3D size)
 		return 0;

-	page =3D (char *)__get_free_page(GFP_KERNEL);
-	if (!page)
-		return -ENOMEM;
-
 	ret =3D 0;
-	got =3D access_remote_vm(mm, arg_start, page, PAGE_SIZE, FOLL_ANON);
+	got =3D access_remote_vm(mm, arg_start, page, size, FOLL_ANON);
 	if (got > 0) {
 		int len =3D strnlen(page, got);

@@ -238,7 +235,9 @@ static ssize_t get_mm_proctitle(struct mm_struct *mm, =
char __user *buf,
 		if (len < got)
 			len++;

-		if (len > pos) {
+		if (!buf)
+			ret =3D len;
+		else if (len > pos) {
 			len -=3D pos;
 			if (len > count)
 				len =3D count;
@@ -248,16 +247,15 @@ static ssize_t get_mm_proctitle(struct mm_struct *mm=
, char __user *buf,
 			ret =3D len;
 		}
 	}
-	free_page((unsigned long)page);
 	return ret;
 }

 static ssize_t get_mm_cmdline(struct mm_struct *mm, char __user *buf,
-			      size_t count, loff_t *ppos)
+			      size_t count, loff_t *ppos, char *page)
 {
 	unsigned long arg_start, arg_end, env_start, env_end;
 	unsigned long pos, len;
-	char *page, c;
+	char c;

 	/* Check if process spawned far enough to have cmdline. */
 	if (!mm->env_end)
@@ -283,7 +281,7 @@ static ssize_t get_mm_cmdline(struct mm_struct *mm, ch=
ar __user *buf,
 	len =3D env_end - arg_start;

 	/* We're not going to care if "*ppos" has high bits set */
-	pos =3D *ppos;
+	pos =3D ppos ? *ppos : 0;
 	if (pos >=3D len)
 		return 0;
 	if (count > len - pos)
@@ -299,7 +297,7 @@ static ssize_t get_mm_cmdline(struct mm_struct *mm, ch=
ar __user *buf,
 	 * pos is 0, and set a flag in the 'struct file'.
 	 */
 	if (access_remote_vm(mm, arg_end-1, &c, 1, FOLL_ANON) =3D=3D 1 && c)
-		return get_mm_proctitle(mm, buf, count, pos, arg_start);
+		return get_mm_proctitle(mm, buf, count, pos, arg_start, page);

 	/*
 	 * For the non-setproctitle() case we limit things strictly
@@ -311,10 +309,6 @@ static ssize_t get_mm_cmdline(struct mm_struct *mm, c=
har __user *buf,
 	if (count > arg_end - pos)
 		count =3D arg_end - pos;

-	page =3D (char *)__get_free_page(GFP_KERNEL);
-	if (!page)
-		return -ENOMEM;
-
 	len =3D 0;
 	while (count) {
 		int got;
@@ -323,7 +317,8 @@ static ssize_t get_mm_cmdline(struct mm_struct *mm, ch=
ar __user *buf,
 		got =3D access_remote_vm(mm, pos, page, size, FOLL_ANON);
 		if (got <=3D 0)
 			break;
-		got -=3D copy_to_user(buf, page, got);
+		if (buf)
+			got -=3D copy_to_user(buf, page, got);
 		if (unlikely(!got)) {
 			if (!len)
 				len =3D -EFAULT;
@@ -335,12 +330,11 @@ static ssize_t get_mm_cmdline(struct mm_struct *mm, =
char __user *buf,
 		count -=3D got;
 	}

-	free_page((unsigned long)page);
 	return len;
 }

 static ssize_t get_task_cmdline(struct task_struct *tsk, char __user *buf=
,
-				size_t count, loff_t *pos)
+				size_t count, loff_t *pos, char *page)
 {
 	struct mm_struct *mm;
 	ssize_t ret;
@@ -349,23 +343,51 @@ static ssize_t get_task_cmdline(struct task_struct *=
tsk, char __user *buf,
 	if (!mm)
 		return 0;

-	ret =3D get_mm_cmdline(mm, buf, count, pos);
+	ret =3D get_mm_cmdline(mm, buf, count, pos, page);
 	mmput(mm);
 	return ret;
 }

+/*
+ * Place up to maxcount chars of the command line of the process into the
+ * cmdline buffer.
+ */
+void get_task_cmdline_kernel(struct task_struct *tsk,
+			char *cmdline, size_t maxcount)
+{
+	int i;
+
+	memset(cmdline, 0, maxcount);
+	get_task_cmdline(tsk, NULL, maxcount - 1, NULL, cmdline);
+
+	/* remove NULs between parameters */
+	for (i =3D 0; i < maxcount - 2; i++) {
+		if (cmdline[i])
+			continue;
+		if (cmdline[i+1] =3D=3D 0)
+			break;
+		cmdline[i] =3D ' ';
+	}
+}
+
 static ssize_t proc_pid_cmdline_read(struct file *file, char __user *buf,
 				     size_t count, loff_t *pos)
 {
 	struct task_struct *tsk;
 	ssize_t ret;
+	char *page;

 	BUG_ON(*pos < 0);

 	tsk =3D get_proc_task(file_inode(file));
 	if (!tsk)
 		return -ESRCH;
-	ret =3D get_task_cmdline(tsk, buf, count, pos);
+	page =3D (char *)__get_free_page(GFP_KERNEL);
+	if (page) {
+		ret =3D get_task_cmdline(tsk, buf, count, pos, page);
+		free_page((unsigned long)page);
+	} else
+		ret =3D -ENOMEM;
 	put_task_struct(tsk);
 	if (ret > 0)
 		*pos +=3D ret;
diff --git a/include/linux/proc_fs.h b/include/linux/proc_fs.h
index 81d6e4ec2294..9a256e86205c 100644
=2D-- a/include/linux/proc_fs.h
+++ b/include/linux/proc_fs.h
@@ -158,6 +158,9 @@ int proc_pid_arch_status(struct seq_file *m, struct pi=
d_namespace *ns,
 			struct pid *pid, struct task_struct *task);
 #endif /* CONFIG_PROC_PID_ARCH_STATUS */

+void get_task_cmdline_kernel(struct task_struct *tsk,
+			char *cmdline, size_t maxcount);
+
 #else /* CONFIG_PROC_FS */

 static inline void proc_root_init(void)
@@ -216,6 +219,8 @@ static inline struct pid *tgid_pidfd_to_pid(const stru=
ct file *file)
 	return ERR_PTR(-EBADF);
 }

+static inline void get_task_cmdline_kernel(struct task_struct *, char *, =
size_t) { }
+
 #endif /* CONFIG_PROC_FS */

 struct net;
=2D-
2.37.1

