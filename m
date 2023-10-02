Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8BE7B4EA4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 11:05:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Znf3uRMk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzZlw1XS9z3vlD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 20:05:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Znf3uRMk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzZVV4XR5z30fk
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Oct 2023 19:53:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57E4F60CFB;
	Mon,  2 Oct 2023 08:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35C14C4E766;
	Mon,  2 Oct 2023 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696236796;
	bh=Uls7XPBqn6bEdL1vvvSumrQjEL8zidoGeMiRdIO1DJY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Znf3uRMkmmRKi1FLLfPuqGTg8TxGkA5vUnml0sGBj/lNU6zqUvRBzjrq7wi6dn8Og
	 wCyjSubCD1peM1ABs9alnKNnpygl6FEODH191I9gcvsuadwWzNddgNJLQ/JgQBBv+f
	 8csrmLrTP4RdqSuxbZr9GYMPwcXEuGmtg+LPqUoGh+DRcxC+Qy2q/ZuXv425c7elRW
	 hkQarTUdR4UlN5ftzxnKDuhuw+TtiQl8eB3UkN0Zv8gpgtXrHFXol+boWHu8rBPpUr
	 zx65s2Dja0H0a8xRbJUggKI4s2EqqSkQcPlKnKgxeHG0EWBhH9TalmbyI4rwQ0Ut/+
	 goBAiOgxVi5AA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203EEE784AF;
	Mon,  2 Oct 2023 08:53:16 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 10:55:32 +0200
Subject: [PATCH v2 15/15] intel drm: Remove now superfluous sentinel
 element from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20231002-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v2-15-02dd0d46f71e=40samsung=2Ecom=3E?=
References:  <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
In-Reply-To:  <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=944; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=XQdPHHjf+SEqXH5I2ue4u4cYp825opd75wWUwOtUAHg=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoWAu+BY9dasS5g5jzpwW+wb0CuXVsnRm7zPL
 9PCLIz16zuJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFgAAKCRC6l81St5ZB
 T4dBC/4sGw23E9mtpKFCRILNBVXTFFu7WRasCAH0c42eC8QRvWM22jnATwXrejlfZcSArtKRPCv
 wfyjPWWRmMsX2Y9QgdzQR4eDIR4OQdGxaQ4/9XSwkGOLd7l9gxEAAEi8llY4tPInfqJ8yVVRHRL
 kJdHEMgrOkdkoJVo/FH8l7kkyKTHVZqEqBuIpYMRQq0vs3giMG4Coo88yES1bFU47AyR49UdfVf
 QtcI7yfGBkHj9WuAuCZdvwlb/C7Y33lOTv/rXp5qxbGJFG/XZqtnhH8eAWrdaVnpC/lfeExJC/N
 Lm13PvtkIVR5sYCBtNXqApWpo7PjFw1K6HNYNoyRM+LXYRWZYjNM8T5OszX4OLnIjcam1EOtduK
 Z+VeE5uN753bvNh48r2JUIj/GExe1vTcY7a9da8tDlmzB+FEWZo9JbdpakNtfcKKjgKksTFXm75
 ulwZaMeS//8aNIMyrqyVcm4mjJ3q1QRxkcIptFtjcjFnbIGeIGcqc+bJIjQ8SiOblodg8=
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

Remove sentinel from oa_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 04bc1f4a1115..23e769aa214c 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4896,7 +4896,6 @@ static struct ctl_table oa_table[] = {
 	 .extra1 = SYSCTL_ZERO,
 	 .extra2 = &oa_sample_rate_hard_limit,
 	 },
-	{}
 };
 
 static u32 num_perf_groups_per_gt(struct intel_gt *gt)

-- 
2.30.2

