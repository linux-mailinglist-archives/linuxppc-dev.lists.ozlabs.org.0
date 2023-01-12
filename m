Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D138667CC9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 18:41:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtBfq69KLz3c9V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 04:41:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Oc1/v/Y8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.151; helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Oc1/v/Y8;
	dkim-atps=neutral
X-Greylist: delayed 573 seconds by postgrey-1.36 at boromir; Fri, 13 Jan 2023 04:40:16 AEDT
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtBdr2BYcz3bZn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 04:40:15 +1100 (AEDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4NtBQR09qtz9sQf;
	Thu, 12 Jan 2023 18:30:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1673544623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCFjBz2hYq3TvSF0xDnw8claIbG4q/174RUpdE5mixI=;
	b=Oc1/v/Y8NQbsKUqbeEEe66McESrOQ9WBX6VQxzcAgvzNl5i4XCjuD3Nti9ZIZ7Yt4Ye91d
	ieHvxNVaKQaVQyIpNMj96enhfl6HChHWkAYaB3YcGbFLav7e9dI1MjIqbkff0+7iYsXxa+
	AmSx69UOH0sGRVH+1+Q8eZ/KfLxCH3eJ5Ge8EhpBNs+a/kJT8uSuTlf61dS/O+awgD0yGK
	L28v0fmj/1BdhH/3WMFb2zF/6VXF4nPooP1CxZOyn2dc8p5+IOB7I48TH5fk76Vj8Qqgw+
	UJirEcQjHvdSyN98lyTaqRcwl+CbzM0idRZWUcbjWfQZaJmXeUEXS1F/k5TfJw==
Date: Thu, 12 Jan 2023 18:30:19 +0100
From: "Erhard F." <erhard_f@mailbox.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] kallsyms: Fix scheduling with interrupts disabled in
 self-test
Message-ID: <20230112183019.29171b26@yea>
In-Reply-To: <20230112105426.1037325-1-npiggin@gmail.com>
References: <20230112105426.1037325-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: xqkqy8u3bf6p9jxw384of8zg4x1f9ydc
X-MBO-RS-ID: 46d80a206f044f72537
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
Cc: kernel test robot <oliver.sang@intel.com>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 12 Jan 2023 20:54:26 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> kallsyms_on_each* may schedule so must not be called with interrupts
> disabled. The iteration function could disable interrupts, but this
> also changes lookup_symbol() to match the change to the other timing
> code.

Just tested your patch. It fixes the problem on the G5. Thanks!

Regards,
Erhard
