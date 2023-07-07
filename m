Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D356A74B03B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 13:47:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jXdQbiZ5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyBV25P9Nz3cCs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 21:47:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jXdQbiZ5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jlayton@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qy9DS5Kfcz3bWQ;
	Fri,  7 Jul 2023 20:51:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9C4C3618BB;
	Fri,  7 Jul 2023 10:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1904CC433C7;
	Fri,  7 Jul 2023 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688727060;
	bh=YY2+JZ9K159BEA5iSbeX62sRGYZcpbUaLjQvLugmLbE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jXdQbiZ5Du/aIdze7VeTdm89AeKeYW1m4/7P1K420P54fp2uTq7aOaGBMwqlLnw11
	 5T+jXE1w9xr2TFIydSymIs59E5/D60tiQwOrG5t4hwTmZ4+DNTLa0LgW/JlS7C6Rg0
	 Mzl7zZGaHcBNbE8fs+RYzBh/pLfQTiwpAzbqUwnaVBq4Wks4CGEmJGniuijWbkznN9
	 yKSAP4Wd0VGwzQyH6kGj1b/zaEVMosXLl47jzHBi50p2AWNvdkuhe4kCPVw/2GfwLp
	 PcUD4QVeNETkqKyUuCjgzrA8gjstIliNy9GhxSwhdsoWExJoMegiOtBnIsuS31XbZX
	 flM91ZzrsjFeA==
Message-ID: <ff1f471a9d33ae01ad570644273e4e579204a3b6.camel@kernel.org>
Subject: Re: [apparmor] [PATCH v2 08/92] fs: new helper:
 simple_rename_timestamp
From: Jeff Layton <jlayton@kernel.org>
To: Seth Arnold <seth.arnold@canonical.com>
Date: Fri, 07 Jul 2023 06:50:40 -0400
In-Reply-To: <20230706210236.GB3244704@millbarge>
References: <20230705185812.579118-1-jlayton@kernel.org>
	 <20230705185812.579118-3-jlayton@kernel.org>
	 <3b403ef1-22e6-0220-6c9c-435e3444b4d3@kernel.org>
	 <7c783969641b67d6ffdfb10e509f382d083c5291.camel@kernel.org>
	 <20230706210236.GB3244704@millbarge>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jul 2023 21:45:28 +1000
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
 .edu, nico@fluxnic.net, linux-ntfs-dev@lists.sourceforge.net, muchun.song@linux.dev, roberto.sassu@huawei.com, linux-f2fs-devel@lists.sourceforge.net, yang.yang29@zte.com.cn, gpiccoli@igalia.com, ebiederm@xmission.com, anna@kernel.org, quic_uaggarwa@quicinc.com, bwarrum@linux.ibm.com, mike.kravetz@oracle.com, jingyuwang_vip@163.com, linux-efi@vger.kernel.org, error27@gmail.com, martin@omnibond.com, trix@redhat.com, ocfs2-devel@lists.linux.dev, ast@kernel.org, sebastian.reichel@collabora.com, clm@fb.com, linux-mtd@lists.infradead.org, willy@infradead.org, marc.dionne@auristor.com, linux-afs@lists.infradead.org, raven@themaw.net, naohiro.aota@wdc.com, daniel@iogearbox.net, dennis.dalessandro@cornelisnetworks.com, linux-rdma@vger.kernel.org, quic_linyyuan@quicinc.com, coda@cs.cmu.edu, slava@dubeyko.com, idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com, serge@hallyn.com, chengzhihao1@huawei.com, axboe@kernel.dk, amir73il@gmail.com, linuszeng@tencent.com, keescook@chromium.org,
  arnd@arndb.de, autofs@vger.kernel.org, rostedt@goodmis.org, yifeliu@cs.stonybrook.edu, Damien Le Moal <dlemoal@kernel.org>, eparis@parisplace.org, ceph-devel@vger.kernel.org, xiang@kernel.org, yijiangshan@kylinos.cn, dhowells@redhat.com, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, kolga@netapp.com, song@kernel.org, samba-technical@lists.samba.org, sfrench@samba.org, jk@ozlabs.org, netdev@vger.kernel.org, rpeterso@redhat.com, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, davem@davemloft.net, jfs-discussion@lists.sourceforge.net, princekumarmaurya06@gmail.com, ebiggers@google.com, neilb@suse.de, asmadeus@codewreck.org, linux_oss@crudebyte.com, me@bobcopeland.com, kpsingh@kernel.org, okanatov@gmail.com, almaz.alexandrovich@paragon-software.com, joseph.qi@linux.alibaba.com, hayama@lineo.co.jp, adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz, shaozhengchao@huawei.com, chenzhongjin@huawei.com, ardb@kernel.or
 g, anton.ivanov@cambridgegreys.com, agruenba@redhat.com, richard@nod.at, mark@fasheh.com, shr@devkernel.io, Dai.Ngo@oracle.com, cluster-devel@redhat.com, jgg@ziepe.ca, kuba@kernel.org, riel@surriel.com, salah.triki@gmail.com, dushistov@mail.ru, linux-cifs@vger.kernel.org, hca@linux.ibm.com, chao@kernel.org, apparmor@lists.ubuntu.com, josef@toxicpanda.com, Liam.Howlett@Oracle.com, tom@talpey.com, hdegoede@redhat.com, linux-hardening@vger.kernel.org, aivazian.tigran@gmail.com, dchinner@redhat.com, dsterba@suse.com, xiubli@redhat.com, konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org, rituagar@linux.ibm.com, luisbg@kernel.org, martin.lau@linux.dev, v9fs@lists.linux.dev, fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org, lrh2000@pku.edu.cn, linux-security-module@vger.kernel.org, ezk@cs.stonybrook.edu, jefflexu@linux.alibaba.com, linux@treblig.org, hannes@cmpxchg.org, phillip@squashfs.org.uk, johannes@sipsolutions.net, sj1557.seo@samsung.com, dwmw2@infradead.org, linux-karm
 a-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, jlbec@evilplan.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-07-06 at 21:02 +0000, Seth Arnold wrote:
