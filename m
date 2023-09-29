Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9997B2B24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 07:20:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lr9XINSZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxdwC5HzRz3cPD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 15:20:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lr9XINSZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxbwP02xJz30gn;
	Fri, 29 Sep 2023 13:50:28 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-77432add7caso590371085a.2;
        Thu, 28 Sep 2023 20:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695959425; x=1696564225; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYYbHmRBUQu7YjfKhJdocL7dPfjriCkGg2JwzJsWdwM=;
        b=lr9XINSZPGABo8CvTNuJU8W82c2Lz6bjoVuWJJMviJar42V7rwooIyFIWpLJ9NALrw
         C6EsfUi4gWfbPkBiDdyBoGjeXSnKqvxUlhNi2f8jXhGCbcJl8Ycq82+TUIfsO05UF4bh
         +1mwpgvsaLMwpc0j690i6HwIsHfUZoP8BERApG5iGGvOrMwCxiDqbD5aAadx0EirEUdb
         zQ2D1ow3V+dMiywKFI+/xEESwO1tB8HV07NtCPsyI1VAXPIYtk+KCnezpLbHnOL/VL7Q
         TDKuYL4uBpeed3Tiu3JgvbfkUnhJndlcQXez1CNfLzjlShJ9sRWaxhfEyTo+pYOVp8ub
         UoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695959425; x=1696564225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYYbHmRBUQu7YjfKhJdocL7dPfjriCkGg2JwzJsWdwM=;
        b=TXQ6aP+btD85iQyKDj9Ld1cMQPpkvp0Uh4znUa++gtrWWr35OuvjoJGYaYSWWfv8zH
         cun/Qh5cXXP4FFSMVyOgkYvaQN17DCb2x2bXMDnQOfUM/WL8M4qbZeBX5GzczCYvYUdZ
         c0T2lZ09gchKubf/FBz3FEInbuXgTm1YLfY67DMjzhf32cREzIHdFjnfFrSRGe1dmDfi
         gLYRUngQ1cV9wYNjwSqQ8KsuuGmpXLf7kBpVHQY3NyegVvXWMYk8LTzPGbycZutL/Y9r
         5HhCui8hsOOcUrt9CII5SFF3lSYJtYoFxmKg4jgX2nHAR5zovgNCk8zvDQgeM+j/z6Jo
         Mdaw==
X-Gm-Message-State: AOJu0YzYZBrSYZqqFFBN3XwVJdanCl2Mv9gTg0xm/YJ5tACR5a8KKnLs
	ZMxkEHtIPzvqRDxevP34AISKrkJAcO3CARJDN5Q=
X-Google-Smtp-Source: AGHT+IGZ9FbyCI7u8iOe4evpIjYBqumu0LCfPbLB14Vob7h48kUS/cZM9tDSVc21MSgdNbX4O2KSgM/HSLf/cSOdPJI=
X-Received: by 2002:a05:620a:45a8:b0:774:1875:edb1 with SMTP id
 bp40-20020a05620a45a800b007741875edb1mr3147718qkb.20.1695959424913; Thu, 28
 Sep 2023 20:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230928110554.34758-1-jlayton@kernel.org> <20230928110554.34758-2-jlayton@kernel.org>
 <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com> <af047e4a1c6947c59d4a13d4ae221c784a5386b4.camel@kernel.org>
 <20230928171943.GK11439@frogsfrogsfrogs> <6a6f37d16b55a3003af3f3dbb7778a367f68cd8d.camel@kernel.org>
 <20230928212656.GC189345@mit.edu> <CAHk-=wjTynK9BdGbi+8eShU77nkPvipFwRxEd1TSBrw2+LiuDg@mail.gmail.com>
