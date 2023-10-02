Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B55547B4D7C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 10:46:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=MQkPj/YY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzZL74m6rz3cJW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 19:46:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=MQkPj/YY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=j.granados@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzZKB4Rm4z2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Oct 2023 19:45:16 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231002084505euoutp01fb9e35bc49f515d59e33424780696c7e~KPe7KjgFR0323303233euoutp01u;
	Mon,  2 Oct 2023 08:45:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231002084505euoutp01fb9e35bc49f515d59e33424780696c7e~KPe7KjgFR0323303233euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1696236305;
	bh=MfG6uvtWqwYS3hUjD7i3Vm3Qw+seaAzqjsgKpcpPTXc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=MQkPj/YYZojQfQ+LNVfnzf8jz246t0mrUSsC2ovXHcIZ1h/jCmZQNU6FJUOa2rdt4
	 flqjb07+Br/pbjes8R7Xwkc+qgANdNQpKwNTvvUoXPCh7jmyR68DpZYMygCBuqoBtS
	 GcHZmQYQrKxKkAIdZrRktzAyGOCWPDDRKQwf9J2U=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20231002084505eucas1p115a2ab283972a79272c9757322300ea8~KPe6yvJRk0202102021eucas1p1y;
	Mon,  2 Oct 2023 08:45:05 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 01.57.11320.0138A156; Mon,  2
	Oct 2023 09:45:04 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20231002084504eucas1p2e863940ef31a9248d26fbdac6e2f10bd~KPe6NrvJh2499424994eucas1p26;
	Mon,  2 Oct 2023 08:45:04 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231002084504eusmtrp2355d41d9c4268753d9081165e45db786~KPe6MOGC-1131111311eusmtrp2J;
	Mon,  2 Oct 2023 08:45:04 +0000 (GMT)
X-AuditID: cbfec7f4-97dff70000022c38-05-651a8310756d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id B4.7B.25043.0138A156; Mon,  2
	Oct 2023 09:45:04 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20231002084504eusmtip28840686475f95888ee0878a6362b3046~KPe52TrE52171321713eusmtip2Q;
	Mon,  2 Oct 2023 08:45:04 +0000 (GMT)
