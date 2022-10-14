Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDBB5FF47E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 22:23:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpyWr25RDz3cd2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 07:23:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s2+KNT3k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s2+KNT3k;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpyVt33KXz3bkC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 07:22:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CFED761C2C;
	Fri, 14 Oct 2022 20:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1242EC433C1;
	Fri, 14 Oct 2022 20:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665778962;
	bh=exqzR5njiqLWWiXNN2w3BDWQrOSrTJ7Jr0VCCka02Gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s2+KNT3kBYTq4evrXrKk8gZeXApAQvzfRCfOxN/NYYQgoAsLD4anOCjdbdsaoJkxW
	 IPywtFQZccJMBUUidSwEaWw5SS85scKH7QKosyyjtb2AbJQ61mNVnYaiE3/1j59Wqh
	 HFG0TiTEFa3aRUx5Q7fU0fWh4Rsw9+y5n56DGPT57jH8FE5rFwQDZ3w5cUbdaIE3Tu
	 ySOmogr/NHMZXG1Zj5HpEmdWZqGLB751VSkC2dWbXB8I1EaRfjuSL/9Bf7/pyCBevQ
	 gXsGgjetUPjcNjnCnDxi6BxZ5yiJp1tqqZp6YU24l1s2fFZloe7so9W5n4Jdhqw1Ym
	 B/qf7zyQX5Skg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 8EA0C4062C; Fri, 14 Oct 2022 17:22:39 -0300 (-03)
Date: Fri, 14 Oct 2022 17:22:39 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] tools/perf/tests/shell: Update stat+csv_output.sh to
 include sanity check for topology
Message-ID: <Y0nFD7lo6Gdm1bgd@kernel.org>
References: <20221006155149.67205-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006155149.67205-1-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, Oct 06, 2022 at 09:21:48PM +0530, Athira Rajeev escreveu:
> Testcase stat+csv_output.sh fails in powerpc:
> 
> 	84: perf stat CSV output linter: FAILED!

Thanks, applied both patches.

- Arnaldo
