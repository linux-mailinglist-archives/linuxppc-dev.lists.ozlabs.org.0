Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC11433ACD5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 08:54:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzTFl644Lz30GH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 18:54:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HaV4OxCB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HaV4OxCB; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzTFL5HVdz2yRR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 18:53:41 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DzTFG14SKz9sR4;
 Mon, 15 Mar 2021 18:53:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615794818;
 bh=xQCuzLxi9dsv6r+6RO199FLqm7bxCzrSOE93vTM7WxM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HaV4OxCBTNSggvH+z9EIAnJyqU87y2nMQu/RDDhPxyZrrnQhYujaAREiUxZzzxd9I
 JUughiX/710n6KpWHmdxYsZWEeQC9ES+zDLjNGDVA2puVkQmB++wX4SaWCFvr0PCwk
 GYmiABrAHJO2AP8p4LnhRqK1/EKWvZL/gAoNMcUdP/MubdszhpDZOe+ynkQrIcE7fM
 rYdYjMwr5UAp0Goh/K+zHKqdk8s4Xfj5b5Hs1zreihTt9eZGpm2w+urU99QAuiitjU
 2QNvUrr7eRCbyOJ0R9hFAuZp6QqBA52yjNW39XQUmPaHU/ZehVDkrHIDKLfgaSPMKI
 3h9Hf+yDeVIbw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: VIO bus not initialized
In-Reply-To: <41c04182-20c1-6124-a221-90aef704e310@molgen.mpg.de>
References: <41c04182-20c1-6124-a221-90aef704e310@molgen.mpg.de>
Date: Mon, 15 Mar 2021 18:53:30 +1100
Message-ID: <87mtv44zut.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Menzel <pmenzel@molgen.mpg.de> writes:
> Dear Linux folks,
>
>
> On the POWER8 system IBM S822LC, Linux 5.12-rc2+ logs the errors below.

That's a bare metal system, you can see that from the line "Using
PowerNV machine description" in the boot log.

>      $ dmesg --level=err
>      [    1.555668] Driver 'hvc_console' was unable to register with 
> bus_type 'vio' because the bus was not initialized.
>      [    1.558434] Driver 'tpm_ibmvtpm' was unable to register with 
> bus_type 'vio' because the bus was not initialized.
>      $ grep VIO /boot/config-5.12.0-rc2+
>      CONFIG_IBMVIO=y

The "vio" bus is not a real bus, it's a fake bus we use for hypervisor
provided devices in LPARs (guests).

So on bare metal machines there is no vio bus, the devices that would
appear on the vio bus are found via other mechanisms.

> [    1.555668] Driver 'hvc_console' was unable to register with bus_type 'vio' because the bus was not initialized.
> [    1.555866] hvc0: raw protocol on /ibm,opal/consoles/serial@0 (boot console)
> [    1.555875] hvc0: No interrupts property, using OPAL event

You can see here that the hvc opal driver found the console, which is
the bare metal equivalent of the hvc console (vio) driver.

> [    1.556205] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
> [    1.558377] Non-volatile memory driver v1.3
> [    1.558404] Linux agpgart interface v0.103
> [    1.558434] Driver 'tpm_ibmvtpm' was unable to register with bus_type 'vio' because the bus was not initialized.

The ibmvtpm driver is a Virtual TPM driver, so it also isn't present on
a bare metal system.

I don't think that system has a TPM, but if it did you'd need the
appropriate bare metal TPM driver to use it.

cheers
