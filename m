Return-Path: <linuxppc-dev+bounces-14176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B833C5BDBE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 08:59:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d78fd1DPYz3078;
	Fri, 14 Nov 2025 18:59:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763107145;
	cv=none; b=YwHKYhsrqv/vymsDp8u2PJROtNw2i8YDbc5pQysIasQ0xd0aUOCTsc/3FJsSowqYR87Oo4ZnkhoDazzxsyPkPlpmR7heLr9NSa3iCOOmRp8L8ZIkDzOQtd0Ia2CVlIJ9bXGUuNW4nJDZtZKsyD7AAnZxlgq5SOE27ISf+jDTdX+qgeIzW8+eB5vlR+/wbVAQiP/+aPui/lO8z1bvWO9nNOBFayWF3SObdG52Dwj0tOs9hH9Z1CB5T2Cxzt3EqT+Cf71xYYxz2fdu18eI1oZ4fG6oAJu5AHcvrMxFqcDvD7bGD9ooq3yNTRnouac2F9YlVx9d8XKPWJIjDztghEpRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763107145; c=relaxed/relaxed;
	bh=+BX9pgqKetmYXWegrY1jxWDAubueY2L9llfmksDJZ7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8DMWOPE8hgZZpzrdel1XaQUIPdIE+Exm9fW1PxpyXI+NvNhj7Nm4YfXG8rVNpH9v2g5HTCpYx4wF5tVy2CE5kdet6a3wmY+Wh+R1Ph4veYB14EGkGcoB9ZXtcp1OP9vUHGVVl0FhMG+wYb6Ocz78Mur9bkCT7Z5M0/YqaWffsUWsGG1Ht68jGVCRT0w5zth1Q0Eg8nyTGiDuGTrBN1r636MLyG7Z8dPixocXXEvXKwX+F9Mum3HRteLJEjjo66EB/BVt1dKncMBvoLmOXfDfV+QHNxeYCBE/S/tRGzTOaqEHJsWoGDqswUmfY/30rK7J2tskYi32itN3udHzirDqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=QNoFj+y5; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=QNoFj+y5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d78fc2fnsz306N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 18:59:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+BX9pgqKetmYXWegrY1jxWDAubueY2L9llfmksDJZ7o=; b=QNoFj+y5vkEvXZb61fdoJLx6e2
	Tc2JO92a+37E6aeKDBwJwdoYW8Dhep24cN+upN60xBcxtlg9v4K+oKBYswCsLpj+mzmQs+a30I8kL
	O9aCdsaJXsC0AhvA/uTMGAqQd6nHWcpFUDoKuVF4LQtUaU/qyHG5eNRvy86Eyy0PCuGnCZHaGszRl
	mW65m2RQX8KZ7O7g/GxFppVowqrruAkJ7W0Q5HI3ToyLPOYtngIf7chV5mMITZupTtlj5q156Q84B
	+O7EZ38GpdVxTMxzVjbchFWBMU2VFhoO4M9gkNYse+lZg1Z80PIoUePe1y5NUxAC56AoOgacVQ+yU
	yRE9z4tA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJohq-00000009fzo-2VEk;
	Fri, 14 Nov 2025 07:58:54 +0000
Date: Fri, 14 Nov 2025 07:58:54 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Chris Mason <clm@meta.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, bot+bpf-ci@kernel.org,
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org,
	linux-mm@kvack.org, linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org,
	linux-usb@vger.kernel.org, paul@paul-moore.com,
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org,
	john.johansen@canonical.com, selinux@vger.kernel.org,
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, ast@kernel.org,
	andrii@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org,
	eddyz87@gmail.com, yonghong.song@linux.dev, ihor.solodrai@linux.dev
Subject: Re: [functionfs] mainline UAF (was Re: [PATCH v3 36/50] functionfs:
 switch to simple_remove_by_name())
Message-ID: <20251114075854.GZ2441659@ZenIV>
References: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
 <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
 <20251111092244.GS2441659@ZenIV>
 <e6b90909-fdd7-4c4d-b96e-df27ea9f39c4@meta.com>
 <20251113092636.GX2441659@ZenIV>
 <2025111316-cornfield-sphinx-ba89@gregkh>
 <3984c9bd-2ac8-424e-9390-7170fdab3c03@meta.com>
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
In-Reply-To: <3984c9bd-2ac8-424e-9390-7170fdab3c03@meta.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 13, 2025 at 09:16:52PM -0500, Chris Mason wrote:

> ================================================================================
> BUG #2: Race condition in ffs_data_closed()
> ================================================================================
> 
> In ffs_data_closed(), there's an unsynchronized state modification:
> 
> static void ffs_data_closed(struct ffs_data *ffs)
> {
>         ...
>         if (atomic_dec_and_test(&ffs->opened)) {
>                 if (ffs->no_disconnect) {
>                         ffs->state = FFS_DEACTIVATED;
>                         ...
>                 } else {
>                         ffs->state = FFS_CLOSING;
>                         ffs_data_reset(ffs);
>                 }
>         }
>         if (atomic_read(&ffs->opened) < 0) {
>                 ffs->state = FFS_CLOSING;
>                 ffs_data_reset(ffs);
>         }
>         ...
> }
> 
> Can this race with concurrent state changes? The atomic_read() check is not
> synchronized with the subsequent state assignment. Between the read and the
> assignment, another thread could modify the state, potentially causing state
> machine corruption or double cleanup via ffs_data_reset().

The atomic_read() check is utter bollocks.  ->opened starts with 0, is bumped
on opens on that fs and decremented when files are closed.  How could it end
up negative?  Well might you ask - there's a call of ffs_data_closed() in
ffs_kill_sb().  _There_ we are guaranteed that there's no opened files (we'd
better, or there would be much worse problems), so ffs->opened is known to
be 0 and ffs_data_closed() decrements it to -1.

In other words, that couple of lines is executed on call from ffs_kill_sb()
and only on that call.  Which is to say, that thing is just an obfuscated
	if (s->s_fs_info) {
		struct ffs_data *ffs = s->s_fs_info;
		ffs->state = FFS_CLOSING;
		ffs_data_reset(ffs);
		ffs_data_put(ffs);
	}

Not a race, just a highly unidiomatic code.  While we are at it, after taking
that mess out of ffs_data_closed() we no longer need to bump/drop ffs->ref
in ffs_data_opened()/ffs_data_closed() - superblock owns a reference all along
and it's *not* going away under an opened file.