Received: from localhost (106.110.32.133) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Mon, 2 Oct 2023 09:45:03 +0100
Date: Mon, 2 Oct 2023 10:47:18 +0200
From: Joel Granados <j.granados@samsung.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 00/15] sysctl: Remove sentinel elements from drivers
Message-ID: <20231002084718.bmme7yi4xfs7sw4b@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="22qnx6bxaciji5uu"
Content-Disposition: inline
In-Reply-To: <5fadd85e-f2d7-878c-b709-3523e89dd93a@csgroup.eu>
X-Originating-IP: [106.110.32.133]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2VTe1BUdRSe372Xexdq9S4g/lrRMdKcEDel1GOiouPktabGhpwpGaUdvIEl
	i+6CkUghLm95LC9xFVlEHkKtCBsKIThoCwTxGFAegRChpGDSyAqys2tsF8uZ/vvOd77vnPP9
	cUSk4xAjFR1QhPBKhfygG+1AVRqftq1iT0j51c2TAI3d5wmwpBkZ6E8bZeBC428EPKvUkHC2
	TU1BrbocQW329zR0mR7RoK+OJuCucZiBE/mXaLh9hYMzqRUEFHVeQjB0SwrneyoJOJ3diOBs
	ryf8meMK1/Jm5+mCoSUxCNork+1gpPQHBjJmCkjI1EzQ0Fl9lobY3GoE9+qTKEjsvkpDS34S
	A+Ypqx0UNVgJ6Em9iyAhJRaBUecC02azHdQMjSB40jyOILNQBjmTmSQUj+eQUKe9zUDB6WIS
	GoosNJTq/aAu4zsSrjdnzFLWoxB98ikDN8r7CDBPzy6eMqQT3uu4zq73OfNMGuLORHZQnKm3
	leAMF3sJrr+gCnHXnugorko7wHC68lCuuvo4w1UUu3P5NfcJzhK/jusb28SVl8TT3HRxCrlr
	6R4Hr/38wQNHeOWbmz9zCDSc60aHbq4OS42/TkeisRUJyF6E2bfxCZOVTEAOIke2GOGGKTMt
	FJMIX44um+s8Rri/WcM8tww/S0JCowjh+2VJdv+q7tU9mPNXIHzyj6xZv0hEscvw5NB6m5tm
	PXDbeP8/tDPriZPHeJucZGOd8EBZJ7JpnFgOp95vJ21YzK7HEwUFdgKW4KbTI5QNk2wYHsy8
	Q9jmkOwiXGQV2Wh7djNWx6ZTwqFu2DSeZCfgCPyzoY+w7cJs2svYrL7O2LyY3Y4Ng8sFjRN+
	0GCYC+mKn1XlzunTEa6zTjBCUYpw4XETIag2YnXXyJxjK+7IzULC0Hm456FEuHMeTqs8RQq0
	GMfFOArq13HpnXEqFb2mfSGZ9oVk2v+SCbQM92Rm0P+jV+LCvDFSwJuwXv+I0iGmBC3kQ1VB
	AbzKU8F/JVPJg1ShigCZf3BQOZp9vGZrw+RVVPTgL1k9IkSoHi2bNQ+XlbYjKaUIVvBuzuKY
	dhfeUbxf/vVRXhnspww9yKvq0SIR5bZQvHJTk78jGyAP4b/k+UO88nmXENlLIwnxEunh3o5V
	b21tVe9dYPbtSFg+Y14TERVwZktMSP+WTrwrLGrHpOmbiys8pkJkn2gIX7fwtRrNsPoc1+/7
	YUrigihJ1u753nEf7xNJc53fyDHmpe0ZMvqEy7r1HU2v/hTlWlhvkesf+xvsp0v2Sn6/tS1w
	wm/tYl8XH3BqceYVfbqlA8nF4RFxXWHvemQOfuAdueGY5HM/L2n+4oygvTtHR+FyzkR+gHJi
	525J+A6Xldy+jaeWaX6psQ62Zh8+ZtFW1Orny5dEfnshSmzxufHjw8JP+frROJ/phyaPV7xf
	am074nvknWkq1mtxVcI2o6X81ysbhr94T7e2yXzzo5hCd78RPOxGqQLla9xJpUr+Nx9hMbLz
	BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA2VTe0xTdxT2d2+5LWTMK+3wBnDDhkwmrFKg5eAAx2ay60zcmNnMBsoaveEx
	2rKWOmQzYQPGS6C8HBTIilCLsIE8BwTBIQMUFRDlYRhBBBYGEwwPga6wYllmsv++33e+7zsn
	J+fHwW2MhB0nTBbFKGSSCD5hxerZ6Bp7k4yzY9wGZl+G7qFLGBizOtkwmvUHG0q7H2Gw2ZCJ
	Q2FvPAta42sQtOb9TMD95XkCKpsTMJjqnGBDXEkVAYO/0FCgrsVAP1CFYPyBHVwabsAgP68b
	QeGIOzwpcoBrxaY8rRxup0qhryHdAiYr6tmQs67DITdzgYCB5kICEn9sRjDdnsaC1KFGAm6X
	pLHB8GzDAvRdGxgMq6cQpGQkIujU2sKqwWABLeOTCFZ65hDkXhZA0VIuDmVzRTi0aQbZoMsv
	w6FLbySgojIY2nJ+wuF6T46J2oiBhAtrbLhR8xADw6qp8bO6bOxtMT1w/yhtWM9CdEFsP4te
	HrmL0XVXRjB6VNeE6GsrWhbdpPmdTWtrVHRz87dsurZsP13SMoPRxmQx/XDWl64pTybo1bIM
	/EPHzwQ+CrkqinEMlSujfPmBQnAXCL1B4O7pLRB6eJ086C7iH/DzOcNEhJ1lFAf8PheEVq2P
	EpHtbtG5PYsWsWhmXwqy5FCkJzWxmYZSkBXHhtQharp5w8JccKCqlx5sYy7192AKYRY9RdS4
	UbftqEXU3JNl04PDYZFO1NK415aBIF2p3rlRfIvmke5U+iyzJcfJRC51L6kK39JwSZpSz/Q9
	x9akF7Wg01mYMx8hypjaQpgLu6ib+ZOsLYyTZ6nH6+PPe+GkPaXf4GzRlqQfFZ+YzTIPyqeW
	59K2hz5PLRqnkRpxNS8kaV5I0vyXZKZdqab6UeJ/tAt1uXgWN2NfqrJynqVF7HLEY1RKaYhU
	6S5QSqRKlSxEcFourUGm22/oXKtrRFf+fCpoRxgHtSMnk3PiakUfsmPJ5DKGz7P+vs+WsbE+
	IzkXwyjkwQpVBKNsRyLTEjNxu1dOy00fSRYVLBS7iYSeYm83kbfYg7/b+khkksSGDJFEMV8w
	TCSj+NeHcSztYjH9W9kfkfr0PX5ueR3f3VWNBrbtPrQpOKGuj3k96MJQ6FfczYJXlyX1roIf
	hk7Jbr3n7DlwPHP+xHTMEcmenR1T2r3Bp97o5jpHRyf3hld+snLxuqjWumFl0ceWOb82WWwr
	2xE/3BjlXNqZsc/VOS/6TseNcIeg9GxuXGwp73hB7OOgq0W1rRWiozzxrhzvPteWAPuLko/L
	HKuzNAn2Bec8/KXawvCcQN5v9+q+GRODzKl0YW/FMatsf3VTmp79dXWpR+uUf/etwxFeh8rf
	ef81r7z6nccMSXXJsZYu3Ck0c/LO4TG3sIORZTv+CunnVf6Kqz4N6OcPudh+EBIwLHy3P+Cl
	m1/yWcpQiXA/rlBK/gG5K7+SkAQAAA==
