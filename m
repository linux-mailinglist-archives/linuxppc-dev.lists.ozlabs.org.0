Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B04EF4E6AEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 23:59:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPgdZ4552z3bNt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 09:59:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fyBDbM5x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPgcw2C77z2xZW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 09:58:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fyBDbM5x; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KPgcr6fS0z4xc3;
 Fri, 25 Mar 2022 09:58:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1648162717;
 bh=9mUaJKOCjtLjsX0dOtZbbF6gHgOfPO3/VPH6n7m/iC0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fyBDbM5xUE+5e7ik6rJzKPx1bAMpLvS9a85EGBve1649k823CObbsgRK1UsotDbXv
 /vHeIupzOiwCL7YJl31srS8e4DsI+SRS+V8VFB76E/FUmDCvw224Ps+RwAA5XBYWTD
 +yRBY+2rLg92FNmej/VIhJ6BnQYObpuJNcQReoO6hk7+KFzaSWfvsnlqdUiw7N0tm6
 pGHQAEZi/yGtEWyBIZr+yfhe2J36/G1TOUMguY63cVVfNEVBtTLL312xm116bzP1bd
 yO2JfzMK2Oz13Z0nL+loFBf598Kc5yZn14NTqSbh0QnOYkT/SaXU05N9mul6kPEp70
 b2dm1sN5KImdw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Murilo Opsfelder =?utf-8?Q?Ara=C3=BAjo?= <mopsfelder@gmail.com>, "Naveen
 N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc: Reject probes on instructions that can't
 be single stepped
In-Reply-To: <9b5ec756-a074-390a-0955-6d973eacac28@gmail.com>
References: <cover.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
 <e81779aa105d67799742c3e3f59075dce9f05cfb.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
 <9b5ec756-a074-390a-0955-6d973eacac28@gmail.com>
Date: Fri, 25 Mar 2022 09:58:33 +1100
Message-ID: <8735j7gdpi.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Murilo Opsfelder Ara=C3=BAjo <mopsfelder@gmail.com> writes:
> On 3/23/22 08:51, Naveen N. Rao wrote:
...
>> +	case 31:
>> +		switch ((inst >> 1) & 0x3ff) {
>> +		case 4:		/* tw */
>> +			return false;
>> +		case 68:	/* td */
>> +			return false;
>> +		case 146:	/* mtmsr */
>> +			return false;
>> +		case 178:	/* mtmsrd */
>> +			return false;
>> +		}
>> +		break;
>> +	}
>> +	return true;
>> +}
>> +
>
> Can't OP_* definitions from ppc-opcode.h be used for all of these switch-=
case statements?

Yes please. And add any that are missing.

cheers
