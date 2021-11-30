Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 028ED4641AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 23:42:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3cfQ5gPkz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 09:42:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2IrmNv3I;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wP+0RlPV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=2IrmNv3I; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=wP+0RlPV; 
 dkim-atps=neutral
Received: from galois.linutronix.de (unknown [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3cdm54Wnz2ybD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 09:41:32 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638312089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bOw8HEe7jHxyt1BTzbWx6wvk9iJpbF5Gn0Kg7y1Blo=;
 b=2IrmNv3Iea3b/0P87xEGqZAZmwL1onSUMGqd0zxtDIRJLTynmNSC7uxIH8L/l5dtLj/5OD
 JagFWx3aJMiS1LFIeYftEfo0Ur2kNjTtrOTkBnBmsBzvAxM9ucbFfqPVN5bViblbdfTyHh
 DmsunGG30VGceQJj3KLRF3KIyBTUwjdi6+cIFEZFOGwVLxR6/Qv+GDEs3kZsbO3Sb5vEY4
 CGDmi02z+2/4fP0CRSLAGmUXhnn/6DLG04oqIJtIelaVlS8RIp1r9e2Sxk09e7hCcOFzEs
 b9sVLSs/CWxPIfpw834x9ILDVWh3TWdsOj5JuMEeZ6q+sN/NVCvFkfOxPIzp8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638312089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bOw8HEe7jHxyt1BTzbWx6wvk9iJpbF5Gn0Kg7y1Blo=;
 b=wP+0RlPVEZMaKpggmpseYFDjn/awmzpDeY9BMit0WIgaUAvSVTefpWgNK6fro3P2SJv3Ar
 0+sa+FEk57SExTAA==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [patch 05/22] genirq/msi: Fixup includes
In-Reply-To: <87czmhb8gq.ffs@tglx>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
 <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org> <87tufud4m3.ffs@tglx>
 <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org> <87czmhb8gq.ffs@tglx>
Date: Tue, 30 Nov 2021 23:41:28 +0100
Message-ID: <875ys9b71j.ffs@tglx>
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

On Tue, Nov 30 2021 at 23:10, Thomas Gleixner wrote:

> On Tue, Nov 30 2021 at 22:48, C=C3=A9dric Le Goater wrote:
>> On 11/29/21 22:38, Thomas Gleixner wrote:
>>> On Mon, Nov 29 2021 at 08:33, C=C3=A9dric Le Goater wrote:
>>> thanks for having a look. I fixed up this and other fallout and pushed =
out an
>>> updated series (all 4 parts) to:
>>>=20
>>>          git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel msi
>>
>> pSeries fails to allocate MSIs starting with this patch :
>>
>>   [PATCH 049/101] powerpc/pseries/msi: Let core code check for contiguou=
s ...
>>
>> I will dig in later on.
>
> Let me stare at the core function..

It's not the core function. It's the patch above and I'm a moron.

--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -359,9 +359,6 @@ static int rtas_prepare_msi_irqs(struct
 	if (quota && quota < nvec)
 		return quota;
=20
-	if (type =3D=3D PCI_CAP_ID_MSIX)
-		return -EINVAL;
-
 	/*
 	 * Firmware currently refuse any non power of two allocation
 	 * so we round up if the quota will allow it.
