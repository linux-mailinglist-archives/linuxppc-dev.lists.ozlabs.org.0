Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BD1628962
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 20:31:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9zvK5dZYz3dvT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 06:31:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wx9Yw7yg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Wx9Yw7yg;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9ztP1qgNz3cGr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 06:30:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5AA91B811F9;
	Mon, 14 Nov 2022 19:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A398C433D7;
	Mon, 14 Nov 2022 19:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668454232;
	bh=maHMH+bLq35OjAq+PvxpUNIQADX1wrSuQglWGswHg2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wx9Yw7yg+j9s5tN12gCjhIO8zV19K7CQr22WcmyLvyg0T3SlR7pSaGmd66WgjvRFX
	 S/wv4QUnO+Ol/Z0B2Z8Ol2rQQ/fAqrvzsER8H/WZNcqd2js/x0e0PhslDwzh6jNQIb
	 yK4L6g3mcixdFVNAzOLv0jiQu91fqgRhpP6/XtgoT+GAvFQBwU+LhyHtFkXfMo26pw
	 opUZ0/elTAVyomglsxJ/t4667bnQe/3sbBcSBzrHKPG7CNJIz68oFBbd1+5HFkb39q
	 lMheYYXrgB02iKX4BuejLK/HiH13sWGqJ5VB8PjnZk3tqJvUK7s5UBKWmn6fOzMwg4
	 lFcFhXMONvSrQ==
Date: Mon, 14 Nov 2022 11:30:29 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] scripts/faddr2line: Fix regression in name resolution on
 ppc64le
Message-ID: <20221114193029.aybkzubzxynqcms6@treble>
References: <20220927075211.897152-1-srikar@linux.vnet.ibm.com>
 <YzLcPZYTWXfrU+K4@quatroqueijos.cascardo.eti.br>
 <1664532445.32klbp0ljq.naveen@linux.ibm.com>
 <0f4decac-1349-3ceb-246c-e648364d797f@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0f4decac-1349-3ceb-246c-e648364d797f@csgroup.eu>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 14, 2022 at 12:21:33PM +0000, Christophe Leroy wrote:
> Gentle ping ... Can this fix be merged ?

Thanks for the reminder.  Looks good, I'll go ahead and take it.

-- 
Josh
