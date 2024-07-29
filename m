Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B83293F44F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 13:41:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=mKmAhjZN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXbzh2HgQz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 21:41:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=mKmAhjZN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 428 seconds by postgrey-1.37 at boromir; Mon, 29 Jul 2024 21:40:55 AEST
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXbyv0zq0z3cH2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 21:40:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wW9pxkDzQg+yBW1oIEL/KaRBqPYRvqr8l7NCyzI1vz8=; b=mKmAhjZND32uINvoMlw8aAwV45
	JM8gYQ5yvZxJN9wwL5vOmaP9p9S4woOwnZ0QHbHYGf806WmsaApv6dRXJmvZmK443XlFau4HOK7ty
	PS1EOh+d95auyIjLW3cnUBc2m95ln+UEU39BI7kAt9oAgI8LjL4HzS341sX85VNHppwtBuwtTxWE0
	Ulrebm3qogVzFVpthb9yxcTPLXeTs8KauIprCix8nuCPkm3DJlNpNDU65BaNzE8zXehNuISKUkpUy
	4LOdrFf8xxRKGrTz914qlqIxvyGdrpytWDdz3IW1aet706cA2r7tYL6tXWhsvmN5J1VABBJOwP5gD
	9btd+zpg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55110)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sYOcq-00045I-1a;
	Mon, 29 Jul 2024 12:33:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sYOcp-0004HW-NT; Mon, 29 Jul 2024 12:33:11 +0100
Date: Mon, 29 Jul 2024 12:33:11 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/3] mm: turn USE_SPLIT_PTE_PTLOCKS /
 USE_SPLIT_PTE_PTLOCKS into Kconfig options
Message-ID: <Zqd998jx8NJK+BNX@shell.armlinux.org.uk>
References: <20240726150728.3159964-1-david@redhat.com>
 <20240726150728.3159964-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726150728.3159964-2-david@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, xen-devel@lists.xenproject.org, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>, Christian Brauner <brauner@kernel.org>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 26, 2024 at 05:07:26PM +0200, David Hildenbrand wrote:
> Let's clean that up a bit and prepare for depending on
> CONFIG_SPLIT_PMD_PTLOCKS in other Kconfig options.
> 
> More cleanups would be reasonable (like the arch-specific "depends on"
> for CONFIG_SPLIT_PTE_PTLOCKS), but we'll leave that for another day.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
