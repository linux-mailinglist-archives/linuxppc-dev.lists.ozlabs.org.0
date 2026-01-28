Return-Path: <linuxppc-dev+bounces-16340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCntGeuTeWmOxgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 05:43:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F30939D0C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 05:43:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f18m71FjBz2xjK;
	Wed, 28 Jan 2026 15:43:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::62c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769565765;
	cv=pass; b=UqfW9pKZq+5t/Ep1QrgZ4c05CBc1saoarbP6yAB6I6Db5QWpSLRGag6ad9EjBbNEZZ+IL/HlRel1+9KGrit1+yEV2JpUaype1X0fxEI5anUtIcQFJXVPJIqI3r+KF/NOdyeDo53ojV/7chcuNvc3CeNjb3NOMdJDsBiIT2QM0Fl86zRZXOHSlZpmIWv9FJwMviKuztZuylIwVBFGxYOM5H04otJmiVVOsPf7xkXIQ25vEF7D90jOb01fKIyCnLWV+iOIYhsy/F2sWMRIEG+6k7QbakarQYVb1WaJifD4A9pNXyx/PpPkMuwCBOdCp11dBFqpYmdRsPrVXGBDnM/Rdw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769565765; c=relaxed/relaxed;
	bh=Xjs7REJ/WW1grWbDrI+yGSmGQ7BvuQU3ORny1k3JZHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EH6vyD4r9FEFN5ITxUGeY9ImuiGX2EsGoRog4lfbpanSB2sNEAWnVGmdmZ8JjeQcA5SZMmRMnUtNX5M0nBJeGnVZYL8yUyr387j+jScuS/N/cIQFDdwkPYVzmcmxbe3GKOwGUtVabPvZSdkKCn27+tP4pUjJKAUePb/ul5Cipo0fYsDgDiex7tQIKUuhDQQeT9QD1FfO3jgwRyEvbgLiAa/dBi/JE+elrca/NnlA+XgoEP3y4oeN3cbRpoM6AEIuyk0dwjXWhjvRrTs4IrsZh/jei5Lynvu3ZddkISJH1ALFaX+fj/WVKbGBpG7pXKRfblAajaxKO29jjaCu1lJhwg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cY2SbmyJ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cY2SbmyJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=wusamuel@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f15Bp5nQ1z2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 13:02:42 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b8845cb5862so985262966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 18:02:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769565757; cv=none;
        d=google.com; s=arc-20240605;
        b=ZDERjzPLkaKQST8k2PgyICXgqB4ie/zy5ncpenI7YiL7FhSZg2uYDZdRP7VJwA29jY
         Yq/11hEQffA+4vR6xUxCeXqJoXp18kIEqZcpti3LW3P2MwbF7D/GvpIMC89G1VP9+Qh9
         Aryz4oGZqsBw7uQebqc13umAnJOTsqU3xUfiCqg11TQF6Azuw/12oxIYbV4wHPpt5UDA
         s9YUZ1/d1VY9rtJkleQxUcOU1tT8ft1rLJA+NEX97N4jT0U68N28MzWJPhok2iXd2oFj
         MSSQasl0zWQbLDMcgDoIdpmisoesLy/th0MhPoSJ88fnoYwIP61ZFYyyX4sMeXCuXcjH
         merA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xjs7REJ/WW1grWbDrI+yGSmGQ7BvuQU3ORny1k3JZHE=;
        fh=n39rZlvbIJyeSE1/S8S/HExDq9FUrswz9kTP3wUVfLk=;
        b=DZgzTR+bPDPl/8WdTcmO8SkVla59jOX6EjdF06LkxPiZ8OHsh6l7myIwTVUybF78tW
         yUK+JbjGbyBD2qZl6YaunQnBwmuEfs1PTT5I2tEijy6+AiZkeY3KVnt2ucXcm2Kfy5sJ
         Y0TWvrWaV4k8ixeowpBp1J3Yu3GLCmL60mIQRnSSmjr9i5eV/mEX17NRYS4XicDraplM
         sDxWvdM1yIVXaRacnaRZG8hYuUQ5BVnn9FyCtvtqv6sN0oebpExzZ/vcU+JJOL0ktCrR
         TpZcBbwLkPcwKPoMgkkMFc+2pq+L2wBQ+/rliO7vSss9R+r+fuDpAPhJGQs39+bCwTUj
         5NYg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769565757; x=1770170557; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xjs7REJ/WW1grWbDrI+yGSmGQ7BvuQU3ORny1k3JZHE=;
        b=cY2SbmyJYn3t6Gz4H/FgXGtMYyxtk0zeRJ0I2U8Cq7C/iHVJNq19t8zh7BQIQWCilo
         aKUXXLPgLlr137RLSzXxnbRkPpg6NIG/u0rKZOVxd6Kkfj8SwSEyf20vZNWqRsfzrj5d
         vzBjinPJ76KYaXw/2xAf315d4bE8HyVRcUan/il6LkEzBDSlbEiWsu/Z+onl6MpIsAOq
         jSktL2b3TcEulqxFkg531O12OpEOh9FDNhA7cO7kLqDxuVQPEmgtclhm/7X5uHZLAgZt
         u124r5d+MZkpNWTR12mmt8pR98M1imdrwb19q59xpNenj5WE61KnPv2gJIA5DtPEtdIu
         E+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769565757; x=1770170557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xjs7REJ/WW1grWbDrI+yGSmGQ7BvuQU3ORny1k3JZHE=;
        b=o+X2XSiGn5atCsA+YCm/hlx/1qOOXqYpn2NeycxetktvegOgXMVXV3HUc+iBfrK7XL
         eQMCePxZBI6S3zrPLK1Dqo63XsG2hSww5afgg1OV123nk/HDKaqWBN0Xb8CuEJ1kZn2b
         xvUWnyhc53VfIercfU+H3qsHxaeqJHimDdNylKFWij4ZjYrtgbHnJRIV6ddJLCShfRky
         4P+zGre1FFDkDa3OiDvKFwPmCwCMyLMw2e7FblhG/Y+cbDDEG6aE/XEpk9B2dHJK9XtF
         XOevbDp40P8v5/VCLFQNrSAVsHwitCJi6Hl2cxHlr2RdscjN3h2WtA/z7NSnBQr4idhV
         15rg==
