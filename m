Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0CE8C652A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 12:51:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=NF9gzcOP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfVQL6lVLz3cQX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 20:51:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=NF9gzcOP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 483 seconds by postgrey-1.37 at boromir; Wed, 15 May 2024 20:50:42 AEST
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfVPZ56n8z2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 20:50:42 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 794B040E0177;
	Wed, 15 May 2024 10:42:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DN6m_2lNWs-3; Wed, 15 May 2024 10:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1715769736; bh=yE3F00zgM8Ec+9gOT9ropjs1xEfw03srAD/IRCzOsCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NF9gzcOPp3NEXxQP1UT1pm+893enKzfIqMDg4FkR4pUW/VdY2DPBwvTsuAF9q2/yT
	 cvemirL8rRWJ6epprTVOcMQLyuSdATdiS1B5sm7Uh4oeQrBiWWNaqXGPX2y04mV2B7
	 IwUmmPMi3Wn0VURN0/J4Ivrk2PGNu5YZPXKUdbI10ZruZTrShRiYcPeKuQ+8Pm3KwJ
	 fkiIQApQIwIPEuizLhxsaUQXWm/ZwZJZGAL7afibQBKpRP5pSea6d+LULH4M02XgAN
	 eDXwLlq+RFaOVCQAGekgDJ3aGDgTCbOWeblnxc+IwFZnB/mUcwXo1ztBG8wstAmihh
	 wAXZG3k7Hn78xuqNUN6b0pOukBQCMQbmzUeA45c2xvWj1c2Q7BTnZaKW57BzWDsbLc
	 6k/H7I1PQOUssTSKSDxTryAvBdTsq6ELtEGefmisVxs888/HFTX1GkUfQiEZYH0jxi
	 Vd4dlDKWRt/ZwziRTS033lDSDrFZAkshSAaRTjdeP3JClni+aL81VZKH86gtbiSW6n
	 Z+d0vd0VuJj77aYXEAP3shLZYWnOA6FEiOs8/+eBDjbYbGhEsU0QEva8fJ5nXjL4aN
	 x7w1U/pYSI6LuUDaKh/GScF6KHnUBNQDhwynqB3Z3GKewEOdm7W5u0ARbBAdOx4T3z
	 AZrHBIBJn+8FGNYk19MVlGME=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DE9BD40E016A;
	Wed, 15 May 2024 10:41:47 +0000 (UTC)
Date: Wed, 15 May 2024 12:41:42 +0200
From: Borislav Petkov <bp@alien8.de>
To: Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <20240515104142.GBZkSRZsa3cxJ3DKVy@fat_crate.local>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240510182926.763131-2-axelrasmussen@google.com>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Oscar Salvador <osalvador@suse.de>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 10, 2024 at 11:29:26AM -0700, Axel Rasmussen wrote:
> @@ -3938,7 +3938,7 @@ static vm_fault_t handle_pte_marker(struct vm_fault *vmf)
>  
>  	/* Higher priority than uffd-wp when data corrupted */
>  	if (marker & PTE_MARKER_POISONED)
> -		return VM_FAULT_HWPOISON;
> +		return VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_SILENT;

If you know here that this poisoning should be silent, why do you have
to make it all complicated and propagate it into arch code, waste
a separate VM_FAULT flag just for that instead of simply returning here
a VM_FAULT_COMPLETED or some other innocuous value which would stop
processing the fault?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
