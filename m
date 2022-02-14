Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EAA4B59DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 19:28:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyCQX3f4Sz2xD4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 05:28:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=vWu3W4we;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=vWu3W4we; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyCPn60m1z3bck
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 05:27:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=93oBqhRfGyp81erZawUocVFg/qlY90+qZLcs405SMv0=; b=vWu3W4we2fdhM5wZ76QSxQy5W2
 lKa4zewyd1VhEAHkacc//5dUs2MWC/eFl5uS+/Yt/ba4EL1D4WD0oRaR/OlEJ/8dISj6Q6Ri35dJJ
 SFs+dhwZ3ldCkowTYS7WVBWxcj7vz4orDa/gXd7rw7H9rzNnSIDvJE0+E175Nhk7ZQxCb+TdmKvfm
 xqdQUFyPFx5hxn/fZZJpKgdH/0qAwn5KW9iB7hMG5sp5pIiQH5Yv20zsDNkAPQzUnPXdJeGOfiDkw
 hsAPjmI4M4uCR/zkLGm2NL2lgfcM0zG8W+gXLWnnxjDdauXtfshakyPg/avDGdvvwqnfz3VRowfdI
 Cs3A1gZQ==;
Received: from [2602:306:c5a2:a380:b27b:25ff:fe2c:51a8]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJg4K-00D9vw-RT; Mon, 14 Feb 2022 18:27:25 +0000
Message-ID: <aa6c446a-02f8-02d3-bd1a-19b5d729eb91@infradead.org>
Date: Mon, 14 Feb 2022 10:27:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] powerpc/boot: Add `otheros-too-big.bld` to .gitignore
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <20220214065543.198992-1-pmenzel@molgen.mpg.de>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20220214065543.198992-1-pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Paul,

On 2/13/22 22:55, Paul Menzel wrote:
> Currently, `git status` lists the file as untracked by git, so tell git
> to ignore it.

Thanks for your contribution.

Acked-by: Geoff Levand <geoff@infradead.org>

