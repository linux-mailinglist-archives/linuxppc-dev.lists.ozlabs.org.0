Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 654ED46B6D1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 10:13:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7ZMb2mcxz3cN2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 20:12:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=srs.iliad.fr (client-ip=212.27.33.1; helo=ns.iliad.fr;
 envelope-from=srs0=gozv9/=qy=freebox.fr=mbizon@srs.iliad.fr;
 receiver=<UNKNOWN>)
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7ZLk3tMJz2yWL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 20:12:14 +1100 (AEDT)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 64AAB20870;
 Tue,  7 Dec 2021 10:03:58 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 4AE6920289;
 Tue,  7 Dec 2021 10:03:58 +0100 (CET)
Message-ID: <266a430090341526b2cd259be1266654381b1d86.camel@freebox.fr>
Subject: Re: [PATCH v2] powerpc/32s: Fix kasan_init_region() for KASAN
From: Maxime Bizon <mbizon@freebox.fr>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Date: Tue, 07 Dec 2021 10:03:58 +0100
In-Reply-To: <90826d123e3e28b840f284412b150a1e13ed62fb.1638799954.git.christophe.leroy@csgroup.eu>
References: <90826d123e3e28b840f284412b150a1e13ed62fb.1638799954.git.christophe.leroy@csgroup.eu>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Tue Dec  7 10:03:58 2021 +0100 (CET)
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Mon, 2021-12-06 at 14:12 +0000, Christophe Leroy wrote:

Tested-by: Maxime Bizon <mbizon@freebox.fr>

-- 
Maxime



