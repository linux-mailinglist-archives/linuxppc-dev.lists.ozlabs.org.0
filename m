Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E62D02AD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 11:20:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpjBr0FgyzDqmT
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 21:20:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=OtEr11sn; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cpj8P4FflzDqVd
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 21:18:43 +1100 (AEDT)
Subject: Patch "powerpc: Stop exporting __clear_user which is now inlined."
 has been added to the 4.4-stable tree
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607249919;
 bh=jLdS+AkZUfndx3TaaiYMrlZ+sRw9MdjmjgtFqocmDU0=;
 h=To:Cc:From:Date:In-Reply-To:From;
 b=OtEr11snkBdj1Ki3W43OJRl9ys85YLbvHXpFQgKacbHrCBRtEQR1U51j+g25gmHeS
 LAhUoYPRdV5yU3tNE4uJjF8c2LDYQ18NuNm1sCNNDgFDpB9vpYy7ZO5o86NYkHiYQA
 B6HRlxwTUf0z+769eV5s3/tWcMP4RzgdZqQex308=
To: benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 msuchanek@suse.de, paulus@samba.org
From: <gregkh@linuxfoundation.org>
Date: Sun, 06 Dec 2020 11:19:41 +0100
In-Reply-To: <20201204232807.31887-1-msuchanek@suse.de>
Message-ID: <160724998145158@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    powerpc: Stop exporting __clear_user which is now inlined.

to the 4.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     powerpc-stop-exporting-__clear_user-which-is-now-inlined.patch
and it can be found in the queue-4.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From msuchanek@suse.de  Sun Dec  6 10:49:43 2020
From: Michal Suchanek <msuchanek@suse.de>
Date: Sat,  5 Dec 2020 00:28:07 +0100
Subject: powerpc: Stop exporting __clear_user which is now inlined.
To: stable@vger.kernel.org
Cc: Michal Suchanek <msuchanek@suse.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Message-ID: <20201204232807.31887-1-msuchanek@suse.de>

From: Michal Suchanek <msuchanek@suse.de>

Stable commit 452e2a83ea23 ("powerpc: Fix __clear_user() with KUAP
enabled") redefines __clear_user as inline function but does not remove
the export.

Fixes: 452e2a83ea23 ("powerpc: Fix __clear_user() with KUAP enabled")

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/lib/ppc_ksyms.c |    1 -
 1 file changed, 1 deletion(-)

--- a/arch/powerpc/lib/ppc_ksyms.c
+++ b/arch/powerpc/lib/ppc_ksyms.c
@@ -24,7 +24,6 @@ EXPORT_SYMBOL(csum_tcpudp_magic);
 #endif
 
 EXPORT_SYMBOL(__copy_tofrom_user);
-EXPORT_SYMBOL(__clear_user);
 EXPORT_SYMBOL(copy_page);
 
 #ifdef CONFIG_PPC64


Patches currently in stable-queue which might be from msuchanek@suse.de are

queue-4.4/powerpc-stop-exporting-__clear_user-which-is-now-inlined.patch
