Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA087B4E3C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 10:55:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hufwGK8e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzZYG0dF1z3vhy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 19:55:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hufwGK8e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzZVR723Bz2xdb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Oct 2023 19:53:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 91F4EB80DDC;
	Mon,  2 Oct 2023 08:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7198C433C8;
	Mon,  2 Oct 2023 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696236794;
	bh=IZog35uNq8vGRsNKIfEniN68FE7olg9OC5FvS2SzfCc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hufwGK8eMTwpAZzY5tjjCcSrUlENx2R+GHGSL/MRXkOFuLxlRDrpxb7L8+UmzAAMY
	 3kyrLlmdif7UJUhx8unTHOW05aoTQTW9PQR/22MMlDEvRzoawpbBHEOwCPKVSGi9hX
	 0wD8UynDxT9GxWBuVaKGJb1hefuvPbZhQSQ6hYcimLZgnX/osYq003o8rF1prmfvhi
	 LtYeFa0hAvwXxBPpAp66rx2duVRL7Q2j6tUSgp66GHPQLnypVAF+y5Z1tfYpYJ5k6j
	 /t6wPv+O/vLovGDIQr1Jl99KdgEs2bk9jJSQfzwBDj1gwVb8p3QcZWt/rbklVbQMGh
	 6tqQLbbnXv/NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B437FE784A5;
	Mon,  2 Oct 2023 08:53:14 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Subject: [PATCH v2 00/15] sysctl: Remove sentinel elements from drivers
Date: Mon, 02 Oct 2023 10:55:17 +0200
Message-Id:  <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHWFGmUC/43NSw6DIBSF4a0YxqVB7EM66j4aQwhe9DYihmtJj
 XHvpSadd/ifwflWRhARiN2KlUVISBjGHPJQMNubsQOObW4mhayEklf+NB2nhew86Ag+JNDgp3n
 RMIDXbcQEkbgT1UldpBFtbVm+miI4fO/Mo8ndI80hLruayu/6A+r/gFRyweGsSimcNcqpOxlPr
 7E72uBZs23bB7xaV5/aAAAA
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Phillip Potter <phil@philpotter.co.uk>, 
 Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Doug Gilbert <dgilbert@interlog.com>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Corey Minyard <minyard@acm.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Robin Holt <robinmholt@gmail.com>, Steve Wahl <steve.wahl@hpe.com>, 
 Russ Weight <russell.h.weight@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Song Liu <song@kernel.org>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=12365;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=odYjDIhyzOtO5Q0U203ntyluw37NErA2/ZkJretAk7g=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoV7hvNwCIGX3CH1hN+xorNhoD5xKwuTuTXzC
 Hr03QRHgz2JAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFewAKCRC6l81St5ZB
 T9oDC/wKVdRDpAFA8LsfwGfmauawotop1selvIUUiWvIA6Ydbya0ucL7Chq71gwhtiD6XFgnEAm
 MYfELkOZ3OHpp+ERmRTsKo2NcA+1/OHMfAADX3brGP5OWKzGXVhkR9GYDAYD1XPo6ShiUZIT+Cu
 fIFO+s/Wg5tgnVjs4yE44jXRFPsbH3pwnqxFGbAbX26GI+GTPo+jjtUL0a+WcbJy9Mpxpu2+bDO
 TZHVixlLPOqq3YBxSBPOYQ+IYTra4MO9MYTdEdvQhfSGZgVBw+fdrG0/5caISy38c3S91WaLLFV
 pXyRzsol2P/FUrSXxdgKSkD6vBheUaywFVgt6cstLp4+/yStMgYYYcknx5Mlf4LOwuebaFLKAau
 pP1GDHZXYoR6xKI2UghYY1DX7mGloY0U16rrWh7f2hSAvTBsMHyzN1GS5nrtecfUmMpDNvqcDx6
 WIPfHqbSx6RcqFTDisa1KnzCA91No7YAHYQrpOwTMzCuakkbopEGnu34ba88MRprtuL3M=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received:  by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
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
Reply-To: j.granados@samsung.com
Cc: Joel Granados <j.granados@samsung.com>, linux-hyperv@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-raid@vger.kernel.org, linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org, openipmi-developer@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Joel Granados <j.granados@samsung.com>