> On Wed, Jul 05, 2023 at 08:04:41PM -0400, Jeff Layton wrote:
> >=20
> > I don't believe it's an issue. I've seen nothing in the POSIX spec that
> > mandates that timestamp updates to different inodes involved in an
> > operation be set to the _same_ value. It just says they must be updated=
.
> >=20
> > It's also hard to believe that any software would depend on this either=
,
> > given that it's very inconsistent across filesystems today. AFAICT, thi=
s
> > was mostly done in the past just as a matter of convenience.
>=20
> I've seen this assumption in several programs:
>=20

Thanks for looking into this!

To be clear, POSIX doesn't require that _different_ inodes ever be set
to the same timestamp value. IOW, it certainly doesn't require that the
source and target directories on a rename() end up with the exact same
timestamp value.

Granted, POSIX is rather vague on timestamps in general, but most of the
examples below involve comparing different timestamps on the _same_
inode.


> mutt buffy.c
> https://sources.debian.org/src/mutt/2.2.9-1/buffy.c/?hl=3D625#L625
>=20
>   if (mailbox->newly_created &&
>       (sb->st_ctime !=3D sb->st_mtime || sb->st_ctime !=3D sb->st_atime))
>     mailbox->newly_created =3D 0;
>=20

This should be fine with this patchset. Note that this is comparing
a/c/mtime on the same inode, and our usual pattern on inode
instantiation is:

    inode->i_atime =3D inode->i_mtime =3D inode_set_ctime_current(inode);

...which should result in all of inode's timestamps being synchronized.

>=20
> neomutt mbox/mbox.c
> https://sources.debian.org/src/neomutt/20220429+dfsg1-4.1/mbox/mbox.c/?hl=
=3D1820#L1820
>=20
>   if (m->newly_created && ((st.st_ctime !=3D st.st_mtime) || (st.st_ctime=
 !=3D st.st_atime)))
>     m->newly_created =3D false;
>=20

Ditto here.

>=20
> screen logfile.c
> https://sources.debian.org/src/screen/4.9.0-4/logfile.c/?hl=3D130#L130
>=20
>   if ((!s->st_dev && !s->st_ino) ||             /* stat failed, that's ne=
w! */
>       !s->st_nlink ||                           /* red alert: file unlink=
ed */
>       (s->st_size < o.st_size) ||               /*           file truncat=
ed */
>       (s->st_mtime !=3D o.st_mtime) ||            /*            file modi=
fied */
>       ((s->st_ctime !=3D o.st_ctime) &&           /*     file changed (mo=
ved) */
>        !(s->st_mtime =3D=3D s->st_ctime &&          /*  and it was not a =
change */
>          o.st_ctime < s->st_ctime)))            /* due to delayed nfs wri=
te */
>   {
>=20

This one is really weird. You have two different struct stat's, "o" and
"s". I assume though that these should be stat values from the same
inode, because otherwise this comparison would make no sense:

      ((s->st_ctime !=3D o.st_ctime) &&           /*     file changed (move=
d) */

In general, we can never contrive to ensure that the ctime of two
different inodes are the same, since that is always set by the kernel to
the current time, and you'd have to ensure that they were created within
the same jiffy (at least with today's code).

> nemo libnemo-private/nemo-vfs-file.c
> https://sources.debian.org/src/nemo/5.6.5-1/libnemo-private/nemo-vfs-file=
.c/?hl=3D344#L344
>=20
> 		/* mtime is when the contents changed; ctime is when the
> 		 * contents or the permissions (inc. owner/group) changed.
> 		 * So we can only know when the permissions changed if mtime
> 		 * and ctime are different.
> 		 */
> 		if (file->details->mtime =3D=3D file->details->ctime) {
> 			return FALSE;
> 		}
>=20

Ditto here with the first examples. This involves comparing timestamps
on the same inode, which should be fine.

>=20
> While looking for more examples, I found a perl test that seems to sugges=
t
> that at least Solaris, AFS, AmigaOS, DragonFly BSD do as you suggest:
> https://sources.debian.org/src/perl/5.36.0-7/t/op/stat.t/?hl=3D158#L140
>=20

(I kinda miss Perl. I wrote a bunch of stuff in it in the 90's and early
naughties)

I think this test is supposed to be testing whether the mtime changes on
link() ?

-----------------8<----------------
    my($nlink, $mtime, $ctime) =3D (stat($tmpfile))[$NLINK, $MTIME, $CTIME]=
;

[...]


        skip "Solaris tmpfs has different mtime/ctime link semantics", 2
                                     if $Is_Solaris and $cwd =3D~ m#^/tmp# =
and
                                        $mtime && $mtime =3D=3D $ctime;
-----------------8<----------------

...again, I think this would be ok too since it's just comparing the
mtime and ctime of the same inode. Granted this is a Solaris-specific
test, but Linux would be fine here too.

So in conclusion, I don't think this patchset will cause problems with
any of the above code.
--=20
Jeff Layton <jlayton@kernel.org>
