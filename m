Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD11B2899
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 15:55:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4964pY1ph5zDqsm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 23:55:49 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=f4/vBVRE; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=NavDfz3w; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4964jt54p5zDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:51:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P6M8RIkxrhewWamSGvitx0rzqPZ7fkCVr5z1emQQAj8=;
 b=f4/vBVREOP9eSz87EjZUfPIUhem/b9Br339gHi5OkadWyIoJeQzC+hFQXOhGlFn4r0xSK2
 aod5Lulo+m55+4mIe4Ftg7szHAjShnEOJlT/D3Q6ybaRAHRFG0fOBSw//BJo1yoSH3HYuT
 KHv/GnXP9R4+z9J9Mwv0Sp8j6RN2xAs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587477104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P6M8RIkxrhewWamSGvitx0rzqPZ7fkCVr5z1emQQAj8=;
 b=NavDfz3wLeImWy+vxcT7wNqKTpMLI0/WTswOvJfkGUlK3x8nVEAH93h5uun/wmA2OkOPuF
 ZwU21PBTEd+4J0VzXygHTyXzfyqD6oj473Vlm4WRSuvWup/wxmnbXSFQLg0eOatMjT5iTT
 EDJ/Ba/Kod8firpQTRt2aBmWQhZhBf0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-47QFTwEoMX2xKwFL24NtQw-1; Tue, 21 Apr 2020 09:51:41 -0400
X-MC-Unique: 47QFTwEoMX2xKwFL24NtQw-1
Received: by mail-wr1-f71.google.com with SMTP id q10so7518340wrv.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 06:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IInilyB2ckeUfP1pJZsdQY8G2HWtqy1MvibEpjmv5kQ=;
 b=IqLw+Dohiam52QJmx/bPWCBFQeXd9C3h2/jRAqMAMGwMo1ozLAUZ+LiVMg8HyjPtrZ
 1+Hg1AuYz8aIjcfAlEUXAiAj8a1UU2A2tWYop8CFWFN0oqVyjqyibc+NzXJn8ukO+0Hg
 WDVTuGdvSxJ9ciyTUJCa43HSPoqg0AxH5gttMLqZ3FNiRHCmHAwIwqfCPwijXuuYi6zM
 X38DRq7K3qlfK7BFmmNyfVaJ9etSdQwdoOJtviSlngbhBJCYmN5EIZG4Ea3rdyt5+lTE
 Jd4Rd/BwUdlPY9W56yr/G/1vhTGvTB9Cv6XcmwDwjFf1cS6LtrVgYWaopg4cq0gbCRxE
 L6WQ==
X-Gm-Message-State: AGi0PuYcwWprg104odlBMqVhxlLJt+EDqNz01MdE7diNRfWmGv0y5Mr0
 +9ESwmx/tIgKsLGrpk0O1l6KilzXy/XhpWqhcMmbtrRTCPpdieBeFQhHblxcXf5MYe9GzlMBcde
 bTV/8P0uAq1pIC7qceMyJ5v2Zkw==
X-Received: by 2002:a1c:bd89:: with SMTP id n131mr4916138wmf.3.1587477100745; 
 Tue, 21 Apr 2020 06:51:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypL9ml34u2SXsT4cym73Fj9YcZ5gNZl/Vlb+iTik+1IYxflheOGQshudBA/kLdh/qIi+ct+15w==
X-Received: by 2002:a1c:bd89:: with SMTP id n131mr4916110wmf.3.1587477100572; 
 Tue, 21 Apr 2020 06:51:40 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.194])
 by smtp.gmail.com with ESMTPSA id a187sm3565830wmh.40.2020.04.21.06.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:51:40 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 0/7] libfs: group and simplify linux fs code
Date: Tue, 21 Apr 2020 15:51:12 +0200
Message-Id: <20200421135119.30007-1-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 John Johansen <john.johansen@canonical.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Joel Becker <jlbec@evilplan.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

libfs.c has many functions that are useful to implement dentry and inode
operations, but not many at the filesystem level.  As a result, code to
create files and inodes has a lot of duplication, to the point that
tracefs has copied several hundred lines from debugfs.

The main two libfs.c functions for filesystems are simple_pin_fs and
simple_release_fs, which hide a somewhat complicated locking sequence
that is needed to serialize vfs_kern_mount and mntget.  In this series,
my aim is to add functions that create dentries and inodes of various
kinds (either anonymous inodes, or directory/file/symlink).  These
functions take the code that was duplicated across debugfs and tracefs
and move it to libfs.c.

In order to limit the number of arguments to the new functions, the
series first creates a data type that is passed to both
simple_pin_fs/simple_release_fs and the new creation functions.  The new
struct, introduced in patch 2, simply groups the "mount" and "count"
arguments to simple_pin_fs and simple_release_fs.

Patches 1-4 are preparations to introduce the new simple_fs struct and
new functions that are useful in the remainder of the series.  Patch 5
introduces the dentry and inode creation functions.  Patch 6-7 can then
adopt them in debugfs and tracefs.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

v1->v2: rename simple_new_inode in new_inode_current_time,
more detailed explanations, put all common code in fs/libfs.c

Emanuele Giuseppe Esposito (7):
  apparmor: just use vfs_kern_mount to make .null
  libfs: wrap simple_pin_fs/simple_release_fs arguments in a struct
  libfs: introduce new_inode_current_time
  libfs: add alloc_anon_inode wrapper
  libfs: add file creation functions
  debugfs: switch to simplefs inode creation API
  tracefs: switch to simplefs inode creation API

 drivers/gpu/drm/drm_drv.c       |  11 +-
 drivers/misc/cxl/api.c          |  13 +-
 drivers/scsi/cxlflash/ocxl_hw.c |  14 +-
 fs/binfmt_misc.c                |   9 +-
 fs/configfs/mount.c             |  10 +-
 fs/debugfs/inode.c              | 158 +++--------------
 fs/libfs.c                      | 299 ++++++++++++++++++++++++++++++--
 fs/tracefs/inode.c              |  96 ++--------
 include/linux/fs.h              |  31 +++-
 security/apparmor/apparmorfs.c  |  38 ++--
 security/inode.c                |  11 +-
 11 files changed, 399 insertions(+), 291 deletions(-)

--=20
2.25.2

