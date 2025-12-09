Return-Path: <linuxppc-dev+bounces-14698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3DACAF618
	for <lists+linuxppc-dev@lfdr.de>; Tue, 09 Dec 2025 10:03:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQXvG6xd9z2xs4;
	Tue, 09 Dec 2025 20:03:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.164 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765271002;
	cv=pass; b=mD1VABCF0rif/VzK0dYpSRUk35dSh3RagSw15ebZbGhcwuspnO/Micw7OEL8H8rXkSl+/ZQaV6thGBxAll2m7ebNsyxX0E94j4jkS278TdWCGItCZdhsu/VvXOYWO/+i/g8wBb4HH2V8kgIsmmDBnJb5qWNESUR/YMAf1Ygh3pji875vX4C+pXjFR+/OR6xnsiqKiDAyI+cf0EbWHIEfCojt6FwWGxBhE52KDAVAZa1tnRElY/FmJneXjBbjhuUa8Z/CLeZ8tqQWG0y643ulTKC/0Ke6+8YlgvOylOOsr7+txa0jNNtnCBamy/BSvsddfIPYI3kKa3kyQQ+Q/FJNjg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765271002; c=relaxed/relaxed;
	bh=GyLE3jhjbAH95glsHopZcyg/MrJesedW5JRaZ2B0IWY=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=XDijusi6BoQJ4RpU3Keb8zuOX5WApH44a7FSGKkinuXF9L2h86MuihNufGrsEOVDttmfchDR+xVUhC1byO3kjAuh/8QNPd8Amo3IWjz/bkAwWozaA1+BZH61phEqxcnuafyC4lb5AwPKS8NKMdVNg032wwSZuJUt3MgcBIJN2FUEO1VyPnsNrcihYTTIst5f60L9F4cSvTZjQ6IEbLHe7m+12WKUD+lIc56U1hxh4pFV5WXOKS/DgsLvecfg1cJ7JRomMm4Rh2NUG3o+UckG6YjuWnmiPnbJb4fWiO++b8n0vIvgx46uK1KQw1F1/9Li+4RHdCqZluxV3m/3ckTGZw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=dJ+6RB+6; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=huYZBhLF; dkim-atps=neutral; spf=pass (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=dJ+6RB+6;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=huYZBhLF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQXvC2R4Nz2xPf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 20:03:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1765270985; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kMfI2q/GyNhFbgzXEyy5aZBBVPKc7aAmeV5nwQocMBI1y9VxphyfqlPt5rurD8IY+m
    /ehJ7A3jcJgYMi52Zm0nsQXccWO2HyyWdtjrxNSBg/sZ6wkZpT3zwb9g+7AIhdiRGgOT
    TQO6TfabNOUquxrjh/64BUwqOTRxSeHWRkMJquY/iTK8FI5na7t75QCzb0M+SvI5TJlD
    gF4N9wUmEHrW2Jhgxro5kDYozWpHYsJ+alX9E1Lty/vr+qBsbBxttSXOlxGqXm7pmDJv
    19atkGIdYl9RrLmWRTNQ0spkOarrj4idQyPPMX5Zlr10/sVyz/akYCQlTNbvuw/AVw5l
    omwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1765270985;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=GyLE3jhjbAH95glsHopZcyg/MrJesedW5JRaZ2B0IWY=;
    b=QRCTStGXbSuu4METihGjwq8v/4NvuHS7j3J8PmFbkdkneALfkTc2l8A+7i72mt30tq
    s0pexMbe041yCLCUNLCUk8SOQjKCPkv2BV7E2c5TUAwdrLugIzF9Lnt01cinova31uhX
    qEDgJil2eqgH87OicEu3ys2HV/E6ElAPztRTfzZN2LIErYS91JW/AkEG0EZtjpCRwT6f
    tUY7MAHeh4nxoAoeQ3rTS0XERX2izv0LbfbOAib2EcPMhWUH6GnUmnsYkQuD6OpAS1Iy
    KsBhX/X0Jft4BzPl0Tgfu150ECe6+vKQ78/yNMg9IGnqKnKlxe8HwPWVIxQE2Kohq/TQ
    1O+g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1765270985;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=GyLE3jhjbAH95glsHopZcyg/MrJesedW5JRaZ2B0IWY=;
    b=dJ+6RB+6CYrKXtL4pPVqw5RSnSHCmEZOcmsf4mitHNPyBG0yTDtSj7R/axzUmZ/B6L
    sWOL8g3dDqqJaAyGVt9zIpsBMd9XhfAhNgVcXehp0h9DKBsF3O1I8qJek5LClX3BPUao
    cUxNRlXkEdh2XZS23E8v7mKWsgbk+DIAg8KqhyhcJtf+qAaGzPaMMu0sUyXn4E1E2oC8
    zoe+ZvaG3S/VaaySh2qxRlnm2V7ISwt0WEYPULjArSDKWazN/9tcqtaXi492DSzY1/r/
    nunDnehvJcb+9k131pGIMWI1lvcLWjW/sDkr8bK59yRLzRdwDSmc7Qf7MUs9cq6rYswi
    y7ow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1765270985;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=GyLE3jhjbAH95glsHopZcyg/MrJesedW5JRaZ2B0IWY=;
    b=huYZBhLFBw7sHHyLONh02B6eKoMZ6ASZzAsXQYzcOThSmPqLrYJhVVNCmmcYKTPn7V
    hyH8cvWCF0aGSslVAKAg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mxsyjMXnXpuj4qk60BLOD29y2Dgz9yoVH7AMU="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 54.0.0 AUTH)
    with ESMTPSA id ed69d81B9935FbJ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 9 Dec 2025 10:03:05 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
Date: Tue, 9 Dec 2025 10:02:54 +0100
Message-Id: <12A4C332-4517-41A0-B3F4-103970E1B829@xenosoft.de>
References: <649c07da-b3f8-3035-911a-5c0368837ddf@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <649c07da-b3f8-3035-911a-5c0368837ddf@xenosoft.de>
To: Christophe Leroy <chleroy@kernel.org>
X-Mailer: iPhone Mail (23B85)
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I bisected today.

1. git clone https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.g=
it -b powerpc-6.19-1 a

2. cd a

3. git log

Output:

commit 9b36c7fc5aa5f2c6e6eeb9f312fdfe61b4291c9f (HEAD, tag: powerpc-6.19-1, o=
rigin/next-test, origin/next)

...

4. git bisect start

5. git bisect good f850568efe3a7a9ec4df357cfad1f997f0058924

Merge tag 'i2c-for-6.18-rc5'

6. git bisect bad 9b36c7fc5aa5f2c6e6eeb9f312fdfe61b4291c9f

macintosh/via-pmu-backlight: Include <linux/fb.h> and <linux/of.h>

7. git bisect bad

8. git bisect bad

9. git bisect good

10. git bisect bad

11. git bisect good

2997876c4a1a5864baa13d7393c2b68cf5b51183 is the first bad commit
commit 2997876c4a1a5864baa13d7393c2b68cf5b51183
Author: Christophe Leroy <christophe.leroy@csgroup.eu>
Date:   Thu Sep 11 14:30:12 2025 +0200

    powerpc/32: Restore clearing of MSR[RI] at interrupt/syscall exit

    Commit 13799748b957 ("powerpc/64: use interrupt restart table to speed
    up return from interrupt") removed the inconditional clearing of
    MSR[RI] when returning from interrupt into kernel. But powerpc/32
    doesn't implement interrupt restart table hence still need MSR[RI]
    to be cleared.

    It could be added back in interrupt_exit_kernel_prepare() but it is
    easier and better to add it back in entry_32.S for following reasons:
    - Writing to MSR must be followed by a synchronising instruction
    - The smaller the non recoverable section is the better it is

    So add a macro called clr_ri and use it in the three places that play
    up with SRR0/SRR1. Use it just before another mtspr for synchronisation
    to avoid having to add an isync.

    Now that's done in entry_32.S, exit_must_hard_disable() can return
    false for non book3s/64, taking into account that BOOKE doesn't have
    MSR_RI.

    Also add back blacklisting syscall_exit_finish for kprobe. This was
    initially added by commit 7cdf44013885 ("powerpc/entry32: Blacklist
    syscall exit points for kprobe.") then lost with
    commit 6f76a01173cc ("powerpc/syscall: implement system call
    entry/exit logic in C for PPC32").

    Fixes: 6f76a01173cc ("powerpc/syscall: implement system call entry/exit l=
ogic in C for PPC32")
    Fixes: 13799748b957 ("powerpc/64: use interrupt restart table to speed u=
p return from interrupt")
    Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
    Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
    Link: https://patch.msgid.link/66d0ab070563ad460ed481328ab0887c27f21a2c.=
1757593807.git.christophe.leroy@csgroup.eu

 arch/powerpc/kernel/entry_32.S  | 18 +++++++++++++++++-
 arch/powerpc/kernel/interrupt.c |  2 +-
 2 files changed, 18 insertions(+), 2 deletions(-)

12. git revert 2997876c4a1a5864baa13d7393c2b68cf5b51183

After reverting the first bad commit, the kernel boots without any problems.=




