Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C6B2165BA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 07:02:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B19KS3yZZzDqjx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 15:02:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B19Gq2Hl6zDqfd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 15:00:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=e24J9WNf; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B19Gp6Vy9z9sRW;
 Tue,  7 Jul 2020 15:00:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594098002;
 bh=qDNlXxruII/hOeMjCvoY0ny45kkmACQh9VrTXrPfGYw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=e24J9WNfadbuc56Af3UCz71NVubCYGikOKH/THYJL6UkZDcDrcbt85LaSXEy0Pg0W
 5zvZB96CmYHRUR8wa5Qv4Jyodgrt6jo2UehdKAcX8eix/bgMEXXzzl8mahr7dp7DFz
 E/hyPxwDTtyqhiRCtF1d+8DOkph+3S/H+tMxmwfjOPkMZhG8d2s6j95YxTdXMGO4Ew
 7XLEqs59nWp5SelTi3YbuXM+Bedy3wRaUrhEKBoYgCWe5iuGTFIrOQk7bmKNCbe2Do
 p3r8y+RGY45CVUnJPWGyMs1STnOoeH95UPH6G+aCQcR3wSE32hSWbL2eBCTkWvaEAI
 dCFpIpsDy4VkQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/numa: Restrict possible nodes based on platform
In-Reply-To: <20200706064002.14848-1-srikar@linux.vnet.ibm.com>
References: <20200706064002.14848-1-srikar@linux.vnet.ibm.com>
Date: Tue, 07 Jul 2020 15:02:17 +1000
Message-ID: <87lfjv5352.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> As per PAPR, there are 2 device tree property
> ibm,max-associativity-domains (which defines the maximum number of
> domains that the firmware i.e PowerVM can support) and
> ibm,current-associativity-domains (which defines the maximum number of
> domains that the platform can support). Value of
> ibm,max-associativity-domains property is always greater than or equal
> to ibm,current-associativity-domains property.

Where is it documented?

It's definitely not in LoPAPR.

> Powerpc currently uses ibm,max-associativity-domains  property while
> setting the possible number of nodes. This is currently set at 32.
> However the possible number of nodes for a platform may be significantly
> less. Hence set the possible number of nodes based on
> ibm,current-associativity-domains property.
>
> $ lsprop /proc/device-tree/rtas/ibm,*associ*-domains
> /proc/device-tree/rtas/ibm,current-associativity-domains
> 		 00000005 00000001 00000002 00000002 00000002 00000010
> /proc/device-tree/rtas/ibm,max-associativity-domains
> 		 00000005 00000001 00000008 00000020 00000020 00000100
>
> $ cat /sys/devices/system/node/possible ##Before patch
> 0-31
>
> $ cat /sys/devices/system/node/possible ##After patch
> 0-1
>
> Note the maximum nodes this platform can support is only 2 but the
> possible nodes is set to 32.

But what about LPM to a system with more nodes?

cheers
