Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 623747B9731
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 00:11:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NqVtdmXP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S185w1JKfz3vfx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 09:11:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NqVtdmXP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jlayton@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S13nH16hdz3c5S;
	Thu,  5 Oct 2023 05:56:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E28BDCE1E77;
	Wed,  4 Oct 2023 18:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675C9C433D9;
	Wed,  4 Oct 2023 18:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696445777;
	bh=iC7KwsOJJL3kT0M8KubHc+xTYSGXLa7gjxgf1YgvBK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NqVtdmXPTE3K9q9deuJTm/G7a71zUKszCFqZsp5GIQNtA7H7/+QIS49PlOMCUfFNJ
	 1ydyxG0x0Zhc5NXKKvQZoNb0pMC2bwR6porAQ3qOkvHn+oCaXipMdg5DIlUK6kK3dJ
	 /qGaNm9SdmE2IDbECVrjFagXBbmQuihBc1Xhxlya1LZKKRDWQwFqYqNeRTG4/PcP8U
	 fjxjbvBWhJKav9Mn2S5Lw52vmEkf02EL+EOCc8xxck+JdDNrgRWXBSojP+3KV6r6+j
	 osY5RvD+bQgIMRf1FSVwxbtgizfCN1brIMaKXTHpZ/pGKsilyXHn7K+ZkEvj2U6B0B
	 tzn7voxPB+lnw==
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Sterba <dsterba@suse.cz>,
	Amir Goldstein <amir73il@gmail.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Jeremy Kerr <jk@ozlabs.org>,
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
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Mattia Dongili <malattia@linux.it>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Brad Warrum <bwarrum@linux.ibm.com>,
	Ritu Agarwal <rituagar@linux.ibm.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	David Sterba <dsterba@suse.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Ian Kent <raven@themaw.net>,
	Luis de Bethencourt <luisbg@kernel.org>,
	Salah Triki <salah.triki@gmail.com>,
	"Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
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
	Ard Biesheuvel <ardb@kernel.org>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Jan Kara <jack@suse.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Christoph Hellwig <hch@infradead.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	Jan Kara <jack@suse.cz>,
	David Woodhouse <dwmw2@infradead.org>,
	Dave Kleikamp <shaggy@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Neil Brown <neilb@suse.de>,
	Olga Kornievskaia <kolga@netapp.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
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
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Evgeniy Dushistov <dushistov@mail.ru>,
	Chandan Babu R <chandan.babu@oracle.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
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
	Kent Overstreet <kent.overstreet@linux.dev>,
	Brian Foster <bfoster@redhat.com>
Subject: [PATCH v2 89/89] fs: move i_generation into new hole created after timestamp conversion
Date: Wed,  4 Oct 2023 14:55:30 -0400
Message-ID: <20231004185530.82088-3-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004185530.82088-1-jlayton@kernel.org>
References: <20231004185530.82088-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Oct 2023 09:05:16 +1100
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
Cc: jfs-discussion@lists.sourceforge.net, linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, linux-afs@lists.infradead.org, linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, linux-rdma@vger.kernel.org, linux-unionfs@vger.kernel.org, codalist@coda.cs.cmu.edu, linux-bcachefs@vger.kernel.org, linux-serial@vger.kernel.org, linux-ext4@vger.kernel.org, devel@lists.orangefs.org, linux-trace-kernel@vger.kernel.org, linux-cifs@vger.kernel.org, selinux@vger.kernel.org, apparmor@lists.ubuntu.com, autofs@vger.kernel.org, linux-um@lists.infradead.org, reiserfs-devel@vger.kernel.org, ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, v9fs@lists.linux.dev, linux-usb@vger.kernel.org, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourcef
 orge.net, linux-xfs@vger.kernel.org, linux-security-module@vger.kernel.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The recent change to use discrete integers instead of struct timespec64
shaved 8 bytes off of struct inode, but it also moves the i_lock
into the previous cacheline, away from the fields that it protects.

Move i_generation above the i_lock, which moves the new 4 byte hole to
just after the i_fsnotify_mask in my setup.

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 485b5e21c8e5..686c9f33e725 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -677,6 +677,7 @@ struct inode {
 	u32			i_atime_nsec;
 	u32			i_mtime_nsec;
 	u32			i_ctime_nsec;
+	u32			i_generation;
 	spinlock_t		i_lock;	/* i_blocks, i_bytes, maybe i_size */
 	unsigned short          i_bytes;
 	u8			i_blkbits;
@@ -733,7 +734,6 @@ struct inode {
 		unsigned		i_dir_seq;
 	};
 
-	__u32			i_generation;
 
 #ifdef CONFIG_FSNOTIFY
 	__u32			i_fsnotify_mask; /* all events this inode cares about */
-- 
2.41.0

