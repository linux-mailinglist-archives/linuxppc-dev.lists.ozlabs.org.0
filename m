Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A68467E1538
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Nov 2023 17:43:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VEeP7W11;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDQs/MFv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SNgKZ45Csz3vqS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 03:43:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VEeP7W11;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDQs/MFv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SNg4s282dz3cVr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 03:32:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699201962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDV7FR51iWOMltM/VmsXZPQKZgkpdKCmFVnuH3pv968=;
	b=VEeP7W11EFSpPh9ygf2OgDhm5Oh1MeqGtA0L7sCwXQaDq77V+SHWu71fyDn3GHBX2/HYMe
	pF7tjDux4ZmvaXJupQPmngfJdeVyvf3HAD6M/V/IdYm0XSaznnJyjvoENHdcpN9Vlc7Zh2
	CX2IOOHRRebyTaVscnVX0jBe+oAziOg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699201963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDV7FR51iWOMltM/VmsXZPQKZgkpdKCmFVnuH3pv968=;
	b=EDQs/MFvqAiGzQjzrmB6dnM78XGb7Zzoe/nDmv6sIQ3lFRhnVAkm8Qd0GAkXZW2g4wRqou
	KgHHc/sGRVZpCyeB3A7SoMtRznoL9fEm5fCJ8JB5L2BZFEp5uvhPnQayrBDdRDR0VKkA6Z
	wax2Lw95QnWL9/Q7PXpp+HvayA09Z08=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-219-nShYWNVxMUWCchNAK9cRGw-1; Sun,
 05 Nov 2023 11:32:39 -0500
X-MC-Unique: nShYWNVxMUWCchNAK9cRGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5163538117F2;
	Sun,  5 Nov 2023 16:32:37 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88C082166B26;
	Sun,  5 Nov 2023 16:32:30 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 14/34] fs: Rename anon_inode_getfile_secure() and anon_inode_getfd_secure()
Date: Sun,  5 Nov 2023 17:30:17 +0100
Message-ID: <20231105163040.14904-15-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-1-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, Vlastimil Babka <vbabka@suse.cz>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve 
 <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The call to the inode_init_security_anon() LSM hook is not the sole
reason to use anon_inode_getfile_secure() or anon_inode_getfd_secure().
For example, the functions also allow one to create a file with non-zero
size, without needing a full-blown filesystem.  In this case, you don't
need a "secure" version, just unique inodes; the current name of the
functions is confusing and does not explain well the difference with
the more "standard" anon_inode_getfile() and anon_inode_getfd().

Of course, there is another side of the coin; neither io_uring nor
userfaultfd strictly speaking need distinct inodes, and it is not
that clear anymore that anon_inode_create_get{file,fd}() allow the LSM
to intercept and block the inode's creation.  If one was so inclined,
anon_inode_getfile_secure() and anon_inode_getfd_secure() could be kept,
using the shared inode or a new one depending on CONFIG_SECURITY.
However, this is probably overkill, and potentially a cause of bugs in
different configurations.  Therefore, just add a comment to io_uring
and userfaultfd explaining the choice of the function.

While at it, remove the export for what is now anon_inode_create_getfd().
There is no in-tree module that uses it, and the old name is gone anyway.
If anybody actually needs the symbol, they can ask or they can just use
anon_inode_create_getfile(), which will be exported very soon for use
in KVM.

Suggested-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 fs/anon_inodes.c            | 46 +++++++++++++++++++++++--------------
 fs/userfaultfd.c            |  5 ++--
 include/linux/anon_inodes.h |  4 ++--
 io_uring/io_uring.c         |  3 ++-
 4 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
