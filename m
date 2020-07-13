Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7880D21D64B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 14:47:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B53MR11KczDqPl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 22:47:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B53K84x79zDqP4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 22:45:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=U04Y66A8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B53K766Clz9sQt;
 Mon, 13 Jul 2020 22:45:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594644331;
 bh=P26pqzKyPkg1TFY+JeCN6osGX6gbap8LirvV6DqEo3E=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=U04Y66A82+jPnPSSIlIou1Fm50wZYlaMKHZsEohsd3Kdca1spL43+ry/bdCck60xX
 DBOszla7HErZY6+/U2dNkryqH0/KYk9oh3+5sO8uCbjHCw6hhiQoTA/yUuWeSKd80H
 S4Yi/8ac3wXKTM01UCdEwUmAva3urLTJbn5LbJMJYpCE/WrPQxD7NLcFei3TrDXvE0
 KBp4+DGFFkvSDGAcxbabYZeebIzSG+09eAol+6vnLJ2k/VzFckPj55LPvI3xcS4kK+
 7FPivpXhBS/4Vv1lvH6Uan8tBZMFdumA3LfSGf9X22iJ5lTesBgo9abMNOry8cfD+9
 f8+bC3MuGeUCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 09/10] tools/perf: Add perf tools support for extended
 register capability in powerpc
In-Reply-To: <FFC0AE06-9BF8-446C-B6D8-C4D62B61FDBE@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-10-git-send-email-atrajeev@linux.vnet.ibm.com>
 <87pn962owo.fsf@mpe.ellerman.id.au>
 <FFC0AE06-9BF8-446C-B6D8-C4D62B61FDBE@linux.vnet.ibm.com>
Date: Mon, 13 Jul 2020 22:47:53 +1000
Message-ID: <87pn8zvax2.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
>> On 08-Jul-2020, at 5:34 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>> 
>> Athira Rajeev <atrajeev@linux.vnet.ibm.com <mailto:atrajeev@linux.vnet.ibm.com>> writes:
>>> From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
>>> 
>>> Add extended regs to sample_reg_mask in the tool side to use
>>> with `-I?` option. Perf tools side uses extended mask to display
...
>> 
>>> +	 */
>>> +	get_cpuid(buffer, sizeof(buffer));
>>> +	ret = sscanf(buffer, "%u,", &version);
>> 
>> This is powerpc specific code, why not just use mfspr(SPRN_PVR), rather
>> than redirecting via printf/sscanf.
>
> Hi Michael
>
> For perf tools, defines for `mfspr` , `SPRN_PVR` are in arch/powerpc/util/header.c 
> So I have re-used existing utility. Otherwise, we will need to include these defines here as well
> Does that sounds good ?

They should be moved to a header in that directory that both C files can include.

cheers
