Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CD873C302
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 23:41:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=apfm6xvo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnrKH1ywCz3bt5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 07:41:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=apfm6xvo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QncMV623vz3bpl;
	Fri, 23 Jun 2023 22:42:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7570161A22;
	Fri, 23 Jun 2023 12:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB4BC433C8;
	Fri, 23 Jun 2023 12:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687524146;
	bh=ljQRDIRYG4TydFhjD0LuSn8BREerPmb4Ipkpa2QAq6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=apfm6xvoeO6UvUfxPwNSOl0FaLWJ7ShkzzPeuSOb0bank70626+jFCCnlqxUCd2NX
	 mV+Eb3SlbyeKtShM0cPnGoccCVrProiQPYgaM4HyeW5epsbNbu8US+O9nrIP4r+ghW
	 Y8FmG2CVOdPNZ1eNovI71PsOzsGS/p5EOkEcjtA4zTWfFdhpQkNKBq1hEMuzxsWytK
	 w9zTBeB4xmhiyjllhLtRaoNC8lgBTTH19xNIsLsgb+18yFVUlxxLoSku7XQ5A1i1lR
	 WF4IRekFC21BVGIj1AxyqNGVCxMph3jwY74VjiaGchsSc5v31PlBNGYvRkbk2aFmu+
	 9KQZIm3JpdS0g==
Date: Fri, 23 Jun 2023 14:41:42 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 00/79] fs: new accessors for inode->i_ctime
Message-ID: <20230623-wegelagerei-kanzlei-45cdcf5da157@brauner>
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621152141.5961cf5f@gandalf.local.home>
 <2a5a069572b46b59dd16fe8d54e549a9b5bbb6eb.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a5a069572b46b59dd16fe8d54e549a9b5bbb6eb.camel@kernel.org>
