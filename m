Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 999807B1C06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 14:19:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T+6oXt6v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxCG234xHz3dL5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 22:19:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T+6oXt6v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::935; helo=mail-ua1-x935.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxBHR5DJFz3c2K;
	Thu, 28 Sep 2023 21:35:29 +1000 (AEST)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7afc13d58c6so706544241.1;
        Thu, 28 Sep 2023 04:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695900924; x=1696505724; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3oHHfr+yAdtkrxVkV3qE0VFTbMzK/MU2TZf7sFiWp8=;
        b=T+6oXt6v2MSyhH8uwxwQm6bcIcRFljgCAKTBm0siFjuFM4mUYGri8U5PvQLGQX+eJ9
         FgoaumwMeEKYR5ZEd+HHY7xtCsMOJIt0rlBsYCEzJP6hNE0cXeoiHxGVMt0xfmsDGL5Y
         m0RIeYaA82Z57WlxBHd4sPRiH/vYacg9cBRZmS0bvyFL9c2GMdFirBiS1wzI5GxU1b2V
         wTk7qNuwbzTO/u3FAr8K5Trc1Ao8807xuPtQyGJnjDL/PxMyBEjqEanKQ2JiI7oCLDpa
         ppx41GHFwdcsc2OGHOBOmzZWzANCWsUNffTIXg33k20Edica3+NSslhgxe771IN4qJmx
         L5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695900924; x=1696505724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3oHHfr+yAdtkrxVkV3qE0VFTbMzK/MU2TZf7sFiWp8=;
        b=M3TO5cfGLel5mke2GQ5PXwzb2tnweQtTXQO6rfaJVHKPlhvOmx9phIIckGPWVqLRdt
         yokEbCrg2as60XwKz+7eSOHND4GXALF3lNGTSeW+bdNwvoCytfZRNEhZAvWs/9RcWNQb
         /VaVCp7f0Ds5jrUhW9oJP5vMLQcpVUsNdvKIMOSepxC3PELn8qWTn4Pn7UuuLqdrjVgd
         Mw/3JcDQZI6QZ0sb3H/tLYU/SwQSOXcnexViluSZrC0+0xEy4+QVNDUzINloJhliXOPM
         bAAFHnkLSu+asnTOW5wJb/gaMjjWd+/9bWP8Gdyb6Y4+KkPJ6iVd1Q6t1hBQqsyFPFH/
         s4ew==
X-Gm-Message-State: AOJu0YxueF9u/z7y25w0nwRYmMy7rYw2Hq+P+1KuUP0IqMw1Q188C/xB
	B3Y9pcd8ZUDDUK7q1ighw8ZQk9l0ul+mPbFBhkg=
X-Google-Smtp-Source: AGHT+IHhHz7xARweFavd1XDLqmOlGZR89qjTYiX4UH69lO2YZAJePIkqF9BJYGYmOq/G1/CVWLpaXpMDMsrrAqgyB+o=
X-Received: by 2002:a67:ec16:0:b0:452:63b7:2f6d with SMTP id
 d22-20020a67ec16000000b0045263b72f6dmr830755vso.34.1695900924494; Thu, 28 Sep
 2023 04:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230928110554.34758-1-jlayton@kernel.org> <20230928110554.34758-3-jlayton@kernel.org>
