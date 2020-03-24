Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A8219049E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 05:49:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mf0f6vHfzDqkd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 15:49:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mdyw2QBDzDqTl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 15:47:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZKDb9UyS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48mdyt6sMWz9sQt;
 Tue, 24 Mar 2020 15:47:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585025256;
 bh=eqi/v0a6DbFHrDzrxmOXFZgLWISAx9HNAd7CmQW2dvY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZKDb9UySEgPx3dQom6x12AFQi9YWWb05OSLUxbi6q2t4U9P5skHiCRi0ClQ/9p2GN
 9inTSNSA50qJFmjQ1tbgeu7ALkrHuEnHdOHjdghNq3tIHtpmiLRalTxQYCamKTnAXx
 N4qlqZljA8kuILxI+lDqGa927TCvNrst+I4Gsy7NKlnMaRmUb2kNaI7gHKWJye4hpe
 5IBHj85XRBvR5Wyum1BJNSM9KSgCrdwjgypQQrS5VwPdk/dlaFveY04KigHP16PCHp
 SvFo/7rqZWrPDtrSluYShqfjhXoDH38LfWMkJvZhu7WCSzf9w9Ya7WF9p/SKbLje3R
 hUwOF6qNLOLxg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "christophe.leroy\@c-s.fr" <christophe.leroy@c-s.fr>,
 "paulus\@samba.org" <paulus@samba.org>,
 "benh\@kernel.crashing.org" <benh@kernel.crashing.org>,
 "tglx\@linutronix.de" <tglx@linutronix.de>, "cai\@lca.pw" <cai@lca.pw>
Subject: Re: Argh, can't find dcache properties !
In-Reply-To: <be8c123a90f6d1664a902b6ad6c754b9f3d9e567.camel@alliedtelesis.co.nz>
References: <be8c123a90f6d1664a902b6ad6c754b9f3d9e567.camel@alliedtelesis.co.nz>
Date: Tue, 24 Mar 2020 15:47:38 +1100
Message-ID: <87tv2exst1.fsf@mpe.ellerman.id.au>
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
Cc: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Chris Packham <Chris.Packham@alliedtelesis.co.nz> writes:
> Hi All,
>
> Just booting up v5.5.11 on a Freescale T2080RDB and I'm seeing the
> following mesage.
>
> kern.warning linuxbox kernel: Argh, can't find dcache properties !
> kern.warning linuxbox kernel: Argh, can't find icache properties !
>
> This was changed from DBG() to pr_warn() in commit 3b9176e9a874
> ("powerpc/setup_64: fix -Wempty-body warnings") but the message seems
> to be much older than that. So it's probably been an issue on the T2080
> (and other QorIQ SoCs) for a while.

That's an e6500 I think? So 64-bit Book3E.

You'll be getting the default values, which is 64 bytes so I guess that
works in practice.

> Looking at the code the t208x doesn't specifiy any of the d-cache-
> size/i-cache-size properties. Should I add them to silence the warning
> or switch it to pr_debug()/pr_info()?

Yeah ideally you'd add them to the device tree(s) for those boards.

cheers