X-Mailman-Approved-At: Sat, 24 Jun 2023 07:40:38 +1000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, "Rafael J. Wysocki" <rafael@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>, Andrii Nakryiko <andrii@kernel.org>, Hugh Dickins <hughd@google.com>, John Johansen <john.johansen@canonical.com>, Seth Forshee <sforshee@digitalocean.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>, Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>, linux-xfs@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>, John Keeping <john@keeping.me.uk>, Zhang Yi <yi.zhang@huawei.com>, James Morris <jmorris@namei.org>, Tyler Hicks <code@tyhicks.com>, Alan Stern <stern@rowland.harvard.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Joel Becker <jlbec@evilplan.org>, Eric Van Hen
 sbergen <ericvh@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anton Altaparmakov <anton@tuxera.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Dave Kleikamp <shaggy@kernel.org>, Sandeep Dhavale <dhavale@google.com>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Mimi Zohar <zohar@linux.ibm.com>, linux-mm@kvack.org, Joel Fernandes <joel@joelfernandes.org>, Eric Dumazet <edumaz
 et@google.com>, Stanislav Fomichev <sdf@google.com>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Hangyu Hua <hbh25y@gmail.com>, linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, Minghao Chi <chi.minghao@zte.com.cn>, codalist@coda.cs.cmu.edu, selinux@vger.kernel.org, ZhangPeng <zhangpeng362@huawei.com>, Udipto Goswami <quic_ugoswami@quicinc.com>, Yonghong Song <yhs@fb.com>, Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, ecryptfs@vger.kernel.org, Todd Kjos <tkjos@android.com>, Vasily Gorbik <gor@linux.ibm.com>, Yu Zhe <yuzhe@nfschina.com>, linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>, Yue Hu <huyue2@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Aditya Garg <gargaditya08@live.com>, Martijn Coe
 nen <maco@android.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>, Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net, Muchun Song <muchun.song@linux.dev>, Roberto Sassu <roberto.sassu@huawei.com>, linux-f2fs-devel@lists.sourceforge.net, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Jozef Martiniak <jomajm@gmail.com>, Eric Biederman <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>, xu xin <cgel.zte@gmail.com>, Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>, Jingyu Wang <jingyuwang_vip@163.com>, linux-efi@vger.kernel.org, Dan Carpenter <error27@gmail.com>, Martin Brandenburg <martin@omnibond.com>, Tom Rix <trix@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.o
 rg, Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro.aota@wdc.com>, Daniel Borkmann <daniel@iogearbox.net>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, Linyu Yuan <quic_linyyuan@quicinc.com>, coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>, Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, Zhihao Cheng <chengzhihao1@huawei.com>, Jens Axboe <axboe@kernel.dk>, Zeng Jingxiang <linuszeng@tencent.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Yifei Liu <yifeliu@cs.stonybrook.edu>, Damien Le Moal <dlemoal@kernel.org>, Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>, Jiangshan Yi <yijiangshan@kylinos.cn>, David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Song Liu <song@k
 ernel.org>, samba-technical@lists.samba.org, Steve French <sfrench@samba.org>, Jeremy Kerr <jk@ozlabs.org>, netdev@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>, Oleg Kanatov <okanatov@gmail.com>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Joseph Qi <joseph.qi@linux.alibaba.com>, Yuta Hayama <hayama@lineo.co.jp>, Andreas Dilger <adilger.kernel@dilger.ca>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Zhengchao Shao <shaozhengchao@huawei.com>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Laurent Pinchart <laure
 nt.pinchart+renesas@ideasonboard.com>, Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>, Stefan Roesch <shr@devkernel.io>, cluster-devel@redhat.com, Jason Gunthorpe <jgg@ziepe.ca>, Jakub Kicinski <kuba@kernel.org>, Rik van Riel <riel@surriel.com>, Salah Triki <salah.triki@gmail.com>, Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Chao Yu <chao@kernel.org>, apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, Tom Talpey <tom@talpey.com>, Hans de Goede <hdegoede@redhat.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Dave Chinner <dchinner@redhat.com>, David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Juergen Gross <jgross@suse.com>, Johannes Thumshirn <jth@kernel.org>, Ritu Agarwal <rituagar@linux.ibm.com>, Luis de Bethencourt <luisbg@kernel.org>, Mar
 tin KaFai Lau <martin.lau@linux.dev>, v9fs@lists.linux.dev, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, linux-unionfs@vger.kernel.org, Ruihan Li <lrh2000@pku.edu.cn>, linux-security-module@vger.kernel.org, Erez Zadok <ezk@cs.stonybrook.edu>, Jeffle Xu <jefflexu@linux.alibaba.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, Johannes Weiner <hannes@cmpxchg.org>, Phillip Lougher <phillip@squashfs.org.uk>, Johannes Berg <johannes@sipsolutions.net>, Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 21, 2023 at 03:52:27PM -0400, Jeff Layton wrote:
> On Wed, 2023-06-21 at 15:21 -0400, Steven Rostedt wrote:
> > On Wed, 21 Jun 2023 10:45:05 -0400
> > Jeff Layton <jlayton@kernel.org> wrote:
> > 
> > > Most of this conversion was done via coccinelle, with a few of the more
> > > non-standard accesses done by hand. There should be no behavioral
> > > changes with this set. That will come later, as we convert individual
> > > filesystems to use multigrain timestamps.
> > 
> > BTW, Linus has suggested to me that whenever a conccinelle script is used,
> > it should be included in the change log.
> > 
> 
> Ok, here's what I have. I note again that my usage of coccinelle is
> pretty primitive, so I ended up doing a fair bit of by-hand fixing after
> applying these.
> 
> Given the way that this change is broken up into 77 patches by
> subsystem, to which changelogs should I add it? I could add it to the
> "infrastructure" patch, but that's the one where I _didn't_ use it. 
> 
> Maybe to patch #79 (the one that renames i_ctime)?

That works. I can also put this into a merge commit or pr message.