X-Forwarded-Encrypted: i=1; AJvYcCV7ks9tSa0I6ggTmNW/u5HgvGO4Vf5c2XbhsWgKcHVDabP+hMAF1w9s3zGripXO76X/yMeVWN5ZI7j5OfU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxiIkAEGwVrn42S5PwKMLff0Gc2KEQOXoUXySWNBDVd2p4d5Gfb
	vEDC/5fAFjf4tIrrsXoLtPyFbgB1H7sWdnoLUkJIP6XP92DcZqZy7/WVUQL4vbrQfd2vzMrSIIt
	GWakITTI1SQxtFw57PNNPUWy4CnnAyfZrT4nisd/E
X-Gm-Gg: AZuq6aJhIMZH5fOhBeD+NsMLM4BbFJTL+ZXm560ca5d4C8UWbvmbBAkf9f7tMhzz6at
	eu9BjsI8lKlsPo3O68XjMJf7cgqFoVRpAsTX0D/7btyDyWmqDNfWQRdyjQcMGN1pCO2rdYcKMH6
	OcEk+hYB7Pkwm8NAs8sjy3DlwdyE9TC90VEHrQgu+uEYl2MUFkhkt3/M+G2COGmxRcMXVAM0zMk
	/Gw0LHmQ0Umnw+WRoIdBuEV/xn0ntpSJXv9RhJD/GVCcYRww+gPXMWAI8jJX4GZtptZboDxHvW1
	ybh6JodL83CHB6jYNRRlEUeAmQ==
X-Received: by 2002:a17:907:1c95:b0:b87:7419:d3a8 with SMTP id
 a640c23a62f3a-b8dab330fc4mr281957066b.34.1769565756791; Tue, 27 Jan 2026
 18:02:36 -0800 (PST)
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
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com> <2026012715-mantra-pope-9431@gregkh>
In-Reply-To: <2026012715-mantra-pope-9431@gregkh>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Jan 2026 18:02:25 -0800
X-Gm-Features: AZwV_QjNxLKzH4SWKEB4t-7rNY8Sc7_QUT5_wgx9ZFwlSN8bjQfsTOxnH38Kjmw
Message-ID: <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, 
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org, 
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
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wusamuel@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:torvalds@linux-foundation.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16340-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.org.uk:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: F30939D0C3
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 11:42=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Mon, Jan 26, 2026 at 04:56:42PM -0800, Samuel Wu wrote:
> > On Mon, Nov 17, 2025 at 9:15=E2=80=AFPM Al Viro <viro@zeniv.linux.org.u=
k> wrote:
> > >
> > > Some filesystems use a kinda-sorta controlled dentry refcount leak to=
 pin
