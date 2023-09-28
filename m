Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A97C27B1E7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 15:33:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pU3Eq0ij;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxDvt4BfVz3dTc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 23:33:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pU3Eq0ij;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxDcq11BVz3c7v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 23:20:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BE62BB81C4C;
	Thu, 28 Sep 2023 13:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A692BC116D2;
	Thu, 28 Sep 2023 13:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695907236;
	bh=037Ze6Oh3D2awDcZtKZjRWRmyXeBya+W4CX5rPaqzIo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pU3Eq0ijKK73kzmdJ+ylSZryDoz7esCxxiGEWFn0fUyU2pbYj+g3oDo4B2D//OLAZ
	 EAuJqWXLHJcfP/sWHMQ+nq2gXHsF3pmrxsknsc8ipoY9K/BN0UfqX/9i1kOMLV1Gfq
	 UrRqoY6xJOCrvcixf/iiMEBJWk3MIbjU3FQ5Z8bG9O+7EdG9SjPJNzHDhTKSjKYYEP
	 aZBghfVv5ZG9DBNwn9SCgRA9eCm3HTtKRCGg/ekMG4BW0eAP/SYED43uqw/Y2wcHkh
	 nmRagNQKjRUwuozNh1Eh3QCSddVdmyGwZjF7qfCJEWoCpf/ObEWrgp1Z01q+gSHcuI
	 G/cDFVqhlSkVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5ADE732D4;
	Thu, 28 Sep 2023 13:20:36 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Sep 2023 15:21:31 +0200
Subject: [PATCH 06/15] parport: Remove the now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230928-jag-sysctl_remove_empty_elem_drivers-v1-6-e59120fca9f9@samsung.com>
References:  <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
In-Reply-To:  <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4351;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=WChTYX7s4/WvuQm5SyjCReq4OLhKQc/jMANe9UKK8MA=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlFX3domrs1Rr8nCLu3I2SozBNrKydcRCbph2hu
 qHdrIVsBJGJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRV93QAKCRC6l81St5ZB
 T03WDACBmWcNFPTto1zM9apZjylAnDoNPMsUznqyxFf8kY2U9iRHXbIxgeTlIPEo7qZMmu1m5/J
 sX1nwnUwAdUaji0Q4eLEKLDGEOqU473kX4ysJaOf4v81JMRwF5WvaiFXFgI+XQZI5icxGY+mxuG
 iSH+hJofoKo2WdHnnDV+xfcFS5Q7F32a0wY705vontJcNmQsaupkws8MxZar0hCVXyMRkmqk8O2
 8GrB+kL0MeUKc5ewZtAKuWPCuKSSWXRBOAYXFE9xHFAFAuEucyF++YrG+hYvcLvyHiHl0KXSlft
 AqUwfJSnjFw/kMt/PkFeXArBwIoc1O+dhwm1NflO2GlT+yNZ2I1mOMZSZlvJX6nedNWzXoXlHPd
 +RdWZoKt3uKvrhG2SzZ87drY9N7egpXbrqtlklIO0eBmsm2niO6RJX0PariUYYv6Ca2FPBnsj2o
 4WEP1Kpo3C5EbdAOfNZiLWtOc0wOabRtggAZzBVqo0lPpwIr5zxOU1TLAXL8njXS696Dg=
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

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which
will reduce the overall build time size of the kernel and run time
memory bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove the unneeded ctl_tables that were used to register intermediate
parport directories; only the path is needed at this point. From
parport_device_sysctl_table we removed: devices_root_dir, port_dir,
parport_dir and dev_dir. From parport_default_sysctl_table we removed:
default_dir, parport_dir and dev_dir. Reduce the size by one of the
ctl_table arrays that were not removed

