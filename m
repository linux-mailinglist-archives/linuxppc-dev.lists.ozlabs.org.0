Return-Path: <linuxppc-dev+bounces-2630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510C79B2B45
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 10:21:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcSZN5Dhvz2yHL;
	Mon, 28 Oct 2024 20:21:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730107308;
	cv=none; b=GA9UA9yHiprOa//bB1/mmagjFyNrBWv4IfEqB6Drm2whhjTmWAwe3vhfp9a4QpimNjzDV1tDXcW7Q258JoLwCpiUu0uOjnAwjCzjgHWY3iB0EdynNOhIPfaaK+qxD93fWWIXJA/ri2gmtpaaDUYAfsnMQCfKK3fx5Wvl0wy2i7MupmxJ282HUT420hxju1CfMwV24l6GJ0ojRWOf8uZv++eBKyZgyLA7CZQjxC6mLaIhK6DkmLYm7CUI6mPeNFnENgPf+hYvTGVuDUelDuT231KZySzzDWdVVMiWJ99NtcKnY/vScRS1FZYvSHa2mnQE2g3ExM9f1Uor/g4bZMhHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730107308; c=relaxed/relaxed;
	bh=DO7dwch+FeCW54o19Mz+LWyOppgNXX0IFEQI9vQHDtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojOiYLJ4JxEhVrzMZ/k06AjffTTRDM6bCsn6jnMid8N+jC29zrBsOJ2/MszZ9o59mtCbW9irndjK7i+p+PRMhIolqPYgTqxUeCGGN/Exb5wtOqwKvXgOG7oqB65giUQBS4UIl2D0qgjE66265fochk4ZK6vQNsunC+iDFxcYnPFK40V6XwxGLIVE7QrsyKT6RTB4xSTo2oQJoqotRanH/NCITtGmKHKSqG5Ymkq49Qma2/tZJNQ1mWpufuIj3qEvwbnl4z4oU4xkBxo02nU0QINN4jqQd8pvQvCRLPskaFQAK52/+DpdN0i86NFEuz2O/iL+M4sbVhO3Wlr9CtZ78w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcSZM5dp4z2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 20:21:46 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 665BE497;
	Mon, 28 Oct 2024 02:21:45 -0700 (PDT)
Received: from [10.57.64.61] (unknown [10.57.64.61])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A42803F66E;
	Mon, 28 Oct 2024 02:21:13 -0700 (PDT)
Message-ID: <c9bc3c9d-fccf-41c4-8790-3d639f661e0a@arm.com>
Date: Mon, 28 Oct 2024 10:21:11 +0100
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
Subject: Re: [PATCH v3 3/3] selftests/powerpc: Use PKEY_UNRESTRICTED macro
To: Yury Khrustalev <yury.khrustalev@arm.com>, linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Joey Gouly <joey.gouly@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Sandipan Das <sandipan@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, nd@arm.com
References: <20241028090715.509527-1-yury.khrustalev@arm.com>
 <20241028090715.509527-4-yury.khrustalev@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20241028090715.509527-4-yury.khrustalev@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 28/10/2024 10:07, Yury Khrustalev wrote:
> Replace literal 0 with macro PKEY_UNRESTRICTED where pkey_*() functions
> are used in mm selftests for memory protection keys for ppc target.
>
> Signed-off-by: Yury Khrustalev <yury.khrustalev@arm.com>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

- Kevin

