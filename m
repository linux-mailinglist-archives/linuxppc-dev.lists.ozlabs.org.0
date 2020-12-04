Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA3D2CEEA2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 14:09:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnY1z4s92zDqTC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 00:09:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnXg162HWzDrCS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 23:52:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=WtHRDaTv; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CnXfy6wfWz9sWn;
 Fri,  4 Dec 2020 23:52:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607086363;
 bh=tvOvNF+fyEInUIQ8ILdv+XXy4DK3+CrRLA0KyoVLgrg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WtHRDaTvkA2CWbIuDXLEIVe3q1oUHbQ07v/u5uQ/BpHm6i42/WElZ4VdRIEWa8XHr
 sJqg/jgECWobxag+LOx80Iyh8y9knpaCKBXrM/HuXRrw6dVNR9qgnENoQSYM36AK+g
 WZoDZqL3dKAqcTYg1sZkvYoOeyX430jmeDq+gIG8vo7mcJTSoIUq8FNUIMkLPOMAf4
 1dvFvfiH1XA7jQjiUUkMXq+qJbVbDMHH/pFGAGUUmXdxajuQwejR719SqlBT6YeRnv
 VInNORYwd15mQqab02in4YDyRSvaXSmLCt4qcOIKB1F6d4OhFiakK7t83PXBhiyZV/
 yU0966vJRPBGA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 16/29] powerpc/rtas: dispatch partition migration requests
 to pseries
In-Reply-To: <20201030011805.1224603-17-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-17-nathanl@linux.ibm.com>
Date: Fri, 04 Dec 2020 23:52:42 +1100
Message-ID: <874kl1vilh.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> sys_rtas() cannot call ibm,suspend-me directly in the same way it
> handles other inputs. Instead it must dispatch the request to code
> that can first perform the H_JOIN sequence before any call to
> ibm,suspend-me can succeed. Over time kernel/rtas.c has accreted a fair
> amount of platform-specific code to implement this.
>
> Since a different, more robust implementation of the suspend sequence
> is now in the pseries platform code, we want to dispatch the request
> there while minimizing additional dependence on pseries.
>
> Use a weak function that only pseries overrides.

Over the years weak functions have caused their fair share of problems.

There are cases where they are the cleanest option, but for intra-arch
code like this I think and ifdef is much simpler.


> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index fdefe6a974eb..be0fc2536673 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -260,6 +260,7 @@ extern int rtas_suspend_cpu(struct rtas_suspend_me_data *data);
>  extern int rtas_suspend_last_cpu(struct rtas_suspend_me_data *data);
>  int rtas_ibm_suspend_me_unsafe(u64 handle);
>  int rtas_ibm_suspend_me(int *fw_status);
> +int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);

ie. we'd just do:

#ifdef CONFIG_PPC_PSERIES
int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
#else
int rtas_syscall_dispatch_ibm_suspend_me(u64 handle)
{
	return -EINVAL;
}
#endif


cheers
