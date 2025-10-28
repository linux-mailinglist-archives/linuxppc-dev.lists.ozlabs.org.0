Return-Path: <linuxppc-dev+bounces-13465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EEBC16DE6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 22:08:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx2zB3Lmbz2yG3;
	Wed, 29 Oct 2025 08:08:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761685702;
	cv=none; b=icwU8kSOS2W440YK4oO2HtiaE69sJBeget27b4PKHjcGa/kFw80NX1yNEpCIvHUhi1HnIvz1K6WheuwoRsHhBoWfT8846KRX2YNPgj3CMl2LfohVQ4ONGbx+/uiuVMmok6mZfMJGwetWLcrd7rOwV7wI7DXMPvNBMHOTJugy15IC6BVz3fZpDjnnojxqHSotqQQ3LTfQWwRuDvxNhDlAdFndtgG8yI9pfg7jAsx5J5Z7bjHBna58k+BAGtj0ucW5nFPIQG5y0ggffmb3+ZBUAey7Z34HQ8c0zLqafsS2ClCq5qyey5JHck3/l6GjJbqySTmq8utgoT/pQ9aC44gCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761685702; c=relaxed/relaxed;
	bh=KlTwB+1F+PugnwlBKmbzqaDoi+J+L/6Td5vFafDz7aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEXYFb+LblU+4+4uOx16NPEa3f/9LOPyJdLdfOSTEqBYk9CQUWPzIYvNYnwfE8yGASlVK2kFiMRtHJ7xzIJjvvx7J6ZNB8Wf+vnKAaGOGSXE4cQz65QoHMBVS4kDkre0YpKz4uPkaTlw7qpxEPlPQdzYM7g06iLHTEFA1tp5sae1iX2yqUiBw0i/z0Xrw49+EkNgD5DyB//XeotXFhcv+IWTLrjkDEObWqkaFtYkh6y9rhG7XtrGbSnYTZ+wEr3BeVLCt2LpcIuvhPl25BzeP6DFHvqZE0GKwfo6+/GZF7kWCRocrAZ/AxPuUz0nvAqarfbu9B+OEo3Hl0LmqOZH/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Ksb5g8Zr; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Ksb5g8Zr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cx2z85tRsz2yFV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 08:08:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KlTwB+1F+PugnwlBKmbzqaDoi+J+L/6Td5vFafDz7aQ=; b=Ksb5g8ZrVafnbFuTRxbUrPhDBj
	VSOMEinbRhfNMqbf8zNwa4y+4w91yeN1ZkolOTq7QHfZv9jbf9wzwIgjoyGXNTLzmtCmiuSlsuFQY
	I2duEP0tPN70bNXR+5LqqotswpJ2viRu62H7osNC8PUSJSrQulUJeNM/ANyqo1gLANZ82mjExXHlj
	1F+kesXVgTzno6Sx7Se5kMbenDUUhlD1xSwZGEI1aNvuxQWH0jGuFuiDJKw286315kfeqCsz/8rE+
	ioRQsGUqL6ZTFGl0vQ2Ve+T2xs0+XXea6lOfg9yJCHsRQXsmQJWUMV9NmpQEVchINZrcmNhueZ2ko
	8V7lMBVw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDqvF-0000000FqQ8-4BSQ;
	Tue, 28 Oct 2025 21:08:06 +0000
Date: Tue, 28 Oct 2025 21:08:05 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org,
	linux-mm@kvack.org, linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org
Subject: Re: [PATCH v2 22/50] convert efivarfs
Message-ID: <20251028210805.GP2441659@ZenIV>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-23-viro@zeniv.linux.org.uk>
 <66300d81c5e127e3bca8c6c4d997da386b142004.camel@HansenPartnership.com>
 <20251028174540.GN2441659@ZenIV>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028174540.GN2441659@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 05:45:40PM +0000, Al Viro wrote:

> FWIW, having a special path for "we are in foofs_fill_super(), fuck
> the locking - nobody's going to access it anyway" is not a great
> idea, simply because the helpers tend to get reused on codepaths
> where we can't cut corners that way.

	BTW, looking through efivarfs codebase now... *both* callers
of efivarfs_create_dentry() end up doing dcache lookups, with variously
convoluted call chains.  Look: efivarfs_check_missing() has an explicit
try_lookup_noperm() before the call of efivarfs_create_dentry().
efivarfs_callback() doesn't, but it's called via
	efivar_init(efivarfs_callback, sb, true)