In-Reply-To: <CAHk-=wjTynK9BdGbi+8eShU77nkPvipFwRxEd1TSBrw2+LiuDg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 29 Sep 2023 06:50:13 +0300
Message-ID: <CAOQ4uxg5ctY9yCjLOjN1nETAcEuNb2UERnYuDv7PoErdxX=WUw@mail.gmail.com>
Subject: Re: [PATCH 86/87] fs: switch timespec64 fields in inode to discrete integers
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 29 Sep 2023 15:18:56 +1000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, "Rafael J . Wysocki" <rafael@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>, Andrii Nakryiko <andrii@kernel.org>, Mattia Dongili <malattia@linux.it>, Hugh Dickins <hughd@google.com>, Yonghong Song <yonghong.song@linux.dev>, Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>, Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>, linux-xfs@vger.kernel.org, James Morris <jmorris@namei.org>, Christoph Hellwig <hch@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Eric Van Hensbergen <ericvh@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Trond Myklebust <trond.myklebust@hammersp
 ace.com>, Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, Chuck Lever <chuck.lever@oracle.com>, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org, Dave Kleikamp <shaggy@kernel.org>, samba-technical@lists.samba.org, linux-mm@kvack.org, Joel Fernandes <joel@joelfernandes.org>, Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>, codalist@telemann.coda.cs.cmu.edu, linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>, John Fast
 abend <john.fastabend@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Todd Kjos <tkjos@android.com>, Vasily Gorbik <gor@linux.ibm.com>, selinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>, John Johansen <john.johansen@canonical.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Martijn Coenen <maco@android.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>, Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net, Muchun Song <muchun.song@linux.dev>, linux-f2fs-devel@lists.sourceforge.net, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, gfs2@lists.linux.dev, "Eric W. Biederman" <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>, Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com
 >, linux-efi@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>, ocfs2-devel@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>, Yue Hu <huyue2@gl0jj8bn.sched.sma.tdnsstic1.cn>, Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>, Jiri Slaby <jirislaby@kernel.org>, linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro.aota@wdc.com>, Daniel Borkmann <daniel@iogearbox.net>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, coda@cs.cmu.edu, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Mark Gross <markgross@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Eric Paris <eparis@parisplace.o
 rg>, ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>, Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Song Liu <song@kernel.org>, Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>, Jeremy Kerr <jk@ozlabs.org>, Netdev <netdev@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Chandan Babu R <chandan.babu@oracle.com>, jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>, Neil Brown <neilb@suse.de>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>, linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>, Andreas Dilger <adilger.kernel@dilger.ca>, Mikulas Patocka <miku
 las@artax.karlin.mff.cuni.cz>, Ard Biesheuvel <ardb@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>, Dai Ngo <Dai.Ngo@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Salah Triki <salah.triki@gmail.com>, platform-driver-x86@vger.kernel.org, Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Chao Yu <chao@kernel.org>, apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>, Hans de Goede <hdegoede@redhat.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Johannes Thumshirn <jth@kernel.org>, Ritu Agarwal <rituagar@linux.ibm.com>, Luis de Bethencourt <luisbg@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
 , v9fs@lists.linux.dev, David Sterba <dsterba@suse.cz>, linux-security-module@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>, Phillip Lougher <phillip@squashfs.org.uk>, Johannes Berg <johannes@sipsolutions.net>, Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 29, 2023 at 3:19=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
...
> So yes, real programs to cache stat information, and it matters for perfo=
rmance.
>
> But I don't think any actual reasonable program will have
> *correctness* issues, though -

I beg to disagree.

> because there are certainly filesystems
> out there that don't do nanosecond resolution (and other operations
> like copying trees around will obviously also change times).
>
> Anybody doing steganography in the timestamps is already not going to
> have a great time, really.
>

Your thesis implies that all applications are portable across different
filesystems and all applications are expected to cope with copying
trees around.

There are applications that work on specific filesystems and those
applications are very much within sanity if they expect that past
observed values of nsec will not to change if the file was not changed.

But even if we agree that will "only" hurt performance, your example of
performance hit (10s of git diff) is nowhere close to the performance
hit of invalidating the mtime cache of billions of files at once (i.e. afte=
r
kernel upgrade), which means that rsync-like programs need to
re-read all the data from remote locations.

I am not saying that filesystems cannot decide to *stop storing nsec
granularity* from this day forth, but like btrfs pre-historic timestamps,
those fs have an obligation to preserve existing metadata, unless
users opted to throw it away.

OTOH, it is perfectly fine if the vfs wants to stop providing sub 100ns
services to filesystems. It's just going to be the fs problem and the
preserved pre-historic/fine-grained time on existing files would only
need to be provided in getattr(). It does not need to be in __i_mtime.

Thanks,
Amir.
