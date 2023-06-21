Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5032F738F08
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:45:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PnrB/Inm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXVt1Wltz3cjm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:45:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PnrB/Inm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jlayton@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmRBM5bSrz3bNn;
	Thu, 22 Jun 2023 00:45:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C397C6155A;
	Wed, 21 Jun 2023 14:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828EBC433C0;
	Wed, 21 Jun 2023 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687358726;
	bh=ITVtuh8zH7IgGAgeioITWFIWh9Z+1gDo8p1lVWyg0oY=;
	h=From:To:Subject:Date:From;
	b=PnrB/InmtbJQ53yas78akcjSInUrV/+ejTyuNMTd8geX+GrsATqqv+A76zQLeg6OZ
	 HykzxzC4nJwglmReumfJVglW2DyTmkTj6wLXkspYjbgS1D9AmPzZ6/acxW4soMbskU
	 tuave6illXjLdtKHw0kZAdOi5xVWhKM9yX0Wd3J9iW6t3D0cTwvW9/s6Vxcx2PFye/
	 +qpZxa0gxqwtQdPKXj2zIGSUnh+BzV5yfegRIS6R6rVqD4TT+RUSrMnn6oO+hm6cUf
	 6uCoCYLF3j/BD1z1QiaBwoQprTd6KkQlE8XzQmxCZAUC4lpZZd7Xybeqcvdm+nSmoo
	 ipgGCTsuHkjBA==
From: Jeff Layton <jlayton@kernel.org>
To: Jeremy Kerr <jk@ozlabs.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Brad Warrum <bwarrum@linux.ibm.com>,
	Ritu Agarwal <rituagar@linux.ibm.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	David Sterba <dsterba@suse.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Ian Kent <raven@themaw.net>,
	Luis de Bethencourt <luisbg@kernel.org>,
	Salah Triki <salah.triki@gmail.com>,
	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Xiubo Li <xiubli@redhat.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jan Harkes <jaharkes@cs.cmu.edu>,
	coda@cs.cmu.edu,
	Joel Becker <jlbec@evilplan.org>,
	Christoph Hellwig <hch@lst.de>,
	Nicolas Pitre <nico@fluxnic.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tyler Hicks <code@tyhicks.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Jan Kara <jack@suse.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	David Woodhouse <dwmw2@infradead.org>,
	Dave Kleikamp <shaggy@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Mark Fasheh <mark@fasheh.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Bob Copeland <me@bobcopeland.com>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Iurii Zaikin <yzaikin@google.com>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Anders Larsen <al@alarsen.net>,
	Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Evgeniy Dushistov <dushistov@mail.ru>,
	Hans de Goede <hdegoede@redhat.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	John Johansen <john.johansen@canonical.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Juergen Gross <jgross@suse.com>,
	Ruihan Li <lrh2000@pku.edu.cn>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Linyu Yuan <quic_linyyuan@quicinc.com>,
	John Keeping <john@keeping.me.uk>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Dan Carpenter <error27@gmail.com>,
	Yuta Hayama <hayama@lineo.co.jp>,
	Jozef Martiniak <jomajm@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sandeep Dhavale <dhavale@google.com>,
	Dave Chinner <dchinner@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	ZhangPeng <zhangpeng362@huawei.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Aditya Garg <gargaditya08@live.com>,
	Erez Zadok <ezk@cs.stonybrook.edu>,
	Yifei Liu <yifeliu@cs.stonybrook.edu>,
	Yu Zhe <yuzhe@nfschina.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Oleg Kanatov <okanatov@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	xu xin <cgel.zte@gmail.com>,
	Stefan Roesch <shr@devkernel.io>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Seth Forshee <sforshee@digitalocean.com>,
	Zeng Jingxiang <linuszeng@tencent.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	Tom Rix <trix@redhat.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Chen Zhongjin <chenzhongjin@huawei.com>,
	Zhengchao Shao <shaozhengchao@huawei.com>,
	Rik van Riel <riel@surriel.com>,
	Jingyu Wang <jingyuwang_vip@163.com>,
	Hangyu Hua <hbh25y@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-usb@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	autofs@vger.kernel.org,
	linux-mm@kvack.org,
	linux-btrfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	codalist@coda.cs.cmu.edu,
	ecryptfs@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-um@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	jfs-discussion@lists.sourceforge.net,
	linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net,
	ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com,
	linux-karma-devel@lists.sourceforge.net,
	devel@lists.orangefs.org,
	linux-unionfs@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	reiserfs-devel@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-trace-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Subject: [PATCH 00/79] fs: new accessors for inode->i_ctime
