Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E103464114
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 23:11:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3bz81txNz3cVM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 09:11:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cfCUOIaP;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OS4mhIe7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=cfCUOIaP; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=OS4mhIe7; 
 dkim-atps=neutral
Received: from galois.linutronix.de (unknown [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3byP4nD1z30Ph
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 09:10:53 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638310245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQwNm3evMDmCqqNj6SOBSL2raZeNEDMRyVYLWo7plsQ=;
 b=cfCUOIaPomiZCO9d79k8QaTA54iAEZbQY4lmYzVXbCZ99fBBPE+xqpOo1m4nSfa3KPq6+6
 pI8jqClQqAQ6e9xEzGMdMDMlM7PO3wO+IzFhUB7wl4w2H81v2euyyU8OpSzUxgKY+0HqOn
 tbRxYHYo0OtQnM7fMd/Q2RflLcOK0WEbJRcLaARC9aG5kGkie13cZuSuCFIva1m+TA616i
 dV35DJLlXGyNBE5vTnPj0hgLjo4pBUrYZ1WEUXNY8Y4DNEBT5I7kTI7Vt9Tc5Lg2J+Di+B
 X84UlqMbc2Q4lC6o9mfXgbNv2vVK1HCIjDj9nJ/ptp3y+rYMnW5ZpEnm9xcPOg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638310245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQwNm3evMDmCqqNj6SOBSL2raZeNEDMRyVYLWo7plsQ=;
 b=OS4mhIe7yFZLurVEyelXc9LbdOQ2hxFAIJTEo5kZyIy2QO7wrWZZMF3x6KmDym+n1S953w
 D2cPy3zCOhdCl9Bg==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [patch 05/22] genirq/msi: Fixup includes
In-Reply-To: <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.382273262@linutronix.de>
 <b1a6d267-c7b4-c4b9-ab0e-f5cc32bfe9bf@kaod.org> <87tufud4m3.ffs@tglx>
 <524d9b84-caa8-dd6f-bb5e-9fc906d279c0@kaod.org>
Date: Tue, 30 Nov 2021 23:10:45 +0100
Message-ID: <87czmhb8gq.ffs@tglx>
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

On Tue, Nov 30 2021 at 22:48, C=C3=A9dric Le Goater wrote:
> On 11/29/21 22:38, Thomas Gleixner wrote:
>> On Mon, Nov 29 2021 at 08:33, C=C3=A9dric Le Goater wrote:
>> thanks for having a look. I fixed up this and other fallout and pushed o=
ut an
>> updated series (all 4 parts) to:
>>=20
>>          git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel msi
>
> pSeries fails to allocate MSIs starting with this patch :
>
>   [PATCH 049/101] powerpc/pseries/msi: Let core code check for contiguous=
 ...
>
> I will dig in later on.

Let me stare at the core function..