and with the last argument being true efivar_init() will precede the call
of the callback with efivarfs_variable_is_present().  Guess what does that
thing (never used anywhere else) do?  Right, the call of try_lookup_noperm().

Why do we bother with that?  What's wrong with having efivarfs_create_dentry()
returning -EEXIST in case of dentry already being there and turning the
chunk in efivar_init() into
			err = func(variable_name, vendor_guid,
				   variable_name_size, data);
			if (err == -EEXIST) {
				if (duplicate_check)
					dup_variable_bug(variable_name,
							 &vendor_guid,
							 variable_name_size);
				else
					err = 0;
			}
			if (err)
				status = EFI_NOT_FOUND;
Note that both possible callbacks become almost identical and I wouldn't
be surprised if that "almost" is actually "completely"...  <checks> yep.

So I'm not sure we want that callback to be an argument, but that's
a separate followup.  For now, do you see any problems with the following
patch?  [Completely untested, on top of the posted series]

diff --git a/fs/efivarfs/internal.h b/fs/efivarfs/internal.h
index f913b6824289..045d53fd0f3c 100644
--- a/fs/efivarfs/internal.h
+++ b/fs/efivarfs/internal.h
@@ -55,8 +55,6 @@ bool efivar_validate(efi_guid_t vendor, efi_char16_t *var_name, u8 *data,
 bool efivar_variable_is_removable(efi_guid_t vendor, const char *name,
 				  size_t len);
 char *efivar_get_utf8name(const efi_char16_t *name16, efi_guid_t *vendor);
-bool efivarfs_variable_is_present(efi_char16_t *variable_name,
-				  efi_guid_t *vendor, void *data);
 
 extern const struct file_operations efivarfs_file_operations;
 extern const struct inode_operations efivarfs_dir_inode_operations;
diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
index 298ab3c929eb..80ed81bbd4a5 100644
--- a/fs/efivarfs/super.c
+++ b/fs/efivarfs/super.c
@@ -189,52 +189,6 @@ static const struct dentry_operations efivarfs_d_ops = {
 	.d_hash = efivarfs_d_hash,
 };
 
-static struct dentry *efivarfs_alloc_dentry(struct dentry *parent, char *name)
-{
-	struct dentry *d;
-	struct qstr q;
-	int err;
-
-	q.name = name;
-	q.len = strlen(name);
-
-	err = efivarfs_d_hash(parent, &q);
-	if (err)
-		return ERR_PTR(err);
-
-	d = d_alloc(parent, &q);
-	if (d)
-		return d;
-
-	return ERR_PTR(-ENOMEM);
-}
-
-bool efivarfs_variable_is_present(efi_char16_t *variable_name,
-				  efi_guid_t *vendor, void *data)
-{
-	char *name = efivar_get_utf8name(variable_name, vendor);
-	struct super_block *sb = data;
-	struct dentry *dentry;
-
-	if (!name)
-		/*
-		 * If the allocation failed there'll already be an
-		 * error in the log (and likely a huge and growing
-		 * number of them since they system will be under
-		 * extreme memory pressure), so simply assume
-		 * collision for safety but don't add to the log
-		 * flood.
-		 */
-		return true;
-
-	dentry = try_lookup_noperm(&QSTR(name), sb->s_root);
-	kfree(name);
-	if (!IS_ERR_OR_NULL(dentry))
-		dput(dentry);
-
-	return dentry != NULL;
-}
-
 static int efivarfs_create_dentry(struct super_block *sb, efi_char16_t *name16,
 				  unsigned long name_size, efi_guid_t vendor,
 				  char *name)
@@ -244,7 +198,7 @@ static int efivarfs_create_dentry(struct super_block *sb, efi_char16_t *name16,
 	struct dentry *dentry, *root = sb->s_root;
 	unsigned long size = 0;
 	int len;
-	int err = -ENOMEM;
+	int err = 0;
 	bool is_removable = false;
 
 	/* length of the variable name itself: remove GUID and separator */
@@ -253,41 +207,36 @@ static int efivarfs_create_dentry(struct super_block *sb, efi_char16_t *name16,
 	if (efivar_variable_is_removable(vendor, name, len))
 		is_removable = true;
 
+	dentry = simple_start_creating(root, name);
+	if (IS_ERR(dentry)) {
+		err = PTR_ERR(dentry);
+		goto out_name;
+	}
+
 	inode = efivarfs_get_inode(sb, d_inode(root), S_IFREG | 0644, 0,
 				   is_removable);
-	if (!inode)
-		goto fail_name;
+	if (unlikely(!inode)) {
+		err = -ENOMEM;
+		goto out_dentry;
+	}
 
 	entry = efivar_entry(inode);
 
 	memcpy(entry->var.VariableName, name16, name_size);
 	memcpy(&(entry->var.VendorGuid), &vendor, sizeof(efi_guid_t));
 
-	dentry = efivarfs_alloc_dentry(root, name);
-	if (IS_ERR(dentry)) {
-		err = PTR_ERR(dentry);
-		goto fail_inode;
-	}
-
 	__efivar_entry_get(entry, NULL, &size, NULL);
 
-	/* copied by the above to local storage in the dentry. */
-	kfree(name);
-
 	inode_lock(inode);
 	inode->i_private = entry;
 	i_size_write(inode, size + sizeof(__u32)); /* attributes + data */
 	inode_unlock(inode);
 	d_make_persistent(dentry, inode);
-	dput(dentry);
-
-	return 0;
 
-fail_inode:
-	iput(inode);
-fail_name:
+out_dentry:
+	simple_done_creating(dentry);
+out_name:
 	kfree(name);
-
 	return err;
 }
 
@@ -407,42 +356,6 @@ static const struct fs_context_operations efivarfs_context_ops = {
 	.free		= efivarfs_free,
 };
 
-static int efivarfs_check_missing(efi_char16_t *name16, efi_guid_t vendor,
-				  unsigned long name_size, void *data)
-{
-	char *name;
-	struct super_block *sb = data;
-	struct dentry *dentry;
-	int err;
-
-	if (guid_equal(&vendor, &LINUX_EFI_RANDOM_SEED_TABLE_GUID))
-		return 0;
-
-	name = efivar_get_utf8name(name16, &vendor);
-	if (!name)
-		return -ENOMEM;
-
-	dentry = try_lookup_noperm(&QSTR(name), sb->s_root);
-	if (IS_ERR(dentry)) {
-		err = PTR_ERR(dentry);
-		goto out;
-	}
-
-	if (!dentry) {
-		/* found missing entry */
-		pr_info("efivarfs: creating variable %s\n", name);
-		return efivarfs_create_dentry(sb, name16, name_size, vendor, name);
-	}
-
-	dput(dentry);
-	err = 0;
-
- out:
-	kfree(name);
-
-	return err;
-}
-
 static struct file_system_type efivarfs_type;
 
 static int efivarfs_freeze_fs(struct super_block *sb)
@@ -493,7 +406,7 @@ static int efivarfs_unfreeze_fs(struct super_block *sb)
 		}
 	}
 
