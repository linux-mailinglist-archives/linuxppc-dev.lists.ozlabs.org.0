Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0933278D29C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 05:57:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=C+B8K/E0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rb9VY5lcqz3c2n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 13:57:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=C+B8K/E0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rb4lL0WBBz2yKy;
	Wed, 30 Aug 2023 10:23:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zZxZUyqerb7julFXQ03Jti/01WDk420m8vSi4C3S7Zg=; b=C+B8K/E0jwmlP3x0ynEg/wW0oT
	8W+g7CEhf7EdCVJx+aCWMaLZ8rDm21ORLwQNEzBBlnKI8nSnQEIfBUqrKOBnjUNllXW768GzG3qB7
	+cpJ/jhntfWbFQ/3QFzCMkG1sg2st+PpzLnPrKtYydQR6EDaMR8Bc+aEbQhcPGU53TF4NXxBCLwrJ
	Y+Cse/dfbORxx77QJVsCQ4BCKysmxvXtFDzxb882a/rtaocFDwQw24nZDPRB3CytP/MOuWTM+mTfa
	+8MJ/m4rwupUEXN1Mh5oBPLgZehFHGmgz56mU9Gh95pn90zVDOFdIxrpzwqUqcKtUFnurzTC7a4a3
	phr8qPBQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qb8vV-001xXV-0L;
	Wed, 30 Aug 2023 00:19:17 +0000
Date: Wed, 30 Aug 2023 01:19:17 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v2 08/92] fs: new helper: simple_rename_timestamp
Message-ID: <20230830001917.GC461907@ZenIV>
References: <20230705185812.579118-1-jlayton@kernel.org>
 <20230705185812.579118-3-jlayton@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705185812.579118-3-jlayton@kernel.org>
