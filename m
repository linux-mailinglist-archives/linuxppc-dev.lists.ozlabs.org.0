Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 369457B299B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 02:34:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T1EG9wCs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxWYw0BV7z3dKT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 10:34:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T1EG9wCs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jlayton@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxKdB2K0dz2xFl;
	Fri, 29 Sep 2023 03:06:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A10FF61D47;
	Thu, 28 Sep 2023 17:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B31C433C8;
	Thu, 28 Sep 2023 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695920779;
	bh=DNM/VlOuUT51G0bnMvXw+94sqfHee3c68K5vLwQuau4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=T1EG9wCsmdavqbCDgZQmRYDY2hTjqQ8HvqU7HakqZRoba0+m8x7Xb0PPxNH54fTbK
	 gxOvKBrhR/NUHAqOFYLgQFvCS4fbqqpdpyJ0meCz+VJBZB5WwUDXaofxixCnDwGA2b
	 xVhvTR3lvjwhcUNCr4cL+zM4prum42dBj/EqssN3wQ5xwZohTtnO5wenm4djJ5rTsg
	 au+O/I2DWLjGqSGQ9+pJFDrXNkgJ5uSZlH8zfxoOHymWjEqjSumVZbYplcXqZfm3+f
	 KDfZ0aAr31be94G8szYCClaMWLFdZEYGpG76Y3w4tHoT3E7mgxWznMj5HFQTi8O+xa
	 SaKUjb/2UX2Ww==
Message-ID: <af047e4a1c6947c59d4a13d4ae221c784a5386b4.camel@kernel.org>
Subject: Re: [PATCH 86/87] fs: switch timespec64 fields in inode to discrete
 integers
From: Jeff Layton <jlayton@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
  Christian Brauner <brauner@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, David Sterba <dsterba@suse.cz>, Amir
 Goldstein <amir73il@gmail.com>, Theodore Ts'o <tytso@mit.edu>,  "Eric W.
 Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Jeremy Kerr <jk@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Todd Kjos
 <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes
 <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, Suren
 Baghdasaryan <surenb@google.com>, Mattia Dongili <malattia@linux.it>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason
 Gunthorpe <jgg@ziepe.ca>,  Leon Romanovsky <leon@kernel.org>, Brad Warrum
 <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>, Hans de
 Goede <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Mark Gross <markgross@kernel.org>, Jiri
 Slaby <jirislaby@kernel.org>, Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet
 <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>, Marc
 Dionne <marc.dionne@auristor.com>,  Ian Kent <raven@themaw.net>, Luis de
 Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,  Chris Mason
 <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, Xiubo Li
 <xiubli@redhat.com>,  Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Joel Becker <jlbec@evilplan.org>,
 Christoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Gao Xiang
 <xiang@kernel.org>, Chao Yu <chao@kernel.org>,  Yue Hu
 <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara
 <jack@suse.com>, Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim
 <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Christoph Hellwig <hch@infradead.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Bob Peterson <rpeterso@redhat.com>, Andreas Gruenbacher
 <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Mikulas Patocka
 <mikulas@artax.karlin.mff.cuni.cz>,  Mike Kravetz
 <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>, Jan Kara
 <jack@suse.cz>,  David Woodhouse <dwmw2@infradead.org>, Dave Kleikamp
 <shaggy@kernel.org>, Tejun Heo <tj@kernel.org>, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, Chuck
 Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>, Olga
 Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey
 <tom@talpey.com>,  Ryusuke Konishi <konishi.ryusuke@gmail.com>, Anton
 Altaparmakov <anton@tuxera.com>, Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, Bob Copeland <me@bobcopeland.com>,
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
 <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin
 <yzaikin@google.com>, Tony Luck <tony.luck@intel.com>,  "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Anders Larsen <al@alarsen.net>, Steve
 French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>, Ronnie
 Sahlberg <lsahlber@redhat.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Phillip Lougher
 <phillip@squashfs.org.uk>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Evgeniy Dushistov <dushistov@mail.ru>,
 Chandan Babu R <chandan.babu@oracle.com>, "Darrick J. Wong"
 <djwong@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota
 <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,  Hugh Dickins
 <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, John Johansen
 <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James
 Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen
 Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>
Date: Thu, 28 Sep 2023 13:06:03 -0400
In-Reply-To: <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
References: <20230928110554.34758-1-jlayton@kernel.org>
	 <20230928110554.34758-2-jlayton@kernel.org>
	 <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
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
Cc: jfs-discussion@lists.sourceforge.net, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, linux-afs@lists.infradead.org, linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, linux-rdma@vger.kernel.org, linux-unionfs@vger.kernel.org, codalist@coda.cs.cmu.edu, linux-serial@vger.kernel.org, linux-ext4@vger.kernel.org, devel@lists.orangefs.org, linux-trace-kernel@vger.kernel.org, linux-cifs@vger.kernel.org, selinux@vger.kernel.org, apparmor@lists.ubuntu.com, autofs@vger.kernel.org, linux-um@lists.infradead.org, reiserfs-devel@vger.kernel.org, ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, v9fs@lists.linux.dev, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.
 org, linux-security-module@vger.kernel.org, Netdev <netdev@vger.kernel.org>, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-09-28 at 11:48 -0400, Arnd Bergmann wrote:
> On Thu, Sep 28, 2023, at 07:05, Jeff Layton wrote:
> > This shaves 8 bytes off struct inode, according to pahole.
> >=20
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
>=20
> FWIW, this is similar to the approach that Deepa suggested
> back in 2016:
>=20
> https://lore.kernel.org/lkml/1452144972-15802-3-git-send-email-deepa.kern=
el@gmail.com/
>=20
> It was NaKed at the time because of the added complexity,
> though it would have been much easier to do it then,
> as we had to touch all the timespec references anyway.
>=20
> The approach still seems ok to me, but I'm not sure it's worth
> doing it now if we didn't do it then.
>=20

I remember seeing those patches go by. I don't remember that change
being NaK'ed, but I wasn't paying close attention at the time=20

Looking at it objectively now, I think it's worth it to recover 8 bytes
per inode and open a 4 byte hole that Amir can use to grow the
i_fsnotify_mask. We might even able to shave off another 12 bytes
eventually if we can move to a single 64-bit word per timestamp.=20

It is a lot of churn though.
--=20
Jeff Layton <jlayton@kernel.org>
