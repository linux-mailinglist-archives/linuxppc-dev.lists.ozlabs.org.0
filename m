Return-Path: <linuxppc-dev+bounces-7895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B4BA968F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 14:20:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhhCJ00lJz3bww;
	Tue, 22 Apr 2025 22:20:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745324427;
	cv=none; b=k4lTBgRACKfvxPYk8j9KT2vNLfrjjqj0PsklhRuOGsgWD1tWiAiquoYEjrTAzL4Ml1amuVqpRFzBJQ9fE+rR9w4IqTg/OAHBYbemQfaWHZPhDGxzYY4dlzOZGN+/d0l4Kk+JtuuXIlCpHzkevUxFflWUDHGVmV2Wo5sUJAiXewhpC7kM31qb0c5Bg/xoNFYKKHGcKUtOYd10z/mxcpRvK6bH45VarJ/M2LDiGf2XeP28AjQ6C2wUfh6MJNbOhsLllbBGAIr2VsFRrc895+PMKQ9RwYnRe4WtYJI19ofULJV1CIqss0n8VpDBHEiqscGgK8yOfL4XhrJL7CiXsVU+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745324427; c=relaxed/relaxed;
	bh=S/WCG+YzoqgSAkzjPwbded2iIHNMTYerowPLYaQ7OZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLHCHssI+wi6q7mgYm2nZAssVsfoYHEfpucREG4AEXAToqblDj3o7MG78LztoTCFKjOGP0kFFPQp7AMD62DF1K8YuIn0AxaryPNvfeyAQ2owoCn6/MH/y/znyTFqUGxDvy29I3wTKd+Mxg1c3N/qpa0PiZ5xSmA2I9UXFauU4OKAi31qC/VBzx1T8yxZj8UEghBIxgvW4g5cxs7cfjmW699ED48oJT7k+m1J0MOIbxGdCM5Xqw1R4+w/Rw5YBMx+FP6ZZD2zFzmTAY7WqR4R9sJtE6NUJCA2K80p/73gI00CxkABctzEy5krYV10HOex49zKNwAkQZEjHUzaE2cDOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OoSBlq0q; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OoSBlq0q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhhCH10tQz305P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 22:20:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B5564A2B4;
	Tue, 22 Apr 2025 12:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D8DC4CEE9;
	Tue, 22 Apr 2025 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324423;
	bh=ZrshQB/HvJt55tWOH/LLIHeQSXBuQob4lAuwecjZ5uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OoSBlq0qcd+pjnS61iStg4j+F5ysUfDmpOXLZ/2kRJqUHkvs1d7EF3xB9jjRw5qzG
	 EBddFnac+/2ZYP9hSb7L97+n81/ZNPuZIWVNOd9bIHsCcX80LeaL1jYKhJxHKgFHq2
	 KC+NPDlgI6LnOfm2kohlxx7FgKioD5qdfP6fCr2HkXLDF6CXTQDk02pfOg3uBnhXNo
	 HmmfWyTPdaY3HhOc+msO06Br5EK4Px0WqCcGySt+vH99Kf59BUhgkPpBQxytS9qyhX
	 oMsMAZCwZc7hQ5fzBI8aTGzJnlMW2X9DsIr7j451JCAJTg4zLZJaIwT7p6tm/9THo6
	 5KUtS7siGCwzQ==
Date: Tue, 22 Apr 2025 13:20:20 +0100
From: Simon Horman <horms@kernel.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: netdev@vger.kernel.org, michal.swiatkowski@linux.intel.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v3 1/3] net: ibmveth: Indented struct
 ibmveth_adapter correctly
Message-ID: <20250422122020.GB2843373@horms.kernel.org>
References: <20250416205751.66365-1-davemarq@linux.ibm.com>
 <20250416205751.66365-2-davemarq@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416205751.66365-2-davemarq@linux.ibm.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 03:57:49PM -0500, Dave Marquardt wrote:
> Made struct ibmveth_adapter follow indentation rules
> 
> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>

Reviewed-by: Simon Horman <horms@kernel.org>


