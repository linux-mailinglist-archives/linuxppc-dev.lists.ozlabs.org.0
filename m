Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0724A462378
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 22:39:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2zJj46prz3c63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 08:39:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ILyfVKGE;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IFrPJPgH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=ILyfVKGE; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=IFrPJPgH; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2zHy5kzyz2xWx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 08:38:54 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638221925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTsTXZmVNEttdKActcp/MQ79Sqm2VlTHeENYuk8KrhE=;
 b=ILyfVKGE5UZvmRThsq5XEtpixIVIivrUSBAXm+humQHTDLzWIKEX4H8+4OD+aeIfZ4DV92
 9T+62U6FIpWYIpoyRwMMumiAWctcb/I9yr1yNfsu8sRnZChwXIMAcSaHOA+Rqc6gRrobwk
 VD1hPi2gr2//sF+SQuC4nahdGSaDafaDW7sBy0aS8tR1r1meQJeCOwOOGRC5aIHAc9Xvk4
 /FJzDlJKlE89PcGuwq4SuMSriWZnI0H29jLtYIq6CXQ6TOUli2NIXrPAh97GMsBqbXW+Qh
 eBXpIwFI96/i9Jnc137e9kO89zceLA086wH/JPWoxTfUn5qn3H8Cfws4QVJy/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638221925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTsTXZmVNEttdKActcp/MQ79Sqm2VlTHeENYuk8KrhE=;
 b=IFrPJPgHlzA5jXpCGMUgcnutoSn2o/emSpKWK3dUIvafMv+/N8+lm8fxoSszjkihxr/hYU
 KzMXez+vjEq3dIDw==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [patch 05/22] genirq/msi: Fixup includes
In-Reply-To: <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
 <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org>
Date: Mon, 29 Nov 2021 22:38:44 +0100
Message-ID: <87tufud4m3.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Kevin Tian <kevin.tian@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Megha Dey <megha.dey@intel.com>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cedric,

On Mon, Nov 29 2021 at 08:33, C=C3=A9dric Le Goater wrote:
> On 11/27/21 02:18, Thomas Gleixner wrote:
>> Remove the kobject.h include from msi.h as it's not required and add a
>> sysfs.h include to the core code instead.
>>=20
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
>
> This patch breaks compile on powerpc :
>
>    CC      arch/powerpc/kernel/msi.o
> In file included from ../arch/powerpc/kernel/msi.c:7:
> ../include/linux/msi.h:410:65: error: =E2=80=98struct cpumask=E2=80=99 de=
clared inside parameter list will not be visible outside of this definition=
 or declaration [-Werror]
>    410 | int msi_domain_set_affinity(struct irq_data *data, const struct =
cpumask *mask,
>        |                                                                 =
^~~~~~~
> cc1: all warnings being treated as errors
>
> Below is fix you can merge in patch 5.

thanks for having a look. I fixed up this and other fallout and pushed out =
an
updated series (all 4 parts) to:

        git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel msi

Thanks,

        tglx
