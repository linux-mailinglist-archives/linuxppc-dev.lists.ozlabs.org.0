Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6CC7B1E74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 15:32:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pQB4GXSp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxDsy6VtMz3f0K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 23:32:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pQB4GXSp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxDcq0dMtz3c68
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 23:20:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 05D8CB81C28;
	Thu, 28 Sep 2023 13:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE664C4E66A;
	Thu, 28 Sep 2023 13:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695907237;
	bh=zIDxsd9iCOvFOj9DYvrPAPNadW1ey6fN+cIKsMZCqhc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pQB4GXSp6WbCB4GG53qnSlwP+fh2gdR7EMlxk5vQZAtpUkEriTJChfKgxb+SceJ+x
	 gYWCN9vmuPsc9w9o83mac0IwHQy4N6UAZ5iKgsw1vTE2QEmijUO8OTQX9oZZkHVELb
	 k6MqhAkKqkj4LTUhjKFdxnLINC+b1CG9SjDGYZcMbOmd6c/DeXAJMvu4aMep2qu4IB
	 Apy++h4Zox4ImHAmVEt753bty94AHq0BuCjLHodEX77G4HBt7c0M7b5m6GEorYnKxB
	 u+tdfpegbbi7v8HcIh5gnn82sM/qztK3Wxk0N9ChwawW56/HvAQhjku8AZ7ySUMA+/
	 4ZH7vD5NxNQcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56BAE732D5;
	Thu, 28 Sep 2023 13:20:36 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Sep 2023 15:21:33 +0200
Subject: [PATCH 08/15] infiniband: Remove the now superfluous sentinel
 element from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230928-jag-sysctl_remove_empty_elem_drivers-v1-8-e59120fca9f9@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=oMVRgRy513gbjpJ/8gwXhcFvr0Ll4WG0wpO8gVUy5SI=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlFX3evpOp/5vnYyEzJdxXZ21uRM3BLLBrF9iet
 6magp65Z8CJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRV93gAKCRC6l81St5ZB
 TyMpC/9vIPQcmOkywGCjv6hB2J+JNumv5GkIZJVtZPgvAg/hlP+WJUP4Xiq8mnVZ+z/ct5AeldL
 adjJKMeeGFJgbYiNGurLY6hsGZ16i5ASdNvVUppbOlhDPfHOHF2HfaJdbQ0laRpGROkZnN0YMum
 RZZPsHt+esqZvTZm3ZPZ5g8tuvbrngmHfcEwkGqCRYTk3HPxIT+IqwTfkKcTDXtrjWRD0hyRQTJ
 O7RtIfDK2Cr+VjIm9dIE08jgnQzbEcKCfot2tHi2ncOeTnsEjyF5v+HrAeAx2Z9AOA61TBQJ1OM
 zIfqU45B0jYFpyxPzvNSMvGNipoc8HbzsxzCseMIJ2QCIgwQW/gzh7/WDvNZMtFlmvXlKC4Puxt
 d0apigmOn9JdY6eAG9E+Bzix/Mv1Tg1NKLdAFJm80g6Q2zoCz6H3B0Llq5gC5hRDfFZYbc1qSkK
 W+txzQYUtii1iMXK9mtF7hn+t/HUfLOdmAsDy67zTTpjFr6uw5KigDBqR/a7fSmIUspYU=
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

Remove sentinel from iwcm_ctl_table and ucma_ctl_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/infiniband/core/iwcm.c | 3 +--
 drivers/infiniband/core/ucma.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/core/iwcm.c b/drivers/infiniband/core/iwcm.c
index 2b47073c61a6..fefb9ae75789 100644
--- a/drivers/infiniband/core/iwcm.c
+++ b/drivers/infiniband/core/iwcm.c
@@ -110,8 +110,7 @@ static struct ctl_table iwcm_ctl_table[] = {
 		.maxlen		= sizeof(default_backlog),
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec,
-	},
-	{ }
+	}
 };
 
 /*
diff --git a/drivers/infiniband/core/ucma.c b/drivers/infiniband/core/ucma.c
index bf42650f125b..92ad24ddf12a 100644
--- a/drivers/infiniband/core/ucma.c
+++ b/drivers/infiniband/core/ucma.c
@@ -70,8 +70,7 @@ static struct ctl_table ucma_ctl_table[] = {
 		.maxlen		= sizeof max_backlog,
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec,
-	},
-	{ }
+	}
 };
 
 struct ucma_file {

-- 
2.30.2

