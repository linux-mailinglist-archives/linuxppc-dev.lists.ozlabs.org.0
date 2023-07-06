Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE83074A75C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:01:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=UigHgg1t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxsVF2tXDz3c3p
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:01:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=UigHgg1t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=seth.arnold@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxps159gFz3bX3;
	Fri,  7 Jul 2023 07:02:59 +1000 (AEST)
Received: from localhost (2.general.sarnold.us.vpn [10.172.64.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id EC65D3F31B;
	Thu,  6 Jul 2023 21:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1688677359;
	bh=wL7I+1AkkXlsdAXc0IgIVs00VMlkDlPzLoO7HtCH8Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=UigHgg1tEN+F2JYmBK+lUOcRBpRtdrNgGbqup1NnaXOwyODWf/TTOdnjSM3EJKV2r
	 nSVjFudDceCGObMlTU+uma1muY2uaIkS7sazvVomlUh2z4Cx6T6ypWSOKoKTLr1e7n
	 Ld2z62ONf1z9dg8T10Z72Jl2h0B3vIxrVCycmYrM1jOwV4H0NyvFgu4GNfgDT4ln1d
	 cD6OBnHOJHdcMdNwqptcYXDLv4IErHsYENHamhLEH+hxLeB02yXRDCQTTC0JuBjK6l
	 ZNgX1V/W8Fy+2Orhx/aZTqqWjx/zv/bYCRboXEZa1I0V5mrDoaohFkaxDrb57pylVz
	 OTISOPjT4Hs9A==
Date: Thu, 6 Jul 2023 21:02:36 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [apparmor] [PATCH v2 08/92] fs: new helper:
 simple_rename_timestamp
Message-ID: <20230706210236.GB3244704@millbarge>
References: <20230705185812.579118-1-jlayton@kernel.org>
 <20230705185812.579118-3-jlayton@kernel.org>
 <3b403ef1-22e6-0220-6c9c-435e3444b4d3@kernel.org>
 <7c783969641b67d6ffdfb10e509f382d083c5291.camel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline
In-Reply-To: <7c783969641b67d6ffdfb10e509f382d083c5291.camel@kernel.org>
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
 .edu, nico@fluxnic.net, linux-ntfs-dev@lists.sourceforge.net, muchun.song@linux.dev, roberto.sassu@huawei.com, linux-f2fs-devel@lists.sourceforge.net, yang.yang29@zte.com.cn, gpiccoli@igalia.com, ebiederm@xmission.com, anna@kernel.org, quic_uaggarwa@quicinc.com, bwarrum@linux.ibm.com, mike.kravetz@oracle.com, jingyuwang_vip@163.com, linux-efi@vger.kernel.org, error27@gmail.com, martin@omnibond.com, trix@redhat.com, ocfs2-devel@lists.linux.dev, ast@kernel.org, sebastian.reichel@collabora.com, clm@fb.com, linux-mtd@lists.infradead.org, willy@infradead.org, marc.dionne@auristor.com, linux-afs@lists.infradead.org, raven@themaw.net, naohiro.aota@wdc.com, daniel@iogearbox.net, dennis.dalessandro@cornelisnetworks.com, linux-rdma@vger.kernel.org, quic_linyyuan@quicinc.com, coda@cs.cmu.edu, slava@dubeyko.com, idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com, serge@hallyn.com, chengzhihao1@huawei.com, axboe@kernel.dk, amir73il@gmail.com, linuszeng@tencent.com, keescook@chromium.org,
  arnd@arndb.de, autofs@vger.kernel.org, rostedt@goodmis.org, yifeliu@cs.stonybrook.edu, Damien Le Moal <dlemoal@kernel.org>, eparis@parisplace.org, ceph-devel@vger.kernel.org, xiang@kernel.org, yijiangshan@kylinos.cn, dhowells@redhat.com, linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, kolga@netapp.com, song@kernel.org, samba-technical@lists.samba.org, sfrench@samba.org, jk@ozlabs.org, netdev@vger.kernel.org, rpeterso@redhat.com, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org, davem@davemloft.net, jfs-discussion@lists.sourceforge.net, princekumarmaurya06@gmail.com, ebiggers@google.com, neilb@suse.de, asmadeus@codewreck.org, linux_oss@crudebyte.com, me@bobcopeland.com, kpsingh@kernel.org, okanatov@gmail.com, almaz.alexandrovich@paragon-software.com, joseph.qi@linux.alibaba.com, hayama@lineo.co.jp, adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz, shaozhengchao@huawei.com, chenzhongjin@huawei.com, ardb@kernel.or
 g, anton.ivanov@cambridgegreys.com, agruenba@redhat.com, richard@nod.at, mark@fasheh.com, shr@devkernel.io, Dai.Ngo@oracle.com, cluster-devel@redhat.com, jgg@ziepe.ca, kuba@kernel.org, riel@surriel.com, salah.triki@gmail.com, dushistov@mail.ru, linux-cifs@vger.kernel.org, hca@linux.ibm.com, chao@kernel.org, apparmor@lists.ubuntu.com, josef@toxicpanda.com, Liam.Howlett@Oracle.com, tom@talpey.com, hdegoede@redhat.com, linux-hardening@vger.kernel.org, aivazian.tigran@gmail.com, dchinner@redhat.com, dsterba@suse.com, xiubli@redhat.com, konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org, rituagar@linux.ibm.com, luisbg@kernel.org, martin.lau@linux.dev, v9fs@lists.linux.dev, fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org, lrh2000@pku.edu.cn, linux-security-module@vger.kernel.org, ezk@cs.stonybrook.edu, jefflexu@linux.alibaba.com, linux@treblig.org, hannes@cmpxchg.org, phillip@squashfs.org.uk, johannes@sipsolutions.net, sj1557.seo@samsung.com, dwmw2@infradead.org, linux-karm
 a-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org, jlbec@evilplan.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2023 at 08:04:41PM -0400, Jeff Layton wrote:
>=20
> I don't believe it's an issue. I've seen nothing in the POSIX spec that
> mandates that timestamp updates to different inodes involved in an
> operation be set to the _same_ value. It just says they must be updated.
>=20
> It's also hard to believe that any software would depend on this either,
> given that it's very inconsistent across filesystems today. AFAICT, this
> was mostly done in the past just as a matter of convenience.

I've seen this assumption in several programs:

mutt buffy.c
https://sources.debian.org/src/mutt/2.2.9-1/buffy.c/?hl=3D625#L625

  if (mailbox->newly_created &&
      (sb->st_ctime !=3D sb->st_mtime || sb->st_ctime !=3D sb->st_atime))
    mailbox->newly_created =3D 0;


neomutt mbox/mbox.c
https://sources.debian.org/src/neomutt/20220429+dfsg1-4.1/mbox/mbox.c/?hl=
=3D1820#L1820

  if (m->newly_created && ((st.st_ctime !=3D st.st_mtime) || (st.st_ctime !=
=3D st.st_atime)))
    m->newly_created =3D false;


screen logfile.c
https://sources.debian.org/src/screen/4.9.0-4/logfile.c/?hl=3D130#L130

  if ((!s->st_dev && !s->st_ino) ||             /* stat failed, that's new!=
 */
      !s->st_nlink ||                           /* red alert: file unlinked=
 */
      (s->st_size < o.st_size) ||               /*           file truncated=
 */
      (s->st_mtime !=3D o.st_mtime) ||            /*            file modifi=
ed */
      ((s->st_ctime !=3D o.st_ctime) &&           /*     file changed (move=
d) */
       !(s->st_mtime =3D=3D s->st_ctime &&          /*  and it was not a ch=
ange */
         o.st_ctime < s->st_ctime)))            /* due to delayed nfs write=
 */
  {

nemo libnemo-private/nemo-vfs-file.c
https://sources.debian.org/src/nemo/5.6.5-1/libnemo-private/nemo-vfs-file.c=
/?hl=3D344#L344

		/* mtime is when the contents changed; ctime is when the
		 * contents or the permissions (inc. owner/group) changed.
		 * So we can only know when the permissions changed if mtime
		 * and ctime are different.
		 */
		if (file->details->mtime =3D=3D file->details->ctime) {
			return FALSE;
		}


While looking for more examples, I found a perl test that seems to suggest
that at least Solaris, AFS, AmigaOS, DragonFly BSD do as you suggest:
https://sources.debian.org/src/perl/5.36.0-7/t/op/stat.t/?hl=3D158#L140


Thanks

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmSnK+gACgkQ8yFyWZ2N
Lpd3gQf6AtE8sBL09BSTvT1P5I8tCXnJ4U7VbzQxWTcKAQHRpyZn8IRSdWuxiPEU
soaBmSx6jov+kkZYX5uP1LSM1INMYpJTJELGas9A7wenNppBGS07LjwAL40wouPm
UfcVWQqOgM8eoseMKBKePv5TkTJFn/M3cPK9Wy31E+qF1IPMNtxz9JKz109YlDOO
FxVTwBGGxxKvx3SsUl6hdaqBCK3omZlbWCzqSyqBzzvjgZ01VC5ktw5FuuTABbu8
TScNnT5GtO5AE8RV0T3TKISm19xD69JHQt/etFeU2yKwiBsn89pY4Xut3CrxbSQm
prQ7ssP3/fi41WxFFDQzO/oQok/b+A==
=/KNl
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
