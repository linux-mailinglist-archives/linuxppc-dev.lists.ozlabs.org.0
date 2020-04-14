Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 533D71A7B93
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 15:00:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491lvw0yX4zDqQ5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 23:00:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=OGC9aaPB; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491lXZ6MJKzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:43:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s/11mAo8TGof9fElMW//bJCzL1+izMSi4fkBrEjCedo=;
 b=OGC9aaPB3eJbJJJodWQ/ggOsRegysFSbO+rmdY1NOQ+mdYzV2XkvKGWDcpB7pDsdKY5v+x
 69J53yz4KyVvm2CDxckdaWjF/RnGGhX00pXZaTadAr6XPIo46YG45NZu8yLvy3r17Vzkg/
 WsaiIoQkfv2wNN8wYsWbms1kYzhgojE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-Vt8KjghqOX2BGctdWg4dvg-1; Tue, 14 Apr 2020 08:43:38 -0400
X-MC-Unique: Vt8KjghqOX2BGctdWg4dvg-1
Received: by mail-wm1-f72.google.com with SMTP id c129so3705173wme.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 05:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MrMq7u1iV/F4rZQEqvhQ++V9yKrw5g/LWhjcaMYuCWg=;
 b=MiumkRTegqZCym5hFrG/HlnfJQrkfTw9d7tC1bsKOMqV1a5ZcYTQlyBZYHjPbBjC7u
 qRpiyoZ/NBWe1x4TGYmj31E/+BXfJnq9IyIDW6rVQnzHOjp7Z2DarNWpUe6wVcEJOvIJ
 KneQI1pGttTfN/ATR9/w3RdR1jn12azS/jsHH36ZzLrOEckQOzuwlUhQNos+qUigPViK
 1RfRYDLXf+9JhNStyxFC45rJjqZ+Xpm873UdpSjTefGeRPkXX94OkNjGyaHsu7O4Ap0Y
 kB+/gXXdT99eE3MmXERZVbBLd2f42e4KetJEiUSZ1rs6vVHiFSzWggxNXekpEWISEW82
 uM9g==
X-Gm-Message-State: AGi0PuZKicobrDPyVW0UdnSziSuhc1kHAHuioc88eLR9BaloXsFV8wRh
 vNGvshWurRtG1PGQwd7XxgkO9ZTqQrA2C763DxB0RQrF0fi+AP6KoIWKVJs7gPojFdlWk+tlxoJ
 dHU7aMDbsr/+Kz/bRHxgtsXcpHw==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr18691205wrp.275.1586868217664; 
 Tue, 14 Apr 2020 05:43:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypKieMHQMEHB64fOusIKVI0klz9UQdQ5a1y3lFWKhJD37VUle4YhX0YmwupcDiJWC0mdvqWDbw==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr18691124wrp.275.1586868217421; 
 Tue, 14 Apr 2020 05:43:37 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:43:36 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 1/8] apparmor: just use vfs_kern_mount to make .null
Date: Tue, 14 Apr 2020 14:42:55 +0200
Message-Id: <20200414124304.4470-2-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200414124304.4470-1-eesposit@redhat.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 14 Apr 2020 22:51:49 +1000
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
Cc: Song Liu <songliubraving@fb.com>, linux-usb@vger.kernel.org,
 bpf@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Hugh Dickins <hughd@google.com>,
 Paul Mackerras <paulus@samba.org>, John Johansen <john.johansen@canonical.com>,
 netdev@vger.kernel.org, linux-s390@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Andrew Donnellan <ajd@linux.ibm.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Mark Fasheh <mark@fasheh.com>, Anton Vorontsov <anton@enomsg.org>,
 John Fastabend <john.fastabend@gmail.com>, James Morris <jmorris@namei.org>,
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, oprofile-list@lists.sf.net,
 Yonghong Song <yhs@fb.com>, Ian Kent <raven@themaw.net>,
 Andrii Nakryiko <andriin@fb.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Robert Richter <rric@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, autofs@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Uma Krishnan <ukrishn@linux.ibm.com>, Maxime Ripard <mripard@kernel.org>,
 linux-fsdevel@vger.kernel.org, "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Iurii Zaikin <yzaikin@google.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Daniel Vetter <daniel@ffwll.ch>,
 Colin Cross <ccross@android.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, ocfs2-devel@oss.oracle.com,
 Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

aa_mk_null_file is using simple_pin_fs/simple_release_fs with local
variables as arguments, for what would amount to a simple
vfs_kern_mount/mntput pair if everything was inlined.  Just use
the normal filesystem API since the reference counting is not needed
here.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 security/apparmor/apparmorfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.=
c
index 280741fc0f5f..828bb1eb77ea 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -2525,14 +2525,14 @@ struct path aa_null;
=20
 static int aa_mk_null_file(struct dentry *parent)
 {
-=09struct vfsmount *mount =3D NULL;
+=09struct file_system_type *type =3D parent->d_sb->s_type;
+=09struct vfsmount *mount;
 =09struct dentry *dentry;
 =09struct inode *inode;
-=09int count =3D 0;
-=09int error =3D simple_pin_fs(parent->d_sb->s_type, &mount, &count);
=20
-=09if (error)
-=09=09return error;
+=09mount =3D vfs_kern_mount(type, SB_KERNMOUNT, type->name, NULL);
+=09if (IS_ERR(mount))
+=09=09return PTR_ERR(mount);
=20
 =09inode_lock(d_inode(parent));
 =09dentry =3D lookup_one_len(NULL_FILE_NAME, parent, strlen(NULL_FILE_NAME=
));
@@ -2561,7 +2561,7 @@ static int aa_mk_null_file(struct dentry *parent)
 =09dput(dentry);
 out:
 =09inode_unlock(d_inode(parent));
-=09simple_release_fs(&mount, &count);
+=09mntput(mount);
 =09return error;
 }
=20
--=20
2.25.2

