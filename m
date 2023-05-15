Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F81704167
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 01:33:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKwfp3hzGz3f8d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 09:33:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=iievZifv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=amir73il@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=iievZifv;
	dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKfj36QsRz3Wtr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 23:04:37 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-ba71cd7ce7fso4948280276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 06:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684155873; x=1686747873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmjgtR3FUUnPHLlHE3NyNv9G/eITqpjvj7rS/dG5ByE=;
        b=iievZifvjljNx3cjrrpmWbU9HzSxb4BFi5Wy2YoKC6dIIE/gG3VJyQE9GfG8Ix4qDH
         3k+33ttyIvhu7uSgwrLOZ5aMU3FNh8WjsllaT8uC5juPJhCAmrecbNBrFU05dyOQtKJW
         ED4npY0DIWnwq75hBoS9c0hLdQHXroAOM0MHnLWDkHC5QyNC543bIprOo/T7xdhzNmrq
         JGstKStUZKW9olEB/jLq4eHoyUQH+nC9pAYpVXmskv4R2ae3E7hKZcPObON2dRSjJNry
         fsRcgZTNk5LAkZHyjb9POzgX7uAIfhBGWOPPcWq4qfLMzIxzWjzyEzhWGNoQZ6ScmC+0
         vSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684155873; x=1686747873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmjgtR3FUUnPHLlHE3NyNv9G/eITqpjvj7rS/dG5ByE=;
        b=Ws6wgAFWPRICsfA7Ht8J98GsvVmfwa2vUM3Oc7p/a+eH/Ttrt5CQugT5evsnQQ8Ae0
         zOyTerQWEZHvnBJo8KLNio0h4lGK3vyit6u66UZLMaQN8XsSwJ5k99GzRtcp1x094zDi
         bPEMkSlinyX6nTzd4a/jcTF/QGn+FZJC+VvIohduEvzKp2pAGUOIkWYwr5BmiKXQ6czz
         CFpuIVYTHWxKD0lYpQtPVMhdzK1jVMx1iEqkdb9CGEQNut4NI+w+laqCmK0aig5yLgO5
         PJFs/26MwUyfbJX6eiBUTCEFR2jywr8UI8AJSxtnOtMRAhM58PiCGZM/AgGKaNUP9PR7
         Vt/g==
X-Gm-Message-State: AC+VfDzo/QLyW9t1T8qGrNCNc8Hzguam6V0iDg+012a/zweEpIBpvX3T
	Pg4+nQ0kSpyDFmpKgcuoXy74ZI/dLkyngdE3F5Y=
X-Google-Smtp-Source: ACHHUZ4j0rfWlRf3B25cMrTmeLqU/GVDGA6NRJbdgBBYgLuSVLo3VaL7t47oFPK2ZArCu3u5WiUSpY5ldduBctNwBw8=
X-Received: by 2002:a05:7500:5283:b0:105:6766:6d39 with SMTP id
 x3-20020a057500528300b0010567666d39mr1166689gaa.40.1684155872830; Mon, 15 May
 2023 06:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230511150802.737477-1-cgzones@googlemail.com> <20230515-kopfgeld-umkurven-f27be4b68a26@brauner>