Date: Wed, 21 Jun 2023 10:45:05 -0400
Message-ID: <20230621144507.55591-1-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Jun 2023 04:32:35 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I've been working on a patchset to change how the inode->i_ctime is
accessed in order to give us conditional, high-res timestamps for the
ctime and mtime. struct timespec64 has unused bits in it that we can use
to implement this. In order to do that however, we need to wrap all
accesses of inode->i_ctime to ensure that bits used as flags are
appropriately handled.

This patchset first adds some new inode_ctime_* accessor functions. It
then converts all in-tree accesses of inode->i_ctime to use those new
functions and then renames the i_ctime field to __i_ctime to help ensure
that use of the accessors.

Most of this conversion was done via coccinelle, with a few of the more
non-standard accesses done by hand. There should be no behavioral
changes with this set. That will come later, as we convert individual
filesystems to use multigrain timestamps.

Some of these patches depend on the set I sent recently to add missing
ctime updates in various subsystems:

    https://lore.kernel.org/linux-fsdevel/20230612104524.17058-1-jlayton@kernel.org/T/#m25399f903cc9526e46b2e0f5a35713c80b52fde9

Since this patchset is so large, I'm only going to send individual
conversion patches to the appropriate maintainers. Please send
Acked-by's or Reviewed-by's if you can. The intent is to merge these as
a set (probably in v6.6). Let me know if that causes conflicts though,
and we can work it out.

This is based on top of linux-next as of yesterday.

