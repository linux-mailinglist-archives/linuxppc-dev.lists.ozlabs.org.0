Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 078297DD296
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 17:47:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=jAk6krK1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKbfg29wvz3cVw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 03:47:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=jAk6krK1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::101; helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-101.mailbox.org (unknown [IPv6:2001:67c:2050:0:465::101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKbdm31MQz3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 03:47:04 +1100 (AEDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4SKbdQ0pBlz9sv4;
	Tue, 31 Oct 2023 17:46:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1698770810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yihRMXS9Xj/0hzDgGosoo7nHHoo+fzWfdjHSJ7McyWg=;
	b=jAk6krK1etp6CL4GPKbxQLQkldqsCwSaSKVB7vqAvz/nGxdbhdt9VC4BFGdFPS1/Kg00xU
	VUurTftgmufw7pt8ly2KqaFFgXmlkmQ3QBOBpGWLFfb3eeL+lOtx5X6NsX/fjpZQzAijHO
	vTDxu7S+BSIa1n1fVkQh7krQ12WGCnFsgXTPtu7+YVmqlMetNDKVXovoeH05WUazpSP366
	pIMGanE9/Hx1GCiVfjwtqUPFD8O1BWRlcwBxcb3jimsp/4LpTkIviUYTpLJKJxEpYFHbLW
	mp2DhqQeK20dGDKd5UaxjbRa51Xcw9GgRWK0eQ4ELljWQTPvDj2bDfDZEk4Qxg==
Date: Tue, 31 Oct 2023 17:46:46 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: Several kmemleak reports + "refcount_t: underflow;
 use-after-free" at boot when OF_UNITTEST + OF_OVERLAY is set (Kernel
 v6.6-rc6, PowerMac G5 11,2)
Message-ID: <20231031174646.3d4e1447@yea>
In-Reply-To: <CAL_Jsq+qcc7ERmGAywp=7oGT=XGoBsMO839_jtzxeNcCN-dS_A@mail.gmail.com>
References: <20231018233815.34a0417f@yea>
	<CAL_Jsq+qcc7ERmGAywp=7oGT=XGoBsMO839_jtzxeNcCN-dS_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: rdurhbjwzek9i9igtcoy6nd9d711ztgu
X-MBO-RS-ID: ebe9b306ae8c2338259
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 30 Oct 2023 11:26:48 -0500
Rob Herring <robh@kernel.org> wrote:

> The test tells you to expect a use-after-free...
> 
> > ---[ end trace <<int>> ]--- ### dt-test ### pass of_unittest_lifecycle():3209
> > ------------[ cut here ]------------
> > refcount_t: underflow; use-after-free.  
> 
> Then you get a use-after-free. Looks like it is working as designed.
> 
> I believe it's the same with kmemleak.
> 
> Note that running DT unittests also taints the kernel. That's because
> they are not meant to be run on a production system.
> 
> Rob

My bad, did not realize this is actually intended behaviour... Sorry for the noise!

Regards,
Erhard
