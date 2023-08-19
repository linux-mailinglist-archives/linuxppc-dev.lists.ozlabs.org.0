Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275137817D7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 09:05:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=j1lqDDyF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSV9l62Fxz2yVs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 17:04:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=j1lqDDyF;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSV8v0Zxqz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 17:04:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692428649;
	bh=1M+bC+oHJK8b1PDdoaJ9cM78a44wq3ERqGgn5/kiuLk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j1lqDDyFH06CSkGt/L2y1aW3x+76seWrPIMlAXvyTTtZoIXd+XgQVdEGCDX6wKAzH
	 wUXGIdEAfyIGZ/sew4feI0MtRqs8g6m2PX+I8qJROKQjEaNAmQAYPIhHhaxUGaMLB1
	 Vdl/LUW+VZc6j0oOxZJVvqPUain0qp3PyhTONRGQW4GoFkxID7XY/2y4UeAMbtDOuQ
	 2Vui5Af4U911gSjZ8+VA1h4wz0DooUYsEudZWC9c5AxDKBzgvD4uW/P8p/6fTGzjU+
	 N3DAJMuVVjJq68ixOluthFevp3i9JnzVRV/Ky3F3Kpa+CfpOnJU9vKhp+ujuuWoqmb
	 6922pXPMqobHg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RSV8m5RRkz4wxm;
	Sat, 19 Aug 2023 17:04:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
Subject: Re: [powerpc:next-test 21/79]
 arch/powerpc/platforms/powermac/feature.c:137:19: error: unused function
 'simple_feature_tweak'
In-Reply-To: <6173828b-183c-490d-abca-bdc72221bafc@app.fastmail.com>
References: <202308181501.AR5HMDWC-lkp@intel.com>
 <6173828b-183c-490d-abca-bdc72221bafc@app.fastmail.com>
Date: Sat, 19 Aug 2023 17:04:07 +1000
Message-ID: <87zg2nv7h4.fsf@mail.lhotse>
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
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Arnd Bergmann" <arnd@arndb.de> writes:
> On Fri, Aug 18, 2023, at 09:59, kernel test robot wrote:
>> tree:   
>> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git 
>> next-test
>> head:   c56963d48343b50998bacc6df949217c950163e3
>> commit: 54f30b83fe627453082f15d83d7820b28b2d24bb [21/79] powerpc: 
>> address missing-prototypes warnings
>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202308181501.AR5HMDWC-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> arch/powerpc/platforms/powermac/feature.c:137:19: error: unused function 'simple_feature_tweak' [-Werror,-Wunused-function]
>>    static inline int simple_feature_tweak(struct device_node *node, int type,
>>                      ^
>
> This looks unrelated to my patch, but is easily addressed by marking
> the function __maybe_unused. The warning is triggered by clang specific
> behavior that treats inline functions in .c files differently, see
> 6863f5643dd7 ("kbuild: allow Clang to find unused static inline functions
> for W=1 build")

It looks like it can just move inside the nearby ifdef. Will send a
patch.

cheers
