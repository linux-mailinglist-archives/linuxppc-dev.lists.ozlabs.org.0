Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0652635016E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:39:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9S950Ddfz3c6y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 00:39:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=c31RFkI1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=c31RFkI1; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9S8h5hGPz30Hr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 00:39:16 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9S8g236Hz9sVb;
 Thu,  1 Apr 2021 00:39:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617197955;
 bh=Wf6CnDfQWgn/hY7cq2C/wa4ZqetQCiDimtarRYDe7Fk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=c31RFkI19rETqVysZaOwWC8u9K7r/4KDXzwaRwGv/tAmIkdwj8sHpKkltWtHiSYgs
 2ATqq1X/CTzmr+oqJkHXgyziksQ2ow6u+dKA7ViOnB/VC+7vAP7CCzXKwd5kDs16k2
 c3AnFQ45Rp2R2QhI+8dz3+philYiBMbm6hBZ4A0DXixQiHlVlkDmGKNs6/KvGIsCQU
 W0efuCKCs+4owJLFCU8g+/kFoEDwNC40D7iysAbymsN0BhTk7Ps3sph7cFNWLD4CaV
 jirTAL/EnmFO3vmvxSxwrjjS7zsnqKnPYw/Wm/QYJ/BcAZIL3yVNbF3+Xsj3gZhJHZ
 oRWibay0XD2oA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/8xx: Load modules closer to kernel text
In-Reply-To: <db20abbecb129c49d3c663de67dac6a87501ac0b.1617001615.git.christophe.leroy@csgroup.eu>
References: <db20abbecb129c49d3c663de67dac6a87501ac0b.1617001615.git.christophe.leroy@csgroup.eu>
Date: Thu, 01 Apr 2021 00:39:14 +1100
Message-ID: <87czvf788t.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> On the 8xx, TASK_SIZE is 0x80000000. The space between TASK_SIZE and
> PAGE_OFFSET is not used.
>
> Use it to load modules in order to minimise the distance between
> kernel text and modules and avoid trampolines in modules to access
> kernel functions or other module functions.
>
> Define a 16Mbytes area for modules, that's more than enough.

16MB seems kind of small.

At least on 64-bit we could potentially have hundreds of MBs of modules.

cheers
