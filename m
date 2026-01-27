Return-Path: <linuxppc-dev+bounces-16296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHtLOWAdeGkKoQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 03:05:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7065A8ED9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 03:05:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0TJB3W9tz2xjP;
	Tue, 27 Jan 2026 13:05:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::629" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769475421;
	cv=pass; b=OqGp/xAAFerTyk+wiPIfBMQdiicoLH0j6QjBT8SXQvPcSfDLxBfo68Or2QLHwU3ghs7CjZ6hblKg+fiotWmOOYo+DwPqTVLmElHtadn2LOBqONRfC0H1BpZj7lw2uRed6Wy0VzZhbavZC30mn0vBYvVWt1Kk4voxBOpB/W1K6OP/3hh6hB3vBncm0ocK0jsie+UQ+QzBBZhXSvIw5Tk0TH/PXYFkvzitgZdZ0xkkF+lKh6GxA+KiwPVNhK49jsITU0H02zPb+nJBz00ynwBMr26TOUx1I5QYD3M4w5+RvoUxrjQfXMHv3ZzCKuAKVJLNKDcre+YR9/8BrSrAy1dOfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769475421; c=relaxed/relaxed;
	bh=3zLfNFu5Ej89ae2FOVFTz6sNNJ0wH6QKfxg5HAX5ASo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAWxDS9VD9fvRnxkPJCuL3NFS1VVz8pYAFYiEWMqhnRr5ym6Ql52HO+vsQuOzpibrDmcpEWGXTTSfqs7Ut5e3ts9ag4TDyU2tOGmlFJuG4EpzDOvBTveR7ctMCtrMnJa9aWHvGvsfhQl3gLDayYdoOJTIjD0NZIjB+1AKPPe4Opsar3Ta8JXjoBhQnv48d/LUwIdlZVxV5f9vH09bytHbPvfyE/sT+H06Psp3uwhbQjRbwsXwNv9RhYc9BeYTqnDq4kXVwYp5AxFWEBEEux4zKbZGyo9lrXe4bsdzMs/UG2xXuQDeSersVwj3oZ2OZvD+9MNm6zNLiMB8HPHrsTXHw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VwENLZu1; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VwENLZu1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0RnR2v9wz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 11:56:58 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b884cb1e717so718014966b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jan 2026 16:56:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769475414; cv=none;
        d=google.com; s=arc-20240605;
        b=bVRJvDIbadO6EsWbzAVmt8+/Ot0yj+9EDhMFpEer6OBrVNRaQ0XY8xyiSl0I2nEPpw
         IZMf+GoodC3fcF4i9xhrzq0OoqVgcwRb8baAdy8q+MT950qx9rJU/fRU8xVvtKYvksn9
         ehjW3QnjdexKgtQGnUJ0f/gxwUasmeg1U2k1S4JCGHXKlSuIRvlPQxMhNlXsbmfHKq3Q
         cufotQYdD2bBK3d6IfZlXvhOzwDkdrCXXe8g/N+k4vWfAHcZxmGBlBGYo1pK0A5IQBHA
         bUflULoIPhP6EPrhPA9TFlgYwFhsJloWdRcjrsR9eyzKPNRFmm2QghwLPraiqK/Qblcc
         FGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3zLfNFu5Ej89ae2FOVFTz6sNNJ0wH6QKfxg5HAX5ASo=;
        fh=nnTBalLKp+Bdk1AhnZiI/lGzZrYTI7VB/FOdw2fheFI=;
        b=Paz38mDs1Bu67B2MTwlMNbOH7fSXfTXBcC2L/U6qjegd9hDBgHFWDveQYhzk8YaSbY
         bryq8FzsMnLSygOBslCrtxHzRYbQq0GEnBR7tPpUxqYoYH5UdPuSt0ZAbCIQ4VAdsGrd
         8nz4kdKAZMiIC8q2Ol57Wb3nrd8x0bv9qCb5WXGI8Z7fZy4YVi7fT2UABp0N7F/am6/I
         0LVllNTEuOUaNomKwOBt/l5LPdN6AQXj5oAmuGMhsXfCQZDdD1e4Qpzr3oo0WKaPKh2x
         bmILVMXr/E2FC9vSMyEy+hjmFAn2TRrtVYCRmGsV056Gjy6THFAmyjLTdE/l5y1ia0RC
         6Ckg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769475414; x=1770080214; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zLfNFu5Ej89ae2FOVFTz6sNNJ0wH6QKfxg5HAX5ASo=;
        b=VwENLZu1fJv5LZZk+loAaliVLDqN3kpNgmVJqNNpwQYkZ+rwBKIrPaVS9neVxGfzMp
         NdwNKMQTLkdIm+J1HmRMqkZoq1WhMKe82BgzcjsgiWbilSWHGqVC92d9/NWWgsOC0gta
         a4IfPFhO2fXXpKpYV+3lDfSIY9qdOw+Ui/6nPaBw+b4Zxrlpv53r+1cwNeyGd4bZ/VaR
         N+TeJ25oCJtiGcuqZfGNO8g3ZVU5jJ+aFh0NhtI0k25WHhfhi56NYL8tIe/t52XYuoKf
         jB6U4dquwiO5OL4FWPKL8qfE42dP8+zHqAVte3zfB9x3GMU7F1dkoOKAfKc6ECPbEAt/
         Jezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769475414; x=1770080214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3zLfNFu5Ej89ae2FOVFTz6sNNJ0wH6QKfxg5HAX5ASo=;
        b=SEUhVFLiIYQWEtMikaIe9Z7AGonpnKaZY6k0PPdIz4IqUeCt+Yp1Vrk521XUyPDj3D
         5tSxeYdsz0fJOPJeI3+5D9YHCTZjP6YMh3pGdhFM3PWoIxaJ/fsfacyhXe6R8jWyrBHL
         FRQykf7xhUBzBqNRMxLH5aD/kJbNLZFs4dh1c35g+wgd7+KwQZfSuSBYWVkrnSylKgee
         XuzyoEydwKNLIOpL3riEWLLzlMZE6EzFJ03CvuH0ZhRuu3U1SDr6CGtFcSkY4Idh8A1l
         cKQTa1RmS6Seq2zbybwjAOI1xH3cnFBJ18EMYk7shcPUaYYATvhzfId9nlqN3fveJ2q7
         Fobw==
