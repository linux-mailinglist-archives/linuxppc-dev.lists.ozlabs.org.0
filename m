Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCB65766F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 20:52:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ll0bW0ysGz3cGd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 04:42:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ascii.art.br header.i=@ascii.art.br header.a=rsa-sha256 header.s=dreamhost header.b=LEsc5vN3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ascii.art.br (client-ip=23.83.212.19; helo=black.elm.relay.mailchannels.net; envelope-from=tuliom@ascii.art.br; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ascii.art.br header.i=@ascii.art.br header.a=rsa-sha256 header.s=dreamhost header.b=LEsc5vN3;
	dkim-atps=neutral
Received: from black.elm.relay.mailchannels.net (black.elm.relay.mailchannels.net [23.83.212.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ll0Zk6dW6z2xmn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 04:42:05 +1000 (AEST)
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 736A4219EE;
	Fri, 15 Jul 2022 18:41:25 +0000 (UTC)
Received: from pdx1-sub0-mail-a246.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id BD4D52217A;
	Fri, 15 Jul 2022 18:41:24 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1657910484; a=rsa-sha256;
	cv=none;
	b=EBcjYoTM6hXatlaGUAIx1ry5imgOqZqXRotOUZ8+k7GGGXc22c7tb3H+YNCOmFl1KY0A1D
	Nh4CRPfB3ozqwJIGgj+PFaN1V966JSC3BE5H2jKimOcu4DHxbOhlUJHi/EdyCWDQs2V+pv
	DSF+D9u/T4ZR1tgcXW+AkrIdFU9W/mEfRa+nRIcJxueoZmTF7jC3cP0WbV/vOt5lQBNXI6
	hgN6kvbizRr4soUh7BasIIXUVv8+F3FXey4mofKgkN6MWK/CzYprc9ootqi6yPFDV5CQ/H
	mn0dbvc0Qp/xRrFU6AXrKVqTOi1tL5Nf5AZJyJSXH3UMOY/jkd2TRTK1bBWWjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1657910484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=ED6obg12CY1oAkiO3/rLi2wslJKUgZ6ZQENmt6aZyvY=;
	b=pGaquXJH4cqobBnYMY+hif9UfjeTGKjm0w+5HOj00j1Ia5hsQgrKi5OBBctlnK558Bs/MY
	zhVoLmnKlOCkCSpD8x3RvCqhs/fDmSi5/O3MtwrrELVsxuoaGSWKWDhvTIY+NHyxTQ1FpI
	HcKXZiildM8EAnUgXSlDoVxjpFLU70lPg81eY3A/7auwFivwwC475H9YKz7l/5bwGpNlEx
	KfbBDW2zEos8NigA9JsC1tCja4hJPOaXud1DLUphF63Jgwx+s8rx5Yw/aJN8HRB4nQjWRF
	mQFq19CoaqiJicjEA/XA3h9p2aui3LQ1Jar+St1Ro1jQvtZGNjaBjjh5Vgx2vg==
ARC-Authentication-Results: i=1;
	rspamd-674ffb986c-9gs6p;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=tuliom@ascii.art.br
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|tuliom@ascii.art.br
X-MailChannels-Auth-Id: dreamhost
X-Celery-Trail: 53bbd55f32c6593c_1657910485086_1369787043
X-MC-Loop-Signature: 1657910485086:3367164083
X-MC-Ingress-Time: 1657910485086
Received: from pdx1-sub0-mail-a246.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.115.18.78 (trex/6.7.1);
	Fri, 15 Jul 2022 18:41:25 +0000
Received: from ascii.art.br (unknown [138.121.65.190])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: tuliom@ascii.art.br)
	by pdx1-sub0-mail-a246.dreamhost.com (Postfix) with ESMTPSA id 4Ll0Yv6Z5qz2w;
	Fri, 15 Jul 2022 11:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ascii.art.br;
	s=dreamhost; t=1657910484;
	bh=ED6obg12CY1oAkiO3/rLi2wslJKUgZ6ZQENmt6aZyvY=;
	h=From:To:Cc:Subject:Date:Content-Type;
	b=LEsc5vN3XDSEoaPvE4MDXvrwmSayFGdFAlclshgVk6FvF3scIBgu3xMpSaVGGmb9M
	 eBCJdjuIzbPI8iHjFYAw+T9F63twowunE9qwbyg1Med+FI7Bp2DPMOYuxvfi5qLoE2
	 t4it0wGPCgF0k4Kr+FkkxTTSghvMCsyTmp4f0qnu6Wz0I2iO53wlmh6xeS0Hgswdnd
	 ATihGByNNPdxUAoF38c1qNFKy90GMmDk/DTbxmJ8nCq0cGc3OZOHsw2msjtPN0DPgW
	 owZkGuPQd7oLZV/bE8CpOgTrKDEZePUVFnLWiiw4MOmQkjfWx6usxJsUBorfAN+xju
	 dRCglLCv9JNgA==
From: Tulio Magno Quites Machado Filho <tuliom@ascii.art.br>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc: add documentation for HWCAPs
In-Reply-To: <20220715012636.165948-1-npiggin@gmail.com>
References: <20220715012636.165948-1-npiggin@gmail.com>
User-Agent: Notmuch/0.36 (http://notmuchmail.org) Emacs/27.2
 (x86_64-redhat-linux-gnu)
Date: Fri, 15 Jul 2022 15:41:20 -0300
Message-ID: <877d4euskv.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Florian Weimer <fweimer@redhat.com>, gcc@gcc.gnu.org, libc-alpha@sourceware.org, Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> +PPC_FEATURE_ARCH_2_05
> +    The processor supports the v2.05 userlevel architecture. Processors
> +    supporting later architectures also set this feature.

I don't think this bit is enabled when processors support later architectures.
In my tests, this behavior started only with v2.06, i.e. processors that
support v2.07 enable bit v2.06, but do not enable bit v2.05.

Otherwise, looks good to me.

-- 
Tulio Magno
