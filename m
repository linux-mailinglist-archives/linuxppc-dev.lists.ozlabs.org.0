Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D04738F18
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:48:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=sc9SdGkV;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PrqwLsXY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXZs5GVHz3d9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:48:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=sc9SdGkV;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PrqwLsXY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=suse.cz (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=jack@suse.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 380 seconds by postgrey-1.37 at boromir; Thu, 22 Jun 2023 02:40:38 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmTlB0cYJz309J;
	Thu, 22 Jun 2023 02:40:37 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0D47B1FF34;
	Wed, 21 Jun 2023 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1687365247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=83XiFVWYz/09+oGN/3WNfR8rOmdHj8dhtkMP8AULWnA=;
	b=sc9SdGkVYpy6qJIOp94C8ZTK7+yexSuiuzBBQMmC044LdrYsGTTopVDpXJpirhT8YYUNwr
	EkZW+2bPiDoUHc1sENxt/GtvO8e+o5cGEB5/qIHjLNWUPiQKx/fex55iHFqqK+cK1B9O2I
	hTcjZhgE/PAahoI8Eyiz/fHdKLMV9RA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1687365247;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=83XiFVWYz/09+oGN/3WNfR8rOmdHj8dhtkMP8AULWnA=;
	b=PrqwLsXYpUHalqAYLIba6BTiYIYYM3iCNT6BT131aBHGuZlOrJnTQ+csCsqt6keBKu3RY2
	7Ndse7BgJBjAHYAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3BAB133E6;
	Wed, 21 Jun 2023 16:34:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YfCPN34mk2S4QgAAMHmgww
	(envelope-from <jack@suse.cz>); Wed, 21 Jun 2023 16:34:06 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 74A08A075D; Wed, 21 Jun 2023 18:34:06 +0200 (CEST)
Date: Wed, 21 Jun 2023 18:34:06 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 01/79] fs: add ctime accessors infrastructure
Message-ID: <20230621163406.udwkxl6tteg6nlcn@quack3>
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621144507.55591-2-jlayton@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621144507.55591-2-jlayton@kernel.org>
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, "Rafael J. Wysocki" <rafael@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>, Andrii Nakryiko <andrii@kernel.org>, Hugh Dickins <hughd@google.com>, John Johansen <john.johansen@canonical.com>, Seth Forshee <sforshee@digitalocean.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>, Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>, linux-xfs@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>, John Keeping <john@keeping.me.uk>, Zhang Yi <yi.zhang@huawei.com>, James Morris <jmorris@namei.org>, Tyler Hicks <code@tyhicks.com>, Alan Stern <stern@rowland.harvard.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Eric Van Hensbergen <ericvh@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Dave Kleikamp <shaggy@kernel.org>, Sandeep Dhavale <dhavale@google.com>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Mimi Zohar <zohar@linux.ibm.com>, linux-mm@kvack.org, Joel Fernandes <joel@joelfernandes.org>, Eric Dumazet <edumazet@
 google.com>, Stanislav Fomichev <sdf@google.com>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Hangyu Hua <hbh25y@gmail.com>, linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, Minghao Chi <chi.minghao@zte.com.cn>, codalist@coda.cs.cmu.edu, selinux@vger.kernel.org, ZhangPeng <zhangpeng362@huawei.com>, Udipto Goswami <quic_ugoswami@quicinc.com>, Yonghong Song <yhs@fb.com>, Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, ecryptfs@vger.kernel.org, Todd Kjos <tkjos@android.com>, Vasily Gorbik <gor@linux.ibm.com>, Yu Zhe <yuzhe@nfschina.com>, linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>, Yue Hu <huyue2@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Aditya Garg <gargaditya08@live.com>, Martijn Coenen <maco@android.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>, Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>, Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net, Muchun Song <muchun.song@linux.dev>, Roberto Sassu <roberto.sassu@huawei.com>, linux-f2fs-devel@lists.sourceforge.net, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Jozef Martiniak <jomajm@gmail.com>, Eric Biederman <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>, xu xin <cgel.zte@gmail.com>, Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>, Jingyu Wang <jingyuwang_vip@163.com>, linux-efi@vger.kernel.org, Dan Carpenter <error27@gmail.com>, Martin Brandenburg <martin@omnibond.com>, Tom Rix <trix@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro
 .aota@wdc.com>, Daniel Borkmann <daniel@iogearbox.net>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, linux-rdma@vger.kernel.org, Linyu Yuan <quic_linyyuan@quicinc.com>, coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>, Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, Zhihao Cheng <chengzhihao1@huawei.com>, Jens Axboe <axboe@kernel.dk>, Zeng Jingxiang <linuszeng@tencent.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Yifei Liu <yifeliu@cs.stonybrook.edu>, Damien Le Moal <dlemoal@kernel.org>, Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>, Jiangshan Yi <yijiangshan@kylinos.cn>, David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Song Liu <song@kernel.org>, samba-technical@lists.samba.org, Steve French <sfrench@samba.org>, Jeremy Kerr <jk@ozlabs.org>, netdev@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>, Oleg Kanatov <okanatov@gmail.com>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Joseph Qi <joseph.qi@linux.alibaba.com>, Yuta Hayama <hayama@lineo.co.jp>, Andreas Dilger <adilger.kernel@dilger.ca>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Zhengchao Shao <shaozhengchao@huawei.com>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <ric
 hard@nod.at>, Mark Fasheh <mark@fasheh.com>, Stefan Roesch <shr@devkernel.io>, cluster-devel@redhat.com, Jason Gunthorpe <jgg@ziepe.ca>, Jakub Kicinski <kuba@kernel.org>, Rik van Riel <riel@surriel.com>, Salah Triki <salah.triki@gmail.com>, Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Chao Yu <chao@kernel.org>, apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, Tom Talpey <tom@talpey.com>, Hans de Goede <hdegoede@redhat.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Dave Chinner <dchinner@redhat.com>, David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Juergen Gross <jgross@suse.com>, Johannes Thumshirn <jth@kernel.org>, Ritu Agarwal <rituagar@linux.ibm.com>, Luis de Bethencourt <luisbg@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, v9fs@lists.linux.dev, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, linux-unionfs@vger.kernel.org, Ruihan Li <lrh2000@pku.edu.cn>, linux-security-module@vger.kernel.org, Erez Zadok <ezk@cs.stonybrook.edu>, Jeffle Xu <jefflexu@linux.alibaba.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, Johannes Weiner <hannes@cmpxchg.org>, Phillip Lougher <phillip@squashfs.org.uk>, Johannes Berg <johannes@sipsolutions.net>, Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 21-06-23 10:45:06, Jeff Layton wrote:
