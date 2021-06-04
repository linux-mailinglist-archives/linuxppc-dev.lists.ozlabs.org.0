Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A490039BDBC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 18:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxTQs0mqwz2yR2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 02:55:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gj9oADZd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Gj9oADZd; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxTQL6pswz2yR2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 02:54:50 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D7F4613DE;
 Fri,  4 Jun 2021 16:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622825687;
 bh=YPazeuzSK6s1SjkSTRVdvHCtW1yCQUOaB+XSbd0sY5I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Gj9oADZdY1B/V7aHBgacFrK6kVejmG0DO3IVgTNWpeipYvvgP33EvEHDl5C6eMa0+
 ObZN3aRVZ5JAHAVf/8al6QZqACzL/WQ245aBA27Q+EUdqx90+Q5/YC0b4Wvs8eijYu
 LGFttuAbi5GmYRRdTeC97vfGt5VErIHSNqddWBNs+/k9gnk9pot8EEEmPykA+cccqO
 vznsvjBHfFADtwjRFvNPhgOMQ5xjtJhRSV63WkzjnG1nY0nbsOKeb7etPKt/JndXRn
 3KMNVtCP9sN4HY3mBwkRXNWvMSGWKbRWi6alDlQnBbEVfwBYzd9o+Tr5AIcBDiiH9o
 ALs3UKpAZ2FhA==
Subject: Re: [PATCH v3 0/4] shoot lazy tlbs
To: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20210601062303.3932513-1-npiggin@gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Message-ID: <603ffd67-3638-4c47-8067-c1bdfdf65f1b@kernel.org>
Date: Fri, 4 Jun 2021 09:54:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601062303.3932513-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/31/21 11:22 PM, Nicholas Piggin wrote:
> There haven't been objections to the series since last posting, this
> is just a rebase and tidies up a few comments minor patch rearranging.
> 

I continue to object to having too many modes.  I like my more generic
improvements better.  Let me try to find some time to email again.
