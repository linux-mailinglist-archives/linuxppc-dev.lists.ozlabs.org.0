Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB6524F17C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 05:18:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZckv2gk5zDqQy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 13:17:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZcjL05yPzDqQW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 13:16:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=AbX/5AnX; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BZcjK64rPz9sTF; Mon, 24 Aug 2020 13:16:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BZcjK4dg7z9sT6;
 Mon, 24 Aug 2020 13:16:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1598238997;
 bh=poxDGuxQh4qdop80Jcv3/uVTNCxslAPY/Q+LFsPieYA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=AbX/5AnXaENk9T1yvWUU+o5XzxtbibRkaUcJFxxKy0SLN/YYVO+vmg5Sds6JziJwf
 FfFP4AN358zbzzYaIgtx/CHrqSb5QQrIfpQphzCJUHg4FuAkTek76XwItlKWcUgwXc
 pZYdxD02q+D+jvmkuWmuzAd2BVKiXPFwQymiMk86Aj1j0TUiOGh6V51U2lGamBN9P8
 WpOxGhr0b8vcNU+cZY9bTQ+tJnkAq4t0ITBobyMoLbG6jNSeVEYSInqhpUWjyTJKsb
 qmvL9rRRDuVj1qw9lCCyCx5JkIk6aySbzQWOjslE+eV9ui0//dBSzOVD+L5m8stP5Y
 U5WNo386y2NIQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/prom_init: Check display props exist before
 enabling btext
In-Reply-To: <b0b2c5ba-4b3a-f125-d7f7-49822489c923@ozlabs.ru>
References: <20200821103407.3362149-1-mpe@ellerman.id.au>
 <b0b2c5ba-4b3a-f125-d7f7-49822489c923@ozlabs.ru>
Date: Mon, 24 Aug 2020 13:16:34 +1000
Message-ID: <87sgcchgx9.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> On 21/08/2020 20:34, Michael Ellerman wrote:
>> It's possible to enable CONFIG_PPC_EARLY_DEBUG_BOOTX for a pseries
>> kernel (maybe it shouldn't be), which is then booted with qemu/slof.
>
>
> CONFIG_BOOTX_TEXT=y
> CONFIG_PPC_EARLY_DEBUG=y
> CONFIG_PPC_EARLY_DEBUG_BOOTX=y
>
> this does not crash my VM. The changed chunk is sitting under "if
> (prom_getprop(node, "linux,boot-display", NULL, 0)" and I cannot find
> what creates this property - it is neither slof/grub/qemu, unlikely that
> it is phyp so it must be this one:
>
> arch/powerpc/platforms/powermac/bootx_init.c|244|
> bootx_dt_add_string("linux,boot-display", mem_end);

It's in prom_init.c:

static void __init prom_init_stdout(void)
{
...
	stdout_node = call_prom("instance-to-package", 1, 1, prom.stdout);
	if (stdout_node != PROM_ERROR) {
		val = cpu_to_be32(stdout_node);

		/* If it's a display, note it */
		memset(type, 0, sizeof(type));
		prom_getprop(stdout_node, "device_type", type, sizeof(type));
		if (prom_strcmp(type, "display") == 0)
			prom_setprop(stdout_node, path, "linux,boot-display", NULL, 0);
	}
}

> which is powermac and not pseries. Or may be that pmac firmware.
>
> Where did you see this crash?

Qemu pseries either TCG or KVM with eg:

$ qemu-system-ppc64 -M pseries -cpu POWER8 -m 1G -kernel build~/vmlinux


>> But if you do that the kernel crashes in draw_byte(), with a DAR
>> pointing somewhere near INT_MAX.
>> 
>> Adding some debug to prom_init we see that we're not able to read the
>> "address" property from OF, so we're just using whatever junk value
>> was on the stack.
>> 
>> So check the properties can be read properly from OF, if not we bail
>> out before initialising btext, which avoids the crash.
>
> This is a right thing any way, just the commit log is confusing.
>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Thanks.

cheers
