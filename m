Return-Path: <linuxppc-dev+bounces-4862-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF55A06328
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 18:17:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSvjv2K5Wz30VF;
	Thu,  9 Jan 2025 04:17:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736356643;
	cv=none; b=cGqs4GVUhJ1pd/QqDof51JmmB/ObuN2tfuoeJXniiIwLkMvlk6SrU93QsmRptmvkz9MSA/9GsqqCryF1HSXMNoC+ZcNpTarsR7qAmyuFpQUVeI1wO0TS0/SUOBuwamYMxqg1e4LNPiEiFqN2ZVFj7VZo2ZBoTgh8Vp8fntuUA3950JuOfeQDar3+FDKz0z/pPxMHMZz80UfRBsejFjp8W+AFZ8+u7HMvCPAnzOpilAOX8vNLejGmurCezZRelDye/5Zt9vd/7J+7PmBLVowqUCYeje2VXNdM7+YMlpJyCxDlUqKUi2bIR6qQxtXGM22i4n9WdVnpnO+hyHAAU/xLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736356643; c=relaxed/relaxed;
	bh=rBne1mSxqFYz8GbBPb10Ksop8x4X2f8gV7i8UrBoAA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bmaS6WCIEJaWZI++s1f0NYWc2x/vbZD8ET5Q5fjPycD2K8qIlpaW1VJnOT2j8oODYIXAK0oQFnijuFho08xb6r1XeebqSOm6p53xB/HTgbLn2KiBPvDhSK2mWlukRiu79a3SzzpmADIZOKDHt3QztavvUdvzyBL0izFkv8gIzoML7C57YnXVVLguPBILTKZYkaTB+j/WWwiZFEgryDgBclwCVaf2yTUq9cNBmnIGKA4KM40utl20ZO1BubfwqsS9Cvt95tid/lnYttyKeIk7ij7kxyuajO98Ws04zWGnyvPhWlSapPB7YkPs4x5bs1sShZ3Ar/skOUzFnkylemTkEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=dEZq5ZEs; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=dEZq5ZEs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSvjr2TL5z30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 04:17:19 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C3EEF8287590;
	Wed,  8 Jan 2025 11:17:15 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id QV0Sx48sA9T2; Wed,  8 Jan 2025 11:17:15 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 24FCB8287D4A;
	Wed,  8 Jan 2025 11:17:15 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 24FCB8287D4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1736356635; bh=rBne1mSxqFYz8GbBPb10Ksop8x4X2f8gV7i8UrBoAA4=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=dEZq5ZEsCcMaz+TU98jieY6hhcQz3B7Y1TMX7h6TlEwv/1a/yqB1FUfGqSpdVEglH
	 hSrjy6/rIdim1chUeTPihMkEnV6hQYDptzl3WP2c8wLjHHwpSFKt0R5sgVpBkpcwxf
	 342hJBK7cqCHPQj/DPQrmfeaSFeiusgfyko+sm0Y=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KqOpN7vNWAuI; Wed,  8 Jan 2025 11:17:15 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
	by mail.rptsys.com (Postfix) with ESMTPSA id B2E728287590;
	Wed,  8 Jan 2025 11:17:14 -0600 (CST)
Message-ID: <de35acbd-8b35-42e2-b344-8c9c1103327b@raptorengineering.com>
Date: Wed, 8 Jan 2025 11:17:13 -0600
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
User-Agent: Mozilla Thunderbird
Subject: Re: Raptor Engineering dedicating resources to KVM on PowerNV + KVM
 CI/CD
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <8dd4546a-bb03-4727-a8c1-02a26301d1ad@raptorengineering.com>
 <20250107064550.713c2fd9.alex.williamson@redhat.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20250107064550.713c2fd9.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Alex,

On 1/7/25 5:45 AM, Alex Williamson wrote
> Hi,
> 
> What are you supposing the value to the community is for a CI pipeline
> that always fails?  Are you hoping the community will address the
> failing tests or monitor the failures to try to make them not become
> worse?

The failing tests are all isolated to issues with the specific AMD
graphics hardware that the test machine is using for the VFIO and host
GPU tests, and are likely isolated to the amdgpu driver itself. We have
filed bugs with amdgpu folks.

The non-failing tests however, possess value for regression monitoring
including VM boot smoke tests for both little endian and big endian
ppc64/pseries targets, as well as the vfio-*-attach tests that ensure
hardware can be successfully bound to the vfio-pci driver on a PowerNV
host. The test artifacts also include full dmesg output from the host
and guest machine (when applicable) to assist with debugging.

The data could definitely be presented in an easier to digest way to
make it more obvious which failures are regressions and which are due to
the aforementioned amdgpu issues, so that's an area for improvement.

> 
> I would imagine that CI against key developer branches or linux-next
> would be more useful than finding problems after we've merged with
> mainline, but it's not clear there's any useful baseline here to
> monitor for regressions.  Thanks,
>

That's a good point -- I'll definitely look into adding at least
linux-next, as well as any other branch requests from developers.

> Alex

Thanks,
Shawn

