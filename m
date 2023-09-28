Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DB57B1C09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 14:20:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X75jpHew;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxCGz0KJJz3dWs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 22:20:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X75jpHew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jlayton@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxBtB5JJzz3c5F;
	Thu, 28 Sep 2023 22:02:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 63305B81BE2;
	Thu, 28 Sep 2023 12:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA9FC433C8;
	Thu, 28 Sep 2023 12:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695902525;
	bh=1OUz3HfWq12NDsf5pt/6tI4U8Mw0C+kMAWU6iE/wPW8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=X75jpHewuenH5i4yKP6hTRRG96bBnvYSW9ppyaPCvnjRr7Vm9FFZm7UX9cHhEdgJN
	 9sWsiJl4JoQqsZw/GKoi7gqY0vw1WSuYAKrfeyF1owUUDgi337zCsV6xBykTFrjqQ4
	 1IMm02SWv3ExmYV6PPhf6pdloK7xjV68MtysVko9J4sCrAu5RV7rZ7A69VK3LrHZj/
	 A70QTwuFIQFa4pBSyL7/hVskPkmrikqba+e0r1Z/ds7+Y2X+m8S6nvykGKta//EbMF
	 i8R56KOYB+jvupadzk05Se+6sdUCAkxdoK6c3HGUXdwYBTc4QSGFZzFBPryJ+pbGMH
	 lSy4ugTII5Mvw==
Message-ID: <f88106b26a2b647a1541d049999d5546d2ee3e51.camel@kernel.org>
Subject: Re: [PATCH 87/87] fs: move i_blocks up a few places in struct inode
From: Jeff Layton <jlayton@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 28 Sep 2023 08:01:50 -0400
In-Reply-To: <CAOQ4uxjSrgGr+6UOs4ADGYCderpQ7hAaPjNmB1DExAPLQQsHSg@mail.gmail.com>
References: <20230928110554.34758-1-jlayton@kernel.org>
	 <20230928110554.34758-3-jlayton@kernel.org>
	 <CAOQ4uxjSrgGr+6UOs4ADGYCderpQ7hAaPjNmB1DExAPLQQsHSg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>, Andrii Nakryiko <andrii@kernel.org>, Mattia Dongili <malattia@linux.it>, Hugh Dickins <hughd@google.com>, John Johansen <john.johansen@canonical.com>, Yonghong Song <yonghong.song@linux.dev>, Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>, Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>, linux-xfs@vger.kernel.org, James Morris <jmorris@namei.org>, Christoph Hellwig <hch@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Eric Van Hensbergen <ericvh@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anton Altaparmakov <anton@tuxera.com>, Christian Brauner 
 <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Chuck Lever <chuck.lever@oracle.com>, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>, linux-mm@kvack.org, Joel Fernandes <joel@joelfernandes.org>, Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>, linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, codalist@coda.cs
 .cmu.edu, Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Todd Kjos <tkjos@android.com>, Vasily Gorbik <gor@linux.ibm.com>, selinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>, Yue Hu <huyue2@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Martijn Coenen <maco@android.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>, Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net, Muchun Song <muchun.song@linux.dev>, linux-f2fs-devel@lists.sourceforge.net, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, gfs2@lists.linux.dev, Eric Biederman <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>, Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>, linux-efi@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>, ocfs2-devel@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>, platform-driver-x86@vger.kernel.org, Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>, Jiri Slaby <jirislaby@kernel.org>, linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro.aota@wdc.com>, Daniel Borkmann <daniel@iogearbox.net>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, coda@cs.cmu.edu, Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>, Arnd
  Bergmann <arnd@arndb.de>, autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Mark Gross <markgross@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>, Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Song Liu <song@kernel.org>, samba-technical@lists.samba.org, Steve French <sfrench@samba.org>, Jeremy Kerr <jk@ozlabs.org>, netdev@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, "David S.
 Miller" <davem@davemloft.net>, Chandan Babu R <chandan.babu@oracle.com>, jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>, Neil Brown <neilb@suse.de>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>, linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>, Andreas Dilger <adilger.kernel@dilger.ca>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Ard Biesheuvel <ardb@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>, Dai Ngo <Dai.Ngo@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Salah Triki <salah.triki@gmail.com>, Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Chao Yu <c
 hao@kernel.org>, apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>, Hans de Goede <hdegoede@redhat.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Johannes Thumshirn <jth@kernel.org>, Ritu Agarwal <rituagar@linux.ibm.com>, Luis de Bethencourt <luisbg@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, v9fs@lists.linux.dev, David Sterba <dsterba@suse.cz>, linux-security-module@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>, Phillip Lougher <phillip@squashfs.org.uk>, Johannes Berg <johannes@sipsolutions.net>, Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-09-28 at 14:35 +0300, Amir Goldstein wrote:
> On Thu, Sep 28, 2023 at 2:06=E2=80=AFPM Jeff Layton <jlayton@kernel.org> =
wrote:
> >=20
> > The recent change to use discrete integers instead of struct timespec64
> > in struct inode shaved 8 bytes off of it, but it also moves the i_lock
> > into the previous cacheline, away from the fields that it protects.
> >=20
> > Move i_blocks up above the i_lock, which moves the new 4 byte hole to
> > just after the timestamps, without changing the size of the structure.
> >=20
>=20
> Instead of creating an implicit hole, can you please move i_generation
> to fill the 4 bytes hole.
>=20
> It makes sense in the same cache line with i_ino and I could
> use the vacant 4 bytes hole above i_fsnotify_mask to expand the
> mask to 64bit (the 32bit event mask space is running out).
>=20
> Thanks,
> Amir.
>=20

Sounds like a plan. Resulting struct inode size is the same (616 bytes
with my kdevops kconfig). BTW: all of these changes are in my "amtime"
branch if anyone wants to pull them down.
--
Jeff Layton <jlayton@kernel.org>
