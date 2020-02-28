Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82984174087
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 20:48:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Tg8H0MQfzDqQX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 06:48:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=TVJSEuyI; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Tg3s20bDzDr7M
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 06:44:57 +1100 (AEDT)
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78EAF246AE;
 Fri, 28 Feb 2020 19:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582919095;
 bh=19bgiYDwUKdyb3b9go1fL43n9b0ixNXBNp6DFDeAe/M=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=TVJSEuyIIojQ7JKoDr/C6jf5vi72rlYAfUFVMc2UR70xBbueQ7ggzTfvH0RM6aYzx
 TM0sZsD4HX90SPeiyw3Qki0IWiXuAD7sJ3MiBSOH0JSVz1TnaAHeOlwDiN7vgytbfT
 iIC5Yi4q7Op2jHwr3hw42K72FQFhAPJxxEt3sz0Q=
Date: Fri, 28 Feb 2020 19:44:54 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests: powerpc: Add tlbie_test in .gitignore
In-Reply-To: <259f9c06ed4563c4fa4fa8ffa652347278d769e7.1582847784.git.christophe.leroy@c-s.fr>
References: <259f9c06ed4563c4fa4fa8ffa652347278d769e7.1582847784.git.christophe.leroy@c-s.fr>
Message-Id: <20200228194455.78EAF246AE@mail.kernel.org>
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
Cc: linux-mm@kvack.org, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 93cad5f78995 ("selftests/powerpc: Add test case for tlbie vs mtpidr ordering issue").

The bot has tested the following trees: v5.5.6, v5.4.22, v4.19.106, v4.14.171.

v5.5.6: Failed to apply! Possible dependencies:
    5eb7cfb3a2b1 ("selftests/powerpc: Add a test of bad (out-of-range) accesses")

v5.4.22: Failed to apply! Possible dependencies:
    5eb7cfb3a2b1 ("selftests/powerpc: Add a test of bad (out-of-range) accesses")

v4.19.106: Failed to apply! Possible dependencies:
    16391bfc8623 ("selftests/powerpc: Add test of fork with mapping above 512TB")
    5eb7cfb3a2b1 ("selftests/powerpc: Add a test of bad (out-of-range) accesses")
    7b570361f6f6 ("selftests/powerpc: Add missing newline at end of file")
    b7683fc66eba ("selftests/powerpc: Add a test of wild bctr")

v4.14.171: Failed to apply! Possible dependencies:
    16391bfc8623 ("selftests/powerpc: Add test of fork with mapping above 512TB")
    5eb7cfb3a2b1 ("selftests/powerpc: Add a test of bad (out-of-range) accesses")
    6ed361586b32 ("selftests/powerpc: Add a test of SEGV error behaviour")
    7b570361f6f6 ("selftests/powerpc: Add missing newline at end of file")
    b7683fc66eba ("selftests/powerpc: Add a test of wild bctr")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
