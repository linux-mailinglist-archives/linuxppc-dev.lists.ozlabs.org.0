Return-Path: <linuxppc-dev+bounces-8959-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0F1AC5A37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 May 2025 20:47:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6M804YPzz2xjK;
	Wed, 28 May 2025 04:47:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:67c:2050:0:465::101"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748371664;
	cv=none; b=LF+OCfCbNSP5V98fBqDVWMYP5gkFQDbk0iYkLFd6JeCd9zMY+kD0fg+iAduIzv/2HJ2uWvuPaSn5uhgJsR/zPpTbV4aN8oWjJJINM9ro59mjlT2dLMAfWBEpBb1XNQWwA19xgnt0rqCMEPTJGJ122w4W1fQS+a80173mhTyuyXBZUmteS7sVrs8YHj53tdNvLHJ0EMS+izOIX5nwNaWusTkoswROtyjFs1ZX4JyiAkBYrJ3Arz7yPH5EeRvbHbOSdyj9q8//6Nayeo5KEcw8yDljZqFKRiv0risnuQJTY5XFBz/diMJ/cN3qC8e/FbBCOOP3+l1/1dc5KXkEor2HZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748371664; c=relaxed/relaxed;
	bh=HylYXFVXbo+AYXT7+hRP+ilvdtV5tsWctk+rU40tcGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T9MdBoG/d33mb9z3sNuMcm1zzGF5l7oombL0XBmfPBvMcLCZtmPpKpaaPyYXLEMLjVlTxmLgWIkKCo6yp3Fd7p8byTyGEBRWrtCq0cuWrsSk3E5Gns0NcTIHs+pO7CdQTv7fgS0lPbt/v62amPOyg+s70FihH1/ypTS53uV5sBXLKLc+NIKQLjlzgNPOE9UB5ZkO4rUKX2XdcIitmWYyCJpN9TIL4Zp8GARv+vop/mtoy9BIHAQNssOP/luQ/jAp1z6n1PQ4xqNBeRlcgKM95U3i325rQ10S1ReS1pCiAcaswTEg/mF/9bRVcL527y7sa4vxdRTYVM1C9K2TUg0AGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=UQUXr4Ov; dkim-atps=neutral; spf=pass (client-ip=2001:67c:2050:0:465::101; helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org) smtp.mailfrom=mailbox.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=UQUXr4Ov;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::101; helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050:0:465::101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6M7y2P3Hz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 04:47:40 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b6M7m0Svdz9slq;
	Tue, 27 May 2025 20:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748371652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HylYXFVXbo+AYXT7+hRP+ilvdtV5tsWctk+rU40tcGQ=;
	b=UQUXr4Ov8/vXnNSxxGYQpXvf1wwi9oxGuwjyWPJCO9B0jlHkdFxL1hhnN4tLOCVs1612u8
	pyMNQRFhdf0/Zyapzfe8+lxDk4hIYYOHzXCrQ3MHGxDTLcS0MwATMd5MnjJX5fDT8QherE
	QiDbxTAgTQxTu2DBY/6wYslMfUdaSHnYdnX7fdM9JcqVqN6ZnwYtmw1L3AQsXbkkcbzti/
	m4Assn1ogB6I2j+GXmonR5YYLhgBM91OngDg/CvTkht0unq6MLygjGKRxh5AyVqcV8UdWd
	fOSHsoA+lsmWKdOrUMpG8BAX3zDUMgKza3j6hqyFxT1v7q6Gj1maLuC3LvdSRg==
Date: Tue, 27 May 2025 20:47:28 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: WARNING: CPU: 12 PID: 44394 at
 arch/powerpc/kernel/process.c:437 giveup_all+0x90/0x1d0 (v6.14.8, Talos II)
Message-ID: <20250527204728.63d538f8@yea>
In-Reply-To: <aDV8iWe2nWX9JuvV@linux.ibm.com>
References: <20250526205537.2f1bccec@yea>
	<aDV8iWe2nWX9JuvV@linux.ibm.com>
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
X-MBO-RS-ID: 7fc04b3d1829eac27be
X-MBO-RS-META: kh18wz1on4gm1mc4dztn5zsatdbp7s7r
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 27 May 2025 14:19:13 +0530
Srikar Dronamraju <srikar@linux.ibm.com> wrote:

> > Getting these from time to time when I run the machine for longer periods building:
> > 
> > [...]
> > ------------[ cut here ]------------
> > WARNING: CPU: 12 PID: 44394 at arch/powerpc/kernel/process.c:437 giveup_all+0x90/0x1d0  
> 
> Its a warning with says that the task's userspace MSR register has
> VSX set but not the VEC or FP.
> 
> Were you building the kernel or were you building something else.
> Can you paste the command you attempted?

I was doing an 'emerge -e @world' in Gentoo Linux and probably building a kernel in another shell. Noticed it only in the logs on the next day so I can't tell exactly which command triggered the issue.

But I will pay closer attention from now on.

> If this is happening with only the recent kernel and working with a previous
> kernel, do you happen to know the previous kernel version.
> In which case, is there a possibility of doing a git bisect?

I think I have not seen this in v6.13, certainly not in v6.12.

As I get this only from time to time bisecting will be hard. For that purpose I have yet to find a way to trigger it more reliably. But I'll take your hints and try!

Regards,
Erhard

