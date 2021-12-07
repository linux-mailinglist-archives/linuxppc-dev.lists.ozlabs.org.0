Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF4D46B6AB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 10:07:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7ZFH6jF5z308h
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 20:07:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=srs.iliad.fr (client-ip=212.27.33.1; helo=ns.iliad.fr;
 envelope-from=srs0=gozv9/=qy=freebox.fr=mbizon@srs.iliad.fr;
 receiver=<UNKNOWN>)
X-Greylist: delayed 179 seconds by postgrey-1.36 at boromir;
 Tue, 07 Dec 2021 20:07:04 AEDT
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7ZDm5JcQz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 20:07:04 +1100 (AEDT)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 878432029F;
 Tue,  7 Dec 2021 10:07:02 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 6EDD72022B;
 Tue,  7 Dec 2021 10:07:02 +0100 (CET)
Message-ID: <33c5d1ae4d8e27a66e542c244a39ce94eb4d3d75.camel@freebox.fr>
Subject: Re: [PATCH] powerpc/fixmap: Fix VM debug warning on unmap
From: Maxime Bizon <mbizon@freebox.fr>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Date: Tue, 07 Dec 2021 10:07:02 +0100
In-Reply-To: <b0b752f6f6ecc60653e873f385c6f0dce4e9ab6a.1638789098.git.christophe.leroy@csgroup.eu>
References: <b0b752f6f6ecc60653e873f385c6f0dce4e9ab6a.1638789098.git.christophe.leroy@csgroup.eu>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Tue Dec  7 10:07:02 2021 +0100 (CET)
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
Reply-To: mbizon@freebox.fr
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Mon, 2021-12-06 at 11:11 +0000, Christophe Leroy wrote:
> 
> Reported-by: Maxime Bizon <mbizon@freebox.fr>

Tested-by: Maxime Bizon <mbizon@freebox.fr>

maybe stable ? I had this on 5.15

Thanks !

-- 
Maxime



