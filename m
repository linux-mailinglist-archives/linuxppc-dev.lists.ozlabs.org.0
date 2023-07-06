Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DD974A75A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:01:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uOgU9evq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxsTH1TSHz3cLx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:01:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uOgU9evq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jlayton@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxhT74G9sz3bqx;
	Fri,  7 Jul 2023 02:15:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F322860EEE;
	Thu,  6 Jul 2023 16:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD63C433C7;
	Thu,  6 Jul 2023 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688660118;
	bh=r5Eqjb/koo4X65bgDBYxDesIkgsRAdhnfATQ4gt2Esk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=uOgU9evq5o16T6L6tpJH1n8YSQl4p50BjR5wiJPLoKkMzHgO7DWjFII6ePLp5KpdE
	 3SlBOVBQ0Ayb1Ck5njyhQkfK/lBmsjOnzq7A/dE1stN3VqJX7pH6IQsgFKtN1DalJo
	 E+zh6oq4S0OPw7rIh8zXpFwi+8/fexgoqLXDvhFUUOG0TWnPj5LM1mmg7dIC7PaCB3
	 IOEyQDVn/tGwcs+s3mZaJELn1kEqbOemjyG66rmihhs9u/EaGnd4WvmH/942idbgOQ
	 fgiPtHR0C+lrv0o8CzKEzOTX/CaJMpmdnCKaL0ZpaSmvJsFgbp9PEliTkXRbGZddzd
	 Fm4yxVau37qTQ==
Message-ID: <3948ae7653d1cb7c51febcca26a35775e71a53b4.camel@kernel.org>
Subject: Re: [PATCH v2 00/89] fs: new accessors for inode->i_ctime
From: Jeff Layton <jlayton@kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Date: Thu, 06 Jul 2023 12:14:58 -0400
In-Reply-To: <87ilaxgjek.fsf@email.froward.int.ebiederm.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
	 <a4e6cfec345487fc9ac8ab814a817c79a61b123a.camel@kernel.org>
	 <87ilaxgjek.fsf@email.froward.int.ebiederm.org>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jul 2023 08:57:20 +1000
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
Cc: lucho@ionkov.net, rafael@kernel.org, djwong@kernel.org, al@alarsen.net, cmllamas@google.com, andrii@kernel.org, hughd@google.com, john.johansen@canonical.com, agordeev@linux.ibm.com, hch@lst.de, hubcap@omnibond.com, pc@manguebit.com, linux-xfs@vger.kernel.org, bvanassche@acm.org, jeffxu@chromium.org, john@keeping.me.uk, yi.zhang@huawei.com, jmorris@namei.org, code@tyhicks.com, stern@rowland.harvard.edu, borntraeger@linux.ibm.com, devel@lists.orangefs.org, mirimmad17@gmail.com, sprasad@microsoft.com, jaharkes@cs.cmu.edu, linux-um@lists.infradead.org, npiggin@gmail.com, viro@zeniv.linux.org.uk, ericvh@kernel.org, surenb@google.com, trond.myklebust@hammerspace.com, anton@tuxera.com, brauner@kernel.org, wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org, stephen.smalley.work@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, lsahlber@redhat.com, senozhatsky@chromium.org, arve@android.com, chuck.lever@oracle.com, svens@linux.ibm.com, jolsa@kernel.org, jack@s
 use.com, tj@kernel.org, akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org, xu.xin16@zte.com.cn, shaggy@kernel.org, dhavale@google.com, penguin-kernel@I-love.SAKURA.ne.jp, zohar@linux.ibm.com, linux-mm@kvack.org, joel@joelfernandes.org, edumazet@google.com, sdf@google.com, jomajm@gmail.com, linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, paul@paul-moore.com, leon@kernel.org, john.fastabend@gmail.com, mcgrof@kernel.org, chi.minghao@zte.com.cn, codalist@coda.cs.cmu.edu, selinux@vger.kernel.org, zhangpeng362@huawei.com, quic_ugoswami@quicinc.com, yhs@fb.com, yzaikin@google.com, linkinjeon@kernel.org, mhiramat@kernel.org, ecryptfs@vger.kernel.org, tkjos@android.com, madkar@cs.stonybrook.edu, gor@linux.ibm.com, yuzhe@nfschina.com, linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org, miklos@szeredi.hu, huyue2@coolpad.com, jaegeuk@kernel.org, gargaditya08@live.com, maco@android.com, hirofumi@mail.parknet.co.jp, haoluo@google.com, tony.luck@intel.com, tytso@mit
 .edu, nico@fluxnic.net, linux-ntfs-dev@lists.sourceforge.net, muchun.song@linux.dev, roberto.sassu@huawei.com, linux-f2fs-devel@lists.sourceforge.net, yang.yang29@zte.com.cn, gpiccoli@igalia.com, anna@kernel.org, quic_uaggarwa@quicinc.com, bwarrum@linux.ibm.com, mike.kravetz@oracle.com, jingyuwang_vip@163.com, linux-efi@vger.kernel.org, error27@gmail.com, martin@omnibond.com, trix@redhat.com, ocfs2-devel@lists.linux.dev, ast@kernel.org, sebastian.reichel@collabora.com, clm@fb.com, linux-mtd@lists.infradead.org, willy@infradead.org, marc.dionne@auristor.com, linux-afs@lists.infradead.org, raven@themaw.net, naohiro.aota@wdc.com, daniel@iogearbox.net, dennis.dalessandro@cornelisnetworks.com, linux-rdma@vger.kernel.org, quic_linyyuan@quicinc.com, coda@cs.cmu.edu, slava@dubeyko.com, idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com, serge@hallyn.com, chengzhihao1@huawei.com, axboe@kernel.dk, amir73il@gmail.com, linuszeng@tencent.com, keescook@chromium.org, arnd@arndb.de, autofs@
 vger.kernel.org, rostedt@goodmis.org, yifeliu@cs.stonybrook.edu, dlemoal@kernel.org, eparis@parisplace.org, ceph-devel@vger.kernel.org, xiang@kernel.org, yijiangshan@kylinos.cn, dhowells@redhat.com, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, kolga@netapp.com, song@kernel.org, samba-technical@lists.samba.org, sfrench@samba.org, jk@ozlabs.org, netdev@vger.kernel.org, rpeterso@redhat.com, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, davem@davemloft.net, jfs-discussion@lists.sourceforge.net, princekumarmaurya06@gmail.com, ebiggers@google.com, neilb@suse.de, asmadeus@codewreck.org, linux_oss@crudebyte.com, me@bobcopeland.com, kpsingh@kernel.org, okanatov@gmail.com, almaz.alexandrovich@paragon-software.com, joseph.qi@linux.alibaba.com, hayama@lineo.co.jp, adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz, shaozhengchao@huawei.com, chenzhongjin@huawei.com, ardb@kernel.org, anton.ivanov@cambridgegreys.com, agru
 enba@redhat.com, richard@nod.at, mark@fasheh.com, shr@devkernel.io, Dai.Ngo@oracle.com, cluster-devel@redhat.com, jgg@ziepe.ca, kuba@kernel.org, riel@surriel.com, salah.triki@gmail.com, dushistov@mail.ru, linux-cifs@vger.kernel.org, hca@linux.ibm.com, chao@kernel.org, apparmor@lists.ubuntu.com, josef@toxicpanda.com, Liam.Howlett@Oracle.com, tom@talpey.com, hdegoede@redhat.com, linux-hardening@vger.kernel.org, aivazian.tigran@gmail.com, dchinner@redhat.com, dsterba@suse.com, xiubli@redhat.com, konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org, rituagar@linux.ibm.com, luisbg@kernel.org, martin.lau@linux.dev, v9fs@lists.linux.dev, fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org, lrh2000@pku.edu.cn, linux-security-module@vger.kernel.org, ezk@cs.stonybrook.edu, jefflexu@linux.alibaba.com, linux@treblig.org, hannes@cmpxchg.org, phillip@squashfs.org.uk, johannes@sipsolutions.net, sj1557.seo@samsung.com, dwmw2@infradead.org, linux-karma-devel@lists.sourceforge.net, linux-btr
 fs@vger.kernel.org, jlbec@evilplan.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-07-06 at 10:16 -0500, Eric W. Biederman wrote:
