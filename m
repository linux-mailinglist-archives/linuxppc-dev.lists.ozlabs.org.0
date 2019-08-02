Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF7B7EBCC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 07:04:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460FSg2mSPzDqmh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 15:04:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alliedtelesis.co.nz
 (client-ip=2001:df5:b000:5::4; helo=gate2.alliedtelesis.co.nz;
 envelope-from=chrisp@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.b="ot6m6to1"; dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460FQq04SFzDqgB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 15:02:42 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E1F38806CB;
 Fri,  2 Aug 2019 17:02:38 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1564722158;
 bh=rpSZNOrtu8ZQ+NBLB2MkGMKd/4UQg6zVQsIynrawJko=;
 h=From:To:Cc:Subject:Date;
 b=ot6m6to1liCC374hNPw/XTFF8B5TDJpVo/FZdRiyN7jroz3Lv+Q34lPlZUwhZaM2d
 aquth2Kb8PnqdvS2T2huzA5Q1DZWRlVgQaQVNAi5053fOpJ/3NaM8+h//JtSCqefZ5
 vNX5TUcaDINe3rzrR7YohERtykISWqyumZlllRvaasOAagOmwteI7y/7DtHORwVR7t
 7T7BHhJIDpUjAwBWw7J+Byh63j6wQbbIZe57/HrBUNBEBJ4prwP2YFYJnexLlQgMzf
 JPCsu4u2a3C6kIjz6L2YaoD8ZOBjBT5f6Fs+gwPKv3UVsj2ol6rYwwf6BjzffLBkKX
 4qDLfiPpFSbjA==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with
 Trustwave SEG (v7, 5, 8, 10121)
 id <B5d43c3ee0000>; Fri, 02 Aug 2019 17:02:38 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
 by smtp (Postfix) with ESMTP id 94DE413EC73;
 Fri,  2 Aug 2019 17:02:40 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 5909A1E0505; Fri,  2 Aug 2019 17:02:38 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 christophe.leroy@c-s.fr
Subject: [PATCH] powerpc: Remove inaccessible CMDLINE default
Date: Fri,  2 Aug 2019 17:02:32 +1200
Message-Id: <20190802050232.22978-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
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
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit cbe46bd4f510 ("powerpc: remove CONFIG_CMDLINE #ifdef mess")
CONFIG_CMDLINE has always had a value regardless of CONNIG_CMDLINE_BOOL.

For example:

 $ make ARCH=3Dpowerpc defconfig
 $ cat .config
 # CONFIG_CMDLINE_BOOL is not set
 CONFIG_CMDLINE=3D""

When enabling CONNIG_CMDLINE_BOOL this value is kept making the 'default
"..." if CONNIG_CMDLINE_BOOL' ineffective.

 $ ./scripts/config --enable CONFIG_CMDLINE_BOOL
 $ cat .config
 CONFIG_CMDLINE_BOOL=3Dy
 CONFIG_CMDLINE=3D""

Additionally all the in-tree powerpc defconfigs that set
CONFIG_CMDLINE_BOOL=3Dy also set CONFIG_CMDLINE to something else. For
these reasons remove the inaccessible default.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
This should be independent of http://patchwork.ozlabs.org/patch/1140811/ =
but
I've generated this patch on a stream that has it applied locally.

 arch/powerpc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d413fe1b4058..6fca6eba6aee 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -844,7 +844,6 @@ config CMDLINE_BOOL
=20
 config CMDLINE
 	string "Initial kernel command string" if CMDLINE_BOOL
-	default "console=3DttyS0,9600 console=3Dtty0 root=3D/dev/sda2" if CMDLI=
NE_BOOL
 	default ""
 	help
 	  On some platforms, there is currently no way for the boot loader to
--=20
2.22.0