X-Forwarded-Encrypted: i=1; AJvYcCUSCNqeEADEbi0YK5hWDIFIuGZZz9F/ftXWyWSWJvS1xB1yr0og5Dc0vU9oYO2zSJJ/5ibjGpra6Ud0a5I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyN1P4hJf9VrkjT8FNQLeUB0tZvdhNm2s1ePBi3KqG9CH7+/R9e
	WyTDOzPELsUi0mHlq9pOnjOf6qg9vNi/Z0aTQh1263i9QMPlOBeVDVhnstAiMw7B3s04HoIg+tI
	Vqb049k7f/i7cHqTc3ieT/ZILfE+rS8cEmpWFrOEG
X-Gm-Gg: AZuq6aJqat7edlyUNu3UoccTFteJV1Bg5a63IDcmo3wNv/RGRmwtgHL5i+88bU5j3rU
	T4bZ9oIwXZBMUrqKBxwmGwSzfN45tIYbOyURMt0PQnL5jZUQqRp9UY2H5PchtvgGOOsnLuxZF4o
	zgNa0MD0ZRz7yA1X7mcN93KwMGsBR8RxKV+ZiAGsvHH18fIToI83Bal6gdsRWFQz1HsDIw+hM4L
	3zB6xvOkKYGZRxDgTKHo4+KjKP3i2mpcHye9Q9P+C6tJEvqjmMK98W18iYZIaU9ZiUJB3EBOxuE
	TwS6t7FMyB4OhQvh/t0cbPerPRAlrQ==