X-CMS-MailID: 20231002084504eucas1p2e863940ef31a9248d26fbdac6e2f10bd
X-Msg-Generator: CA
X-RootMTR: 20230928163139eucas1p261a3b6b6cc62bafd5ace2771926911c2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230928163139eucas1p261a3b6b6cc62bafd5ace2771926911c2
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
	<CGME20230928163139eucas1p261a3b6b6cc62bafd5ace2771926911c2@eucas1p2.samsung.com>
	<5fadd85e-f2d7-878c-b709-3523e89dd93a@csgroup.eu>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Steve Wahl <steve.wahl@hpe.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Phillip Potter <phil@philpotter.co.uk>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>, Russ Weight <russell.h.weight@intel.com>, Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>, Leon Romanovsky <leon@kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, David Airlie <airlied@gmail.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Dexuan Cui <decui@microsoft.com>, "willy@infradead.org" <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Doug Gilbert <dgilbert@interlog.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, "josh@joshtriplett.org" <josh@joshtriplett.org>, Jani Nikula <jani.nikula@linux.intel.com>, "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>, Juergen Gross <jgross@suse.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Theodore Ts'o <tytso@mit.edu>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Robin Holt <robinmholt@gmail.com>, "David S. Miller" <davem@davemloft.net>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, "netdev@vger.kernel.org" <netdev@vger.kerne
 l.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--22qnx6bxaciji5uu
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 04:31:30PM +0000, Christophe Leroy wrote:
>=20
>=20
> Le 28/09/2023 =E0 15:21, Joel Granados via B4 Relay a =E9crit=A0:
> > From: Joel Granados <j.granados@samsung.com>
>=20
> Automatic test fails on powerpc, see=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230928-jag-sysc=
tl_remove_empty_elem_drivers-v1-15-e59120fca9f9@samsung.com/
=46rom this I got to this URL
https://github.com/linuxppc/linux-snowpatch/actions/runs/6339718136/job/172=
21399242
and saw this message "sysctl table check failed: dev/tty/ No proc_handler".
This means that we hit the check for entry->proc_handler in
sysctl_check_table.