X-Mailman-Approved-At: Wed, 30 Aug 2023 13:57:00 +1000
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
Cc: lucho@ionkov.net, rafael@kernel.org, djwong@kernel.org, al@alarsen.net, cmllamas@google.com, andrii@kernel.org, hughd@google.com, john.johansen@canonical.com, agordeev@linux.ibm.com, hch@lst.de, hubcap@omnibond.com, pc@manguebit.com, linux-xfs@vger.kernel.org, bvanassche@acm.org, jeffxu@chromium.org, john@keeping.me.uk, yi.zhang@huawei.com, jmorris@namei.org, code@tyhicks.com, stern@rowland.harvard.edu, borntraeger@linux.ibm.com, devel@lists.orangefs.org, mirimmad17@gmail.com, sprasad@microsoft.com, jaharkes@cs.cmu.edu, linux-um@lists.infradead.org, npiggin@gmail.com, jlbec@evilplan.org, ericvh@kernel.org, surenb@google.com, trond.myklebust@hammerspace.com, anton@tuxera.com, brauner@kernel.org, wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org, stephen.smalley.work@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, lsahlber@redhat.com, senozhatsky@chromium.org, arve@android.com, chuck.lever@oracle.com, svens@linux.ibm.com, jolsa@kernel.org, jack@suse.c
 om, tj@kernel.org, akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, xu.xin16@zte.com.cn, shaggy@kernel.org, dhavale@google.com, penguin-kernel@i-love.sakura.ne.jp, zohar@linux.ibm.com, linux-mm@kvack.org, joel@joelfernandes.org, edumazet@google.com, sdf@google.com, jomajm@gmail.com, linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, paul@paul-moore.com, leon@kernel.org, john.fastabend@gmail.com, mcgrof@kernel.org, chi.minghao@zte.com.cn, codalist@coda.cs.cmu.edu, selinux@vger.kernel.org, zhangpeng362@huawei.com, quic_ugoswami@quicinc.com, yhs@fb.com, yzaikin@google.com, linkinjeon@kernel.org, mhiramat@kernel.org, ecryptfs@vger.kernel.org, tkjos@android.com, madkar@cs.stonybrook.edu, gor@linux.ibm.com, yuzhe@nfschina.com, linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org, miklos@szeredi.hu, huyue2@coolpad.com, jaegeuk@kernel.org, gargaditya08@live.com, maco@android.com, hirofumi@mail.parknet.co.jp, haoluo@google.com, tony.luck@intel.com, tytso@mit.edu,
  nico@fluxnic.net, linux-ntfs-dev@lists.sourceforge.net, muchun.song@linux.dev, roberto.sassu@huawei.com, linux-f2fs-devel@lists.sourceforge.net, yang.yang29@zte.com.cn, gpiccoli@igalia.com, ebiederm@xmission.com, anna@kernel.org, quic_uaggarwa@quicinc.com, bwarrum@linux.ibm.com, mike.kravetz@oracle.com, jingyuwang_vip@163.com, linux-efi@vger.kernel.org, error27@gmail.com, martin@omnibond.com, trix@redhat.com, ocfs2-devel@lists.linux.dev, ast@kernel.org, sebastian.reichel@collabora.com, clm@fb.com, linux-mtd@lists.infradead.org, willy@infradead.org, marc.dionne@auristor.com, linux-afs@lists.infradead.org, raven@themaw.net, naohiro.aota@wdc.com, daniel@iogearbox.net, dennis.dalessandro@cornelisnetworks.com, linux-rdma@vger.kernel.org, quic_linyyuan@quicinc.com, coda@cs.cmu.edu, slava@dubeyko.com, idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com, serge@hallyn.com, chengzhihao1@huawei.com, axboe@kernel.dk, amir73il@gmail.com, linuszeng@tencent.com, keescook@chromium.org, arnd
 @arndb.de, autofs@vger.kernel.org, rostedt@goodmis.org, yifeliu@cs.stonybrook.edu, dlemoal@kernel.org, eparis@parisplace.org, ceph-devel@vger.kernel.org, xiang@kernel.org, yijiangshan@kylinos.cn, dhowells@redhat.com, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, kolga@netapp.com, song@kernel.org, samba-technical@lists.samba.org, sfrench@samba.org, jk@ozlabs.org, netdev@vger.kernel.org, rpeterso@redhat.com, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, davem@davemloft.net, jfs-discussion@lists.sourceforge.net, princekumarmaurya06@gmail.com, ebiggers@google.com, neilb@suse.de, asmadeus@codewreck.org, linux_oss@crudebyte.com, me@bobcopeland.com, kpsingh@kernel.org, okanatov@gmail.com, almaz.alexandrovich@paragon-software.com, joseph.qi@linux.alibaba.com, hayama@lineo.co.jp, adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz, shaozhengchao@huawei.com, chenzhongjin@huawei.com, ardb@kernel.org, anton.ivanov@cambri
 dgegreys.com, agruenba@redhat.com, richard@nod.at, mark@fasheh.com, shr@devkernel.io, Dai.Ngo@oracle.com, cluster-devel@redhat.com, jgg@ziepe.ca, kuba@kernel.org, riel@surriel.com, salah.triki@gmail.com, dushistov@mail.ru, linux-cifs@vger.kernel.org, hca@linux.ibm.com, chao@kernel.org, apparmor@lists.ubuntu.com, josef@toxicpanda.com, Liam.Howlett@oracle.com, tom@talpey.com, hdegoede@redhat.com, linux-hardening@vger.kernel.org, aivazian.tigran@gmail.com, dchinner@redhat.com, dsterba@suse.com, xiubli@redhat.com, konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org, rituagar@linux.ibm.com, luisbg@kernel.org, martin.lau@linux.dev, v9fs@lists.linux.dev, fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org, lrh2000@pku.edu.cn, linux-security-module@vger.kernel.org, ezk@cs.stonybrook.edu, jefflexu@linux.alibaba.com, linux@treblig.org, hannes@cmpxchg.org, phillip@squashfs.org.uk, johannes@sipsolutions.net, sj1557.seo@samsung.com, dwmw2@infradead.org, linux-karma-devel@lists.sourcefo
 rge.net, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 05, 2023 at 02:58:11PM -0400, Jeff Layton wrote:

> + * POSIX mandates that the old and new parent directories have their ctime and
> + * mtime updated, and that inodes of @old_dentry and @new_dentry (if any), have
> + * their ctime updated.

APPLICATION USAGE
Some implementations mark for update the last file status change timestamp
of renamed files and some do not. Applications which make use of the
last file status change timestamp may behave differently with respect
to renamed files unless they are designed to allow for either behavior.

So for children POSIX permits rather than mandates.  Doesn't really matter;
Linux behaviour had been to touch ctime on children since way back, if
not since the very beginning.