index 24192a7667ed..3d4a27f8b4fe 100644
--- a/fs/anon_inodes.c
+++ b/fs/anon_inodes.c
@@ -79,7 +79,7 @@ static struct file *__anon_inode_getfile(const char *name,
 					 const struct file_operations *fops,
 					 void *priv, int flags,
 					 const struct inode *context_inode,
-					 bool secure)
+					 bool make_inode)
 {
 	struct inode *inode;
 	struct file *file;
@@ -87,7 +87,7 @@ static struct file *__anon_inode_getfile(const char *name,
 	if (fops->owner && !try_module_get(fops->owner))
 		return ERR_PTR(-ENOENT);
 
-	if (secure) {
+	if (make_inode) {
 		inode =	anon_inode_make_secure_inode(name, context_inode);
 		if (IS_ERR(inode)) {
 			file = ERR_CAST(inode);
@@ -149,13 +149,10 @@ struct file *anon_inode_getfile(const char *name,
 EXPORT_SYMBOL_GPL(anon_inode_getfile);
 
 /**
- * anon_inode_getfile_secure - Like anon_inode_getfile(), but creates a new
+ * anon_inode_create_getfile - Like anon_inode_getfile(), but creates a new
  *                             !S_PRIVATE anon inode rather than reuse the
  *                             singleton anon inode and calls the
- *                             inode_init_security_anon() LSM hook.  This
- *                             allows for both the inode to have its own
- *                             security context and for the LSM to enforce
- *                             policy on the inode's creation.
+ *                             inode_init_security_anon() LSM hook.
  *
  * @name:    [in]    name of the "class" of the new file
  * @fops:    [in]    file operations for the new file
@@ -164,11 +161,19 @@ EXPORT_SYMBOL_GPL(anon_inode_getfile);
  * @context_inode:
  *           [in]    the logical relationship with the new inode (optional)
  *
+ * Create a new anonymous inode and file pair.  This can be done for two
+ * reasons:
+ * - for the inode to have its own security context, so that LSMs can enforce
+ *   policy on the inode's creation;
+ * - if the caller needs a unique inode, for example in order to customize
+ *   the size returned by fstat()
+ *
  * The LSM may use @context_inode in inode_init_security_anon(), but a
- * reference to it is not held.  Returns the newly created file* or an error
- * pointer.  See the anon_inode_getfile() documentation for more information.
+ * reference to it is not held.
+ *
+ * Returns the newly created file* or an error pointer.
  */
-struct file *anon_inode_getfile_secure(const char *name,
+struct file *anon_inode_create_getfile(const char *name,
 				       const struct file_operations *fops,
 				       void *priv, int flags,
 				       const struct inode *context_inode)
@@ -181,7 +186,7 @@ static int __anon_inode_getfd(const char *name,
 			      const struct file_operations *fops,
 			      void *priv, int flags,
 			      const struct inode *context_inode,
-			      bool secure)
+			      bool make_inode)
 {
 	int error, fd;
 	struct file *file;
@@ -192,7 +197,7 @@ static int __anon_inode_getfd(const char *name,
 	fd = error;
 
 	file = __anon_inode_getfile(name, fops, priv, flags, context_inode,
-				    secure);
+				    make_inode);
 	if (IS_ERR(file)) {
 		error = PTR_ERR(file);
 		goto err_put_unused_fd;
@@ -231,10 +236,9 @@ int anon_inode_getfd(const char *name, const struct file_operations *fops,
 EXPORT_SYMBOL_GPL(anon_inode_getfd);
 
 /**
- * anon_inode_getfd_secure - Like anon_inode_getfd(), but creates a new
+ * anon_inode_create_getfd - Like anon_inode_getfd(), but creates a new
  * !S_PRIVATE anon inode rather than reuse the singleton anon inode, and calls
- * the inode_init_security_anon() LSM hook. This allows the inode to have its
- * own security context and for a LSM to reject creation of the inode.
+ * the inode_init_security_anon() LSM hook.
  *
  * @name:    [in]    name of the "class" of the new file
  * @fops:    [in]    file operations for the new file
@@ -243,16 +247,24 @@ EXPORT_SYMBOL_GPL(anon_inode_getfd);
  * @context_inode:
  *           [in]    the logical relationship with the new inode (optional)
  *
+ * Create a new anonymous inode and file pair.  This can be done for two
+ * reasons:
+ * - for the inode to have its own security context, so that LSMs can enforce
+ *   policy on the inode's creation;
+ * - if the caller needs a unique inode, for example in order to customize
+ *   the size returned by fstat()
+ *
  * The LSM may use @context_inode in inode_init_security_anon(), but a
  * reference to it is not held.
+ *
+ * Returns a newly created file descriptor or an error code.
  */
-int anon_inode_getfd_secure(const char *name, const struct file_operations *fops,
+int anon_inode_create_getfd(const char *name, const struct file_operations *fops,
 			    void *priv, int flags,
 			    const struct inode *context_inode)
 {
 	return __anon_inode_getfd(name, fops, priv, flags, context_inode, true);
 }
-EXPORT_SYMBOL_GPL(anon_inode_getfd_secure);
 
 static int __init anon_inode_init(void)
 {
diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 56eaae9dac1a..7a1cf8bab5eb 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -1033,7 +1033,7 @@ static int resolve_userfault_fork(struct userfaultfd_ctx *new,
 {
 	int fd;
 
-	fd = anon_inode_getfd_secure("[userfaultfd]", &userfaultfd_fops, new,
+	fd = anon_inode_create_getfd("[userfaultfd]", &userfaultfd_fops, new,
 			O_RDONLY | (new->flags & UFFD_SHARED_FCNTL_FLAGS), inode);
 	if (fd < 0)
 		return fd;
@@ -2205,7 +2205,8 @@ static int new_userfaultfd(int flags)
 	/* prevent the mm struct to be freed */
 	mmgrab(ctx->mm);
 
-	fd = anon_inode_getfd_secure("[userfaultfd]", &userfaultfd_fops, ctx,
+	/* Create a new inode so that the LSM can block the creation.  */
+	fd = anon_inode_create_getfd("[userfaultfd]", &userfaultfd_fops, ctx,
 			O_RDONLY | (flags & UFFD_SHARED_FCNTL_FLAGS), NULL);
 	if (fd < 0) {
 		mmdrop(ctx->mm);
diff --git a/include/linux/anon_inodes.h b/include/linux/anon_inodes.h
index 5deaddbd7927..93a5f16d03f3 100644
--- a/include/linux/anon_inodes.h
+++ b/include/linux/anon_inodes.h
@@ -15,13 +15,13 @@ struct inode;
 struct file *anon_inode_getfile(const char *name,
 				const struct file_operations *fops,
 				void *priv, int flags);
-struct file *anon_inode_getfile_secure(const char *name,
+struct file *anon_inode_create_getfile(const char *name,
 				       const struct file_operations *fops,
 				       void *priv, int flags,
 				       const struct inode *context_inode);
 int anon_inode_getfd(const char *name, const struct file_operations *fops,
 		     void *priv, int flags);
-int anon_inode_getfd_secure(const char *name,
+int anon_inode_create_getfd(const char *name,
 			    const struct file_operations *fops,
 			    void *priv, int flags,
 			    const struct inode *context_inode);
diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
index 8d1bc6cdfe71..22b98f47bb28 100644
--- a/io_uring/io_uring.c
+++ b/io_uring/io_uring.c
@@ -3835,7 +3835,8 @@ static struct file *io_uring_get_file(struct io_ring_ctx *ctx)
 		return ERR_PTR(ret);
 #endif
 
-	file = anon_inode_getfile_secure("[io_uring]", &io_uring_fops, ctx,
+	/* Create a new inode so that the LSM can block the creation.  */
+	file = anon_inode_create_getfile("[io_uring]", &io_uring_fops, ctx,
 					 O_RDWR | O_CLOEXEC, NULL);
 #if defined(CONFIG_UNIX)
 	if (IS_ERR(file)) {
-- 
2.39.1


