Return-Path: <linuxppc-dev+bounces-17137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDQtI55XnmkjUwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 02:59:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A718B19059E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 02:59:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLHpd57Jxz3dJ5;
	Wed, 25 Feb 2026 12:59:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771975996;
	cv=none; b=YeJidVzf0sJBEQ0K/h0zCzLrVqln7uCn7SGTgpXXyI36kVTmda94UsFm6BpJJ55lypizq52sHtnxkKz12A5soerUtmU+6AHTq8PHDP04q54WwMk6pgLisNWW30zgePxqtGpxi0bukkzDO3nAUA+v83cSLITNP/mlFyFtZPyPxKDh23YlMgSM21KVv/MPq1iTL32M0Xn6zK5C+kbKJyCc/OD/qRniL4/j5yhvY2pb8qswI1fT++gl2Uqe3f6oi5G1uJAAiXz27AS/g38ciX3AMWvwRz9gLiv+rUv/Ad1hD6vmWRsnGhAqyu2BpZbhE/Pnhyw1E1kLlOHVxl3ex+iRrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771975996; c=relaxed/relaxed;
	bh=KwQalYMWTwMP4M+FQW5xwdF4J5kMnovp49C0rT2vdQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZ9Nn8TrynkV8MrbzAfC0Eu904LUh4IaUy/ocnlO3yDvHc6RccsCjDLOjBs+Tk8BO922d5/ghGsqP3T5skA7x6oYd5g4tY2YYRsz5WSobJT7nAPAdjITVBUL4AxjLycN3JBSejHMBJNa/yKRsTcGPgK3EjvUzEYuePYfOuR7z6mzkwePeezziPmzkMEfdQiGbuRCGjcfKXo1K3+hiIV9M7te96GTifBNdjL4SijEIal6zmUfvzJ4odRrey782CGGL9e0aqMJRZtkVLOQhB9D002IZFkYuTSEQaj0WNQBVpcW4GQWIIEZ3WPH6FoG3RRaRgCUDNPk93cT7tUcgeKjew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=Uukjzxhz; dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=G8QpVoG+; dkim-atps=neutral; spf=pass (client-ip=5.75.144.95; helo=mail.mainlining.org; envelope-from=aelin@mainlining.org; receiver=lists.ozlabs.org) smtp.mailfrom=mainlining.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=Uukjzxhz;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=G8QpVoG+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mainlining.org (client-ip=5.75.144.95; helo=mail.mainlining.org; envelope-from=aelin@mainlining.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 146 seconds by postgrey-1.37 at boromir; Wed, 25 Feb 2026 10:33:14 AEDT
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLDYQ2700z3clw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 10:33:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1771975841; bh=KwQalYMWTwMP4M+FQW5xwdF
	4J5kMnovp49C0rT2vdQ4=; b=Uukjzxhz3Dr+cXdlOV+aSFORFmnTUjXYjGwrVS20vC9V65UcL2
	6zIJXYirK0rR121RJOnzJ8r3FJgnPDOqDYCByUo9GWr4QctA470jTXacjULZ8/bNk202VwC4Kof
	bgx55G+1yENEvyNcAzvEPHMUNfM0+6OouO/vmJsgQealIzSgJHp+WhTKH1N92KrTFCdDtedcExM
	N0Iqe4R7VCY1DbIfXnAf1iWysnpadQ1lWCOcAd5Nfnn5kC8xvO33Be3Zvo8DNTOqKO2TUH4NpyF
	SYHlDR8B4kx6ulcAMOCZCRPA3wsCHLCL1ZVVytH6aGLpAVSAC1UmzMGZZTODtTvE7SQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1771975841; bh=KwQalYMWTwMP4M+FQW5xwdF
	4J5kMnovp49C0rT2vdQ4=; b=G8QpVoG+pfT01hkDnrLnViIoQqYohWptZmGJSHA+Swzqv+Zn91
	iJfFVFalGGzjTaaigF3XMrwKHWfoUpKVBuDA==;
Message-ID: <77cd40dd-bc40-4223-a5db-7eb514c13b78@mainlining.org>
Date: Wed, 25 Feb 2026 00:30:30 +0100
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
Subject: Re: Failure to build with LLVM for the Wii
To: Nathan Chancellor <nathan@kernel.org>, Link Mauve <linkmauve@linkmauve.fr>
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
References: <aXs8sgAcci9FKKpx@luna> <20260129223136.GA1614447@ax162>
Content-Language: en-US
From: Aelin <aelin@mainlining.org>
In-Reply-To: <20260129223136.GA1614447@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17137-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[mainlining.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:linkmauve@linkmauve.fr,m:linuxppc-dev@lists.ozlabs.org,m:llvm@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aelin@mainlining.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[aelin@mainlining.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:mid,mainlining.org:dkim]
X-Rspamd-Queue-Id: A718B19059E
X-Rspamd-Action: no action

On 1/29/26 11:31 PM, Nathan Chancellor wrote:
> Hi Link,
> 
> On Thu, Jan 29, 2026 at 11:55:46AM +0100, Link Mauve wrote:
>> I’m trying to build the kernel for the Nintendo Wii, using LLVM instead
>> of gcc, in order to bring Rust support to this architecture (and also
>> because my distribution doesn’t ship a cross-compiling gcc), but I get
>> this build issue near the end:
>> ```
>> % make O=wii LLVM=1 ARCH=powerpc -j1
>> make[1]: Entering directory '/home/linkmauve/dev/linux/wii'
>>    GEN     Makefile
>>    CALL    ../scripts/checksyscalls.sh
>>    DESCEND objtool
>>    INSTALL libsubcmd_headers
>>    WRAP    arch/powerpc/boot/dtbImage.wii
>> objcopy: Unable to recognise the format of the input file `vmlinux'
>> make[3]: *** [../arch/powerpc/boot/Makefile:394: arch/powerpc/boot/dtbImage.wii] Error 1
>> make[2]: *** [../arch/powerpc/Makefile:236: zImage] Error 2
>> make[1]: *** [/home/linkmauve/dev/linux/Makefile:248: __sub-make] Error 2
>> make[1]: Leaving directory '/home/linkmauve/dev/linux/wii'
>> make: *** [Makefile:248: __sub-make] Error 2
>> ```
>>
>> I believe it should use $(OBJCOPY) instead of objcopy, which is set to
>> llvm-objcopy, but couldn’t figure out where it is misconfigured.
>>
>> Thanks for your help!
> 
> It is the arch/powerpc/boot/wrapper script:
> 
>    https://github.com/ClangBuiltLinux/linux/issues/1601
> 
> I have a WIP series from long ago that may be a good starting point for
> getting something working but there were some errors I never got around
> to solving before having to shelve it for other issues:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git/log/?h=wip/llvm-1-powerpc-boot-wrapper
> 
> Maybe something I (or someone else) can get back to soon.
> 
> Cheers,
> Nathan
> 

Hi Nathan,

your last 3 patches on this branch do indeed fix the wrapper script for 
the cross-compilation with LLVM=1 ARCH=powerpc without CROSS_COMPILE set 
or GNU binutils in PATH. They look good to me! Would you be willing to 
submit them now without touching the VDSO? That part does not seem to be 
necessary to fix the wrapper script for this usecase, so it should 
strictly be an improvement. I'd also be happy to pick up your patches, 
send them and follow-up on feedback if you don't want to do it yourself.

Best regards,
Aelin

