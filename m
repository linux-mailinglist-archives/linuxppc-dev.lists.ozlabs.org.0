Return-Path: <linuxppc-dev+bounces-7075-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA7A619A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 19:38:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDtR720bwz3cB5;
	Sat, 15 Mar 2025 05:38:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741977491;
	cv=none; b=T7QEN2BR/euE4N5bGm0fjdNUOePB54j3cDxX0QKJdc+mcTrizjRLQW2CDK4VwJtb2MVgK0fwafeWz0kx18xhTEgJnfcDrPG5o6oKxPUVMWvRwEc8qdMXes20Gjui9q5KzA234Pyy5xGCXU3nag9hljMITZOwNWnRCTs2PE8lp/UM8O1XUxb5AwtJiyUXel22BCOs+cWEk6lOx/aqFTFsr+Gh/CgIit+PTaaWd1sVg60C0yUGLnOvweL2+FDOjx3sGMgVQHetRVNkMRqVXpyndpv7v1phMqRJp0ALpPLBzWeRkcKLNPAU7XsoGduq21PGSMxSa+ejVAafPHY99j6GFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741977491; c=relaxed/relaxed;
	bh=MjzUYO+f0dEIfn0NqOku+3fnvEFXy2J1drD8gdq2Qzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKAkqiZDgzwcWuYEEA5dRed/NABE1vzIOY82acPWt4oLFgFopnkyXgoouFqFEpgynoSnIKMJHG67ewLQ3J2zEkll/tuv/BOpy05JBS8S7PTGDr/QdRiHMQHwppoivBVfaE9lyNzWOFCxp15F3pjAtJpFSRY/4A04r2+v6HrLVyZ8smY457a0GScDOALR2NGk6a4uN/PzN/XL1mNPE5UFDxAfm7/woXX8B7+kJerWToI2XZPBXQcECP1/Hktuy41Q0GIpTurWm1MrSV2VE9Njx4brI9FT8VKEI3yKDVwKdc3SCT9su3aGEw/wPn6FO719q/J3+icKyaSnamTmUiVWtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDtR60MJ0z3bsM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 05:38:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 555155C4C5C;
	Fri, 14 Mar 2025 18:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A66AC4CEE3;
	Fri, 14 Mar 2025 18:38:02 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	sudeep.holla@arm.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	mpe@ellerman.id.au,
	linux-arm-kernel@lists.infradead.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	pierre.gondois@arm.com,
	dietmar.eggemann@arm.com,
	Yicong Yang <yangyicong@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	morten.rasmussen@arm.com,
	msuchanek@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	jonathan.cameron@huawei.com,
	prime.zeng@hisilicon.com,
	linuxarm@huawei.com,
	yangyicong@hisilicon.com,
	xuwei5@huawei.com,
	guohanjun@huawei.com,
	sshegde@linux.ibm.com
Subject: Re: [PATCH v12 0/4] Support SMT control on arm64
Date: Fri, 14 Mar 2025 18:37:59 +0000
Message-Id: <174197746840.735682.9575626401918508908.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311075143.61078-1-yangyicong@huawei.com>
References: <20250311075143.61078-1-yangyicong@huawei.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 11 Mar 2025 15:51:39 +0800, Yicong Yang wrote:
> The core CPU control framework supports runtime SMT control which
> is not yet supported on arm64. Besides the general vulnerabilities
> concerns we want this runtime control on our arm64 server for:
> 
> - better single CPU performance in some cases
> - saving overall power consumption
> 
> [...]

Applied to arm64 (for-next/smt-control), thanks!

[1/4] cpu/SMT: Provide a default topology_is_primary_thread()
      https://git.kernel.org/arm64/c/4b455f59945a
[2/4] arch_topology: Support SMT control for OF based system
      https://git.kernel.org/arm64/c/5deb9c789ae4
[3/4] arm64: topology: Support SMT control on ACPI based system
      https://git.kernel.org/arm64/c/e6b18ebfaf63
[4/4] arm64: Kconfig: Enable HOTPLUG_SMT
      https://git.kernel.org/arm64/c/eed4583bcf9a

-- 
Catalin