> Jeff Layton <jlayton@kernel.org> writes:
>=20
> > On Wed, 2023-07-05 at 14:58 -0400, Jeff Layton wrote:
> > > v2:
> > > - prepend patches to add missing ctime updates
> > > - add simple_rename_timestamp helper function
> > > - rename ctime accessor functions as inode_get_ctime/inode_set_ctime_=
*
> > > - drop individual inode_ctime_set_{sec,nsec} helpers
> > >=20
> > > I've been working on a patchset to change how the inode->i_ctime is
> > > accessed in order to give us conditional, high-res timestamps for the
> > > ctime and mtime. struct timespec64 has unused bits in it that we can =
use
> > > to implement this. In order to do that however, we need to wrap all
> > > accesses of inode->i_ctime to ensure that bits used as flags are
> > > appropriately handled.
> > >=20
> > > The patchset starts with reposts of some missing ctime updates that I
> > > spotted in the tree. It then adds a new helper function for updating =
the
> > > timestamp after a successful rename, and new ctime accessor
> > > infrastructure.
> > >=20
> > > The bulk of the patchset is individual conversions of different
> > > subsysteme to use the new infrastructure. Finally, the patchset renam=
es
> > > the i_ctime field to __i_ctime to help ensure that I didn't miss
> > > anything.
> > >=20
> > > This should apply cleanly to linux-next as of this morning.
> > >=20
> > > Most of this conversion was done via 5 different coccinelle scripts, =
run
> > > in succession, with a large swath of by-hand conversions to clean up =
the
> > > remainder.
> > >=20
> >=20
> > A couple of other things I should note:
> >=20
> > If you sent me an Acked-by or Reviewed-by in the previous set, then I
> > tried to keep it on the patch here, since the respun patches are mostly
> > just renaming stuff from v1. Let me know if I've missed any.
> >=20
> > I've also pushed the pile to my tree as this tag:
> >=20
> >     https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/t=
ag/?h=3Dctime.20230705
> >=20
> > In case that's easier to work with.
>=20
> Are there any preliminary patches showing what you want your introduced
> accessors to turn into?  It is hard to judge the sanity of the
> introduction of wrappers without seeing what the wrappers are ultimately
> going to do.
>=20
> Eric

I have a draft version of the multigrain patches on top of the wrapper
conversion I've already posted in my "mgctime-experimental" branch:

    https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/log/?=
h=3Dmgctime-experimental

The rationale is best explained in this changelog:

    https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commi=
t/?h=3Dmgctime-experimental&id=3Dface437a144d3375afb7f70c233b0644b4edccba

The idea will be to enable this on a per-fs basis.
--=20
Jeff Layton <jlayton@kernel.org>