>=20
> Kernel attempted to read user page (1a111316) - exploit attempt? (uid: 0)
> BUG: Unable to handle kernel data access on read at 0x1a111316
> Faulting instruction address: 0xc0545338
> Oops: Kernel access of bad area, sig: 11 [#1]
> BE PAGE_SIZE=3D4K PowerPC 44x Platform
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Not tainted 6.5.0-rc6-gdef13277bacb #1
> Hardware name: amcc,bamboo 440GR Rev. B 0x422218d3 PowerPC 44x Platform
> NIP:  c0545338 LR: c0548468 CTR: ffffffff
> REGS: c084fae0 TRAP: 0300   Not tainted  (6.5.0-rc6-gdef13277bacb)
> MSR:  00021000 <CE,ME>  CR: 84004288  XER: 00000000
> DEAR: 1a111316 ESR: 00000000
> GPR00: c0548468 c084fbd0 c0888000 c084fc99 00000000 c084fc7c 1a110316=20
> 000affff
> GPR08: ffffffff c084fd18 1a111316 04ffffff 22000282 00000000 c00027c0=20
> 00000000
> GPR16: 00000000 00000000 c0040000 c003d544 00000001 c003eb2c 096023d4=20
> 00000000
> GPR24: c0636502 c0636502 c084fc74 c0588510 c084fc68 c084fc7c c084fc99=20
> 00000002
> NIP [c0545338] string+0x78/0x148
> LR [c0548468] vsnprintf+0x3d8/0x824
> Call Trace:
> [c084fbd0] [c084fc7c] 0xc084fc7c (unreliable)
> [c084fbe0] [c0548468] vsnprintf+0x3d8/0x824
> [c084fc30] [c0072dec] vprintk_store+0x17c/0x4c8
> [c084fcc0] [c007322c] vprintk_emit+0xf4/0x2a0
> [c084fd00] [c0073d04] _printk+0x60/0x88
> [c084fd40] [c01ab63c] sysctl_err+0x78/0xa4
> [c084fd80] [c01ab404] __register_sysctl_table+0x6a0/0x6c4
> [c084fde0] [c06a585c] __register_sysctl_init+0x30/0x78
> [c084fe00] [c06a8cc8] tty_init+0x44/0x168
> [c084fe30] [c00023c4] do_one_initcall+0x64/0x2a0
> [c084fea0] [c068f060] kernel_init_freeable+0x184/0x230
> [c084fee0] [c00027e4] kernel_init+0x24/0x124
> [c084ff00] [c000f1fc] ret_from_kernel_user_thread+0x14/0x1c
I followed this trace and proc_handler is correctly defined in tty_table
(struct ctl_table) in drivers/tty/tty_io.c:tty_init and there is not
path that changes these values.
Additionally, we then fail trying to print instead of continuing with
the initialization. My conjecture is that this might be due to something
different than tht sysctl register call.

Does this happen consistenly or is this just a one off issue?

To what branch are these patches being applied to?

I'm going to post my V2 and keep working on this issue if it pops up
again.

Thx for the report

Best

> --- interrupt: 0 at 0x0
> NIP:  00000000 LR: 00000000 CTR: 00000000
> REGS: c084ff10 TRAP: 0000   Not tainted  (6.5.0-rc6-gdef13277bacb)
> MSR:  00000000 <>  CR: 00000000  XER: 00000000
>=20
> GPR00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000=20
> 00000000
> GPR08: 00000000 00000000 00000000 00000000 00000000 00000000 00000000=20
> 00000000
> GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000=20
> 00000000
> GPR24: 00000000 00000000 00000000 00000000 00000000 00000000 00000000=20
> 00000000
> NIP [00000000] 0x0
> LR [00000000] 0x0
> --- interrupt: 0
> Code: 91610008 90e1000c 4bffd0b5 80010014 38210010 7c0803a6 4e800020=20
> 409d0008 99230000 38630001 38840001 4240ffd0 <7d2a20ae> 7f851840=20
> 5528063e 2c080000
> ---[ end trace 0000000000000000 ]---
>=20
> note: swapper[1] exited with irqs disabled
> Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b
>=20
>=20
> >=20
> > What?
> > These commits remove the sentinel element (last empty element) from the
> > sysctl arrays of all the files under the "drivers/" directory that use a
> > sysctl array for registration. The merging of the preparation patches
> > (in https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.o=
rg/)
> > to mainline allows us to just remove sentinel elements without changing
> > behavior (more info here [1]).
<--- snip --->
> >   drivers/macintosh/mac_hid.c                   |  3 +-
> >   drivers/md/md.c                               |  3 +-
> >   drivers/misc/sgi-xp/xpc_main.c                |  6 ++--
> >   drivers/net/vrf.c                             |  3 +-
> >   drivers/parport/procfs.c                      | 42 ++++++++++++------=
---------
> >   drivers/scsi/scsi_sysctl.c                    |  3 +-
> >   drivers/scsi/sg.c                             |  3 +-
> >   drivers/tty/tty_io.c                          |  3 +-
> >   drivers/xen/balloon.c                         |  3 +-
> >   18 files changed, 36 insertions(+), 60 deletions(-)
> > ---
> > base-commit: 0e945134b680040b8613e962f586d91b6d40292d
> > change-id: 20230927-jag-sysctl_remove_empty_elem_drivers-f034962a0d8c
> >=20
> > Best regards,

--=20

Joel Granados

--22qnx6bxaciji5uu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmUag40ACgkQupfNUreW
QU+k6Qv/eD1tR528WiSAoTELGGsaAFMefu4D6RODiEV+j4aejsVFiiZQtvCnuDld
Q7eZa99m0YuSFUId6C/idLOSE3ts/RGQVjAcK3+Xre1NgBEuDZvQXUW73NswWc0K
D/5nBlOV4wruseOy1EpqK9kZW/lQj8ndfezX/HImXDh04rS7f8o7THOTqH+odhzr
Lh63Jj6oSjGemd/L6y4TfjwVRNIQIsuY5YYQas4AqLpIna3aceEz6v3YSbeh8uCu
BuBVHVEO61MMhqXJiIQR3frh8Vl+PxVqNeroKsUoxdcJkJPBDMLk0bS+D7ZZkPyM
SYN9Z4q/LPZCgtnwa4gIqbFtG1xlSRYN2GZB0WtfGn2s52Ap1mFTsAjsChieI/gO
W/xzMyZYKnKi+amN1ZY9rF8xefnGw3Nxfec83YOxL1TKux3nYjS1s8qiunYh6qfp
p2LoIi7PGK4LC3C38mNdYCZPHdCzg1y1jqWGDt37odmd7awNTjbuk2dmzcaf+8Gt
0zl7OZ7E
=RwMQ
-----END PGP SIGNATURE-----

--22qnx6bxaciji5uu--
