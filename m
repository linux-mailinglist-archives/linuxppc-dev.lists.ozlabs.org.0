Return-Path: <linuxppc-dev+bounces-14476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 925E3C83BF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 08:38:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFvhC6BFDz2yw7;
	Tue, 25 Nov 2025 18:38:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764056331;
	cv=none; b=lLSYURL4FZUBv2dcod7RIUBHd4xJPdUo6PA04s5GqdT2psEvTsAXhRYwd1lkuEeEM0ud75KK4ELnClAJF97ODj9J0UgRHlTghVWzj981xAUNeWZT5tbTY7Shq2ca5zGP22fQKZ8GkBUMcLLgUQFFS2TnraoBuBbErH0CFJXBkOl3QVnjcgl/I51G1g5TmqsluyetbF3UI7qyAo/T2jM0vYer5QMP1vZ+e0+uXd6py/M8T13wNlXmRE5YMkbM+x0cqsLxYIvHDHmuWGNt2iiJ2ZW1E55rlPbX1rSrlPkgAIAP9pTWadodcK3ZzPR8crmI9jO1gxStsCc1d900KpZX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764056331; c=relaxed/relaxed;
	bh=p4pBkH0YWfKJN5q6WL03Qhp4upTmcflVePx/OPirsio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iydavXG23XPDsApgzi+IsJ9sFuSMDwV6RbM1IwrhY9zpFMIkH404ApdJric/Oxe/CpOeJDw9XehdmfFmvmX0uf5xgvQjPaXcq0zsJYLDxper3da7YrJg2pVjIyT8P80V3ZuwO0QxMBSmWwdUX3ejY1YULhTrMEDCvDgzr7TXx5dkRRKLD0SQRL+11EsbaUq9AKTk5wKtb7gFM6Ve5jDWWOvTulgSeSFL+iClQlwp9kxSbt0oBP8sE8ACBBo2y+bcdEWqUvDU6HovQRZY5LZEqAWGPUKNpSKtQyLYhq9UoB7jccsdrpru2zyW6O/s4FNm8sws7aDwKFm9OtCq7TOFig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gy3jEZ6G; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gy3jEZ6G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFvhB44Pbz2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 18:38:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 331C3404E1;
	Tue, 25 Nov 2025 07:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312EAC4CEF1;
	Tue, 25 Nov 2025 07:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764056328;
	bh=V446la7lPJcpR4QJvyHjkwF5F2AFxzrJ0W2j6ahgRHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gy3jEZ6GGZG2+oYYBtMo5H8l2Cm8oY0NhDnhxHYpLnqN/GwaE2MZUDoHOFFlkhWzC
	 Vjb/u/SwMq51pdfaE6nrYFGlNXMVRKyLIZkaG9N4xR7G/bewrsB1G5rxfJcYwSH8Lg
	 ei7pT19+gv400Y1myjfV1y+rkZ9oQyiVa1NbeAUcu8EJqLOoAD7JyVg3eVc3oVHG7Q
	 KqzHDTVAGWkHHMxYgeeUKABly272YQr3dcIb9uUjenxZSx1rlvVzMLe1TkJhnmUYSs
	 OU2BD1ETmngg6y2Msqlg42+5bNNSmqkPVR0jhOr3rNWhRYg60S7TF1/vrjFUJMO10K
	 /qJGrmrPhYCvQ==
Message-ID: <897c6ba7-e27d-4170-be56-4d0f544bfa42@kernel.org>
Date: Tue, 25 Nov 2025 08:38:40 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:core/rseq 25/39] include/linux/rseq_entry.h:132:3: error:
 invalid operand for instruction
To: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar
 <mingo@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org, Nathan Chancellor <nathan@kernel.org>
References: <202511250134.i0Jm8d7I-lkp@intel.com> <874iqji6n1.ffs@tglx>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <874iqji6n1.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 24/11/2025 à 20:15, Thomas Gleixner a écrit :
> On Tue, Nov 25 2025 at 01:37, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/rseq
>> head:   21782b3a5cd40892cb2995aa1ec3e74dd1112f1d
>> commit: abc850e7616c91ebaa3f5ba3617ab0a104d45039 [25/39] rseq: Provide and use rseq_update_user_cs()
>> config: powerpc-randconfig-002-20251124 (https://download.01.org/0day-ci/archive/20251125/202511250134.i0Jm8d7I-lkp@intel.com/config)
>> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250134.i0Jm8d7I-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202511250134.i0Jm8d7I-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     In file included from kernel/rseq.c:75:
>>>> include/linux/rseq_entry.h:132:3: error: invalid operand for instruction
>>                     unsafe_get_user(start_ip, &ucs->start_ip, efault);
>>                     ^
>>     include/linux/uaccess.h:606:2: note: expanded from macro 'unsafe_get_user'
>>             arch_unsafe_get_user(x, ptr, local_label);      \
>>             ^
>>     arch/powerpc/include/asm/uaccess.h:458:2: note: expanded from macro 'arch_unsafe_get_user'
>>             __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
>>             ^
>>     arch/powerpc/include/asm/uaccess.h:282:2: note: expanded from macro '__get_user_size_goto'
>>             __get_user_size_allowed(x, ptr, size, __gus_retval);    \
>>             ^
>>     arch/powerpc/include/asm/uaccess.h:273:10: note: expanded from macro '__get_user_size_allowed'
>>             case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
>>                     ^
>>     arch/powerpc/include/asm/uaccess.h:256:4: note: expanded from macro '__get_user_asm2'
>>                     "       li %1+1,0\n"                    \
>>                      ^
>>     <inline asm>:7:5: note: instantiated into assembly here
>>             li 31+1,0
> 
> Definitely not a problem of tip core/rseq. It just ends up in
> __get_user_asm2() and then the compiler gets unhappy about the PowerPC
> inline assembly for whatever reason.

I see it is a CLANG build.

CLANG might be less flexible, can you test with following change ?

diff --git a/arch/powerpc/include/asm/uaccess.h 
b/arch/powerpc/include/asm/uaccess.h
index 4f5a46a77fa2..33d5f7ade254 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -253,7 +253,7 @@ __gus_failed:								\
  		".section .fixup,\"ax\"\n"		\
  		"4:	li %0,%3\n"			\
  		"	li %1,0\n"			\
-		"	li %1+1,0\n"			\
+		"	li %L1,0\n"			\
  		"	b 3b\n"				\
  		".previous\n"				\
  		EX_TABLE(1b, 4b)			\


Thanks
Christophe

