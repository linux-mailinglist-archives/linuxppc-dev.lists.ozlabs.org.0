Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C9911B11F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 16:29:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y1700N2XzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 02:29:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="a7hrtaqS"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y0lp4DG7zDqjx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 02:12:22 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71BCC208C3;
 Wed, 11 Dec 2019 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576077140;
 bh=k2Dj0WU/+DPd2o2LyxT3Kvk5a1GvCFmVhVA7nBIYlqU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a7hrtaqSOs1QwnQRYtDMsw/wlKqIZtebOl9CnkVPAzn1ZIUraKdmojcx76smfJvcV
 22mGAYfqeFo/vtxU+cKit52ZiX0WwfASIB7YeHp3b5K2GH2bs20mc7ziIr/GH+O5qP
 kSCUkv7OIaGexKPg6w1n6SjfY3CSKLfUYwGqlGog=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 027/134] powerpc/tools: Don't quote $objdump in
 scripts
Date: Wed, 11 Dec 2019 10:10:03 -0500
Message-Id: <20191211151150.19073-27-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211151150.19073-1-sashal@kernel.org>
References: <20191211151150.19073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit e44ff9ea8f4c8a90c82f7b85bd4f5e497c841960 ]

Some of our scripts are passed $objdump and then call it as
"$objdump". This doesn't work if it contains spaces because we're
using ccache, for example you get errors such as:

  ./arch/powerpc/tools/relocs_check.sh: line 48: ccache ppc64le-objdump: No such file or directory
  ./arch/powerpc/tools/unrel_branch_check.sh: line 26: ccache ppc64le-objdump: No such file or directory

Fix it by not quoting the string when we expand it, allowing the shell
to do the right thing for us.

Fixes: a71aa05e1416 ("powerpc: Convert relocs_check to a shell script using grep")
Fixes: 4ea80652dc75 ("powerpc/64s: Tool to flag direct branches from unrelocated interrupt vectors")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191024004730.32135-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/tools/relocs_check.sh       | 2 +-
 arch/powerpc/tools/unrel_branch_check.sh | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/tools/relocs_check.sh b/arch/powerpc/tools/relocs_check.sh
index 2b4e959caa365..7b9fe0a567cf3 100755
--- a/arch/powerpc/tools/relocs_check.sh
+++ b/arch/powerpc/tools/relocs_check.sh
@@ -20,7 +20,7 @@ objdump="$1"
 vmlinux="$2"
 
 bad_relocs=$(
-"$objdump" -R "$vmlinux" |
+$objdump -R "$vmlinux" |
 	# Only look at relocation lines.
 	grep -E '\<R_' |
 	# These relocations are okay
diff --git a/arch/powerpc/tools/unrel_branch_check.sh b/arch/powerpc/tools/unrel_branch_check.sh
index 1e972df3107ee..77114755dc6f2 100755
--- a/arch/powerpc/tools/unrel_branch_check.sh
+++ b/arch/powerpc/tools/unrel_branch_check.sh
@@ -18,14 +18,14 @@ vmlinux="$2"
 #__end_interrupts should be located within the first 64K
 
 end_intr=0x$(
-"$objdump" -R "$vmlinux" -d --start-address=0xc000000000000000		\
+$objdump -R "$vmlinux" -d --start-address=0xc000000000000000           \
 		 --stop-address=0xc000000000010000 |
 grep '\<__end_interrupts>:' |
 awk '{print $1}'
 )
 
 BRANCHES=$(
-"$objdump" -R "$vmlinux" -D --start-address=0xc000000000000000		\
+$objdump -R "$vmlinux" -D --start-address=0xc000000000000000           \
 		--stop-address=${end_intr} |
 grep -e "^c[0-9a-f]*:[[:space:]]*\([0-9a-f][0-9a-f][[:space:]]\)\{4\}[[:space:]]*b" |
 grep -v '\<__start_initialization_multiplatform>' |
-- 
2.20.1

