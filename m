Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2B5187EC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 11:53:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hVQZ4Q3MzDqfM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 21:53:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=SgiBExM0; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hVLJ6fBVzDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 21:50:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584442198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=88OsB2jSDoNgzvIn7pkzvFuton0cXl1y6ameX4o2p6g=;
 b=SgiBExM0EVsMXqawwa7B8nG/tRJXIoiGk+pyaNEC7LxhD9V9XsYdIQ5C5fFWic/c3USmyV
 rzd5GDwX4OtVWkuLlZirNklrfvcHkRvxVPBm8d5buEx/UxliZ2V5e0yNH80NAP3xU3Nq38
 dbmC4/Ws+dzRyfGP3zSqbZX0gadt+Z8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-zxSchhQfP1mBFTtHlQC6rw-1; Tue, 17 Mar 2020 06:49:54 -0400
X-MC-Unique: zxSchhQfP1mBFTtHlQC6rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3F511005514;
 Tue, 17 Mar 2020 10:49:51 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A28273865;
 Tue, 17 Mar 2020 10:49:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] mm/memory_hotplug: allow to specify a default
 online_type
Date: Tue, 17 Mar 2020 11:49:34 +0100
Message-Id: <20200317104942.11178-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Yumei Huang <yuhuang@redhat.com>, linux-hyperv@vger.kernel.org,
 Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Baoquan He <bhe@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Yang <richard.weiyang@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>,
 Milan Zamazal <mzamazal@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Igor Mammedov <imammedo@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Distributions nowadays use udev rules ([1] [2]) to specify if and
how to online hotplugged memory. The rules seem to get more complex with
many special cases. Due to the various special cases,
CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE cannot be used. All memory hotplug
is handled via udev rules.

Everytime we hotplug memory, the udev rule will come to the same
conclusion. Especially Hyper-V (but also soon virtio-mem) add a lot of
memory in separate memory blocks and wait for memory to get onlined by us=
er
space before continuing to add more memory blocks (to not add memory fast=
er
than it is getting onlined). This of course slows down the whole memory
hotplug process.

To make the job of distributions easier and to avoid udev rules that get
more and more complicated, let's extend the mechanism provided by
- /sys/devices/system/memory/auto_online_blocks
- "memhp_default_state=3D" on the kernel cmdline
to be able to specify also "online_movable" as well as "online_kernel"

v1 -> v2:
- Tweaked some patch descriptions
- Added
-- "powernv/memtrace: always online added memory blocks"
-- "hv_balloon: don't check for memhp_auto_online manually"
-- "mm/memory_hotplug: unexport memhp_auto_online"
- "mm/memory_hotplug: convert memhp_auto_online to store an online_type"
-- No longer touches hv/memtrace code


=3D=3D=3D Example /usr/libexec/config-memhotplug =3D=3D=3D

#!/bin/bash

VIRT=3D`systemd-detect-virt --vm`
ARCH=3D`uname -p`

sense_virtio_mem() {
  if [ -d "/sys/bus/virtio/drivers/virtio_mem/" ]; then
    DEVICES=3D`find /sys/bus/virtio/drivers/virtio_mem/ -maxdepth 1 -type=
 l | wc -l`
    if [ $DEVICES !=3D "0" ]; then
        return 0
    fi
  fi
  return 1
}

if [ ! -e "/sys/devices/system/memory/auto_online_blocks" ]; then
  echo "Memory hotplug configuration support missing in the kernel"
  exit 1
fi

if grep "memhp_default_state=3D" /proc/cmdline > /dev/null; then
  echo "Memory hotplug configuration overridden in kernel cmdline (memhp_=
default_state=3D)"
  exit 1
fi

if [ $VIRT =3D=3D "microsoft" ]; then
  echo "Detected Hyper-V on $ARCH"
  # Hyper-V wants all memory in ZONE_NORMAL
  ONLINE_TYPE=3D"online_kernel"
elif sense_virtio_mem; then
  echo "Detected virtio-mem on $ARCH"
  # virtio-mem wants all memory in ZONE_NORMAL
  ONLINE_TYPE=3D"online_kernel"
elif [ $ARCH =3D=3D "s390x" ] || [ $ARCH =3D=3D "s390" ]; then
  echo "Detected $ARCH"
  # standby memory should not be onlined automatically
  ONLINE_TYPE=3D"offline"
elif [ $ARCH =3D=3D "ppc64" ] || [ $ARCH =3D=3D "ppc64le" ]; then
  echo "Detected" $ARCH
  # PPC64 onlines all hotplugged memory right from the kernel
  ONLINE_TYPE=3D"offline"
