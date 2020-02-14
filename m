Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE8E15F7A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 21:22:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K4Yb5DXfzDqfb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 07:22:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K3Ws3knLzDqSg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 06:35:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=wky2L3fZ; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48K3Ws1QzRz8t53
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 06:35:53 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48K3Wr5NlMz9sTg; Sat, 15 Feb 2020 06:35:52 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=wky2L3fZ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48K3Wn5zptz9sT4
 for <linuxppc-dev@ozlabs.org>; Sat, 15 Feb 2020 06:35:48 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48K3Wh0bjzz9v0PY;
 Fri, 14 Feb 2020 20:35:44 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=wky2L3fZ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fRwmSp2oRFUE; Fri, 14 Feb 2020 20:35:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48K3Wg6YJkz9v0PS;
 Fri, 14 Feb 2020 20:35:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581708943; bh=It06VmgOjBHCIQmfTWshMQfwb70n2ZmRi9OBJRiwlKc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=wky2L3fZIW+LbRx0i/1C+d6SkbgGnDSdaEBHV9sUflmx+smDj73XnUVyuMFXAJRmA
 bk1lrIWVYK86f7nVL1aJrk7XrN3PZF1WcXLverJy6tsVEhUOS7NhRbQ41HrwvuMfev
 e/VzEu+gEoyatGhcxLMROeJCIwmVBn2wYCeiKyKM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E28798B8A7;
 Fri, 14 Feb 2020 20:35:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ms6M3XX-mOoS; Fri, 14 Feb 2020 20:35:43 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 951EF8B899;
 Fri, 14 Feb 2020 20:35:43 +0100 (CET)
Subject: Re: RESEND: Re: Problem booting a PowerBook G4 Aluminum after commit
 cd08f109 with CONFIG_VMAP_STACK=y
To: Larry Finger <Larry.Finger@lwfinger.net>
References: <f7565b89-c8b2-d2e7-929e-4b1abf72fc63@lwfinger.net>
 <159ed5d8-376b-1642-fb4b-01406d671cf1@c-s.fr>
 <6a1802b8-c6a7-d091-1036-689e089b786f@lwfinger.net>
 <f35ea4e6-7c54-6acc-7d91-3a6eea56133c@c-s.fr>
 <608a1a18-a0ed-2059-bfbc-081c9ef1bfd8@lwfinger.net>
 <a8a38651-974a-819a-810c-83c4097adc10@c-s.fr>
 <7f63e8a8-95c5-eeca-dc79-3c13f4d98d39@lwfinger.net>
 <9429f86e-8c7d-b2e6-6dc1-8f58c44baadc@c-s.fr>
 <2da19b26-9a44-2e4e-ab7d-d3fff65091bd@lwfinger.net>
 <02ce1278-5880-063c-2281-178edd541232@c-s.fr>
 <f3f628ca-4085-e9c2-2c62-170cf9801ac2@lwfinger.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <074f2468-1fbe-0714-df58-b6d2e1d2725b@c-s.fr>
Date: Fri, 14 Feb 2020 19:35:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <f3f628ca-4085-e9c2-2c62-170cf9801ac2@lwfinger.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/14/2020 06:24 PM, Larry Finger wrote:
> On 2/14/20 12:24 AM, Christophe Leroy wrote:
>>
>> Did you try with the patch at 
>> https://patchwork.ozlabs.org/patch/1237387/ ?
> 
> Christophe,
> 
> When I apply that patch, there is an error at
> 
> --- a/arch/powerpc/kernel/head_32.S
> +++ b/arch/powerpc/kernel/head_32.S
> @@ -301,6 +301,39 @@  MachineCheck:
>       . = 0x300
>       DO_KVM  0x300
>   DataAccess:
> 
> It complains about "an attempt to move .org backwards".
> 

Argh !

> When I change the 0x300 to 0x310 in two places, it builds OK. Is that OK?

No you can't do that.

The following should solve it for your case.

---
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 32875afb3319..f9941b766f63 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -270,6 +270,9 @@ __secondary_hold_acknowledge:
   * pointer when we take an exception from supervisor mode.)
   *	-- paulus.
   */
+#ifdef CONFIG_PPC_CHRP
+1:	b	machine_check_in_rtas
+#endif
  	. = 0x200
  	DO_KVM  0x200
  MachineCheck:
@@ -290,12 +293,9 @@ MachineCheck:
  7:	EXCEPTION_PROLOG_2
  	addi	r3,r1,STACK_FRAME_OVERHEAD
  #ifdef CONFIG_PPC_CHRP
-	bne	cr1,1f
+	bne	cr1,1b
  #endif
  	EXC_XFER_STD(0x200, machine_check_exception)
-#ifdef CONFIG_PPC_CHRP
-1:	b	machine_check_in_rtas
-#endif

  /* Data access exception. */
  	. = 0x300
---

Christophe