> > > dentries of created objects in dcache (and undo it when removing thos=
e).
> > > Reference is grabbed and not released, but it's not actually _stored_
> > > anywhere.  That works, but it's hard to follow and verify; among othe=
r
> > > things, we have no way to tell _which_ of the increments is intended
> > > to be an unpaired one.  Worse, on removal we need to decide whether
> > > the reference had already been dropped, which can be non-trivial if
> > > that removal is on umount and we need to figure out if this dentry is
> > > pinned due to e.g. unlink() not done.  Usually that is handled by usi=
ng
> > > kill_litter_super() as ->kill_sb(), but there are open-coded special
> > > cases of the same (consider e.g. /proc/self).
> > >
> > > Things get simpler if we introduce a new dentry flag (DCACHE_PERSISTE=
NT)
> > > marking those "leaked" dentries.  Having it set claims responsibility
> > > for +1 in refcount.
> > >
> > > The end result this series is aiming for:
> > >
> > > * get these unbalanced dget() and dput() replaced with new primitives=
 that
> > >   would, in addition to adjusting refcount, set and clear persistency=
 flag.
> > > * instead of having kill_litter_super() mess with removing the remain=
ing
> > >   "leaked" references (e.g. for all tmpfs files that hadn't been remo=
ved
> > >   prior to umount), have the regular shrink_dcache_for_umount() strip
> > >   DCACHE_PERSISTENT of all dentries, dropping the corresponding
> > >   reference if it had been set.  After that kill_litter_super() becom=
es
> > >   an equivalent of kill_anon_super().
> > >
> > > Doing that in a single step is not feasible - it would affect too man=
y places
> > > in too many filesystems.  It has to be split into a series.
> > >
> > > This work has really started early in 2024; quite a few preliminary p=
ieces
> > > have already gone into mainline.  This chunk is finally getting to th=
e
> > > meat of that stuff - infrastructure and most of the conversions to it=
.
> > >
> > > Some pieces are still sitting in the local branches, but the bulk of
> > > that stuff is here.
> > >
> > > Compared to v3:
> > >         * fixed a functionfs braino around ffs_epfiles_destroy() (in =
#40/54,
> > > used to be #36/50).
> > >         * added fixes for a couple of UAF in functionfs (##36--39); t=
hat
> > > does *NOT* include any fixes for dmabuf bugs Chris posted last week, =
though.
> > >
> > > The branch is -rc5-based; it lives in
> > > git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git #work.pers=
istency
> > > individual patches in followups.
> > >
> > > Please, help with review and testing.  If nobody objects, in a few da=
ys it
> > > goes into #for-next.
> > >
> > > Shortlog:
> > >       fuse_ctl_add_conn(): fix nlink breakage in case of early failur=
e
> > >       tracefs: fix a leak in eventfs_create_events_dir()
> > >       new helper: simple_remove_by_name()
> > >       new helper: simple_done_creating()
> > >       introduce a flag for explicitly marking persistently pinned den=
tries
> > >       primitives for maintaining persisitency
> > >       convert simple_{link,unlink,rmdir,rename,fill_super}() to new p=
rimitives
> > >       convert ramfs and tmpfs
> > >       procfs: make /self and /thread_self dentries persistent
> > >       configfs, securityfs: kill_litter_super() not needed
> > >       convert xenfs
> > >       convert smackfs
> > >       convert hugetlbfs
> > >       convert mqueue
> > >       convert bpf
> > >       convert dlmfs
> > >       convert fuse_ctl
> > >       convert pstore
> > >       convert tracefs
> > >       convert debugfs
> > >       debugfs: remove duplicate checks in callers of start_creating()
> > >       convert efivarfs
> > >       convert spufs
> > >       convert ibmasmfs
> > >       ibmasmfs: get rid of ibmasmfs_dir_ops
> > >       convert devpts
> > >       binderfs: use simple_start_creating()
> > >       binderfs_binder_ctl_create(): kill a bogus check
> > >       convert binderfs
> > >       autofs_{rmdir,unlink}: dentry->d_fsdata->dentry =3D=3D dentry t=
here
> > >       convert autofs
> > >       convert binfmt_misc
> > >       selinuxfs: don't stash the dentry of /policy_capabilities
> > >       selinuxfs: new helper for attaching files to tree
> > >       convert selinuxfs
> > >       functionfs: don't abuse ffs_data_closed() on fs shutdown
> > >       functionfs: don't bother with ffs->ref in ffs_data_{opened,clos=
ed}()
> > >       functionfs: need to cancel ->reset_work in ->kill_sb()
> > >       functionfs: fix the open/removal races
> > >       functionfs: switch to simple_remove_by_name()
> > >       convert functionfs
> > >       gadgetfs: switch to simple_remove_by_name()
> > >       convert gadgetfs
> > >       hypfs: don't pin dentries twice
> > >       hypfs: switch hypfs_create_str() to returning int
> > >       hypfs: swich hypfs_create_u64() to returning int
> > >       convert hypfs
> > >       convert rpc_pipefs
> > >       convert nfsctl
> > >       convert rust_binderfs
> > >       get rid of kill_litter_super()
> > >       convert securityfs
> > >       kill securityfs_recursive_remove()
> > >       d_make_discardable(): warn if given a non-persistent dentry
> > >
> > > Diffstat:
> > >  Documentation/filesystems/porting.rst     |   7 ++
> > >  arch/powerpc/platforms/cell/spufs/inode.c |  17 ++-
> > >  arch/s390/hypfs/hypfs.h                   |   6 +-
> > >  arch/s390/hypfs/hypfs_diag_fs.c           |  60 ++++------
> > >  arch/s390/hypfs/hypfs_vm_fs.c             |  21 ++--
> > >  arch/s390/hypfs/inode.c                   |  82 +++++--------
> > >  drivers/android/binder/rust_binderfs.c    | 121 ++++++-------------
> > >  drivers/android/binderfs.c                |  82 +++----------
> > >  drivers/base/devtmpfs.c                   |   2 +-
> > >  drivers/misc/ibmasm/ibmasmfs.c            |  24 ++--
> > >  drivers/usb/gadget/function/f_fs.c        | 144 +++++++++++++-------=
---
> > >  drivers/usb/gadget/legacy/inode.c         |  49 ++++----
> > >  drivers/xen/xenfs/super.c                 |   2 +-
> > >  fs/autofs/inode.c                         |   2 +-
> > >  fs/autofs/root.c                          |  11 +-
> > >  fs/binfmt_misc.c                          |  69 ++++++-----
> > >  fs/configfs/dir.c                         |  10 +-
> > >  fs/configfs/inode.c                       |   3 +-
> > >  fs/configfs/mount.c                       |   2 +-
> > >  fs/dcache.c                               | 111 +++++++++++-------
> > >  fs/debugfs/inode.c                        |  32 ++----
> > >  fs/devpts/inode.c                         |  57 ++++-----
> > >  fs/efivarfs/inode.c                       |   7 +-
> > >  fs/efivarfs/super.c                       |   5 +-
> > >  fs/fuse/control.c                         |  38 +++---
> > >  fs/hugetlbfs/inode.c                      |  12 +-
> > >  fs/internal.h                             |   1 -
> > >  fs/libfs.c                                |  52 +++++++--
> > >  fs/nfsd/nfsctl.c                          |  18 +--
> > >  fs/ocfs2/dlmfs/dlmfs.c                    |   8 +-
> > >  fs/proc/base.c                            |   6 +-
> > >  fs/proc/internal.h                        |   1 +
> > >  fs/proc/root.c                            |  14 +--
> > >  fs/proc/self.c                            |  10 +-
> > >  fs/proc/thread_self.c                     |  11 +-
> > >  fs/pstore/inode.c                         |   7 +-
> > >  fs/ramfs/inode.c                          |   8 +-
> > >  fs/super.c                                |   8 --
> > >  fs/tracefs/event_inode.c                  |   7 +-
> > >  fs/tracefs/inode.c                        |  13 +--
> > >  include/linux/dcache.h                    |   4 +-
> > >  include/linux/fs.h                        |   6 +-
> > >  include/linux/proc_fs.h                   |   2 -
> > >  include/linux/security.h                  |   2 -
> > >  init/do_mounts.c                          |   2 +-
> > >  ipc/mqueue.c                              |  12 +-
> > >  kernel/bpf/inode.c                        |  15 +--
> > >  mm/shmem.c                                |  38 ++----
> > >  net/sunrpc/rpc_pipe.c                     |  27 ++---
> > >  security/apparmor/apparmorfs.c            |  13 ++-
> > >  security/inode.c                          |  35 +++---
> > >  security/selinux/selinuxfs.c              | 185 +++++++++++++-------=
----------
> > >  security/smack/smackfs.c                  |   2 +-
> > >  53 files changed, 649 insertions(+), 834 deletions(-)
> > >
> > >         Overview:
> > >
> > > First two commits are bugfixes (fusectl and tracefs resp.)
> > >
> > > [1/54] fuse_ctl_add_conn(): fix nlink breakage in case of early failu=
re
> > > [2/54] tracefs: fix a leak in eventfs_create_events_dir()
> > >
> > > Next, two commits adding a couple of useful helpers, the next three a=
dding
> > > the infrastructure and the rest consists of per-filesystem conversion=
s.
> > >
> > > [3/54] new helper: simple_remove_by_name()
> > > [4/54] new helper: simple_done_creating()
> > >         end_creating_path() analogue for internal object creation; un=
like
> > > end_creating_path() no mount is passed to it (or guaranteed to exist,=
 for
> > > that matter - it might be used during the filesystem setup, before th=
e
> > > superblock gets attached to any mounts).
> > >
> > > Infrastructure:
> > > [5/54] introduce a flag for explicitly marking persistently pinned de=
ntries
> > >         * introduce the new flag
> > >         * teach shrink_dcache_for_umount() to handle it (i.e. remove
> > > and drop refcount on anything that survives to umount with that flag
> > > still set)
> > >         * teach kill_litter_super() that anything with that flag does
> > > *not* need to be unpinned.
> > > [6/54] primitives for maintaining persisitency
> > >         * d_make_persistent(dentry, inode) - bump refcount, mark pers=
istent
> > > and make hashed positive.  Return value is a borrowed reference to de=
ntry;
> > > it can be used until something removes persistency (at the very least=
,
> > > until the parent gets unlocked, but some filesystems may have stronge=
r
> > > exclusion).
> > >         * d_make_discardable() - remove persistency mark and drop ref=
erence.
> > >
> > > NOTE: at that stage d_make_discardable() does not reject dentries not
> > > marked persistent - it acts as if the mark been set.
> > >
> > > Rationale: less noise in series splitup that way.  We want (and on th=
e
> > > next commit will get) simple_unlink() to do the right thing - remove
> > > persistency, if it's there.  However, it's used by many filesystems.
> > > We would have either to convert them all at once or split simple_unli=
nk()
> > > into "want persistent" and "don't want persistent" versions, the latt=
er
> > > being the old one.  In the course of the series almost all callers
> > > would migrate to the replacement, leaving only two pathological cases
> > > with the old one.  The same goes for simple_rmdir() (two callers left=
 in
> > > the end), simple_recursive_removal() (all callers gone in the end), e=
tc.
> > > That's a lot of noise and it's easier to start with d_make_discardabl=
e()
> > > quietly accepting non-persistent dentries, then, in the end, add priv=
ate
> > > copies of simple_unlink() and simple_rmdir() for two weird users (con=
figfs
> > > and apparmorfs) and have those use dput() instead of d_make_discardab=
le().
> > > At that point we'd be left with all callers of d_make_discardable()
> > > always passing persistent dentries, allowing to add a warning in it.
> > >
> > > [7/54] convert simple_{link,unlink,rmdir,rename,fill_super}() to new =
primitives
> > >         See above re quietly accepting non-peristent dentries in
> > > simple_unlink(), simple_rmdir(), etc.
> > >
> > >         Converting filesystems:
> > > [8/54] convert ramfs and tmpfs
> > > [9/54] procfs: make /self and /thread_self dentries persistent
> > > [10/54] configfs, securityfs: kill_litter_super() not needed
> > > [11/54] convert xenfs
> > > [12/54] convert smackfs
> > > [13/54] convert hugetlbfs
> > > [14/54] convert mqueue
> > > [15/54] convert bpf
> > > [16/54] convert dlmfs
> > > [17/54] convert fuse_ctl
> > > [18/54] convert pstore
> > > [19/54] convert tracefs
> > > [20/54] convert debugfs
> > > [21/54] debugfs: remove duplicate checks in callers of start_creating=
()
> > > [22/54] convert efivarfs
> > > [23/54] convert spufs
> > > [24/54] convert ibmasmfs
> > > [25/54] ibmasmfs: get rid of ibmasmfs_dir_ops
> > > [26/54] convert devpts
> > > [27/54] binderfs: use simple_start_creating()
> > > [28/54] binderfs_binder_ctl_create(): kill a bogus check
> > > [29/54] convert binderfs
> > > [30/54] autofs_{rmdir,unlink}: dentry->d_fsdata->dentry =3D=3D dentry=
 there
> > > [31/54] convert autofs
> > > [32/54] convert binfmt_misc
> > > [33/54] selinuxfs: don't stash the dentry of /policy_capabilities
> > > [34/54] selinuxfs: new helper for attaching files to tree
> > > [35/54] convert selinuxfs
> > >
> > >         Several functionfs fixes, before converting it, to make life
> > > simpler for backporting:
> > > [36/54] functionfs: don't abuse ffs_data_closed() on fs shutdown
> > > [37/54] functionfs: don't bother with ffs->ref in ffs_data_{opened,cl=
osed}()
> > > [38/54] functionfs: need to cancel ->reset_work in ->kill_sb()
> > > [39/54] functionfs: fix the open/removal races
> > >
> > >         ... and back to filesystems conversions:
> > >
> > > [40/54] functionfs: switch to simple_remove_by_name()
> > > [41/54] convert functionfs
> > > [42/54] gadgetfs: switch to simple_remove_by_name()
> > > [43/54] convert gadgetfs
> > > [44/54] hypfs: don't pin dentries twice
> > > [45/54] hypfs: switch hypfs_create_str() to returning int
> > > [46/54] hypfs: swich hypfs_create_u64() to returning int
> > > [47/54] convert hypfs
> > > [48/54] convert rpc_pipefs
> > > [49/54] convert nfsctl
> > > [50/54] convert rust_binderfs
> > >
> > >         ... and no kill_litter_super() callers remain, so we
> > > can take it out:
> > > [51/54] get rid of kill_litter_super()
> > >
> > >         Followups:
> > > [52/54] convert securityfs
> > >         That was the last remaining user of simple_recursive_removal(=
)
> > > that did *not* mark things persistent.  Now the only places where
> > > d_make_discardable() is still called for dentries that are not marked
> > > persistent are the calls of simple_{unlink,rmdir}() in configfs and
> > > apparmorfs.
> > >
> > > [53/54] kill securityfs_recursive_remove()
> > >         Unused macro...
> > >
> > > [54/54] d_make_discardable(): warn if given a non-persistent dentry
> > >
> > > At this point there are very few call chains that might lead to
> > > d_make_discardable() on a dentry that hadn't been made persistent:
> > > calls of simple_unlink() and simple_rmdir() in configfs and
> > > apparmorfs.
> > >
> > > Both filesystems do pin (part of) their contents in dcache, but
> > > they are currently playing very unusual games with that.  Converting
> > > them to more usual patterns might be possible, but it's definitely
> > > going to be a long series of changes in both cases.
> > >
> > > For now the easiest solution is to have both stop using simple_unlink=
()
> > > and simple_rmdir() - that allows to make d_make_discardable() warn
> > > when given a non-persistent dentry.
> > >
> > > Rather than giving them full-blown private copies (with calls of
> > > d_make_discardable() replaced with dput()), let's pull the parts of
> > > simple_unlink() and simple_rmdir() that deal with timestamps and link
> > > counts into separate helpers (__simple_unlink() and __simple_rmdir()
> > > resp.) and have those used by configfs and apparmorfs.
> > >
> >
> > Hi Al, when I apply this patchset my Pixel 6 no longer enumerates on
> > lsusb or ADB. It was quite hard to bisect to this point, as this is
> > non-deterministic and seems to be setup specific. Note, I am using
> > android-mainline, but my understanding is that this build does not
> > have any out-of-tree USB patches, and that there are no vendor hooks
> > in the build.
> >
> > My apologies as I can't offer any other clues; there are no obviously
> > bad dmesg logs and I'm still working on narrowing down the exact
> > commit(s) that started this, but just wanted to send a FYI in case
> > something stands out as obvious.
>
> Note that I had to revert commit e5bf5ee26663 ("functionfs: fix the
> open/removal races") from the stable backports, as it was causing issues
> on the pixel devices it got backported to.  So perhaps look there?
>
> thanks,
>
> greg k-h

Thanks for the suggestion. I tried a few different setups, and now I'm
fairly confident e5bf5ee26663 ("functionfs: fix the open/removal
races") is the culprit. I did have to revert 6ca67378d0e7 ("convert
functionfs") and c7747fafaba0 ("functionfs: switch to
simple_remove_by_name()") to successfully build, but reverting only
those two in isolation did not fix the issue.

Al, please let me know if you have any other variant of the patch(s)
that you want tested, otherwise feel free to add these tags as
appropriate:
Reported-by: Samuel Wu <wusamuel@google.com>
Tested-by: Samuel Wu <wusamuel@google.com>

Thanks!