-	efivar_init(efivarfs_check_missing, sb, false);
+	efivar_init(efivarfs_callback, sb, false);
 	pr_info("efivarfs: finished resyncing variable state\n");
 	return 0;
 }
diff --git a/fs/efivarfs/vars.c b/fs/efivarfs/vars.c
index 6edc10958ecf..d893e928891a 100644
--- a/fs/efivarfs/vars.c
+++ b/fs/efivarfs/vars.c
@@ -407,6 +407,8 @@ int efivar_init(int (*func)(efi_char16_t *, efi_guid_t, unsigned long, void *),
 		case EFI_SUCCESS:
 			variable_name_size = var_name_strnsize(variable_name,
 							       variable_name_size);
+			err = func(variable_name, vendor_guid,
+				   variable_name_size, data);
 
 			/*
 			 * Some firmware implementations return the
@@ -416,18 +418,16 @@ int efivar_init(int (*func)(efi_char16_t *, efi_guid_t, unsigned long, void *),
 			 * we'll ever see a different variable name,
 			 * and may end up looping here forever.
 			 */
-			if (duplicate_check &&
-			    efivarfs_variable_is_present(variable_name,
-							 &vendor_guid, data)) {
-				dup_variable_bug(variable_name, &vendor_guid,
-						 variable_name_size);
-				status = EFI_NOT_FOUND;
-			} else {
-				err = func(variable_name, vendor_guid,
-					   variable_name_size, data);
-				if (err)
-					status = EFI_NOT_FOUND;
+			if (err == -EEXIST) {
+				if (duplicate_check)
+					dup_variable_bug(variable_name,
+							 &vendor_guid,
+							 variable_name_size);
+				else
+					err = 0;
 			}
+			if (err)
+				status = EFI_NOT_FOUND;
 			break;
 		case EFI_UNSUPPORTED:
 			err = -EOPNOTSUPP;

