Return-Path: <linuxppc-dev+bounces-10469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF77B16489
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 18:21:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsct65BChz3blF;
	Thu, 31 Jul 2025 02:21:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753892510;
	cv=none; b=FRVcH+X7cyKNDgm0H43EA0X1cPyYDaVojvLptk9aLR0ON/vc++NkzF1YKkqB5LDDkqtZZbRMTLGDFLXh6mCnqvLRUYaOHOE5HbCVen/gQMlCGyn8jTb42oTCkBmMzLRfasjSW4veRrFRtMl7pg6W09hatc/LMJrVdB2ziTk96o9a0T4GjFYFmw1GwcDxI0dC/3cmWTJFs8OsCIBCjsdd8GCUoeHqpfNRJ4leCQy3jDBMeCiiUgDYQFz1Y7xo2pvnLmG3AZUtIll7lCzdp/RuxarsEfqwDTkxYWM52uct5qQpIUTHvISoeII7N7MGCvANTdaaAQVxwwfIbG6ZfK6X9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753892510; c=relaxed/relaxed;
	bh=X7ruaur9nhJu/LK4s5Krw9wDOMZ8ix8nR5bT7yyFJLw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WzyUc3Bmk4N4CJ26Rnde2nLmkwRiZ9SPkYSuAv7yursnhmvdCt8L3NRug8Qs8lCyg4HrvJmZkb1OGwuYu42krj2Tbi1Na6am/D9P1bVV3hcbHfZEWqk6tJO678aZeZBCjmky5V/jewedIS8qnUZ9EzidjpiGx90SGL99r963owylmCdiNT0eXtyYDOMi3P3oai02N4AwYNcPWZd3toNvr+wwq9t4YkOwoRCAxdfUrDLvOIg55oVm1kEVEDrvrOQWgJcdeR4ZoJ2KUjkzM0TZLQTM6hRKCUT2oSb6dV1t8hkyAAjR9Zd0SasXqf0u7jU4sIHQAPSV4/rMYfY90Jqz6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aiBCDdUe; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mchehab+huawei@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aiBCDdUe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mchehab+huawei@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsct50NLcz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 02:21:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEC405C5BEF;
	Wed, 30 Jul 2025 16:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A335C4CEE3;
	Wed, 30 Jul 2025 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753892505;
	bh=Z/C3ul5o75i6bTpbhJZLGEjV6nDj+lf/hDM6AkOr34I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aiBCDdUeAhbo90SYZVK5pgGP6Ixwqf56PxCBG0mWpQOhbCHY0fYBuNTto7qCQe+7Y
	 X55RLKXT8bxgM+aP1+/q5pbDbnSE+sPqrkZKovPRiki3qQmYfWBDylFOYFvlEE3ys2
	 EP1V7U2UzklkCKJocA4UCdXop6SGNVcziJR6gdyAnAiYeUiBJL94Z8+CCj0h7vsMrF
	 jDElP6bu+0Q4TDmLc0ZbLzarjNJ6aIZylF/q72OzBPN7vzG17TWB8t1wm0ZkAKSmeU
	 BhkNBMF0o2ilUiPR5m9P+FXxIFfT4phrUZ7h8wYxqizfA5Ex4XXHl60N4O3zqIFJ0I
	 Csj7368Nvfkhg==
Date: Wed, 30 Jul 2025 18:21:37 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, Robert
 Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo
 <guohanjun@huawei.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mahesh
 J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev,
 osandov@osandov.com, konrad.wilk@oracle.com, linux-edac@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH v3] vmcoreinfo: Track and log recoverable hardware
 errors
Message-ID: <20250730182137.18605ea1@foz.lan>
In-Reply-To: <zc4jm3hwvtwo5y2knk2bqzwmpf7ma7bdzs6uv2osavzcdew3nk@lfjrlp6sr7zz>
References: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
	<7ce9731a-b212-4e27-8809-0559eb36c5f2@linux.alibaba.com>
	<4qh2wbcbzdajh2tvki26qe4tqjazmyvbn7v7aqqhkxpitdrexo@ucch4ppo7i4e>
	<fdb5dced-ea5a-48b8-bbb4-fc3ade7f3df8@linux.alibaba.com>
	<ldlansfiesfxf4a6dzp5z2etquz5jgiq6ttx3al6q7sesgros6@xh4lkevbzsow>
	<4ef01be1-44b2-4bf5-afec-a90d4f71e955@linux.alibaba.com>
	<2a7ok3hdq3hmz45fzosd5vve4qpn6zy5uoogg33warsekigazu@wgfi7qsg5ixo>
	<a87c5e74-082f-4be6-bbfd-4867bf72ddcc@linux.alibaba.com>
	<zc4jm3hwvtwo5y2knk2bqzwmpf7ma7bdzs6uv2osavzcdew3nk@lfjrlp6sr7zz>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Em Wed, 30 Jul 2025 06:11:52 -0700
Breno Leitao <leitao@debian.org> escreveu:

> Hello Shuai,
> 
> On Wed, Jul 30, 2025 at 10:13:13AM +0800, Shuai Xue wrote:
> > In ghes_log_hwerr(), you're counting both CPER_SEV_CORRECTED and
> > CPER_SEV_RECOVERABLE errors:  
> 
> Thanks. I was reading this code a bit more, and I want to make sure my
> understanding is correct, giving I was confused about CORRECTED and
> RECOVERABLE errors.
> 
> CPER_SEV_CORRECTED means it is corrected in the background, and the OS
> was not even notified about it. That includes 1-bit ECC error.
> THose are not the errors we are interested in, since they are irrelavant
> to the OS.

Hardware-corrected errors aren't irrelevant. The rasdaemon utils capture
such errors, as they may be a symptom of a hardware defect. In a matter
of fact, at rasdamon, thresholds can be set to trigger an action, like
for instance, disable memory blocks that contain defective memories.

This is specially relevant on HPC and supercomputer workloads, where
it is a lot cheaper to disable a block of bad memory than to lose
an entire job because that could take several weeks of run time on
a supercomputer, just because a defective memory ended causing a
failure at the application.

Regards,
Mauro

