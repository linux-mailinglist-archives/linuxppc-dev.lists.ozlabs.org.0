Return-Path: <linuxppc-dev+bounces-14194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1CBC605AF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Nov 2025 14:22:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7vmQ3D08z2yv0;
	Sun, 16 Nov 2025 00:21:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763212902;
	cv=none; b=Ex2n6DnIB5yIFHZho1qe8OWKbXac2DTwNF2jvg1X3Kn51gmTbH2dODLw5vOXkKNhXC+1vNd0jgMRv9m0Y1C61M07RDfu28xHEwBL7j2RNU0RrYHs+uUNtCtobZpdv9Ih7+C2DuhW7Dl0Z4rApPTMpLCNDKMi/fMK/nT3NBN+9/psA7ulYxzLJKk9CN3heHJXfcZQOcbwcMDwNHFGpQdaWNkFeRJnWb17k3gzfBwpAQ5KE/GjEf3OKiyoyiZt5Wn1ZCqIacIVpVjXsgFxAb9IkU8imRHuGZFScoaQFC1/cJRoT8iiQncAzVW2Y5ccIbbVSQBWKfGk0xA/kKWa+mNFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763212902; c=relaxed/relaxed;
	bh=kjAcPjiET4P3fr/sVoUSbva9CVqQr8Uwew0Z2DECgqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBF2+oZwkiXWEGJwg//cp/fdjHrEFRJUg1lk3wx2jPZNIbCPt3ieWyV3SndxERZEJ4opj0MSkXcXgmXPT6m8spJboRDdiY2BEV2s4HSo1DjdwrG7wy2t+PJaq6T3JueVjmgpKBbAGG9TOiulWIBSsBzLIuaKg5WqT9CeJK32YOqyaD8YuiG2aDFnQb+gvMs9G5S5bxBcYZlj4M4qL7uB8nnsWK9xNzYQmotZ/2OW+2+m/3oh/BRvkwPNzywIntStqfUmHyCwh8D5yNwkRZOT8in6jlw0+XzH0FnvPORmnGHJJNnbmUPB1I23W84EGYbFuSMMIprRfQDm3QREIrRI5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=AuInizII; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=AuInizII;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7vmP1Bnzz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Nov 2025 00:21:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 771B760131;
	Sat, 15 Nov 2025 13:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C00C16AAE;
	Sat, 15 Nov 2025 13:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763212898;
	bh=Pl9jmC5EL7AGwr+SmsgthHF9drWTTfIqBaIssfzsdWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuInizIINMwBXTMJu1dR3seLB3VmALsUQ3+5Ndj4MXto6uH9ENTPXUU90Dt/8DjPq
	 gmWQkfEhamMufZT+G9MKX9xDtzSNmpoxmmi+AH6rv/rpdY47vOYkLaC2Ol/C4V7Kfc
	 vAlEaytoOD6Xr7/mBkMwSJH6iZ7zuxrbmPJUjTZw=
Date: Sat, 15 Nov 2025 08:21:34 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: bot+bpf-ci@kernel.org, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name,
	a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
	daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, ihor.solodrai@linux.dev,
	Chris Mason <clm@meta.com>
Subject: Re: [functionfs] mainline UAF (was Re: [PATCH v3 36/50] functionfs:
 switch to simple_remove_by_name())
Message-ID: <2025111555-spoon-backslid-8d1f@gregkh>
References: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
 <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
 <20251111092244.GS2441659@ZenIV>
 <e6b90909-fdd7-4c4d-b96e-df27ea9f39c4@meta.com>
 <20251113092636.GX2441659@ZenIV>
 <2025111316-cornfield-sphinx-ba89@gregkh>
 <20251114074614.GY2441659@ZenIV>
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
In-Reply-To: <20251114074614.GY2441659@ZenIV>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 14, 2025 at 07:46:14AM +0000, Al Viro wrote:
> On Thu, Nov 13, 2025 at 04:20:08PM -0500, Greg Kroah-Hartman wrote:
> 
> > Sorry for the delay.  Yes, we should be grabing the mutex in there, good
> > catch.  There's been more issues pointed out with the gadget code in the
> > past year or so as more people are starting to actually use it and
> > stress it more.  So if you have a patch for this, I'll gladly take it :)
> 
> How about the following?
> 
> commit 330837c8101578438f64cfaec3fb85521d668e56
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Fri Nov 14 02:18:22 2025 -0500
> 
>     functionfs: fix the open/removal races
>     
>     ffs_epfile_open() can race with removal, ending up with file->private_data
>     pointing to freed object.
>     
>     There is a total count of opened files on functionfs (both ep0 and
>     dynamic ones) and when it hits zero, dynamic files get removed.
>     Unfortunately, that removal can happen while another thread is
>     in ffs_epfile_open(), but has not incremented the count yet.
>     In that case open will succeed, leaving us with UAF on any subsequent
>     read() or write().
>     
>     The root cause is that ffs->opened is misused; atomic_dec_and_test() vs.
>     atomic_add_return() is not a good idea, when object remains visible all
>     along.
>     
>     To untangle that
>             * serialize openers on ffs->mutex (both for ep0 and for dynamic files)
>             * have dynamic ones use atomic_inc_not_zero() and fail if we had
>     zero ->opened; in that case the file we are opening is doomed.
>             * have the inodes of dynamic files marked on removal (from the
>     callback of simple_recursive_removal()) - clear ->i_private there.
>             * have open of dynamic ones verify they hadn't been already removed,
>     along with checking that state is FFS_ACTIVE.
>     
>     Fix another abuse of ->opened, while we are at it - it starts equal to 0,
>     is incremented on opens and decremented on ->release()... *and* decremented
>     (always from 0 to -1) in ->kill_sb().  Handling that case has no business
>     in ffs_data_closed() (or to ->opened); just have ffs_kill_sb() do what
>     ffs_data_closed() would in case of decrement to negative rather than
>     calling ffs_data_closed() there.
>     
>     And don't bother with bumping ffs->ref when opening a file - superblock
>     already holds the reference and it won't go away while there are any opened
>     files on the filesystem.
>     
>     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Ugh, messy.  But yes, this does look better, thanks for that.  Want me
to take it through the USB tree, or will you take it through one of
yours? (I don't remember what started this thread...)

thanks,

greg k-h

