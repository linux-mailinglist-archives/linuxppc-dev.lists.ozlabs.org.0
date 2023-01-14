Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3E66AE2C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 22:23:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NvWVx5RSLz3fCd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 08:23:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hjE2/s2u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hjE2/s2u;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NvWTx3BYVz2xB5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jan 2023 08:22:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mqxDHmIXjVqhP3WLJe5qBtSK7Sgj26Sq5u701NmDRT4=; b=hjE2/s2u2plBiNcc95t9J1LDtu
	mOVQhCNyUZev7uvpWjI5kXb3Tnze49ll5VaM+XLZZdi0qKx7UEJT4XXOdxR61teQWTcXi9+mOIMYP
	2Bw48RSzTelmbcXvxBDX0a8WnZQbksZk19wXPyEPtzSSVSalv6OtxmU85FpIqxJrH/hZdcDlEuJHr
	eYMbUUh2gnp/IK56pBpaPIKEd0a8OTZ/vpAqjVUITzChGlhG132TJOr6/MYKOvqC/YDtI13lpxh2d
	x9QPaotwyKSD3ledao2u7gprjGu/J/2AZB8uHTPwYLNb8M76S8q0h7dnqV3lI5xLoOx84+UkG0l0j
	hhG/KYUQ==;
Received: from [146.74.94.74] (helo=[10.21.74.101])
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pGnyv-004rae-2x;
	Sat, 14 Jan 2023 21:22:30 +0000
Message-ID: <284aed88-dc26-d74a-cf7a-f5875ba058eb@infradead.org>
Date: Sat, 14 Jan 2023 13:22:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] powerpc/ps3: Change updateboltedpp panic to info
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1672767868.git.geoff@infradead.org>
 <2df879d982809c05b0dfade57942fe03dbe9e7de.1672767868.git.geoff@infradead.org>
 <25cc9a51-2311-d7d3-3451-08725e6384cd@csgroup.eu>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <25cc9a51-2311-d7d3-3451-08725e6384cd@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 1/9/23 09:41, Christophe Leroy wrote:
> 
> 
> Le 03/01/2023 à 18:51, Geoff Levand a écrit :
>> Commit fdacae8a84024474afff234bdd1dbe19ad597a10 (powerpc: Activate
>> CONFIG_STRICT_KERNEL_RWX by default) causes ps3_hpte_updateboltedpp()
>> to be called.  Change the panic statment in ps3_hpte_updateboltedpp()
>> to a pr_info statement so that bootup can continue.
> 
> But if I understand correctly, it means that CONFIG_STRICT_KERNEL_RWX 
> won't work then.
> 
> So, shouldn't we keep the panic and forbid CONFIG_STRICT_KERNEL_RWX on PS3 ?

mmu_hash_ops.updateboltedpp returns void, so I can't return an error code to
indicate the feature is not supported.

I could do something like this in arch/powerpc/Kconfig:

-       select ARCH_HAS_STRICT_KERNEL_RWX       if (PPC_BOOK3S || PPC_8xx || 40x) && !HIBERNATION
+       select ARCH_HAS_STRICT_KERNEL_RWX       if (PPC_BOOK3S || PPC_8xx || 40x) && !PPC_PS3 && !HIBERNATION

But then the ppc64_defconfig would be built without STRICT_KERNEL_RWX.

I could do this in ps3_defconfig:

+# CONFIG_STRICT_KERNEL_RWX is not set
+# CONFIG_STRICT_MODULE_RWX is not set

But I don't like that way because it seems too easy for users to not add those
into a custom kernel config, and then they need to figure out what to do after
their kernel panics on startup.

What other 'clean' way is there?

-Geoff


