Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 629AF35C6D4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 14:57:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJpfP1xKZz3c72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 22:57:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ttKtKfHT;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rsZEHxCy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=ttKtKfHT; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=rsZEHxCy; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJpdW25SKz30C5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 22:56:15 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1618231686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=msG8qht51owt3dOAb8bO2Q/JGreHFsZAw+taKjc/k/0=;
 b=ttKtKfHTkJMwc/7gd8FTEtSE7z6D37j94Fd9vBOq7/5KqXfG2VdD2seAIKa2ZxaQ4sr7+l
 nGov0CrV1JbRb/6kaL2bDGO5CNfBL55UWrXwSPTp/4omJnPFHeNed6WfSyqWBQ3KmL3ynH
 newr6bQfGxD9dMNXt6q5i0rz6hRhJHgMjhz3FnJwvjooffnIE6uwtqgu01N6O1OqwKInHm
 zkc7OCVHrlvOtjOeaZrixX0yZlVwt194a6ixyUZ9nJP1DJjxf/uBUshsd+nV+d7HP3FQNj
 5oqdCabdmEpESdF41ciIKsY2CEGM6wPLhZWSPSB0fik0mvawW34S24fH2eHTaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1618231686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=msG8qht51owt3dOAb8bO2Q/JGreHFsZAw+taKjc/k/0=;
 b=rsZEHxCyPYPtlclpxkmK9d9/VTx1jx273GBJjXOqpEEbmozWkgV2sLzK2xydvH3QpabVRr
 WclALlc+a7gZW9Ag==
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH RESEND v1 2/4] lib/vdso: Add vdso_data pointer as input to
 __arch_get_timens_vdso_data()
In-Reply-To: <539c4204b1baa77c55f758904a1ea239abbc7a5c.1617209142.git.christophe.leroy@csgroup.eu>
Date: Mon, 12 Apr 2021 14:48:06 +0200
Message-ID: <87pmyz1xfd.ffs@nanos.tec.linutronix.de>
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, dima@arista.com,
 linux-kernel@vger.kernel.org, avagin@gmail.com, luto@kernel.org,
 vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 31 2021 at 16:48, Christophe Leroy wrote:
> For the same reason as commit e876f0b69dc9 ("lib/vdso: Allow
> architectures to provide the vdso data pointer"), powerpc wants to
> avoid calculation of relative position to code.
>
> As the timens_vdso_data is next page to vdso_data, provide
> vdso_data pointer to __arch_get_timens_vdso_data() in order
> to ease the calculation on powerpc in following patches.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
