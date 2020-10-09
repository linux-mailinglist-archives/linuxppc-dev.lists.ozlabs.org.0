Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEAA288154
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 06:29:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6w7x1hwNzDqXf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 15:29:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6w5s22VgzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 15:27:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XDFEAlcD; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6w5r33RDz9sRk;
 Fri,  9 Oct 2020 15:27:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602217648;
 bh=H2YLiXuGkBSqOqzwg+471E2SZ2wWV5jW7UmnJSOd8cc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XDFEAlcD3LRDwyj46ai4x6PWqZs9fNY9RjyeaHa9fWQwwC/fE63SuWxqpth0o5crN
 7gPntlBH9UKer+B2CFkJrewrzuUAHjd9tfBbLdDHmhTHWQnQaSB82BZD60XJZ6WID4
 yi/0Bb8iKeDd+Z5UPwSBu98qHkoITNoJRGaus3+TRigIHbZfUm07NW/FXZJbkQfygM
 bnNJoYvV+aAaateddOfQvrfPeaiYcTjY/caxHEqaORlIw+h2nBMFe+xqyzHZj739Rt
 9Sq2USsaTcy/eC8wb8AMiXOJDpA7qbtxBlJJiK+P539Ow6tejrjbUn4wvzZo2D0Swn
 pJvVSPA57aTfA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: Fixes tag needs some work in the powerpc tree
In-Reply-To: <20201009075816.0cb5a86f@canb.auug.org.au>
References: <20201009075816.0cb5a86f@canb.auug.org.au>
Date: Fri, 09 Oct 2020 15:27:25 +1100
Message-ID: <87ft6o10sy.fsf@mpe.ellerman.id.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> In commit
>
>   a2d0230b91f7 ("cpufreq: powernv: Fix frame-size-overflow in powernv_cpufreq_reboot_notifier")
>
> Fixes tag
>
>   Fixes: cf30af76 ("cpufreq: powernv: Set the cpus to nominal frequency during reboot/kexec")

Gah.

I've changed my scripts to make this a hard error when I'm applying
patches.

cheers
