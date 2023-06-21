Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4CE7392FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 01:24:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tBqvzi0B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmfj40yQqz30MN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 09:24:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tBqvzi0B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jlayton@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmZ0x02hxz303p;
	Thu, 22 Jun 2023 05:52:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F2B69616B0;
	Wed, 21 Jun 2023 19:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C99C433C8;
	Wed, 21 Jun 2023 19:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687377165;
	bh=vTL4Y8a8sFEsX3Xqt4OIZCRU2/7UfNvPDdjp0N/3dJE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=tBqvzi0BueVyLSEbesqZv6Z2lEPP3VHDK/0ro+NhJgrWCN7POU/GnsfWmg+au/I1/
	 qhi//1NZGnRyBWC+DfSRBIODYBQomanDaEsbNql7Uti143OqrGRxW4LYitKm3HOUFm
	 3AFCsCq6C4olFaFCKGiCtIGy0tLgZnX0NusQlw4HgjVra9Ac5A8Ylg7+9/P0lUpR5a
	 +VLBtjm16h891O76lVM1Ta8bhTOaRz+hamckCGdfcbzLfSMEYWZEagHpIq+7Dm+VlU
	 f0RFgH+s7zmUzeMyOo6a8vBaboDD6pPbvwZcf5WIVyOhAezSg+L8WY3I+kat7Le9is
	 Pb20wj8vyk/yg==
Message-ID: <2a5a069572b46b59dd16fe8d54e549a9b5bbb6eb.camel@kernel.org>
Subject: Re: [PATCH 00/79] fs: new accessors for inode->i_ctime
From: Jeff Layton <jlayton@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Date: Wed, 21 Jun 2023 15:52:27 -0400
In-Reply-To: <20230621152141.5961cf5f@gandalf.local.home>
References: <20230621144507.55591-1-jlayton@kernel.org>
	 <20230621152141.5961cf5f@gandalf.local.home>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Jun 2023 09:22:21 +1000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>, Andrii Nakryiko <andrii@kernel.org>, Hugh Dickins <hughd@google.com>, John Johansen <john.johansen@canonical.com>, Seth Forshee <sforshee@digitalocean.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>, Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>, linux-xfs@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>, John Keeping <john@keeping.me.uk>, Zhang Yi <yi.zhang@huawei.com>, James Morris <jmorris@namei.org>, Tyler Hicks <code@tyhicks.com>, Alan Stern <stern@rowland.harvard.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Eric Van Hensbergen <ericvh@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Dave Kleikamp <shaggy@kernel.org>, Sandeep Dhavale <dhavale@google.com>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Mimi Zohar <zohar@linux.ibm.com>, linux-mm@kvack.org, Joel Fernandes <joel@joelfernandes.org>, Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>
 , Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Hangyu Hua <hbh25y@gmail.com>, linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Minghao Chi <chi.minghao@zte.com.cn>, codalist@coda.cs.cmu.edu, selinux@vger.kernel.org, ZhangPeng <zhangpeng362@huawei.com>, Udipto Goswami <quic_ugoswami@quicinc.com>, Yonghong Song <yhs@fb.com>, Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, ecryptfs@vger.kernel.org, Todd Kjos <tkjos@android.com>, Vasily Gorbik <gor@linux.ibm.com>, Yu Zhe <yuzhe@nfschina.com>, linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>, Yue Hu <huyue2@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Aditya Garg <gargaditya08@live.com>, Martijn Coenen <maco@android.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>, Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net, Muchun Song <muchun.song@linux.dev>, Roberto Sassu <roberto.sassu@huawei.com>, linux-f2fs-devel@lists.sourceforge.net, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Jozef Martiniak <jomajm@gmail.com>, Eric Biederman <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>, xu xin <cgel.zte@gmail.com>, Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>, Jingyu Wang <jingyuwang_vip@163.com>, linux-efi@vger.kernel.org, Dan Carpenter <error27@gmail.com>, Martin Brandenburg <martin@omnibond.com>, Tom Rix <trix@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro.aota@wdc.com>, Daniel Borkmann <daniel@iogearbox.net>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, Linyu Yuan <quic_linyyuan@quicinc.com>, coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>, Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, Zhihao Cheng <chengzhihao1@huawei.com>, Jens Axboe <axboe@kernel.dk>, Zeng Jingxiang <linuszeng@tencent.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org, Yifei Liu <yifeliu@cs.stonybrook.edu>, Damien Le Moal <dlemoal@kernel.org>, Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>, Jiangshan Yi <yijiangshan@kylinos.cn>, David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Song Liu <song@kernel.org>, samba-technical@lists.samba.org, Steve French <sfrench@samba.org>, Jeremy Kerr <jk@ozlabs.org>, netdev@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, "David S.
 Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>, Oleg Kanatov <okanatov@gmail.com>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Joseph Qi <joseph.qi@linux.alibaba.com>, Yuta Hayama <hayama@lineo.co.jp>, Andreas Dilger <adilger.kernel@dilger.ca>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Zhengchao Shao <shaozhengchao@huawei.com>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>, Stefan Roesch <shr@devkernel.io>, cluster-devel@redhat.com, Jason Gunthorpe <jgg@ziepe.ca>, Jakub Kicinski <kuba@kernel.org>, Rik van Riel <riel@surriel.com>, Salah Triki <salah.triki@gmail.com>, Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Chao Yu <chao@kernel.org>, apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, Tom Talpey <tom@talpey.com>, Hans de Goede <hdegoede@redhat.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Dave Chinner <dchinner@redhat.com>, David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Juergen Gross <jgross@suse.com>, Johannes Thumshirn <jth@kernel.org>, Ritu Agarwal <rituagar@linux.ibm.com>, Luis de Bethencourt <luisbg@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, v9fs@lists.linux.dev, "Fabio M. De
 Francesco" <fmdefrancesco@gmail.com>, linux-unionfs@vger.kernel.org, Ruihan Li <lrh2000@pku.edu.cn>, linux-security-module@vger.kernel.org, Erez Zadok <ezk@cs.stonybrook.edu>, Jeffle Xu <jefflexu@linux.alibaba.com>, "Dr. David Alan
 Gilbert" <linux@treblig.org>, Johannes Weiner <hannes@cmpxchg.org>, Phillip Lougher <phillip@squashfs.org.uk>, Johannes Berg <johannes@sipsolutions.net>, Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-06-21 at 15:21 -0400, Steven Rostedt wrote:
