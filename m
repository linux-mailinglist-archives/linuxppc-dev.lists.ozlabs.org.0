Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA8B322364
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 02:14:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dl1KN2wJ4z3cSy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 12:14:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ib8ZIzG1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ib8ZIzG1; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dl1Jy0pwMz30LT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 12:13:37 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dl1Js3xT9z9sS8;
 Tue, 23 Feb 2021 12:13:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1614042816;
 bh=FAcIZ5QF9ArI7FFOyovUOaKnveLQ6XJR1r7QpX3zQzg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ib8ZIzG1GEbGcHcBE1SB4ZyJSeZWWenriFLSahoMqCiVPPPyFHLBAgI5S9mB7CY4f
 PapNrBrGhVMP01t8FXhxqZABzcaNn6Fk9lwUFdsZqPIqofMSlo7pR5vKA+6Z4ZLrFD
 XOMGiDYTlqtryPeeKOQQj6KkIkXKn3YDo9PMyloUTQhQHk+ZsvHV8z6QWdUfYSwaJD
 SwN2ZD2EfMuNgqpo5bKflJq+gVIQ8/H5HeMjvAgVL61GUvtO4N+bHY/bZbZjOC3aFo
 YuYo9rJ9Z/PFtk13tejf7P5/7o6QzWkaCGANjpMAm+2ErvJ/W3pyG7EBFpjJbiblmM
 iYlCp/DdbhkIw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-1 tag
In-Reply-To: <CAL_Jsq+5u82rS+izM2Ds0jdsQKc9C_MCFLmmRvrxhD_6ofNiJQ@mail.gmail.com>
References: <87o8gctii6.fsf@mpe.ellerman.id.au>
 <CAL_Jsq+5u82rS+izM2Ds0jdsQKc9C_MCFLmmRvrxhD_6ofNiJQ@mail.gmail.com>
Date: Tue, 23 Feb 2021 12:13:33 +1100
Message-ID: <87h7m3twle.fsf@mpe.ellerman.id.au>
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
Cc: ananth@linux.ibm.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 kernelfans@gmail.com, cmr@codefail.de, zhengyongjun3@huawei.com,
 Oliver O'Halloran <oohall@gmail.com>, sandipan@linux.ibm.com,
 cy.fan@huawei.com, SF Markus Elfring <elfring@users.sourceforge.net>,
 jiapeng.chong@linux.alibaba.com, skirmisher@protonmail.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, eerykitty@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>, ganeshgr@linux.ibm.com,
 Michal Suchanek <msuchanek@suse.de>, nathanl@linux.ibm.com,
 kjain@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>,
 Mark Brown <broonie@kernel.org>, Qian Cai <cai@lca.pw>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Hari Bathini <hbathini@linux.ibm.com>, atrajeev@linux.vnet.ibm.com,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 fbarrat@linux.ibm.com, po-hsu.lin@canonical.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh@kernel.org> writes:
> On Mon, Feb 22, 2021 at 6:05 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA256
>>
>> Hi Linus,
>>
>> Please pull powerpc updates for 5.12.
>>
>> There will be a conflict with the devicetree tree. It's OK to just take their
>> side of the conflict, we'll fix up the minor behaviour change that causes in a
>> follow-up patch.
>
> The issues turned out to be worse than just this, so I've dropped the
> conflicting change for 5.12.

OK, no worries.

cheers