What?
These commits remove the sentinel element (last empty element) from the
sysctl arrays of all the files under the "drivers/" directory that use a
sysctl array for registration. The merging of the preparation patches
(in https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
to mainline allows us to just remove sentinel elements without changing
behavior (more info here [1]).

These commits are part of a bigger set (here
https://github.com/Joelgranados/linux/tree/tag/sysctl_remove_empty_elem_V4)
that remove the ctl_table sentinel. Make the review process easier by
chunking the commits into manageable pieces. Each chunk can be reviewed
separately without noise from parallel sets.

Now that the architecture chunk has been mostly reviewed [6], we send
the "drivers/" directory. Once this one is done, it will be follwed by
"fs/*", "kernel/*", "net/*" and miscellaneous. The final set will remove
the unneeded check for ->procname == NULL.

Why?
By removing the sysctl sentinel elements we avoid kernel bloat as
ctl_table arrays get moved out of kernel/sysctl.c into their own
respective subsystems. This move was started long ago to avoid merge
conflicts; the sentinel removal bit came after Mathew Wilcox suggested
it to avoid bloating the kernel by one element as arrays moved out. This
patchset will reduce the overall build time size of the kernel and run
time memory bloat by about ~64 bytes per declared ctl_table array. I
have consolidated some links that shed light on the history of this
effort [2].

Testing:
* Ran sysctl selftests (./tools/testing/selftests/sysctl/sysctl.sh)
* Ran this through 0-day with no errors or warnings

Size saving after removing all sentinels:
  These are the bytes that we save after removing all the sentinels
  (this plus all the other chunks). I included them to get an idea of
  how much memory we are talking about.
    * bloat-o-meter:
        - The "yesall" configuration results save 9158 bytes
          https://lore.kernel.org/all/20230621091000.424843-1-j.granados@samsung.com/
        - The "tiny" config + CONFIG_SYSCTL save 1215 bytes
          https://lore.kernel.org/all/20230809105006.1198165-1-j.granados@samsung.com/
    * memory usage:
        In memory savings are measured to be 7296 bytes. (here is how to
        measure [3])

Size saving after this patchset:
    * bloat-o-meter
        - The "yesall" config saves 2432 bytes [4]
        - The "tiny" config saves 64 bytes [5]
    * memory usage:
        In this case there were no bytes saved because I do not have any
        of the drivers in the patch. To measure it comment the printk in
        `new_dir` and uncomment the if conditional in `new_links` [3].

---
Changes in v2:
- Left the dangling comma in the ctl_table arrays.
- Link to v1: https://lore.kernel.org/r/20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com

Comments/feedback greatly appreciated

Best

Joel

[1]
We are able to remove a sentinel table without behavioral change by
introducing a table_size argument in the same place where procname is
checked for NULL. The idea is for it to keep stopping when it hits
->procname == NULL, while the sentinel is still present. And when the
sentinel is removed, it will stop on the table_size. You can go to 
(https://lore.kernel.org/all/20230809105006.1198165-1-j.granados@samsung.com/)
for more information.

[2]
Links Related to the ctl_table sentinel removal:
* Good summary from Luis sent with the "pull request" for the
  preparation patches.
  https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/
* Another very good summary from Luis.
  https://lore.kernel.org/all/ZMFizKFkVxUFtSqa@bombadil.infradead.org/
* This is a patch set that replaces register_sysctl_table with register_sysctl
  https://lore.kernel.org/all/20230302204612.782387-1-mcgrof@kernel.org/
* Patch set to deprecate register_sysctl_paths()
  https://lore.kernel.org/all/20230302202826.776286-1-mcgrof@kernel.org/
* Here there is an explicit expectation for the removal of the sentinel element.
  https://lore.kernel.org/all/20230321130908.6972-1-frank.li@vivo.com
* The "ARRAY_SIZE" approach was mentioned (proposed?) in this thread
  https://lore.kernel.org/all/20220220060626.15885-1-tangmeng@uniontech.com

[3]
To measure the in memory savings apply this on top of this patchset.

"
diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index c88854df0b62..e0073a627bac 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -976,6 +976,8 @@ static struct ctl_dir *new_dir(struct ctl_table_set *set,
        table[0].procname = new_name;
        table[0].mode = S_IFDIR|S_IRUGO|S_IXUGO;
        init_header(&new->header, set->dir.header.root, set, node, table, 1);
+       // Counts additional sentinel used for each new dir.
+       printk("%ld sysctl saved mem kzalloc \n", sizeof(struct ctl_table));

        return new;
 }
@@ -1199,6 +1201,9 @@ static struct ctl_table_header *new_links(struct ctl_dir *dir, struct ctl_table_
                link_name += len;
                link++;
        }
+       // Counts additional sentinel used for each new registration
+       //if ((head->ctl_table + head->ctl_table_size)->procname)
+               printk("%ld sysctl saved mem kzalloc \n", sizeof(struct ctl_table));
        init_header(links, dir->header.root, dir->header.set, node, link_table,
                    head->ctl_table_size);
        links->nreg = nr_entries;
"
and then run the following bash script in the kernel:

accum=0
for n in $(dmesg | grep kzalloc | awk '{print $3}') ; do
    echo $n
    accum=$(calc "$accum + $n")
done
echo $accum

[4]
add/remove: 0/0 grow/shrink: 0/21 up/down: 0/-2432 (-2432)
Function                                     old     new   delta
xpc_sys_xpc_hb                               192     128     -64
xpc_sys_xpc                                  128      64     -64
vrf_table                                    128      64     -64
ucma_ctl_table                               128      64     -64
tty_table                                    192     128     -64
sg_sysctls                                   128      64     -64
scsi_table                                   128      64     -64
random_table                                 448     384     -64
raid_table                                   192     128     -64
oa_table                                     192     128     -64
mac_hid_files                                256     192     -64
iwcm_ctl_table                               128      64     -64
ipmi_table                                   128      64     -64
hv_ctl_table                                 128      64     -64
hpet_table                                   128      64     -64
firmware_config_table                        192     128     -64
cdrom_table                                  448     384     -64
balloon_table                                128      64     -64
parport_sysctl_template                      912     720    -192
parport_default_sysctl_table                 584     136    -448
parport_device_sysctl_template               776     136    -640
Total: Before=429940038, After=429937606, chg -0.00%

[5]
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-64 (-64)
Function                                     old     new   delta
random_table                                 448     384     -64
Total: Before=1885527, After=1885463, chg -0.00%

[6] https://lore.kernel.org/all/20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com/

Signed-off-by: Joel Granados <j.granados@samsung.com>

To: Luis Chamberlain <mcgrof@kernel.org>
To: willy@infradead.org
To: josh@joshtriplett.org
To: Kees Cook <keescook@chromium.org>
To: Phillip Potter <phil@philpotter.co.uk>
To: Clemens Ladisch <clemens@ladisch.de>
To: Arnd Bergmann <arnd@arndb.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
To: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
To: Jiri Slaby <jirislaby@kernel.org>
To: "James E.J. Bottomley" <jejb@linux.ibm.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Doug Gilbert <dgilbert@interlog.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
To: Corey Minyard <minyard@acm.org>
To: Theodore Ts'o <tytso@mit.edu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Ahern <dsahern@kernel.org>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Robin Holt <robinmholt@gmail.com>
To: Steve Wahl <steve.wahl@hpe.com>
To: Russ Weight <russell.h.weight@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Song Liu <song@kernel.org>
To: "K. Y. Srinivasan" <kys@microsoft.com>
To: Haiyang Zhang <haiyangz@microsoft.com>
To: Wei Liu <wei.liu@kernel.org>
To: Dexuan Cui <decui@microsoft.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: linux-serial@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-rdma@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net
Cc: netdev@vger.kernel.org
Cc: linux-raid@vger.kernel.org
Cc: linux-hyperv@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org

---

---
Joel Granados (15):
      cdrom: Remove now superfluous sentinel element from ctl_table array
      hpet: Remove now superfluous sentinel element from ctl_table array
      xen: Remove now superfluous sentinel element from ctl_table array
      tty: Remove now superfluous sentinel element from ctl_table array
      scsi: Remove now superfluous sentinel element from ctl_table array
      parport: Remove the now superfluous sentinel element from ctl_table array
      macintosh: Remove the now superfluous sentinel element from ctl_table array
      infiniband: Remove the now superfluous sentinel element from ctl_table array
      char-misc: Remove the now superfluous sentinel element from ctl_table array
      vrf: Remove the now superfluous sentinel element from ctl_table array
      sgi-xp: Remove the now superfluous sentinel element from ctl_table array
      fw loader: Remove the now superfluous sentinel element from ctl_table array
      raid: Remove now superfluous sentinel element from ctl_table array
      Drivers: hv: Remove now superfluous sentinel element from ctl_table array
      intel drm: Remove now superfluous sentinel element from ctl_table array

 drivers/base/firmware_loader/fallback_table.c |  1 -
 drivers/cdrom/cdrom.c                         |  1 -
 drivers/char/hpet.c                           |  1 -
 drivers/char/ipmi/ipmi_poweroff.c             |  1 -
 drivers/char/random.c                         |  1 -
 drivers/gpu/drm/i915/i915_perf.c              |  1 -
 drivers/hv/hv_common.c                        |  1 -
 drivers/infiniband/core/iwcm.c                |  1 -
 drivers/infiniband/core/ucma.c                |  1 -
 drivers/macintosh/mac_hid.c                   |  1 -
 drivers/md/md.c                               |  1 -
 drivers/misc/sgi-xp/xpc_main.c                |  2 --
 drivers/net/vrf.c                             |  1 -
 drivers/parport/procfs.c                      | 28 +++++++++++----------------
 drivers/scsi/scsi_sysctl.c                    |  1 -
 drivers/scsi/sg.c                             |  1 -
 drivers/tty/tty_io.c                          |  1 -
 drivers/xen/balloon.c                         |  1 -
 18 files changed, 11 insertions(+), 35 deletions(-)
---
base-commit: 0e945134b680040b8613e962f586d91b6d40292d
change-id: 20230927-jag-sysctl_remove_empty_elem_drivers-f034962a0d8c

Best regards,
-- 
Joel Granados <j.granados@samsung.com>

