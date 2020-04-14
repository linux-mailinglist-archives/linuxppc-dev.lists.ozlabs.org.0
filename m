Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B99EF1A7B89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 14:58:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491lsD1cyPzDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 22:58:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=LwitRFAF; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491lXW3RXczDqdj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:43:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586868214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/POKEOLp9vZEVM8oe9bfw+hku4DjEqFg+cEEJO5a6SA=;
 b=LwitRFAFFlR74gfPd73DxycdvFXay5jMKwrMvyMY50osO/WaIg1ABFklrCKyfQTu5z0HQb
 YKKHPgoT4kVStMDd/b7L1XMdSrX3HS3dibV1Q3OAoT8jJZnfQwZS7YhyVWJRb+3ahWfC23
 TRSEwRC+i1vxtbM+L1tdkGXnDLfsdro=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-xvW6hw_nPxue5_LbkyMmJQ-1; Tue, 14 Apr 2020 08:43:31 -0400
X-MC-Unique: xvW6hw_nPxue5_LbkyMmJQ-1
Received: by mail-wr1-f69.google.com with SMTP id o12so5554105wra.14
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 05:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fP9JfUaepQl9AEXacvfinBkYRVU9dDq3rlCP1SQpCoc=;
 b=PjsM4d8fJoS2NGEmZi/8pKYLpNY7sUYAKHr/JAlFN4nTi7m9qdwXXU4A7oybthv26F
 UCGwvrvcsfT37J10AszmBmiRTR8s5O0CYd4hTAXC3wUzSKIWzQbIuPcRJBslLEt/onHX
 goeNLu+iaAhtsGmXXE/HubHavIE2nboPLR6MOHFQAtB7Slu/Ob2qnk+GwJGn04XMaygK
 p8hnMtmJ0NVbQ4o9gW8R29/3RYwJBeVL7FEdP8jewrEiPcct4M0sYSHk3VIOQS3PZu98
 2fPFSrqKwhxj8XjCutBH1gnobdsJyuM/jTcPTmNbo9/Ti0aOb1SFM8qRYSugtCcOGhNj
 DWsw==
X-Gm-Message-State: AGi0PubhOgho8GPCf9HUOOsvXGm/VYQcZJnZh+d8+n3nf+5MFQhwJyah
 fzP8UdpAJ4p8rgHPq+FGceFBNNmt5SVRKRRISaaAzxUNXxw6Q3ftoKoI8n6r2MToA9aq3y0Zjkn
 156F57VdZucSgfuZAvWVmV140pA==
X-Received: by 2002:adf:97cc:: with SMTP id t12mr22402313wrb.261.1586868209905; 
 Tue, 14 Apr 2020 05:43:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ2dTzegIg0xIyb6oIhZwO+Fw/tjfTAynP0eIvP7y2y/+ilzA1Tw1zlCJEMAy5qMTHNiP27og==
X-Received: by 2002:adf:97cc:: with SMTP id t12mr22402243wrb.261.1586868209612; 
 Tue, 14 Apr 2020 05:43:29 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.210])
 by smtp.gmail.com with ESMTPSA id m14sm16948816wrs.76.2020.04.14.05.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:43:28 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-nfs@vger.kernel.org
Subject: [PATCH 0/8] Simplefs: group and simplify linux fs code
Date: Tue, 14 Apr 2020 14:42:54 +0200
Message-Id: <20200414124304.4470-1-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 14 Apr 2020 22:51:48 +1000
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

This series of patches introduce wrappers for functions,
arguments simplification in functions calls and most importantly
groups duplicated code in a single header, simplefs, to avoid redundancy
in the linux fs, especially debugfs and tracefs.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Emanuele Giuseppe Esposito (8):
  apparmor: just use vfs_kern_mount to make .null
  fs: extract simple_pin/release_fs to separate files
  fs: wrap simple_pin_fs/simple_release_fs arguments in a struct
  fs: introduce simple_new_inode
  simplefs: add alloc_anon_inode wrapper
  simplefs: add file creation functions
  debugfs: switch to simplefs inode creation API
  tracefs: switch to simplefs inode creation API

 arch/powerpc/platforms/cell/spufs/inode.c |   4 +-
 arch/s390/hypfs/inode.c                   |   4 +-
 drivers/gpu/drm/Kconfig                   |   1 +
 drivers/gpu/drm/drm_drv.c                 |  13 +-
 drivers/infiniband/hw/qib/qib_fs.c        |   6 +-
 drivers/misc/cxl/Kconfig                  |   1 +
 drivers/misc/cxl/api.c                    |  14 +-
 drivers/misc/ibmasm/ibmasmfs.c            |   8 +-
 drivers/misc/ocxl/Kconfig                 |   1 +
 drivers/oprofile/oprofilefs.c             |   8 +-
 drivers/scsi/cxlflash/ocxl_hw.c           |  15 +-
 drivers/usb/gadget/function/f_fs.c        |   8 +-
 fs/Kconfig                                |   3 +
 fs/Kconfig.binfmt                         |   1 +
 fs/Makefile                               |   1 +
 fs/autofs/inode.c                         |   4 +-
 fs/binfmt_misc.c                          |  27 +--
 fs/configfs/Kconfig                       |   1 +
 fs/configfs/mount.c                       |  12 +-
 fs/debugfs/inode.c                        | 171 +++----------------
 fs/efivarfs/inode.c                       |   4 +-
 fs/fuse/control.c                         |   4 +-
 fs/hugetlbfs/inode.c                      |   8 +-
 fs/libfs.c                                |  48 ++----
 fs/ocfs2/dlmfs/dlmfs.c                    |   8 +-
 fs/proc/base.c                            |   4 +-
 fs/proc/proc_sysctl.c                     |   5 +-
 fs/pstore/inode.c                         |  14 +-
 fs/ramfs/inode.c                          |   4 +-
 fs/simplefs.c                             | 194 ++++++++++++++++++++++
 fs/tracefs/inode.c                        | 108 ++----------
 include/linux/fs.h                        |   3 +-
 include/linux/simplefs.h                  |  36 ++++
 ipc/mqueue.c                              |   4 +-
 kernel/bpf/inode.c                        |   7 +-
 lib/Kconfig.debug                         |  16 +-
 mm/shmem.c                                |   4 +-
 net/sunrpc/rpc_pipe.c                     |   4 +-
 security/Kconfig                          |   1 +
 security/apparmor/apparmorfs.c            |  48 +++---
 security/inode.c                          |  17 +-
 41 files changed, 385 insertions(+), 459 deletions(-)
 create mode 100644 fs/simplefs.c
 create mode 100644 include/linux/simplefs.h

--=20
2.25.2

