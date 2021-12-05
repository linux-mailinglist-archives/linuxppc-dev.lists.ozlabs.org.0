Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B5468D7C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Dec 2021 22:44:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6g7t2XCFz2yfm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 08:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=srs.iliad.fr (client-ip=212.27.33.1; helo=ns.iliad.fr;
 envelope-from=srs0=os5f8w=qw=freebox.fr=mbizon@srs.iliad.fr;
 receiver=<UNKNOWN>)
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6g7Q00fGz2xCy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 08:44:14 +1100 (AEDT)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 9D5C11FFE1;
 Sun,  5 Dec 2021 22:44:09 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ns.iliad.fr (Postfix) with ESMTPS id 8FE841FFBD;
 Sun,  5 Dec 2021 22:44:09 +0100 (CET)
Date: Sun, 5 Dec 2021 22:44:08 +0100
From: Maxime Bizon <mbizon@freebox.fr>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Message-ID: <20211205214408.GC29658@sakura>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
 <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
 <20211204141031.GA23757@sakura>
 <5f4d36a1-695d-38a7-9ff9-d5af97f1a7e0@csgroup.eu>
 <20211205164217.GA29658@sakura>
 <d39825e0-6b48-5ac1-662e-26186e730eaa@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d39825e0-6b48-5ac1-662e-26186e730eaa@csgroup.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Sun Dec  5 22:44:09 2021 +0100 (CET)
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Sunday 05 Dec 2021 à 18:11:59 (+0000), Christophe Leroy wrote:

> > Is BAT5 needed here ?
> 
> Sure it is, because that's were kernel expects lowmem to be mapped. 
> Allthough the kernel will unlikely access the 128M reserved for KASAN 
> directly, the other 128M are still needed.
> 

Yes that was my point

I'm wondering if for specific PAGE_OFFSET values, __mmu_mapin_ram()
ends using a BAT to map exactly the KASAN area, thus wasting it
because the kernel would never/rarely access it.

Or worse, it could consume the latest BAT available, and there would
be none left for the actual KASAN vm area

Maybe mmu_mapin_ram() could clamp top to KASAN phys start.

-- 
Maxime
