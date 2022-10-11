Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4875FA92A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 02:14:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmbqj03Tfz3dtN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 11:14:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=baVHqYzU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=ame8=2m=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=baVHqYzU;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmbpm2DTHz2xHL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 11:13:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1349FB81109;
	Tue, 11 Oct 2022 00:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B4EC433C1;
	Tue, 11 Oct 2022 00:13:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="baVHqYzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665447190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=94ts48M5SS/tRVfqd8nSNQ/13AHlnM6HqjRShHGswCc=;
	b=baVHqYzUL1gentYHvD6fPlG0Rb53MTQ0jrOPGbtJum4eGZHwX4iHRYu7M2+8beK8paCZuO
	IA86oNdZ7QtjjqxfCKesku3xkVm1z7K3oONecZqnI1Ed/5J7SHcHAMk1kzMCd8i8hW1psG
	M6dUNb2cBChpFLE6K78/fPrPMoo82oA=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4857d14e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 11 Oct 2022 00:13:09 +0000 (UTC)
Date: Mon, 10 Oct 2022 18:13:03 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Message-ID: <Y0S1DxwKCm0aVQjT@zx2c4.com>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <Y0RxpSFyn9m68zIb@zx2c4.com>
 <Y0R6fcvgGA858TQA@zx2c4.com>
 <Y0ScAhqysKK6Hrks@zx2c4.com>
 <d402a6a0a11d84906ecba3909f4c8f880298dc0f.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d402a6a0a11d84906ecba3909f4c8f880298dc0f.camel@linux.ibm.com>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, linux@roeck-us.net, nathanl@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, aneesh.kumar@linux.ibm.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Tue, Oct 11, 2022 at 11:00:15AM +1100, Andrew Donnellan wrote:
> Thanks for bisecting, this is interesting! Could you provide your
> .config and the environment you're running in? Your reproducer doesn't
> seem to trigger it on my baremetal POWER8 pseries_le_defconfig.

Sure.

.config: https://xn--4db.cc/NemFt2Vs (change CONFIG_INITRAMFS_SOURCE)
Toolchain: https://download.wireguard.com/qemu-test/toolchains/20211123/powerpc-linux-musl-cross.tgz

You can also just run:

  ARCH=powerpc make -C tools/testing/selftests/wireguard/qemu -j$(nproc)

And that'll assemble the whole thing.

Jason
