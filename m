Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA68C563E77
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 06:29:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZfGw5F9gz3cfP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 14:29:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oGHlDm4t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.121.223.63; helo=out1.migadu.com; envelope-from=roman.gushchin@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oGHlDm4t;
	dkim-atps=neutral
X-Greylist: delayed 394 seconds by postgrey-1.36 at boromir; Sat, 02 Jul 2022 11:10:16 AEST
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZYs42PVRz3cfF
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 11:10:16 +1000 (AEST)
Date: Fri, 1 Jul 2022 18:03:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1656723813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UefsvJWBOCsJEHG/jcpgIGR+KBtUCRUqjXcROu7qjh4=;
	b=oGHlDm4tgr6UzDbC5z/sb7q2WEts5mi8mJ8aiIMXBOzW75BRr4BaIuszRL9hOCzoFfVxku
	tmO6BM7R9GzDDzZbe/MQeyeOEOAx+3VHqH/w/8ecEZ7fImffcNYGlal4Cw/gQ26E9Sym1J
	usYWeNXz8OdB9Vt23HLuxwKOwXbZ7ng=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 6cc11d2a1759275b856e464265823d94aabd5eaf
Message-ID: <Yr+ZTnLb9lJk6fJO@castle>
References: <62be3696.+PAAAVlbtWK6G2hk%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62be3696.+PAAAVlbtWK6G2hk%lkp@intel.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Mailman-Approved-At: Sat, 02 Jul 2022 14:28:20 +1000
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
Cc: nvdimm@lists.linux.dev, legousb-devel@lists.sourceforge.net, dri-devel@lists.freedesktop.org, linux-sctp@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, ceph-devel@vger.kernel.org, linux-pm@vger.kernel.org, usbb2k-api-dev@nongnu.org, linux-omap@vger.kernel.org, megaraidlinux.pdl@broadcom.com, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-perf-users@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-wpan@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-parport@lists.infradead.org, samba-technical@lists.samba.org, linux-cxl@vger.kernel.org, virtualization@lists.linux-foundation.org, dm-devel@redhat.com, target-devel@vger.kernel.org, dev@openvswitch.org, linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, coreteam@netfilter.org, linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org, l
 inux-arm-msm@vger.kernel.org, linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-integrity@vger.kernel.org, linux-efi@vger.kernel.org, linux-iio@vger.kernel.org, linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org, alsa-devel@alsa-project.org, linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, sound-open-firmware@alsa-project.org, linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, amd-gfx@lists.freedesktop.org, isdn4linux@listserv.isdn4linux.de, linux-input@vger.kernel.org, linux-ext4@vger.kernel.org, mjpeg-users@lists.sourceforge.net, openipmi-developer@lists.sourceforge.net, linux-hwmon@vger.kernel.org, linux-parisc@vger.kernel.org, linux-ide@vger.kernel.org, linux-mmc@vger.kernel.org, iommu@lists.linux-foundation.org, keyrings@vger.kernel.org, netdev@vger.kernel.org, kvm@vger.kernel.org, damon@lists.linux.dev, li
 nux-mm@kvack.org, accessrunner-general@lists.sourcefo

rge.net, linux1394-devel@lists.sourceforge.net, linux-leds@vger.kernel.org, rds-devel@oss.oracle.com, linux-x25@vger.kernel.org, dccp@vger.kernel.org, intel-wired-lan@lists.osuosl.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-nfc@lists.01.org, osmocom-net-gprs@lists.osmocom.org, apparmor@lists.ubuntu.com, linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-scsi@vger.kernel.org, patches@opensource.cirrus.com, linux-unionfs@vger.kernel.org, linux-bluetooth@vger.kernel.org, ntb@lists.linux.dev, tipc-discussion@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