Assign different sizes to the vars array in parport_sysctl_table
depending on CONFIG_PARPORT_1284; this is necessary now that the sysctl
register function uses ARRAY_SIZE to calculate the elements within.
Remove the sentinel element from parport_sysctl_template,
parport_device_sysctl_table and parport_default_sysctl_table.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/parport/procfs.c | 42 ++++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/parport/procfs.c b/drivers/parport/procfs.c
index 4e5b972c3e26..4118b3e52223 100644
--- a/drivers/parport/procfs.c
+++ b/drivers/parport/procfs.c
@@ -259,8 +259,12 @@ PARPORT_MAX_SPINTIME_VALUE;
 struct parport_sysctl_table {
 	struct ctl_table_header *port_header;
 	struct ctl_table_header *devices_header;
-	struct ctl_table vars[12];
-	struct ctl_table device_dir[2];
+#ifdef CONFIG_PARPORT_1284
+	struct ctl_table vars[10];
+#else
+	struct ctl_table vars[5];
+#endif /* IEEE 1284 support */
+	struct ctl_table device_dir[1];
 };
 
 static const struct parport_sysctl_table parport_sysctl_template = {
@@ -303,9 +307,9 @@ static const struct parport_sysctl_table parport_sysctl_template = {
 			.maxlen		= 0,
 			.mode		= 0444,
 			.proc_handler	= do_hardware_modes
-		},
+		}
 #ifdef CONFIG_PARPORT_1284
-		{
+		, {
 			.procname	= "autoprobe",
 			.data		= NULL,
 			.maxlen		= 0,
@@ -339,9 +343,8 @@ static const struct parport_sysctl_table parport_sysctl_template = {
 			.maxlen		= 0,
 			.mode		= 0444,
 			.proc_handler	= do_autoprobe
-		},
+		}
 #endif /* IEEE 1284 support */
-		{}
 	},
 	{
 		{
@@ -350,20 +353,15 @@ static const struct parport_sysctl_table parport_sysctl_template = {
 			.maxlen		= 0,
 			.mode		= 0444,
 			.proc_handler	= do_active_device
-		},
-		{}
+		}
 	},
 };
 
 struct parport_device_sysctl_table
 {
 	struct ctl_table_header *sysctl_header;
-	struct ctl_table vars[2];
-	struct ctl_table device_dir[2];
-	struct ctl_table devices_root_dir[2];
-	struct ctl_table port_dir[2];
-	struct ctl_table parport_dir[2];
-	struct ctl_table dev_dir[2];
+	struct ctl_table vars[1];
+	struct ctl_table device_dir[1];
 };
 
 static const struct parport_device_sysctl_table
@@ -378,8 +376,7 @@ parport_device_sysctl_template = {
 			.proc_handler	= proc_doulongvec_ms_jiffies_minmax,
 			.extra1		= (void*) &parport_min_timeslice_value,
 			.extra2		= (void*) &parport_max_timeslice_value
-		},
-		{}
+		}
 	},
 	{
 		{
@@ -387,18 +384,14 @@ parport_device_sysctl_template = {
 			.data		= NULL,
 			.maxlen		= 0,
 			.mode		= 0555,
-		},
-		{}
+		}
 	}
 };
 
 struct parport_default_sysctl_table
 {
 	struct ctl_table_header *sysctl_header;
-	struct ctl_table vars[3];
-	struct ctl_table default_dir[2];
-	struct ctl_table parport_dir[2];
-	struct ctl_table dev_dir[2];
+	struct ctl_table vars[2];
 };
 
 static struct parport_default_sysctl_table
@@ -422,8 +415,7 @@ parport_default_sysctl_table = {
 			.proc_handler	= proc_dointvec_minmax,
 			.extra1		= (void*) &parport_min_spintime_value,
 			.extra2		= (void*) &parport_max_spintime_value
-		},
-		{}
+		}
 	}
 };
 
@@ -443,7 +435,9 @@ int parport_proc_register(struct parport *port)
 	t->vars[0].data = &port->spintime;
 	for (i = 0; i < 5; i++) {
 		t->vars[i].extra1 = port;
+#ifdef CONFIG_PARPORT_1284
 		t->vars[5 + i].extra2 = &port->probe_info[i];
+#endif /* IEEE 1284 support */
 	}
 
 	port_name_len = strnlen(port->name, PARPORT_NAME_MAX_LEN);

-- 
2.30.2