In-Reply-To: <20230515-kopfgeld-umkurven-f27be4b68a26@brauner>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 15 May 2023 16:04:21 +0300
Message-ID: <CAOQ4uxgtxLLfBuVUAT7+N7cox+03wJA3ACGEu76dZd5RqGWXTQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2] fs/xattr: add *at family syscalls
To: Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 16 May 2023 09:32:55 +1000
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, selinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org, =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, linux-parisc@vger.kernel.org, cyphar@cyphar.com, linux-api@vger.kernel.org, jlayton@kernel.org, linux-kernel@vger.kernel.org, audit@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 15, 2023 at 1:33=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Thu, May 11, 2023 at 05:08:02PM +0200, Christian G=C3=B6ttsche wrote:
> > Add the four syscalls setxattrat(), getxattrat(), listxattrat() and
> > removexattrat().  Those can be used to operate on extended attributes,
> > especially security related ones, either relative to a pinned directory
> > or on a file descriptor without read access, avoiding a
> > /proc/<pid>/fd/<fd> detour, requiring a mounted procfs.
> >
> > One use case will be setfiles(8) setting SELinux file contexts
> > ("security.selinux") without race conditions.
> >
> > Add XATTR flags to the private namespace of AT_* flags.
> >
> > Use the do_{name}at() pattern from fs/open.c.
> >
> > Use a single flag parameter for extended attribute flags (currently
> > XATTR_CREATE and XATTR_REPLACE) and *at() flags to not exceed six
> > syscall arguments in setxattrat().
> >
> > Previous approach ("f*xattr: allow O_PATH descriptors"): https://lore.k=
ernel.org/all/20220607153139.35588-1-cgzones@googlemail.com/
> > v1 discussion: https://lore.kernel.org/all/20220830152858.14866-2-cgzon=
es@googlemail.com/
> >
> > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> > CC: x86@kernel.org
> > CC: linux-alpha@vger.kernel.org
> > CC: linux-kernel@vger.kernel.org
> > CC: linux-arm-kernel@lists.infradead.org
> > CC: linux-ia64@vger.kernel.org
> > CC: linux-m68k@lists.linux-m68k.org
> > CC: linux-mips@vger.kernel.org
> > CC: linux-parisc@vger.kernel.org
> > CC: linuxppc-dev@lists.ozlabs.org
> > CC: linux-s390@vger.kernel.org
> > CC: linux-sh@vger.kernel.org
> > CC: sparclinux@vger.kernel.org
> > CC: linux-fsdevel@vger.kernel.org
> > CC: audit@vger.kernel.org
> > CC: linux-arch@vger.kernel.org
> > CC: linux-api@vger.kernel.org
> > CC: linux-security-module@vger.kernel.org
> > CC: selinux@vger.kernel.org
> > ---
>
> Fwiw, your header doesn't let me see who the mail was directly sent to
> so I'm only able to reply to lists which is a bit pointless...
>
> > v2:
> >   - squash syscall introduction and wire up commits
> >   - add AT_XATTR_CREATE and AT_XATTR_REPLACE constants
>
> > +#define AT_XATTR_CREATE              0x1     /* setxattrat(2): set val=
ue, fail if attr already exists */
> > +#define AT_XATTR_REPLACE     0x2     /* setxattrat(2): set value, fail=
 if attr does not exist */
>
> We really shouldn't waste any AT_* flags for this. Otherwise we'll run
> out of them rather quickly. Two weeks ago we added another AT_* flag
> which is up for merging for v6.5 iirc and I've glimpsed another AT_*
> flag proposal in one of the talks at last weeks Vancouver conference
> extravaganza.
>
> Even if we reuse 0x200 for AT_XATTR_CREATE (like we did for AT_EACCESS
> and AT_REMOVEDIR) we still need another bit for AT_XATTR_REPLACE.
>
> Plus, this is really ugly since AT_XATTR_{CREATE,REPLACE} really isn't
> in any way related to lookup and we're mixing it in with lookup
> modifying flags.
>
> So my proposal for {g,s}etxattrat() would be:
>
> struct xattr_args {
>         __aligned_u64 value;
>         __u32 size;
>         __u32 cmd;
> };
>
> So everything's nicely 64bit aligned in the struct. Use the @cmd member
> to set either XATTR_REPLACE or XATTR_CREATE and treat it as a proper
> enum and not as a flag argument like the old calls did.
>
> So then we'd have:
>
> setxattrat(int dfd, const char *path, const char __user *name,
>            struct xattr_args __user *args, size_t size, unsigned int flag=
s)
> getxattrat(int dfd, const char *path, const char __user *name,
>            struct xattr_args __user *args, size_t size, unsigned int flag=
s)
>
> The current in-kernel struct xattr_ctx would be renamed to struct
> kernel_xattr_args and then we do the usual copy_struct_from_user()
> dance:
>
> struct xattr_args args;
> err =3D copy_struct_from_user(&args, sizeof(args), uargs, usize);
>
> and then go on to handle value/size for setxattrat()/getxattrat()
> accordingly.
>
> getxattr()/setxattr() aren't meaningfully filterable by seccomp already
> so there's not point in not using a struct.
>
> If that isn't very appealing then another option is to add a new flag
> namespace just for setxattrat() similar to fspick() and move_mount()
> duplicating the needed lookup modifying flags.
> Thoughts?

Here is a thought: I am not sure if I am sorry we did not discuss this API
issue in LSFMM or happy that we did not waste our time on this... :-/

I must say that I dislike redefined flag namespace like FSPICK_*
just as much as I dislike overloading the AT_* namespace and TBH,
I am not crazy about avoiding this problem with xattr_args either.

A more sane solution IMO could have been:
- Use lower word of flags for generic AT_ flags
- Use the upper word of flags for syscall specific flags

So if it were up to me, I would vote starting this practice:

+ /* Start of syscall specific range */
+ #define AT_XATTR_CREATE       0x10000     /* setxattrat(2): set
value, fail if attr already exists */
+ #define AT_XATTR_REPLACE     0x20000     /* setxattrat(2): set
value, fail if attr does not exist */

Which coincidentally happens to be inline with my AT_HANDLE_FID patch...

Sure, we will have some special cases like MOVE_MOUNT_* and
legacy pollution to the lower AT_ flags word, but as a generic solution
for syscalls that need the common AT_ lookup flags and just a few
private flags, that seems like the lesser evil to me.

Thanks,
Amir.
