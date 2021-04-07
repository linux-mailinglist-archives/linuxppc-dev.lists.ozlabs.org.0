Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 460CA3564A4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 08:58:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFZwq2DdFz302b
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 16:58:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=Hg6x7wJd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=Hg6x7wJd; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFZwM2DL2z2yjD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 16:57:54 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4FFZwK5Qprz9sWK; Wed,  7 Apr 2021 16:57:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617778673; bh=z6W65AtEdnkKNrWxgWMigIVD5t03SwC5KdJI00urOnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hg6x7wJdAA6UnpbEA9B76JaoUoXNQw9UoMp5LjtPK//6c3Q1u6hmxhdte/IQxhyX2
 1k09MXAN7yimulZdtvdBdEuo4HDEku06l22dYt4kmWMhv2yvWx7KA5Ebr/fwK16k8L
 aB0cEM+x57RF7LujLZ/dmAY1VujS5SD2r+J9Y0X9Md0QF4SMiSXySKDHiAq4wq9LVp
 D/dyBhlgL78shJmLlZKWns3z+7kWvgGDpVhO6r3lGFxewutmkKKVC38DxB5wzO3S93
 SNTU13vmRAL1xae1R8g7o3097JKe7yN6g5jO0E80zX03jDeEidDHsjXD1ySk3hNom+
 EEsj6o5UJrpiQ==
Date: Wed, 7 Apr 2021 16:51:30 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 38/48] KVM: PPC: Book3S HV: Remove support for
 dependent threads mode on P9
Message-ID: <YG1WcjXTbGtsqHgY@thinks.paulus.ozlabs.org>
References: <20210405011948.675354-1-npiggin@gmail.com>
 <20210405011948.675354-39-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210405011948.675354-39-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 05, 2021 at 11:19:38AM +1000, Nicholas Piggin wrote:
> Radix guest support will be removed from the P7/8 path, so disallow
> dependent threads mode on P9.

Dependent threads mode on P9 was added in order to support the mode
where for security reasons you want to restrict the vcpus that run on
a core to all be from the same VM, without requiring all guests to run
single-threaded.  This was (at least at one stage) thought to be a
useful mode for users that are worried about side-channel data leaks.

Now it's possible that that mode is not practically useful for some
reason, or that no-one actually wants it, but its removal should be
discussed.  Also, the fact that we are losing that mode should be
explicit in the commit message.

Paul.
