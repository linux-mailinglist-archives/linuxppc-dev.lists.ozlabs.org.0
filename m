Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F556689734
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 11:47:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7XR61jG4z3f7W
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 21:47:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=cpoUbY9B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=cpoUbY9B;
	dkim-atps=neutral
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7XQ51MZyz3f56
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 21:46:18 +1100 (AEDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4P7XPs68r4z9sZY;
	Fri,  3 Feb 2023 11:46:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1675421169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeLhNB/EmrRr3CE09FKm/KcSYjpEU/22igGvsOaFnkA=;
	b=cpoUbY9BTUqoOIJ+eS2Us2GLQLgSvKwoG1UUsG5cAvDIAbRpVNcSAgg3yAbZnuD+UxnAYo
	SJPrld+VaBpygDVbmpfIDcn6LaSlmBIRH9FfViFsSHf0Tt/7HLdchdbTZ2kprOilrcj7zZ
	lB/7SdCpj6npJ5uKZJzXZ9/2WdW4qeB8jKXTXSu6Xfmc4RS/0bdkgn96Wn0Ch+P2Sq5xMI
	BNdTz3SeIRJUic5B3r9TRCQCyOtapGEtAgjYgg5rURphg+YcfkFhfh84Wpz6HWg/4KDRI1
	T8yL3ZzxGG0xn7wxky7XnP1EhrsPK/+nL2rfheQ4Zs0FCf0516aQY/CPt7gktQ==
Date: Fri, 3 Feb 2023 11:46:05 +0100
From: "Erhard F." <erhard_f@mailbox.org>
To: Benjamin Gray <bgray@linux.ibm.com>
Subject: Re: Bug: Write fault blocked by KUAP! (kernel 6.2-rc6, Talos II)
Message-ID: <20230203114605.60f5f4d9@yea>
In-Reply-To: <5f0714428e4c696e3d5c00f3bafb4d2970cb6e2b.camel@linux.ibm.com>
References: <20230203004649.1f59dbd4@yea>
	<5f0714428e4c696e3d5c00f3bafb4d2970cb6e2b.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ttffz5nowqiox9h9uyrp4diyqbswufj3
X-MBO-RS-ID: 80e9b6d8b7f11c00239
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 03 Feb 2023 13:02:59 +1100
Benjamin Gray <bgray@linux.ibm.com> wrote:

> Do you have a QEMU command to boot this? I tried with
>    
>     qemu-system-ppc64 --nographic --vga none --kernel ./vmlinux
> 
> But it crashes immediately on booting the kernel (same using KVM on
> Power9).

No, this is a custom kernel .config for my Talos II where it works fine. But next time I'll come up with a config which boots up in qemu too. ;)

> FWIW, I see the config has the experimental
> CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 set.

Yes. I've been using this since available on kernel 6.2-rc1 on my PowerMac G5 and on the Talos II but with no (?) problems seen so far.

Regards,
Erhard