X-Received: by 2002:a17:907:3e1f:b0:b70:4f7d:24f8 with SMTP id
 a640c23a62f3a-b8ceef90390mr472102366b.22.1769475414121; Mon, 26 Jan 2026
 16:56:54 -0800 (PST)
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
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
In-Reply-To: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 26 Jan 2026 16:56:42 -0800
X-Gm-Features: AZwV_QiBMrJYd91OXm8P7lUFLNbyvK6EaRwh_3htJKxjg87yoCQ5TeewXmGGNPs
Message-ID: <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com, 
	android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:torvalds@linux-foundation.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wusamuel@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-16296-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wusamuel@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 7065A8ED9B
X-Rspamd-Action: no action

On Mon, Nov 17, 2025 at 9:15=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> Some filesystems use a kinda-sorta controlled dentry refcount leak to pin
> dentries of created objects in dcache (and undo it when removing those).
> Reference is grabbed and not released, but it's not actually _stored_
> anywhere.  That works, but it's hard to follow and verify; among other
> things, we have no way to tell _which_ of the increments is intended
> to be an unpaired one.  Worse, on removal we need to decide whether
> the reference had already been dropped, which can be non-trivial if
> that removal is on umount and we need to figure out if this dentry is
> pinned due to e.g. unlink() not done.  Usually that is handled by using
> kill_litter_super() as ->kill_sb(), but there are open-coded special
> cases of the same (consider e.g. /proc/self).
>
> Things get simpler if we introduce a new dentry flag (DCACHE_PERSISTENT)
> marking those "leaked" dentries.  Having it set claims responsibility
> for +1 in refcount.
>
> The end result this series is aiming for:
>
> * get these unbalanced dget() and dput() replaced with new primitives tha=
t
>   would, in addition to adjusting refcount, set and clear persistency fla=
g.
> * instead of having kill_litter_super() mess with removing the remaining
>   "leaked" references (e.g. for all tmpfs files that hadn't been removed
>   prior to umount), have the regular shrink_dcache_for_umount() strip
>   DCACHE_PERSISTENT of all dentries, dropping the corresponding
>   reference if it had been set.  After that kill_litter_super() becomes
>   an equivalent of kill_anon_super().
>
> Doing that in a single step is not feasible - it would affect too many pl=
aces
> in too many filesystems.  It has to be split into a series.
>
> This work has really started early in 2024; quite a few preliminary piece=
s
> have already gone into mainline.  This chunk is finally getting to the
> meat of that stuff - infrastructure and most of the conversions to it.
>
> Some pieces are still sitting in the local branches, but the bulk of
> that stuff is here.
>
> Compared to v3:
>         * fixed a functionfs braino around ffs_epfiles_destroy() (in #40/=
54,
> used to be #36/50).
>         * added fixes for a couple of UAF in functionfs (##36--39); that
> does *NOT* include any fixes for dmabuf bugs Chris posted last week, thou=
gh.
>
> The branch is -rc5-based; it lives in
> git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git #work.persiste=
ncy
> individual patches in followups.
>
> Please, help with review and testing.  If nobody objects, in a few days i=
t
> goes into #for-next.
>
> Shortlog:
>       fuse_ctl_add_conn(): fix nlink breakage in case of early failure
>       tracefs: fix a leak in eventfs_create_events_dir()
>       new helper: simple_remove_by_name()
>       new helper: simple_done_creating()
>       introduce a flag for explicitly marking persistently pinned dentrie=
s
>       primitives for maintaining persisitency
>       convert simple_{link,unlink,rmdir,rename,fill_super}() to new primi=
tives
>       convert ramfs and tmpfs
>       procfs: make /self and /thread_self dentries persistent
>       configfs, securityfs: kill_litter_super() not needed
>       convert xenfs
>       convert smackfs
>       convert hugetlbfs
>       convert mqueue
>       convert bpf
>       convert dlmfs
>       convert fuse_ctl
>       convert pstore
>       convert tracefs
>       convert debugfs
>       debugfs: remove duplicate checks in callers of start_creating()
>       convert efivarfs
>       convert spufs
>       convert ibmasmfs
>       ibmasmfs: get rid of ibmasmfs_dir_ops
>       convert devpts
>       binderfs: use simple_start_creating()
>       binderfs_binder_ctl_create(): kill a bogus check
>       convert binderfs
>       autofs_{rmdir,unlink}: dentry->d_fsdata->dentry =3D=3D dentry there
>       convert autofs
>       convert binfmt_misc
>       selinuxfs: don't stash the dentry of /policy_capabilities
>       selinuxfs: new helper for attaching files to tree
>       convert selinuxfs
>       functionfs: don't abuse ffs_data_closed() on fs shutdown
>       functionfs: don't bother with ffs->ref in ffs_data_{opened,closed}(=
)
>       functionfs: need to cancel ->reset_work in ->kill_sb()
>       functionfs: fix the open/removal races
>       functionfs: switch to simple_remove_by_name()
>       convert functionfs
>       gadgetfs: switch to simple_remove_by_name()
>       convert gadgetfs
>       hypfs: don't pin dentries twice
>       hypfs: switch hypfs_create_str() to returning int
>       hypfs: swich hypfs_create_u64() to returning int
>       convert hypfs
>       convert rpc_pipefs
>       convert nfsctl
>       convert rust_binderfs
>       get rid of kill_litter_super()
>       convert securityfs
>       kill securityfs_recursive_remove()
>       d_make_discardable(): warn if given a non-persistent dentry
>
> Diffstat:
>  Documentation/filesystems/porting.rst     |   7 ++
>  arch/powerpc/platforms/cell/spufs/inode.c |  17 ++-
>  arch/s390/hypfs/hypfs.h                   |   6 +-
>  arch/s390/hypfs/hypfs_diag_fs.c           |  60 ++++------
>  arch/s390/hypfs/hypfs_vm_fs.c             |  21 ++--
>  arch/s390/hypfs/inode.c                   |  82 +++++--------
>  drivers/android/binder/rust_binderfs.c    | 121 ++++++-------------
>  drivers/android/binderfs.c                |  82 +++----------
>  drivers/base/devtmpfs.c                   |   2 +-
>  drivers/misc/ibmasm/ibmasmfs.c            |  24 ++--
>  drivers/usb/gadget/function/f_fs.c        | 144 +++++++++++++----------
>  drivers/usb/gadget/legacy/inode.c         |  49 ++++----
>  drivers/xen/xenfs/super.c                 |   2 +-
>  fs/autofs/inode.c                         |   2 +-
>  fs/autofs/root.c                          |  11 +-
>  fs/binfmt_misc.c                          |  69 ++++++-----
>  fs/configfs/dir.c                         |  10 +-
>  fs/configfs/inode.c                       |   3 +-
>  fs/configfs/mount.c                       |   2 +-
>  fs/dcache.c                               | 111 +++++++++++-------
>  fs/debugfs/inode.c                        |  32 ++----
>  fs/devpts/inode.c                         |  57 ++++-----
>  fs/efivarfs/inode.c                       |   7 +-
>  fs/efivarfs/super.c                       |   5 +-
>  fs/fuse/control.c                         |  38 +++---
>  fs/hugetlbfs/inode.c                      |  12 +-
>  fs/internal.h                             |   1 -
>  fs/libfs.c                                |  52 +++++++--
>  fs/nfsd/nfsctl.c                          |  18 +--
>  fs/ocfs2/dlmfs/dlmfs.c                    |   8 +-
>  fs/proc/base.c                            |   6 +-
>  fs/proc/internal.h                        |   1 +
>  fs/proc/root.c                            |  14 +--
>  fs/proc/self.c                            |  10 +-
>  fs/proc/thread_self.c                     |  11 +-
>  fs/pstore/inode.c                         |   7 +-
>  fs/ramfs/inode.c                          |   8 +-
>  fs/super.c                                |   8 --
>  fs/tracefs/event_inode.c                  |   7 +-
>  fs/tracefs/inode.c                        |  13 +--
>  include/linux/dcache.h                    |   4 +-
>  include/linux/fs.h                        |   6 +-
>  include/linux/proc_fs.h                   |   2 -
>  include/linux/security.h                  |   2 -
>  init/do_mounts.c                          |   2 +-
>  ipc/mqueue.c                              |  12 +-
>  kernel/bpf/inode.c                        |  15 +--
>  mm/shmem.c                                |  38 ++----
>  net/sunrpc/rpc_pipe.c                     |  27 ++---
>  security/apparmor/apparmorfs.c            |  13 ++-
>  security/inode.c                          |  35 +++---
>  security/selinux/selinuxfs.c              | 185 +++++++++++++-----------=
------
>  security/smack/smackfs.c                  |   2 +-
>  53 files changed, 649 insertions(+), 834 deletions(-)
>
>         Overview:
>
> First two commits are bugfixes (fusectl and tracefs resp.)
>
> [1/54] fuse_ctl_add_conn(): fix nlink breakage in case of early failure
> [2/54] tracefs: fix a leak in eventfs_create_events_dir()
>
> Next, two commits adding a couple of useful helpers, the next three addin=
g
> the infrastructure and the rest consists of per-filesystem conversions.
>
> [3/54] new helper: simple_remove_by_name()
> [4/54] new helper: simple_done_creating()
>         end_creating_path() analogue for internal object creation; unlike
> end_creating_path() no mount is passed to it (or guaranteed to exist, for
> that matter - it might be used during the filesystem setup, before the
> superblock gets attached to any mounts).
>
> Infrastructure:
> [5/54] introduce a flag for explicitly marking persistently pinned dentri=
es
>         * introduce the new flag
>         * teach shrink_dcache_for_umount() to handle it (i.e. remove
> and drop refcount on anything that survives to umount with that flag
> still set)
>         * teach kill_litter_super() that anything with that flag does
> *not* need to be unpinned.
> [6/54] primitives for maintaining persisitency
>         * d_make_persistent(dentry, inode) - bump refcount, mark persiste=
nt
> and make hashed positive.  Return value is a borrowed reference to dentry=
;
> it can be used until something removes persistency (at the very least,
> until the parent gets unlocked, but some filesystems may have stronger
> exclusion).
>         * d_make_discardable() - remove persistency mark and drop referen=
ce.
>
> NOTE: at that stage d_make_discardable() does not reject dentries not
> marked persistent - it acts as if the mark been set.
>
> Rationale: less noise in series splitup that way.  We want (and on the
> next commit will get) simple_unlink() to do the right thing - remove
> persistency, if it's there.  However, it's used by many filesystems.
> We would have either to convert them all at once or split simple_unlink()
> into "want persistent" and "don't want persistent" versions, the latter
> being the old one.  In the course of the series almost all callers
> would migrate to the replacement, leaving only two pathological cases
> with the old one.  The same goes for simple_rmdir() (two callers left in
> the end), simple_recursive_removal() (all callers gone in the end), etc.
> That's a lot of noise and it's easier to start with d_make_discardable()
> quietly accepting non-persistent dentries, then, in the end, add private
> copies of simple_unlink() and simple_rmdir() for two weird users (configf=
s
> and apparmorfs) and have those use dput() instead of d_make_discardable()=
.
> At that point we'd be left with all callers of d_make_discardable()
> always passing persistent dentries, allowing to add a warning in it.
>
> [7/54] convert simple_{link,unlink,rmdir,rename,fill_super}() to new prim=
itives
>         See above re quietly accepting non-peristent dentries in
> simple_unlink(), simple_rmdir(), etc.
>
>         Converting filesystems:
> [8/54] convert ramfs and tmpfs
> [9/54] procfs: make /self and /thread_self dentries persistent
> [10/54] configfs, securityfs: kill_litter_super() not needed
> [11/54] convert xenfs
> [12/54] convert smackfs
> [13/54] convert hugetlbfs
> [14/54] convert mqueue
> [15/54] convert bpf
> [16/54] convert dlmfs
> [17/54] convert fuse_ctl
> [18/54] convert pstore
> [19/54] convert tracefs
> [20/54] convert debugfs
> [21/54] debugfs: remove duplicate checks in callers of start_creating()
> [22/54] convert efivarfs
> [23/54] convert spufs
> [24/54] convert ibmasmfs
> [25/54] ibmasmfs: get rid of ibmasmfs_dir_ops
> [26/54] convert devpts
> [27/54] binderfs: use simple_start_creating()
> [28/54] binderfs_binder_ctl_create(): kill a bogus check
> [29/54] convert binderfs
> [30/54] autofs_{rmdir,unlink}: dentry->d_fsdata->dentry =3D=3D dentry the=
re
> [31/54] convert autofs
> [32/54] convert binfmt_misc
> [33/54] selinuxfs: don't stash the dentry of /policy_capabilities
> [34/54] selinuxfs: new helper for attaching files to tree
> [35/54] convert selinuxfs
>
>         Several functionfs fixes, before converting it, to make life
> simpler for backporting:
> [36/54] functionfs: don't abuse ffs_data_closed() on fs shutdown
> [37/54] functionfs: don't bother with ffs->ref in ffs_data_{opened,closed=
}()
> [38/54] functionfs: need to cancel ->reset_work in ->kill_sb()
> [39/54] functionfs: fix the open/removal races
>
>         ... and back to filesystems conversions:
>
> [40/54] functionfs: switch to simple_remove_by_name()
> [41/54] convert functionfs
> [42/54] gadgetfs: switch to simple_remove_by_name()
> [43/54] convert gadgetfs
> [44/54] hypfs: don't pin dentries twice
> [45/54] hypfs: switch hypfs_create_str() to returning int
> [46/54] hypfs: swich hypfs_create_u64() to returning int
> [47/54] convert hypfs
> [48/54] convert rpc_pipefs
> [49/54] convert nfsctl
> [50/54] convert rust_binderfs
>
>         ... and no kill_litter_super() callers remain, so we
> can take it out:
> [51/54] get rid of kill_litter_super()
>
>         Followups:
> [52/54] convert securityfs
>         That was the last remaining user of simple_recursive_removal()
> that did *not* mark things persistent.  Now the only places where
> d_make_discardable() is still called for dentries that are not marked
> persistent are the calls of simple_{unlink,rmdir}() in configfs and
> apparmorfs.
>
> [53/54] kill securityfs_recursive_remove()
>         Unused macro...
>
> [54/54] d_make_discardable(): warn if given a non-persistent dentry
>
> At this point there are very few call chains that might lead to
> d_make_discardable() on a dentry that hadn't been made persistent:
> calls of simple_unlink() and simple_rmdir() in configfs and
> apparmorfs.
>
> Both filesystems do pin (part of) their contents in dcache, but
> they are currently playing very unusual games with that.  Converting
> them to more usual patterns might be possible, but it's definitely
> going to be a long series of changes in both cases.
>
> For now the easiest solution is to have both stop using simple_unlink()
> and simple_rmdir() - that allows to make d_make_discardable() warn
> when given a non-persistent dentry.
>
> Rather than giving them full-blown private copies (with calls of
> d_make_discardable() replaced with dput()), let's pull the parts of
> simple_unlink() and simple_rmdir() that deal with timestamps and link
> counts into separate helpers (__simple_unlink() and __simple_rmdir()
> resp.) and have those used by configfs and apparmorfs.
>

Hi Al, when I apply this patchset my Pixel 6 no longer enumerates on
lsusb or ADB. It was quite hard to bisect to this point, as this is
non-deterministic and seems to be setup specific. Note, I am using
android-mainline, but my understanding is that this build does not
have any out-of-tree USB patches, and that there are no vendor hooks
in the build.

My apologies as I can't offer any other clues; there are no obviously
bad dmesg logs and I'm still working on narrowing down the exact
commit(s) that started this, but just wanted to send a FYI in case
something stands out as obvious.

Thanks!
Sam