esOn Fri, Jul 01, 2022 at 07:49:42AM +0800, kbuild test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 6cc11d2a1759275b856e464265823d94aabd5eaf  Add linux-next specific files for 20220630
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/linux-mm/202206301859.UodBCrva-lkp@intel.com
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
> arch/powerpc/kernel/interrupt.c:542:55: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
> arch/powerpc/kernel/interrupt.c:542:55: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
> drivers/pci/endpoint/functions/pci-epf-vntb.c:975:5: warning: no previous prototype for 'pci_read' [-Wmissing-prototypes]
> drivers/pci/endpoint/functions/pci-epf-vntb.c:984:5: warning: no previous prototype for 'pci_write' [-Wmissing-prototypes]
> mm/shrinker_debug.c:143:9: warning: function 'shrinker_debugfs_rename' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
> mm/shrinker_debug.c:217:9: warning: function 'shrinker_debugfs_rename' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
> mm/vmscan.c:637:9: warning: function 'prealloc_shrinker' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
> mm/vmscan.c:642:9: warning: function 'prealloc_shrinker' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
> mm/vmscan.c:697:9: warning: function 'register_shrinker' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
> mm/vmscan.c:702:9: warning: function 'register_shrinker' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]

Shrinker-related warnings should be fixed by the following patch.

Thanks!

--

From c399aff65c7745a209397a531c5b28fd404d83c2 Mon Sep 17 00:00:00 2001
From: Roman Gushchin <roman.gushchin@linux.dev>
Date: Fri, 1 Jul 2022 17:38:31 -0700
Subject: [PATCH] mm:shrinkers: fix build warnings

Add __printf(a, b) attributes to shrinker functions taking shrinker
name as an argument to avoid compiler warnings like:

mm/shrinker_debug.c:143:9: warning: function 'shrinker_debugfs_rename'
  might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
mm/shrinker_debug.c:217:9: warning: function 'shrinker_debugfs_rename'
  might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
mm/vmscan.c:637:9: warning: function 'prealloc_shrinker' might be a
  candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
mm/vmscan.c:642:9: warning: function 'prealloc_shrinker' might be a
  candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
mm/vmscan.c:697:9: warning: function 'register_shrinker' might be a
  candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
mm/vmscan.c:702:9: warning: function 'register_shrinker' might be a
  candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]

Signed-off-by: Roman Gushchin <roman.gushchin@linux.dev>
---
 include/linux/shrinker.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 64416f3e0a1f..08e6054e061f 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -93,9 +93,11 @@ struct shrinker {
  */
 #define SHRINKER_NONSLAB	(1 << 3)
 
-extern int prealloc_shrinker(struct shrinker *shrinker, const char *fmt, ...);
+extern int __printf(2, 3) prealloc_shrinker(struct shrinker *shrinker,
+					    const char *fmt, ...);
 extern void register_shrinker_prepared(struct shrinker *shrinker);
-extern int register_shrinker(struct shrinker *shrinker, const char *fmt, ...);
+extern int __printf(2, 3) register_shrinker(struct shrinker *shrinker,
+					    const char *fmt, ...);
 extern void unregister_shrinker(struct shrinker *shrinker);
 extern void free_prealloced_shrinker(struct shrinker *shrinker);
 extern void synchronize_shrinkers(void);
@@ -103,8 +105,8 @@ extern void synchronize_shrinkers(void);
 #ifdef CONFIG_SHRINKER_DEBUG
 extern int shrinker_debugfs_add(struct shrinker *shrinker);
 extern void shrinker_debugfs_remove(struct shrinker *shrinker);
-extern int shrinker_debugfs_rename(struct shrinker *shrinker,
-				   const char *fmt, ...);
+extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
+						  const char *fmt, ...);
 #else /* CONFIG_SHRINKER_DEBUG */
 static inline int shrinker_debugfs_add(struct shrinker *shrinker)
 {
@@ -113,8 +115,8 @@ static inline int shrinker_debugfs_add(struct shrinker *shrinker)
 static inline void shrinker_debugfs_remove(struct shrinker *shrinker)
 {
 }
-static inline int shrinker_debugfs_rename(struct shrinker *shrinker,
-					  const char *fmt, ...)
+static inline __printf(2, 3)
+int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
 {
 	return 0;
 }
-- 
2.36.1

