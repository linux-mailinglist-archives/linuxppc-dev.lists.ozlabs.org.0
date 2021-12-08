Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEB646DD5C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 21:57:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8TyB14Pxz3c9b
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 07:57:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=NIPhL0sg;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=KF19qqsU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=NIPhL0sg; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=KF19qqsU; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8TxV4Hxrz2yQ9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 07:57:02 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638997011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RI9goYiyaxxlyowVIy50GRXpRhCNUYZrM4r3seD1bKI=;
 b=NIPhL0sgn8M0aJUIi890pmZGlk891yoUSSDMnC4hnbyawxG2Kyh7G1sHH/xsmtSWUM8FfZ
 FyiBCPJVbWpXpFfMUl77mb1l8QqDIF5HigALgdn/RYqTMPCpOHMr0KIFCokDN7aLnrEdks
 8rrnfZKCxcaetGnTQyHUg4mAfEc2N1sxXiIWn5IbWqnhikYmOYt6fknKqXzV7CdqL4P4H4
 8ZS0DFKNdnSGea2HezKm7Hkc6llGKcBl9S+VI9FjnibvCSYHAcSlNTnETtfGbCxdf3f6N4
 HjxoAKj0UnKj8JjZlpBFr0/NMCZQnVLvInv7aT9TCLkwNt6S0nNqOl/aBjfedw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638997011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RI9goYiyaxxlyowVIy50GRXpRhCNUYZrM4r3seD1bKI=;
 b=KF19qqsUtSG+rWG9NpEYyzGIEvbq/ti9eoiMayWfd1iK3FYz9roP5HeWY227THj1hSYyZu
 bO4E+0TC1Z5Br/AA==
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [patch V2 20/23] PCI/MSI: Move msi_lock to struct pci_dev
In-Reply-To: <20211208152925.GU6385@nvidia.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.925241961@linutronix.de>
 <20211208152925.GU6385@nvidia.com>
Date: Wed, 08 Dec 2021 21:56:50 +0100
Message-ID: <871r2m24tp.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Ashok Raj <ashok.raj@intel.com>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 08 2021 at 11:29, Jason Gunthorpe wrote:
> On Mon, Dec 06, 2021 at 11:27:56PM +0100, Thomas Gleixner wrote:
>>  	if (!desc->pci.msi_attrib.can_mask)
>
> It looks like most of the time this is called by an irq_chip, except
> for a few special cases list pci_msi_shutdown()
>
> Is this something that should ideally go away someday and use some
> lock in the irq_chip - not unlike what we've thought is needed for
> IMS?

Some day we'll have that yes.
