Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EAB518638
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 16:11:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kt22V03mFz3blK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 00:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm1 header.b=JS9/m4h3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Jgq2ay0m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm1 header.b=JS9/m4h3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Jgq2ay0m; 
 dkim-atps=neutral
X-Greylist: delayed 1506 seconds by postgrey-1.36 at boromir;
 Wed, 04 May 2022 00:11:08 AEST
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kt21m481Vz308G
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 00:11:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id ED7563200A6C;
 Tue,  3 May 2022 09:45:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 03 May 2022 09:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1651585554; x=1651671954; bh=GgYcomwsds
 RrYxxul1oPdKhHbYJJh/adytBDmH6b6r8=; b=JS9/m4h3R1GYfScDhMAw/fjb8N
 evLe5K1ZVWBrDOLjnFibwjSn1w+4rkVkV97FngyaYV9Qohf1l9CvNkHH+RvdfOW8
 p9ExhEmiCc0tlV4RZibMnfmpPxqRQWdrhnuWUyncvBN9Dr2M0x0aojRPJJRfJd8b
 2j5MDoR/34VF1d9abBXaXpcAkXUsGOq+QBSBqBwBSyggbk6R2I6XCZ4VFFycTAgY
 G6H/FwJREeXnu3Gdt60LM9ZOL0qy8t6Jo5lShjOoUpbgy9IoXyJG7rQUZS/n+xaR
 FNst6EtYrfcJSc0Kht3H8sOSG9UHDwGi3TuOFYoPO8fOaxJyAPCuOkar4o5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651585554; x=
 1651671954; bh=GgYcomwsdsRrYxxul1oPdKhHbYJJh/adytBDmH6b6r8=; b=J
 gq2ay0mVAHxRw5NXHg30eRU9ODiujH3CtnYmYNgAcJjuxy+2frsppmqm2PV+pN6E
 5efnwAOT1nsYabx7RHlTSjIhLom843UQ7JAE7YP7FDe9rxYRd0nQmDy6YZGzKiHH
 l7sHhj5d8lvkDCwr7jfq7KAwjRG+JTIXKfGR0y8eX0O58tHOwQ1oVzKKPq6jbJZa
 62Y4uTU7I0N/jvJL5MGm9hXYUi2HSEETROtBoy9JBka31dYhiCxapSqScTQyWcSL
 uDxVhCW3z5sWaLpGYXlQhltIsRdmm8StubaX4qJkYl7XNhtgGPjNxylyeuK/wMfc
 9jlbRcdvjv15WBLy02XAQ==
X-ME-Sender: <xms:ETJxYutCNK7enlPNtDmjLXka__V9_Kgt019cpYWc7I5SPhIR7qCL1w>
 <xme:ETJxYje8-eKatvcXSlhq1nbMGQ_JOGDyc2fD-mqHO2JzKYeebnw9AcxDjl7kIAQ6G
 V41gdWZ6Loztw>
X-ME-Received: <xmr:ETJxYpzlgi8qmdTqjqCC5gBwcblv_rrOCqGYRBr4BV_4swWQt_-8p5S9M9i4BQqpXK1-9s46aXOridyxaEAsUVbdMssI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeegheeuhe
 fgtdeluddtleekfeegjeetgeeikeehfeduieffvddufeefleevtddtvdenucffohhmrghi
 nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:ETJxYpNXuQ3T7Pec7i58mlCZcl9DXHo6BhPgcwXC8zYL7F8rYeGsNQ>
 <xmx:ETJxYu8fYM4dpN7td1VUCvhlK2HZ-bbizbMR3NlQr4Bw78yr91pAFg>
 <xmx:ETJxYhXv2G74jC9blTWurMBvB65n1qMgxgSB_wr586xeFGkeXQ9hdA>
 <xmx:EjJxYs8o2pl9535C46LXdfb4oiKj4oeNIRdUjliQ98xIZWJHodN4Iw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 09:45:53 -0400 (EDT)
Date: Tue, 3 May 2022 15:45:52 +0200
From: Greg KH <greg@kroah.com>
To: Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH for v5.15] perf symbol: Remove arch__symbols__fixup_end()
Message-ID: <YnEyEN7B1lBtECMg@kroah.com>
References: <20220503003736.711789-1-namhyung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503003736.711789-1-namhyung@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Song Liu <songliubraving@fb.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-s390@vger.kernel.org, Michael Petlan <mpetlan@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, John Garry <john.garry@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@linaro.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 02, 2022 at 05:37:36PM -0700, Namhyung Kim wrote:
> Now the generic code can handle kallsyms fixup properly so no need to
> keep the arch-functions anymore.
> 
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> Acked-by: Ian Rogers <irogers@google.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Jiri Olsa <jolsa@kernel.org>
> Cc: John Garry <john.garry@huawei.com>
> Cc: Leo Yan <leo.yan@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Michael Petlan <mpetlan@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Song Liu <songliubraving@fb.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-s390@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Link: https://lore.kernel.org/r/20220416004048.1514900-4-namhyung@kernel.org
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> ---
> The original commit id is a5d20d42a2f2dc2b2f9e9361912062732414090d

Both now queued up, thanks.

greg k-h
