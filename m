Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CA046042F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 06:10:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1xPt4s75z3cVM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 16:10:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=JnSDJhb2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rere.qmqm.pl (client-ip=91.227.64.183; helo=rere.qmqm.pl;
 envelope-from=mirq-linux@rere.qmqm.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256
 header.s=1 header.b=JnSDJhb2; dkim-atps=neutral
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1xPL3Fqdz2yP3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 16:09:58 +1100 (AEDT)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1xPH1FPPz4f;
 Sun, 28 Nov 2021 06:09:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638076195; bh=oUZYFQUmcrcLe+khMfxoyii9jHAFHFy8/qX4bg6ScHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JnSDJhb2/wFE1+K5BEKj3l92hAUJYMSiQfvzp+ZlCATcD11ALuloHBV8agVwt/D5m
 6xO5KVkS6ds9BhnvUIzgpE+GOAlwIHTeHWZUDQLRlCqXrEtKOnOW/XLCrUHjRtkpA+
 s0Zgh/IC7vC3LAsHBRaM+HBKV7zFjzE+7UOTFGbokGiHbpHQX7rXsKsJST3S+JBeda
 2sNRV1hDCglR6IzM+jk8O4GqGLON53RjQjMI9dzQcjIf9OmuQDCgevPa74eYKb6N8i
 DO41zxtTZnaEDqhBVPy9rAwcuQc/n0JQGJK3acFZNX84ZqpVMLYjA4M2TxieYk4Vj5
 b6s4KzCtg6yrQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 06:09:53 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Message-ID: <YaMPIXUYuP1Q5FrQ@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, bcm-kernel-feedback-list@broadcom.com,
 linux-crypto@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 28, 2021 at 05:56:51AM +0100, Micha³ Miros³aw wrote:
> On Sat, Nov 27, 2021 at 07:57:02PM -0800, Yury Norov wrote:
> > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > with one of new functions where appropriate. This allows num_*_cpus_*()
> > to return earlier depending on the condition.
> [...]
> > @@ -3193,7 +3193,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
> >  
> >  	/* allocate pages */
> >  	j = 0;
> > -	for (unit = 0; unit < num_possible_cpus(); unit++) {
> > +	for (unit = 0; num_possible_cpus_gt(unit); unit++) {
> 
> This looks dubious. The old version I could hope the compiler would call
> num_possible_cpus() only once if it's marked const or pure, but the
> alternative is going to count the bits every time making this a guaranteed
> O(n^2) even though the bitmap doesn't change.

Hmm. This code already unnecessarily calls num_possible_cpus() multiple
times. Since it doesn't change after early init I would suggest just
calling it once here.

Best Regards
Micha³ Miros³aw
