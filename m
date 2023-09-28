Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 506877B299F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 02:36:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pt2knsyP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxWcm1ZQtz3dmk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 10:36:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pt2knsyP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jlayton@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxLPQ4DxMz3cTd;
	Fri, 29 Sep 2023 03:41:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B374B61D44;
	Thu, 28 Sep 2023 17:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74F5C433C7;
	Thu, 28 Sep 2023 17:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695922871;
	bh=q4Y+iRhQNw28trXDtNOjgA21Uv+IbPAACk59LAWJmZQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Pt2knsyPVF5IN2LrEHFDhKXAMR+bUOcTlyAAG093ma8ffe9kH/u7HXG2g+Td0GQbU
	 dj6xCSvBaMeN3dkuuuxcxsY6aAAFekfxMF19xWrooSEMrmsfY/FrKOmIr30Ef9iwhy
	 6QfDCUZqE6k5rEywc5Ze8K4/SAUL1W/1QDmSbwueKYxqX2aaIVxDcPqg/lhskw8rFh
	 jOw/ARPQHq26NmwE3QZN+kwE0QI6+60XvzrrVfZo0ayZcNh/tBcZ410YuqL9+lmQQb
	 qZZexkDUvIABncMcV2ChnF/ASLiH8NqVr7NTUG7D+At/G4u0PnSWIbaDK60vBHhtw8
	 vViGtl0HWhtVQ==
Message-ID: <6a6f37d16b55a3003af3f3dbb7778a367f68cd8d.camel@kernel.org>
Subject: Re: [PATCH 86/87] fs: switch timespec64 fields in inode to discrete
 integers
From: Jeff Layton <jlayton@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Thu, 28 Sep 2023 13:40:55 -0400
In-Reply-To: <20230928171943.GK11439@frogsfrogsfrogs>
References: <20230928110554.34758-1-jlayton@kernel.org>
	 <20230928110554.34758-2-jlayton@kernel.org>
	 <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
	 <af047e4a1c6947c59d4a13d4ae221c784a5386b4.camel@kernel.org>
	 <20230928171943.GK11439@frogsfrogsfrogs>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 29 Sep 2023 10:31:49 +1000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Hugh Dickins <hughd@google.com>, Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>, Andrii Nakryiko <andrii@kernel.org>, Mattia Dongili <malattia@linux.it>, John Johansen <john.johansen@canonical.com>, Yonghong Song <yonghong.song@linux.dev>, Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>, Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>, linux-xfs@vger.kernel.org, James Morris <jmorris@namei.org>, Christoph Hellwig <hch@infradead.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Eric Van Hensbergen <ericvh@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman
  <gregkh@linuxfoundation.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Chuck Lever <chuck.lever@oracle.com>, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>, linux-mm@kvack.org, Joel Fernandes <joel@joelfernandes.org>, Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>, linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, codalist@coda.cs.cmu.edu, Iurii Zaikin <yzaikin@google.c
 om>, Namjae Jeon <linkinjeon@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Todd Kjos <tkjos@android.com>, Vasily Gorbik <gor@linux.ibm.com>, selinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>, Yue Hu <huyue2@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Martijn Coenen <maco@android.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>, Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net, Muchun Song <muchun.song@linux.dev>, linux-f2fs-devel@lists.sourceforge.net, "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, gfs2@lists.linux.dev, "Eric W.
 Biederman" <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>, Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>, linux-efi@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>, ocfs2-devel@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>, platform-driver-x86@vger.kernel.org, Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, Marc Dionne <marc.dionne@auristor.com>, Jiri Slaby <jirislaby@kernel.org>, linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro.aota@wdc.com>, Daniel Borkmann <daniel@iogearbox.net>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, coda@cs.cmu.edu, Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>, "Serge
 E. Hallyn" <serge@hallyn.com>, Christian Schoenebeck <linux_oss@crudebyte.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Mark Gross <markgross@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>, Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Song Liu <song@kernel.org>, samba-technical@lists.samba.org, Steve French <sfrench@samba.org>, Jeremy Kerr <jk@ozlabs.org>, Netdev <netdev@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, Chandan Babu R <chandan.babu@oracle.com>, jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>, Neil Brown <neilb@suse.de>, Dominique Martinet <asm
 adeus@codewreck.org>, Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>, linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>, Andreas Dilger <adilger.kernel@dilger.ca>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Ard Biesheuvel <ardb@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>, Dai Ngo <Dai.Ngo@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Salah Triki <salah.triki@gmail.com>, Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Chao Yu <chao@kernel.org>, apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>, Hans de Goede <hdegoede@redhat.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Dav
 id Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Johannes Thumshirn <jth@kernel.org>, Ritu Agarwal <rituagar@linux.ibm.com>, Luis de Bethencourt <luisbg@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, v9fs@lists.linux.dev, David Sterba <dsterba@suse.cz>, linux-security-module@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>, Phillip Lougher <phillip@squashfs.org.uk>, Johannes Berg <johannes@sipsolutions.net>, Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-09-28 at 10:19 -0700, Darrick J. Wong wrote:
> On Thu, Sep 28, 2023 at 01:06:03PM -0400, Jeff Layton wrote:
> > On Thu, 2023-09-28 at 11:48 -0400, Arnd Bergmann wrote:
> > > On Thu, Sep 28, 2023, at 07:05, Jeff Layton wrote:
> > > > This shaves 8 bytes off struct inode, according to pahole.
> > > >=20
> > > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > >=20
> > > FWIW, this is similar to the approach that Deepa suggested
> > > back in 2016:
> > >=20
> > > https://lore.kernel.org/lkml/1452144972-15802-3-git-send-email-deepa.=
kernel@gmail.com/
> > >=20
> > > It was NaKed at the time because of the added complexity,
> > > though it would have been much easier to do it then,
> > > as we had to touch all the timespec references anyway.
> > >=20
> > > The approach still seems ok to me, but I'm not sure it's worth
> > > doing it now if we didn't do it then.
> > >=20
> >=20
> > I remember seeing those patches go by. I don't remember that change
> > being NaK'ed, but I wasn't paying close attention at the time=20
> >=20
> > Looking at it objectively now, I think it's worth it to recover 8 bytes
> > per inode and open a 4 byte hole that Amir can use to grow the
> > i_fsnotify_mask. We might even able to shave off another 12 bytes
> > eventually if we can move to a single 64-bit word per timestamp.=20
>=20
> I don't think you can, since btrfs timestamps utilize s64 seconds
> counting in both directions from the Unix epoch.  They also support ns
> resolution:
>=20
> 	struct btrfs_timespec {
> 		__le64 sec;
> 		__le32 nsec;
> 	} __attribute__ ((__packed__));
>=20

Correct. We'd lose some fidelity in currently stored timestamps, but as
Linus and Ted pointed out, anything below ~100ns granularity is
effectively just noise, as that's the floor overhead for calling into
the kernel. It's hard to argue that any application needs that sort of
timestamp resolution, at least with contemporary hardware.=20

Doing that would mean that tests that store specific values in the
atime/mtime and expect to be able to fetch exactly that value back would
break though, so we'd have to be OK with that if we want to try it. The
good news is that it's relatively easy to experiment with new ways to
store timestamps with these wrappers in place.

--=20
Jeff Layton <jlayton@kernel.org>