In-Reply-To: <20230928110554.34758-3-jlayton@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 28 Sep 2023 14:35:13 +0300
Message-ID: <CAOQ4uxjSrgGr+6UOs4ADGYCderpQ7hAaPjNmB1DExAPLQQsHSg@mail.gmail.com>
Subject: Re: [PATCH 87/87] fs: move i_blocks up a few places in struct inode
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 28 Sep 2023 22:14:32 +1000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>, Andrii Nakryiko <andrii@kernel.org>, Mattia Dongili <malattia@linux.it>, Hugh Dickins <hughd@google.com>, John Johansen <john.johansen@canonical.com>, Yonghong Song <yonghong.song@linux.dev>, Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>, Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>, linux-xfs@vger.kernel.org, James Morris <jmorris@namei.org>, Christoph Hellwig <hch@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Eric Van Hensbergen <ericvh@kernel.org>, Suren Baghdasaryan <surenb@google.com
 >, Trond Myklebust <trond.myklebust@hammerspace.com>, Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, Chuck Lever <chuck.lever@oracle.com>, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>, linux-mm@kvack.org, Joel Fernandes <joel@joelfernandes.org>, Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>, linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leo
 n@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, codalist@coda.cs.cmu.edu, Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Todd Kjos <tkjos@android.com>, Vasily Gorbik <gor@linux.ibm.com>, selinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>, Yue Hu <huyue2@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Martijn Coenen <maco@android.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>, Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net, Muchun Song <muchun.song@linux.dev>, linux-f2fs-devel@lists.sourceforge.net, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, gfs2@lists.linux.dev, Eric Biederman <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>, Brad Warrum <bwarrum@linux.ibm.com>, Mike Kra
 vetz <mike.kravetz@oracle.com>, linux-efi@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>, ocfs2-devel@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>, platform-driver-x86@vger.kernel.org, Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>, Jiri Slaby <jirislaby@kernel.org>, linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro.aota@wdc.com>, Daniel Borkmann <daniel@iogearbox.net>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, coda@cs.cmu.edu, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Mark Gross <markgross@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Eric Paris <ep
 aris@parisplace.org>, ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>, Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Song Liu <song@kernel.org>, samba-technical@lists.samba.org, Steve French <sfrench@samba.org>, Jeremy Kerr <jk@ozlabs.org>, netdev@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Chandan Babu R <chandan.babu@oracle.com>, jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>, Neil Brown <neilb@suse.de>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>, linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>, Andreas Dilger <adilger.kernel@dilger.ca>, Mikulas Patocka
  <mikulas@artax.karlin.mff.cuni.cz>, Ard Biesheuvel <ardb@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>, Dai Ngo <Dai.Ngo@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Salah Triki <salah.triki@gmail.com>, Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Chao Yu <chao@kernel.org>, apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>, Hans de Goede <hdegoede@redhat.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Johannes Thumshirn <jth@kernel.org>, Ritu Agarwal <rituagar@linux.ibm.com>, Luis de Bethencourt <luisbg@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, v9fs@lists.linux.dev, David S
 terba <dsterba@suse.cz>, linux-security-module@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>, Phillip Lougher <phillip@squashfs.org.uk>, Johannes Berg <johannes@sipsolutions.net>, Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 28, 2023 at 2:06=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> The recent change to use discrete integers instead of struct timespec64
> in struct inode shaved 8 bytes off of it, but it also moves the i_lock
> into the previous cacheline, away from the fields that it protects.
>
> Move i_blocks up above the i_lock, which moves the new 4 byte hole to
> just after the timestamps, without changing the size of the structure.
>

Instead of creating an implicit hole, can you please move i_generation
to fill the 4 bytes hole.

It makes sense in the same cache line with i_ino and I could
use the vacant 4 bytes hole above i_fsnotify_mask to expand the
mask to 64bit (the 32bit event mask space is running out).

Thanks,
Amir.

> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  include/linux/fs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index de902ff2938b..3e0fe0f52e7c 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -677,11 +677,11 @@ struct inode {
>         u32                     i_atime_nsec;
>         u32                     i_mtime_nsec;
>         u32                     i_ctime_nsec;
> +       blkcnt_t                i_blocks;
>         spinlock_t              i_lock; /* i_blocks, i_bytes, maybe i_siz=
e */
>         unsigned short          i_bytes;
>         u8                      i_blkbits;
>         u8                      i_write_hint;
> -       blkcnt_t                i_blocks;
>
>  #ifdef __NEED_I_SIZE_ORDERED
>         seqcount_t              i_size_seqcount;
> --
> 2.41.0
>