> On Wed, 21 Jun 2023 10:45:05 -0400
> Jeff Layton <jlayton@kernel.org> wrote:
>=20
> > Most of this conversion was done via coccinelle, with a few of the more
> > non-standard accesses done by hand. There should be no behavioral
> > changes with this set. That will come later, as we convert individual
> > filesystems to use multigrain timestamps.
>=20
> BTW, Linus has suggested to me that whenever a conccinelle script is used=
,
> it should be included in the change log.
>=20

Ok, here's what I have. I note again that my usage of coccinelle is
pretty primitive, so I ended up doing a fair bit of by-hand fixing after
applying these.

Given the way that this change is broken up into 77 patches by
subsystem, to which changelogs should I add it? I could add it to the
"infrastructure" patch, but that's the one where I _didn't_ use it.=A0

Maybe to patch #79 (the one that renames i_ctime)?


------------------------8<------------------------------
@@
expression inode;
@@

- inode->i_ctime =3D current_time(inode)
+ inode_set_current_ctime(inode)

@@
expression inode;
@@

- inode->i_ctime =3D inode->i_mtime =3D current_time(inode)
+ inode->i_mtime =3D inode_set_current_ctime(inode)

@@
struct inode *inode;
expression value;
@@

- inode->i_ctime =3D value;
+ inode_set_ctime(inode, value);

@@
struct inode *inode;
expression val;
@@
- inode->i_ctime.tv_sec =3D val
+ inode_set_ctime_sec(inode, val)

@@
struct inode *inode;
expression val;
@@
- inode->i_ctime.tv_nsec =3D val
+ inode_set_ctime_nsec(inode, val)

@@
struct inode *inode;
@@
- inode->i_ctime
+ inode_ctime_peek(inode)

