Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9BF8170CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 14:49:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=LpgLIC6c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sv1R44mvwz3cS5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 00:49:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=LpgLIC6c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=matthias.schiffer@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sv1QC4MDFz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 00:49:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702907348; x=1734443348;
  h=message-id:subject:from:to:cc:date:
   content-transfer-encoding:mime-version;
  bh=gEzdns6AbQ4AUMf6BKuUSf4VBq0UBBe+qVH4Rxy4SWw=;
  b=LpgLIC6cL8ieOHDD4SFmzfblfpnu1kF4bAsekmWNFKGhvUey3uXiL8r6
   SNLhVZyCpClBtRv2eoWWK7sPgSa4OJ0jCCmf/pLzLmQ/vVzZuDuglOW47
   Mczts0bPL+roCWURHYWe1HPgmMDcCiCKdwBJMuOLeKMhkoKgYkzUgStgA
   bbg15vabHTcJY3WkboUcvCt4L/Kvk6SNisQxLD3OtW1ilnSACgaDRSg1R
   yo7sMQvduP/S8euD7STjOvnJiFWl8cOHiUCEfry6UgDnTQyXlsyxZ35rP
   11kppW+lENFoyfRj3rK2kjKDLm6BvnVxr2uTnuALZvI0K5sxbfdMShisN
   Q==;
X-IronPort-AV: E=Sophos;i="6.04,285,1695679200"; 
   d="scan'208";a="34564229"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Dec 2023 14:49:00 +0100
Received: from [192.168.2.128] (SCHIFFERM-M2.tq-net.de [10.121.53.15])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id EE8A1280075;
	Mon, 18 Dec 2023 14:48:59 +0100 (CET)
Message-ID: <46a002f7fe894c7c7ed8324e48e9cd226e428894.camel@ew.tq-group.com>
Subject: powerpc: several early boot regressions on MPC52xx
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>,  Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Anatolij Gustschin <agust@denx.de>
Date: Mon, 18 Dec 2023 14:48:59 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

I'm currently in the process of porting our ancient TQM5200 SoM to a modern=
 kernel, and I've
identified a number of regressions that cause early boot failures (before t=
he UART console has been
initialized) with arch/powerpc/configs/52xx/tqm5200_defconfig.

Issue 1) Boot fails with CONFIG_PPC_KUAP enabled (enabled by default since =
9f5bd8f1471d7
"powerpc/32s: Activate KUAP and KUEP by default"). The reason is a number o=
f of_iomap() calls in
arch/powerpc/platforms/52xx that should be early_ioremap().

I can fix this up easy enough for mpc5200_simple by changing mpc5200_setup_=
xlb_arbiter() to use
early_ioremap() and moving mpc52xx_map_common_devices() from the setup_arch=
 to the init hook (one
side effect is that mpc52xx_restart() only works a bit later, as it require=
s the mpc52xx_wdt mapping
from mpc52xx_map_common_devices(); I'm not sure if there is a better soluti=
on).

For the other 52xx platforms (efika, lite5200, media5200) things are a bit =
more chaotic, and they
create several more temporary mappings from setup_arch. Either they should =
all be moved to the init
hook as well, or be converted to early_ioremap(), but I can't tell which is=
 more appropriate. As a
first step, I would propose a patch that fixes this for the simple platform=
s and leaves the other
ones unchanged.

(Side note: I also found that before 16132529cee58 ("powerpc/32s: Rework Ke=
rnel Userspace Access
Protection"), boot would succeed even with KUAP enabled without changing th=
e incorrect of_iomap(); I
guess the old implementation was more lenient about the incorrect calls tha=
t the kernel warns
about?)

Issue 2) Boot fails with CONFIG_STRICT_KERNEL_RWX enabled, which is also th=
e default nowadays.

I have not found the cause of this boot failure yet; is there any way to de=
bug this if the failure
happens before the UART is available and I currently don't have JTAG for th=
is hardware?

Best regards,
Matthias



--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