elif [ $VIRT =3D=3D "none" ]; then
  echo "Detected bare-metal on $ARCH"
  # Bare metal users expect hotplugged memory to be unpluggable. We assum=
e
  # that ZONE imbalances on such enterpise servers cannot happen and is
  # properly documented
  ONLINE_TYPE=3D"online_movable"
else
  # TODO: Hypervisors that want to unplug DIMMs and can guarantee that ZO=
NE
  # imbalances won't happen
  echo "Detected $VIRT on $ARCH"
  # Usually, ballooning is used in virtual environments, so memory should=
 go to
  # ZONE_NORMAL. However, sometimes "movable_node" is relevant.
  ONLINE_TYPE=3D"online"
fi

echo "Selected online_type:" $ONLINE_TYPE

# Configure what to do with memory that will be hotplugged in the future
echo $ONLINE_TYPE 2>/dev/null > /sys/devices/system/memory/auto_online_bl=
ocks
if [ $? !=3D "0" ]; then
  echo "Memory hotplug cannot be configured (e.g., old kernel or missing =
permissions)"
  # A backup udev rule should handle old kernels if necessary
  exit 1
fi

# Process all already pluggedd blocks (e.g., DIMMs, but also Hyper-V or v=
irtio-mem)
if [ $ONLINE_TYPE !=3D "offline" ]; then
  for MEMORY in /sys/devices/system/memory/memory*; do
    STATE=3D`cat $MEMORY/state`
    if [ $STATE =3D=3D "offline" ]; then
        echo $ONLINE_TYPE > $MEMORY/state
    fi
  done
fi


=3D=3D=3D Example /usr/lib/systemd/system/config-memhotplug.service =3D=3D=
=3D

[Unit]
Description=3DConfigure memory hotplug behavior
DefaultDependencies=3Dno
Conflicts=3Dshutdown.target
Before=3Dsysinit.target shutdown.target
After=3Dsystemd-modules-load.service
ConditionPathExists=3D|/sys/devices/system/memory/auto_online_blocks

[Service]
ExecStart=3D/usr/libexec/config-memhotplug
Type=3Doneshot
TimeoutSec=3D0
RemainAfterExit=3Dyes

[Install]
WantedBy=3Dsysinit.target


=3D=3D=3D Example modification to the 40-redhat.rules [2] =3D=3D=3D

diff --git a/40-redhat.rules b/40-redhat.rules-new
index 2c690e5..168fd03 100644
--- a/40-redhat.rules
+++ b/40-redhat.rules-new
@@ -6,6 +6,9 @@ SUBSYSTEM=3D=3D"cpu", ACTION=3D=3D"add", TEST=3D=3D"onlin=
e", ATTR{online}=3D=3D"0", ATTR{online}
 # Memory hotadd request
 SUBSYSTEM!=3D"memory", GOTO=3D"memory_hotplug_end"
 ACTION!=3D"add", GOTO=3D"memory_hotplug_end"
+# memory hotplug behavior configured
+PROGRAM=3D=3D"grep online /sys/devices/system/memory/auto_online_blocks"=
, GOTO=3D"memory_hotplug_end"
+
 PROGRAM=3D"/bin/uname -p", RESULT=3D=3D"s390*", GOTO=3D"memory_hotplug_e=
nd"

 ENV{.state}=3D"online"

=3D=3D=3D


[1] https://github.com/lnykryn/systemd-rhel/pull/281
[2] https://github.com/lnykryn/systemd-rhel/blob/staging/rules/40-redhat.=
rules

Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Yumei Huang <yuhuang@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Milan Zamazal <mzamazal@redhat.com>

David Hildenbrand (8):
  drivers/base/memory: rename MMOP_ONLINE_KEEP to MMOP_ONLINE
  drivers/base/memory: map MMOP_OFFLINE to 0
  drivers/base/memory: store mapping between MMOP_* and string in an
    array
  powernv/memtrace: always online added memory blocks
  hv_balloon: don't check for memhp_auto_online manually
  mm/memory_hotplug: unexport memhp_auto_online
  mm/memory_hotplug: convert memhp_auto_online to store an online_type
  mm/memory_hotplug: allow to specify a default online_type

 arch/powerpc/platforms/powernv/memtrace.c | 14 ++---
 drivers/base/memory.c                     | 71 ++++++++++++-----------
 drivers/hv/hv_balloon.c                   | 25 ++++----
 include/linux/memory_hotplug.h            | 13 ++++-
 mm/memory_hotplug.c                       | 16 ++---
 5 files changed, 69 insertions(+), 70 deletions(-)

--=20
2.24.1