Jeff Layton (79):
  fs: add ctime accessors infrastructure
  spufs: switch to new ctime accessors
  s390: switch to new ctime accessors
  binderfs: switch to new ctime accessors
  qib_fs: switch to new ctime accessors
  ibm: switch to new ctime accessors
  usb: switch to new ctime accessors
  9p: switch to new ctime accessors
  adfs: switch to new ctime accessors
  affs: switch to new ctime accessors
  afs: switch to new ctime accessors
  fs: switch to new ctime accessors
  autofs: switch to new ctime accessors
  befs: switch to new ctime accessors
  bfs: switch to new ctime accessors
  btrfs: switch to new ctime accessors
  ceph: switch to new ctime accessors
  coda: switch to new ctime accessors
  configfs: switch to new ctime accessors
  cramfs: switch to new ctime accessors
  debugfs: switch to new ctime accessors
  devpts: switch to new ctime accessors
  ecryptfs: switch to new ctime accessors
  efivarfs: switch to new ctime accessors
  efs: switch to new ctime accessors
  erofs: switch to new ctime accessors
  exfat: switch to new ctime accessors
  ext2: switch to new ctime accessors
  ext4: switch to new ctime accessors
  f2fs: switch to new ctime accessors
  fat: switch to new ctime accessors
  freevxfs: switch to new ctime accessors
  fuse: switch to new ctime accessors
  gfs2: switch to new ctime accessors
  hfs: switch to new ctime accessors
  hfsplus: switch to new ctime accessors
  hostfs: switch to new ctime accessors
  hpfs: switch to new ctime accessors
  hugetlbfs: switch to new ctime accessors
  isofs: switch to new ctime accessors
  jffs2: switch to new ctime accessors
  jfs: switch to new ctime accessors
  kernfs: switch to new ctime accessors
  minix: switch to new ctime accessors
  nfs: switch to new ctime accessors
  nfsd: switch to new ctime accessors
  nilfs2: switch to new ctime accessors
  ntfs: switch to new ctime accessors
  ntfs3: switch to new ctime accessors
  ocfs2: switch to new ctime accessors
  omfs: switch to new ctime accessors
  openpromfs: switch to new ctime accessors
  orangefs: switch to new ctime accessors
  overlayfs: switch to new ctime accessors
  proc: switch to new ctime accessors
  pstore: switch to new ctime accessors
  qnx4: switch to new ctime accessors
  qnx6: switch to new ctime accessors
  ramfs: switch to new ctime accessors
  reiserfs: switch to new ctime accessors
  romfs: switch to new ctime accessors
  smb: switch to new ctime accessors
  squashfs: switch to new ctime accessors
  sysv: switch to new ctime accessors
  tracefs: switch to new ctime accessors
  ubifs: switch to new ctime accessors
  udf: switch to new ctime accessors
  ufs: switch to new ctime accessors
  vboxsf: switch to new ctime accessors
  xfs: switch to new ctime accessors
  zonefs: switch to new ctime accessors
  mqueue: switch to new ctime accessors
  bpf: switch to new ctime accessors
  shmem: switch to new ctime accessors
  rpc_pipefs: switch to new ctime accessors
  apparmor: switch to new ctime accessors
  security: switch to new ctime accessors
  selinux: switch to new ctime accessors
  fs: rename i_ctime field to __i_ctime

 arch/powerpc/platforms/cell/spufs/inode.c |  2 +-
 arch/s390/hypfs/inode.c                   |  4 +-
 drivers/android/binderfs.c                |  8 +--
 drivers/infiniband/hw/qib/qib_fs.c        |  4 +-
 drivers/misc/ibmasm/ibmasmfs.c            |  2 +-
 drivers/misc/ibmvmc.c                     |  2 +-
 drivers/usb/core/devio.c                  | 16 +++---
 drivers/usb/gadget/function/f_fs.c        |  6 +--
 drivers/usb/gadget/legacy/inode.c         |  3 +-
 fs/9p/vfs_inode.c                         |  6 ++-
 fs/9p/vfs_inode_dotl.c                    | 11 ++--
 fs/adfs/inode.c                           |  4 +-
 fs/affs/amigaffs.c                        |  6 +--
 fs/affs/inode.c                           | 17 +++---
 fs/afs/dynroot.c                          |  2 +-
 fs/afs/inode.c                            |  6 +--
 fs/attr.c                                 |  2 +-
 fs/autofs/inode.c                         |  2 +-
 fs/autofs/root.c                          |  6 +--
 fs/bad_inode.c                            |  3 +-
 fs/befs/linuxvfs.c                        |  2 +-
 fs/bfs/dir.c                              | 16 +++---
 fs/bfs/inode.c                            |  6 +--
 fs/binfmt_misc.c                          |  3 +-
 fs/btrfs/delayed-inode.c                  | 10 ++--
 fs/btrfs/file.c                           | 24 +++------
 fs/btrfs/inode.c                          | 66 +++++++++--------------
 fs/btrfs/ioctl.c                          |  2 +-
 fs/btrfs/reflink.c                        |  7 ++-
 fs/btrfs/transaction.c                    |  3 +-
 fs/btrfs/tree-log.c                       |  4 +-
 fs/btrfs/xattr.c                          |  4 +-
 fs/ceph/acl.c                             |  2 +-
 fs/ceph/caps.c                            |  2 +-
 fs/ceph/inode.c                           | 17 +++---
 fs/ceph/snap.c                            |  2 +-
 fs/ceph/xattr.c                           |  2 +-
 fs/coda/coda_linux.c                      |  2 +-
 fs/coda/dir.c                             |  2 +-
 fs/coda/file.c                            |  2 +-
 fs/coda/inode.c                           |  2 +-
 fs/configfs/inode.c                       |  6 +--
 fs/cramfs/inode.c                         |  2 +-
 fs/debugfs/inode.c                        |  2 +-
 fs/devpts/inode.c                         |  6 +--
 fs/ecryptfs/inode.c                       |  2 +-
 fs/efivarfs/file.c                        |  2 +-
 fs/efivarfs/inode.c                       |  2 +-
 fs/efs/inode.c                            |  5 +-
 fs/erofs/inode.c                          | 16 +++---
 fs/exfat/file.c                           |  4 +-
 fs/exfat/inode.c                          |  6 +--
 fs/exfat/namei.c                          | 29 +++++-----
 fs/exfat/super.c                          |  4 +-
 fs/ext2/acl.c                             |  2 +-
 fs/ext2/dir.c                             |  6 +--
 fs/ext2/ialloc.c                          |  2 +-
 fs/ext2/inode.c                           | 11 ++--
 fs/ext2/ioctl.c                           |  4 +-
 fs/ext2/namei.c                           |  8 +--
 fs/ext2/super.c                           |  2 +-
 fs/ext2/xattr.c                           |  2 +-
 fs/ext4/acl.c                             |  2 +-
 fs/ext4/ext4.h                            | 20 +++++++
 fs/ext4/extents.c                         | 12 ++---
 fs/ext4/ialloc.c                          |  2 +-
 fs/ext4/inline.c                          |  4 +-
 fs/ext4/inode.c                           | 16 +++---
 fs/ext4/ioctl.c                           |  9 ++--
 fs/ext4/namei.c                           | 26 +++++----
 fs/ext4/super.c                           |  2 +-
 fs/ext4/xattr.c                           |  6 +--
 fs/f2fs/dir.c                             |  8 +--
 fs/f2fs/f2fs.h                            |  5 +-
 fs/f2fs/file.c                            | 16 +++---
 fs/f2fs/inline.c                          |  2 +-
 fs/f2fs/inode.c                           | 10 ++--
 fs/f2fs/namei.c                           | 12 ++---
 fs/f2fs/recovery.c                        |  4 +-
 fs/f2fs/super.c                           |  2 +-
 fs/f2fs/xattr.c                           |  2 +-
 fs/fat/inode.c                            |  8 +--
 fs/fat/misc.c                             |  7 ++-
 fs/freevxfs/vxfs_inode.c                  |  4 +-
 fs/fuse/control.c                         |  2 +-
 fs/fuse/dir.c                             |  8 +--
 fs/fuse/inode.c                           | 18 ++++---
 fs/gfs2/acl.c                             |  2 +-
 fs/gfs2/bmap.c                            | 11 ++--
 fs/gfs2/dir.c                             | 15 +++---
 fs/gfs2/file.c                            |  2 +-
 fs/gfs2/glops.c                           |  4 +-
 fs/gfs2/inode.c                           |  8 +--
 fs/gfs2/super.c                           |  4 +-
 fs/gfs2/xattr.c                           |  8 +--
 fs/hfs/catalog.c                          |  8 +--
 fs/hfs/dir.c                              |  2 +-
 fs/hfs/inode.c                            | 13 +++--
 fs/hfs/sysdep.c                           |  2 +-
 fs/hfsplus/catalog.c                      |  8 +--
 fs/hfsplus/dir.c                          |  6 +--
 fs/hfsplus/inode.c                        | 14 ++---
 fs/hostfs/hostfs_kern.c                   |  4 +-
 fs/hpfs/dir.c                             |  8 +--
 fs/hpfs/inode.c                           |  6 +--
 fs/hpfs/namei.c                           | 26 +++++----
 fs/hpfs/super.c                           |  5 +-
 fs/hugetlbfs/inode.c                      | 12 ++---
 fs/inode.c                                | 26 +++++++--
 fs/isofs/inode.c                          |  4 +-
 fs/isofs/rock.c                           | 16 +++---
 fs/jffs2/dir.c                            | 19 +++----
 fs/jffs2/file.c                           |  3 +-
 fs/jffs2/fs.c                             | 10 ++--
 fs/jffs2/os-linux.h                       |  2 +-
 fs/jfs/acl.c                              |  2 +-
 fs/jfs/inode.c                            |  2 +-
 fs/jfs/ioctl.c                            |  2 +-
 fs/jfs/jfs_imap.c                         |  8 +--
 fs/jfs/jfs_inode.c                        |  4 +-
 fs/jfs/namei.c                            | 25 ++++-----
 fs/jfs/super.c                            |  2 +-
 fs/jfs/xattr.c                            |  2 +-
 fs/kernfs/inode.c                         |  4 +-
 fs/libfs.c                                | 32 +++++------
 fs/minix/bitmap.c                         |  2 +-
 fs/minix/dir.c                            |  6 +--
 fs/minix/inode.c                          | 11 ++--
 fs/minix/itree_common.c                   |  4 +-
 fs/minix/namei.c                          |  6 +--
 fs/nfs/callback_proc.c                    |  2 +-
 fs/nfs/fscache.h                          |  4 +-
 fs/nfs/inode.c                            | 21 ++++----
 fs/nfsd/nfsctl.c                          |  2 +-
 fs/nfsd/vfs.c                             |  2 +-
 fs/nilfs2/dir.c                           |  6 +--
 fs/nilfs2/inode.c                         | 12 ++---
 fs/nilfs2/ioctl.c                         |  2 +-
 fs/nilfs2/namei.c                         |  8 +--
 fs/nsfs.c                                 |  2 +-
 fs/ntfs/inode.c                           | 15 +++---
 fs/ntfs/mft.c                             |  3 +-
 fs/ntfs3/file.c                           |  6 +--
 fs/ntfs3/frecord.c                        |  4 +-
 fs/ntfs3/inode.c                          | 14 ++---
 fs/ntfs3/namei.c                          | 10 ++--
 fs/ntfs3/xattr.c                          |  4 +-
 fs/ocfs2/acl.c                            |  6 +--
 fs/ocfs2/alloc.c                          |  6 +--
 fs/ocfs2/aops.c                           |  2 +-
 fs/ocfs2/dir.c                            |  8 +--
 fs/ocfs2/dlmfs/dlmfs.c                    |  4 +-
 fs/ocfs2/dlmglue.c                        | 10 ++--
 fs/ocfs2/file.c                           | 16 +++---
 fs/ocfs2/inode.c                          | 14 ++---
 fs/ocfs2/move_extents.c                   |  6 +--
 fs/ocfs2/namei.c                          | 22 ++++----
 fs/ocfs2/refcounttree.c                   | 14 ++---
 fs/ocfs2/xattr.c                          |  6 +--
 fs/omfs/dir.c                             |  4 +-
 fs/omfs/inode.c                           | 10 ++--
 fs/openpromfs/inode.c                     |  4 +-
 fs/orangefs/namei.c                       |  2 +-
 fs/orangefs/orangefs-utils.c              |  6 +--
 fs/overlayfs/file.c                       |  7 ++-
 fs/overlayfs/util.c                       |  2 +-
 fs/pipe.c                                 |  2 +-
 fs/posix_acl.c                            |  2 +-
 fs/proc/base.c                            |  2 +-
 fs/proc/inode.c                           |  2 +-
 fs/proc/proc_sysctl.c                     |  2 +-
 fs/proc/self.c                            |  2 +-
 fs/proc/thread_self.c                     |  2 +-
 fs/pstore/inode.c                         |  4 +-
 fs/qnx4/inode.c                           |  4 +-
 fs/qnx6/inode.c                           |  4 +-
 fs/ramfs/inode.c                          |  6 +--
 fs/reiserfs/inode.c                       | 14 ++---
 fs/reiserfs/ioctl.c                       |  4 +-
 fs/reiserfs/namei.c                       | 21 ++++----
 fs/reiserfs/stree.c                       |  4 +-
 fs/reiserfs/super.c                       |  2 +-
 fs/reiserfs/xattr.c                       |  5 +-
 fs/reiserfs/xattr_acl.c                   |  2 +-
 fs/romfs/super.c                          |  4 +-
 fs/smb/client/file.c                      |  4 +-
 fs/smb/client/fscache.h                   |  5 +-
 fs/smb/client/inode.c                     | 15 +++---
 fs/smb/client/smb2ops.c                   |  2 +-
 fs/smb/server/smb2pdu.c                   |  8 +--
 fs/squashfs/inode.c                       |  2 +-
 fs/stack.c                                |  2 +-
 fs/stat.c                                 |  2 +-
 fs/sysv/dir.c                             |  6 +--
 fs/sysv/ialloc.c                          |  2 +-
 fs/sysv/inode.c                           |  6 +--
 fs/sysv/itree.c                           |  4 +-
 fs/sysv/namei.c                           |  6 +--
 fs/tracefs/inode.c                        |  2 +-
 fs/ubifs/debug.c                          |  4 +-
 fs/ubifs/dir.c                            | 39 +++++++-------
 fs/ubifs/file.c                           | 16 +++---
 fs/ubifs/ioctl.c                          |  2 +-
 fs/ubifs/journal.c                        |  4 +-
 fs/ubifs/super.c                          |  4 +-
 fs/ubifs/xattr.c                          |  6 +--
 fs/udf/ialloc.c                           |  2 +-
 fs/udf/inode.c                            | 17 +++---
 fs/udf/namei.c                            | 24 ++++-----
 fs/ufs/dir.c                              |  6 +--
 fs/ufs/ialloc.c                           |  2 +-
 fs/ufs/inode.c                            | 23 ++++----
 fs/ufs/namei.c                            |  8 +--
 fs/vboxsf/utils.c                         |  4 +-
 fs/xfs/libxfs/xfs_inode_buf.c             |  4 +-
 fs/xfs/libxfs/xfs_trans_inode.c           |  2 +-
 fs/xfs/xfs_acl.c                          |  2 +-
 fs/xfs/xfs_bmap_util.c                    |  6 ++-
 fs/xfs/xfs_inode.c                        |  2 +-
 fs/xfs/xfs_inode_item.c                   |  2 +-
 fs/xfs/xfs_iops.c                         |  4 +-
 fs/xfs/xfs_itable.c                       |  4 +-
 fs/zonefs/super.c                         |  8 +--
 include/linux/fs.h                        | 55 ++++++++++++++++++-
 include/linux/fs_stack.h                  |  2 +-
 ipc/mqueue.c                              | 20 ++++---
 kernel/bpf/inode.c                        |  4 +-
 mm/shmem.c                                | 28 +++++-----
 net/sunrpc/rpc_pipe.c                     |  2 +-
 security/apparmor/apparmorfs.c            |  6 +--
 security/apparmor/policy_unpack.c         |  4 +-
 security/inode.c                          |  2 +-
 security/selinux/selinuxfs.c              |  2 +-
 233 files changed, 914 insertions(+), 808 deletions(-)

-- 
2.41.0

