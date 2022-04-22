Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4405D50B434
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 11:37:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kl8St0x9zz3bpL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 19:37:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DlL98Qmm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl8SF1kpwz2ygC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Apr 2022 19:36:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DlL98Qmm; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kl8SC4PFHz4xXS;
 Fri, 22 Apr 2022 19:36:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1650620204;
 bh=v8NPrOoUSmPygCfnqB/rFEsanu07lIk8aZKOXiSsbt4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DlL98QmmptAtyh/xohLggJENxp9wwXou1VWdZAcucdyXzO1702WBukr6pGy0rQSGO
 mT66LivgC+ke1qqnkrgu4MLvD6ci5QkR7u0DCDqkv0BxztDdwh5mKf4qXMXJ8LRrrZ
 fjAOAhjDmLP4k4Os6y+9F4+PijETVEEPXCPD8odTa0vD6rV7D9Ab3aQDX4D+5KRK+D
 WDvb4mcVQO+B21vv0cMiu9YzYhyj2jyaaEwHGxkD19uQEpoVdMiIxrh7Q2t9hkOR75
 YbzRFluEjjaZUS3+vNHolMNWKZ+DW3n63ducNzg2fYuoplBI8rYvb34DLAHeMApBYz
 +XNo4dlWY6Dag==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Frederic Barrat <fbarrat@linux.ibm.com>, Hangyu Hua <hbh25y@gmail.com>,
 ajd@linux.ibm.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 alastair@d-silva.org
Subject: Re: [PATCH] misc: ocxl: fix possible double free in
 ocxl_file_register_afu
In-Reply-To: <f76454e3-843d-93b4-e30c-bf374d41802b@linux.ibm.com>
References: <20220418085758.38145-1-hbh25y@gmail.com>
 <87czhbfjsj.fsf@mpe.ellerman.id.au>
 <f76454e3-843d-93b4-e30c-bf374d41802b@linux.ibm.com>
Date: Fri, 22 Apr 2022 19:36:43 +1000
Message-ID: <87tual8no4.fsf@mpe.ellerman.id.au>
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

Frederic Barrat <fbarrat@linux.ibm.com> writes:
> On 21/04/2022 00:54, Michael Ellerman wrote:
>> Hangyu Hua <hbh25y@gmail.com> writes:
>>> info_release() will be called in device_unregister() when info->dev's
>>> reference count is 0. So there is no need to call ocxl_afu_put() and
>>> kfree() again.
>> 
>> Double frees are often exploitable. But it looks to me like this error
>> path is not easily reachable by an attacker.
>> 
>> ocxl_file_register_afu() is only called from ocxl_probe(), and we only
>> go to err_unregister if the sysfs or cdev initialisation fails, which
>> should only happen if we hit ENOMEM, or we have a duplicate device which
>> would be a device-tree/hardware error. But maybe Fred can check more
>> closely, I don't know the driver that well.
>
> The linux devices built here are based on what is parsed on the physical 
> devices. Those could be FPGAs but updating the FPGA image requires root 
> privilege. In any case, duplicate AFU names are possible, that's why the 
> driver adds an index (the afu->config.idx part of the name) to the linux 
> device name. So we would need to mess that up in the driver as well to 
> have a duplicate device name.
> So I would agree the double free is hard to hit.

Thanks for confirming.

> mpe: I think this patch can be taken as is. The "beautification" I 
> talked about is just that and I don't intend to work on it except if 
> something else shows up.

OK, will pick this up.

cheers