> struct timespec64 has unused bits in the tv_nsec field that can be used
> for other purposes. In future patches, we're going to change how the
> inode->i_ctime is accessed in certain inodes in order to make use of
> them. In order to do that safely though, we'll need to eradicate raw
> accesses of the inode->i_ctime field from the kernel.
> 
> Add new accessor functions for the ctime that we can use to replace them.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c         | 16 ++++++++++++++
>  include/linux/fs.h | 53 +++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index d37fad91c8da..c005e7328fbb 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2499,6 +2499,22 @@ struct timespec64 current_time(struct inode *inode)
>  }
>  EXPORT_SYMBOL(current_time);
>  
> +/**
> + * inode_ctime_set_current - set the ctime to current_time
> + * @inode: inode
> + *
> + * Set the inode->i_ctime to the current value for the inode. Returns
> + * the current value that was assigned to i_ctime.
> + */
> +struct timespec64 inode_ctime_set_current(struct inode *inode)
> +{
> +	struct timespec64 now = current_time(inode);
> +
> +	inode_set_ctime(inode, now);
> +	return now;
> +}
> +EXPORT_SYMBOL(inode_ctime_set_current);
> +
>  /**
>   * in_group_or_capable - check whether caller is CAP_FSETID privileged
>   * @idmap:	idmap of the mount @inode was found from
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 6867512907d6..9afb30606373 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1474,7 +1474,58 @@ static inline bool fsuidgid_has_mapping(struct super_block *sb,
>  	       kgid_has_mapping(fs_userns, kgid);
>  }
>  
> -extern struct timespec64 current_time(struct inode *inode);
> +struct timespec64 current_time(struct inode *inode);
> +struct timespec64 inode_ctime_set_current(struct inode *inode);
> +
> +/**
> + * inode_ctime_peek - fetch the current ctime from the inode
> + * @inode: inode from which to fetch ctime
> + *
> + * Grab the current ctime from the inode and return it.
> + */
> +static inline struct timespec64 inode_ctime_peek(const struct inode *inode)
> +{
> +	return inode->i_ctime;
> +}
> +
> +/**
> + * inode_ctime_set - set the ctime in the inode to the given value
> + * @inode: inode in which to set the ctime
> + * @ts: timespec value to set the ctime
> + *
> + * Set the ctime in @inode to @ts.
> + */
> +static inline struct timespec64 inode_ctime_set(struct inode *inode, struct timespec64 ts)
> +{
> +	inode->i_ctime = ts;
> +	return ts;
> +}
> +
> +/**
> + * inode_ctime_set_sec - set only the tv_sec field in the inode ctime
> + * @inode: inode in which to set the ctime
> + * @sec:  value to set the tv_sec field
> + *
> + * Set the sec field in the ctime. Returns @sec.
> + */
> +static inline time64_t inode_ctime_set_sec(struct inode *inode, time64_t sec)
> +{
> +	inode->i_ctime.tv_sec = sec;
> +	return sec;
> +}
> +
> +/**
> + * inode_ctime_set_nsec - set only the tv_nsec field in the inode ctime
> + * @inode: inode in which to set the ctime
> + * @nsec:  value to set the tv_nsec field
> + *
> + * Set the nsec field in the ctime. Returns @nsec.
> + */
> +static inline long inode_ctime_set_nsec(struct inode *inode, long nsec)
> +{
> +	inode->i_ctime.tv_nsec = nsec;
> +	return nsec;
> +}
>  
>  /*
>   * Snapshotting support.
> -- 
> 2.41.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
